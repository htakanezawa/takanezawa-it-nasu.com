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

procedure TForm1.Button1Click(Sender: TObject);
var
  Birthday: TDate;
begin
  Birthday := TDate.Create;
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
    Birthday.Free;
  end;
end;

procedure TForm1.Button2Click(Sender: TObject);
var
  myDay: TDate;
  myNewDay: TNewDate;
  myObject: TObject;
begin
  if Sender is TButton then
    show(TButton(Sender).Caption);

  myDay := TDate.Create;
  myObject := myDay;
  myNewDay := TNewDate.Create;
  try
    show('親クラス：'+ myday.GetText);
    show('子クラス：'+ myNewDay.GetText);

    show((myObject as TDate).Gettext);

  finally
    myDay.Free;
    myNewDay.Free;
  end;
end;

procedure TForm1.Button3Click(Sender: TObject);
var
  myAnimal: TKemono;
begin
  if rbServal.Checked then
    myAnimal := TServal.Create
  else
    myAnimal := TFennec.Create;
  try
    show(myAnimal.Voice);
  finally
    myAnimal.Free;
  end;
end;

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
