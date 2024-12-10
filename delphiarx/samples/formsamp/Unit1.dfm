object ArxForm1: TArxForm1
  Left = 200
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'ArxForm1'
  ClientHeight = 163
  ClientWidth = 265
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = False
  OnCreate = FormCreate
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object Label1: TLabel
    Left = 12
    Top = 11
    Width = 123
    Height = 16
    Caption = 'Sample Modal Dialog'
    Transparent = True
  end
  object Label2: TLabel
    Left = 40
    Top = 45
    Width = 114
    Height = 16
    Alignment = taRightJustify
    Caption = 'The circular radius :'
    Transparent = True
    Layout = tlCenter
  end
  object Label3: TLabel
    Left = 34
    Top = 79
    Width = 121
    Height = 16
    Alignment = taRightJustify
    Caption = 'The hexagon length :'
    Transparent = True
    Layout = tlCenter
  end
  object Edit1: TEdit
    Left = 161
    Top = 41
    Width = 80
    Height = 24
    TabOrder = 0
    Text = 'Edit1'
    OnKeyPress = EditKeyPress
  end
  object Edit2: TEdit
    Left = 161
    Top = 75
    Width = 80
    Height = 24
    TabOrder = 1
    Text = 'Edit2'
    OnKeyPress = EditKeyPress
  end
  object btnOK: TButton
    Left = 85
    Top = 123
    Width = 75
    Height = 25
    Caption = 'O K'
    TabOrder = 2
    OnClick = btnOKClick
  end
  object btnCANCEL: TButton
    Left = 177
    Top = 123
    Width = 75
    Height = 25
    Cancel = True
    Caption = 'Cancel'
    ModalResult = 2
    TabOrder = 3
  end
end
