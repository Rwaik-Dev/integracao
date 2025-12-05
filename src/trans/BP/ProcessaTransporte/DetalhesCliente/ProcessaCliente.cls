Class trans.BP.ProcessaTransporte.DetalhesCliente.ProcessaCliente Extends Ens.BusinessProcess
{

Method OnRequest(pRequest As trans.BP.ProcessaTransporte.DetalhesCliente.Msg.Request, Output pResponse As Ens.Response) As %Status
{
    SET tSC = $System.Status.OK()

    IF (pRequest.Metodo = "Delete"){
        SET reqDelete = ##class(trans.BO.DetalhesPedido.Cliente.Rest.Delete.Request).%New()
        SET reqDelete.DATA = pRequest.DATA

        #Dim tRespDelete AS trans.BO.DetalhesPedido.Cliente.Rest.Delete.Response
        
        SET status = ..SendRequestSync("Pedidos BO", reqDelete, .tRespDelete)

        SET pResponse = tRespDelete
        
    }

    return tSC
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
