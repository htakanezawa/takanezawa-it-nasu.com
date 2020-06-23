unit Unit1Tests;

interface

uses
  Unit1,
  TestFrameWork;

type
  TForm1Tests = class(TTestCase)
  private
    FForm1: TForm1;

  protected

    procedure SetUp; override;
    procedure TearDown; override;

  published

    // Test methods
    procedure TestCalcMy2Numbers_addition;
    procedure TestCalcMy2Numbers_subtraction;

  end;

implementation

{ TForm1Tests }

procedure TForm1Tests.SetUp;
begin
  inherited;
  FForm1 := TForm1.Create(nil);
end;

procedure TForm1Tests.TearDown;
begin
  inherited;
  FForm1.Free;
  FForm1 := nil;
end;

procedure TForm1Tests.TestCalcMy2Numbers_addition;
var
  ReturnValue: Integer;
  b: Integer;
  a: Integer;
begin
  a := 12;
  b := 12;
  // TODO: メソッド呼び出しパラメータのセットアップ
  ReturnValue := FForm1.CalcMy2Numbers_addition(a, b);
  // TODO: メソッド結果の検証

//  CheckNotEquals(24, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');

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
  // TODO: メソッド呼び出しパラメータのセットアップ
  ReturnValue := FForm1.CalcMy2Numbers_subtraction(a, b);
  // TODO: メソッド結果の検証

  CheckNotEquals(12, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(10, ReturnValue, 'Bad! Value should not equal');
//  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');

  Status('Success');
end;
initialization

  TestFramework.RegisterTest('Unit1Tests Suite',
    TForm1Tests.Suite);

end.
 