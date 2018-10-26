unit uControllerServico;

interface

uses uDMServico, uModelServico, System.SysUtils;

type

TControllerServico = class


public
    function Inserir(oServico:TServico; var msgErro: string ): Boolean;
    function Alterar(oServico:TServico; var msgErro: string ): Boolean;
    function Excluir(idservico:integer; var msgErro: string ): Boolean;
    procedure CarregarServico(oServico:TServico; idservico:integer);
    procedure Pesquisar(idServico:String);


end;

implementation

{ TControllerServico }

function TControllerServico.Alterar(oServico: TServico;
  var msgErro: string): Boolean;
begin
  result := DMServico.Alterar(oServico,msgErro);
end;

procedure TControllerServico.CarregarServico(oServico: TServico;
  idservico: integer);
begin
  DMServico.CarregaServico(oServico,idservico);
end;

function TControllerServico.Excluir(idservico: integer;
  var msgErro: string): Boolean;
begin
   result := DMServico.Excluir(idservico,msgErro);
end;

function TControllerServico.Inserir(oServico: TServico;
  var msgErro: string): Boolean;
begin
  result := DMServico.Inserir(oServico,msgErro);
end;

procedure TControllerServico.Pesquisar(idServico: String);
begin
  if idServico = '' then
   DMServico.Consultar
  else
   DMServico.Consultar(Strtoint(idServico));

end;

end.
