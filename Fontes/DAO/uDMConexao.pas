unit uDMConexao;

interface

uses
  System.SysUtils, System.Classes, Data.DB, Data.SqlExpr, Data.DBXInterBase,
  Data.DBXMySQL;

type
  TDMConexao = class(TDataModule)
    SQLConexao: TSQLConnection;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
