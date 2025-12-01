Class trans.BO.DetalhesPedido.Operation Extends Ens.BusinessOperation
{

Parameter INVOCATION = "Queue";

/// Metodo de pedido
Method Pedido(pRequest As trans.BO.DetalhesPedido.Pedido.Request, Output pResponse As trans.BO.DetalhesPedido.Pedido.Response) As %Status
{
    Set tSC = $$$OK
    SET pResponse = ##class(trans.BO.DetalhesPedido.Pedido.Response).%New()

    Hang 15 Break
    Try {
        $$$TRACE("Iniciando processamento do metodo Pedido")
        SET obj = ##class(trans.TRE.DATA.Pedido).%New()
        $$$TRACE("Criando objeto Metodo BO Pedido")

        SET obj.CodigoCliente = pRequest.CodigoCliente
        SET obj.CodigoPedido = pRequest.CodigoPedido
        SET obj.DataPedido = pRequest.DataPedido
        SET obj.ValorPedido = pRequest.ValorPedido
        SET obj.CodigoTransportadora = pRequest.CodigoTransportadora
        SET obj.PesoKG = pRequest.PesoKG
        SET obj.Volumes = pRequest.Volumes
        SET obj.DataPrevisaoEntrega = pRequest.DataPrevisaoEntrega

        SET tCS = obj.%Save()

        SET pResponse.Mensagem = "Pedido salvo com sucesso."
    }
    Catch ex {
        $$$TRACE("Erro ao processar o metodo Pedido(): "_ex.DisplayString())
        Set tSC=ex.AsStatus()
    }
    
    Return tSC
}

/// Metodo de Cliente
Method Cliente(pRequest As trans.BO.DetalhesPedido.Cliente.Request, Output pResponse As trans.BO.DetalhesPedido.Cliente.Response) As %Status
{
    Set tSC = $$$OK
    SET pResponse = ##class(trans.BO.DetalhesPedido.Cliente.Response).%New()
  
    Try {

        SET tErro = ""
        IF (pRequest.CodigoCliente = ""){
            SET tErro = "CodigoCliente não pode ser vazio."
        }
        IF (pRequest.NomeEmpresa = ""){
            SET tErro = "NomeEmpresa não pode ser vazio."
        }
        IF (pRequest.NomeContato = ""){
            SET tErro = "NomeContato não pode ser vazio."
        }
        IF (pRequest.Endereco = ""){
            SET tErro = "Endereco não pode ser vazio."
        }
        IF (pRequest.CEP = ""){
            SET tErro = "CEP não pode ser vazio."
        }
        IF (pRequest.Cidade = ""){
            SET tErro = "Cidade não pode ser vazio."
        }
        IF (pRequest.Estado = ""){
            SET tErro = "Estado não pode ser vazio."
        }
        IF (pRequest.EnderecoEmail = ""){
            SET tErro = "EnderecoEmail não pode ser vazio."
        }
        
        IF (tErro '= "") {
            $$$TRACE("Critica falhou: "_tErro)
            SET pResponse.Mensagem = tErro
            QUIT
        }

        $$$TRACE("Critica passou com sucesso.")

        SET tRS = ##class(%ResultSet).%New()
        SET tSQL = "INSERT INTO trans_TRE_DATA.Cliente (CodigoCliente, NomeEmpresa, NomeContato, Endereco, CEP, Cidade, Estado, EnderecoEmail)"
        SET tSQL = tSQL_" VALUES ('"_pRequest.CodigoCliente_"','"_pRequest.NomeEmpresa_"','"_pRequest.NomeContato_"','"_pRequest.Endereco_"','"_pRequest.CEP_"','"_pRequest.Cidade_"','"_pRequest.Estado_"','"_pRequest.EnderecoEmail_"') "

        SET tSC = tRS.Prepare(tSQL)

        IF tSC {
            // O valor de 1 significa que iremos fazer o insert no banco através do Execute(1) e recuperamos os dados
            SET tSC = tRS.Execute(1)
            $$$TRACE("Cliente inserido com sucesso no banco de dados.")
            SET pResponse.Mensagem = "Cliente salvo com sucesso."
            
        }
        #; $$$TRACE("Iniciando processamento do metodo Cliente")
        #; SET obj = ##class(trans.TRE.DATA.Cliente).%New()
        #; $$$TRACE("Criando objeto Metodo BO Cliente")

        #; SET obj.CodigoCliente = pRequest.CodigoCliente
        #; SET obj.NomeEmpresa = pRequest.NomeEmpresa
        #; SET obj.NomeContato = pRequest.NomeContato
        #; SET obj.Endereco = pRequest.Endereco
        #; SET obj.CEP = pRequest.CEP
        #; SET obj.Cidade = pRequest.Cidade
        #; SET obj.Estado = pRequest.Estado
        #; SET obj.EnderecoEmail = pRequest.EnderecoEmail
        
        #; SET tCS = obj.%Save()

        #; SET pResponse.Mensagem = "Cliente salvo com sucesso."
    }
    Catch ex {
        $$$TRACE("Erro ao processar o metodo Cliente(): "_ex.DisplayString())
        Set tSC=ex.AsStatus()
    }

    Return tSC
}

/// Metodo de Destino
Method Destino(pRequest As trans.BO.DetalhesPedido.Destino.Request, Output pResponse As trans.BO.DetalhesPedido.Destino.Response) As %Status
{
    Set tSC = $SYSTEM.Status.OK()
    SET pResponse = ##class(trans.BO.DetalhesPedido.Destino.Response).%New()
    #Dim resultSet AS %ResultSet
   
    Try {
        $$$TRACE("Iniciando processamento do metodo Destino")
        SET obj = ##class(trans.TRE.DATA.Destino).%New()
        $$$TRACE("Criando objeto Metodo BO Destino")
        
        SET SQL = "INSERT INTO trans_TRE_DATA.Destino (CodigoDestino, PrazoEntregaDias, CEPInicial, CEPFinal) VALUES ('"_pRequest.CodigoDestino_"','"_pRequest.PrazoEntregaDias_"','"_pRequest.CEPInicial_"','"_pRequest.CEPFinal_"') "

        SET resultSet = ##class(%ResultSet).%New()
        SET result = resultSet.Prepare(SQL)
        $$$TRACE("Prepared statement criado com sucesso")
        SET result = resultSet.Execute()
        $$$TRACE("Execute statement executado com sucesso")

        $$$TRACE("Salvando objeto Metodo BO Destino")

        SET tCS = result

        SET pResponse.Mensagem = "Destino salvo com sucesso."

    }
    Catch ex {
        $$$TRACE("Erro ao processar o metodo Destino(): "_ex.DisplayString())
        Set tSC=ex.AsStatus()
    }
    Return tSC
}

/// Mapeamento de mensagens para o metodo Pedido
XData MessageMap
{
<MapItens>
    <MapItem  MessageType="trans.BO.DetalhesPedido.Pedido.Request">
        <Method>Pedido</Method>
    </MapItem>
    <MapItem  MessageType="trans.BO.DetalhesPedido.Cliente.Request">
        <Method>Cliente</Method>
    </MapItem>
    <MapItem  MessageType="trans.BO.DetalhesPedido.Destino.Request">
        <Method>Destino</Method>
    </MapItem>
</MapItens>
}

}
