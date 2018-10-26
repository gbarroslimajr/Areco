inherited DMProduto: TDMProduto
  inherited SQLConsulta: TSQLDataSet
    CommandText = 'select * from produto'#10'where '#10'idproduto = :idproduto'
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptInput
      end>
  end
  inherited SQLInserir: TSQLDataSet
    CommandText = 
      'insert into produto (iditem, peso, altura)'#13#10'values (:iditem, :pe' +
      'so, :altura)'
    Params = <
      item
        DataType = ftUnknown
        Name = 'iditem'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'peso'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'altura'
        ParamType = ptInput
      end>
  end
  inherited SQLAlterar: TSQLDataSet
    CommandText = 
      'update produto'#10'set iditem = :idtem, peso = :peso, altura = :altu' +
      'ra'#10'where'#10'idproduto = :idproduto'
    Params = <
      item
        DataType = ftUnknown
        Name = 'idtem'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'peso'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'altura'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'idproduto'
        ParamType = ptInput
      end>
  end
  inherited SQLExcluir: TSQLDataSet
    CommandText = 'delete from produto'#10'where'#10'idproduto = :idproduto'
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptInput
      end>
  end
  inherited CDSConsulta: TClientDataSet
    Params = <
      item
        DataType = ftInteger
        Name = 'idproduto'
        ParamType = ptInput
      end>
    object CDSConsultaidproduto: TIntegerField
      FieldName = 'idproduto'
      Required = True
    end
    object CDSConsultaidtem: TIntegerField
      FieldName = 'idtem'
      Required = True
    end
    object CDSConsultaPeso: TFloatField
      FieldName = 'Peso'
    end
    object CDSConsultaaltura: TFloatField
      FieldName = 'altura'
    end
  end
end
