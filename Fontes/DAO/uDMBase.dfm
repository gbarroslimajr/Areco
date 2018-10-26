object DMBase: TDMBase
  OldCreateOrder = False
  Height = 285
  Width = 393
  object SQLConsulta: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 72
    Top = 40
  end
  object SQLInserir: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 136
    Top = 40
  end
  object SQLAlterar: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 200
    Top = 40
  end
  object SQLExcluir: TSQLDataSet
    MaxBlobSize = -1
    Params = <>
    SQLConnection = DMConexao.SQLConexao
    Left = 272
    Top = 40
  end
  object DSPConsulta: TDataSetProvider
    DataSet = SQLConsulta
    Left = 72
    Top = 96
  end
  object CDSConsulta: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DSPConsulta'
    Left = 72
    Top = 160
  end
end
