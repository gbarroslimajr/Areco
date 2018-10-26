unit uControllerItem;

interface

uses uDMItem, uModelItem;

type

  TControllerItem = class

  public
    function Inserir(oItem:TItem; var msgErro: string ): Boolean;
    function Alterar(oItem:TItem; var msgErro: string ): Boolean;
    function Excluir(iditem:integer; var msgErro: string ): Boolean;
    procedure CarregarItem(oItem:TItem; iditem:integer);
    procedure Pesquisar(Nome:String);
  end;



implementation

{ TControllerItem }

function TControllerItem.Alterar(oItem: TItem;
  var msgErro: string): Boolean;
begin
  result := DMItem.Alterar(oItem,msgErro);
end;

procedure TControllerItem.CarregarItem(oItem:TItem; iditem:integer);
begin
  DMItem.CarregaItem(oItem,iditem);
end;

function TControllerItem.Excluir(iditem: integer;
  var msgErro: string): Boolean;
begin
  result := DMItem.Excluir(iditem,msgErro);
end;

function TControllerItem.Inserir(oItem: TItem;
  var msgErro: string): Boolean;
begin
  result := DMItem.Inserir(oItem,msgErro);
end;

procedure TControllerItem.Pesquisar(Nome: String);
begin
  DMItem.Consultar(Nome);

end;

end.
