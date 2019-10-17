object Form2: TForm2
  Left = 451
  Top = 96
  Width = 463
  Height = 538
  Caption = 'Grade'
  Color = clNavy
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object pnlMenu: TPanel
    Left = 16
    Top = 16
    Width = 417
    Height = 473
    Color = clBlack
    TabOrder = 0
    object btnGr8: TColorButton
      Left = 32
      Top = 24
      Width = 345
      Height = 65
      Caption = 'Grade 8'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnGr8Click
      HoverColor = clPurple
    end
    object btnGr9: TColorButton
      Left = 32
      Top = 96
      Width = 345
      Height = 65
      Caption = 'Grade 9'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      OnClick = btnGr9Click
      HoverColor = clPurple
    end
    object btnGr10: TColorButton
      Left = 32
      Top = 168
      Width = 345
      Height = 65
      Caption = 'Grade 10'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      OnClick = btnGr10Click
      HoverColor = clPurple
    end
    object btnGr11: TColorButton
      Left = 32
      Top = 240
      Width = 345
      Height = 65
      Caption = 'Grade 11'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      OnClick = btnGr11Click
      HoverColor = clPurple
    end
    object btnGr12: TColorButton
      Left = 32
      Top = 312
      Width = 345
      Height = 65
      Caption = 'Grade 12'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
      OnClick = btnGr12Click
      HoverColor = clPurple
    end
    object btnTeachers: TColorButton
      Left = 32
      Top = 384
      Width = 345
      Height = 65
      Caption = 'Teachers'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -33
      Font.Name = 'Jokerman'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnTeachersClick
      HoverColor = clPurple
    end
  end
end
