Class trans.BS.DetalhesCliente Extends Ens.BusinessService
{

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pMethod As %String) As %Status
{
        SET tSC = $System.Status.OK()
        SET pRequest = ##class(trans.BP.ProcessaTransporte.DetalhesCliente.Msg.Request).%New()
        
        #Dim tResponse AS trans.BP.ProcessaTransporte.DetalhesCliente.Msg.Response

        IF (pMethod = "DeleteCliente"){
            SET pRequest.Metodo = "Delete"
            SET pRequest.DATA = pInput

            
        }
        SET tSC = ..SendRequestSync("ProcessCliente", pRequest, .tResponse)
        SET pOutput = tResponse

        Quit tSC
}

}
