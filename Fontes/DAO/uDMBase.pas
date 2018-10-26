unit uDMBase;

interface

uses
  System.SysUtils, System.Classes, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uDMConexao;

type
  TDMBase = class(TDataModule)
    SQLConsulta: TSQLDataSet;
    SQLInserir: TSQLDataSet;
    SQLAlterar: TSQLDataSet;
    SQLExcluir: TSQLDataSet;
    DSPConsulta: TDataSetProvider;
    CDSConsulta: TClientDataSet;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMBase: TDMBase;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
