unit Unit2;

interface

uses
  SysUtils, DateUtils;

//https://qiita.com/kazaiso/items/b3941a234853b9cb6abb
//�ŃN���X�̊�{�I�ȊT�v���w�K���A������Ȃ���R�[�h���L�q���܂����B
//https://qiita.com/kazaiso/items/c76eac60bdd4dd075fa3
//��private, public , protected�@�B���ƌ��J�A�R���X�g���N�^, �f�X�g���N�^�ɂ��Ċw�K���Ȃ���
//�\�[�X�R�[�g��ύX���܂����B
//https://qiita.com/kazaiso/items/5d6b58966a00e91ae198
//�ŃN���X�̌p���ɂ��Ċw�K���Ȃ���
//�\�[�X�R�[�g��ύX���܂����B

type //type�u���b�N�ŃN���X��`���s��
  TDate = Class   //Tdate�Ƃ����N���X��`���ʎq���A�u = class �v�Ƃ��ăN���X��` class(TObject)�Ɠ���
    private  //�����j�b�g����͎Q�Ƃł����A�A�N�Z�X���ł��Ȃ�
             //�����I�ȃR�[�h�̉��ώ��ɂ����āA���ڃA�N�Z�X����Ă��Ȃ������t�B�[���h��ύX�����Ƃ��Ă��A�R�[�h���ς̉e�������Ȃ�
      //������ Year, Month, Day: Integer;
      FDate: TDateTime;   //���t��ێ����� TDateTime�^ �t�B�[���h

    public   //�����j�b�g����Q�ƁA�A�N�Z�X�\
      //�N���X�ɕR�Â������\�b�h
      constructor Create; overload;      //�f�t�H���g��Create�Ɠ����L�q��Overload�w��
      constructor Create(Y, M, D: Integer); overload;  //�����l��^����Create��overload

      Procedure SetValue(Y, M, D: Integer); overload;    //�N������Integer�ŃZ�b�g���郁�\�b�h
      Procedure SetValue(newDate: TDateTime); overload;  //�N������TDateTime�ŃZ�b�g���郁�\�b�h

      Function UruuDoshi: Boolean;    //���邤�N���`�F�b�N���郁�\�b�h
      Function GetText: String;       //�����j�b�g����͒��ڃt�B�[���h�ɃA�N�Z�X�ł��Ȃ��̂ŁA���t�𕶎���Ŏ擾����֐��ǉ�

    Protected   //�����j�b�g����͎g�p�ł��Ȃ��A���N���X���p������N���X�ŎQ�ƁE�A�N�Z�X�\
  end;

type
  TNewDate = class(TDate)   //TDate����h���iTDate���p���j���� �q�N���X�i�T�u�N���X�j
    public
      function GetText: String;   //�e�̎��� GetText���\�b�h��TNewDate�N���X�łɏ��������邽�߂̐錾
  end;


type
  TPerson = class  //�V����TPerson�N���X���`
    private
      FName: String;
      FBirthDay: TDate;  //�ȑO�ɒ�`�������t��������TDate�N���X���t�B�[���h�Ƃ��Ďg�p
    public
      //https://qiita.com/kazaiso/items/c76eac60bdd4dd075fa3
      constructor Create(name: String);  //�R���X�g���N�^�[ Create �̐錾
      destructor Destroy; override;      //�f�X�g���N�^ Destroy�̐錾 + override
  end;

type
  // TServal�ATFennec �̐e�N���X�ƂȂ�TKemono�N���X
  TKemono = class(TObject)   // TServel, TFennec�̐e�N���X
    public
      // Voice �������Ԃ����\�b�h�B�����͎q�ɔC���邽��virtual; abstract; �L�[���[�h�����Ă���
      function Voice: string; virtual; abstract;
  end;

  // TKemono �̎q�N���X
  TServal = class(TKemono)
    public
      // �e�N���X����Voice �������Ԃ����\�b�h abstract��Voice���\�b�h override����L�[���[�h�t��
      function Voice: string; override;
  end;

  // TKemono �̎q�N���X
  TFennec = class(TKemono)
    public
      // �e�N���X����Voice �������Ԃ����\�b�h abstract��Voice���\�b�h override����L�[���[�h�t��
      function Voice: string; override;
  end;

  TFriends = class of TKemono;  // TKemono�N���X�̌^����\�� TFriends ���`

  // �n���ꂽ�p�����[�^�ɂ��I�u�W�F�N�g��Create����
  function KemonoVoice(KemonoClassName: TFriends): String;

implementation


Procedure TDate.SetValue(Y, M, D: Integer); //�t�B�[���hTDateTime���ɔ��������ύX
begin
  //������  Year := Y; Month := M; Day := D;
  FDate := EncodeDate(Y,M,D);    //FDate�t�B�[���h�ɑ������悤�ɕύX
end;

procedure TDate.SetValue(newDate: TDateTime);  //TDateTime�^�̃p�����[�^�̎����s.�������ɂ�overload�L�[���[�h�s�v
begin
  FDate := newDate;
end;

Function TDate.UruuDoshi: Boolean;   //�t�B�[���h�ύX�ɔ��������ύX
begin
  //������ Result := IsLeapYear(Year);
  Result := IsLeapYear(YearOf(Fdate));   //FDate����N�������o���ă`�F�b�N
end;

constructor TDate.Create;   //�������ɂ�����overload�L�[���[�h�͋L�q�s�v
begin
  inherited;   //���\�b�h�����p�����[�^�������ł���� inherited �̌��̃p�����[�^�͏ȗ��\
  FDate := Date;  //�����l�Ƃ���Date�ō����̓��t����
end;

//�`���[�g���A���ɐ��������͂��邪�A���̃`���[�g���A���̒��ł͎��ۂɂ͎g���Ă��Ȃ��B
constructor TDate.Create(Y, M, D: Integer);  //�����l�L��Create.�������ɂ�����overload�L�[���[�h�͋L�q�s�v
begin
  inherited Create;  //�p�����[�^���e�N���X��Create�ƈقȂ�̂ŁA�ȗ��ł����Ainherited�̌���Create���L�q���Đe��Create�����s���邱�Ƃ𖾋L���Ă���
  FDate := EncodeDate(Y, M, D); //�w�肳�ꂽ�p�����[�^��TDateTime�^�ɕϊ����ď����l�Ƃ��đ��
end;

function TDate.GetText: String;     //�t�B�[���h�ɃA�N�Z�X���������邽�߁A�K�v����񋟂���V�K�֐�
begin
  Result := DateToStr(FDate);
end;

//�`���[�g���A���ɐ��������͂��邪�A���̃`���[�g���A���̒��ł͎��ۂɂ͎g���Ă��Ȃ��B
constructor TPerson.Create(name: String);   //�R���X�g���N�^�[ Create �̎���
                                            //�t�B�[���h�ɓ��ʂȒl���A�����l�Ƃ��ē��ꂽ���ꍇ�͂����ōs��
begin                                       //�t�B�[���h�ɃN���X���g�������ꍇ�ɂ́A������Create���ăI�u�W�F�N�g���m�ۂ��Ă���
  inherited Create;   //�p�����[�^�Ȃ��̐e�N���X��Create�����s����
  FName := name;      //Create���̏����l�Ƃ��ăt�B�[���h�ɑ��
  FBirthDay := TDate.Create;   //�t�B�[���h�Ɏg�p���Ă���TDate�^�̃N���X�̊m��
end;

destructor TPerson.Destroy;   //�f�X�g���N�^ Destroy�̐錾 (�������� override �L�[���[�h�͕s�v�j
begin
  FBirthDay.Free;     //Create���Ɋm�ۂ���FBirthDay�̔j��
  inherited;          //�������Ă��Ȃ�inherited�́A�����̃��\�b�h���ƑS���������\�b�h�����p�����[�^�̐e���\�b�h�����s����
end;

{ TNewDate }

function TNewDate.GetText: String;   //TNewDate�N���X�Őe�Ɠ�����GetText���\�b�h��V���ɋL�q
                                     //������ TNewDate�N���X�ɒ�`����Ă��Ȃ�FDate�t�B�[���h���g����̂�
                                     //�e�N���X��TDate�N���X�Œ�`����Ă����(�q�N���X�ōĒ�`���Ȃ����
                                     //�e�N���X�̃t�B�[���h�A���b�\�b�h�����̂܂܎g�����Ƃ��ł���j
begin
  Result := FormatDateTime('gge�Nm��d��(dddd)', FDate);
end;

{ TServal }

function TServal.Voice: string;  //TServal��Voice���\�b�h�����B�������ɂ�override�L�[���[�h�͕s�K�v
begin
  Result := 'meow';
end;

{ TFennec }

function TFennec.Voice: string; //TFennc��Voice���\�b�h�����B�������ɂ�override�L�[���[�h�͕s�K�v
begin
  Result := 'yelp';
end;

//�N���X�^���ɂ�蓮���̖�����Ԃ�
function KemonoVoice(KemonoClassName: TFriends): String;
var
  myAnimal: TKemono;  //�e�N���X�ƂȂ�Tkemono�̃I�u�W�F�N�g���ʎq��錾
begin
  myAnimal := KemonoClassName.Create;   //�p�����[�^�œn���ꂽ�N���X�̌^�iTServal��TFennec�j��Create
  try
    Result := myAnimal.Voice;           //�p�����[�^�œn���ꂽ�N���X�^��Create�����I�u�W�F�N�g�̃N���X���\�b�h���g�p
  finally
    myAnimal.Free;
  end;
end;

end.
