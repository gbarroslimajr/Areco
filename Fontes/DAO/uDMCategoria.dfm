inherited DMCategoria: TDMCategoria
  Height = 468
  Width = 696
  inherited SQLConsulta: TSQLDataSet
    CommandText = 
      'select idcategoria, codigo, nome '#13#10#13#10'from categoria'#13#10#13#10'where'#13#10#13#10 +
      'nome  like :nome'
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    object SQLConsultaidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Required = True
    end
    object SQLConsultacodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object SQLConsultanome: TStringField
      DisplayWidth = 50
      FieldName = 'nome'
      Size = 50
    end
  end
  inherited SQLInserir: TSQLDataSet
    CommandText = 
      'INSERT INTO '#13#10' categoria '#10'(idCategoria,'#10'Codigo,'#10'Nome)'#13#10#10'VALUES'#10'(' +
      ':idCategoria, :Codigo, :Nome);'
    Params = <
      item
        DataType = ftSmallint
        Name = 'idCategoria'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Codigo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Nome'
        ParamType = ptInput
      end>
  end
  inherited SQLAlterar: TSQLDataSet
    CommandText = 
      'UPDATE categoria'#10'SET'#13#10#10'Codigo = :codigo, '#10'Nome = :nome'#13#10#10'WHERE '#13 +
      #10'idCategoria = :idcategoria;'
    Params = <
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
        DataType = ftInteger
        Name = 'idcategoria'
        ParamType = ptInput
      end>
  end
  inherited SQLExcluir: TSQLDataSet
    CommandText = 'DELETE FROM categoria'#13#10#10'WHERE '#10'idcategoria = :idcategoria'
    Params = <
      item
        DataType = ftInteger
        Name = 'idcategoria'
        ParamType = ptInput
      end>
  end
  inherited CDSConsulta: TClientDataSet
    Params = <
      item
        DataType = ftString
        Name = 'nome'
        ParamType = ptInput
      end>
    object CDSConsultaidcategoria: TIntegerField
      FieldName = 'idcategoria'
      Required = True
    end
    object CDSConsultacodigo: TStringField
      FieldName = 'codigo'
      Size = 10
    end
    object CDSConsultanome: TStringField
      FieldName = 'nome'
      Size = 10
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    Left = 192
    Top = 160
  end
end
