object Form1: TForm1
  Left = 192
  Top = 125
  Caption = 'Form1'
  ClientHeight = 636
  ClientWidth = 1289
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = #65325#65331' '#65328#12468#12471#12483#12463
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object Button1: TButton
    Left = 80
    Top = 56
    Width = 75
    Height = 25
    Caption = #12358#12427#12358#24180#21028#26029
    TabOrder = 0
    OnClick = Button1Click
  end
  object Year: TEdit
    Left = 112
    Top = 144
    Width = 65
    Height = 20
    TabOrder = 1
  end
  object Month: TEdit
    Left = 112
    Top = 176
    Width = 65
    Height = 20
    TabOrder = 2
  end
  object Day: TEdit
    Left = 112
    Top = 208
    Width = 65
    Height = 20
    TabOrder = 3
  end
  object Button2: TButton
    Left = 320
    Top = 56
    Width = 75
    Height = 25
    Caption = #26085#20184
    TabOrder = 4
    OnClick = Button2Click
  end
  object Memo1: TMemo
    Left = 320
    Top = 112
    Width = 353
    Height = 161
    Lines.Strings = (
      '')
    TabOrder = 5
  end
  object Button3: TButton
    Left = 888
    Top = 159
    Width = 75
    Height = 25
    Caption = #40180#12365#22768
    TabOrder = 6
    OnClick = Button3Click
  end
  object RadioGroup1: TRadioGroup
    Left = 888
    Top = 56
    Width = 185
    Height = 97
    Caption = #12369#12418#12398
    TabOrder = 7
  end
  object rbServal: TRadioButton
    Left = 904
    Top = 80
    Width = 113
    Height = 17
    Caption = #12469#12540#12496#12523
    TabOrder = 8
  end
  object rbFennec: TRadioButton
    Left = 904
    Top = 114
    Width = 113
    Height = 17
    Caption = #12501#12455#12493#12483#12463
    TabOrder = 9
  end
  object Button4: TButton
    Left = 888
    Top = 264
    Width = 75
    Height = 25
    Caption = #40180#12365#22768'2'
    TabOrder = 10
    OnClick = Button4Click
  end
end
