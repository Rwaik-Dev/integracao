Class trans.VO.ConfirmarPedido Extends (%SerialObject, %XML.Adaptor)
{

Property Status As %String;

Property CodigoTransp As %String;

Property DataPrevisaoEntrega As %String;

Storage Default
{
<Data name="ConfirmarPedidoState">
<Value name="1">
<Value>Status</Value>
</Value>
<Value name="2">
<Value>CodigoTransp</Value>
</Value>
<Value name="3">
<Value>DataPrevisaoEntrega</Value>
</Value>
</Data>
<State>ConfirmarPedidoState</State>
<StreamLocation>^trans.VO.ConfirmarPedidoS</StreamLocation>
<Type>%Storage.Serial</Type>
}

}
