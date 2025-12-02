Class trans.BO.RecupDetalhesPedidos.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

Method RecupDetalhesPedidos(pRequest As trans.BO.RecupDetalhesPedidos.Request, Output pResponse As trans.BO.RecupDetalhesPedidos.Response) As %Status
{
    SET tSC = $$$OK
    SET pResponse = ##class(trans.BO.RecupDetalhesPedidos.Response).%New()

    Try {
        Set vQuery = "SELECT T1.* , T2.* FROM trans_TRE_DATA.Pedido T1, trans_TRE_DATA.Cliente T2 WHERE T1.CodigoCliente = T2.CodigoCliente AND T1.CodigoPedido = ?"
        
            $$$TRACE("Query Gerada: "_vQuery)
            Set vStatement = ##class(%SQL.Statement).%New()

            Set vStatus = vStatement.%Prepare(vQuery)
            If $$$ISERR(vStatus) { Return vStatus }

            Set vResultSet = vStatement.%Execute(pRequest.CodigoPedido) 

            If vResultSet.%Next() {
                Set pResponse.Endereco = vResultSet.%Get("Endereco")
                Set pResponse.CEP = vResultSet.%Get("CEP")
                Set pResponse.Cidade = vResultSet.%Get("Cidade")
                Set pResponse.Estado = vResultSet.%Get("Estado")
                Set pResponse.Email = vResultSet.%Get("EnderecoEmail")
                Set pResponse.NomeEmpresa = vResultSet.%Get("NomeEmpresa")
                Set pResponse.NomeContato = vResultSet.%Get("NomeContato")
                Set pResponse.PesoKg = vResultSet.%Get("PesoKg")
                Set pResponse.Volumes = vResultSet.%Get("Volumes")
            } Else {
                Set tSC = $$$ERROR("Pedido nao encontrado.")
            }
        }
    Catch ex {
        Set tSC=ex.AsStatus()
    }

    RETURN tSC
}

XData MessageMap
{
<MapItens>
     <MapItem  MessageType="trans.BO.RecupDetalhesPedidos.Request">
        <Method>RecupDetalhesPedidos</Method>
    </MapItem>
</MapItens>
}

}
