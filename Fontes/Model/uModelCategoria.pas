unit uModelCategoria;

interface

uses
 System.SysUtils, UModelBase;

type
  TCategoria = class(TModelBase)
  private
    FCodigo: String;
    FID: integer;
    FNome: String;
    procedure SetNome(const Value: String);


  public
    property ID: integer read FID write FID;
    property Codigo: String read FCodigo write FCodigo;
    property Nome: String read FNome write SetNome;


  end;

implementation



procedure TCategoria.SetNome(const Value: String);
begin
  if Value = EmptyStr then
  begin
    raise Exception.Create('''Nome'' precisa ser preenchido.');

  end;
   FNome := Value;

end;

end.
