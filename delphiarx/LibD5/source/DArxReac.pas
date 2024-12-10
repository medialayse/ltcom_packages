unit DArxReac;

// ******************************************************
//   DelphiARX2002 The reactors with natural composition
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
  Windows, SysUtils, Classes, DArxH, DrxIuTyp, DArxAds,
  AcRxCLib, AcEdCLib, AcApCLib, AcDxCLib, AcDbCLib, AcGeCLib, AetcCLib;

type
  TDAcRxDLinkerReactor = class;
  TDAcRxEventReactor = class;
  TDAcEditorReactor = class;
  TDAcApDocManagerReactor = class;
  TDAcDbLayoutManagerReactor = class;

  ///////////// [ENG] It is not possible to use following reactors.
  ///////////// [JPN] 以下はリアクタの機能を果たさない
  TDAcApProfileManagerReactor = class;
  TDAcApLongTransactionReactor = class;
  TDAcEdInputContextReactor = class;
  TDAcDbObjectReactor = class;
  //////////////////////////////////////////////

  TDArxDocumentReactor = class;

  TDArxReactorObject = class(TObject)
  private
    FReactorMode: Boolean;
  public
    constructor Create; virtual;
  end;

  TDAcRxDLinkerReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    procedure rxAppWillBeLoaded(const moduleName: AnsiString); virtual;
    procedure rxAppLoaded(const moduleName: AnsiString); virtual;
    procedure rxAppLoadAborted(const moduleName: AnsiString); virtual;
    procedure rxAppWillBeUnloaded(const moduleName: AnsiString); virtual;
    procedure rxAppUnloaded(const moduleName: AnsiString); virtual;
    procedure rxAppUnloadAborted(const moduleName: AnsiString); virtual;
  end;

  TDAcRxEventReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    // DWG/Save Events.
    procedure dwgFileOpened(pDwg: TAcDbDatabase; fileName: AnsiString); virtual;
    procedure initialDwgFileOpenComplete(pDwg: TAcDbDatabase); virtual;
    procedure databaseConstructed(pDwg: TAcDbDatabase); virtual;
    procedure databaseToBeDestroyed(pDwg: TAcDbDatabase); virtual;
    procedure beginSave(pDwg: TAcDbDatabase; const pIntendedName: AnsiString); virtual;
    procedure saveComplete(pDwg: TAcDbDatabase; const pActualName: AnsiString); virtual;
    procedure abortSave(pDwg: TAcDbDatabase); virtual;
    // DXF In/Out Events.
    procedure beginDxfIn(pDwg: TAcDbDatabase); virtual;
    procedure abortDxfIn(pDwg: TAcDbDatabase); virtual;
    procedure dxfInComplete(pDwg: TAcDbDatabase); virtual;
    procedure beginDxfOut(pDwg: TAcDbDatabase); virtual;
    procedure abortDxfOut(pDwg: TAcDbDatabase); virtual;
    procedure dxfOutComplete(pDwg: TAcDbDatabase); virtual;
    // Insert Events.
    procedure beginInsert(pTo: TAcDbDatabase; var xform: TAcGeMatrix3d; pFrom: TAcDbDatabase); overload; virtual;
    procedure beginInsert(pTo: TAcDbDatabase; const pBlockName: AnsiString; pFrom: TAcDbDatabase); overload; virtual;

    procedure otherInsert(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase); virtual;
    procedure abortInsert(pTo: TAcDbDatabase); virtual;
    procedure endInsert(pTo: TAcDbDatabase); virtual;
    // Wblock Events.
    procedure wblockNotice(pTo: TAcDbDatabase); virtual;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase); overload; virtual;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase; blockId: TAcDbObjectId); overload; virtual;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase; var insertionPoint: TAcGePoint3d); overload; virtual;
    procedure otherWblock(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase); virtual;
    procedure abortWblock(pTo: TAcDbDatabase); virtual;
    procedure endWblock(pTo: TAcDbDatabase); virtual;
    procedure beginWblockObjects(pFrom: TAcDbDatabase; var idMap: TAcDbIdMapping); virtual;
    // Deep Clone Events.
    procedure beginDeepClone(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping); virtual;
    procedure beginDeepCloneXlation(var idMap: TAcDbIdMapping; pRetStatus: TAcad_ErrorStatus); virtual;
    procedure abortDeepClone(var idMap: TAcDbIdMapping); virtual;
    procedure endDeepClone(var idMap: TAcDbIdMapping); virtual;
    // Partial Open Events.
    procedure partialOpenNotice(pDb: TAcDbDatabase); virtual;
  end;

  TDAcEditorReactor = class(TDAcRxEventReactor)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    // Command Events
    procedure unknownCommand(const cmdStr: AnsiString; al: TAcDbVoidPtrArray); virtual;
    procedure commandWillStart(const cmdStr: AnsiString); virtual;
    procedure commandEnded(const cmdStr: AnsiString); virtual;
    procedure commandCancelled(const cmdStr: AnsiString); virtual;
    procedure commandFailed(const cmdStr: AnsiString); virtual;
    // Lisp Events
    procedure lispWillStart(const firstLine: AnsiString); virtual;
    procedure lispEnded; virtual;
    procedure lispCancelled; virtual;
    procedure beginClose(pDwg: TAcDbDatabase); virtual;
    // DXF In/Out Events.
    procedure beginDxfIn(pDb: TAcDbDatabase); override;
    procedure abortDxfIn(pDb: TAcDbDatabase); override;
    procedure dxfInComplete(pDb: TAcDbDatabase); override;
    procedure beginDxfOut(pDwg: TAcDbDatabase); override;
    procedure abortDxfOut(pDwg: TAcDbDatabase); override;
    procedure dxfOutComplete(pDwg: TAcDbDatabase); override;
    // DWG Open Events.
    procedure beginDwgOpen(filename: AnsiString); virtual;
    procedure endDwgOpen(const filename: AnsiString); virtual;
    procedure initialDwgFileOpenComplete(pDwg: TAcDbDatabase); override;
    // DWG/Save Events.
    procedure dwgFileOpened(pDwg: TAcDbDatabase; filename: AnsiString); override;
    procedure databaseConstructed(pDwg: TAcDbDatabase); override;
    procedure databaseToBeDestroyed(pDwg: TAcDbDatabase); override;
    procedure beginSave(pDwg: TAcDbDatabase; const pIntendedName: AnsiString); override;
    procedure saveComplete(pDwg: TAcDbDatabase; const pActualName: AnsiString); override;
    procedure abortSave(pDwg: TAcDbDatabase); override;
    // Insert Events.
    procedure beginInsert(pTo: TAcDbDatabase; var xform: TAcGeMatrix3d; pFrom: TAcDbDatabase); overload; override;
    procedure beginInsert(pTo: TAcDbDatabase; const pBlockName: AnsiString; pFrom: TAcDbDatabase); overload; override;
    procedure otherInsert(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase); override;
    procedure abortInsert(pTo: TAcDbDatabase); override;
    procedure endInsert(pTo: TAcDbDatabase); override;
    // Wblock Events.
    procedure wblockNotice(pDb: TAcDbDatabase); override;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase); overload; override;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase; blockId: TAcDbObjectId); overload; override;
    procedure beginWblock(pTo, pFrom: TAcDbDatabase; var insertionPoint: TAcGePoint3d); overload; override;
    procedure otherWblock(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase); override;
    procedure abortWblock(pTo: TAcDbDatabase); override;
    procedure endWblock(pTo: TAcDbDatabase); override;
    // Deep Clone Events.
    procedure beginDeepClone(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping); override;
    procedure beginDeepCloneXlation(var idMap: TAcDbIdMapping; pRetStatus: TAcad_ErrorStatus); override;
    procedure abortDeepClone(var idMap: TAcDbIdMapping); override;
    procedure endDeepClone(var idMap: TAcDbIdMapping); override;
    // Sys Var Events.
    procedure sysVarChanged(const varName: AnsiString; success: TAdesk_Boolean); virtual;
    procedure sysVarWillChange(const varName: AnsiString); virtual;
    // XREF-related Events
    procedure beginAttach(pTo: TAcDbDatabase; const pName: AnsiString; pFrom: TAcDbDatabase); virtual;
    procedure otherAttach(pTo: TAcDbDatabase; pFrom: TAcDbDatabase); virtual;
    procedure abortAttach(pFrom: TAcDbDatabase); virtual;
    procedure endAttach(pTo: TAcDbDatabase); virtual;
    procedure redirected(newId, oldId: TAcDbObjectId); virtual;
    procedure comandeered(pTo: TAcDbDatabase; id: TAcDbObjectId; pFrom: TAcDbDatabase); virtual;
    procedure beginRestore(pTo: TAcDbDatabase; const pName: AnsiString; pFrom: TAcDbDatabase); virtual;
    procedure abortRestore(pTo: TAcDbDatabase); virtual;
    procedure endRestore(pTo: TAcDbDatabase); virtual;
    // More XREF related Events
    procedure xrefSubcommandBindItem(activity: Integer; blockId: TAcDbObjectId); virtual;
    procedure xrefSubcommandAttachItem(activity: Integer; const pPath: AnsiString); virtual;
    procedure xrefSubcommandOverlayItem(activity: Integer; const pPath: AnsiString); virtual;
    procedure xrefSubcommandDetachItem(activity: Integer; blockId: TAcDbObjectId); virtual;
    procedure xrefSubcommandPathItem(activity: Integer; blockId: TAcDbObjectId; const pNewPath: AnsiString); virtual;
    procedure xrefSubcommandReloadItem(activity: Integer; blockId: TAcDbObjectId); virtual;
    procedure xrefSubcommandUnloadItem(activity: Integer; blockId: TAcDbObjectId); virtual;
    // UNDO Events
    procedure undoSubcommandAuto(activity: Integer; state: TAdesk_Boolean); virtual;
    procedure undoSubcommandControl(activity: Integer; option: Integer); virtual;
    procedure undoSubcommandBegin(activity: Integer); virtual;
    procedure undoSubcommandEnd(activity: Integer); virtual;
    procedure undoSubcommandMark(activity: Integer); virtual;
    procedure undoSubcommandBack(activity: Integer); virtual;
    procedure undoSubcommandNumber(activity: Integer; num: Integer); virtual;
    procedure pickfirstModified; virtual;
    procedure layoutSwitched(const newLayoutName: AnsiString); virtual;
    //window messages
    procedure docFrameMovedOrResized(hwndDocFrame: Longint; bMoved: LongBool); virtual;
    procedure mainFrameMovedOrResized(hwndMainFrame: Longint; bMoved: LongBool); virtual;
    //Mouse events
    procedure beginDoubleClick(var clickPoint: TAcGePoint3d); virtual;
    procedure beginRightClick(var clickPoint: TAcGePoint3d); virtual;
    // Toolbar Size changes
    procedure toolbarBitmapSizeWillChange(bLarge: TAdesk_Boolean); virtual;
    procedure toolbarBitmapSizeChanged(bLarge: TAdesk_Boolean); virtual;
    // WblockObjects - begin new pFrom database
    procedure beginWblockObjects(pFrom: TAcDbDatabase; var idMap: TAcDbIdMapping); override;
    // Partial Open Events
    procedure partialOpenNotice(pDb: TAcDbDatabase); override;
    procedure objectsLazyLoaded(var idArray: TAcDbObjectIdArray); virtual;
    // Quit Events
    procedure beginQuit; virtual;
    procedure quitAborted; virtual;
    procedure quitWillStart; virtual;
    procedure modelessOperationWillStart(const contextStr: AnsiString); virtual;
    procedure modelessOperationEnded(const contextStr: AnsiString); virtual;
  end;

  TDAcApDocManagerReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    // Fired when a document is first instantiated no database is available.
    procedure documentCreateStarted(pDocCreating: TAcApDocument); virtual;
    // Fired when a document has been successfully created replaces kLoadDwgMsg.
    procedure documentCreated(pDocCreating: TAcApDocument); virtual;
    // Fired when a document is about to be destroyed replaces kUnloadDwgMsg
    procedure documentToBeDestroyed(pDocToDestroy: TAcApDocument); virtual;
    // Fired when a document is completely destroyed
    procedure documentDestroyed(const fileName: AnsiString); virtual;
    // Fired when a user action has cancelled a documents creation.
    // Only fired in MDI mode and after a documentCreateStarted
    procedure documentCreateCanceled(pDocCreateCancelled: TAcApDocument); virtual;
    procedure documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); virtual;
    procedure documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString); virtual;
    procedure documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); virtual;
    procedure documentBecameCurrent(pDoc: TAcApDocument); virtual;
    // This reactor is fired PRIOR to a document becoming activated
    // NOTE: The document context will not be set yet see also documentActivated()
    procedure documentToBeActivated(pActivatingDoc: TAcApDocument); virtual;
    // Parallel to documentToBeActivated
    procedure documentToBeDeactivated(pDeActivatedDoc: TAcApDocument); virtual;
    // Notify  of changes caused by disableDocumentActivation() or enableDocumentActivation().
    // bActivation == TRUE when document activation is enabled FALSE when disabled.
    procedure documentActivationModified(bActivation: LongBool); virtual;
    // This reactor is fired once a document has been activated and its context
    // successfully switched. NOTE: There are situations where document is
    // "activated" outside the normal UI user interaction. See also documentToBeActivated
    procedure documentActivated(pActivatedDoc: TAcApDocument); virtual;
    // friend class AcApDocImpManager;
  end;

  TDAcDbLayoutManagerReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    procedure layoutCreated(const newLayoutName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutToBeRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure abortLayoutRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutToBeCopied(const layoutName: AnsiString; const oldLayoutId: TAcDbObjectId); virtual;
    procedure layoutCopied(const oldLayoutName: AnsiString; const oldLayoutId: TAcDbObjectId; const newLayoutname: AnsiString; const newLayoutId: TAcDbObjectId); virtual;
    procedure abortLayoutCopied(const layoutName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutToBeRenamed(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutRenamed(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure abortLayoutRename(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure layoutSwitched(const newLayoutname: AnsiString; const layoutId: TAcDbObjectId); virtual;
    procedure plotStyleTableChanged(const newLayoutname: AnsiString; const layoutId: TAcDbObjectId); virtual;
  end;

  TDAcApProfileManagerReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    procedure currentProfileWillChange; virtual;
    procedure currentProfileChanged; virtual;
    procedure currentProfileWillBeReset; virtual;
    procedure currentProfileReset; virtual;
    procedure profileWillReset; virtual;
    procedure profileReset; virtual;
    procedure RxDestroy; virtual;
  end;

  TDAcApLongTransactionReactor = class(TObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    procedure beginCheckOut(var pTrans: TAcDbLongTransaction; var originList: TAcDbObjectIdArray); virtual;
    procedure endCheckOut(var pTrans: TAcDbLongTransaction); virtual;
    procedure beginCheckIn(var pTrans: TAcDbLongTransaction); virtual;
    procedure endCheckIn(var pTrans: TAcDbLongTransaction); virtual;
    procedure abortLongTransaction(var pTrans: TAcDbLongTransaction); virtual;
    // friend class AcApImpLongTransactionManager;
  end;

  TDAcEdInputContextReactor = class(TDArxReactorObject)
  public
    procedure AfterConstruction; override;
    destructor Destroy; override;

    procedure beginGetPoint(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetPoint(returnStatus: TAcad_PromptStatus; var pointOut: TAcGePoint3d; var pKeyword: PChar); virtual;
    procedure beginGetAngle(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeyword: AnsiString); virtual;
    procedure endGetAngle(returnStatus: TAcad_PromptStatus; var angle: double; var pKeyword: PChar); virtual;
    procedure beginGetDistance(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetDistance(returnStatus: TAcad_PromptStatus; var distance: double; var pKeyword: PChar); virtual;
    procedure beginGetOrientation(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetOrientation(returnStatus: TAcad_PromptStatus; var angle: double; var pKeyword: PChar); virtual;
    procedure beginGetCorner(const firstCorner: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetCorner(returnStatus: TAcad_PromptStatus; var secondCorner: TAcGePoint3d; var pKeyword: PChar); virtual;
    // *ScaleFactor is the same as *Distance, except a negative
    // value can be returned.  There is no exported ADS/LISP/ActiveX equivalent.
    procedure beginGetScaleFactor(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetScaleFactor(returnStatus: TAcad_PromptStatus; var distance: double; var pKeyword: PChar); virtual;
    // Begin Nongeometric value input contexts.
    // Design note:  No mistake, getstring() does NOT do keywords!
    procedure beginGetString(const promptString: AnsiString; initGetFlags: Integer); virtual;
    procedure endGetString(returnStatus: TAcad_PromptStatus; var pString: PChar); virtual;
    procedure beginGetKeyword(const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetKeyword(returnStatus: TAcad_PromptStatus; var pKeyword: PChar); virtual;
    procedure beginGetInteger(const dfault: Integer; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetInteger(returnStatus: TAcad_PromptStatus; var retValue: Integer; var pKeyword: PChar); virtual;
    // *Color() is effectively a ranged-checked *Integer()
    procedure beginGetColor(const dfault: Integer; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetColor(returnStatus: TAcad_PromptStatus; var retValue: Integer; var pKeyword: PChar); virtual;
    procedure beginGetReal(const dfault: double; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endGetReal(returnStatus: TAcad_PromptStatus; var returnValue: double; var pKeyword: PChar); virtual;
    procedure beginEntsel(const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endEntsel(returnStatus: TAcad_PromptStatus; entPicked: TAcDbObjectId; pickPoint: TAcGePoint3d; const pKeyword: AnsiString); virtual;
    procedure beginNentsel(const promptString: AnsiString; pickFlag: TAdesk_Boolean; initGetFlags: Integer; const pKeywords: AnsiString); virtual;
    procedure endNentsel(returnStatus: TAcad_PromptStatus; entPicked: TAcDbObjectId; var pickPoint: TAcGePoint3d; var xform: TAcGeMatrix3d; const referenceStack: Presbuf; const pKeyword: AnsiString); virtual;
    procedure beginSSGet(const pPrompt: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString; const pSSControls: AnsiString; var points: TAcArray; const entMask: Presbuf); virtual;
    procedure endSSGet(returnStatus: TAcad_PromptStatus; var ss: TAcArray); virtual;
    procedure beginDragSequence( const promptString: AnsiString); virtual;
    procedure endDragSequence(returnStatus: TAcad_PromptStatus; var pickPoint: TAcGePoint3d; var vec: TAcGeVector3d); virtual;
    // Quiescent state begin/end notification
    procedure beginQuiescentState; virtual;
    procedure endQuiescentState; virtual;
  end;

  TDAcDbObjectReactor = class(TDArxReactorObject)
  end;

// -----------------------------------------------------------------------------

  TLispArgsResbuf = class(TDReadResbuf)
  public
    function RetList(const Value: PResbuf): Boolean;
    function RetVal(const Value: PResbuf): Boolean;
    function RetPoint(const Value: Tads_Point): Boolean;
    function RetStr(const Value: AnsiString): Boolean;
    function RetEName(const Value: Tads_Name): Boolean;
    function RetPicks(const Value: Tads_Name): Boolean;
    function RetInt(const Value: Integer): Boolean;
    function RetLong(const Value: Longint): Boolean;
    function RetReal(const Value: Tads_Real): Boolean;
    procedure RetBool(const Value: Boolean);
    procedure RetVoid;
  end;

  TDocCallbackMethod = procedure(const CmdIndex: Integer; const pParam: Pointer) of object;

  TDArxDocumentReactor = class(TObject)
  private
    FCallbackMode: Integer;
    FRegCodeAdds: Integer;
    FdocParams: Pointer;
    FdocData: TAcApDocument;
    FlispArgs: TLispArgsResbuf;
  protected
    procedure LoadCreated; dynamic;
    procedure UnloadDestory; dynamic;
    procedure Callback(ModeNo: Integer); dynamic;
    procedure DoAssign(SourceObj: TDArxDocumentReactor); dynamic;

    property lispArgs: TLispArgsResbuf read FlispArgs; // ver1.13
  public
    constructor Create(CurrentDocument: TAcApDocument); virtual;
    destructor Destroy; override;
    procedure Assign(Source: TObject);

    function LockDoc(lockMode: TAcAp_DocLockMode = AcAp_kWrite; const pGlobalCmdName: AnsiString = ''; const pLocalCmdName: AnsiString = ''; prompt: LongBool = True): TAcad_ErrorStatus;
    function UnlockDoc: TAcad_ErrorStatus;

    procedure DoCallbackFunc(const CallbackNo: Integer; const pParam: Pointer);

    procedure OnArgsLispCommand(const CmdIndex: Integer; var ResCode: Integer); // ver1.13
    procedure OnLispCommand(const CmdIndex: Integer; var ResCode: Integer); virtual;
    procedure OnArxCommand(const CmdIndex: Integer); virtual;
    procedure OnCallCommand(const CmdIndex: Integer; var ResCode: Integer); virtual;
    procedure OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer); virtual;
    procedure OnCreated; virtual;
    procedure OnToBeDestroyed; virtual;
    procedure OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); virtual;
    procedure OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString); virtual;
    procedure OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); virtual;
    procedure OnBecameCurrent; virtual;
    procedure OnToBeActivated; virtual;
    procedure OnToBeDeactivated; virtual;
    procedure OnActivated; virtual;

    property docData: TAcApDocument read FdocData;
    property RegCodeAdds: Integer read FRegCodeAdds write FRegCodeAdds;
    property docParams: Pointer read FdocParams write FdocParams;
  end;

implementation

uses
  DArxLib, DArxObj, AextCLib;

{ TDArxReactorObject }

constructor TDArxReactorObject.Create;
begin
  inherited Create;
  FReactorMode := False;
end;

{ TDAcRxDLinkerReactor }

procedure TDAcRxDLinkerReactor.AfterConstruction;
begin
  if (NOT FReactorMode) then acrxDynamicLinker.addReactor(Self);
  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcRxDLinkerReactor.Destroy;
begin
  if (FReactorMode) then acrxDynamicLinker.removeReactor(Self);
  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcRxDLinkerReactor.rxAppWillBeLoaded(const moduleName: AnsiString);
begin
end;

procedure TDAcRxDLinkerReactor.rxAppLoaded(const moduleName: AnsiString);
begin
end;

procedure TDAcRxDLinkerReactor.rxAppLoadAborted(const moduleName: AnsiString);
begin
end;

procedure TDAcRxDLinkerReactor.rxAppWillBeUnloaded(const moduleName: AnsiString);
begin
end;

procedure TDAcRxDLinkerReactor.rxAppUnloaded(const moduleName: AnsiString);
begin
end;

procedure TDAcRxDLinkerReactor.rxAppUnloadAborted(const moduleName: AnsiString);
begin
end;

{ TDAcRxEventReactor }

procedure TDAcRxEventReactor.AfterConstruction;
begin
  if (NOT FReactorMode) then acrxEvent.addReactor(Self);
  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcRxEventReactor.Destroy;
begin
  if (FReactorMode) then acrxEvent.removeReactor(Self);
  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcRxEventReactor.dwgFileOpened(pDwg: TAcDbDatabase; fileName: AnsiString);
begin
end;

procedure TDAcRxEventReactor.initialDwgFileOpenComplete(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.databaseConstructed(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.databaseToBeDestroyed(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginSave(pDwg: TAcDbDatabase; const pIntendedName: AnsiString);
begin
end;

procedure TDAcRxEventReactor.saveComplete(pDwg: TAcDbDatabase; const pActualName: AnsiString);
begin
end;

procedure TDAcRxEventReactor.abortSave(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginDxfIn(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.abortDxfIn(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.dxfInComplete(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginDxfOut(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.abortDxfOut(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.dxfOutComplete(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginInsert(pTo: TAcDbDatabase; var xform: TAcGeMatrix3d; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginInsert(pTo: TAcDbDatabase; const pBlockName: AnsiString; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.otherInsert(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.abortInsert(pTo: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.endInsert(pTo: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.wblockNotice(pTo: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginWblock(pTo, pFrom: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginWblock(pTo, pFrom: TAcDbDatabase; blockId: TAcDbObjectId);
begin
end;

procedure TDAcRxEventReactor.beginWblock(pTo, pFrom: TAcDbDatabase; var insertionPoint: TAcGePoint3d);
begin
end;

procedure TDAcRxEventReactor.otherWblock(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.abortWblock(pTo: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.endWblock(pTo: TAcDbDatabase);
begin
end;

procedure TDAcRxEventReactor.beginWblockObjects(pFrom: TAcDbDatabase; var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcRxEventReactor.beginDeepClone(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcRxEventReactor.beginDeepCloneXlation(var idMap: TAcDbIdMapping; pRetStatus: TAcad_ErrorStatus);
begin
end;

procedure TDAcRxEventReactor.abortDeepClone(var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcRxEventReactor.endDeepClone(var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcRxEventReactor.partialOpenNotice(pDb: TAcDbDatabase);
begin
end;

{ TDAcEditorReactor }

procedure TDAcEditorReactor.AfterConstruction;
begin
  if (NOT FReactorMode) then acedEditor.addReactor(Self);
  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcEditorReactor.Destroy;
begin
  if (FReactorMode) then acedEditor.removeReactor(Self);
  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcEditorReactor.unknownCommand(const cmdStr: AnsiString; al: TAcDbVoidPtrArray);
begin
end;

procedure TDAcEditorReactor.commandWillStart(const cmdStr: AnsiString);
begin
end;

procedure TDAcEditorReactor.commandEnded(const cmdStr: AnsiString);
begin
end;

procedure TDAcEditorReactor.commandCancelled(const cmdStr: AnsiString);
begin
end;

procedure TDAcEditorReactor.commandFailed(const cmdStr: AnsiString);
begin
end;

procedure TDAcEditorReactor.lispWillStart(const firstLine: AnsiString);
begin
end;

procedure TDAcEditorReactor.lispEnded;
begin
end;

procedure TDAcEditorReactor.lispCancelled;
begin
end;

procedure TDAcEditorReactor.beginClose(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginDxfIn(pDb: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortDxfIn(pDb: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.dxfInComplete(pDb: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginDxfOut(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortDxfOut(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.dxfOutComplete(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginDwgOpen(filename: AnsiString);
begin
end;

procedure TDAcEditorReactor.endDwgOpen(const filename: AnsiString);
begin
end;

procedure TDAcEditorReactor.initialDwgFileOpenComplete(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.dwgFileOpened(pDwg: TAcDbDatabase; filename: AnsiString);
begin
end;

procedure TDAcEditorReactor.databaseConstructed(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.databaseToBeDestroyed(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginSave(pDwg: TAcDbDatabase; const pIntendedName: AnsiString);
begin
end;

procedure TDAcEditorReactor.saveComplete(pDwg: TAcDbDatabase; const pActualName: AnsiString);
begin
end;

procedure TDAcEditorReactor.abortSave(pDwg: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginInsert(pTo: TAcDbDatabase; var xform: TAcGeMatrix3d; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginInsert(pTo: TAcDbDatabase; const pBlockName: AnsiString; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.otherInsert(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortInsert(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.endInsert(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.wblockNotice(pDb: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginWblock(pTo, pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginWblock(pTo, pFrom: TAcDbDatabase; blockId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.beginWblock(pTo, pFrom: TAcDbDatabase; var insertionPoint: TAcGePoint3d);
begin
end;

procedure TDAcEditorReactor.otherWblock(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortWblock(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.endWblock(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginDeepClone(pTo: TAcDbDatabase; var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcEditorReactor.beginDeepCloneXlation(var idMap: TAcDbIdMapping; pRetStatus: TAcad_ErrorStatus);
begin
end;

procedure TDAcEditorReactor.abortDeepClone(var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcEditorReactor.endDeepClone(var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcEditorReactor.sysVarChanged(const varName: AnsiString; success: TAdesk_Boolean);
begin
end;

procedure TDAcEditorReactor.sysVarWillChange(const varName: AnsiString);
begin
end;

procedure TDAcEditorReactor.beginAttach(pTo: TAcDbDatabase; const pName: AnsiString; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.otherAttach(pTo: TAcDbDatabase; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortAttach(pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.endAttach(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.redirected(newId, oldId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.comandeered(pTo: TAcDbDatabase; id: TAcDbObjectId; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.beginRestore(pTo: TAcDbDatabase; const pName: AnsiString; pFrom: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.abortRestore(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.endRestore(pTo: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandBindItem(activity: Integer; blockId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandAttachItem(activity: Integer; const pPath: AnsiString);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandOverlayItem(activity: Integer; const pPath: AnsiString);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandDetachItem(activity: Integer; blockId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandPathItem(activity: Integer; blockId: TAcDbObjectId; const pNewPath: AnsiString);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandReloadItem(activity: Integer; blockId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.xrefSubcommandUnloadItem(activity: Integer; blockId: TAcDbObjectId);
begin
end;

procedure TDAcEditorReactor.undoSubcommandAuto(activity: Integer; state: TAdesk_Boolean);
begin
end;

procedure TDAcEditorReactor.undoSubcommandControl(activity: Integer; option: Integer);
begin
end;

procedure TDAcEditorReactor.undoSubcommandBegin(activity: Integer);
begin
end;

procedure TDAcEditorReactor.undoSubcommandEnd(activity: Integer);
begin
end;

procedure TDAcEditorReactor.undoSubcommandMark(activity: Integer);
begin
end;

procedure TDAcEditorReactor.undoSubcommandBack(activity: Integer);
begin
end;

procedure TDAcEditorReactor.undoSubcommandNumber(activity: Integer; num: Integer);
begin
end;

procedure TDAcEditorReactor.pickfirstModified;
begin
end;

procedure TDAcEditorReactor.layoutSwitched(const newLayoutName: AnsiString);
begin
end;

procedure TDAcEditorReactor.docFrameMovedOrResized(hwndDocFrame: Longint; bMoved: LongBool);
begin
end;

procedure TDAcEditorReactor.mainFrameMovedOrResized(hwndMainFrame: Longint; bMoved: LongBool);
begin
end;

procedure TDAcEditorReactor.beginDoubleClick(var clickPoint: TAcGePoint3d);
begin
end;

procedure TDAcEditorReactor.beginRightClick(var clickPoint: TAcGePoint3d);
begin
end;

procedure TDAcEditorReactor.toolbarBitmapSizeWillChange(bLarge: TAdesk_Boolean);
begin
end;

procedure TDAcEditorReactor.toolbarBitmapSizeChanged(bLarge: TAdesk_Boolean);
begin
end;

procedure TDAcEditorReactor.beginWblockObjects(pFrom: TAcDbDatabase; var idMap: TAcDbIdMapping);
begin
end;

procedure TDAcEditorReactor.partialOpenNotice(pDb: TAcDbDatabase);
begin
end;

procedure TDAcEditorReactor.objectsLazyLoaded(var idArray: TAcDbObjectIdArray);
begin
end;

procedure TDAcEditorReactor.beginQuit;
begin
end;

procedure TDAcEditorReactor.quitAborted;
begin
end;

procedure TDAcEditorReactor.quitWillStart;
begin
end;

procedure TDAcEditorReactor.modelessOperationWillStart(const contextStr: AnsiString);
begin
end;

procedure TDAcEditorReactor.modelessOperationEnded(const contextStr: AnsiString);
begin
end;

{ TDAcApDocManagerReactor }

procedure TDAcApDocManagerReactor.AfterConstruction;
begin
  if (NOT FReactorMode) then acDocManager.addReactor(Self);
  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcApDocManagerReactor.Destroy;
begin
  if (FReactorMode) then acDocManager.removeReactor(Self);
  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcApDocManagerReactor.documentCreateStarted(pDocCreating: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentCreated(pDocCreating: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentToBeDestroyed(pDocToDestroy: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentDestroyed(const fileName: AnsiString);
begin
end;

procedure TDAcApDocManagerReactor.documentCreateCanceled(pDocCreateCancelled: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentLockModeWillChange(pDoc: TAcApDocument; myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
end;

procedure TDAcApDocManagerReactor.documentLockModeChangeVetoed(pDoc: TAcApDocument; const pGlobalCmdName: AnsiString);
begin
end;

procedure TDAcApDocManagerReactor.documentLockModeChanged(pDoc: TAcApDocument; myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
end;

procedure TDAcApDocManagerReactor.documentBecameCurrent(pDoc: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentToBeActivated(pActivatingDoc: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentToBeDeactivated(pDeActivatedDoc: TAcApDocument);
begin
end;

procedure TDAcApDocManagerReactor.documentActivationModified(bActivation: LongBool);
begin
end;

procedure TDAcApDocManagerReactor.documentActivated(pActivatedDoc: TAcApDocument);
begin
end;

{ TDAcDbLayoutManagerReactor }

procedure TDAcDbLayoutManagerReactor.AfterConstruction;
begin
  if (NOT FReactorMode) then acdbLayoutManager.addReactor(Self);
  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcDbLayoutManagerReactor.Destroy;
begin
  if (FReactorMode) then acdbLayoutManager.removeReactor(Self);
  FReactorMode := False;
  inherited Destroy;
end;


procedure TDAcDbLayoutManagerReactor.layoutCreated(const newLayoutName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutToBeRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.abortLayoutRemoved(const layoutName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutToBeCopied(const layoutName: AnsiString; const oldLayoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutCopied(const oldLayoutName: AnsiString; const oldLayoutId: TAcDbObjectId; const newLayoutname: AnsiString; const newLayoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.abortLayoutCopied(const layoutName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutToBeRenamed(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutRenamed(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.abortLayoutRename(const oldName, newName: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.layoutSwitched(const newLayoutname: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

procedure TDAcDbLayoutManagerReactor.plotStyleTableChanged(const newLayoutname: AnsiString; const layoutId: TAcDbObjectId);
begin
end;

{ TDAcApProfileManagerReactor }

procedure TDAcApProfileManagerReactor.AfterConstruction;
begin
//  if (NOT FReactorMode) then XXX.addReactor(Self);
//  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcApProfileManagerReactor.Destroy;
begin
//  if (FReactorMode) then XXX.removeReactor(Self);
//  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcApProfileManagerReactor.currentProfileWillChange;                                                                                                                                                                                     // virtual void currentProfileWillChange(const char *newProfile);
begin
end;

procedure TDAcApProfileManagerReactor.currentProfileChanged;                                                                                                                                                                                        // virtual void currentProfileChanged(const char *newProfile);
begin
end;

procedure TDAcApProfileManagerReactor.currentProfileWillBeReset;                                                                                                                                                                                      // virtual void currentProfileWillBeReset(const char *currentProfile);
begin
end;

procedure TDAcApProfileManagerReactor.currentProfileReset;                                                                                                                                                                                            // virtual void currentProfileReset(const char *currentProfile);
begin
end;

procedure TDAcApProfileManagerReactor.profileWillReset;                                                                                                                                                                                             // virtual void profileWillReset(const char *profileName);
begin
end;

procedure TDAcApProfileManagerReactor.profileReset;                                                                                                                                                                                               // virtual void profileReset(const char *profileName);
begin
end;

procedure TDAcApProfileManagerReactor.RxDestroy;
begin
end;

{ TDAcApLongTransactionReactor }

procedure TDAcApLongTransactionReactor.AfterConstruction;
begin
//  if (NOT FReactorMode) then XXX.addReactor(Self);
//  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcApLongTransactionReactor.Destroy;
begin
//  if (FReactorMode) then XXX.removeReactor(Self);
//  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcApLongTransactionReactor.beginCheckOut(var pTrans: TAcDbLongTransaction; var originList: TAcDbObjectIdArray);
begin
end;

procedure TDAcApLongTransactionReactor.endCheckOut(var pTrans: TAcDbLongTransaction);
begin
end;

procedure TDAcApLongTransactionReactor.beginCheckIn(var pTrans: TAcDbLongTransaction);
begin
end;

procedure TDAcApLongTransactionReactor.endCheckIn(var pTrans: TAcDbLongTransaction);
begin
end;

procedure TDAcApLongTransactionReactor.abortLongTransaction(var pTrans: TAcDbLongTransaction);
begin
end;

{ TDAcEdInputContextReactor }

procedure TDAcEdInputContextReactor.AfterConstruction;
begin
//  if (NOT FReactorMode) then XXX.addReactor(Self);
//  FReactorMode := True;
  inherited AfterConstruction;
end;

destructor TDAcEdInputContextReactor.Destroy;
begin
//  if (FReactorMode) then XXX.removeReactor(Self);
//  FReactorMode := False;
  inherited Destroy;
end;

procedure TDAcEdInputContextReactor.beginGetPoint(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetPoint(returnStatus: TAcad_PromptStatus; var pointOut: TAcGePoint3d; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetAngle(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeyword: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetAngle(returnStatus: TAcad_PromptStatus; var angle: double; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetDistance(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetDistance(returnStatus: TAcad_PromptStatus; var distance: double; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetOrientation(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetOrientation(returnStatus: TAcad_PromptStatus; var angle: double; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetCorner(const firstCorner: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetCorner(returnStatus: TAcad_PromptStatus; var secondCorner: TAcGePoint3d; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetScaleFactor(const pointIn: TAcGePoint3d; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetScaleFactor(returnStatus: TAcad_PromptStatus; var distance: double; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetString(const promptString: AnsiString; initGetFlags: Integer);
begin
end;

procedure TDAcEdInputContextReactor.endGetString(returnStatus: TAcad_PromptStatus; var pString: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetKeyword(const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetKeyword(returnStatus: TAcad_PromptStatus; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetInteger(const dfault: Integer; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetInteger(returnStatus: TAcad_PromptStatus; var retValue: Integer; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetColor(const dfault: Integer; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetColor(returnStatus: TAcad_PromptStatus; var retValue: Integer; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginGetReal(const dfault: double; const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endGetReal(returnStatus: TAcad_PromptStatus; var returnValue: double; var pKeyword: PChar);
begin
end;

procedure TDAcEdInputContextReactor.beginEntsel(const promptString: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endEntsel(returnStatus: TAcad_PromptStatus; entPicked: TAcDbObjectId; pickPoint: TAcGePoint3d; const pKeyword: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.beginNentsel(const promptString: AnsiString; pickFlag: TAdesk_Boolean; initGetFlags: Integer; const pKeywords: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endNentsel(returnStatus: TAcad_PromptStatus; entPicked: TAcDbObjectId; var pickPoint: TAcGePoint3d; var xform: TAcGeMatrix3d; const referenceStack: Presbuf; const pKeyword: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.beginSSGet(const pPrompt: AnsiString; initGetFlags: Integer; const pKeywords: AnsiString; const pSSControls: AnsiString; var points: TAcArray; const entMask: Presbuf);
begin
end;

procedure TDAcEdInputContextReactor.endSSGet(returnStatus: TAcad_PromptStatus; var ss: TAcArray);
begin
end;

procedure TDAcEdInputContextReactor.beginDragSequence( const promptString: AnsiString);
begin
end;

procedure TDAcEdInputContextReactor.endDragSequence(returnStatus: TAcad_PromptStatus; var pickPoint: TAcGePoint3d; var vec: TAcGeVector3d);
begin
end;

procedure TDAcEdInputContextReactor.beginQuiescentState;
begin
end;

procedure TDAcEdInputContextReactor.endQuiescentState;
begin
end;

{ TLispArgsResbuf }

function TLispArgsResbuf.RetList(const Value: PResbuf): Boolean;
begin
  Result := (extern_acedRetList(Value) = RTNORM);
end;

function TLispArgsResbuf.RetVal(const Value: PResbuf): Boolean;
begin
  Result := (extern_acedRetVal(Value) = RTNORM);
end;

function TLispArgsResbuf.RetPoint(const Value: Tads_Point): Boolean;
begin
  Result := (extern_acedRetPoint(@Value) = RTNORM);
end;

function TLispArgsResbuf.RetStr(const Value: AnsiString): Boolean;
begin
  Result := (extern_acedRetStr(PChar(Value)) = RTNORM);
end;

function TLispArgsResbuf.RetEName(const Value: Tads_Name): Boolean;
begin
  Result := (extern_acedRetName(@Value, RTENAME) = RTNORM);
end;

function TLispArgsResbuf.RetPicks(const Value: Tads_Name): Boolean;
begin
  Result := (extern_acedRetName(@Value, RTPICKS) = RTNORM);
end;

function TLispArgsResbuf.RetInt(const Value: Integer): Boolean;
begin
  Result := (extern_acedRetInt(Value) = RTNORM);
end;

function TLispArgsResbuf.RetLong(const Value: Longint): Boolean;
begin
  Result := (extern_darxRetLong(Value) = RTNORM);
end;

function TLispArgsResbuf.RetReal(const Value: Tads_Real): Boolean;
begin
  Result := (extern_acedRetReal(Value) = RTNORM);
end;

procedure TLispArgsResbuf.RetBool(const Value: Boolean);
begin
  if Value then extern_acedRetT else extern_acedRetNil;
end;

procedure TLispArgsResbuf.RetVoid;
begin
  extern_acedRetVoid;
end;

{ TDArxDocumentReactor }

constructor TDArxDocumentReactor.Create(CurrentDocument: TAcApDocument);
begin
  inherited Create;
  FCallbackMode := 0;
  FRegCodeAdds := -1;
  FdocParams := nil;
  FdocData := CurrentDocument;
  FlispArgs := nil;
  try
    LoadCreated;
  except
  end;
end;

destructor TDArxDocumentReactor.Destroy;
begin
  try
    UnloadDestory;
  finally
    if FlispArgs <> nil then FlispArgs.Free;
    FlispArgs := nil;
    extern_acad_free(FdocParams); // FreeMem
    inherited Destroy;
  end;
end;

procedure TDArxDocumentReactor.LoadCreated;
begin
end;

procedure TDArxDocumentReactor.UnloadDestory;
begin
end;

procedure TDArxDocumentReactor.Callback(ModeNo: Integer);
begin
  FCallbackMode := ModeNo;
end;

procedure TDArxDocumentReactor.Assign(Source: TObject);
begin
  if NOT (Source is TDArxDocumentReactor) then exit;
  FdocData := TDArxDocumentReactor(Source).docData;
  DoAssign(TDArxDocumentReactor(Source));
end;

function TDArxDocumentReactor.LockDoc(lockMode: TAcAp_DocLockMode = AcAp_kWrite; const pGlobalCmdName: AnsiString = ''; const pLocalCmdName: AnsiString = ''; prompt: LongBool = True): TAcad_ErrorStatus;
begin
  Result := acDocManager.lockDocument(FdocData, lockMode, pGlobalCmdName, pLocalCmdName, prompt);
end;

function TDArxDocumentReactor.UnlockDoc: TAcad_ErrorStatus;
begin
  Result := acDocManager.unlockDocument(FdocData);
end;

procedure TDArxDocumentReactor.DoCallbackFunc(const CallbackNo: Integer; const pParam: Pointer);
begin
  if (FCallbackMode <> 0)and(CallbackNo = FCallbackMode) then OnCallbackFunc(CallbackNo, pParam);
end;

procedure TDArxDocumentReactor.DoAssign(SourceObj: TDArxDocumentReactor);
begin
end;

procedure TDArxDocumentReactor.OnArgsLispCommand(const CmdIndex: Integer; var ResCode: Integer);
begin
  if FlispArgs = nil then FlispArgs := TLispArgsResbuf.Create;
  FlispArgs.cast(extern_acedGetArgs);
  extern_acedRetNil;
  OnLispCommand(CmdIndex, ResCode);
  FlispArgs.erase;
end;

procedure TDArxDocumentReactor.OnLispCommand(const CmdIndex: Integer; var ResCode: Integer);
begin
end;

procedure TDArxDocumentReactor.OnArxCommand(const CmdIndex: Integer);
begin
end;

procedure TDArxDocumentReactor.OnCallCommand(const CmdIndex: Integer; var ResCode: Integer);
begin
end;

procedure TDArxDocumentReactor.OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer);
begin
end;

procedure TDArxDocumentReactor.OnCreated;
begin
end;

procedure TDArxDocumentReactor.OnToBeDestroyed;
begin
end;

procedure TDArxDocumentReactor.OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
end;

procedure TDArxDocumentReactor.OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString);
begin
end;

procedure TDArxDocumentReactor.OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin
end;

procedure TDArxDocumentReactor.OnBecameCurrent;
begin
end;

procedure TDArxDocumentReactor.OnToBeActivated;
begin
end;

procedure TDArxDocumentReactor.OnToBeDeactivated;
begin
end;

procedure TDArxDocumentReactor.OnActivated;
begin
end;

end.
