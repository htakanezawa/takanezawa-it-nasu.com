unit Unit1;

interface

uses
  Windows, Messages, System.SysUtils, System.Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,

  System.Types, System.UITypes,
  System.Variants, System.DateUtils, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Year: TEdit;
    Month: TEdit;
    Day: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    Button3: TButton;
    RadioGroup1: TRadioGroup;
    rbServal: TRadioButton;
    rbFennec: TRadioButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
  private
    { Private 宣言 }
  public
    { Public 宣言 }
    procedure show(str: String);
  end;

var
  Form1: TForm1;

implementation

uses
  Unit2;

{$R *.DFM}

//うるう年判断実行のボタンクリック
procedure TForm1.Button1Click(Sender: TObject);
var //varブロックでオブジェクトの識別子宣言を行う
  Birthday: TDate;  //ここではオブジェクトの参照を保存するための識別子を宣言したのみ
begin
  Birthday := TDate.Create;  //これでオブジェクトの実データ（インスタンス）を確保して、その参照をオブジェクト識別子に代入
//  Birthday.SetValue(2020, 2, 14);
  try
    if (Length(Trim(Year.Text)) = 0) or
       (Length(Trim(Month.Text)) = 0) or
       (Length(Trim(Day.Text)) = 0) then
    begin
      ShowMessage('西暦で日付を入力してください');
      Exit;
    end;

    Birthday.SetValue(StrToIntDef(Year.Text,0), StrToIntDef(Month.Text,0), StrToIntDef(Day.Text,0));
    if Birthday.UruuDoshi then
      ShowMessage('うるう年です')
    else
      ShowMessage('うるう年ではない');
  finally
    Birthday.Free;  //これでオブジェクトのために確保したメモリを解放
  end;
end;

//親クラスと子クラスの処理の違いを見るための実行ボタン
procedure TForm1.Button2Click(Sender: TObject);
var
  myDay: TDate;        //親クラスのオブジェクト識別子
  myNewDay: TNewDate;  //子クラスのオブジェクト識別子
  myObject: TObject;   //TObject型のオブジェクト識別子を宣言
begin
  if Sender is TButton then         //Senderオブジェクト識別子に入っているオブジェクトが TButtonか判定
    show(TButton(Sender).Caption);  //SenderをTButton型にキャストし、TButton型のTextプロパティを使用

  myDay := TDate.Create;   //親オブジェクトのCreate
  myObject := myDay;
  myNewDay := TNewDate.Create; //子オブジェクトのCreate
  try
    show('親クラス：'+ myday.GetText);     //親オブジェクトのGetTextメソッドで文字列を取得して表示
    show('子クラス：'+ myNewDay.GetText);  //子オブジェクトのGetTextメソッドで文字列を取得して表示

    show((myObject as TDate).Gettext);  //myObjectをTDate型のオブジェクトとして、TdateのメソッドGetTextを使用

  finally
    myDay.Free;      //親オブジェクトの解放
    myNewDay.Free;   //子オブジェクトの解放
  end;
end;

//動物の鳴き声を表示させる
procedure TForm1.Button3Click(Sender: TObject);
var
  myAnimal: TKemono;
begin
  if rbServal.Checked then       // 選ばれているチェックボックスによって TServalかTFennecクラスのどちらかをCreate
    myAnimal := TServal.Create   // TServalのオブジェクト参照を親クラス型のオブジェクト識別子に代入
  else
    myAnimal := TFennec.Create;  // TFennecのオブジェクト参照を親クラス型のオブジェクト識別子に代入
  try
    show(myAnimal.Voice);        //選択された動物の鳴き声を表示
  finally
    myAnimal.Free;
  end;
end;

//クラス型名を渡して動物の鳴き声を表示させる
procedure TForm1.Button4Click(Sender: TObject);
begin
  if rbServal.Checked then
    show(KemonoVoice(TServal))
  else
    show(KemonoVoice(TFennec));
end;

procedure TForm1.show(str: String);
begin
  Memo1.Lines.add(str);
end;

end.
