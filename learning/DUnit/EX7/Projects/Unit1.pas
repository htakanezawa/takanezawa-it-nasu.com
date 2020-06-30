unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.Buttons;

type
  TForm1 = class(TForm)
    BitBtn1: TBitBtn;
    Label1: TLabel;
    BitBtn2: TBitBtn;
    procedure BitBtn1Click(Sender: TObject);
    procedure BitBtn2Click(Sender: TObject);
  private
    { Private êÈåæ }
  public
    { Public êÈåæ }
    function CalcMy2Numbers_addition(a,b:Integer):Integer;
    function CalcMy2Numbers_subtraction(a,b:Integer):Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

{ TForm1 }

procedure TForm1.BitBtn1Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(CalcMy2Numbers_addition(12,12));
end;

procedure TForm1.BitBtn2Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(CalcMy2Numbers_subtraction(12,2));
end;

function TForm1.CalcMy2Numbers_addition(a, b: Integer): Integer;
var
  Myavar : Integer;
begin
  Myavar := a + b;
  result := Myavar;
end;

function TForm1.CalcMy2Numbers_subtraction(a, b: Integer): Integer;
var
  Myavar : Integer;
begin
  Myavar := a - b;
  result := Myavar;
end;

end.
