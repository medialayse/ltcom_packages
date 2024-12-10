unit DArxDoc;

// ******************************************************
//     DelphiARX2002 MDI Aware Document Control unit.
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
  Windows, SysUtils, Classes, DArxH, DrxIuTyp, AcRxCLib, AcApCLib, DocMain;

type
  TDArxDocumentItems = class(TDArxArrayContorl)
  private
    function GetDArxDocManager: TDArxDocManager;
  protected
    function CreateObject(const Data: Pointer): Pointer; override;
    procedure DestroyObject(const Obj: Pointer); override;
    function IsEqualData(const Obj, Data: Pointer): Boolean; override;
  public
    function IndexOf(const Data: TAcApDocument): Integer;
    procedure Clear;
    function Add(const NewdocData: TAcApDocument): Integer;
    procedure Delete(const DeldocData: TAcApDocument);
    procedure ArxCommand(const CmdIndex: Integer);
    procedure LispCommand(const CmdIndex: Integer; var ResCode: Integer);
    procedure CallCommand(const CmdIndex: Integer; var ResCode: Integer);
    procedure Callback(const CallbackNo: Integer; const pParam: Pointer);
    procedure documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
    procedure documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString);
    procedure documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
    procedure documentBecameCurrent(pDoc: TAcApDocument);
    procedure documentToBeActivated(pActivatingDoc: TAcApDocument);
    procedure documentToBeDeactivated(pDeActivatedDoc: TAcApDocument);
    procedure documentActivated(pActivatedDoc: TAcApDocument);

    property CurDocManager: TDArxDocManager read GetDArxDocManager;             // Current DArxDocManager
  end;

// The following function is automatically executed by the definition of DARXFORM. The user doesn't summon.
// 以下の関数は、DARXFORMの定義により自動的に実行されます。ユーザーは呼び出さないでください。

procedure InitEnabledDocments;
procedure InitApplication;
procedure FinalApplication;

////////////////////////////////////////////////////////////////////////////////
//  inside
function darxDocManager_Imp_RxInit: Boolean;
procedure darxDocManager_Imp_UnLoad;
function darxDocManager_Imp_Add(const NewdocData: TAcApDocument): Integer;
procedure darxDocManager_Imp_Delete(const DeldocData: TAcApDocument);
procedure darxDocManager_Imp_documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
procedure darxDocManager_Imp_documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString);
procedure darxDocManager_Imp_documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
procedure darxDocManager_Imp_documentBecameCurrent(pDoc: TAcApDocument);
procedure darxDocManager_Imp_documentToBeActivated(pActivatingDoc: TAcApDocument);
procedure darxDocManager_Imp_documentToBeDeactivated(pDeActivatedDoc: TAcApDocument);
procedure darxDocManager_Imp_documentActivated(pActivatedDoc: TAcApDocument);

////////////////////////////////////////////////////////////////////////////////
//   DelphiARX Global Objects Value.      DelphiARXグローバルオブジェクト変数
//
//  NOTE: DO NOT remodes object.
var
  darxDocManager: TDArxDocumentItems = nil;

implementation

uses
{$IFDEF DARXFORM}
  Forms, DArxForm,
{$ENDIF}
{$IFDEF DARXDEBUG}
  AdsDebug,
{$ENDIF}
  DArxLib, AextCLib, DArxApi, DArxObj, DArxEnty, AextCObj;

function darxDocManager_Imp_RxInit: Boolean;
begin
  Result := (darxDocManager <> nil);
  if Result then exit;
  darxDocManager := TDArxDocumentItems.Create;
  Result := (darxDocManager <> nil);
  if NOT Result then exit;
end;

procedure darxDocManager_Imp_UnLoad;
begin
  if darxDocManager <> nil then darxDocManager.Free;
  darxDocManager := nil;
end;

function darxDocManager_Imp_Add(const NewdocData: TAcApDocument): Integer;
begin
  Result := darxDocManager.Add(NewdocData);
end;

procedure darxDocManager_Imp_Delete(const DeldocData: TAcApDocument);
begin
  darxDocManager.Delete(DeldocData);
end;

procedure darxDocManager_Imp_documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
  darxDocManager.documentLockModeWillChange(pDoc, myCurrentMode, myNewMode, currentMode, pGlobalCmdName);
end;

procedure darxDocManager_Imp_documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString);
begin
  darxDocManager.documentLockModeChangeVetoed(pDoc, pGlobalCmdName);
end;

procedure darxDocManager_Imp_documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
  darxDocManager.documentLockModeChanged(pDoc, myPreviousMode, myCurrentMode, currentMode, pGlobalCmdName);
end;

procedure darxDocManager_Imp_documentBecameCurrent(pDoc: TAcApDocument);
begin
  darxDocManager.documentBecameCurrent(pDoc);
end;

procedure darxDocManager_Imp_documentToBeActivated(pActivatingDoc: TAcApDocument);
begin
  darxDocManager.documentToBeActivated(pActivatingDoc);
end;

procedure darxDocManager_Imp_documentToBeDeactivated(pDeActivatedDoc: TAcApDocument);
begin
  darxDocManager.documentToBeDeactivated(pDeActivatedDoc);
end;

procedure darxDocManager_Imp_documentActivated(pActivatedDoc: TAcApDocument);
begin
  darxDocManager.documentActivated(pActivatedDoc);
end;

{ TDArxDocumentItems }

function TDArxDocumentItems.GetDArxDocManager: TDArxDocManager;
begin
  Result := DoItemOf(acDocManager.curDocument);
end;

function TDArxDocumentItems.CreateObject(const Data: Pointer): Pointer;
begin
  Result := TDArxDocManager.Create(Data);
  DArxObj.DrxDocParams.AddDocument(Data);
  if Result = nil then exit;
  TDArxDocManager(Result).OnCreated;
end;

procedure TDArxDocumentItems.DestroyObject(const Obj: Pointer);
begin
  TDArxDocManager(Obj).OnToBeDestroyed;
  // ***
  DArxObj.DrxDocParams.DeleteDocument(TDArxDocManager(Obj).docData);
  TDArxDocManager(Obj).Free;
end;

function TDArxDocumentItems.IsEqualData(const Obj, Data: Pointer): Boolean;
begin
  Result := (TDArxDocManager(Obj).docData = Data);
end;

function TDArxDocumentItems.IndexOf(const Data: TAcApDocument): Integer;
begin
  Result := DoIndexOf(Data);
end;

procedure TDArxDocumentItems.Clear;
begin
  DoClear;
end;

function TDArxDocumentItems.Add(const NewdocData: TAcApDocument): Integer;
begin
  Result := AddObject(NewdocData);
end;

procedure TDArxDocumentItems.Delete(const DeldocData: TAcApDocument);
begin
  DeleteObject(DeldocData);
end;

procedure TDArxDocumentItems.ArxCommand(const CmdIndex: Integer);
var
  Obj: TDArxDocManager;
begin
  Obj := GetDArxDocManager;
  if (Obj <> nil) then Obj.OnArxCommand(CmdIndex);
end;

procedure TDArxDocumentItems.LispCommand(const CmdIndex: Integer; var ResCode: Integer);
var
  Obj: TDArxDocManager;
begin
  Obj := GetDArxDocManager;
  if (Obj <> nil) then Obj.OnArgsLispCommand(CmdIndex, ResCode);
end;

procedure TDArxDocumentItems.CallCommand(const CmdIndex: Integer; var ResCode: Integer);
var
  Obj: TDArxDocManager;
begin
  Obj := GetDArxDocManager;
  if (Obj <> nil) then Obj.OnCallCommand(CmdIndex, ResCode);
end;

procedure TDArxDocumentItems.Callback(const CallbackNo: Integer; const pParam: Pointer);
var
  Obj: TDArxDocManager;
begin
  Obj := GetDArxDocManager;
  if (Obj <> nil) then Obj.DoCallbackFunc(CallbackNo, pParam);
end;

procedure TDArxDocumentItems.documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pDoc);
  if (acObj <> nil) then acObj.OnLockModeWillChange(myCurrentMode, myNewMode, currentMode, pGlobalCmdName);
end;

procedure TDArxDocumentItems.documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pDoc);
  if (acObj <> nil) then acObj.OnLockModeChangeVetoed(pGlobalCmdName);
end;

procedure TDArxDocumentItems.documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pDoc);
  if (acObj <> nil) then acObj.OnLockModeChanged(myPreviousMode, myCurrentMode, currentMode, pGlobalCmdName);
end;

procedure TDArxDocumentItems.documentBecameCurrent(pDoc: TAcApDocument);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pDoc);
  if (acObj <> nil) then acObj.OnBecameCurrent;
end;

procedure TDArxDocumentItems.documentToBeActivated(pActivatingDoc: TAcApDocument);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pActivatingDoc);
  if (acObj <> nil) then acObj.OnToBeActivated;
end;

procedure TDArxDocumentItems.documentToBeDeactivated(pDeActivatedDoc: TAcApDocument);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pDeActivatedDoc);
  if (acObj <> nil) then acObj.OnToBeDeactivated;
end;

procedure TDArxDocumentItems.documentActivated(pActivatedDoc: TAcApDocument);
var
  acObj: TDArxDocManager;
begin
  acObj := DoItemOf(pActivatedDoc);
  if (acObj <> nil) then acObj.OnActivated;
end;

function SetAcadHandle: HWND;
begin
  if IsWindow(adsw_hwndAcad) then Result := adsw_hwndAcad else Result := adsw_acadMainWnd;
end;

procedure InitEnabledDocments;
var
  Iterator: TAcApDocumentIterator;
  docObj: TAcApDocument;
begin
  Iterator := acDocManager.newAcApDocumentIterator;
  if Iterator = nil then exit;
  try
    docObj := Iterator.document(0, Iterator);
    while (docObj <> nil) do begin
      darxDocManager.Add(docObj);
      Iterator.step(0, Iterator);
      docObj := Iterator.document(0, Iterator);
    end;
    delete_AcRxObject(Iterator);
    if Acad_Release then exit;
    docObj := acDocManager.curDocument;
    if docObj = nil then exit;
    darxDocManager.documentToBeActivated(docObj);
    darxDocManager.documentActivated(docObj);
  except
  end;
end;

procedure InitApplication;
begin
{$IFDEF DARXFORM}
  if (IsLibrary)and(Application <> nil)and(Application.Handle = 0) then Application.Handle := SetAcadHandle;
{$ENDIF}
end;

procedure FinalApplication;
begin
{$IFDEF DARXDEBUG}
  AdsDebug.darx_DebugClose;
{$ENDIF}
{$IFDEF DARXFORM}
  DArxForm.darx_CloseModalDialog;
  if (IsLibrary)and(Application <> nil)and(Application.Handle <> 0) then Application.Handle := 0;
{$ENDIF}
end;

end.
