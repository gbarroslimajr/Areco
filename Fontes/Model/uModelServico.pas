unit uModelServico;

interface

uses uModelBase, uModelCategoria;

type
  TServico = class(TModelBase)
  private
    FidServico: integer;
    FidCategoria: integer;
  

  public
    property idServico: integer read FidServico write FidServico;
    property idCategoria: integer read FidCategoria write FidCategoria;


  end;

implementation

{ TModelServico }



end.
