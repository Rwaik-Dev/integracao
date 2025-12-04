Class trans.BP.ProcessaTransporteCustom.ProcessCustom Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As trans.BP.ProcessaTransporte.Request, Output pResponse As trans.BP.ProcessaTransporte.Response) As %Status
{

    Set status = $$$OK
    
    SET pResponse = ##class(trans.BP.ProcessaTransporte.Response).%New()

    Try {
        SET callRequest = ##class(trans.BO.RecupDetalhesPedidos.Request).%New()
        SET callRequest.CodigoPedido = pRequest.CodigoPedido

        SET callResponse = ##class(trans.BO.RecupDetalhesPedidos.Response).%New()
        SET status = ..ChamaDetalhesPedido(callRequest, .callResponse)
        SET Cep5n = $PIECE(callResponse.CEP, "-", 1)
        SET PesoKG = $REPLACE(callResponse.PesoKg, ",", ".")

        IF ( Cep5n '= ""){

            SET pResponse.Status = 1
            //Representa Atendido Speedy
            SET callrequestSpeedy = ##class(trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request).%New()
            SET callresponseSpeedy = ##class(trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response).%New()
            
            SET callrequestSpeedy.Cep5n = Cep5n
            SET status = ..ChamaVerificaDestinoSpeedy(callrequestSpeedy, .callresponseSpeedy)
            SET AtendidoSpeedy = callresponseSpeedy.AtendidoSpeedy
            
            //Representa Recupera Prazo
            SET callrequestPrazo = ##class(trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request).%New()
            SET callresponsePrazo = ##class(trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response).%New()
            SET callrequestPrazo.Cep5n = Cep5n
            SET status = ..ChamaRecupPrazoEntrega(callrequestPrazo, .callresponsePrazo)
            
            SET PrazoEntregaDias = callresponsePrazo.PrazoEntregaDias

            IF (AtendidoSpeedy) && (PesoKG <= 50){
                //Entrega Speedy
                SET pResponse.CodigoTransp = 1
                SET pResponse.DataPrevisaoEntrega = + $HOROLOG + PrazoEntregaDias
            }
            ELSE {
                //Entrega Flex
                SET pResponse.CodigoTransp = 2
                SET pResponse.DataPrevisaoEntrega = + $HOROLOG + 5
            }

            }
            ELSE {
                SET pResponse.Status = 0
            }
   }
    Catch ex {
        Set status=ex.AsStatus()
    }
    
    Return status
}

Method ChamaDetalhesPedido(pRequest As trans.BO.RecupDetalhesPedidos.Request, Output pResponse As trans.BO.RecupDetalhesPedidos.Response) As %Status
{
    Set status = $$$OK
    SET status = ..SendRequestSync("Detalhe Pedidos BO", pRequest, .pResponse)
    
    return status
}

Method ChamaVerificaDestinoSpeedy(pRequest As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request, Output pResponse As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response) As %Status
{
    set status = $$$OK
    SET status = ..SendRequestSync("DetalhesSpeedy BO", pRequest, .pResponse)

    return status
}

Method ChamaRecupPrazoEntrega(pRequest As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request, Output pResponse As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response) As %Status
{
    Set sc = $$$OK
    SET sc = ..SendRequestSync("DetalhesSpeedy BO", pRequest, .pResponse)

    Return sc
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
