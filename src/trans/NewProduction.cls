Class trans.NewProduction Extends Ens.Production
{

XData ProductionDefinition
{
<Production Name="trans.NewProduction" TestingEnabled="true" LogGeneralTraceEvents="false">
  <Description></Description>
  <ActorPoolSize>2</ActorPoolSize>
  <Item Name="ProcessaTransporte" Category="" ClassName="trans.BP.ProcessaTransporte.Process" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Pedidos BO" Category="" ClassName="trans.BO.DetalhesPedido.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="Detalhe Pedidos BO" Category="" ClassName="trans.BO.RecupDetalhesPedidos.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
  <Item Name="DetalhesSpeedy BO" Category="" ClassName="trans.BO.DetalhesSpeedy.Operation" PoolSize="1" Enabled="true" Foreground="false" Comment="" LogTraceEvents="false" Schedule="">
  </Item>
</Production>
}

}
