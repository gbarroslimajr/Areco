unit ufrmCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uControllerCategoria,
  uModelCategoria, uDMCategoria, Vcl.Menus;

type
  TFrmCategoria = class(TFrmBase)
    edtID: TLabeledEdit;
    edtCodigo: TLabeledEdit;
    edtDescricao: TLabeledEdit;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
  private
    { Private declarations }
    procedure Pesquisar; override;
    procedure CarregarCategoria;
    procedure Listar; override;

    procedure Excluir; override;
    procedure inserir;
    procedure Alterar; override;
    procedure Gravar; override;
    procedure detalhar; override;
    procedure CorEntrada(Sender: TObject); override;
    procedure CorSaida(Sender: TObject); override;
    procedure Limparcampos; override;
    procedure HabilitaCampos(Valur:boolean); override;

  public
    { Public declarations }
  end;

var
  FrmCategoria: TFrmCategoria;

implementation

{$R *.dfm}



procedure TFrmCategoria.Alterar;
var
   oCategoriaController: TControllerCategoria;
   oCategoria: TCategoria;
   msgErro:String;
begin
  oCategoria := TCategoria.Create;
  oCategoriaController := TControllerCategoria.Create;

  try
    With oCategoria do
    begin
      ID := StrToInt(edtID.Text);
      Codigo := edtCodigo.Text;
      Nome := edtDescricao.Text;
    end;
    if oCategoriaController.Alterar(oCategoria,msgErro) = false then
      raise Exception.Create(msgErro);



  finally
    FreeAndNil(oCategoria);
    FreeAndNil(oCategoriaController);
  end;


end;

procedure TFrmCategoria.CarregarCategoria;
var
   oCategoriaController: TControllerCategoria;
   oCategoria: TCategoria;
begin
  oCategoria := TCategoria.Create;
  oCategoriaController := TControllerCategoria.Create;
  try
    oCategoriaController.CarregarCategoria(oCategoria, DSPesquisar.DataSet.FieldByName('idcategoria').AsInteger);
    edtID.Text := oCategoria.ID.ToString;
    edtCodigo.Text := oCategoria.Codigo;
    edtDescricao.Text := oCategoria.Nome;
  finally
    FreeAndNil(oCategoria);
    FreeAndNil(oCategoriaController);
  end;


end;

procedure TFrmCategoria.CorEntrada(Sender: TObject);
begin
  inherited;
    if (Sender is TLabeledEdit) then
      (Sender as TLabeledEdit).Color:= clSkyBlue
end;

procedure TFrmCategoria.CorSaida(Sender: TObject);
begin
  inherited;
  if (Sender is TLabeledEdit) then
      (Sender as TLabeledEdit).Color:= clWindow;

end;

procedure TFrmCategoria.detalhar;
begin
  CarregarCategoria;
  HabilitarControles(ActNavegar);
  FAcao := ActNavegar;
  PagePrincipal.ActivePage := tbDados;
end;

procedure TFrmCategoria.Excluir;
var
  oCategoriaController: TControllerCategoria;
  msgErro:String;
begin
  oCategoriaController := TControllerCategoria.Create;
   try
    if (DMCategoria.CDSConsulta.Active) and (DMCategoria.CDSConsulta.RecordCount > 0 ) then
    begin

     if MessageDlg('Excluir o registro', mtWarning, [mbyes, mbno], 0) = IDYes then
     begin
      if oCategoriaController.Excluir(DMCategoria.CDSConsulta.FieldByName('idcategoria').AsInteger, msgErro ) = false then
        raise Exception.Create(msgErro);

      oCategoriaController.Pesquisar(EdtPesquisar.Text);

     end;
    end else
    raise Exception.Create('Nao existem registros para excluir');



  finally
    FreeAndNil(oCategoriaController);
  end;
end;

procedure TFrmCategoria.FormCreate(Sender: TObject);
begin
  inherited;
  DMCategoria := TDMCategoria.Create(nil);
end;

procedure TFrmCategoria.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DMCategoria);
end;

procedure TFrmCategoria.Gravar;
var
   oCategoriaController: TControllerCategoria;
begin
  oCategoriaController := TControllerCategoria.Create;

  try
    case FAcao of
    ActNovo: inserir;
    ActAlterar: Alterar;

    end;
    oCategoriaController.Pesquisar(EdtPesquisar.Text);
  finally
    FreeAndNil(oCategoriaController);

    PagePrincipal.ActivePage := tbPesquisar;


  end;

end;



procedure TFrmCategoria.HabilitaCampos(Valur: boolean);
begin
  inherited;

end;

procedure TFrmCategoria.inserir;
var
   oCategoriaController: TControllerCategoria;
   oCategoria: TCategoria;
   msgErro:String;
begin
  oCategoria := TCategoria.Create;
  oCategoriaController := TControllerCategoria.Create;

  try
    with oCategoria do
    begin
      ID := 0;
      Codigo := edtCodigo.Text;
      Nome := edtDescricao.Text;
    end;

    if oCategoriaController.Inserir(oCategoria,msgErro) = false then
      raise Exception.Create(msgErro);


  finally
    FreeAndNil(oCategoria);
    FreeAndNil(oCategoriaController);
  end;


end;

procedure TFrmCategoria.Limparcampos;
begin
  inherited;
  edtID.Clear;
  edtCodigo.Clear;
  edtDescricao.Clear;

end;

procedure TFrmCategoria.Listar;
begin
  PagePrincipal.ActivePage :=tbPesquisar;

end;

procedure TFrmCategoria.Pesquisar;
var
  oCategoriaController: TControllerCategoria;
begin

  oCategoriaController := TControllerCategoria.Create;
  try
    oCategoriaController.Pesquisar(edtPesquisar.text);
  finally
    FreeAndNil(oCategoriaController);
  end;


end;

end.
