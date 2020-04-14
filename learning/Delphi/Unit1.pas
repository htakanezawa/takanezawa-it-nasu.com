unit Unit1;

interface

uses
  Windows, Messages, System.SysUtils, System.Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls,

  System.Types, System.UITypes,
  System.Variants, System.DateUtils;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Year: TEdit;
    Month: TEdit;
    Day: TEdit;
    Button2: TButton;
    Memo1: TMemo;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
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
    Birthday.SetValue(StrToIntDef(Year.Text,0), StrToIntDef(Month.Text,0), StrToIntDef(Day.Text,0));
    if Birthday.UruuDoshi then
      ShowMessage('���邤�N�ł�')
    else
      ShowMessage('���邤�N�ł͂Ȃ�');
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
    show('�e�N���X�F'+ myday.GetText);
    show('�q�N���X�F'+ myNewDay.GetText);


  finally
    myDay.Free;
    myNewDay.Free;
  end;
end;

procedure TForm1.show(str: String);
begin
  Memo1.Lines.add(str);
end;

end.
