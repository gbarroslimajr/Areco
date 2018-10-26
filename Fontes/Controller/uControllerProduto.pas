unit uControllerProduto;

interface

uses uDMProduto, uModelProduto;

type

  TControllerProduto = class

  public
    function Inserir(oProduto:TProduto; var msgErro: string ): Boolean;
    function Alterar(oProduto:TProduto; var msgErro: string ): Boolean;
    function Excluir(idproduto:integer; var msgErro: string ): Boolean;
    procedure CarregarProduto(oProduto:TProduto; idproduto:integer);
    procedure Pesquisar(idproduto:integer);

  end;

implementation

{ TControllerProduto }

function TControllerProduto.Alterar(oProduto: TProduto;
  var msgErro: string): Boolean;
begin
  result := DMProduto.Alterar(oProduto,msgErro);
end;

procedure TControllerProduto.CarregarProduto(oProduto: TProduto;
  idproduto: integer);
begin
  DMProduto.CarregaProduto(oProduto,idproduto);
end;

function TControllerProduto.Excluir(idproduto: integer;
  var msgErro: string): Boolean;
begin
  result := DMProduto.Excluir(idproduto,msgErro);
end;

function TControllerProduto.Inserir(oProduto: TProduto;
  var msgErro: string): Boolean;
begin
  result := DMProduto.Inserir(oProduto,msgErro);
end;

procedure TControllerProduto.Pesquisar(idproduto: integer);
begin
  DMProduto.Consultar(idproduto);
end;

end.
