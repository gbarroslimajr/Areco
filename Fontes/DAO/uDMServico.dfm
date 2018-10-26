inherited DMServico: TDMServico
  OldCreateOrder = True
  Width = 580
  inherited SQLConsulta: TSQLDataSet
    CommandText = 'select * from servico'#13#10'where'#13#10'idservico like :idservico'
    Params = <
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 136
    Top = 48
  end
  inherited SQLInserir: TSQLDataSet
    CommandText = 'insert into servico ( idcategoria)'#10'values ( :idcategoria)'
    Params = <
      item
        DataType = ftUnknown
        Name = 'idcategoria'
        ParamType = ptInput
      end>
    Left = 216
    Top = 48
  end
  inherited SQLAlterar: TSQLDataSet
    CommandText = 
      'update servico'#10'set idcategoria = :idcategoria'#10'where idservico = ' +
      ':idservico'
    Params = <
      item
        DataType = ftInteger
        Name = 'idcategoria'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 280
    Top = 48
  end
  inherited SQLExcluir: TSQLDataSet
    CommandText = 'delete from servico'#10'where'#10'idservico = :idservico'
    Params = <
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 352
    Top = 48
  end
  inherited DSPConsulta: TDataSetProvider
    Left = 136
    Top = 104
  end
  inherited CDSConsulta: TClientDataSet
    Active = True
    Params = <
      item
        DataType = ftInteger
        Name = 'idservico'
        ParamType = ptInput
      end>
    Left = 136
    object CDSConsultaidServico: TIntegerField
      FieldName = 'idServico'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSConsultaidcategoria: TIntegerField
      FieldName = 'idcategoria'
    end
  end
  object SQLCategoria: TSQLDataSet
    CommandText = 'select idcategoria, nome from categoria'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 416
    Top = 48
  end
  object CDSCategoria: TClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPCategoria'
    Left = 416
    Top = 152
    object CDSCategoriaidcategoria: TIntegerField
      FieldName = 'idcategoria'
      ProviderFlags = [pfInUpdate, pfInWhere, pfInKey]
      Required = True
    end
    object CDSCategorianome: TStringField
      FieldName = 'nome'
      Size = 50
    end
  end
  object DSPCategoria: TDataSetProvider
    DataSet = SQLCategoria
    Left = 416
    Top = 96
  end
  object SQLConsulta2: TSQLDataSet
    CommandText = 'SELECT * FROM servico;'
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 48
    Top = 56
  end
  object CDSConsulta2: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta2'
    Left = 48
    Top = 160
  end
  object DSPConsulta2: TDataSetProvider
    DataSet = SQLConsulta2
    Left = 48
    Top = 112
  end
end
