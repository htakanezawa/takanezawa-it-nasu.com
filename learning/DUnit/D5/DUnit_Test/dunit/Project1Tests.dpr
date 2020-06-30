// Uncomment the following directive to create a console application
// or leave commented to create a GUI application...
// {$APPTYPE CONSOLE}

program Project1Tests;              // テストプロジェクト

uses
  TestFramework {$IFDEF LINUX},
  QForms,
  QGUITestRunner {$ELSE},
  Forms,
  GUITestRunner {$ENDIF},
  TextTestRunner,
  Unit1 in '..\Unit1.pas' {Form1},  //テスト対象のユニット これは手動で追加した
  Unit1Tests in 'Unit1Tests.pas';



{$R *.RES}

begin
  Application.Initialize;

{$IFDEF LINUX}
  QGUITestRunner.RunRegisteredTests;
{$ELSE}
  if System.IsConsole then
    TextTestRunner.RunRegisteredTests
  else
    GUITestRunner.RunRegisteredTests;
{$ENDIF}

end.

