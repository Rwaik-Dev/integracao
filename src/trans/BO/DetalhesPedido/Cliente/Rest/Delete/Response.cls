Class trans.BO.DetalhesPedido.Cliente.Rest.Delete.Response Extends Ens.Request
{

Property Status As %Numeric;

Property Contents As %String(MAXLEN = 10971520);

Storage Default
{
<Data name="ResponseDefaultData">
<Subscript>"Response"</Subscript>
<Value name="1">
<Value>Status</Value>
</Value>
<Value name="2">
<Value>Contents</Value>
</Value>
</Data>
<DefaultData>ResponseDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
