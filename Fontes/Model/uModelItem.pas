unit uModelItem;

interface

uses uModelBase, uModelProduto, System.Sysutils;

type
  TItem = class(TModelBase)
  private
    Fidtem: integer;
    Fdescricao: string;
    Fcodigo: string;
    Fvalorunitario: Real;
    Fnome: string;
    Fidservico: integer;
    FoProduto: TProduto;




  public
    constructor Create;
    destructor Destroy; override;

    property idtem: integer read Fidtem write Fidtem;
    property codigo: string read Fcodigo write Fcodigo;
    property nome: string read Fnome write Fnome;
    property descricao: string read Fdescricao write Fdescricao;
    property valorunitario: Real read Fvalorunitario write Fvalorunitario;
    property idservico: integer read Fidservico write Fidservico;
    property oProduto: TProduto read FoProduto write FoProduto;

  end;

implementation




{ TItem }

constructor TItem.Create;
begin
  FoProduto := TProduto.Create;
end;

destructor TItem.Destroy;
begin
  FreeAndNil(FoProduto);
end;

end.
