/// 
Class trans.BP.ProcessaTransporte.Process Extends Ens.BusinessProcessBPL
{

/// BPL Definition
XData BPL [ XMLNamespace = "http://www.intersystems.com/bpl" ]
{
<process language='objectscript' request='trans.BP.ProcessaTransporte.Request' response='trans.BP.ProcessaTransporte.Response' height='2400' width='2000' >
<context>
<property name='Cep5n' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
<property name='PrazoEntregaDias' type='%Integer' instantiate='0' deletewithcontext='0' />
<property name='AtendidoSpeedy' type='%Boolean' instantiate='0' deletewithcontext='0' />
<property name='PesoKg' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<sequence xend='200' yend='2150' >
<call name='ChamaDetalhesPedido' target='Detalhe Pedidos BO' async='1' xpos='200' ypos='250' >
<request type='trans.BO.RecupDetalhesPedidos.Request' >
<assign property="callrequest.CodigoPedido" value="request.CodigoPedido" action="set" />
</request>
<response type='trans.BO.RecupDetalhesPedidos.Response' >
<assign property="context.Cep5n" value="callresponse.CEP" action="set" />
<assign property="context.PesoKg" value="callresponse.PesoKg" action="set" />
</response>
</call>
<sync name='AguardaDetalhesPedido' calls='ChamaDetalhesPedido' type='all' xpos='200' ypos='350' />
<alert name='cep5n' value='context.Cep5n' xpos='200' ypos='450' />
<if name='Pedido Valido' condition='context.Cep5n &apos;= ""' xpos='200' ypos='550' xend='200' yend='2050' >
<true>
<assign name="DefineStatusPedidoValido" property="response.Status" value="1" action="set" xpos='470' ypos='700' />
<assign name="DefineCep5n" property="context.Cep5n" value="$PIECE(context.Cep5n,&quot;-&quot;,1)" action="set" xpos='470' ypos='800' />
<alert value='context.Cep5n' xpos='470' ypos='900' />
<call name='ChamaVerificaDestinoSpeedy' target='DetalhesSpeedy BO' async='0' xpos='470' ypos='1000' >
<request type='trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Request' >
<assign property="callrequest.Cep5n" value="context.Cep5n" action="set" />
</request>
<response type='trans.BO.DetalhesSpeedy.VerificaDestinoSpeedy.Response' >
<assign property="response.Status" value="callresponse.AtendidoSpeedy" action="set" />
<assign property="context.AtendidoSpeedy" value="callresponse.AtendidoSpeedy" action="set" />
</response>
</call>
<call name='ChamaRecupPrazoEntrega' target='DetalhesSpeedy BO' async='0' xpos='470' ypos='1100' >
<request type='trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Request' >
<assign property="callrequest.Cep5n" value="context.Cep5n" action="set" />
</request>
<response type='trans.BO.DetalhesSpeedy.RecupPrazoEntrega.Response' >
<assign property="context.PrazoEntregaDias" value="callresponse.PrazoEntregaDias" action="set" />
</response>
</call>
<sync name='AguardaDetalhesSpeedy' calls='ChamaVerificaDestinoSpeedy,ChamaRecupPrazoEntrega' type='all' xpos='470' ypos='1200' />
<if name='AceitavelSpeedy?' condition='(response.Status = 1) &amp; (context.PesoKg&apos;&gt;50)' xpos='470' ypos='1300' xend='470' yend='1950' >
<true>
<assign name="AtribuiSpeedy" property="response.CodigoTransp" value="1" action="set" xpos='470' ypos='1450' />
<alert value='response.CodigoTransp' xpos='470' ypos='1550' />
<assign name="CalculaAtribuiDataEntrega" property="response.DataPrevisaoEntrega" value="$PIECE($HOROLOG,&quot;,&quot;,1) + context.PrazoEntregaDias" action="set" xpos='470' ypos='1650' />
<alert value='$ZDATE(response.DataPrevisaoEntrega)' xpos='483' ypos='1807' />
</true>
<false>
<alert name='Analisa Erro' value='"Não aceitavel pela transportadora Speedy"' xpos='740' ypos='1450' />
<assign name="AtribuiFlex" property="response.CodigoTransp" value="2" action="set" xpos='740' ypos='1550' />
<alert value='response.CodigoTransp' xpos='740' ypos='1650' />
<assign name="CalculaAtribuiDataEntrega" property="response.DataPrevisaoEntrega" value="$PIECE($HOROLOG,&quot;,&quot;,1) + 5" action="set" xpos='740' ypos='1750' />
<alert value='$ZDATE(response.DataPrevisaoEntrega,4)' xpos='740' ypos='1850' />
</false>
</if>
</true>
<false>
<assign name="DefineStatusPedidoInvalido" property="response.Status" value="0" action="set" xpos='200' ypos='700' />
</false>
</if>
</sequence>
</process>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
