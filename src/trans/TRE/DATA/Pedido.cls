Class trans.TRE.DATA.Pedido Extends %Persistent
{

Property CodigoPedido As %String(MAXLEN = "") [ Required, SqlColumnNumber = 2 ];

Property DataPedido As %String(MAXLEN = "") [ Required, SqlColumnNumber = 3 ];

Property CodigoCliente As %String(MAXLEN = "") [ Required, SqlColumnNumber = 4 ];

Property ValorPedido As %String(MAXLEN = "") [ Required, SqlColumnNumber = 5 ];

Property PesoKG As %String(MAXLEN = "") [ Required, SqlColumnNumber = 6 ];

Property Volumes As %String(MAXLEN = "") [ Required, SqlColumnNumber = 7 ];

Property CodigoTransportadora As %String(MAXLEN = "") [ Required, SqlColumnNumber = 8 ];

Property DataPrevisaoEntrega As %String(MAXLEN = "") [ Required, SqlColumnNumber = 9 ];

Storage Default
{
<Data name="PedidoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CodigoPedido</Value>
</Value>
<Value name="3">
<Value>DataPedido</Value>
</Value>
<Value name="4">
<Value>CodigoCliente</Value>
</Value>
<Value name="5">
<Value>ValorPedido</Value>
</Value>
<Value name="6">
<Value>PesoKG</Value>
</Value>
<Value name="7">
<Value>Volumes</Value>
</Value>
<Value name="8">
<Value>CodigoTransportadora</Value>
</Value>
<Value name="9">
<Value>DataPrevisaoEntrega</Value>
</Value>
</Data>
<DataLocation>^trans.TRE.DATA.PedidoD</DataLocation>
<DefaultData>PedidoDefaultData</DefaultData>
<IdLocation>^trans.TRE.DATA.PedidoD</IdLocation>
<IndexLocation>^trans.TRE.DATA.PedidoI</IndexLocation>
<StreamLocation>^trans.TRE.DATA.PedidoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
