Class trans.BO.DetalhesPedido.Cliente.Request Extends Ens.Request
{

Property CodigoCliente As %String(MAXLEN = "");

Property NomeEmpresa As %String(MAXLEN = "");

Property NomeContato As %String(MAXLEN = "");

Property Endereco As %String(MAXLEN = "");

Property CEP As %String(MAXLEN = "");

Property Cidade As %String(MAXLEN = "");

Property Estado As %String(MAXLEN = "");

Property EnderecoEmail As %String(MAXLEN = "");

Storage Default
{
<Data name="RequestDefaultData">
<Subscript>"Request"</Subscript>
<Value name="1">
<Value>CodigoCliente</Value>
</Value>
<Value name="2">
<Value>NomeEmpresa</Value>
</Value>
<Value name="3">
<Value>NomeContato</Value>
</Value>
<Value name="4">
<Value>Endereco</Value>
</Value>
<Value name="5">
<Value>CEP</Value>
</Value>
<Value name="6">
<Value>Cidade</Value>
</Value>
<Value name="7">
<Value>Estado</Value>
</Value>
<Value name="8">
<Value>EnderecoEmail</Value>
</Value>
</Data>
<DefaultData>RequestDefaultData</DefaultData>
<Type>%Storage.Persistent</Type>
}

}
