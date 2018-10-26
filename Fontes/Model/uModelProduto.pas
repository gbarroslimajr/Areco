unit uModelProduto;

interface

uses uModelBase;

type
  TProduto = class(TModelBase)
  private
    Fiditem: integer;
    Fpeso: Real;
    Faltura: Real;
    Fidproduto: integer;


  public
    property idproduto: integer read Fidproduto write Fidproduto;
    property iditem: integer read Fiditem write Fiditem;
    property peso: Real read Fpeso write Fpeso;
    property altura: Real read Faltura write Faltura;


  end;

implementation



end.
