unit TestUnit1;
{

  Delphi DUnit �e�X�g �P�[�X
  ----------------------
  ���̃��j�b�g�ɂ́A�e�X�g �P�[�X �E�B�U�[�h�Ő������ꂽ�X�P���g�� �e�X�g �P�[�X �N���X���܂܂�Ă��܂��B
  �������ꂽ�R�[�h�𐳂����Z�b�g�A�b�v�ł���悤�ɏC�����A�e�X�g�Ώۃ��j�b�g�̃��\�b�h�� 
  �Ăяo���܂��B

}

interface

uses
  TestFramework, System.SysUtils, Vcl.Graphics, Vcl.StdCtrls, Winapi.Windows,
  System.Variants, System.Classes, Vcl.Dialogs, Vcl.Controls, Vcl.Forms,
  Winapi.Messages, Unit1, Vcl.Buttons;

type
  // �N���X�̃e�X�g ���\�b�h TForm1

  TestTForm1 = class(TTestCase)
  strict private
    FForm1: TForm1;
  public
    procedure SetUp; override;
    procedure TearDown; override;
  published
    procedure TestCalcMy2Numbers;
  end;

implementation

procedure TestTForm1.SetUp;
begin
  FForm1 := TForm1.Create(nil);
end;

procedure TestTForm1.TearDown;
begin
  FForm1.Free;
  FForm1 := nil;
end;

procedure TestTForm1.TestCalcMy2Numbers;
var
  ReturnValue: Integer;
  b: Integer;
  a: Integer;
begin
  a := 12;
  b := 12;
  // TODO: ���\�b�h�Ăяo���p�����[�^�̃Z�b�g�A�b�v
  ReturnValue := FForm1.CalcMy2Numbers(a, b);
  // TODO: ���\�b�h���ʂ̌���

//  CheckNotEquals(24, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');

  Status('Success');
end;

initialization
  // �e�X�g �P�[�X���e�X�g �����i�[�ɓo�^����
  RegisterTest(TestTForm1.Suite);
end.

