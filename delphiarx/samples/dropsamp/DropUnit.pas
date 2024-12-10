unit DropUnit;

interface

uses
	Windows, SysUtils, ShlObj, ActiveX, ShellAPI, DArxH, DArxDrop,
  Menus, Forms;

type
	TMyDropSample = class(TDOleDropTarget)
  private
		FDropMenu: TPopupMenu;
    FMenuStatus: Integer;
    procedure CreatePopupMenu;
  	procedure OnClickMenuItems(Sender: TObject);
	protected
	  procedure DoDragEnter(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject; dwKeyState: DWORD; dgPoint: TPOINT; var Action: TDROPEFFECT); override;
	  procedure DoDrop(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject; dropEffect: TDROPEFFECT; dgPoint: TPOINT; var Action: Boolean); override;
  	procedure DoDropEx(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject; dropDefault, dropList: TDROPEFFECT; dgPoint: TPOINT; var Action: TDROPEFFECT); override;
	public
  	constructor Create;
    destructor Destroy; override;
  end;

procedure InitMyDropSample;   		// --> MsgMain.pas
procedure UnloadMyDropSample;     // --> MsgMain.pas

implementation

uses
	DArxObj, DArxApi;

var
  MyDrop: TMyDropSample = nil;

procedure InitMyDropSample;
begin
  MyDrop := TMyDropSample.Create;
  MyDrop.acedAddDropTarget;
end;

procedure UnloadMyDropSample;
begin
  MyDrop.Free;
  MyDrop := nil;
end;

{ TMyDropSample }

procedure InsertText(DropFile: String; var dwgPt: TacedDwgPoint);
begin

end;

procedure InsertMultiText(DropFile: String; var dwgPt: TacedDwgPoint);
begin
  
end;

procedure DropAction(Index: Integer; DataObject: TDOleDataObject; dgPoint: TPOINT);
var
  dwgPt: TacedDwgPoint;
	ni: Integer;
	QueryRec: TDDragQueryFileRec;
begin
	if NOT GetDropDwgPoint(dgPoint, dwgPt) then exit;
	ni := DragQueryFirst(DataObject, QueryRec);
  try
    if Index = 3 then acutPrintf(#13#10'Files dropped:') else acutPrintf(#13#10);
  	while (ni >= 0) do begin
      case Index of
      0:		// Insert Text
        InsertText(QueryRec.FileName, dwgPt);
      1:		// Insert MultiText
        InsertMultiText(QueryRec.FileName, dwgPt);
      2:		// List Files
	      acutPrintf(#13#10'%d. %s', [ni + 1, QueryRec.FileName]);
      end;
      ni := DragQueryNext(QueryRec);
    end;
  finally
    DragQueryClose(QueryRec);
    if Index = 3 then acedPostCommandPrompt();
  end;
end;

constructor TMyDropSample.Create;
begin
  inherited Create;
	FDropMenu := nil;
  FMenuStatus := -1;
end;

destructor TMyDropSample.Destroy;
begin
	if FDropMenu <> nil then FDropMenu.Free;
  FDropMenu := nil;
  inherited Destroy;
end;

procedure TMyDropSample.DoDragEnter(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject;
		dwKeyState: DWORD; dgPoint: TPOINT; var Action: TDROPEFFECT);
begin
  inherited;
	if 0 >= DragSearchFiles(DataObject, '*.txt;*.bat') then exit;
  Action := DROPEFFECT_MOVE;
end;

procedure TMyDropSample.DoDrop(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject;
		dropEffect: TDROPEFFECT; dgPoint: TPOINT; var Action: Boolean);
begin
  inherited;
  Action := (FMenuStatus >= 0);
  if NOT Action then exit;
  acDocManager.activateDocument(DropTarget.Document);
  acDocManager.lockDocument(DropTarget.Document);
  try
  	DropAction(FMenuStatus, DataObject, dgPoint);
  finally
    acDocManager.unlockDocument(DropTarget.Document);
	  FMenuStatus := -1;
  end;
end;

procedure TMyDropSample.DoDropEx(DropTarget: TDDropTargetRec; DataObject: TDOleDataObject;
		dropDefault, dropList: TDROPEFFECT; dgPoint: TPOINT; var Action: TDROPEFFECT);
var
  musPos: TPoint;
begin
  inherited;
  if FDropMenu = nil then CreatePopupMenu;
	musPos := dgPoint;
  ClientToScreen(DropTarget.hWnd, musPos);
  FMenuStatus := -1;
  FDropMenu.Popup(musPos.x, musPos.y);
  Application.ProcessMessages;	// d—v
  if 0 > FMenuStatus then Action := DROPEFFECT_LEAVE;
end;

procedure TMyDropSample.CreatePopupMenu;
const
	POPUPMENUCAPS: array[0..4]of AnsiString = ('Insert Text', 'Insert MultiText', 'List Files', '-', 'Cancel');
var
	ni: Integer;
  mnuItem: TMenuItem;
begin
	FDropMenu := TPopupMenu.Create(nil);
  FDropMenu.AutoPopup := False;
  FDropMenu.MenuAnimation := [maLeftToRight, maTopToBottom];
  for ni := 0 to 4 do begin
    mnuItem := TMenuItem.Create(FDropMenu);
    mnuItem.Caption := POPUPMENUCAPS[ni];
    mnuItem.Enabled := True;
    mnuItem.Visible := True;
    mnuItem.Tag := ni;
    mnuItem.OnClick := OnClickMenuItems;
    FDropMenu.Items.Add(mnuItem);
  end;
end;

procedure TMyDropSample.OnClickMenuItems(Sender: TObject);
begin
  FMenuStatus := (Sender as TMenuItem).Tag;
  if FMenuStatus = 4 then FMenuStatus := -1;
end;

end.
