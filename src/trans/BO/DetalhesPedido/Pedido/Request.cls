Class trans.BO.DetalhesPedido.Pedido.Request Extends Ens.Request
{

Property CodigoPedido As %String(MAXLEN = "");

Property DataPedido As %String(MAXLEN = "");

Property CodigoCliente As %String(MAXLEN = "");

Property ValorPedido As %String(MAXLEN = "");

Property PesoKG As %String(MAXLEN = "");

Property Volumes As %String(MAXLEN = "");

Property CodigoTransportadora As %String(MAXLEN = "");

Property DataPrevisaoEntrega As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CodigoPedido</Value>
</Value>
<Value name="2">
<Value>DataPedido</Value>
</Value>
<Value name="3">
<Value>CodigoCliente</Value>
</Value>
<Value name="4">
<Value>ValorPedido</Value>
</Value>
<Value name="5">
<Value>PesoKG</Value>
</Value>
<Value name="6">
<Value>Volumes</Value>
</Value>
<Value name="7">
<Value>CodigoTransportadora</Value>
</Value>
<Value name="8">
<Value>DataPrevisaoEntrega</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
