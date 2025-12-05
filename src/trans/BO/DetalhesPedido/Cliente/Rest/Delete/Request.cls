Class trans.BO.DetalhesPedido.Cliente.Rest.Delete.Request Extends Ens.Request
{

Property Metodo As %String;

Property DATA As %String(MAXLEN = 10971520);

Parameter RESPONSECLASSNAME = "trans.BO.DetalhesPedido.Cliente.Rest.Delete.Response";

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>Metodo</Value>
</Value>
<Value name="2">
<Value>DATA</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
