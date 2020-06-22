unit TestUnit1;
{

  Delphi DUnit テスト ケース
  ----------------------
  このユニットには、テスト ケース ウィザードで生成されたスケルトン テスト ケース クラスが含まれています。
  生成されたコードを正しくセットアップできるように修正し、テスト対象ユニットのメソッドを 
  呼び出します。

}

interface

uses
  TestFramework, System.SysUtils, Vcl.Graphics, Vcl.StdCtrls, Winapi.Windows,
  System.Variants, System.Classes, Vcl.Dialogs, Vcl.Controls, Vcl.Forms,
  Winapi.Messages, Unit1, Vcl.Buttons;

type
  // クラスのテスト メソッド TForm1

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
  // TODO: メソッド呼び出しパラメータのセットアップ
  ReturnValue := FForm1.CalcMy2Numbers(a, b);
  // TODO: メソッド結果の検証

//  CheckNotEquals(24, ReturnValue, 'Bad! Value should not equal');
  CheckEquals(24, ReturnValue, 'Bad! Value should not equal');

  Status('Success');
end;

initialization
  // テスト ケースをテスト ランナーに登録する
  RegisterTest(TestTForm1.Suite);
end.

