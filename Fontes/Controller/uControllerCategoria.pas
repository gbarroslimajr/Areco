unit uControllerCategoria;

interface

uses
uModelCategoria, uDMCategoria;




type

  TControllerCategoria = class

  public
    function Inserir(oCategoria:TCategoria; var msgErro: string ): Boolean;
    function Alterar(oCategoria:TCategoria; var msgErro: string ): Boolean;
    function Excluir(IDCategoria:integer; var msgErro: string ): Boolean;
    procedure CarregarCategoria(oCategoria:TCategoria; idCategoria:integer);
    procedure Pesquisar(NomeCategoria:String);
  end;

implementation



{ TCategoria }

function TControllerCategoria.Alterar(oCategoria: TCategoria;
  var msgErro: string): Boolean;
begin
  result := dmCategoria.Alterar(oCategoria,msgErro);
end;

procedure TControllerCategoria.CarregarCategoria(oCategoria: TCategoria;
  idCategoria: integer);
begin
   dmCategoria.CarregaCategoria(oCategoria,idCategoria);
end;

function TControllerCategoria.Excluir(IDCategoria: integer;
  var msgErro: string): Boolean;
begin
   result := dmCategoria.Excluir(IDCategoria,msgErro);
end;

function TControllerCategoria.Inserir(oCategoria: TCategoria;
  var msgErro: string): Boolean;
begin
   result := dmCategoria.Inserir(oCategoria,msgErro);

end;

procedure TControllerCategoria.Pesquisar(NomeCategoria: String);
begin
   dmCategoria.Consultar(NomeCategoria);
end;

end.
