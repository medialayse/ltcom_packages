object ArxDockForm1: TArxDockForm1
  Left = 200
  Top = 110
  BorderIcons = [biSystemMenu]
  BorderStyle = bsNone
  BorderWidth = 1
  Caption = 'ArxDockForm1'
  ClientHeight = 218
  ClientWidth = 155
  Color = clBtnFace
  Font.Charset = SHIFTJIS_CHARSET
  Font.Color = clWindowText
  Font.Height = -12
  Font.Name = '‚l‚r ‚oƒSƒVƒbƒN'
  Font.Style = []
  OldCreateOrder = False
  PixelsPerInch = 96
  TextHeight = 12
  object PageControl1: TPageControl
    Left = 0
    Top = 0
    Width = 155
    Height = 218
    ActivePage = TabSheet1
    Align = alClient
    TabOrder = 0
    object TabSheet1: TTabSheet
      Caption = 'Setting'
      object Button1: TButton
        Left = 10
        Top = 7
        Width = 90
        Height = 23
        Caption = 'Clear'
        TabOrder = 0
        OnClick = Button1Click
      end
      object Button2: TButton
        Left = 10
        Top = 41
        Width = 90
        Height = 23
        Caption = 'Start'
        TabOrder = 1
        OnClick = Button2Click
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Points'
      ImageIndex = 1
      object ListBox1: TListBox
        Left = 0
        Top = 0
        Width = 147
        Height = 191
        Align = alClient
        ItemHeight = 12
        TabOrder = 0
      end
    end
  end
  object ArxDockBar: TDArxDockBar
    Caption = 'AutoCAD Object Sample'
    DockSide = idwDockBarRight
    Left = 4
    Top = 179
  end
end
