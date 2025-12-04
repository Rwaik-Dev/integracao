Class trans.BS.ProcessaPedido Extends EnsLib.SOAP.Service
{

Parameter ADAPTER = "EnsLib.SOAP.InboundAdapter";

/// Name of the WebService
Parameter SERVICENAME = "ProcessaPedidos";

/// TODO: Change this to actual network address
/// URL for invoking the WebService
Parameter LOCATION = "http://localhost:52773/csp/integracao/services";

/// TODO: Change this to actual SOAP namespace
/// SOAP namespace for the WebService
Parameter NAMESPACE = "http://tempuri.org";

Method ProcessaPedido(pCodigoPedido As %String) As trans.VO.ConfirmarPedido [ WebMethod ]
{

	Set tSC=..ProcessInput(pCodigoPedido,.tResponse,"ProcessaPedido")
	If $$$ISERR(tSC) Do ..ReturnMethodStatusFault(tSC)

	#Dim tResponse AS trans.BP.ProcessaTransporte.Response

	SET vResp = ##class(trans.VO.ConfirmarPedido).%New()
	SET vResp.CodigoTransp = tResponse.CodigoTransp
	SET vResp.DataPrevisaoEntrega = $ZDATE(tResponse.DataPrevisaoEntrega, 4)
	SET vResp.Status = tResponse.Status

	Quit vResp
}

Method OnProcessInput(pInput As %RegisteredObject, Output pOutput As %RegisteredObject, ByRef pHint As %String) As %Status
{

	SET status = $$$OK
	SET pReqPedido = ##class(trans.BP.ProcessaTransporte.Request).%New()
	SET pReqPedido.CodigoPedido = pInput

	SET status = ..SendRequestSync("ProcessaTransporte", pReqPedido, .pOutput)
}

}
