unit ufrmItem;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uModelItem, uDMItem, Vcl.DBCtrls,
  uModelProduto, uControllerItem;

type
  TFrmItem = class(TFrmBase)
    edtIDItem: TLabeledEdit;
    EdtCodigo: TLabeledEdit;
    EdtNome: TLabeledEdit;
    EdtDescricao: TLabeledEdit;
    dbComboServico: TDBLookupComboBox;
    Label1: TLabel;
    DSServico: TDataSource;
    edtValorUnitario: TLabeledEdit;
    edtPeso: TLabeledEdit;
    edtAltura: TLabeledEdit;
    edtidproduto: TEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
    procedure btnnovoClick(Sender: TObject);
  private
    { Private declarations }
  public
    procedure Pesquisar; override;
    procedure CarregarItem;
    procedure Listar; override;

    procedure Excluir; override;
    procedure inserir;
    procedure Alterar; override;
    procedure Gravar; override;
    procedure detalhar; override;
    procedure CorEntrada(Sender: TObject); override;
    procedure CorSaida(Sender: TObject); override;
    procedure limparCampos; override;
    procedure HabilitaCampos(Value:boolean); override;
  end;

var
  FrmItem: TFrmItem;

implementation

{$R *.dfm}


{ TFrmItem }

procedure TFrmItem.Alterar;
var
   oItemController: TControllerItem;
   oItem: TItem;
   msgErro:String;
begin
  oItem := TItem.Create;
  oItemController := TControllerItem.Create;

  try
    With oItem do
    begin
      idtem := StrToInt(edtIDItem.Text);
      codigo := EdtCodigo.Text;
      idservico :=  dbComboServico.KeyValue;
      nome := EdtNome.Text;
      descricao := EdtDescricao.Text;
      valorunitario := StrToFloat(edtValorUnitario.Text);
      oProduto.iditem := idtem;
      oProduto.peso := StrToFloat(edtPeso.Text);
      oProduto.altura := StrToInt(edtAltura.Text);
      oProduto.idproduto := StrToInt(edtidproduto.Text);

    end;
   if oItemController.Alterar(oItem,msgErro) = false then
      raise Exception.Create(msgErro);



  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;

  inherited;

end;

procedure TFrmItem.btnnovoClick(Sender: TObject);
begin
  inherited;
  EdtCodigo.SetFocus;
end;

procedure TFrmItem.CarregarItem;
var
   oItemController: TControllerItem;
   oItem: TItem;

begin
  oItem := TItem.Create;
  oItemController := TControllerItem.Create;
  try
    oItemController.CarregarItem(oItem, DMItem.CDSConsulta.FieldByName('iditem').AsInteger);

    with oItem do
    begin
      edtIDItem.Text := DMItem.CDSConsulta.FieldByName('iditem').AsString;
      EdtCodigo.Text := codigo;
      dbComboServico.KeyValue := oItem.idservico;
      EdtNome.Text := nome;
      EdtDescricao.Text := descricao;
      edtValorUnitario.Text := FloatToStr(valorunitario);
      edtPeso.Text := FloatTostr(oProduto.peso);
      edtAltura.Text := FloatToStr(oProduto.altura);
      edtidproduto.Text := IntToStr(oProduto.idproduto);
    end;

  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;

end;

procedure TFrmItem.CorEntrada(Sender: TObject);
begin
  inherited;
  if (Sender is TDBLookupComboBox) then
      (Sender as TDBLookupComboBox).Color:= clSkyBlue

end;

procedure TFrmItem.CorSaida(Sender: TObject);
begin
  inherited;
  if (Sender is TDBLookupComboBox) then
      (Sender as TDBLookupComboBox).Color:= clWindow;

end;

procedure TFrmItem.detalhar;
begin
  inherited;
  CarregarItem;
  HabilitarControles(ActNavegar);
  FAcao := ActNavegar;
  PagePrincipal.ActivePage := tbDados;

end;

procedure TFrmItem.edtValorUnitarioKeyPress(Sender: TObject; var Key: Char);
begin
  inherited;
  If not( key in['0'..'9',#08,',','.'] ) then
    key:=#0;
end;

procedure TFrmItem.Excluir;
var
  oItemController : TControllerItem;
  msgErro:String;
begin
  oItemController := TControllerItem.Create;
   try

    if (DSPesquisar.DataSet.Active) and (DSPesquisar.DataSet.RecordCount > 0 ) then
    begin

     if MessageDlg('Excluir o registro', mtWarning, [mbyes, mbno], 0) = IDYes then
     begin
      if oItemController.Excluir(DSPesquisar.DataSet.FieldByName('iditem').AsInteger, msgErro ) = false then
        raise Exception.Create(msgErro);

      oItemController.Pesquisar(EdtPesquisar.Text);

     end;
    end else
    raise Exception.Create('Nao existem registros para excluir');



  finally
    FreeAndNil(oItemController);
  end;

end;

procedure TFrmItem.FormCreate(Sender: TObject);
begin
  inherited;
  DMItem := TDMItem.Create(nil);
end;

procedure TFrmItem.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DMItem);
end;

procedure TFrmItem.Gravar;
var
   oItemController : TControllerItem;
begin
  oItemController := TControllerItem.Create;

  try
    case FAcao of
    ActNovo: inserir;
    ActAlterar: Alterar;

    end;

    oItemController.Pesquisar(EdtPesquisar.Text);
  finally
    FreeAndNil(oItemController);

    PagePrincipal.ActivePage := tbPesquisar;
    limparCampos;


  end;

end;

procedure TFrmItem.HabilitaCampos(Value: boolean);
begin
  inherited;
  edtIDItem.Enabled := Value;
  EdtCodigo.Enabled := Value;
  dbComboServico.Enabled := Value;
  EdtNome.Enabled := Value;
  EdtDescricao.Enabled := Value;
  edtValorUnitario.Enabled := Value;
  edtPeso.Enabled := Value;
  edtAltura.Enabled := Value;

end;

procedure TFrmItem.inserir;
var
   oItemController: TControllerItem;
   oItem: TItem;
   msgErro:String;
begin
  oItem := TItem.Create;
  oItemController := TControllerItem.Create;

  try
    with oItem do
    begin

      codigo := EdtCodigo.Text;
      idservico := dbComboServico.KeyValue;
      nome := EdtNome.Text;
      descricao := EdtDescricao.Text;
      valorunitario := StrToFloat(edtValorUnitario.Text);
      oProduto.peso := StrToFloat(edtPeso.Text);
      oProduto.altura := StrToFloat(edtAltura.Text);


    end;

    if oItemController.Inserir(oItem,msgErro) = false then
      raise Exception.Create(msgErro);


  finally
    FreeAndNil(oItem);
    FreeAndNil(oItemController);
  end;

end;

procedure TFrmItem.limparCampos;
begin
  inherited;
  edtIDItem.Clear;
  EdtCodigo.Clear;
  dbComboServico.KeyValue := -1;
  EdtNome.Clear;
  EdtDescricao.Clear;
  edtValorUnitario.Clear;
  edtPeso.Clear;
  edtAltura.Clear;

end;

procedure TFrmItem.Listar;
begin
  inherited;
  PagePrincipal.ActivePage :=tbPesquisar;
end;

procedure TFrmItem.Pesquisar;
var
  oItemController: TControllerItem;
begin

  oItemController := TControllerItem.Create;
  try
      DSPesquisar.DataSet := DMItem.CDSConsulta;

    oItemController.Pesquisar(edtPesquisar.text);
  finally
    FreeAndNil(oItemController);
  end;

end;

end.
