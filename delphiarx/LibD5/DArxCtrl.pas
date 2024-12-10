unit DArxCtrl;

// ******************************************************
//         DelphiARX2002 VCL Support Components.
//
//     Copyright(C)2008 medialayse corporation.
//     2008-05-15  SOFTWARE DESIGN ATELIER SITE
// ******************************************************

interface

{$IFNDEF VER130}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
{$IFNDEF VER140}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$ENDIF}
{$ENDIF}
{$O+}
{$A+}
{$W-}
{$U+}
{$V+}
{$B-}
{$X+}
{$T-}
{$P+}
{$H+}
{$J-}

uses
  Windows, Messages, SysUtils, Classes, Graphics, Forms, Controls, DArxH,
{$IFDEF DARXFORM}
  DArxForm, ArxRunEx,
{$ENDIF}
  CommCtrl, ComCtrls;

type
{$IFNDEF DARXFORM}
  TArxControlBar = class
  end;
  TArxDockControlBar = class(TArxControlBar)
  end;
  TArxDockToolBar = class(TArxControlBar)
  end;
{$ENDIF}

  TMfcControlModel = class(TComponent)
  private
    FInitControlBar: Boolean;
    FHideClose: Boolean;
    FControlBar: TArxControlBar;
    FCaption: AnsiString;
    FWindowStyle: Cardinal;
    FControlStyle: TControlBarStyle;
    FDockSide: TDockBarSide;
    FDockCreate: Boolean;

    FOnControlCreate: TNotifyEvent;
    FOnControlDestroy: TNotifyEvent;
    FOnChanged: TOnControlChangedEvent;
    FOnCommand: TOnCommandEvent;
    FOnKeepFocus: TOnAcadKeepFocus;
    function IsOwnerControl(AOwner: TComponent): Integer;
    procedure SetCaption(Value: AnsiString);
  protected
    function CreateControlBar(AOwner: TComponent): TArxControlBar; virtual; abstract;
    procedure DoCreate(Sender: TObject); virtual;
    procedure DoDestroy(Sender: TObject); virtual;
    procedure DoChanged(Sender: TObject; CtrlState: TCtrlBarState); virtual;
    procedure DoCommand(Sender: TObject; wParam: WPARAM; lParam: LPARAM; var ActiveCmd: Boolean); virtual;
    procedure DoKeepFocus(Sender: TObject; var KeepFocus: Boolean); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
    procedure InitControlBar; virtual; abstract;
    procedure Attach; virtual;
    procedure Detach; virtual;
    procedure ShowControl; virtual;
    procedure HideControl; virtual;
    function Handle: HWND; virtual;
  published
    property Caption: AnsiString read FCaption write SetCaption;
    property WindowStyle: Cardinal read FWindowStyle write FWindowStyle default 0;
    property ControlStyle: TControlBarStyle read FControlStyle write FControlStyle default [cbrsAlignLeft, cbrsAlignRight];
    property DockSide: TDockBarSide read FDockSide write FDockSide default idwDockBarLeft;
    // ウィンドウ作成時にドッキングポイントを強制する場合はTrue, 自動調整する場合はFalse
    property DockCreate: Boolean read FDockCreate write FDockCreate default True;

    property HideClose: Boolean read FHideClose write FHideClose default False;
    property OnControlCreate: TNotifyEvent read FOnControlCreate write FOnControlCreate;
    property OnControlDestroy: TNotifyEvent read FOnControlDestroy write FOnControlDestroy;
    property OnChanged: TOnControlChangedEvent read FOnChanged write FOnChanged;
    property OnCommand: TOnCommandEvent read FOnCommand write FOnCommand;
    property OnKeepFocus: TOnAcadKeepFocus read FOnKeepFocus write FOnKeepFocus;
  end;

  TDArxDockBar = class(TMfcControlModel)
  private
    FOnHideControl: TOnHideControlEvent;
    FOnFloatingMinSize: TOnFloatingMinSizeEvent;
    FOnAddCustomMenuItems: TOnAddCustomMenuItemsEvent;
    FOnUserSizing: TOnUserSizingEvent;
    FOnCanFrameworkTakeFocus: TOnCanFrameworkTakeFocusEvent;
    function GetacDockBar: TArxDockControlBar;
  protected
    function CreateControlBar(AOwner: TComponent): TArxControlBar; override;
    procedure DoHideControl(Sender: TObject; var DoHide: Boolean); virtual;
    procedure DoFloatingMinSize(Sender: TObject; var MinWidth, MinHeight: Integer); virtual;
    procedure DoAddCustomMenuItems(Sender: TObject; hMenu: Cardinal; var DoCancel: Boolean); virtual;
    procedure DoUserSizing(Sender: TObject; nSide: Cardinal; var SizeRect: TRECT); virtual;
    procedure DoCanFrameworkTakeFocus(Sender: TObject; var DoCancel: Boolean); virtual;
  public
    procedure InitControlBar; override;
    property acDockBar: TArxDockControlBar read GetacDockBar;
  published
    property OnHideControl: TOnHideControlEvent read FOnHideControl write FOnHideControl;
    property OnFloatingMinSize: TOnFloatingMinSizeEvent read FOnFloatingMinSize write FOnFloatingMinSize;
    property OnAddCustomMenuItems: TOnAddCustomMenuItemsEvent read FOnAddCustomMenuItems write FOnAddCustomMenuItems;
    property OnUserSizing: TOnUserSizingEvent read FOnUserSizing write FOnUserSizing;
    property OnCanFrameworkTakeFocus: TOnCanFrameworkTakeFocusEvent read FOnCanFrameworkTakeFocus write FOnCanFrameworkTakeFocus;
  end;

  TDArxToolBar = class(TMfcControlModel)
  private
    FToolStyle: TControlBarStyle;

    FOnCalcDynamicLayout: TOnCalcDynamicLayoutEvent;
    FOnToolHitTest: TOnToolHitTestEvent;
    FOnUpdateCmdUI: TOnUpdateCmdUIEvent;
    FOnBarStyleChange: TOnBarStyleChangeEvent;
    function GetacToolBar: TArxDockToolBar;
  protected
    function CreateControlBar(AOwner: TComponent): TArxControlBar; override;
    procedure DoCalcDynamicLayout(Sender: TObject; nLength: Integer; nMode: DWORD; var rSize: TSIZE); virtual;
    procedure DoToolHitTest(Sender: TObject; mPoint: TPOINT; var TI: TOOLINFO; var resCode: Integer); virtual;
    procedure DoUpdateCmdUI(Sender: TObject; hTarget: HWND; bDisableIfNoHndler: Boolean); virtual;
    procedure DoBarStyleChange(Sender: TObject; dwOldStyle, dwNewStyle: DWORD; var BtnSize: TSIZE); virtual;
  public
    constructor Create(AOwner: TComponent); override;
    procedure InitControlBar; override;
    property acToolBar: TArxDockToolBar read GetacToolBar;
  published
    property ControlStyle default [cbrsAlignAny];
    property DockSide default idwDockBarTop;
    property ToolStyle: TControlBarStyle read FToolStyle write FToolStyle default [cbrsFlyby, cbrsAlignTop, cbrsBorderBottom, cbrsToolTips, cbrsGripper];

    property OnCalcDynamicLayout: TOnCalcDynamicLayoutEvent read FOnCalcDynamicLayout write FOnCalcDynamicLayout;
    property OnToolHitTest: TOnToolHitTestEvent read FOnToolHitTest write FOnToolHitTest;
    property OnUpdateCmdUI: TOnUpdateCmdUIEvent read FOnUpdateCmdUI write FOnUpdateCmdUI;
    property OnBarStyleChange: TOnBarStyleChangeEvent read FOnBarStyleChange write FOnBarStyleChange;
  end;

  TArxForm = class(TForm)
  private
  	FAutoCenter: Boolean;
    FSizeGrip: Boolean;
    FSizeGripView: Boolean;
    FOnKeepFocus: TOnAcadKeepFocus;
    procedure SetSizeGrip(Value: Boolean);
  protected
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction); override;
    procedure DoKeepFocus(var KeepFocus: Boolean); virtual;
    procedure WndProc(var Message: TMessage); override;
    procedure Paint; override;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    destructor Destroy; override;
    function ShowModal: Integer; override;
    procedure ShowTool; virtual;
    procedure HideTool; virtual;
  	property AutoCenter: Boolean read FAutoCenter write FAutoCenter;
    property SizeGrip: Boolean read FSizeGrip write SetSizeGrip;
    property OnKeepFocus: TOnAcadKeepFocus read FOnKeepFocus write FOnKeepFocus;
  end;

  TArxDockForm = class(TForm)
  private
    FRecreated: Boolean;
    FInitCtrlBar: Boolean;
    FMfcControlBar: TMfcControlModel;
  protected
    procedure CreateParams(var Params: TCreateParams); override;
    procedure CreateWnd; override;
    procedure DestroyWnd; override;
    procedure DoShow; override;
    procedure DoClose(var Action: TCloseAction); override;
  public
    constructor CreateNew(AOwner: TComponent; Dummy: Integer = 0); override;
    procedure AfterConstruction; override;
    procedure ShowTool; virtual;
    procedure HideTool; virtual;
  end;

  TArxFormClass = class of TArxForm;
  TArxDockFormClass = class of TArxDockForm;

procedure Register;
function GetMfcControlBarStyle(Style: TControlBarStyle): Cardinal;
function GetMfcDockBarSide(Side: TDockBarSide): Cardinal;
function GetMfcFloatBarSide(Side: TDockBarSide): Cardinal;

implementation

uses
{$IFDEF DARXFORM}
  DArxLib,
{$ENDIF}
  StdCtrls;

{$R *.RES}

var
  staticGripCount: Integer = 0;
  staticGripImage: TBitmap = nil;

procedure Register;
begin
  RegisterNoIcon([TArxForm, TArxDockForm]);
  RegisterComponents('DelphiARX', [TDArxDockBar, TDArxToolBar]);
end;

function GetMfcControlBarStyle(Style: TControlBarStyle): Cardinal;
begin
  if (cbrsAlignLeft in Style) then Result := CBRS_ALIGN_LEFT else Result := 0;
  if (cbrsAlignTop in Style) then Result := Result or CBRS_ALIGN_TOP;
  if (cbrsAlignRight in Style) then Result := Result or CBRS_ALIGN_RIGHT;
  if (cbrsAlignBottom in Style) then Result := Result or CBRS_ALIGN_BOTTOM;
  if (cbrsAlignAny in Style) then Result := Result or CBRS_ALIGN_ANY;
  if (cbrsBorderLeft in Style) then Result := Result or CBRS_BORDER_LEFT;
  if (cbrsBorderTop in Style) then Result := Result or CBRS_BORDER_TOP;
  if (cbrsBorderRight in Style) then Result := Result or CBRS_BORDER_RIGHT;
  if (cbrsBorderBottom in Style) then Result := Result or CBRS_BORDER_BOTTOM;
  if (cbrsBorderAny in Style) then Result := Result or CBRS_BORDER_ANY;
  if (cbrsFloatMulti in Style) then Result := Result or CBRS_FLOAT_MULTI;
  if (cbrsToolTips in Style) then Result := Result or CBRS_TOOLTIPS;
  if (cbrsFlyby in Style) then Result := Result or CBRS_FLYBY;
  if (cbrsGripper in Style) then Result := Result or CBRS_GRIPPER;
end;

function GetMfcDockBarSide(Side: TDockBarSide): Cardinal;
begin
  case Side of
    idwDockBarLeft: Result := AFX_IDW_DOCKBAR_LEFT;
    idwDockBarTop: Result := AFX_IDW_DOCKBAR_TOP;
    idwDockBarRight: Result := AFX_IDW_DOCKBAR_RIGHT;
    idwDockBarBottom: Result := AFX_IDW_DOCKBAR_BOTTOM;
    idwDockBarFloat: Result := AFX_IDW_DOCKBAR_FLOAT;
  else
    Result := 0;
  end;
end;

function GetMfcFloatBarSide(Side: TDockBarSide): Cardinal;
begin
  case Side of
    idwDockBarLeft: Result := CBRS_ALIGN_LEFT;
    idwDockBarTop: Result := CBRS_ALIGN_TOP;
    idwDockBarRight: Result := CBRS_ALIGN_RIGHT;
    idwDockBarBottom: Result := CBRS_ALIGN_BOTTOM;
    idwDockBarFloat: Result := CBRS_ALIGN_LEFT;
  else
    Result := 0;
  end;
end;

procedure ClientControlParents(const Control: TWinControl);
var
  nMax, ni: Integer;
begin
  if (Control = nil) then exit;
  nMax := Control.ControlCount - 1;
  for ni := 0 to nMax do begin
    if (Control.Controls[ni] is TWinControl)and(TWinControl(Control.Controls[ni]).ControlCount > 0) then begin
      if NOT (csAcceptsControls in TWinControl(Control.Controls[ni]).ControlStyle) then
        TWinControl(Control.Controls[ni]).ControlStyle := TWinControl(Control.Controls[ni]).ControlStyle + [csAcceptsControls];
      ClientControlParents(TWinControl(Control.Controls[ni]));
    end;
  end;
end;

function NotStatusClientAlign(const Control: TWinControl): Boolean;
var
  nMax, ni: Integer;
begin
  Result := True;
  if (Control = nil) then exit;
  nMax := Control.ControlCount - 1;
  for ni := 0 to nMax do begin
    if (Control.Controls[ni] is TWinControl) then begin
      if (TWinControl(Control.Controls[ni]).Align = AlBottom)or(TWinControl(Control.Controls[ni]).Align = AlClient)
        or(TWinControl(Control.Controls[ni]).Align = AlRight) then begin
          Result := False;
          break;
      end;
    end;
  end;
end;

{ TMfcControlModel }

constructor TMfcControlModel.Create(AOwner: TComponent);
begin
  FInitControlBar := False;
  FControlBar := nil;
  if (0 >= IsOwnerControl(AOwner)) then begin
    inherited Create(AOwner);
    FHideClose := False;
    if (NOT (csDesigning in ComponentState))and(AOwner is TArxDockForm) then begin
      TArxDockForm(AOwner).FMfcControlBar := Self;
{$IFDEF DARXFORM}
      FControlBar := CreateControlBar(AOwner);
      if FControlBar <> nil then begin
        FControlBar.OnControlCreate := DoCreate;
        FControlBar.OnControlDestroy := DoDestroy;
        FControlBar.OnChanged := DoChanged;
        FControlBar.OnCommand := DoCommand;
        FControlBar.OnKeepFocus := DoKeepfocus;
      end;
{$ENDIF}
    end;
    FCaption := ClassName;
    FWindowStyle := 0;
    FControlStyle := [cbrsAlignLeft, cbrsAlignRight];
    FDockSide := idwDockBarLeft;
    FDockCreate := True;
  end else begin
    Abort;
    Destroy;
  end;
end;

destructor TMfcControlModel.Destroy;
begin
  FInitControlBar := False;
  if FControlBar <> nil then FControlBar.Free;
  FControlBar := nil;
  inherited Destroy;
end;

procedure TMfcControlModel.Attach;
begin
{$IFDEF DARXFORM}
  if (FInitControlBar)and(FControlBar.IsCreated)and(Owner is TArxDockForm) then FControlBar.ChildHandle := TArxDockForm(Owner).Handle;
{$ENDIF}
end;

procedure TMfcControlModel.Detach;
begin
{$IFDEF DARXFORM}
  if (FInitControlBar)and(FControlBar.IsCreated) then FControlBar.ChildHandle := 0;
{$ENDIF}
end;

procedure TMfcControlModel.ShowControl;
begin
{$IFDEF DARXFORM}
  if (FInitControlBar) then ArxAcadFrame.ShowControlBar(FControlBar, True, False);
{$ENDIF}
end;

procedure TMfcControlModel.HideControl;
begin
{$IFDEF DARXFORM}
  if (FInitControlBar) then ArxAcadFrame.ShowControlBar(FControlBar, False, False);
{$ENDIF}
end;

function TMfcControlModel.Handle: HWND;
begin
{$IFDEF DARXFORM}
  if (FInitControlBar) then Result := FControlBar.Handle else
{$ENDIF}
  Result := 0;
end;

function TMfcControlModel.IsOwnerControl(AOwner: TComponent): Integer;
var
  nMax, ni: Integer;
begin
  Result := 0;
  if AOwner = nil then exit;
  nMax := AOwner.ComponentCount - 1;
  for ni := 0 to nMax do begin
    if (AOwner.Components[ni] is TMfcControlModel) then Inc(Result);
  end;
end;

procedure TMfcControlModel.DoCreate(Sender: TObject);
begin
  if Assigned(FOnControlCreate) then FOnControlCreate(Self);
end;

procedure TMfcControlModel.DoDestroy(Sender: TObject);
begin
  if Assigned(FOnControlDestroy) then FOnControlDestroy(Self);
end;

procedure TMfcControlModel.DoChanged(Sender: TObject; CtrlState: TCtrlBarState);
begin
  if (Owner is TForm) then begin
    case CtrlState of
     cbsSHOW: TForm(Owner).Show;
     cbsHIDE: TForm(Owner).Hide;
     //cbsENABLED: TForm(Owner).Enabled := True;
     //cbsDISABLED: TForm(Owner).Enabled := False;
    end;
  end;
  if Assigned(FOnChanged) then FOnChanged(Self, CtrlState);
end;

procedure TMfcControlModel.DoCommand(Sender: TObject; wParam: WPARAM; lParam: LPARAM; var ActiveCmd: Boolean);
begin
  if Assigned(FOnCommand) then FOnCommand(Self, wParam, lParam, ActiveCmd);
end;

procedure TMfcControlModel.DoKeepFocus(Sender: TObject; var KeepFocus: Boolean);
begin
  if Assigned(FOnKeepFocus) then FOnKeepFocus(Self, KeepFocus);
end;

procedure TMfcControlModel.SetCaption(Value: AnsiString);
begin
  FCaption := Value;
{$IFDEF DARXFORM}
  if (FControlBar <> nil)and(FControlBar.IsCreated) then FControlBar.Caption := FCaption;
{$ENDIF}
end;

{ TDArxDockBar }

procedure TDArxDockBar.InitControlBar;
begin
{$IFDEF DARXFORM}
  if (FControlBar = nil)or(acDockBar.IsCreated)or(NOT (Owner is TArxDockForm)) then exit;
  acDockBar.CreateControlBar(FCaption, FWindowStyle, TArxDockForm(Owner).ClientRect);
  acDockBar.EnableDocking(GetMfcControlBarStyle(FControlStyle));
  if (FDockCreate) then
    acDockBar.DockControlBar(GetMfcDockBarSide(FDockSide))
  else
    acDockBar.RestoreControlBar(GetMfcDockBarSide(FDockSide));
  acDockBar.ChildHandle := TArxDockForm(Owner).Handle;
  ArxAcadFrame.RecalcLayout();
  acDockBar.SetEnabledBar;
  FInitControlBar := True;
{$ENDIF}
end;

function TDArxDockBar.CreateControlBar(AOwner: TComponent): TArxControlBar;
begin
{$IFDEF DARXFORM}
  Result := TArxDockControlBar.Create(AOwner);
  TArxDockControlBar(Result).OnHideControl := DoHideControl;
  TArxDockControlBar(Result).OnFloatingMinSize := DoFloatingMinSize;
  TArxDockControlBar(Result).OnAddCustomMenuItems := DoAddCustomMenuItems;
  TArxDockControlBar(Result).OnUserSizing := DoUserSizing;
  TArxDockControlBar(Result).OnCanFrameworkTakeFocus := DoCanFrameworkTakeFocus;
{$ELSE}
  Result := nil;
{$ENDIF}
end;

procedure TDArxDockBar.DoHideControl(Sender: TObject; var DoHide: Boolean);
begin
  if Assigned(FOnHideControl) then FOnHideControl(Self, DoHide);
end;

procedure TDArxDockBar.DoFloatingMinSize(Sender: TObject; var MinWidth, MinHeight: Integer);
begin
  if Assigned(FOnFloatingMinSize) then FOnFloatingMinSize(Self, MinWidth, MinHeight);
end;

procedure TDArxDockBar.DoAddCustomMenuItems(Sender: TObject; hMenu: Cardinal; var DoCancel: Boolean);
begin
  if Assigned(FOnAddCustomMenuItems) then FOnAddCustomMenuItems(Self, hMenu, DoCancel);
end;

procedure TDArxDockBar.DoUserSizing(Sender: TObject; nSide: Cardinal; var SizeRect: TRECT);
begin
  if Assigned(FOnUserSizing) then FOnUserSizing(Self, nSide, SizeRect);
end;

procedure TDArxDockBar.DoCanFrameworkTakeFocus(Sender: TObject; var DoCancel: Boolean);
begin
  if Assigned(FOnCanFrameworkTakeFocus) then FOnCanFrameworkTakeFocus(Self, DoCancel);
end;

function TDArxDockBar.GetacDockBar: TArxDockControlBar;
begin
  Result := TArxDockControlBar(FControlBar);
end;

{ TDArxToolBar }

constructor TDArxToolBar.Create(AOwner: TComponent);
begin
  inherited Create(AOwner);
  //WS_CHILD | WS_VISIBLE | TBSTYLE_FLAT | CBRS_SIZE_DYNAMIC | ( CBRS_FLYBY | CBRS_TOP | CBRS_TOOLTIPS | CBRS_GRIPPER )
  FControlStyle := [cbrsAlignAny];
  FDockSide := idwDockBarTop;
  FToolStyle := [cbrsFlyby, cbrsAlignTop, cbrsBorderBottom, cbrsToolTips, cbrsGripper];
end;

function TDArxToolBar.CreateControlBar(AOwner: TComponent): TArxControlBar;
begin
{$IFDEF DARXFORM}
  Result := TArxDockToolBar.Create(AOwner);
  TArxDockToolBar(Result).OnCalcDynamicLayout := DoCalcDynamicLayout;
  TArxDockToolBar(Result).OnToolHitTest := DoToolHitTest;
  TArxDockToolBar(Result).OnUpdateCmdUI := DoUpdateCmdUI;
  TArxDockToolBar(Result).OnBarStyleChange := DoBarStyleChange;
{$ELSE}
  Result := nil;
{$ENDIF}
end;

procedure TDArxToolBar.InitControlBar;
{$IFDEF DARXFORM}
var
  nStyle: DWORD;
begin
  if (FControlBar = nil)or(acToolBar.IsCreated)or(NOT (Owner is TArxDockForm)) then exit;
  acToolBar.Bitmap.Width := TArxDockForm(Owner).ClientWidth;
  acToolBar.Bitmap.Height := TArxDockForm(Owner).ClientHeight;
  TArxDockForm(Owner).PaintTo(acToolBar.Bitmap.Canvas.Handle, 0, 0);
  nStyle := GetMfcControlBarStyle(FToolStyle) or FWindowStyle;
  if FWindowStyle = 0 then nStyle := nStyle or WS_CHILD or WS_VISIBLE or TBSTYLE_FLAT or CBRS_SIZE_DYNAMIC;
  acToolBar.CreateToolBar(FCaption, nStyle);
  acToolBar.EnableDocking(GetMfcControlBarStyle(FControlStyle));
  if (FDockCreate) then
    ArxAcadFrame.DockControlBar(acToolBar, GetMfcDockBarSide(FDockSide), TArxDockForm(Owner).GetClientRect)
  else
    ArxAcadFrame.FloatControlBar(acToolBar, Point(100, 100), GetMfcFloatBarSide(FDockSide));
  acToolBar.ChildHandle := TArxDockForm(Owner).Handle;
  ArxAcadFrame.ShowControlBar(acToolBar, True, True);
  ArxAcadFrame.RecalcLayout();
  acToolBar.SetEnabledBar;
  FInitControlBar := True;
end;
{$ELSE}
begin
end;
{$ENDIF}

procedure TDArxToolBar.DoCalcDynamicLayout(Sender: TObject; nLength: Integer; nMode: DWORD; var rSize: TSIZE);
begin
  if Assigned(FOnCalcDynamicLayout) then FOnCalcDynamicLayout(Self, nLength, nMode, rSize);
end;

procedure TDArxToolBar.DoToolHitTest(Sender: TObject; mPoint: TPOINT; var TI: TOOLINFO; var resCode: Integer);
begin
  if Assigned(FOnToolHitTest) then FOnToolHitTest(Self, mPoint, TI, resCode);
end;

procedure TDArxToolBar.DoUpdateCmdUI(Sender: TObject; hTarget: HWND; bDisableIfNoHndler: Boolean);
begin
  if Assigned(FOnUpdateCmdUI) then FOnUpdateCmdUI(Self, hTarget, bDisableIfNoHndler);
end;

procedure TDArxToolBar.DoBarStyleChange(Sender: TObject; dwOldStyle, dwNewStyle: DWORD; var BtnSize: TSIZE);
begin
  if Assigned(FOnBarStyleChange) then FOnBarStyleChange(Self, dwOldStyle, dwNewStyle, BtnSize);
end;

function TDArxToolBar.GetacToolBar: TArxDockToolBar;
begin
  Result := TArxDockToolBar(FControlBar);
end;

{ TArxForm }

constructor TArxForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  Inc(staticGripCount);
  inherited CreateNew(AOwner);
	FAutoCenter := True;
  FSizeGrip := True;
  FSizeGripView := False;
  Width := 460;
  Height := 260;
end;

destructor TArxForm.Destroy;
begin
  inherited Destroy;
  Dec(staticGripCount);
  if staticGripCount > 0 then exit;
  if staticGripImage <> nil then staticGripImage.Free;
  staticGripImage := nil;
end;

function TArxForm.ShowModal: Integer;
begin
{$IFDEF DARXFORM}
  ArxModalDialog := Self;
{$ENDIF}
  Result := inherited ShowModal;
{$IFDEF DARXFORM}
  ArxModalDialog := nil;
{$ENDIF}
end;

procedure TArxForm.DoShow;
begin
{$IFDEF DARXFORM}
  if FAutoCenter then darx_FormCenter(Self);
{$ENDIF}
  inherited DoShow;
  SetSizeGrip(FSizeGrip);
end;

procedure TArxForm.DoClose(var Action: TCloseAction);
begin
  inherited DoClose(Action);
{$IFDEF DARXFORM}
  darx_AcadFocus;
{$ENDIF}
end;

procedure TArxForm.DoKeepFocus(var KeepFocus: Boolean);
begin
  if Assigned(FOnKeepFocus) then FOnKeepFocus(Self, KeepFocus);
end;

procedure TArxForm.WndProc(var Message: TMessage);
var
  rFocus: Boolean;
begin
  if Message.Msg = WM_ACAD_KEEPFOCUS then begin
    rFocus := False;
    DoKeepFocus(rFocus);
    if rFocus then Message.Result := 1 else Message.Result := 0;
  end else begin
    inherited WndProc(Message);
    if Message.Msg = WM_SIZE then Invalidate;
  end;
end;

procedure TArxForm.Paint;
begin
  if (FSizeGripView)and(staticGripImage <> nil) then Canvas.Draw(ClientWidth - staticGripImage.Width, ClientHeight - staticGripImage.Height, staticGripImage);
  inherited Paint;
end;

procedure TArxForm.ShowTool;
begin
  Show;
end;

procedure TArxForm.HideTool;
begin
  Hide;
end;

procedure TArxForm.SetSizeGrip(Value: Boolean);
begin
  FSizeGrip := Value;
  if (FSizeGrip)and((BorderStyle = bsSizeable)or(BorderStyle = bsSizeToolWin)) then begin
    FSizeGripView := NotStatusClientAlign(Self);
    if (FSizeGripView)and(staticGripImage = nil) then begin
      staticGripImage := TBitmap.Create;
      staticGripImage.LoadFromResourceName(hInstance, 'GRIPIMG');
      staticGripImage.Transparent := True;
    end;
  end else begin
    FSizeGripView := False;
  end;
  Invalidate;
end;


{ TArxDockForm }

constructor TArxDockForm.CreateNew(AOwner: TComponent; Dummy: Integer);
begin
  FRecreated := False;
  FInitCtrlBar := False;
  FMfcControlBar := nil;
  inherited CreateNew(AOwner, Dummy);
end;

procedure TArxDockForm.AfterConstruction;
begin
  inherited AfterConstruction;
{$IFDEF DARXFORM}
  if (FRecreated)or(FMfcControlBar = nil) then exit;
  FRecreated := True;
  ClientControlParents(Self);
  FMfcControlBar.InitControlBar;
  FInitCtrlBar := True;
  RecreateWnd;
{$ENDIF}
end;

procedure TArxDockForm.CreateParams(var Params: TCreateParams);
begin
  inherited CreateParams(Params);
  if NOT FInitCtrlBar then exit;
  Params.Caption := nil;
  Params.Style := (Params.Style and (WS_HSCROLL or WS_VSCROLL))or WS_CHILDWINDOW or WS_VISIBLE or WS_OVERLAPPED or WS_TABSTOP;
  Params.ExStyle := WS_EX_LEFT or WS_EX_LTRREADING or WS_EX_RIGHTSCROLLBAR or WS_EX_CONTROLPARENT;
  Params.WndParent := FMfcControlBar.Handle;
end;

procedure TArxDockForm.CreateWnd;
begin
  inherited CreateWnd;
{$IFDEF DARXFORM}
  if (FInitCtrlBar)and(FMfcControlBar <> nil) then FMfcControlBar.Attach;
{$ENDIF}
end;

procedure TArxDockForm.DestroyWnd;
begin
{$IFDEF DARXFORM}
  if (FInitCtrlBar)and(FMfcControlBar <> nil) then FMfcControlBar.Detach;
{$ENDIF}
  inherited DestroyWnd;
end;

procedure TArxDockForm.DoShow;
begin
end;

procedure TArxDockForm.DoClose(var Action: TCloseAction);
begin
{$IFDEF DARXFORM}
  if (FInitCtrlBar)and(FMfcControlBar <> nil)and(FMfcControlBar.HideClose) then FMfcControlBar.HideControl;
{$ENDIF}
end;

procedure TArxDockForm.ShowTool;
begin
{$IFDEF DARXFORM}
  if (FInitCtrlBar)and(FMfcControlBar <> nil) then FMfcControlBar.ShowControl else
{$ENDIF}
  Show;
end;

procedure TArxDockForm.HideTool;
begin
{$IFDEF DARXFORM}
  if (FInitCtrlBar)and(FMfcControlBar <> nil) then FMfcControlBar.HideControl else
{$ENDIF}
  Hide;
end;

end.
