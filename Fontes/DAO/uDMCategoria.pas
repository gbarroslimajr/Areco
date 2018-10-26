unit uDMCategoria;

interface

uses
  System.SysUtils, System.Classes, uDMBase, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uModelCategoria, uDMConexao;

type
  TDMCategoria = class(TDMBase)
    SQLConsultaidcategoria: TIntegerField;
    SQLConsultacodigo: TStringField;
    SQLConsultanome: TStringField;
    ClientDataSet1: TClientDataSet;
    CDSConsultaidcategoria: TIntegerField;
    CDSConsultacodigo: TStringField;
    CDSConsultanome: TStringField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consultar(nomeCategoria:String);
    procedure CarregaCategoria(oCategoria: TCategoria; IdCategoria:integer);
    function  Inserir(oCategoria:TCategoria; out msgErro:String):boolean;
    function  Alterar(oCategoria:TCategoria; out msgErro:String):boolean;
    function  Excluir(ID:integer; out msgErro:String): boolean;
  end;

var
  DMCategoria: TDMCategoria;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMBase1 }

function TDMCategoria.Alterar(oCategoria: TCategoria; out msgErro: String): boolean;
begin
  with SQLAlterar, oCategoria do
  begin
    Params[0].AsString := Codigo;
    Params[1].AsString := Nome;
    Params[2].Asinteger := ID;
    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao atualizar a categoria: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

procedure TDMCategoria.CarregaCategoria(oCategoria: TCategoria;
  IdCategoria: integer);
var
  sqlcliente: TSQLDataSet;
begin
  sqlcliente := TSQLDataSet.Create(nil);
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'select * from categoria where idcategoria = '+ IntToStr(IdCategoria);
      Open;

      With oCategoria do
      begin
        ID := FieldByName('idcategoria').AsInteger;
        Codigo :=  FieldByName('codigo').AsString;
        Nome := FieldByName('nome').AsString;
      end;

    end;



  finally
    sqlcliente.Free;
  end;

end;

procedure TDMCategoria.Consultar(nomeCategoria: String);
begin

  if CDSConsulta.Active then
    CDSConsulta.Close;

  CDSConsulta.Params[0].AsString := '%' + nomeCategoria + '%';

  CDSConsulta.Open;
  CDSConsulta.First;


end;

function TDMCategoria.Excluir(ID: integer; out msgErro: String): boolean;
begin
   with SQLExcluir do
  begin
    Params[0].AsInteger := ID;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao excluir a categoria: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

function TDMCategoria.Inserir(oCategoria: TCategoria; out msgErro: String): boolean;
begin
  with SQLInserir, oCategoria do
  begin
    Params[1].AsString := Codigo;
    Params[2].AsString := Nome;
    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao inserir a categoria: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

end.
