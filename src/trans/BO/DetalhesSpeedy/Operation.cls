Class trans.BO.DetalhesSpeedy.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method VerificaDestinoSpeedy(pRequest As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request, Output pResponse As trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response) As %Status
{
    Set vStatus = $$$OK
    SET pResponse = ##class(trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response).%New()

    Try {
        SET vQuery = "SELECT 1 FROM trans_TRE_DATA.Destino WHERE ? BETWEEN CEPInicial AND CEPFinal"
        SET vStatement = ##class(%SQL.Statement).%New()

        SET vStatus = vStatement.%Prepare(vQuery)
        If $$$ISERR(vStatus) { Return vStatus }

        SET vResultSet = vStatement.%Execute(pRequest.Cep5n)

        SET pResponse.AtendidoSpeedy = vResultSet.%Next()

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    
    Return vStatus
}

Method RecupPrazoEntrega(pRequest As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request, Output pResponse As trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response) As %Status
{
    Set vStatus = $$$OK
    SET pResponse = ##class(trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response).%New()

    Try {
        SET vQuery = "SELECT PrazoEntregaDias FROM trans_TRE_DATA.Destino WHERE ? BETWEEN CEPInicial AND CEPFinal"
        SET vStatement = ##class(%SQL.Statement).%New()

        SET vStatus = vStatement.%Prepare(vQuery)
        If $$$ISERR(vStatus) { Return vStatus }

        SET vResultSet = vStatement.%Execute(pRequest.Cep5n)

        SET pResponse.PrazoEntregaDias = -1

        IF vResultSet.%Next(){
            SET pResponse.PrazoEntregaDias = vResultSet.%Get("PrazoEntregaDias")
        }

    }
    Catch ex {
        Set tSC=ex.AsStatus()
    }
    
    Return vStatus
}

XData MessageMap
{
<MapItens>
     <MapItem  MessageType="trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request">
        <Method>VerificaDestinoSpeedy</Method>
    </MapItem>
    <MapItem  MessageType="trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request">
        <Method>RecupPrazoEntrega</Method>
    </MapItem>
</MapItens>
}

}
