Class trans.BO.RecupDetalhesPedidos.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";
Method RecupDetalhesPedidos(pRequest AS trans.BO.RecupDetalhesPedidos.Request, Output pResponse AS trans.BO.RecupDetalhesPedidos.Response) AS %Status


}

XData MessageMap
{
<MapItens>
    <MapItem  MessageType="trans.BO.RecupDetalhesPedidos.Request">
        <Method>RecupDetalhesPedidos</Method>
    </MapItem>
</MapItens>
}

}
