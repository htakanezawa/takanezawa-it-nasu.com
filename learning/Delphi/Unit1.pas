unit Unit1;

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Year: TEdit;
    Month: TEdit;
    Day: TEdit;
    procedure Button1Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
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
  Birthday.SetValue(StrToIntDef(Year.Text,0), StrToIntDef(Month.Text,0), StrToIntDef(Day.Text,0));
  if Birthday.UruuDoshi then ShowMessage('���邤�N�ł�')
  else ShowMessage('���邤�N�ł͂Ȃ�');
  Birthday.Free;
end;

end.
