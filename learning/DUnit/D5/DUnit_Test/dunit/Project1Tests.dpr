// Uncomment the following directive to create a console application
// or leave commented to create a GUI application...
// {$APPTYPE CONSOLE}

program Project1Tests;              // �e�X�g�v���W�F�N�g

uses
  TestFramework {$IFDEF LINUX},
  QForms,
  QGUITestRunner {$ELSE},
  Forms,
  GUITestRunner {$ENDIF},
  TextTestRunner,
  Unit1 in '..\Unit1.pas' {Form1},  //�e�X�g�Ώۂ̃��j�b�g ����͎蓮�Œǉ�����
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

