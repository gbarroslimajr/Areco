unit uDMServico;

interface

uses
  System.SysUtils, System.Classes, uDMBase, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uModelServico, uDMConexao;

type
  TDMServico = class(TDMBase)
    CDSConsultaidServico: TIntegerField;
    CDSConsultaidcategoria: TIntegerField;
    SQLCategoria: TSQLDataSet;
    CDSCategoria: TClientDataSet;
    DSPCategoria: TDataSetProvider;
    CDSCategoriaidcategoria: TIntegerField;
    CDSCategorianome: TStringField;
    SQLConsulta2: TSQLDataSet;
    CDSConsulta2: TClientDataSet;
    DSPConsulta2: TDataSetProvider;
  private
    { Private declarations }
  public
    { Public declarations }
    procedure Consultar(IdServico:integer); overload;
    procedure Consultar; overload;
    procedure CarregaServico(oServico: TServico; IdServico:integer);
    function  Inserir(oServico:TServico; out msgErro:String):boolean;
    function  Alterar(oServico:TServico; out msgErro:String):boolean;
    function  Excluir(ID:integer; out msgErro:String): boolean;
  end;

var
  DMServico: TDMServico;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMServico }

function TDMServico.Alterar(oServico: TServico; out msgErro: String): boolean;
begin
  with SQLAlterar, oServico do
  begin
    Params[0].AsInteger := idServico;
    Params[1].AsInteger := idcategoria;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao atualizar o serviço: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;
end;

procedure TDMServico.CarregaServico(oServico: TServico; IdServico: integer);
var
  sqlcliente: TSQLDataSet;
begin
  sqlcliente := TSQLDataSet.Create(nil);
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'select * from servico where idservico = '+ IntToStr(IdServico);
      Open;

      With oServico do
      begin
        idServico := FieldByName('idservico').AsInteger;
        idCategoria :=  FieldByName('idcategoria').AsInteger;

      end;

    end;



  finally
    sqlcliente.Free;
  end;

end;



procedure TDMServico.Consultar;
begin
  if CDSConsulta2.Active then
    CDSConsulta2.Close;

  CDSConsulta2.Open;
  CDSConsulta2.First;

end;

procedure TDMServico.Consultar(IdServico: integer);
begin
  if CDSConsulta.Active then
    CDSConsulta.Close;

  CDSConsulta.Params[0].AsInteger := IdServico;

  CDSConsulta.Open;
  CDSConsulta.First;

end;

function TDMServico.Excluir(ID: integer; out msgErro: String): boolean;
begin
   with SQLExcluir do
  begin
    Params[0].AsInteger := ID;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao excluir o serviço: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;


end;

function TDMServico.Inserir(oServico: TServico; out msgErro: String): boolean;
begin
  with SQLInserir, oServico do
  begin
    Params[0].AsInteger := idCategoria;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao inserir o serviço: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

end.
