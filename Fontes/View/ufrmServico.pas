unit ufrmServico;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, UBase, Data.DB, Vcl.Menus, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, uDMServico,
  uControllerServico, uModelServico, Vcl.DBCtrls;

type
  TFrmServico = class(TFrmBase)
    Label1: TLabel;
    edtidServico: TLabeledEdit;
    dbComboCategoria: TDBLookupComboBox;
    DSCategoria: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure btndetalharClick(Sender: TObject);
  private
    procedure Pesquisar; override;
    procedure CarregarServico;
    procedure Listar; override;

    procedure Excluir; override;
    procedure inserir;
    procedure Alterar; override;
    procedure Gravar; override;
    procedure detalhar; override;
    procedure CorEntrada(Sender: TObject); override;
    procedure CorSaida(Sender: TObject); override;
    procedure limparCampos; override;
    procedure HabilitaCampos(Value:boolean);

  public
    { Public declarations }
  end;

var
  FrmServico: TFrmServico;

implementation

{$R *.dfm}

procedure TFrmServico.Alterar;
var
   oServicoController: TControllerServico;
   oServico: TServico;
   msgErro:String;
begin
  oServico := TServico.Create;
  oServicoController := TControllerServico.Create;

  try
    With oServico do
    begin
      idServico := StrToInt(edtidServico.Text);
      idCategoria := dbComboCategoria.KeyValue;

    end;
    if oServicoController.Alterar(oServico,msgErro) = false then
      raise Exception.Create(msgErro);



  finally
    FreeAndNil(oServico);
    FreeAndNil(oServicoController);
  end;

  inherited;

end;

procedure TFrmServico.btnalterarClick(Sender: TObject);
begin
  HabilitaCampos(true);
  inherited;

end;

procedure TFrmServico.btndetalharClick(Sender: TObject);
begin
  inherited;
  HabilitaCampos(false);
end;

procedure TFrmServico.btnnovoClick(Sender: TObject);
begin
  HabilitaCampos(true);


  inherited;

end;

procedure TFrmServico.CarregarServico;
var
   oServicoController: TControllerServico;
   oServico: TServico;

begin
  oServico := TServico.Create;
  oServicoController := TControllerServico.Create;
  try
    oServicoController.CarregarServico(oServico, DSPesquisar.DataSet.FieldByName('idservico').AsInteger);
    edtidServico.Text := oServico.idServico.ToString;
    dbComboCategoria.KeyValue := oServico.idCategoria;

  finally
    FreeAndNil(oServico);
    FreeAndNil(oServicoController);
  end;

end;

procedure TFrmServico.CorEntrada(Sender: TObject);
begin
  inherited;
   if (Sender is TDBLookupComboBox) then
      (Sender as TDBLookupComboBox).Color:= clSkyBlue
end;

procedure TFrmServico.CorSaida(Sender: TObject);
begin
  inherited;
  if (Sender is TDBLookupComboBox) then
      (Sender as TDBLookupComboBox).Color:= clWindow;
end;

procedure TFrmServico.detalhar;
begin
  inherited;
  CarregarServico;
  HabilitarControles(ActNavegar);
  FAcao := ActNavegar;
  PagePrincipal.ActivePage := tbDados;

end;

procedure TFrmServico.Excluir;
var
  oServicoController: TControllerServico;
  msgErro:String;
begin
  oServicoController := TControllerServico.Create;
   try

    if (DSPesquisar.DataSet.Active) and (DSPesquisar.DataSet.RecordCount > 0 ) then
    begin

     if MessageDlg('Excluir o registro', mtWarning, [mbyes, mbno], 0) = IDYes then
     begin
      if oServicoController.Excluir(DSPesquisar.DataSet.FieldByName('idservico').AsInteger, msgErro ) = false then
        raise Exception.Create(msgErro);

      oServicoController.Pesquisar(EdtPesquisar.Text);

     end;
    end else
    raise Exception.Create('Nao existem registros para excluir');



  finally
    FreeAndNil(oServicoController);
  end;

end;

procedure TFrmServico.FormCreate(Sender: TObject);
begin
  inherited;
  DMServico := TDMServico.Create(nil);

end;

procedure TFrmServico.FormDestroy(Sender: TObject);
begin
  inherited;
  FreeAndNil(DMServico);
end;

procedure TFrmServico.Gravar;
var
   oServicoController: TControllerServico;
begin
  oServicoController := TControllerServico.Create;

  try
    case FAcao of
    ActNovo: inserir;
    ActAlterar: Alterar;

    end;
    oServicoController.Pesquisar(EdtPesquisar.Text);
  finally
    FreeAndNil(oServicoController);

    PagePrincipal.ActivePage := tbPesquisar;



  end;

end;

procedure TFrmServico.HabilitaCampos(Value: boolean);
begin
  edtidServico.Enabled := Value;
  dbComboCategoria.Enabled := Value;
end;

procedure TFrmServico.inserir;
var
   oServicoController: TControllerServico;
   oServico: TServico;
   msgErro:String;
begin
  oServico := TServico.Create;
  oServicoController := TControllerServico.Create;

  try
    with oServico do
    begin
      idServico := 0;
      idCategoria := dbComboCategoria.KeyValue;

    end;

    if oServicoController.Inserir(oServico,msgErro) = false then
      raise Exception.Create(msgErro);


  finally
    FreeAndNil(oServico);
    FreeAndNil(oServicoController);
  end;

end;

procedure TFrmServico.limparCampos;
begin
   edtidServico.Clear;
   dbComboCategoria.KeyValue := -1;
end;

procedure TFrmServico.Listar;
begin
  inherited;
  PagePrincipal.ActivePage :=tbPesquisar;
end;

procedure TFrmServico.Pesquisar;
var
  oServicoController: TControllerServico;
  value: integer;
begin

  oServicoController := TControllerServico.Create;
  try
    if EdtPesquisar.Text = EmptyStr then
      DSPesquisar.DataSet := DMServico.CDSConsulta2
      else
      DSPesquisar.DataSet := DMServico.CDSConsulta;


    oServicoController.Pesquisar(edtPesquisar.text);
  finally
    FreeAndNil(oServicoController);
  end;

end;



end.
