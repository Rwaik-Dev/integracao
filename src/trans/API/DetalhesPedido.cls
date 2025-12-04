Class trans.API.DetalhesPedido Extends %CSP.REST
{

Parameter HandleCorsRequest = 1;

Parameter CHARSET = "utf-8";

Parameter CONTENTTYPEJSON As STRING = "application/json";

XData UrlMap
{
<Routes>
  <Route Url="/consulta" Method="GET" Call="GetPedido"/>
</Routes>
}

Method GetPedido() As %Status
{
    SET tSC = $$$OK

    RETURN tSC
}

}
