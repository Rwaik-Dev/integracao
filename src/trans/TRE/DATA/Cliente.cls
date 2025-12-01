Class trans.TRE.DATA.Cliente Extends %Persistent
{

Property CodigoCliente As %String(MAXLEN = "") [ Required, SqlColumnNumber = 2 ];

Property NomeEmpresa As %String(MAXLEN = "") [ Required, SqlColumnNumber = 3 ];

Property NomeContato As %String(MAXLEN = "") [ Required, SqlColumnNumber = 4 ];

Property Endereco As %String(MAXLEN = "") [ Required, SqlColumnNumber = 5 ];

Property CEP As %String(MAXLEN = "") [ Required, SqlColumnNumber = 6 ];

Property Cidade As %String(MAXLEN = "") [ Required, SqlColumnNumber = 7 ];

Property Estado As %String(MAXLEN = "") [ Required, SqlColumnNumber = 8 ];

Property EnderecoEmail As %String(MAXLEN = "") [ Required, SqlColumnNumber = 9 ];

Storage Default
{
<Data name="ClienteDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CodigoCliente</Value>
</Value>
<Value name="3">
<Value>NomeEmpresa</Value>
</Value>
<Value name="4">
<Value>NomeContato</Value>
</Value>
<Value name="5">
<Value>Endereco</Value>
</Value>
<Value name="6">
<Value>CEP</Value>
</Value>
<Value name="7">
<Value>Cidade</Value>
</Value>
<Value name="8">
<Value>Estado</Value>
</Value>
<Value name="9">
<Value>EnderecoEmail</Value>
</Value>
</Data>
<DataLocation>^trans.TRE.DATA.ClienteD</DataLocation>
<DefaultData>ClienteDefaultData</DefaultData>
<IdLocation>^trans.TRE.DATA.ClienteD</IdLocation>
<IndexLocation>^trans.TRE.DATA.ClienteI</IndexLocation>
<StreamLocation>^trans.TRE.DATA.ClienteS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
