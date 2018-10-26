program TesteAreco;

uses
  Vcl.Forms,

  TestFramework,
  GUITestRunner,
  ArecoCasoTeste in 'ArecoCasoTeste.pas';


{$R *.res}
{$LONGSTRINGS OFF}

begin
  Application.Initialize;
  GUITestRunner.RunRegisteredTests;
end.
