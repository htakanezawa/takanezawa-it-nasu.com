unit Unit2;

interface

uses
  SysUtils, DateUtils;

type
  TDate = Class
    private
      FDate: TDateTime;

    public
      constructor Create; overload;
      constructor Create(Y, M, D: Integer); overload;

      Procedure SetValue(Y, M, D: Integer); overload;
      Procedure SetValue(newDate: TDateTime); overload;

      Function UruuDoshi: Boolean;
      Function GetText: String;
  end;

type
  TNewDate = class(TDate)
    public
      function GetText: String;
  end;



  TPerson = class
    private
      FName: String;
      FBirthDay: TDate;
    public
      constructor Create(name: String);
      destructor Destroy; override;
  end;

implementation


Procedure TDate.SetValue(Y, M, D: Integer);
begin
  FDate := EncodeDate(Y,M,D);
end;

procedure TDate.SetValue(newDate: TDateTime);
begin
  FDate := newDate;
end;

Function TDate.UruuDoshi: Boolean;
begin
  Result := IsLeapYear(YearOf(Fdate));
end;

constructor TDate.Create;
begin
  inherited;
  FDate := Date;
end;

constructor TDate.Create(Y, M, D: Integer);
begin
  inherited Create;
  FDate := EncodeDate(Y, M, D);
end;

function TDate.GetText: String;
begin
  Result := DateToStr(FDate);
end;

constructor TPerson.Create(name: String);
begin
  inherited Create;
  FName := name;
  FBirthDay := TDate.Create;
end;

destructor TPerson.Destroy;
begin
  FBirthDay.Free;
  inherited;
end;

{ TNewDate }

function TNewDate.GetText: String;
begin
  Result := FormatDateTime('gge”NmŒŽd“ú(dddd)', FDate);
end;

end.
 