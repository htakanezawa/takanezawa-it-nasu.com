unit Unit2;

interface

uses
  SysUtils, DateUtils;

type
  TDate = Class
    private
      FDate: TDateTime;

    public
      Procedure SetValue(Y, M, D: Integer);
      Function UruuDoshi: Boolean;
      Function GetText: String;
  end;

implementation


Procedure TDate.SetValue(Y, M, D: Integer);
begin
  FDate := EncodeDate(Y,M,D);
end;

Function TDate.UruuDoshi: Boolean;
begin
  Result := IsLeapYear(YearOf(Fdate));
end;

function TDate.GetText: String;
begin
  Result := DateToStr(FDate);
end;

end.
 