unit Unit2;

interface

uses
  SysUtils, DateUtils;

//https://qiita.com/kazaiso/items/b3941a234853b9cb6abb
//でクラスの基本的な概要を学習し、例を見ながらコードを記述しました。
//https://qiita.com/kazaiso/items/c76eac60bdd4dd075fa3
//でprivate, public , protected　隠蔽と公開、コンストラクタ, デストラクタについて学習しながら
//ソースコートを変更しました。
//https://qiita.com/kazaiso/items/5d6b58966a00e91ae198
//でクラスの継承について学習しながら
//ソースコートを変更しました。

type //typeブロックでクラス定義を行う
  TDate = Class   //Tdateというクラス定義識別子を、「 = class 」としてクラス定義 class(TObject)と同じ
    private  //他ユニットからは参照できず、アクセスもできない
             //将来的なコードの改変時において、直接アクセスされていない内部フィールドを変更したとしても、コード改変の影響が少ない
      //旧実装 Year, Month, Day: Integer;
      FDate: TDateTime;   //日付を保持する TDateTime型 フィールド

    public   //他ユニットから参照、アクセス可能
      //クラスに紐づいたメソッド
      constructor Create; overload;      //デフォルトのCreateと同じ記述でOverload指定
      constructor Create(Y, M, D: Integer); overload;  //初期値を与えるCreateのoverload

      Procedure SetValue(Y, M, D: Integer); overload;    //年月日をIntegerでセットするメソッド
      Procedure SetValue(newDate: TDateTime); overload;  //年月日をTDateTimeでセットするメソッド

      Function UruuDoshi: Boolean;    //うるう年かチェックするメソッド
      Function GetText: String;       //他ユニットからは直接フィールドにアクセスできないので、日付を文字列で取得する関数追加

    Protected   //他ユニットからは使用できない、当クラスを継承するクラスで参照・アクセス可能
  end;

type
  TNewDate = class(TDate)   //TDateから派生（TDateを継承）する 子クラス（サブクラス）
    public
      function GetText: String;   //親の持つ GetTextメソッドをTNewDateクラス版に書き換えるための宣言
  end;


type
  TPerson = class  //新たにTPersonクラスを定義
    private
      FName: String;
      FBirthDay: TDate;  //以前に定義した日付情報をもつTDateクラスをフィールドとして使用
    public
      //https://qiita.com/kazaiso/items/c76eac60bdd4dd075fa3
      constructor Create(name: String);  //コンストラクター Create の宣言
      destructor Destroy; override;      //デストラクタ Destroyの宣言 + override
  end;

type
  // TServal、TFennec の親クラスとなるTKemonoクラス
  TKemono = class(TObject)   // TServel, TFennecの親クラス
    public
      // Voice 文字列を返すメソッド。実装は子に任せるためvirtual; abstract; キーワードをつけている
      function Voice: string; virtual; abstract;
  end;

  // TKemono の子クラス
  TServal = class(TKemono)
    public
      // 親クラス内のVoice 文字列を返すメソッド abstractのVoiceメソッド overrideするキーワード付き
      function Voice: string; override;
  end;

  // TKemono の子クラス
  TFennec = class(TKemono)
    public
      // 親クラス内のVoice 文字列を返すメソッド abstractのVoiceメソッド overrideするキーワード付き
      function Voice: string; override;
  end;

  TFriends = class of TKemono;  // TKemonoクラスの型名を表す TFriends を定義

  // 渡されたパラメータによりオブジェクトをCreateする
  function KemonoVoice(KemonoClassName: TFriends): String;

implementation


Procedure TDate.SetValue(Y, M, D: Integer); //フィールドTDateTime化に伴い実装変更
begin
  //旧実装  Year := Y; Month := M; Day := D;
  FDate := EncodeDate(Y,M,D);    //FDateフィールドに代入するように変更
end;

procedure TDate.SetValue(newDate: TDateTime);  //TDateTime型のパラメータの時実行.実装部にはoverloadキーワード不要
begin
  FDate := newDate;
end;

Function TDate.UruuDoshi: Boolean;   //フィールド変更に伴い実装変更
begin
  //旧実装 Result := IsLeapYear(Year);
  Result := IsLeapYear(YearOf(Fdate));   //FDateから年情報を取り出してチェック
end;

constructor TDate.Create;   //実装部においてoverloadキーワードは記述不要
begin
  inherited;   //メソッド名もパラメータも同じであれば inherited の後ろのパラメータは省略可能
  FDate := Date;  //初期値としてDateで今日の日付を代入
end;

//チュートリアルに説明だけはあるが、このチュートリアルの中では実際には使われていない。
constructor TDate.Create(Y, M, D: Integer);  //初期値有のCreate.実装部においてoverloadキーワードは記述不要
begin
  inherited Create;  //パラメータが親クラスのCreateと異なるので、省略できず、inheritedの後ろにCreateを記述して親のCreateを実行することを明記している
  FDate := EncodeDate(Y, M, D); //指定されたパラメータをTDateTime型に変換して初期値として代入
end;

function TDate.GetText: String;     //フィールドにアクセス制限があるため、必要情報を提供する新規関数
begin
  Result := DateToStr(FDate);
end;

//チュートリアルに説明だけはあるが、このチュートリアルの中では実際には使われていない。
constructor TPerson.Create(name: String);   //コンストラクター Create の実装
                                            //フィールドに特別な値を、初期値として入れたい場合はここで行う
begin                                       //フィールドにクラスを使いたい場合には、ここでCreateしてオブジェクトを確保しておく
  inherited Create;   //パラメータなしの親クラスのCreateを実行する
  FName := name;      //Create時の初期値としてフィールドに代入
  FBirthDay := TDate.Create;   //フィールドに使用しているTDate型のクラスの確保
end;

destructor TPerson.Destroy;   //デストラクタ Destroyの宣言 (実装部に override キーワードは不要）
begin
  FBirthDay.Free;     //Create時に確保したFBirthDayの破棄
  inherited;          //何もついていないinheritedは、実装のメソッド名と全く同じメソッド名＆パラメータの親メソッドを実行する
end;

{ TNewDate }

function TNewDate.GetText: String;   //TNewDateクラスで親と同名のGetTextメソッドを新たに記述
                                     //ここで TNewDateクラスに定義されていないFDateフィールドが使えるのは
                                     //親クラスのTDateクラスで定義されている為(子クラスで再定義しなければ
                                     //親クラスのフィールド、メッソッドをそのまま使うことができる）
begin
  Result := FormatDateTime('gge年m月d日(dddd)', FDate);
end;

{ TServal }

function TServal.Voice: string;  //TServalのVoiceメソッド実装。実装部にはoverrideキーワードは不必要
begin
  Result := 'meow';
end;

{ TFennec }

function TFennec.Voice: string; //TFenncのVoiceメソッド実装。実装部にはoverrideキーワードは不必要
begin
  Result := 'yelp';
end;

//クラス型名により動物の鳴き声を返す
function KemonoVoice(KemonoClassName: TFriends): String;
var
  myAnimal: TKemono;  //親クラスとなるTkemonoのオブジェクト識別子を宣言
begin
  myAnimal := KemonoClassName.Create;   //パラメータで渡されたクラスの型（TServalかTFennec）をCreate
  try
    Result := myAnimal.Voice;           //パラメータで渡されたクラス型でCreateしたオブジェクトのクラスメソッドを使用
  finally
    myAnimal.Free;
  end;
end;

end.
