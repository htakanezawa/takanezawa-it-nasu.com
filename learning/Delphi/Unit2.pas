unit Unit2;

interface

uses
  SysUtils;

type
  TDate = Class
    Year, Month, Day: Integer;

    Procedure SetValue(Y, M, D: Integer);
    Function UruuDoshi: Boolean;
  end;

implementation

Procedure TDate.SetValue(Y, M, D: Integer);
begin
  Year := Y;
  Month := M;
  Day := D;
end;

Function TDate.UruuDoshi: Boolean;
begin
  Result := IsLeapYear(Year);
end;

end.
 