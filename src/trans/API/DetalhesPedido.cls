Class trans.API.DetalhesPedido Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CHARSET = "utf-8";

Parameter CONTENTTYPEJSON As STRING = "application/json";

XData UrlMap
{
<Routes>
  <!-- <Route Url="" Method="" Call=""/> -->
  <Route Url="/consulta" Method="GET" Call="GetPedido"/>
</Routes>
}

Method GetPedido() As %Status
{
    SET tSC = $$$OK

    RETURN tSC
}

ClassMethod OnHandleCorsRequest(pUrl As %String) As %Status
{
  Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Origin","*") 
  Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Credentials","true")
  Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Methods","GET, PUT, POST, DELETE, OPTIONS")
  Do ..SetResponseHeaderIfEmpty("Access-Control-Allow-Headers","Content-Type, Authorization, Accept-Language, X-Requested-With")
  Quit ..HandleDefaultCorsRequest(pUrl)
}

ClassMethod SetResponseHeaders() [ Private ]
{
    #Dim %response As %CSP.Response  = %response
    Set %response.CharSet     = "utf-8"
    Set %response.ContentType = "applicaton/json"
}

}
