unit UBase;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.ComCtrls, Vcl.Menus;

type
  TAcao = (ActNovo, ActAlterar, ActNavegar);
  TFrmBase = class(TForm)
    PnBarraRodape: TPanel;
    btnFechar: TButton;
    PagePrincipal: TPageControl;
    tbPesquisar: TTabSheet;
    tbDados: TTabSheet;
    pnBtnPesquisar: TPanel;
    btndetalhar: TButton;
    btnnovo: TButton;
    btnexcluir: TButton;
    pnFiltro: TPanel;
    EdtPesquisar: TLabeledEdit;
    btnpesquisar: TButton;
    DBGrid1: TDBGrid;
    DSPesquisar: TDataSource;
    Panel1: TPanel;
    btnalterar: TButton;
    btnlistar: TButton;
    btngravar: TButton;
    btncancelar: TButton;
    PopupMenu1: TPopupMenu;
    Detalhar1: TMenuItem;
    N1: TMenuItem;
    Excluir1: TMenuItem;
    procedure FormShow(Sender: TObject);
    procedure FormKeyPress(Sender: TObject; var Key: Char);
    procedure btnpesquisarClick(Sender: TObject);
    procedure btndetalharClick(Sender: TObject);
    procedure btnexcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnlistarClick(Sender: TObject);
    procedure btngravarClick(Sender: TObject);
    procedure btncancelarClick(Sender: TObject);
    procedure btnnovoClick(Sender: TObject);
    procedure btnalterarClick(Sender: TObject);
    procedure EdtPesquisarEnter(Sender: TObject);
    procedure EdtPesquisarExit(Sender: TObject);
  private

    procedure Novo;
    procedure Configuracoes;




  protected
    procedure HabilitarControles(Acao:TAcao);
    procedure Excluir; virtual;
    procedure Listar; virtual;
    procedure Gravar; virtual;
    procedure Pesquisar; virtual;
    procedure Alterar; virtual;
    procedure Detalhar; virtual;
    procedure CorEntrada(Sender: TObject); virtual;
    procedure CorSaida(Sender: TObject); virtual;
    procedure Limparcampos; virtual;
    procedure HabilitaCampos(Value:boolean); virtual;

  public
    FAcao: TAcao;
  end;

var
  FrmBase: TFrmBase;

implementation

{$R *.dfm}



{ TFrmBase }




procedure TFrmBase.Alterar;
begin

end;

procedure TFrmBase.btnalterarClick(Sender: TObject);
begin
  FAcao := ActAlterar;
  HabilitarControles(ActAlterar);
  HabilitaCampos(true);
end;

procedure TFrmBase.btncancelarClick(Sender: TObject);
begin
   FAcao := ActAlterar;
   HabilitarControles(ActNavegar);
   Limparcampos;
end;

procedure TFrmBase.btndetalharClick(Sender: TObject);
begin
    Detalhar;

end;

procedure TFrmBase.btnexcluirClick(Sender: TObject);
begin
  excluir;
end;

procedure TFrmBase.btnFecharClick(Sender: TObject);
begin
   close;
end;

procedure TFrmBase.btngravarClick(Sender: TObject);
begin
  Gravar;
  HabilitarControles(ActNavegar);
end;

procedure TFrmBase.btnlistarClick(Sender: TObject);
begin
   Listar;
end;

procedure TFrmBase.btnnovoClick(Sender: TObject);
begin
   Novo;
  HabilitarControles(ActNovo);
  Habilitacampos(true);
end;

procedure TFrmBase.btnpesquisarClick(Sender: TObject);
begin
    Pesquisar;
end;

procedure TFrmBase.Configuracoes;
begin
  tbPesquisar.TabVisible := false;
  tbDados.TabVisible := false;
  PagePrincipal.ActivePage := tbPesquisar;
end;

procedure TFrmBase.CorEntrada(Sender: TObject);
begin

end;

procedure TFrmBase.CorSaida(Sender: TObject);
begin

end;

procedure TFrmBase.Detalhar;
begin
  HabilitaCampos(false);


end;

procedure TFrmBase.EdtPesquisarEnter(Sender: TObject);
begin
  CorEntrada(Sender);
end;

procedure TFrmBase.EdtPesquisarExit(Sender: TObject);
begin
  CorSaida(Sender);
end;

procedure TFrmBase.Excluir;
begin

end;

procedure TFrmBase.FormKeyPress(Sender: TObject; var Key: Char);
begin
  if Key = #13 then
  begin
    Key := #0;
    Perform(WM_NEXTDLGCTL, 0, 0);

  end;
end;

procedure TFrmBase.FormShow(Sender: TObject);
begin

  Configuracoes;
end;

procedure TFrmBase.Gravar;
begin
   Limparcampos;
end;

procedure TFrmBase.HabilitarControles(Acao: TAcao);
begin
  case Acao of
    ActNovo, ActAlterar:
    begin

      btnlistar.Enabled := false;
      btnFechar.Enabled := false;
      btnalterar.Enabled := false;
      btngravar.Enabled := true;
      btncancelar.Enabled := true;
    end;

    ActNavegar:
    begin

      btnlistar.Enabled := true;
      btnFechar.Enabled := true;
      btnalterar.Enabled := true;
      btngravar.Enabled := false;
      btncancelar.Enabled := true;
      PagePrincipal.ActivePage := tbPesquisar;
    end;


  end;
end;




procedure TFrmBase.HabilitaCampos(Value: boolean);
begin

end;

procedure TFrmBase.Limparcampos;
begin

end;

procedure TFrmBase.Listar;
begin

end;

procedure TFrmBase.Novo;
begin
  FAcao := ActNovo;
  Limparcampos;
  PagePrincipal.ActivePage := tbDados;

end;



procedure TFrmBase.Pesquisar;
begin

end;

end.
