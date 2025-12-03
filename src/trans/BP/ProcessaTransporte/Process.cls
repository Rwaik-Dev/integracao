/// 
Class trans.BP.ProcessaTransporte.Process Extends Ens.BusinessProcessBPL
{

/// This BPLError block indicates that a BPL Diagram 
/// containing errors was saved.
/// To correct this class:
/// * Open it using the Studio BPL Editor,
/// * Correct the errors, and,
/// * Save the diagram.
/// Do not edit the contents of the BPLError block
/// or you may lose your diagram.
XData BPLError
{
<diagram Name="trans.BP.ProcessaTransporte.Process" Width="2000" Height="2000" Layout="automatic" Language="objectscript" Request="trans.BP.ProcessaTransporte.Request" Response="trans.BP.ProcessaTransporte.Response" LastModified="" Version="" Includes="" ShowAnnotation="0">
<context>
<property name='Cep5n' type='%String' instantiate='0' deletewithcontext='0' >
<parameters>
<parameter name='MAXLEN'  value='50' />
</parameters>
</property>
</context>
<shape _index="0" _Type="start" Name="" xPos="200" yPos="150" />
<shape _index="1" _Type="call" Name="ChamaDetalhesPedido" xPos="200" yPos="250" Async="1" Target="Detalhe Pedidos BO" Timeout="" >
<request type='trans.BO.RecupDetalhesPedidos.Request' >
<assign property="callrequest.CodigoPedido" value="request.CodigoPedido" action="set" />
</request>
<response type='trans.BO.RecupDetalhesPedidos.Response' >
<assign property="context.Cep5n" value="callresponse.CEP" action="set" />
</response>
</shape>
<shape _index="2" _Type="sync" Name="AguardaDetalhesPedido" xPos="200" yPos="350" AllowResync="0" Calls="ChamaDetalhesPedido" Timeout="" Type="all" />
<shape _index="3" _Type="alert" Name="cep5n" xPos="200" yPos="450" Value="context.Cep5n" />
<shape _index="4" _Type="end" Name="" xPos="200" yPos="1000" />
<shape _index="5" _Type="if" Name="Pedido Valido" xPos="200" yPos="550" Condition="context.Cep5n '= &quot;&quot;" />
<shape _index="6" _Type="join" Name="" xPos="200" yPos="900" />
<shape _index="7" _Type="assign" Name="" xPos="470" yPos="700" Action="" Key="" Property="" Value="" />
<shape _index="8" _Type="assign" Name="" xPos="470" yPos="800" Action="" Key="" Property="" Value="" />
<shape _index="9" _Type="assign" Name="" xPos="200" yPos="700" Action="" Key="" Property="" Value="" />
<connection _Type="connector" Name="" from="0" to="1"/>
<connection _Type="connector" Name="" from="1" to="2"/>
<connection _Type="connector" Name="" from="2" to="3"/>
<connection _Type="connector" Name="" from="3" to="5"/>
<connection _Type="connector" Name="false" from="5" to="9" ConnectType="branch"/>
<connection _Type="connector" Name="true" from="5" to="7" ConnectType="branch"/>
<connection _Type="connector" Name="" from="6" to="4"/>
<connection _Type="connector" Name="" from="7" to="8"/>
<connection _Type="connector" Name="" from="8" to="6"/>
<connection _Type="connector" Name="" from="9" to="6"/>
</diagram>
}

Storage Default
{
<Type>%Storage.Persistent</Type>
}

}
