object DArx_DebugView: TDArx_DebugView
  Left = 196
  Top = 106
  AutoScroll = False
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSizeToolWin
  Caption = 'DelphiARX ResultBuffer DebugView'
  ClientHeight = 315
  ClientWidth = 653
  Color = clBtnFace
  Font.Charset = ANSI_CHARSET
  Font.Color = clWindowText
  Font.Height = -13
  Font.Name = 'Arial'
  Font.Style = []
  OldCreateOrder = True
  Scaled = False
  OnClose = FormClose
  OnCreate = FormCreate
  OnResize = FormResize
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 16
  object CopyRight: TLabel
    Left = 264
    Top = 293
    Width = 5
    Height = 16
    Alignment = taCenter
    Caption = '*'
  end
  object ResBufList: TListView
    Left = 4
    Top = 4
    Width = 593
    Height = 263
    Columns = <
      item
        Caption = 'Address'
        Width = 85
      end
      item
        Caption = 'rbNext'
        Width = 85
      end
      item
        Caption = 'ResType'
        Width = 60
      end
      item
        Caption = 'ResVal'
        Width = 230
      end
      item
        Caption = 'TResUnion_Type'
        Width = 110
      end>
    ColumnClick = False
    ReadOnly = True
    RowSelect = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = ResBufListClick
    OnDblClick = ResBufListDblClick
    OnMouseDown = ResBufListMouseDown
  end
  object BtnOK: TButton
    Left = 518
    Top = 273
    Width = 80
    Height = 21
    Caption = 'O K'
    Default = True
    TabOrder = 1
    OnClick = BtnOKClick
  end
  object BtnUP: TButton
    Left = 127
    Top = 270
    Width = 50
    Height = 21
    Caption = 'U P'
    TabOrder = 2
    OnClick = BtnUPClick
  end
  object BtnDOWN: TButton
    Left = 181
    Top = 270
    Width = 50
    Height = 21
    Caption = 'DOWN'
    TabOrder = 3
    OnClick = BtnDOWNClick
  end
  object BtnTOP: TButton
    Left = 4
    Top = 270
    Width = 50
    Height = 21
    Caption = 'TOP'
    TabOrder = 4
    OnClick = BtnTOPClick
  end
  object ChkMDLESS: TCheckBox
    Left = 283
    Top = 275
    Width = 200
    Height = 17
    Caption = 'The modeless debugging'
    TabOrder = 5
  end
end
