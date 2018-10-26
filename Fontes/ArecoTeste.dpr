program ArecoTeste;

uses
  Vcl.Forms,
  UMain in 'View\UMain.pas' {FrmPrincipal},
  UBase in 'View\UBase.pas' {FrmBase},
  uModelCategoria in 'Model\uModelCategoria.pas',
  uModelServico in 'Model\uModelServico.pas',
  uModelProduto in 'Model\uModelProduto.pas',
  uModelItem in 'Model\uModelItem.pas',
  uModelBase in 'Model\uModelBase.pas',
  uControllerCategoria in 'Controller\uControllerCategoria.pas',
  uDMConexao in 'DAO\uDMConexao.pas' {DMConexao: TDataModule},
  uDMBase in 'DAO\uDMBase.pas' {DMBase: TDataModule},
  uDMCategoria in 'DAO\uDMCategoria.pas' {DMCategoria: TDataModule},
  ufrmCategoria in 'View\ufrmCategoria.pas' {FrmCategoria},
  uDMServico in 'DAO\uDMServico.pas' {DMServico: TDataModule},
  uDMProduto in 'DAO\uDMProduto.pas' {DMProduto: TDataModule},
  uDMItem in 'DAO\uDMItem.pas' {DMItem: TDataModule},
  uControllerServico in 'Controller\uControllerServico.pas',
  uControllerProduto in 'Controller\uControllerProduto.pas',
  uControllerItem in 'Controller\uControllerItem.pas',
  ufrmServico in 'View\ufrmServico.pas' {FrmServico},
  ufrmItem in 'View\ufrmItem.pas' {FrmItem};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;
end.
