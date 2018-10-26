inherited DMItem: TDMItem
  OldCreateOrder = True
  Height = 457
  Width = 718
  inherited SQLConsulta: TSQLDataSet
    CommandText = 
      'SELECT *, (select idservico from servico where idservico = item.' +
      'idservico ) as Servico from item'#13#10'where '#13#10'nome like :nome'
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    Left = 112
  end
  inherited SQLInserir: TSQLDataSet
    CommandText = 
      'insert into item (codigo, nome, descricao, valorunitario, idserv' +
      'ico)'#13#10'values'#13#10'(:codigo, :nome, :descricao, :valorunitario, :idse' +
      'rvico)'
    Params = <
      item
        DataType = ftUnknown
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'descricao'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'valorunitario'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 176
  end
  inherited SQLAlterar: TSQLDataSet
    CommandText = 
      'update item'#13#10'set codigo = :codigo, nome = :nome, descricao = :de' +
      'scricao, valorunitario = :valorunitario, '#13#10'idservico = :idservic' +
      'o'#13#10'where'#13#10'iditem = :iditem'
    Params = <
      item
        DataType = ftInteger
        Name = 'iditem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valorunitario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 240
  end
  inherited SQLExcluir: TSQLDataSet
    CommandText = 'delete from item'#10'where'#10'iditem = :iditem'
    Params = <
      item
        DataType = ftInteger
        Name = 'iditem'
        ParamType = ptInput
      end>
    Left = 312
  end
  inherited DSPConsulta: TDataSetProvider
    Left = 112
    Top = 104
  end
  inherited CDSConsulta: TClientDataSet
    Active = True
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    Left = 112
    object CDSConsultaiditem: TIntegerField
      FieldName = 'iditem'
      Required = True
    end
    object CDSConsultacodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object CDSConsultanome: TStringField
      FieldName = 'nome'
      Size = 45
    end
    object CDSConsultadescricao: TStringField
      FieldName = 'descricao'
      Size = 100
    end
    object CDSConsultavalorunitario: TFloatField
      FieldName = 'valorunitario'
    end
    object CDSConsultaidservico: TIntegerField
      FieldName = 'idservico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
    end
    object CDSConsultaServico: TIntegerField
      FieldName = 'Servico'
    end
  end
  object SQLServico: TSQLDataSet
    CommandText = 'SELECT idservico FROM servico;'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 392
    Top = 40
  end
  object CDSServico: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPServico'
    Left = 392
    Top = 152
    object CDSServicoidservico: TIntegerField
      FieldName = 'idservico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
  end
  object DSPServico: TDataSetProvider
    DataSet = SQLServico
    Left = 392
    Top = 96
  end
  object SQLConsultarProduto: TSQLDataSet
    CommandText = 'select * from produto'#13#10'where '#13#10'iditem = :iditem'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'iditem'
        ParamType = ptInput
      end>
    SQLConnection = DMConexao.SQLConexao
    Left = 104
    Top = 288
  end
  object SQLInserirProduto: TSQLDataSet
    CommandText = 
      'insert into produto (idtem, peso, altura)'#13#10'values (:idtem, :peso' +
      ', :altura)'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftSmallint
        Name = 'idtem'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'peso'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'altura'
        ParamType = ptUnknown
      end>
    SQLConnection = DMConexao.SQLConexao
    Left = 104
    Top = 344
  end
  object SQLAlterarProduto: TSQLDataSet
    CommandText = 
      'update produto'#13#10'set idtem = :idtem, peso = :peso, altura = :altu' +
      'ra'#13#10'where'#13#10'idproduto = :idproduto'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idtem'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'peso'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'altura'
        ParamType = ptInput
      end>
    SQLConnection = DMConexao.SQLConexao
    Left = 192
    Top = 288
  end
  object SQLExcluirProduto: TSQLDataSet
    CommandText = 'delete from produto'#10'where'#10'idproduto = :idproduto'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptInput
      end>
    SQLConnection = DMConexao.SQLConexao
    Left = 280
    Top = 288
  end
  object SQLAlterar2: TSQLDataSet
    CommandText = 
      'update item'#13#10'set codigo = :codigo, nome = :nome, descricao = :de' +
      'scricao, valorunitario = :valorunitario, '#13#10'idservico = :idservic' +
      'o'#13#10'where'#13#10'iditem = :iditem'
    MaxBlobSize = -1
    Params = <
      item
        DataType = ftInteger
        Name = 'iditem'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'descricao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'valorunitario'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    SQLConnection = DMConexao.SQLConexao
    Left = 240
    Top = 96
  end
  object SQLTableItens: TSQLTable
    Active = True
    MaxBlobSize = -1
    SQLConnection = DMConexao.SQLConexao
    TableName = 'item'
    Left = 536
    Top = 200
  end
  object CDSItens: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPItens'
    Left = 536
    Top = 312
  end
  object DSPItens: TDataSetProvider
    DataSet = SQLTableItens
    Left = 536
    Top = 256
  end
end
