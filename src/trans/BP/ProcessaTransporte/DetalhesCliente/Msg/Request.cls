Class trans.BP.ProcessaTransporte.DetalhesCliente.Msg.Request Extends Ens.Request
{

Property Metodo As %String;

Property DATA As %String(MAXLEN = "");

Property JSON As %GlobalCharacterStream;

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
<Value name="3">
<Value>JSON</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
