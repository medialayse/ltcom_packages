object ArxDockForm2: TArxDockForm2
  Left = 200
  Top = 136
  Width = 206
  Height = 234
  BorderIcons = [biSystemMenu]
  Caption = 'ArxDockForm2'
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 16
  object Button1: TButton
    Left = 21
    Top = 13
    Width = 158
    Height = 31
    Caption = 'acedPostCommand'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Button2: TButton
    Left = 21
    Top = 62
    Width = 158
    Height = 29
    Caption = 'acedCommand'
    TabOrder = 1
    OnClick = Button2Click
  end
  object Button3: TButton
    Left = 20
    Top = 111
    Width = 158
    Height = 29
    Caption = 'EntMake'
    TabOrder = 2
    OnClick = Button3Click
  end
  object Button4: TButton
    Left = 20
    Top = 160
    Width = 158
    Height = 29
    Caption = 'sendStringToExecute'
    TabOrder = 3
    OnClick = Button4Click
  end
  object ArxDockBar: TDArxDockBar
    Caption = 'TDArxDockBar'
  end
end
