unit UMain;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Menus, Vcl.ComCtrls,
  Vcl.ExtCtrls, System.ImageList, Vcl.ImgList, Vcl.Imaging.pngimage, ufrmServico,
  ufrmItem, uDMItem, Data.DB, Vcl.Grids, Vcl.DBGrids;

type
  TFrmPrincipal = class(TForm)
    MainMenu1: TMainMenu;
    Categorias1: TMenuItem;
    Servios1: TMenuItem;
    Item1: TMenuItem;
    StatusBar1: TStatusBar;
    Timer1: TTimer;
    Panel1: TPanel;
    Image1: TImage;
    Bevel1: TBevel;
    Image2: TImage;
    Bevel2: TBevel;
    Image3: TImage;
    Categorias2: TMenuItem;
    Servicos1: TMenuItem;
    Item2: TMenuItem;
    N1: TMenuItem;
    Sair1: TMenuItem;
    Report11: TMenuItem;
    Repot21: TMenuItem;
    Report31: TMenuItem;
    Sobre1: TMenuItem;
    ImageList1: TImageList;
    Image4: TImage;
    Bevel3: TBevel;
    Image5: TImage;
    GroupBox1: TGroupBox;
    ListBox1: TListBox;
    procedure Categorias1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure Sobre1Click(Sender: TObject);
    procedure Sair1Click(Sender: TObject);
    procedure Servicos1Click(Sender: TObject);
    procedure Item2Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
    procedure AbrirCategoria;
    procedure AbrirServico;
    procedure chamarFormulario(formulario:TForm);
    procedure listarItems;
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

uses ufrmCategoria;

{ TFrmPrincipal }

procedure TFrmPrincipal.AbrirCategoria;
begin
  FrmCategoria := TFrmCategoria.Create(self);
  chamarFormulario(FrmCategoria);
  
end;

procedure TFrmPrincipal.AbrirServico;
begin
  FrmServico := TFrmServico.Create(self);
  chamarFormulario(FrmServico);
end;

procedure TFrmPrincipal.Categorias1Click(Sender: TObject);
begin
  AbrirCategoria;
end;

procedure TFrmPrincipal.chamarFormulario(formulario: TForm);
begin

   try
     formulario.ShowModal;
   finally
     FreeAndNil(formulario);
   end;
end;

procedure TFrmPrincipal.FormShow(Sender: TObject);
begin
  listarItems;
end;

procedure TFrmPrincipal.Item2Click(Sender: TObject);
begin
  FrmItem := TFrmItem.Create(self);
  chamarFormulario(FrmItem);
end;

procedure TFrmPrincipal.listarItems;
begin
  DMItem := TDMItem.Create(self);
  DMItem.CDSItens.Open;
    while not DMItem.CDSItens.eof do
    begin
    ListBox1.items.add(DMItem.CDSItens.FieldByName('nome').value);
    DMItem.CDSItens.Next;
    end;
end;

procedure TFrmPrincipal.Sair1Click(Sender: TObject);
begin
    Application.Terminate;
end;

procedure TFrmPrincipal.Servicos1Click(Sender: TObject);
begin
  AbrirServico;
end;

procedure TFrmPrincipal.Sobre1Click(Sender: TObject);
begin
  ShowMessage('Its a long way to the top if you wanna rock n roll!');
end;

procedure TFrmPrincipal.Timer1Timer(Sender: TObject);
begin
  StatusBar1.Panels[1].Text := TimeToStr(time);
end;

end.
