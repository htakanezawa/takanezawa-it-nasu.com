unit Unit1;    // �e�X�g�Ώۃ��j�b�g

interface

uses
  Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
  StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    Label1: TLabel;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private �錾 }
  public
    { Public �錾 }
    function CalcMy2Numbers_addition(a,b:Integer):Integer;
    function CalcMy2Numbers_subtraction(a,b:Integer):Integer;
  end;

var
  Form1: TForm1;

implementation

{$R *.DFM}

{ TForm1 }

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

procedure TForm1.Button1Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(CalcMy2Numbers_addition(12,12));
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
  Label1.Caption := IntToStr(CalcMy2Numbers_subtraction(12,2));
end;

end.
