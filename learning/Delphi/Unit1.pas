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

//���邤�N���f���s�̃{�^���N���b�N
procedure TForm1.Button1Click(Sender: TObject);
var //var�u���b�N�ŃI�u�W�F�N�g�̎��ʎq�錾���s��
  Birthday: TDate;  //�����ł̓I�u�W�F�N�g�̎Q�Ƃ�ۑ����邽�߂̎��ʎq��錾�����̂�
begin
  Birthday := TDate.Create;  //����ŃI�u�W�F�N�g�̎��f�[�^�i�C���X�^���X�j���m�ۂ��āA���̎Q�Ƃ��I�u�W�F�N�g���ʎq�ɑ��
//  Birthday.SetValue(2020, 2, 14);
  try
    if (Length(Trim(Year.Text)) = 0) or
       (Length(Trim(Month.Text)) = 0) or
       (Length(Trim(Day.Text)) = 0) then
    begin
      ShowMessage('����œ��t����͂��Ă�������');
      Exit;
    end;

    Birthday.SetValue(StrToIntDef(Year.Text,0), StrToIntDef(Month.Text,0), StrToIntDef(Day.Text,0));
    if Birthday.UruuDoshi then
      ShowMessage('���邤�N�ł�')
    else
      ShowMessage('���邤�N�ł͂Ȃ�');
  finally
    Birthday.Free;  //����ŃI�u�W�F�N�g�̂��߂Ɋm�ۂ��������������
  end;
end;

//�e�N���X�Ǝq�N���X�̏����̈Ⴂ�����邽�߂̎��s�{�^��
procedure TForm1.Button2Click(Sender: TObject);
var
  myDay: TDate;        //�e�N���X�̃I�u�W�F�N�g���ʎq
  myNewDay: TNewDate;  //�q�N���X�̃I�u�W�F�N�g���ʎq
  myObject: TObject;   //TObject�^�̃I�u�W�F�N�g���ʎq��錾
begin
  if Sender is TButton then         //Sender�I�u�W�F�N�g���ʎq�ɓ����Ă���I�u�W�F�N�g�� TButton������
    show(TButton(Sender).Caption);  //Sender��TButton�^�ɃL���X�g���ATButton�^��Text�v���p�e�B���g�p

  myDay := TDate.Create;   //�e�I�u�W�F�N�g��Create
  myObject := myDay;
  myNewDay := TNewDate.Create; //�q�I�u�W�F�N�g��Create
  try
    show('�e�N���X�F'+ myday.GetText);     //�e�I�u�W�F�N�g��GetText���\�b�h�ŕ�������擾���ĕ\��
    show('�q�N���X�F'+ myNewDay.GetText);  //�q�I�u�W�F�N�g��GetText���\�b�h�ŕ�������擾���ĕ\��

    show((myObject as TDate).Gettext);  //myObject��TDate�^�̃I�u�W�F�N�g�Ƃ��āATdate�̃��\�b�hGetText���g�p

  finally
    myDay.Free;      //�e�I�u�W�F�N�g�̉��
    myNewDay.Free;   //�q�I�u�W�F�N�g�̉��
  end;
end;

//�����̖�����\��������
procedure TForm1.Button3Click(Sender: TObject);
var
  myAnimal: TKemono;
begin
  if rbServal.Checked then       // �I�΂�Ă���`�F�b�N�{�b�N�X�ɂ���� TServal��TFennec�N���X�̂ǂ��炩��Create
    myAnimal := TServal.Create   // TServal�̃I�u�W�F�N�g�Q�Ƃ�e�N���X�^�̃I�u�W�F�N�g���ʎq�ɑ��
  else
    myAnimal := TFennec.Create;  // TFennec�̃I�u�W�F�N�g�Q�Ƃ�e�N���X�^�̃I�u�W�F�N�g���ʎq�ɑ��
  try
    show(myAnimal.Voice);        //�I�����ꂽ�����̖�����\��
  finally
    myAnimal.Free;
  end;
end;

//�N���X�^����n���ē����̖�����\��������
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
