unit ArecoCasoTeste;

interface

uses
    TestFrameWork;


type
  TCasoTeste = Class(TTestCase)

  published
    procedure PrimeiroTeste;

  end;


implementation

{ TCasoTeste }

procedure TCasoTeste.PrimeiroTeste;
begin
   check(1+1=2,' Falha matematica catastrofica');
end;

initialization
    TestFrameWork.RegisterTest(TCasoTeste.Suite);


end.
