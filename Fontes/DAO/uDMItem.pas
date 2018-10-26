unit uDMItem;

interface

uses
  System.SysUtils, System.Classes, uDMBase, Data.FMTBcd, Datasnap.DBClient,
  Datasnap.Provider, Data.DB, Data.SqlExpr, uDMConexao, uModelItem,
  uModelProduto, uControllerProduto;

type
  TDMItem = class(TDMBase)
    CDSConsultaiditem: TIntegerField;
    CDSConsultacodigo: TStringField;
    CDSConsultanome: TStringField;
    CDSConsultadescricao: TStringField;
    CDSConsultavalorunitario: TFloatField;
    SQLServico: TSQLDataSet;
    CDSServico: TClientDataSet;
    DSPServico: TDataSetProvider;
    CDSServicoidservico: TIntegerField;
    CDSConsultaidservico: TIntegerField;
    CDSConsultaServico: TIntegerField;
    SQLConsultarProduto: TSQLDataSet;
    SQLInserirProduto: TSQLDataSet;
    SQLAlterarProduto: TSQLDataSet;
    SQLExcluirProduto: TSQLDataSet;
    SQLAlterar2: TSQLDataSet;
    SQLTableItens: TSQLTable;
    CDSItens: TClientDataSet;
    DSPItens: TDataSetProvider;
  private
    { Private declarations }
    function proximaID:integer;
  public
    { Metodo CRUD Item declarations }
    procedure Consultar(Nome:String);
    procedure CarregaItem(oItem: TItem; iditem:integer);
    function  Inserir(oItem:TItem; out msgErro:String):boolean;
    function  Alterar(oItem:TItem; out msgErro:String):boolean;
    function  Excluir(ID:integer; out msgErro:String): boolean;

    { Metodo CRUD Produto declarations }

    procedure ConsultarProduto(iditem:integer);
    function CarregaProduto(oProduto: TProduto; iditem:integer): TProduto;
    function  InserirProduto(oProduto:TProduto; out msgErro:String):boolean;
    function  AlterarProduto(oProduto:TProduto; out msgErro:String):boolean;
    function  ExcluirProduto(ID:integer; out msgErro:String): boolean;
  end;

var
  DMItem: TDMItem;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TDMItem }

{$REGION 'Controles CRUD - Item'}

function TDMItem.Alterar(oItem: TItem; out msgErro: String): boolean;
begin
  with SQLAlterar2, oItem do
  begin
    Params[0].AsInteger := idtem;
    Params[1].AsString := codigo;
    Params[2].AsString := nome;
    Params[3].AsString := descricao;
    Params[4].AsFloat := valorunitario;
    Params[5].AsInteger := idservico;

    try

      ExecSQL();
      oItem.oProduto.iditem := idtem;


    if AlterarProduto(oItem.oProduto,msgErro) = false then
      raise Exception.Create(msgErro);



      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao atualizar o item: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;
end;



procedure TDMItem.CarregaItem(oItem: TItem; iditem: integer);
var
  sqlcliente: TSQLDataSet;
  oprodutocarregado: TProduto;

begin
  sqlcliente := TSQLDataSet.Create(nil);
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'select * from item where iditem = '+ IntToStr(iditem);
      Open;

      With oItem do
      begin
        iditem := FieldByName('iditem').AsInteger;
        codigo :=  FieldByName('codigo').AsString;
        nome :=  FieldByName('nome').AsString;
        descricao :=  FieldByName('descricao').AsString;
        valorunitario :=  FieldByName('valorunitario').AsFloat;
        idservico := FieldByName('idservico').AsInteger;


        oprodutocarregado := CarregaProduto(oItem.oProduto,iditem);
        oProduto.peso := oprodutocarregado.peso;
        oProduto.altura := oprodutocarregado.altura;
        oproduto.idproduto := oprodutocarregado.idproduto;
      end;

    end;

  finally
    sqlcliente.Free;

  end;

end;



procedure TDMItem.Consultar(Nome: String);
begin
  if CDSConsulta.Active then
    CDSConsulta.Close;

  CDSConsulta.Params[0].AsString := '%' + Nome + '%';

  CDSConsulta.Open;
  CDSConsulta.First;

end;



function TDMItem.Excluir(ID: integer; out msgErro: String): boolean;
begin
   with SQLExcluir do
  begin
    Params[0].AsInteger := ID;

    try
      ExecSQL();
      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao excluir o item: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;



function TDMItem.Inserir(oItem: TItem; out msgErro: String): boolean;
var
  idtemp: integer; // id item gravado;

begin
  with SQLInserir, oItem do
  begin
    Params[0].AsString := codigo;
    Params[1].AsString := nome;
    Params[2].AsString := descricao;
    Params[3].AsFloat := valorunitario;
    Params[4].AsFloat := idservico;
    try

      ExecSQL();
      idtemp := proximaID;


      oItem.oProduto.iditem := idtemp;
      if InserirProduto(oItem.oProduto,msgErro) = false then
      raise Exception.Create(msgErro);


      Result := true;
    except on E: Exception do
      begin
        msgErro := 'Ocorreu um ao inserir o item: '+ sLineBreak + E.Message;
        Result := false;
      end;

    end;
  end;

end;

function TDMItem.proximaID: integer;
var
  sqlcliente: TSQLDataSet;
begin
  sqlcliente := TSQLDataSet.Create(nil);
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'SELECT iditem from item order by iditem desc limit 1';
      //o valor de autoincrement no meu banco mysql nao estava funcionando
      //entao resolvi fazer assim.


      Open;


       Result := FieldByName('iditem').AsInteger;

    end;

  finally
    sqlcliente.Free;
  end;

end;


{$ENDREGION}

{$REGION 'Controles CRUD - Produto'}

function TDMItem.AlterarProduto(oProduto: TProduto;
  out msgErro: String): boolean;
begin
  with SQLAlterarProduto, oProduto do
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

function TDMItem.CarregaProduto(oProduto: TProduto; iditem: integer): TProduto;
var
  sqlcliente: TSQLDataSet;
  ProdutoResultado: TProduto;
begin
  sqlcliente := TSQLDataSet.Create(nil);
  ProdutoResultado := TProduto.Create;
  try
    with sqlcliente do
    begin
      SQLConnection := DMConexao.SQLConexao;
      CommandText := 'select * from produto where idtem = '+ IntToStr(iditem);
      Open;

      With ProdutoResultado do
      begin
        idproduto := FieldByName('idproduto').AsInteger;
        iditem :=  FieldByName('idtem').AsInteger;
        peso :=  FieldByName('peso').AsFloat;
        altura :=  FieldByName('altura').AsFloat;

       
      end;
      Result := ProdutoResultado;
    end;

  finally
    sqlcliente.Free;
    ProdutoResultado.Free;
  end;

end;

procedure TDMItem.ConsultarProduto(iditem: integer);
begin
                   //criar cds para produtos
if SQLConsultarProduto.Active then
    SQLConsultarProduto.Close;

  SQLConsultarProduto.Params[0].AsInteger := iditem;

  SQLConsultarProduto.Open;
  SQLConsultarProduto.First;

end;


function TDMItem.ExcluirProduto(ID: integer; out msgErro: String): boolean;
begin
   with SQLExcluirProduto do
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

function TDMItem.InserirProduto(oProduto: TProduto;
  out msgErro: String): boolean;
begin
  with SQLInserirProduto, oProduto do
  begin
    Params[0].AsInteger := iditem;
    Params[1].AsFloat := peso;
    Params[2].AsFloat := altura;
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



{$ENDREGION}

end.
