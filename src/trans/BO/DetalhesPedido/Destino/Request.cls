Class trans.BO.DetalhesPedido.Destino.Request Extends Ens.Request
{

Property CodigoDestino As %String(MAXLEN = "");

Property CEPInicial As %Integer;

Property CEPFinal As %Integer;

Property PrazoEntregaDias As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CodigoDestino</Value>
</Value>
<Value name="2">
<Value>CEPInicial</Value>
</Value>
<Value name="3">
<Value>CEPFinal</Value>
</Value>
<Value name="4">
<Value>PrazoEntregaDias</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
