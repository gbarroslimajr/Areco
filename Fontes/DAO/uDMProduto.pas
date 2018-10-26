unit uDMProduto;

interface

uses
  System.SysUtils, System.Classes, uDMBase, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uDMConexao, uModelProduto;

type
  TDMProduto = class(TDMBase)
    CDSConsultaidproduto: TIntegerField;
    CDSConsultaidtem: TIntegerField;
    CDSConsultaPeso: TFloatField;
    CDSConsultaaltura: TFloatField;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consultar(idproduto:integer);
    procedure CarregaProduto(oProduto: TProduto; idproduto:integer);
    function  Inserir(oProduto:TProduto; out msgErro:String):boolean;
    function  Alterar(oProduto:TProduto; out msgErro:String):boolean;
    function  Excluir(ID:integer; out msgErro:String): boolean;
  end;

var
  DMProduto: TDMProduto;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMProduto }

function TDMProduto.Alterar(oProduto: TProduto; out msgErro: String): boolean;
begin
  with SQLAlterar, oProduto do
  begin
    Params[0].AsInteger := idproduto;
    Params[1].AsInteger := iditem;
    Params[2].AsFloat := peso;
    Params[3].AsFloat := altura;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao atualizar o produto: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;
end;

procedure TDMProduto.CarregaProduto(oProduto: TProduto; idproduto: integer);
var
  sqlcliente: TSQLDataSet;
begin
  sqlcliente := TSQLDataSet.Create(nil);
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'select * from produto where idproduto = '+ IntToStr(idproduto);
      Open;

      With oProduto do
      begin
        idproduto := FieldByName('idservico').AsInteger;
        iditem :=  FieldByName('idcategoria').AsInteger;
        peso :=  FieldByName('peso').AsFloat;
        altura :=  FieldByName('altura').AsFloat;

      end;

    end;

  finally
    sqlcliente.Free;
  end;

end;

procedure TDMProduto.Consultar(idproduto: integer);
begin
  if CDSConsulta.Active then
    CDSConsulta.Close;

  CDSConsulta.Params[0].AsInteger := idproduto;

  CDSConsulta.Open;
  CDSConsulta.First;

end;

function TDMProduto.Excluir(ID: integer; out msgErro: String): boolean;
begin
   with SQLExcluir do
  begin
    Params[0].AsInteger := ID;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao excluir o produto: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

function TDMProduto.Inserir(oProduto: TProduto; out msgErro: String): boolean;
begin
  with SQLInserir, oProduto do
  begin
    Params[0].AsInteger := idproduto;
    Params[1].AsInteger := iditem;
    Params[2].AsFloat := peso;
    Params[3].AsFloat := altura;
    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao inserir o produto: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

end.
