Class trans.TRE.DATA.Destino Extends %Persistent
{

Property CodigoDestino As %String(MAXLEN = "") [ Required, SqlColumnNumber = 2 ];

Property CEPInicial As %Integer [ Required, SqlColumnNumber = 3 ];

Property CEPFinal As %Integer [ Required, SqlColumnNumber = 4 ];

Property PrazoEntregaDias As %String(MAXLEN = "") [ Required, SqlColumnNumber = 5 ];

Storage Default
{
<Data name="DestinoDefaultData">
<Value name="1">
<Value>%%CLASSNAME</Value>
</Value>
<Value name="2">
<Value>CodigoDestino</Value>
</Value>
<Value name="3">
<Value>CEPInicial</Value>
</Value>
<Value name="4">
<Value>CEPFinal</Value>
</Value>
<Value name="5">
<Value>PrazoEntregaDias</Value>
</Value>
</Data>
<DataLocation>^trans.TRE.DATA.DestinoD</DataLocation>
<DefaultData>DestinoDefaultData</DefaultData>
<IdLocation>^trans.TRE.DATA.DestinoD</IdLocation>
<IndexLocation>^trans.TRE.DATA.DestinoI</IndexLocation>
<StreamLocation>^trans.TRE.DATA.DestinoS</StreamLocation>
<Type>%Storage.Persistent</Type>
}

}
