unit Unit1Tests;         // �e�X�g���W���[��

interface

uses
  Unit1,
  TestFrameWork;

type
  TForm1Tests = class(TTestCase)
  private
    FForm1: TForm1;      //�e�X�g�Ώۃ��j�b�g�̃t�H�[�����`

  protected

    procedure SetUp; override;      //�e�X�g�O�̏�����
    procedure TearDown; override;   //�e�X�g��̔j��

  published

    // Test methods
    procedure TestCalcMy2Numbers_addition;     //�v�Z���ʂ𔻒f����e�X�g���\�b�h
    procedure TestCalcMy2Numbers_subtraction;

  end;

implementation

{ TForm1Tests }

//�e�X�g�O�̏�����
procedure TForm1Tests.SetUp;
begin
  inherited;
  FForm1 := TForm1.Create(nil);
end;

//�e�X�g��̔j��
procedure TForm1Tests.TearDown;
begin
  inherited;
  FForm1.Free;       //�e�X�g�Ώۃ��j�b�g�̃t�H�[���̃C���X�^���X��j��
  FForm1 := nil;
end;

//�v�Z���ʂ𔻒f����e�X�g���\�b�h
procedure TForm1Tests.TestCalcMy2Numbers_addition;
var
  ReturnValue: Integer;
  b: Integer;
  a: Integer;
begin
  a := 12;
  b := 12;
  // TODO: ���\�b�h�Ăяo���p�����[�^�̃Z�b�g�A�b�v
  ReturnValue := FForm1.CalcMy2Numbers_addition(a, b);
  // TODO: ���\�b�h���ʂ̌���

//  CheckNotEquals(24, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');  //�v�Z���ʂ������������`�F�b�N

  Status('Success');
end;

procedure TForm1Tests.TestCalcMy2Numbers_subtraction;
var
  ReturnValue: Integer;
  b: Integer;
  a: Integer;
begin
  a := 12;
  b := 2;
  // TODO: ���\�b�h�Ăяo���p�����[�^�̃Z�b�g�A�b�v
  ReturnValue := FForm1.CalcMy2Numbers_subtraction(a, b);
  // TODO: ���\�b�h���ʂ̌���

  CheckNotEquals(12, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(10, ReturnValue, 'Bad! Value should not equal');
//  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');

  Status('Success');
end;

initialization

  TestFramework.RegisterTest('Unit1Tests Suite',
    TForm1Tests.Suite);

end.
 