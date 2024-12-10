unit DArxObj;

// ******************************************************
//   DelphiARX2002 The objects with natural composition
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
  Windows, SysUtils, Classes, DArxH, DArxList, DArxReac,
  AcRxCLib, AcEdCLib, AcApCLib, AcDxCLib, AcTrCLib, AcDbCLib,
  AcGiCLib, AcGeCLib, AetcCLib;

type
  TDAcRxObject = class;
  TDAcRxDictionary = class;
  TDAcRxDynamicLinker = class;
  TDAcApDocManager = class;
  TDAcRxEvent = class;
  TDAcRxService = class;
  TDAcRxKernel = class;
  TDAcEdCommandStack = class;
  TDAcEditor = class;
  TDAcDbLayoutManager = class;
  TDAcDbHostApplicationServices = class;
  TDAcGiDrawable = class;
  TDAcDbObject = class;
  TDAcDbDataBase = class;

  TDAcRxObject = class(TObject)
  protected
    FFreeRxObj: Boolean;
    FRxObject: TAcRxObject;
    constructor Create(FreeRxObject: Boolean = True);
    procedure DestroyRxObject; virtual;
  public
    constructor assignCreate(const SourceRxObject: TAcRxObject = nil);
    destructor Destroy; override;
    function rxCast(CastRxObject: TAcRxObject): TAcRxObject; virtual;
    function RxObject: TAcRxObject;
    procedure Assign(Source: TDAcRxObject); virtual;
    function IsObject: Boolean; virtual;

    function isKindOf(const aClass: TAcRxClass): LongBool;
    function x(protocolClass: TAcRxClass): TAcRxObject;
    function queryX(protocolClass: TAcRxClass): TAcRxObject;
    function isA: TAcRxClass; virtual;
    function clone: TAcRxObject; virtual;
    function copyFrom(const other: TAcRxObject): TAcad_ErrorStatus; virtual;
    function isEqualTo(const other: TAcRxObject): TAdesk_Boolean; virtual;
    function comparedTo(const other: TAcRxObject): TAcRx_Ordering; virtual;
    property FreeRxObj: Boolean read FFreeRxObj write FFreeRxObj;
  end;

  TDGlobalAcRxObject = class(TDAcRxObject)
  private
    FKey: AnsiString;
  public
    constructor Create(const Key: PChar = nil);
  end;

  TDAcRxDictionary = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcRxDictionary;
    function at(id: TAdesk_UInt32): TAcRxObject; overload; virtual;
    function at(const key: AnsiString): TAcRxObject; overload; virtual;
    function atPut(id: TAdesk_UInt32; pObject: TAcRxObject): TAcRxObject; overload; virtual;
    function atPut(const key: AnsiString; pObject: TAcRxObject; retId: TAdesk_UInt32): TAcRxObject; overload; virtual;
    function atPut(const key: AnsiString; pObject: TAcRxObject): TAcRxObject; overload;
    function resetKey(id: TAdesk_UInt32; const newKey: AnsiString): TAdesk_Boolean; overload; virtual;
    function resetKey(const oldKey: AnsiString; const newKey: AnsiString): TAdesk_Boolean; overload; virtual;
    function atKeyAndIdPut(const newKey: AnsiString; id: TAdesk_UInt32; pObject: TAcRxObject): TAdesk_Boolean; virtual;
    function remove(id: TAdesk_UInt32): TAcRxObject; overload; virtual;
    function remove(const key: AnsiString): TAcRxObject; overload; virtual;
    function has(id: TAdesk_UInt32): TAdesk_Boolean; overload; virtual;
    function has(const entryName: AnsiString): TAdesk_Boolean; overload; virtual;
    function idAt(const key: AnsiString): TAdesk_UInt32; virtual;
    function keyAt(id: TAdesk_UInt32): AnsiString; virtual;
    function numEntries: TAdesk_UInt32; virtual;
    function newIterator(iType: TAcRx_DictIterType = 0 {AcRx_kDictSorted}): TAcRxDictionaryIterator; virtual;
    function deletesObjects: TAdesk_Boolean; virtual;
    function isCaseSensitive: TAdesk_Boolean; virtual;
    function isSorted: TAdesk_Boolean; virtual;
  end;

  TDAcRxDynamicLinker = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcRxDynamicLinker;
    function getSymbolAddress(const serviceName, symbol: AnsiString): Pointer; virtual;
    function initListedModules(const fileName: AnsiString): LongBool; virtual;
    function loadModule(const fileName: AnsiString; printit: LongBool; asCmd: LongBool = False): LongBool; virtual;
    function loadApp(const appName: AnsiString; al: TAcadApp_LoadReasons; printit: LongBool; asCmd: LongBool = False): LongBool; virtual;
    function registerService(serviceName: AnsiString; serviceObj: TAcRxService): TAcRxObject; virtual;
    function unloadModule(const fileName: AnsiString; asCmd: LongBool = False): LongBool; virtual;
    function unloadApp(const appName: AnsiString; asCmd: LongBool = False): LongBool; virtual;
    procedure addReactor(newReactor: TDAcRxDLinkerReactor); virtual;
    procedure removeReactor(oldReactor: TDAcRxDLinkerReactor); virtual;
    function isApplicationLocked(const modulename: AnsiString): LongBool; virtual;
    function lockApplication(appId: Pointer): LongBool; virtual;
    function unlockApplication(appId: Pointer): LongBool; virtual;
    function isAppMDIAware(const modulename: AnsiString): LongBool; virtual;
    function registerAppMDIAware(appId: Pointer): LongBool; virtual;
    function registerAppNotMDIAware(appId: Pointer): LongBool; virtual;
    function isAppBusy(const modulename: AnsiString): LongBool; virtual;
    procedure setAppBusy(const modulename: AnsiString; bBusyFlag: LongBool); virtual;
    function ProductKey: AnsiString; virtual;
    function ProductLcid: TAdesk_UInt32; virtual;
  end;

  TDAcApDocManager = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcApDocManager;
    function curDocument: TAcApDocument; virtual;
    function mdiActiveDocument: TAcApDocument; virtual;
    function isApplicationContext: LongBool; virtual;
    function document(pDb: TAcDbDatabase): TAcApDocument; virtual;
    function lockDocument(pDoc: TAcApDocument; lockMode: TAcAp_DocLockMode = AcAp_kWrite; const pGlobalCmdName: AnsiString = ''; const pLocalCmdName: AnsiString = ''; prompt: LongBool = True): TAcad_ErrorStatus; virtual;
    function unlockDocument(pDoc: TAcApDocument): TAcad_ErrorStatus; virtual;
    function newAcApDocumentIterator: TAcApDocumentIterator; virtual;
    procedure addReactor(pDocManReactor: TAcApExportedByMistake); overload; virtual;
    procedure addReactor(pDocManReactor: TDAcApDocManagerReactor); overload; virtual;
    procedure removeReactor(pDocManReactor: TAcApExportedByMistake); overload; virtual;
    procedure removeReactor(pDocManReactor: TDAcApDocManagerReactor); overload; virtual;
    function exportedByMistake: TAcRxIterator; virtual;
    function setDefaultFormatForSave(format: TAcApDocument_SaveFormat): TAcad_ErrorStatus; virtual;
    function setCurDocument(pDoc: TAcApDocument; lockMode: TAcAp_DocLockMode = AcAp_kNone; activate: LongBool = False): TAcad_ErrorStatus; virtual;
    function activateDocument(pAcTargetDocument: TAcApDocument; bPassScript: LongBool = False): TAcad_ErrorStatus; virtual;
    function sendStringToExecute(pAcTargetDocument: TAcApDocument; const pszExecute: AnsiString; bActivate: LongBool = True; bWrapUpInactiveDoc: LongBool = False; bEchoString: LongBool = True): TAcad_ErrorStatus; virtual;
    function appContextNewDocument(const pszTemplateName: AnsiString): TAcad_ErrorStatus; virtual;
    function appContextOpenDocument(const pszDrawingName: AnsiString): TAcad_ErrorStatus; virtual;
    function newDocument: TAcad_ErrorStatus; virtual;
    function openDocument: TAcad_ErrorStatus; virtual;
    function closeDocument(pAcTargetDocument: TAcApDocument): TAcad_ErrorStatus; virtual;
    function inputPending(pAcTargetDocument: TAcApDocument): integer; virtual;
    function disableDocumentActivation: TAcad_ErrorStatus; virtual;
    function enableDocumentActivation: TAcad_ErrorStatus; virtual;
    function isDocumentActivationEnabled: LongBool; virtual;
    procedure executeInApplicationContext(pFunc: PprocAddr; pData: Pointer); virtual;
    function documentCount: integer; virtual;
    procedure pushResourceHandle(hNewResourceHandle: Longint); virtual;
    procedure pushAcadResourceHandle; virtual;
    procedure popResourceHandle; virtual;
  end;

  TDAcRxEvent = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcRxEvent;
    procedure addReactor(newObj: TDAcRxEventReactor);
    procedure removeReactor(delObj: TDAcRxEventReactor);
  end;

  TDAcRxService = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcRxService;
    function getSysInfo: TAcRxObject;
    procedure setSysInfo(sysInfoObj: TAcRxObject);
    procedure addDependency;
    procedure removeDependency;
    function unloadable: TAdesk_Boolean;
    function dependencyFunctionPtr: PDepFuncPtr;
    procedure setDependencyFunctionPtr(dptr: PDepFuncPtr);
  end;

  TDAcRxKernel = class(TDAcRxService)
  public
    function RxObject: TAcRxKernel;
    function newAcRxDictionary(const filter: TAcRxClass): TAcRxDictionary; overload; virtual;
    function newAcRxDictionary(length: Longword; delObjects: TAdesk_Boolean; sorted: TAdesk_Boolean = True{= Adesk_kTrue}; ignoreCase: TAdesk_Boolean = False{= Adesk_kFalse}): TAcRxDictionary; overload; virtual;
    function newAcRxDictionary(sorted: TAdesk_Boolean = True {Adesk_kTrue}; ignoreCase: TAdesk_Boolean = False {Adesk_kFalse}): TAcRxDictionary; overload; virtual;
  end;

  TDAcEdCommandStack = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcEdCommandStack;
    function atPut(const cmdGroupName: AnsiString; var cmdsGlobal: TAcRxDictionary; var cmdsLocal: TAcRxDictionary): LongBool; virtual;
    function addCommand(const cmdGroupName, cmdGlobalName, cmdLocalName: AnsiString; commandFlags: TAdesk_Int32; FunctionAddr: PAcRxFunctionPtr;
                        UIContext: TAcEdUIContext = nil; fcode: integer = -1; hResourceHandle: Longint = 0; cmdPtrRet: TAcEdCommand = nil): TAcad_ErrorStatus; virtual;
    function iterator: TAcEdCommandIterator; virtual;
    function lookupGlobalCmd(const cmdName: AnsiString): TAcEdCommand; virtual;
    function lookupLocalCmd(const cmdName: AnsiString): TAcEdCommand; virtual;
    function lookupCmd(const cmdName: AnsiString; globalFlag, allGroupsFlag, skipUndefed: LongBool): TAcEdCommand; overload; virtual;
    function lookupCmd(const cmdName: AnsiString; GlobalFlag, allGroupsFlag: LongBool): TAcEdCommand; overload; virtual;
    function lookupCmd(cmdName: AnsiString; globalFlag: LongBool): TAcEdCommand; overload; virtual;
    function lookupCmd2(const cmdName: AnsiString; globalFlag, allGroupsFlag: LongBool; skipFlags: integer; match: LongBool = False): TAcEdCommand; virtual;
    function popGroupToTop(const cmdGroupName: AnsiString): TAcad_ErrorStatus; virtual;
    function removeCmd(const cmdGroupName: AnsiString; const cmdGlobalName: AnsiString): TAcad_ErrorStatus; virtual;
    function removeGroup(const groupName: AnsiString): TAcad_ErrorStatus; virtual;
  end;

  TDAcEditor = class(TDAcRxEvent)
  public
    function RxObject: TAcEditor;
    procedure addReactor(newObj: TDAcEditorReactor);
    procedure removeReactor(delObj: TDAcEditorReactor);
  end;

  TDAcDbLayoutManager = class(TDGlobalAcRxObject)
  public
    function RxObject: TAcDbLayoutManager;

    function setCurrentLayout(const newname: AnsiString): TAcad_ErrorStatus; virtual;
    function setCurrentLayoutId(layoutId: TAcDbObjectId): TAcad_ErrorStatus; virtual;
    function findActiveLayout(allowModel: TAdesk_Boolean): AnsiString; virtual;
    function getActiveLayoutBTRId: TAcDbObjectId; virtual;
    function findLayoutNamed(const name: AnsiString; leaveRecordOpen: TAdesk_Boolean = False): TAcDbLayout; virtual;
    function copyLayout(const copyname, newname: AnsiString): TAcad_ErrorStatus; virtual;
    function deleteLayout(delname: AnsiString): TAcad_ErrorStatus; virtual;
    function createLayout(const newname: AnsiString; var layoutId, blockTableRecId: TAcDbObjectId; pDatabase: TAcDbDatabase = nil): TAcad_ErrorStatus; virtual;
    function renameLayout(const oldname, newname: AnsiString): TAcad_ErrorStatus; virtual;
    function cloneLayout(pLBTR: TAcDbLayout;  const newname: AnsiString; newTabOrder: Integer = 0): TAcad_ErrorStatus; virtual;
    function getNonRectVPIdFromClipId(clipId: TAcDbObjectId): TAcDbObjectId; virtual;
    function isVpnumClipped(index: Smallint): LongBool; virtual;
    function countLayouts(useDb: TAcDbDatabase = nil):Integer; virtual;
    procedure addReactor(newObj: TDAcDbLayoutManagerReactor); virtual;
    procedure removeReactor(delObj: TDAcDbLayoutManagerReactor); virtual;
  end;

  TDAcDbHostApplicationServices = class(TDAcRxObject)
  public
    function RxObject: TAcDbHostApplicationServices; virtual;
    function findFile(pcFullPathOut: AnsiString; nBufferLength: Integer; const pcFilename: AnsiString; pDb: TAcDbDatabase = nil; hint: TAcDbHostApplicationServices_FindFileHint = AcDbHostApplicationServices_kDefault): TAcad_ErrorStatus; virtual;
    function selectFile(userCancel: PSmallint; var chosenPath: AnsiString; h: Pointer; const nFlags: Integer; const prompt, dir, name, atype: AnsiString; pnChoice: PInteger; pbReadOnly: PLongBool; const pszWSTags: AnsiString; pReserved: Pointer): TAcad_ErrorStatus; virtual;
    function registerSelectFileCallback(const appName: AnsiString; proc: PSELECTFILEPROC; unRegister: LongBool = False; asPrimary: LongBool = False): TAcad_ErrorStatus; virtual;
    function primaryClientForSelectFileCallback: AnsiString; virtual;
    function getRegisteredSelectFileClients(var clients: TAcArray): TAcad_ErrorStatus; virtual;
    function mapFile(var newName: AnsiString; const filename: AnsiString; context: Integer; pReserved: Pointer): TAcad_ErrorStatus; virtual;
    function registerMapFileCallback(const appName: AnsiString; proc: PREMAPPROC; unRegister: LongBool = False; asPrimary: LongBool = False): TAcad_ErrorStatus; virtual;
    function primaryClientForMapFileCallback: AnsiString; virtual;
    function setMapFlag(setIt: LongBool): LongBool; virtual;
    function getRegisteredFileMapClients(var clients: TAcArray): TAcad_ErrorStatus; virtual;
    function registerMapFileNotification(const appName:AnsiString; proc: PMAPFILENOTIFYPROC; unRegister: LongBool = False): TAcad_ErrorStatus; virtual;
    procedure fatalError(format: array of AnsiString); virtual;
    procedure reportUnhandledArxException(const pExcPtrs: PEXCEPTION_POINTERS; const pAppName: AnsiString); virtual;
    function userBreak(updCtrlsWhenEnteringIdle: LongBool = true): TAdesk_Boolean; virtual;
    procedure displayChar(c: Shortint); virtual;
    procedure displayString(astring: AnsiString; count: Integer); virtual;
    function readyToDisplayMessages: TAdesk_Boolean; virtual;
    procedure enableMessageDisplay(ra: TAdesk_Boolean); virtual;
    function doFullCRCCheck: TAdesk_Boolean; virtual;
    function getTempPath(lBufferSize: TAdesk_UInt32; pcBuffer: AnsiString): Longword; virtual;
    function getEnv(const avar: AnsiString): AnsiString; virtual;
    function newProgressMeter: TAcDbHostApplicationProgressMeter; virtual;
    procedure setWorkingProgressMeter(pNewMeter: TAcDbHostApplicationProgressMeter);
    function newClipBoundaryRectangular: TAcDbAbstractClipBoundaryDefinitionz; virtual;
    function newClipBoundaryPolygonal: TAcDbAbstractClipBoundaryDefinition; virtual;
    function newClipBoundaryArray: TClipBoundaryArray; virtual;
    function workingDatabase: TAcDbDatabase;
    procedure setWorkingDatabase(pDatabase: TAcDbDatabase);
    function defaultUndoController: TAcDbUndoController; virtual;
    procedure setDefaultUndoController(pUndoCtrl: TAcDbUndoController);
    function workingTransactionManager: TAcDbTransactionManager; virtual;
    procedure setWorkingTransactionManager(pTM: TAcDbTransactionManager);
    function createWorkingGlobals: TAcDbGlobals; virtual;
    function workingGlobals: TAcDbGlobals;
    procedure setWorkingGlobals(pGlobals: TAcDbGlobals);
    function workingAppSysvars: TAcDbAppSystemVariables;
    procedure setWorkingAppSysvars(pSysvars: TAcDbAppSystemVariables);
    function rxProgram: AnsiString; virtual;
    function product: AnsiString; virtual;
    function companyName: AnsiString; virtual;
    function prodcode: TProdIdCode; virtual;
    function releaseMajorMinorString: AnsiString; virtual;
    function releaseMajorVersion: Integer; virtual;
    function releaseMinorVersion: Integer; virtual;
    function versionString: AnsiString; virtual;
    function getRegistryProductRootKey: AnsiString; virtual;
    function getRegistryProductLCID: TLCID; virtual;
    procedure setSystemCodePage(id: Tcode_page_id);
    function getSystemCodePage: Tcode_page_id;
    function acadInternalServices: TAcadInternalServices; virtual;
    procedure acadInternalGetvar(const name: AnsiString);
    function isURL(const pszURL: AnsiString): TAdesk_Boolean; virtual;
    function isRemoteFile(const pszLocalFile: AnsiString; pszURL: AnsiString): TAdesk_Boolean; virtual;
    function getRemoteFile(const pszURL: AnsiString; pszLocalFile: AnsiString; bIgnoreCache: TAdesk_Boolean = Adesk_kFalse): TAcad_ErrorStatus; virtual;
    function putRemoteFile(const pszURL: AnsiString; const pszLocalFile: AnsiString): TAcad_ErrorStatus; virtual;
    function launchBrowserDialog(pszSelectedURL: AnsiString; const pszDialogTitle, pszOpenButtonCaption, pszStartURL: AnsiString; const pszRegistryRootKey: AnsiString = ''; bOpenButtonAlwaysEnabled: TAdesk_Boolean = Adesk_kFalse): TAdesk_Boolean; virtual;
    procedure drawOleOwnerDrawItem(pItem: TposCOleClientItem; hdc, left, top, right, bottom: Longint); virtual;
    function getNewOleClientItem(var pItem: TposCOleClientItem): TAcad_ErrorStatus; virtual;
    function serializeOleItem(pItem: TposCOleClientItem; obj: TposCArchive): TAcad_ErrorStatus; virtual;
    function entToWorldTransform(normal: Tads_point; tran: Tflagmat): TAdesk_Boolean; virtual;
    procedure terminateScript; virtual;
    function getSubstituteFont(var pFileName: AnsiString; prompt: AnsiString; atype, fontAlt: Integer): TAdesk_Boolean; virtual;
    procedure alert(const astring: AnsiString); virtual;
    procedure auditPrintReport(pAuditInfo: TAcDbAuditInfo; const line: AnsiString; both: Integer); virtual;
    function getAlternateFontName: AnsiString; virtual;
    function getFontMapFileName: AnsiString; virtual;
    function cacheSymbolIndices: LongBool; virtual;
    function plotSettingsValidator: TAcDbPlotSettingsValidator; virtual;
    function layoutManager: TAcDbLayoutManager; virtual;
    function loadApp(const appName: AnsiString; why: TAcadApp_LoadReasons; printit, asCmd: LongBool): LongBool; virtual;
    procedure getDefaultPlotCfgInfo(plotDeviceName, plotStyleName: AnsiString); virtual;
  end;

  TDGlobalAcDbHostApplicationServices = class(TDAcDbHostApplicationServices)
  public
    function RxObject: TAcDbHostApplicationServices; override;
  end;

  TDAcGiDrawable = class(TDAcRxObject)
  public
    function RxObject: TAcGiDrawable;
    function setAttributes(pTraits: TAcGiDrawableTraits): TAdesk_UInt32; virtual;
    function worldDraw(pWd: TAcGiWorldDraw): TAdesk_Boolean; virtual;
    procedure viewportDraw(pVd: TAcGiViewportDraw); virtual;
    function isPersistent: TAdesk_Boolean; virtual;
    function id: TposAcDbObjectId; virtual;
    procedure setGsNode(pNode: TAcGsNode); virtual;
    function gsNode: TAcGsNode; virtual;
    function viewportDrawLogicalFlags(vd: TAcGiViewportDraw): TAdesk_UInt32; virtual;
  end;

  TDAcDbObject = class(TDAcGiDrawable)
  public
    function RxObject: TAcDbObject;
    // Associated Objects
    function objectId: TAcDbObjectId;
    function ownerId: TAcDbObjectId;
    function setOwnerId(objId: TAcDbObjectId): TAcad_ErrorStatus; virtual;
    procedure getAcDbHandle(var handle: TAcDbHandle);
    function database: TAcDbDatabase;
    function createExtensionDictionary: TAcad_ErrorStatus;
    function extensionDictionary: TAcDbObjectId;
    function releaseExtensionDictionary: TAcad_ErrorStatus;
    // Open/Close/Cancel/Undo/Erase
    function upgradeOpen: TAcad_ErrorStatus;
    function upgradeFromNotify: TAcad_ErrorStatus;
    function downgradeOpen: TAcad_ErrorStatus;
    function downgradeToNotify: TAcad_ErrorStatus;
    function subOpen: TAcad_ErrorStatus; virtual;

    function cancel: TAcad_ErrorStatus;
    function subCancel: TAcad_ErrorStatus; virtual;

    function close: TAcad_ErrorStatus;
    function closeAndPage(onlyWhenClean: TAdesk_Boolean = True): TAcad_ErrorStatus;
    function subClose: TAcad_ErrorStatus; virtual;

    function erase(erasing: TAdesk_Boolean = True): TAcad_ErrorStatus;
    function subErase(erasing: TAdesk_Boolean): TAcad_ErrorStatus; virtual;

    function handOverTo(newObject: TAcDbObject; keepXData: TAdesk_Boolean = True; keepExtDict: TAdesk_Boolean = True): TAcad_ErrorStatus;
    function subHandOverTo(newObject: TAcDbObject): TAcad_ErrorStatus; virtual;

    function swapIdWith(otherId: TAcDbObjectId; swapXdata: TAdesk_Boolean = False; swapExtDict: TAdesk_Boolean = False): TAcad_ErrorStatus;
    function subSwapIdWith(otherId: TAcDbObjectId; swapXdata: TAdesk_Boolean = False; swapExtDict: TAdesk_Boolean = False): TAcad_ErrorStatus; virtual;

    function swapReferences(var idMap: TAcDbIdMapping): TAcad_ErrorStatus; virtual;
    // Audit
    function audit(pAuditInfo: TAcDbAuditInfo): TAcad_ErrorStatus; virtual;
    // Filing
    function dwgIn(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
    function dwgInFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus; virtual;
    function dwgOut(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
    function dwgOutFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus; virtual;

    function dxfIn(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
    function dxfInFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus; virtual;
    function dxfOut(pFiler: TAcDbDwgFiler; allXdFlag: TAdesk_Boolean; regAppTable: TAdesk_uchar): TAcad_ErrorStatus;
    function dxfOutFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus; virtual;
    // Merge style for insert-style operations. Defaults to kDrcIgnore.
    function mergeStyle: TAcDb_DuplicateRecordCloning; virtual;
    // XData
    function xData(const regappName: AnsiString = ''): Presbuf; virtual;
    function setXData(const xdata: Presbuf): TAcad_ErrorStatus; virtual;
    function xDataTransformBy(var xform: TAcGeMatrix3d): TAcad_ErrorStatus;
    // XObject
    // Open/Notify/Undo/Modified State Predicates
    function isEraseStatusToggled: TAdesk_Boolean;
    function isErased: TAdesk_Boolean;
    function isReadEnabled: TAdesk_Boolean;
    function isWriteEnabled: TAdesk_Boolean;
    function isNotifyEnabled: TAdesk_Boolean;
    function isModified: TAdesk_Boolean;
    function isModifiedXData: TAdesk_Boolean;
    function isModifiedGraphics: TAdesk_Boolean;
    function isNewObject: TAdesk_Boolean;
    function isNotifying: TAdesk_Boolean;
    function isUndoing: TAdesk_Boolean;
    function isCancelling: TAdesk_Boolean;
    function isReallyClosing: TAdesk_Boolean;
    function isTransactionResident: TAdesk_Boolean;
    // Formerly isAZombie()
    function isAProxy: TAdesk_Boolean;
    // Access State Assertions
    procedure assertReadEnabled;
    procedure assertWriteEnabled(autoUndo: TAdesk_Boolean = True; recordModified: TAdesk_Boolean = True);
    procedure assertNotifyEnabled;
    // Undo
    procedure disableUndoRecording(disable: TAdesk_Boolean);
    function undoFiler: TAcDbDwgFiler;
    function applyPartialUndo(undoFiler: TAcDbDwgFiler; classObj: TAcRxClass): TAcad_ErrorStatus; virtual;
    // Notification
    procedure addReactor(newObj: TDAcDbObjectReactor);
    procedure removeReactor(delObj: TDAcDbObjectReactor);
    procedure addPersistentReactor(objId: TAcDbObjectId); virtual;
    function removePersistentReactor(objId: TAcDbObjectId): TAcad_ErrorStatus; virtual;
    function reactors: TAcDbVoidPtrArray;
    procedure recvPropagateModify(const subObj: TAcDbObject); virtual;
    procedure xmitPropagateModify; virtual;
    function deepClone(pOwnerObject: TAcDbObject; var pClonedObject: TAcDbObject; var idMap: TAcDbIdMapping; isPrimary: TAdesk_Boolean = True): TAcad_ErrorStatus; virtual;
    function wblockClone(pOwnerObject: TAcDbObject; var pClonedObject: TAcDbObject; var idMap: TAcDbIdMapping; isPrimary: TAdesk_Boolean = True): TAcad_ErrorStatus; virtual;
    procedure setAcDbObjectIdsInFlux;
    function isAcDbObjectIdsInFlux : TAdesk_Boolean;
    // Notification for persistent reactors.
    procedure cancelled(const dbObj: TAcDbObject); virtual;
    procedure copied(const dbObj: TAcDbObject; const newObj: TAcDbObject); virtual;
    procedure erased(const dbObj: TAcDbObject; pErasing: TAdesk_Boolean = True); virtual;
    procedure goodbye(const dbObj: TAcDbObject); virtual;
    procedure openedForModify(const dbObj: TAcDbObject); virtual;
    procedure modified(const dbObj: TAcDbObject); virtual;
    procedure subObjModified(const dbObj: TAcDbObject; const subObj: TAcDbObject); virtual;
    procedure modifyUndone(const dbObj: TAcDbObject); virtual;
    procedure modifiedXData(const dbObj: TAcDbObject); virtual;
    procedure unappended(const dbObj: TAcDbObject); virtual;
    procedure reappended(const dbObj: TAcDbObject); virtual;
    procedure objectClosed(const objId: TAcDbObjectId); virtual;
    procedure modifiedGraphics(const dbEnt: TAcDbEntity); virtual;
    // AcRxObject Protocol
    // Derived classes should not override these member implementations.
    function clone: TAcRxObject; override;
    function copyFrom(const pSrc: TAcRxObject): TAcad_ErrorStatus; override;
    // Save to previous versions.
    function hasSaveVersionOverride: LongBool;
    procedure setHasSaveVersionOverride(bSetIt: LongBool);

    function getObjectSaveVersion(const pFiler: TAcDbDwgFiler; var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus; overload; virtual;
    function getObjectSaveVersion(const pFiler: TAcDbDxfFiler; var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus; overload; virtual;
    function getObjectBirthVersion(var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus;
    // saveasr13.
    function decomposeForSave(ver: TAcDb_AcDbDwgVersion; var replaceObj: TAcDbObject; var replaceId: TAcDbObjectId; var exchangeXData: TAdesk_Boolean): TAcad_ErrorStatus; virtual;
    function drawable: TAcGiDrawable; virtual;

    // AcGiDrawable interface
    function setAttributes(pTraits: TAcGiDrawableTraits): TAdesk_UInt32; override;
    function worldDraw(pWd: TAcGiWorldDraw): TAdesk_Boolean; override;
    procedure viewportDraw(pVd: TAcGiViewportDraw); override;
    function isPersistent: TAdesk_Boolean; override;
    function id: TposAcDbObjectId; override;
    procedure setGsNode(pNode: TAcGsNode); override;
    function gsNode: TAcGsNode; override;
    // Get corresponding COM wrapper class ID
    function getClassID(pClsid: PGUID): TAcad_ErrorStatus; virtual;
  end;

  TDAcDbDatabase = class(TDAcRxObject)
  public
    constructor Create(buildDefaultDrawing: LongBool = True; noDocument: LongBool = False); virtual;
    function RxObject: TAcDbDataBase;
    function addAcDbObject(pObj: TposAcDbObject): TAcad_ErrorStatus; overload;
    function addAcDbObject(var objId: TAcDbObjectId; pObj: TposAcDbObject): TAcad_ErrorStatus; overload;
    function getBlockTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getBlockTable(var pTable: TposAcDbBlockTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getLayerTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getLayerTable(var pTable: TposAcDbLayerTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getTextStyleTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getTextStyleTable(var pTable: TposAcDbTextStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getLinetypeTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getLinetypeTable(var pTable: TposAcDbLinetypeTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getViewTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getViewTable(var pTable: TposAcDbViewTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getUCSTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getUCSTable(var pTable: TposAcDbUCSTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getViewportTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getViewportTable(var pTable: TposAcDbViewportTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getRegAppTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getRegAppTable(var pTable: TposAcDbRegAppTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getDimStyleTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getDimStyleTable(var pTable: TposAcDbDimStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbBlockTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbLayerTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbTextStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbLinetypeTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbViewTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbUCSTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbViewportTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbRegAppTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getSymbolTable(var pTable: TposAcDbDimStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus; overload;
    function getGroupDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function getMLStyleDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function getLayoutDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function getPlotStyleNameDictionary(var pDict: TposAcDbDictionaryWithDefault; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function getNamedObjectsDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function getPlotSettingsDictionary(var pTable: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
    function blockTableId: TAcDbObjectId;
    function layerTableId: TAcDbObjectId;
    function textStyleTableId: TAcDbObjectId;
    function linetypeTableId: TAcDbObjectId;
    function viewTableId: TAcDbObjectId;
    function UCSTableId: TAcDbObjectId;
    function viewportTableId: TAcDbObjectId;
    function regAppTableId: TAcDbObjectId;
    function dimStyleTableId: TAcDbObjectId;
    function mLStyleDictionaryId: TAcDbObjectId;
    function groupDictionaryId: TAcDbObjectId;
    function layoutDictionaryId: TAcDbObjectId;
    function plotStyleNameDictionaryId: TAcDbObjectId;
    function namedObjectsDictionaryId: TAcDbObjectId;
    function plotSettingsDictionaryId: TAcDbObjectId;
    function layerZero: TAcDbObjectId;
    function continuousLinetype: TAcDbObjectId;
    function byLayerLinetype: TAcDbObjectId;
    function byBlockLinetype: TAcDbObjectId;
    function paperSpaceVportId: TAcDbObjectId;
    function currentSpaceId: TAcDbObjectId;
    function purge(var ids: TposAcDbObjectIdArray): TAcad_ErrorStatus;
    function countHardReferences(const ids: TposAcDbObjectIdArray; pCount: TAdesk_UInt32): TAcad_ErrorStatus;
    function getAcDbObjectId(retId: TAcDbObjectId; createIfNotFound: LongBool; const objHandle: TposAcDbHandle; xRefId: TAdesk_UInt32 = 0): TAcad_ErrorStatus;
    function classDxfName(const pClass: TAcRxClass): AnsiString;
    function readDwgFile(const fileName: AnsiString; shmode: Integer = SH_DENYWR; bAllowCPConversion: LongBool = False): TAcad_ErrorStatus;
    function saveAs(const fileName: AnsiString): TAcad_ErrorStatus; overload;
    function saveAs(pOutputFiler: TposAcDbDwgFiler): TAcad_ErrorStatus; overload;
    function save: TAcad_ErrorStatus;
    function dxfIn(const dxfFilename: AnsiString; const logFilename: AnsiString = ''): TAcad_ErrorStatus;
    function dxfOut(const dxfFilename: AnsiString; const precision: Integer = 16; const saveThumbnailImage: LongBool = False): TAcad_ErrorStatus;
    function closeInput: TAcad_ErrorStatus;
    function approxNumObjects: Integer;
    function numberOfSaves: TAdesk_Int32;
    function originalFileName: AnsiString;
    function lastSavedAsVersion: TAcDb_AcDbDwgVersion;
    function originalFileVersion: TAcDb_AcDbDwgVersion;
    function originalFileSavedByVersion: TAcDb_AcDbDwgVersion;
    function lastSavedAsMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
    function originalFileMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
    function originalFileSavedByMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
    function inputFiler: TposAcDbDwgFiler;
    class function open(var pNewDb: TAcDbDatabase; pInputFiler: TposAcDbDwgFiler; enableUndo: LongBool = False; noDocument: LongBool = False): TAcad_ErrorStatus;
    class function salvage(var pNewDb: TAcDbDatabase; pInputFiler: TposAcDbDwgFiler; noDocument: LongBool = False): TAcad_ErrorStatus;
    function wblock(var pOutputDb: TAcDbDatabase; const outObjIds: TposAcDbObjectIdArray; const basePoint: TposAcGePoint3d): TAcad_ErrorStatus; overload;
    function wblock(var pOutputDb: TAcDbDatabase; blockId: TAcDbObjectId): TAcad_ErrorStatus; overload;
    function wblock(var pOutputDb: TAcDbDatabase): TAcad_ErrorStatus; overload;
    procedure forceWblockDatabaseCopy;
    function insert(var blockId: TAcDbObjectId; const pBlockName: AnsiString; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus; overload;
    function insert(const xform: TposAcGeMatrix3d; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus; overload;
    function insert(var blockId: TAcDbObjectId; const pSourceBlockName: AnsiString; const pDestinationBlockName: AnsiString; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus; overload;
    function deepCloneObjects(var objectIds: TposAcDbObjectIdArray; var owner: TAcDbObjectId; var idMap: TAcDbIdMapping; deferXlation: LongBool = False): TAcad_ErrorStatus;
    function wblockCloneObjects(var objectIds: TposAcDbObjectIdArray; var owner: TAcDbObjectId; var idMap: TAcDbIdMapping; drc: TAcDb_DuplicateRecordCloning; deferXlation: LongBool = False): TAcad_ErrorStatus;
    procedure abortDeepClone(var idMap: TAcDbIdMapping);
    procedure addReactor(pReactor: TposAcDbDatabaseReactor);
    procedure removeReactor(pReactor: TposAcDbDatabaseReactor);
    function audit(pInfo: TposAcDbAuditInfo): TAcad_ErrorStatus;
    function auditXData(pInfo: TposAcDbAuditInfo): TAcad_ErrorStatus;
    function undoController: TposAcDbUndoController;
    procedure disableUndoRecording(disable: LongBool);
    function undoRecording: LOngBool;
    function transactionManager: TposAcDbTransactionManager;
    function maintenanceReleaseVersion: TAdesk_UInt8;
    function restoreOriginalXrefSymbols: TAcad_ErrorStatus;
    function restoreForwardingXrefSymbols: TAcad_ErrorStatus;
    function xrefBlockId: TAcDbObjectId;
    function thumbnailBitmap: Pointer;
    function setThumbnailBitmap(pBmp: Pointer): TAcad_ErrorStatus;
    function retainOriginalThumbnailBitmap: LongBool;
    procedure setRetainOriginalThumbnailBitmap(retain: LongBool);
    function dimaso: LongBool;
    function setDimaso(aso: LongBool): TAcad_ErrorStatus;
    function dimsho: LongBool;
    function setDimsho(aso: LongBool): TAcad_ErrorStatus;
    function plinegen: LongBool;
    function setPlinegen(gen: LongBool): TAcad_ErrorStatus;
    function orthomode: LongBool;
    function setOrthomode(mode: LongBool): TAcad_ErrorStatus;
    function regenmode: LongBool;
    function setRegenmode(mode: LongBool): TAcad_ErrorStatus;
    function fillmode: LongBool;
    function setFillmode(mode: LongBool): TAcad_ErrorStatus;
    function qtextmode: LongBool;
    function setQtextmode(mode: LongBool): TAcad_ErrorStatus;
    function psltscale: LongBool;
    function setPsltscale(scale: LongBool): TAcad_ErrorStatus;
    function limcheck: LongBool;
    function setLimcheck(check: LongBool): TAcad_ErrorStatus;
    function blipmode: LongBool;
    function setBlipmode(mode: LongBool): TAcad_ErrorStatus;
    function saveproxygraphics:TAdesk_Int16;
    function setSaveproxygraphics(saveimg: TAdesk_Int16): TAcad_ErrorStatus;
    function delUsedObj: LongBool;
    function setDelUsedObj(deleteObj: LongBool): TAcad_ErrorStatus;
    function dispSilh: LongBool;
    function setDispSilh(silh: LongBool): TAcad_ErrorStatus;
    function plineEllipse: LongBool;
    function setPlineEllipse(pline: LongBool): TAcad_ErrorStatus;
    function usrtimer: LongBool;
    function setUsrtimer(timer: LongBool): TAcad_ErrorStatus;
    function skpoly: LongBool;
    function setSkpoly(asPoly: LongBool): TAcad_ErrorStatus;
    function angdir: LongBool;
    function setAngdir(dir: LongBool): TAcad_ErrorStatus;
    function splframe: LongBool;
    function setSplframe(disp: LongBool): TAcad_ErrorStatus;
    function attreq: LongBool;
    function setAttreq(req: LongBool): TAcad_ErrorStatus;
    function attdia: LongBool;
    function setAttdia(dia: LongBool): TAcad_ErrorStatus;
    function mirrtext: LongBool;
    function setMirrtext(mirror: LongBool): TAcad_ErrorStatus;
    function worldview: LongBool;
    function setWorldview(view: LongBool): TAcad_ErrorStatus;
    function tilemode: LongBool;
    function setTilemode(mode: LongBool): TAcad_ErrorStatus;
    function plimcheck: LongBool;
    function setPlimcheck(check: LongBool): TAcad_ErrorStatus;
    function visretain: LongBool;
    function setVisretain(retain: LongBool): TAcad_ErrorStatus;
    function dragmode:TAdesk_Int16;
    function setDragmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function treedepth:TAdesk_Int16;
    function setTreedepth(depth: TAdesk_Int16): TAcad_ErrorStatus;
    function lunits:TAdesk_Int16;
    function setLunits(lunits: TAdesk_Int16): TAcad_ErrorStatus;
    function luprec:TAdesk_Int16;
    function setLuprec(prec: TAdesk_Int16): TAcad_ErrorStatus;
    function aunits: TAdesk_Int16;
    function setAunits(aunits: TAdesk_Int16): TAcad_ErrorStatus;
    function auprec: TAdesk_Int16;
    function setAuprec(auprec: TAdesk_Int16): TAcad_ErrorStatus;
    function osmode: TAdesk_Int16;
    function setOsmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function attmode: TAdesk_Int16;
    function setAttmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function coords: TAdesk_Int16;
    function setCoords(coords: TAdesk_Int16): TAcad_ErrorStatus;
    function pdmode: TAdesk_Int16;
    function setPdmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function pickstyle: TAdesk_Int16;
    function setPickstyle(style: TAdesk_Int16): TAcad_ErrorStatus;
    function useri1: TAdesk_Int16;
    function setUseri1(val: TAdesk_Int16): TAcad_ErrorStatus;
    function useri2: TAdesk_Int16;
    function setUseri2(val: TAdesk_Int16): TAcad_ErrorStatus;
    function useri3: TAdesk_Int16;
    function setUseri3(val: TAdesk_Int16): TAcad_ErrorStatus;
    function useri4: TAdesk_Int16;
    function setUseri4(val: TAdesk_Int16): TAcad_ErrorStatus;
    function useri5:TAdesk_Int16;
    function setUseri5(val: TAdesk_Int16): TAcad_ErrorStatus;
    function splinesegs:TAdesk_Int16;
    function setSplinesegs(segs: TAdesk_Int16): TAcad_ErrorStatus;
    function surfu: TAdesk_Int16;
    function setSurfu(u: TAdesk_Int16): TAcad_ErrorStatus;
    function surfv: TAdesk_Int16;
    function setSurfv(v: TAdesk_Int16): TAcad_ErrorStatus;
    function surftype: TAdesk_Int16;
    function setSurftype(atype: TAdesk_Int16): TAcad_ErrorStatus;
    function surftab1: TAdesk_Int16;
    function setSurftab1(tab1: TAdesk_Int16): TAcad_ErrorStatus;
    function surftab2: TAdesk_Int16;
    function setSurftab2(tab2: TAdesk_Int16): TAcad_ErrorStatus;
    function splinetype: TAdesk_Int16;
    function setSplinetype(atype: TAdesk_Int16): TAcad_ErrorStatus;
    function shadedge: TAdesk_Int16;
    function setShadedge(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function shadedif: TAdesk_Int16;
    function setShadedif(def: TAdesk_Int16): TAcad_ErrorStatus;
    function measurement: TAcDb_MeasurementValue;
    function setMeasurement(atype: TAcDb_MeasurementValue): TAcad_ErrorStatus;
    function unitmode: TAdesk_Int16;
    function setUnitmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
    function maxactvp: TAdesk_Int16;
    function setMaxactvp(max: TAdesk_Int16): TAcad_ErrorStatus;
    function isolines: TAdesk_Int16;
    function setIsolines(isolines: TAdesk_Int16): TAcad_ErrorStatus;
    function ltscale: Double;
    function setLtscale(scale: Double): TAcad_ErrorStatus;
    function textsize: Double;
    function setTextsize(size: Double): TAcad_ErrorStatus;
    function tracewid: Double;
    function setTracewid(width: Double): TAcad_ErrorStatus;
    function sketchinc: Double;
    function setSketchinc(inc: Double): TAcad_ErrorStatus;
    function filletrad: Double;
    function setFilletrad(radius: Double): TAcad_ErrorStatus;
    function thickness: Double;
    function setThickness(thickness: Double): TAcad_ErrorStatus;
    function celweight: TAcDb_LineWeight;
    function setCelweight(weight: TAcDb_LineWeight): TAcad_ErrorStatus;
    class function isValidLineWeight(weight: Integer): LongBool;
    class function getNearestLineWeight(weight: Integer): TAcDb_LineWeight;
    function endCaps: TAcDb_EndCaps;
    function setEndCaps(atype: TAcDb_EndCaps): TAcad_ErrorStatus;
    function joinStyle: TAcDb_JoinStyle;
    function setJoinStyle(style: TAcDb_JoinStyle): TAcad_ErrorStatus;
    function lineWeightDisplay: LongBool;
    function setLineWeightDisplay(display: LongBool): TAcad_ErrorStatus;
    function xrefEditEnabled: LongBool;
    function setXrefEditEnabled(enable: LongBool): TAcad_ErrorStatus;
    function oleStartUp: LongBool;
    function setOleStartUp(val: LongBool): TAcad_ErrorStatus;
    function angbase: Double;
    function setAngbase(angle: Double): TAcad_ErrorStatus;
    function pdsize: Double;
    function setPdsize(size: Double): TAcad_ErrorStatus;
    function plinewid: Double;
    function setPlinewid(width: Double): TAcad_ErrorStatus;
    function userr1: Double;
    function setUserr1(val: Double): TAcad_ErrorStatus;
    function userr2: Double;
    function setUserr2(val: Double): TAcad_ErrorStatus;
    function userr3: Double;
    function setUserr3(val: Double): TAcad_ErrorStatus;
    function userr4: Double;
    function setUserr4(val: Double): TAcad_ErrorStatus;
    function userr5: Double;
    function setUserr5(val: Double): TAcad_ErrorStatus;
    function chamfera: Double;
    function setChamfera(val: Double): TAcad_ErrorStatus;
    function chamferb: Double;
    function setChamferb(val: Double): TAcad_ErrorStatus;
    function chamferc: Double;
    function setChamferc(val: Double): TAcad_ErrorStatus;
    function chamferd: Double;
    function setChamferd(val: Double): TAcad_ErrorStatus;
    function facetres: Double;
    function setFacetres(facetres: Double): TAcad_ErrorStatus;
    function getMenu(var pOutput: AnsiString): TAcad_ErrorStatus;
    function tdcreate: TposAcDbDate;
    function tdupdate: TposAcDbDate;
    function tducreate: TposAcDbDate;
    function tduupdate: TposAcDbDate;
    function tdindwg: TposAcDbDate;
    function tdusrtimer: TposAcDbDate;
    function cecolor: TposAcCmColor;
    function setCecolor(color: TposAcCmColor): TAcad_ErrorStatus;
    function handseed: TposAcDbHandle;
    function setHandseed(handle: TposAcDbHandle): TAcad_ErrorStatus;
    function clayer: TAcDbObjectId;
    function setClayer(objId: TAcDbObjectId): TAcad_ErrorStatus;
    function getCePlotStyleNameId(var id: TAcDbObjectId): TAcDb_PlotStyleNameType;
    function setCePlotStyleName(NameType: TAcDb_PlotStyleNameType; newId: TAcDbObjectId = nil): TAcad_ErrorStatus;
    function textstyle: TAcDbObjectId;
    function setTextstyle(objId: TAcDbObjectId): TAcad_ErrorStatus;
    function celtype: TAcDbObjectId;
    function setCeltype(objId: TAcDbObjectId): TAcad_ErrorStatus;
    function dimstyle: TAcDbObjectId;
    function setDimstyle(styleId: TAcDbObjectId): TAcad_ErrorStatus;
    function getDimstyleData(var pRec: TposAcDbDimStyleTableRecord): TAcad_ErrorStatus;
    function getDimstyleChildData(pDimClass: TAcRxClass; var pRec: TposAcDbDimStyleTableRecord; var style: TAcDbObjectId): TAcad_ErrorStatus;
    function getDimstyleChildId(pDimClass: TAcRxClass; var parentStyle: TAcDbObjectId): TAcDbObjectId;
    function getDimstyleParentId(var childStyle: TAcDbObjectId): TAcDbObjectId;
    function setDimstyleData(pRec: TposAcDbDimStyleTableRecord): TAcad_ErrorStatus; overload;
    function setDimstyleData(id: TAcDbObjectId): TAcad_ErrorStatus; overload;
    function cmlstyleID: TAcDbObjectId;
    function setCmlstyleID(objId: TAcDbObjectId): TAcad_ErrorStatus; overload;
    function cmljust: TAdesk_Int16;
    function setCmljust(just: TAdesk_Int16): TAcad_ErrorStatus;
    function cmlscale: Double;
    function setCmlscale(scale: Double): TAcad_ErrorStatus;
    function celtscale: Double;
    function setCeltscale(scale: Double): TAcad_ErrorStatus;
    function pinsbase: TposAcGePoint3d;
    function setPinsbase(var base: TposAcGePoint3d): TAcad_ErrorStatus;
    function pextmin: TposAcGePoint3d;
    function pextmax: TposAcGePoint3d;
    function setPextmin(var min: TposAcGePoint3d): TAcad_ErrorStatus;
    function setPextmax(var max: TposAcGePoint3d): TAcad_ErrorStatus;
    function plimmin: TposAcGePoint2d;
    function setPlimmin(var min: TposAcGePoint2d): TAcad_ErrorStatus;
    function plimmax: TposAcGePoint2d;
    function setPlimmax(var max: TposAcGePoint2d): TAcad_ErrorStatus;
    function pelevation: Double;
    function setPelevation(elev: Double): TAcad_ErrorStatus;
    function pucsorg: TposAcGePoint3d;
    function pucsxdir: TposAcGeVector3d;
    function pucsydir: TposAcGeVector3d;
    function pucsname: TAcDbObjectId;
    function pucsBase: TAcDbObjectId;
    function setPucsBase(ucsid: TAcDbObjectId): TAcad_ErrorStatus;
    function worldPucsBaseOrigin(orthoView: TAcDb_OrthographicView): TposAcGePoint3d;
    function setWorldPucsBaseOrigin(origin: TposAcGePoint3d; orthoView: TAcDb_OrthographicView): TAcad_ErrorStatus;
    function isPucsOrthographic(var orthoView: TAcDb_OrthographicView): LongBool;
    function insbase: TposAcGePoint3d;
    function setInsbase(base: TposAcGePoint3d): TAcad_ErrorStatus;
    function extmin: TposAcGePoint3d;
    function extmax: TposAcGePoint3d;
    function updateExt(doBestFit: LongBool = False): TAcad_ErrorStatus;
    function setExtmin(min: TposAcGePoint3d): TAcad_ErrorStatus;
    function setExtmax(max: TposAcGePoint3d): TAcad_ErrorStatus;
    function limmin: TposAcGePoint2d;
    function setLimmin(min: TposAcGePoint2d): TAcad_ErrorStatus;
    function limmax: TposAcGePoint2d;
    function setLimmax(max: TposAcGePoint2d): TAcad_ErrorStatus;
    function elevation: Double; overload;
    function elevationi: Integer; overload;
    function setElevation(elev: Double): TAcad_ErrorStatus;
    function ucsorg: TposAcGePoint3d;
    function ucsxdir: TposAcGeVector3d;
    function ucsydir: TposAcGeVector3d;
    function ucsname: TAcDbObjectId;
    function ucsBase: TAcDbObjectId;
    function setUcsBase(ucsid: TAcDbObjectId): TAcad_ErrorStatus;
    function worldUcsBaseOrigin(orthoView: TAcDb_OrthographicView): TposAcGePoint3d;
    function setWorldUcsBaseOrigin(origin: TposAcGePoint3d; orthoView: TAcDb_OrthographicView): TAcad_ErrorStatus;
    function isUcsOrthographic(var orthoView: TAcDb_OrthographicView): LongBool;
    function getDimpost(var pOutput: AnsiString): TAcad_ErrorStatus;
    function getDimapost(var pOutput: AnsiString): TAcad_ErrorStatus;
    function getDimblk(var pOutput: AnsiString): TAcad_ErrorStatus;
    function getDimblk1(var pOutput: AnsiString): TAcad_ErrorStatus;
    function getDimblk2(var pOutput: AnsiString): TAcad_ErrorStatus;
    function dimfit: Integer;
    function setDimfit(fit: Integer): TAcad_ErrorStatus;
    function setDimunit(aunit: Integer): TAcad_ErrorStatus;
    function getDimRecentStyleList(var objIds: TposAcDbObjectIdArray): TAcad_ErrorStatus;
    function loadLineTypeFile(ltn: AnsiString; filename: AnsiString): TAcad_ErrorStatus;
    function getProjectName(var pOutput: AnsiString): TAcad_ErrorStatus;
    function setProjectName(pOutput: AnsiString): TAcad_ErrorStatus;
    function getHyperlinkBase(var pOutput: AnsiString): TAcad_ErrorStatus;
    function setHyperlinkBase(pOutput: AnsiString): TAcad_ErrorStatus;
    function getStyleSheet(var pOutput: AnsiString): TAcad_ErrorStatus;
    function setStyleSheet(pOutput: AnsiString): TAcad_ErrorStatus;
    function getFilename(var pOutput: AnsiString): TAcad_ErrorStatus;
    function isPartiallyOpened: LongBool;
    function applyPartialOpenFilters(pSpatialFilter: TposAcDbSpatialFilter; pLayerFilter: TposAcDbLayerFilter): TAcad_ErrorStatus;
    procedure disablePartialOpen;
    function getFingerprintGuid(var guidString: AnsiString): TAcad_ErrorStatus;
    function setFingerprintGuid(pNewGuid: AnsiString): TAcad_ErrorStatus;
    function newFingerprintGuid: TAcad_ErrorStatus;
    function getVersionGuid(var guidString: AnsiString): TAcad_ErrorStatus;
    function setVersionGuid(pNewGuid: AnsiString): TAcad_ErrorStatus;
    function newVersionGuid: TAcad_ErrorStatus;
    function tstackalign: Integer;
    function setTStackAlign(val: Integer): TAcad_ErrorStatus;
    function tstacksize: Integer;
    function setTStackSize(val: Integer): TAcad_ErrorStatus;
    function insunits: TAcDb_UnitsValue;
    function setInsunits(units: TAcDb_UnitsValue): TAcad_ErrorStatus;
    procedure setGsModel(mode: TposAcGsModel);
    function gsModel: TposAcGsModel;
    function plotStyleMode: LongBool;
    function viewportScaleDefault: Double;
    function setViewportScaleDefault(newDefaultVPScale: Double): TAcad_ErrorStatus;
    function dwgFileWasSavedByAutodeskSoftware: LongBool;
  end;

  PDNodeDocumentRec = ^TDNodeDocumentRec;
  TDNodeDocumentRec = record
    lpNext: PDNodeDocumentRec;
    pDocument: TAcApDocument;
    RegCodeAddr: Integer;
    Data: Pointer;
  end;

  TDNodeDocumentParam = record
    Index: Integer;
    Prev: PDNodeDocumentRec;
    Node: PDNodeDocumentRec;
  end;

  TDDocParamsList = class(TObject)
  private
    FLock: TRTLCriticalSection;
    FFirstNode: PDNodeDocumentRec;
    FLastNode: PDNodeDocumentRec;
    FNextNode: PDNodeDocumentRec;
    FCount: Integer;
    function GetCurRegCodeAddr: Integer;
    procedure SetCurRegCodeAddr(Value: Integer);
    function GetCurData: Pointer;
    procedure SetCurData(Value: Pointer);
    function GetDocuments(Index: Integer): TAcApDocument;
  private
    function CreateNode(pDocument: TAcApDocument): PDNodeDocumentRec;
    procedure DestoryNode(Node: PDNodeDocumentRec);
    function IndexOfNode(Index: Integer): TDNodeDocumentParam;
    function ItemOfNode(pDocument: TAcApDocument): TDNodeDocumentParam;
    function GetCurrentNode: PDNodeDocumentRec;
  public
    constructor Create;
    destructor Destroy; override;
    procedure Clear;
    function Count: Integer;
    function AddDocument(const document: TAcApDocument): Integer;
    procedure DeleteDocument(const document: TAcApDocument);
    function GetCurIndex: Integer;
    property CurRegCodeAddr: Integer read GetCurRegCodeAddr write SetCurRegCodeAddr;
    property CurDocParams: Pointer read GetCurData write SetCurData;
    property Documents[Index: Integer]: TAcApDocument read GetDocuments;
  end;

////////////////////////////////////////////////////////////////////////////////
//         Global Objects Value.             グローバルオブジェクト変数
//
//  NOTE: DO NOT remodes object.
var
  acedRegCmds: TDAcEdCommandStack = nil;
  acedEditor: TDAcEditor = nil;
  acrxClassDictionary: TDAcRxDictionary = nil;
  acrxServiceDictionary: TDAcRxDictionary = nil;
  acrxDynamicLinker: TDAcRxDynamicLinker = nil;
  acrxEvent: TDAcRxEvent = nil;
  acrxKernel: TDAcRxKernel = nil;
  acDocManager: TDAcApDocManager = nil;
  acdbLayoutManager: TDAcDbLayoutManager = nil;
  acdbHostApplicationServices: TDGlobalAcDbHostApplicationServices = nil;
////////////////////////////////////////////////////////////////////////////////
  DrxDocParams: TDDocParamsList = nil;

implementation

uses
  AextCObj, AextCFnc, AextCLib, DArxLib, DArxAclt, DrxRecal;

{ TDDocParamsList }

procedure ResetNodeDocumentParam(var NodeParam: TDNodeDocumentParam);
begin
  NodeParam.Index := -1;
  NodeParam.Prev := nil;
  NodeParam.Node := nil;
end;

constructor TDDocParamsList.Create;
begin
  inherited Create;
  InitializeCriticalSection(FLock);
  FFirstNode := nil;
  FLastNode := nil;
  FNextNode := nil;
  FCount := 0;
end;

destructor TDDocParamsList.Destroy;
begin
  Clear;
  DeleteCriticalSection(FLock);
  inherited Destroy;
end;

procedure TDDocParamsList.Clear;
var
  lpNext, lpDel: PDNodeDocumentRec;
begin
  EnterCriticalSection(FLock);
  try
    lpNext := FFirstNode;
    FFirstNode := nil;
    FLastNode := nil;
    FCount := 0;
    while (lpNext <> nil) do begin
      lpDel := lpNext;
      lpNext := lpNext^.lpNext;
      DestoryNode(lpDel);
    end;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.Count: Integer;
begin
  EnterCriticalSection(FLock);
  try
    Result := FCount;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.AddDocument(const document: TAcApDocument): Integer;
var
  lpDoc: PDNodeDocumentRec;
begin
  Result := -1;
  if (acDocManager = nil)or(document = nil) then exit;
  EnterCriticalSection(FLock);
  try
    lpDoc := CreateNode(document);
    if lpDoc = nil then exit;
    if FFirstNode = nil then FFirstNode := lpDoc;
    if FLastNode <> nil then FLastNode^.lpNext := lpDoc;
    FLastNode := lpDoc;
    Result := FCount;
    Inc(FCount);
  finally
    LeaveCriticalSection(FLock);
  end;
end;

procedure TDDocParamsList.DeleteDocument(const document: TAcApDocument);
var
  lpPrev, lpNext: PDNodeDocumentRec;
begin
  if (acDocManager = nil)or(document = nil) then exit;
  EnterCriticalSection(FLock);
  try
    lpPrev := nil;
    lpNext := FFirstNode;
    while (lpNext <> nil) do begin
      if (lpNext^.pDocument = document) then begin
        if lpPrev <> nil then lpPrev^.lpNext := lpNext^.lpNext;
        if FFirstNode = lpNext then FFirstNode := lpNext^.lpNext;
        if FLastNode = lpNext then FLastNode := lpPrev;
        DestoryNode(lpNext);
        if FCount > 0 then Dec(FCount);
        break;
      end else begin
        lpPrev := lpNext;
        lpNext := lpPrev^.lpNext;
      end;
    end;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.GetCurIndex: Integer;
var
  NodeParam: TDNodeDocumentParam;
begin
  Result := -1;
  if acDocManager = nil then exit;
  EnterCriticalSection(FLock);
  try
    NodeParam := ItemOfNode(acDocManager.curDocument);
    Result := NodeParam.Index;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.CreateNode(pDocument: TAcApDocument): PDNodeDocumentRec;
begin
  Result := nil;
  if pDocument = nil then exit;
  Result := extern_acad_malloc(SizeOf(TDNodeDocumentRec));
  if Result = nil then exit;
  Result^.lpNext := nil;
  Result^.pDocument := pDocument;
  Result^.RegCodeAddr := -1;
  Result^.Data := nil;
end;

procedure TDDocParamsList.DestoryNode(Node: PDNodeDocumentRec);
begin
  if Node = nil then exit;
  try
    if Node^.Data <> nil then FreeMem(Node^.Data);
  finally
    extern_acad_free(Node);
  end;
end;

function TDDocParamsList.IndexOfNode(Index: Integer): TDNodeDocumentParam;
var
  lpNext: PDNodeDocumentRec;
  ni: Integer;
begin
  ResetNodeDocumentParam(Result);
  if (0 > Index)or(Index >= FCount)or(FFirstNode = nil) then exit;
  lpNext := FFirstNode;
  ni := 0;
  while (lpNext <> nil) do begin
    if (Index = ni) then begin
      Result.Index := ni;
      Result.Node := lpNext;
      break;
    end else begin
      Result.Prev := lpNext;
      lpNext := lpNext^.lpNext;
      Inc(ni);
    end;
  end;
end;

function TDDocParamsList.ItemOfNode(pDocument: TAcApDocument): TDNodeDocumentParam;
var
  lpNext: PDNodeDocumentRec;
  ni: Integer;
begin
  ResetNodeDocumentParam(Result);
  if (pDocument = nil)or(0 >= FCount)or(FFirstNode = nil) then exit;
  lpNext := FFirstNode;
  ni := 0;
  while (lpNext <> nil) do begin
    if (lpNext^.pDocument = pDocument) then begin
      Result.Index := ni;
      Result.Node := lpNext;
      break;
    end else begin
      Result.Prev := lpNext;
      lpNext := lpNext^.lpNext;
      Inc(ni);
    end;
  end;
end;

function TDDocParamsList.GetCurrentNode: PDNodeDocumentRec;
var
  pAcDoc: TAcApDocument;
  lpNext: PDNodeDocumentRec;
begin
  Result := nil;
  if acDocManager = nil then exit;
  pAcDoc := acDocManager.curDocument;
  if (pAcDoc = nil)or(0 >= FCount)or(FFirstNode = nil) then exit;
  lpNext := FFirstNode;
  while (lpNext <> nil) do begin
    if (lpNext^.pDocument = pAcDoc) then begin
      Result := lpNext;
      break;
    end else begin
      lpNext := lpNext^.lpNext;
    end;
  end;
end;

function TDDocParamsList.GetCurRegCodeAddr: Integer;
var
  lpNode: PDNodeDocumentRec;
begin
  EnterCriticalSection(FLock);
  try
    lpNode := GetCurrentNode;
    if lpNode = nil then Result := 0 else Result := lpnode^.RegCodeAddr;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

procedure TDDocParamsList.SetCurRegCodeAddr(Value: Integer);
var
  lpNode: PDNodeDocumentRec;
begin
  EnterCriticalSection(FLock);
  try
    lpNode := GetCurrentNode;
    if lpNode <> nil then lpnode^.RegCodeAddr := Value;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.GetCurData: Pointer;
var
  lpNode: PDNodeDocumentRec;
begin
  EnterCriticalSection(FLock);
  try
    lpNode := GetCurrentNode;
    if lpNode = nil then Result := nil else Result := lpnode^.Data;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

procedure TDDocParamsList.SetCurData(Value: Pointer);
var
  lpNode: PDNodeDocumentRec;
begin
  EnterCriticalSection(FLock);
  try
    lpNode := GetCurrentNode;
    if lpNode <> nil then lpnode^.Data := Value;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

function TDDocParamsList.GetDocuments(Index: Integer): TAcApDocument;
var
  NodeParam: TDNodeDocumentParam;
begin
  EnterCriticalSection(FLock);
  try
    NodeParam := IndexOfNode(Index);
    if NodeParam.Node = nil then Result := nil else Result := NodeParam.Node^.pDocument;
  finally
    LeaveCriticalSection(FLock);
  end;
end;

{
type
  PDocParamsRec = ^TDocParamsRec;
  TDocParamsRec = record
    pDocument: TAcApDocument;
    RegCodeAddr: Integer;
    Data: Pointer;
  end;

constructor TDDocParamsList.Create;
begin
  inherited Create;
  FDocParams := TDItemNodeList.Create;
end;

destructor TDDocParamsList.Destroy;
begin
  Clear;
  FDocParams.Free;
  inherited Destroy;
end;

procedure TDDocParamsList.Clear;
var
  lpNext: PDocParamsRec;
begin
  lpNext := FDocParams.FirstItem;
  try
    while (lpNext <> nil) do begin
      if lpNext^.Data <> nil then FreeMem(lpNext^.Data);
      //FreeMem(lpNext);
      extern_acad_free(lpNext);
      lpNext := FDocParams.NextItem;
    end;
  finally
    FDocParams.CloseItem;
    FDocParams.Clear;
  end;
end;

function TDDocParamsList.Count: Integer;
begin
  Result := FDocParams.Count;
end;

function TDDocParamsList.AddDocument: Integer;
var
  pAcDoc: TAcApDocument;
  pDoc: PDocParamsRec;
begin
  Result := -1;
  if acDocManager = nil then exit;
  pAcDoc := acDocManager.curDocument;
  if pAcDoc = nil then exit;
  //GetMem(pDoc, SizeOf(TDocParamsRec));
  pDoc := extern_acad_malloc(SizeOf(TDocParamsRec));
  if pDoc = nil then exit;
  Result := FDocParams.Add(pDoc);
  if 0 > Result then begin
    //FreeMem(pDoc);
    extern_acad_free(pDoc);
  end else begin
    pDoc^.pDocument := pAcDoc;
    pDoc^.RegCodeAddr := -1;
    pDoc^.Data := nil;
  end;
end;

procedure TDDocParamsList.DeleteDocument;
var
  ni: Integer;
  lpDel: PDocParamsRec;
begin
  ni := GetCurIndex;
  if 0 > ni then exit;
  if FDocParams.Items[ni] <> nil then begin
    lpDel := FDocParams.Items[ni];
    if lpDel^.Data <> nil then FreeMem(lpDel^.Data);
    //FreeMem(lpDel);
    extern_acad_free(lpDel);
  end;
  FDocParams.Items[ni] := nil;
  FDocParams.Delete(ni);
end;

function TDDocParamsList.GetCurIndex: Integer;
var
  lpNext: PDocParamsRec;
  pAcDoc: TAcApDocument;
  ni: Integer;
begin
  Result := -1;
  if acDocManager = nil then exit;
  pAcDoc := acDocManager.curDocument;
  if pAcDoc = nil then exit;
  lpNext := FDocParams.FirstItem;
  try
    ni := 0;
    while (lpNext <> nil) do begin
      if (lpNext^.pDocument = pAcDoc) then begin
        Result := ni;
        break;
      end else begin
        lpNext := FDocParams.NextItem;
        Inc(ni);
      end;
    end;
  finally
    FDocParams.CloseItem;
    if (Result > 0) then begin
      FDocParams.Exchange(Result, 0);
      Result := 0;
    end;
  end;
end;

function TDDocParamsList.GetCurRegCodeAddr: Integer;
var
  ni: Integer;
begin
  ni := GetCurIndex;
  if 0 > ni then Result := 0 else Result := PDocParamsRec(FDocParams.Items[ni])^.RegCodeAddr;
end;

procedure TDDocParamsList.SetCurRegCodeAddr(Value: Integer);
var
  ni: Integer;
begin
  ni := GetCurIndex;
  if 0 > ni then exit;
  PDocParamsRec(FDocParams.Items[ni])^.RegCodeAddr := Value;
end;

function TDDocParamsList.GetCurData: Pointer;
var
  ni: Integer;
begin
  ni := GetCurIndex;
  if 0 > ni then Result := nil else Result := PDocParamsRec(FDocParams.Items[ni])^.Data;
end;

procedure TDDocParamsList.SetCurData(Value: Pointer);
var
  ni: Integer;
begin
  ni := GetCurIndex;
  if 0 > ni then exit;
  PDocParamsRec(FDocParams.Items[ni])^.Data := Value;
end;

function TDDocParamsList.GetDocuments(Index: Integer): TAcApDocument;
begin
  if (0 > Index)or(Index >= FDocParams.Count)or(FDocParams.Items[Index] = nil) then begin
    Result := nil;
  end else begin
    Result := PDocParamsRec(FDocParams.Items[Index])^.pDocument;
  end;
end;
}

{ TDAcRxObject }

constructor TDAcRxObject.Create(FreeRxObject: Boolean = True);
begin
  inherited Create;
  FFreeRxObj := FreeRxObject;
  FRxObject := nil;
end;

procedure TDAcRxObject.DestroyRxObject;
begin
  delete_AcRxObject(FRxObject);
  FRxObject := nil;
end;

constructor TDAcRxObject.assignCreate(const SourceRxObject: TAcRxObject = nil);
begin
  inherited Create;
  FFreeRxObj := False;
  FRxObject := SourceRxObject;
end;

destructor TDAcRxObject.Destroy;
begin
  if (FFreeRxObj)and(FRxObject <> nil) then DestroyRxObject;
  inherited Destroy;
end;

function TDAcRxObject.rxCast(CastRxObject: TAcRxObject): TAcRxObject;
begin
  Result := RxObject;
  FRxObject := CastRxObject;
end;

function TDAcRxObject.RxObject: TAcRxObject;
begin
  Result := FRxObject;
end;

procedure TDAcRxObject.Assign(Source: TDAcRxObject);
begin
  if NOT (Source is TDAcRxObject) then exit;
  FRxObject := TDAcRxObject(Source).RxObject;
end;

function TDAcRxObject.IsObject: Boolean;
begin
  Result := (RxObject <> nil);
end;

function TDAcRxObject.isKindOf(const aClass: TAcRxClass): LongBool;
begin
  Result := RxObject.isKindOf(0, RxObject, aClass);
end;

function TDAcRxObject.x(protocolClass: TAcRxClass): TAcRxObject;
begin
  Result := RxObject.x(0, RxObject, protocolClass);
end;

function TDAcRxObject.queryX(protocolClass: TAcRxClass): TAcRxObject;
begin
  Result := RxObject.queryX(0, RxObject, protocolClass);
end;

function TDAcRxObject.isA: TAcRxClass;
begin
  Result := RxObject.isA(0, RxObject);
end;

function TDAcRxObject.clone: TAcRxObject;
begin
  Result := RxObject.clone(0, RxObject);
end;

function TDAcRxObject.copyFrom(const other: TAcRxObject): TAcad_ErrorStatus;
begin
  Result := RxObject.copyFrom(0, RxObject, other);
end;

function TDAcRxObject.isEqualTo(const other: TAcRxObject): TAdesk_Boolean;
begin
  Result := RxObject.isEqualTo(0, RxObject, other);
end;

function TDAcRxObject.comparedTo(const other: TAcRxObject): TAcRx_Ordering;
begin
  Result := RxObject.comparedTo(0, RxObject, other);
end;

{ TDGlobalAcRxObject }

constructor TDGlobalAcRxObject.Create(const Key: PChar);
begin
  inherited Create(False);
  if Key = nil then FKey := '' else FKey := extern_darxPString(Key);
end;

{ TDAcRxDictionary }

function TDAcRxDictionary.RxObject: TAcRxDictionary;
var
  SysRegistry: TAcRxDictionary;
begin
  if FRxObject = nil then begin
      SysRegistry := AextCLib.extern_acrxSysRegistry;
      // #define acrxServiceDictionary AcRxDictionary::cast(acrxSysRegistry()->at(ACRX_SERVICE_DICTIONARY))
    if SysRegistry <> nil then FRxObject := TAcRxDictionary.cast(SysRegistry.at(0, SysRegistry, extern_darxStrPChar(FKey)));
  end;
  Result := TAcRxDictionary(FRxObject);
end;

function TDAcRxDictionary.at(id: TAdesk_UInt32): TAcRxObject;
begin
  Result := RxObject.at(0, RxObject, id);
end;

function TDAcRxDictionary.at(const key: AnsiString): TAcRxObject;
begin
  Result := RxObject.at(0, RxObject, extern_darxStrPChar(key));
end;

function TDAcRxDictionary.atPut(id: TAdesk_UInt32; pObject: TAcRxObject): TAcRxObject;
begin
  Result := RxObject.atPut(0, RxObject, pObject, id);
end;

function TDAcRxDictionary.atPut(const key: AnsiString; pObject: TAcRxObject; retId: TAdesk_UInt32): TAcRxObject;
begin
  Result := RxObject.atPut(0, RxObject, retId, pObject, extern_darxStrPChar(key));
end;

function TDAcRxDictionary.atPut(const key: AnsiString; pObject: TAcRxObject): TAcRxObject;
begin
  Result := RxObject.atPut(0, RxObject, pObject, extern_darxStrPChar(key));
end;

function TDAcRxDictionary.resetKey(id: TAdesk_UInt32; const newKey: AnsiString): TAdesk_Boolean;
begin
  Result := RxObject.resetKey(0, RxObject, extern_darxStrPChar(newKey), id);
end;

function TDAcRxDictionary.resetKey(const oldKey: AnsiString; const newKey: AnsiString): TAdesk_Boolean;
begin
  Result := RxObject.resetKey(0, RxObject, extern_darxStrPChar(newKey), extern_darxStrPChar(oldKey));
end;

function TDAcRxDictionary.atKeyAndIdPut(const newKey: AnsiString; id: TAdesk_UInt32; pObject: TAcRxObject): TAdesk_Boolean;
begin
  Result := RxObject.atKeyAndIdPut(0, RxObject, pObject, id, extern_darxStrPChar(newKey));
end;

function TDAcRxDictionary.remove(id: TAdesk_UInt32): TAcRxObject;
begin
  Result := RxObject.remove(0, RxObject, id);
end;

function TDAcRxDictionary.remove(const key: AnsiString): TAcRxObject;
begin
  Result := RxObject.remove(0, RxObject, extern_darxStrPChar(key));
end;

function TDAcRxDictionary.has(id: TAdesk_UInt32): TAdesk_Boolean;
begin
  Result := RxObject.has(0, RxObject, id);
end;

function TDAcRxDictionary.has(const entryName: AnsiString): TAdesk_Boolean;
begin
  Result := RxObject.has(0, RxObject, extern_darxStrPChar(entryName));
end;

function TDAcRxDictionary.idAt(const key: AnsiString): TAdesk_UInt32;
begin
  Result := RxObject.idAt(0, RxObject, extern_darxStrPChar(key));
end;

function TDAcRxDictionary.keyAt(id: TAdesk_UInt32): AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.keyAt(0, RxObject, id);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcRxDictionary.numEntries: TAdesk_UInt32;
begin
  Result := RxObject.numEntries(0, RxObject);
end;

function TDAcRxDictionary.newIterator(iType: TAcRx_DictIterType = 0 {AcRx_kDictSorted}): TAcRxDictionaryIterator;
begin
  Result := RxObject.newIterator(0, RxObject, iType);
end;

function TDAcRxDictionary.deletesObjects: TAdesk_Boolean;
begin
  Result := RxObject.deletesObjects(0, RxObject);
end;

function TDAcRxDictionary.isCaseSensitive: TAdesk_Boolean;
begin
  Result := RxObject.isCaseSensitive(0, RxObject);
end;

function TDAcRxDictionary.isSorted: TAdesk_Boolean;
begin
  Result := RxObject.isSorted(0, RxObject);
end;

{ TDAcRxDynamicLinker }

function TDAcRxDynamicLinker.RxObject: TAcRxDynamicLinker;
var
  SysRegistry: TAcRxDictionary;
begin
  if FRxObject = nil then begin
      SysRegistry := AextCLib.extern_acrxSysRegistry;
      // #define acrxDynamicLinker AcRxDynamicLinker::cast(acrxSysRegistry()->at(ACRX_DYNAMIC_LINKER))
    if SysRegistry <> nil then FRxObject := TAcRxDynamicLinker.cast(SysRegistry.at(0, SysRegistry, extern_darxStrPChar(FKey)));
  end;
  Result := TAcRxDynamicLinker(FRxObject);
end;

function TDAcRxDynamicLinker.getSymbolAddress(const serviceName, symbol: AnsiString): Pointer;
begin
  Result := RxObject.getSymbolAddress(0, RxObject, extern_darxStrPChar(symbol), extern_darxStrPChar(serviceName));
end;

function TDAcRxDynamicLinker.initListedModules(const fileName: AnsiString): LongBool;
begin
  Result := RxObject.initListedModules(0, RxObject, extern_darxStrPChar(fileName));
end;

function TDAcRxDynamicLinker.loadModule(const fileName: AnsiString; printit: LongBool; asCmd: LongBool = False): LongBool;
begin
  Result := RxObject.loadModule(0, RxObject, asCmd, printit, extern_darxStrPChar(fileName));
end;

function TDAcRxDynamicLinker.loadApp(const appName: AnsiString; al: TAcadApp_LoadReasons; printit: LongBool; asCmd: LongBool = False): LongBool;
begin
  Result := RxObject.loadApp(0, RxObject, asCmd, printit, al, extern_darxStrPChar(appName));
end;

function TDAcRxDynamicLinker.registerService(serviceName: AnsiString; serviceObj: TAcRxService): TAcRxObject;
begin
  Result := RxObject.registerService(0, RxObject, serviceObj, extern_darxStrPChar(serviceName));
end;

function TDAcRxDynamicLinker.unloadModule(const fileName: AnsiString; asCmd: LongBool = False): LongBool;
begin
  Result := RxObject.unloadModule(0, RxObject, asCmd, extern_darxStrPChar(fileName));
end;

function TDAcRxDynamicLinker.unloadApp(const appName: AnsiString; asCmd: LongBool = False): LongBool;
begin
  Result := RxObject.unloadApp(0, RxObject, asCmd, extern_darxStrPChar(appName));
end;

procedure TDAcRxDynamicLinker.addReactor(newReactor: TDAcRxDLinkerReactor);
begin
  if darxAcRxDLinkerReactorManager = nil then darxAcRxDLinkerReactorManager := TDrxAcRxDLinkerReactorArray.Create;
  if darxAcRxDLinkerReactorManager = nil then exit;
  darxAcRxDLinkerReactorManager.Add(newReactor);
//  RxObject.addReactor(0, RxObject, newReactor);
end;

procedure TDAcRxDynamicLinker.removeReactor(oldReactor: TDAcRxDLinkerReactor);
begin
  if darxAcRxDLinkerReactorManager = nil then exit;
  darxAcRxDLinkerReactorManager.Delete(oldReactor);
//  RxObject.removeReactor(0, RxObject, oldReactor);
end;

function TDAcRxDynamicLinker.isApplicationLocked(const modulename: AnsiString): LongBool;
begin
  Result := RxObject.isApplicationLocked(0, RxObject, extern_darxStrPChar(modulename));
end;

function TDAcRxDynamicLinker.lockApplication(appId: Pointer): LongBool;
begin
  Result := RxObject.lockApplication(0, RxObject, appId);
end;

function TDAcRxDynamicLinker.unlockApplication(appId: Pointer): LongBool;
begin
  Result := RxObject.unlockApplication(0, RxObject, appId);
end;

function TDAcRxDynamicLinker.isAppMDIAware(const modulename: AnsiString): LongBool;
begin
  Result := RxObject.isAppMDIAware(0, RxObject, extern_darxStrPChar(modulename));
end;

function TDAcRxDynamicLinker.registerAppMDIAware(appId: Pointer): LongBool;
begin
  Result := RxObject.registerAppMDIAware(0, RxObject, appId);
end;

function TDAcRxDynamicLinker.registerAppNotMDIAware(appId: Pointer): LongBool;
begin
  Result := RxObject.registerAppNotMDIAware(0, RxObject, appId);
end;

function TDAcRxDynamicLinker.isAppBusy(const modulename: AnsiString): LongBool;
begin
  Result := RxObject.isAppBusy(0, RxObject, extern_darxStrPChar(modulename));
end;

procedure TDAcRxDynamicLinker.setAppBusy(const modulename: AnsiString; bBusyFlag: LongBool);
begin
  RxObject.setAppBusy(0, RxObject, bBusyFlag, extern_darxStrPChar(modulename));
end;

function TDAcRxDynamicLinker.ProductKey: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.ProductKey(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcRxDynamicLinker.ProductLcid: TAdesk_UInt32;
begin
  Result := RxObject.ProductLcid(0, RxObject);
end;

{ TDAcApDocManager }

function TDAcApDocManager.RxObject: TAcApDocManager;
begin
  if FRxObject = nil then FRxObject := AextCLib.extern_acDocManagerPtr;
  Result := TAcApDocManager(FRxObject);
end;

function TDAcApDocManager.curDocument: TAcApDocument;
begin
  Result := RxObject.curDocument(0, RxObject);
end;

function TDAcApDocManager.mdiActiveDocument: TAcApDocument;
begin
  Result := RxObject.mdiActiveDocument(0, RxObject);
end;

function TDAcApDocManager.isApplicationContext: LongBool;
begin
  Result := RxObject.isApplicationContext(0, RxObject);
end;

function TDAcApDocManager.document(pDb: TAcDbDatabase): TAcApDocument;
begin
  Result := RxObject.document(0, RxObject, pDb);
end;

function TDAcApDocManager.lockDocument(pDoc: TAcApDocument; lockMode: TAcAp_DocLockMode = AcAp_kWrite; const pGlobalCmdName: AnsiString = ''; const pLocalCmdName: AnsiString = ''; prompt: LongBool = True): TAcad_ErrorStatus;
begin
  Result := RxObject.lockDocument(0, RxObject, prompt, extern_darxStrPChar(pLocalCmdName), extern_darxStrPChar(pGlobalCmdName), lockMode, pDoc);
end;

function TDAcApDocManager.unlockDocument(pDoc: TAcApDocument): TAcad_ErrorStatus;
begin
  Result := RxObject.unlockDocument(0, RxObject, pDoc);
end;

function TDAcApDocManager.newAcApDocumentIterator: TAcApDocumentIterator;
begin
  Result := RxObject.newAcApDocumentIterator(0, RxObject);
end;

procedure TDAcApDocManager.addReactor(pDocManReactor: TAcApExportedByMistake);
begin
  RxObject.addReactor(0, RxObject, pDocManReactor);
end;

procedure TDAcApDocManager.addReactor(pDocManReactor: TDAcApDocManagerReactor);
begin
  if darxAcApDocManagerReactorManager = nil then darxAcApDocManagerReactorManager := TDrxAcApDocManagerReactorArray.Create;
  if darxAcApDocManagerReactorManager = nil then exit;
  darxAcApDocManagerReactorManager.Add(pDocManReactor);
end;

procedure TDAcApDocManager.removeReactor(pDocManReactor: TAcApExportedByMistake);
begin
  RxObject.removeReactor(0, RxObject, pDocManReactor);
end;

procedure TDAcApDocManager.removeReactor(pDocManReactor: TDAcApDocManagerReactor);
begin
  if darxAcApDocManagerReactorManager = nil then exit;
  darxAcApDocManagerReactorManager.Delete(pDocManReactor);
end;

function TDAcApDocManager.exportedByMistake: TAcRxIterator;
begin
  Result := RxObject.exportedByMistake(0, RxObject);
end;

function TDAcApDocManager.setDefaultFormatForSave(format: TAcApDocument_SaveFormat): TAcad_ErrorStatus;
begin
  Result := RxObject.setDefaultFormatForSave(0, RxObject, format);
end;

function TDAcApDocManager.setCurDocument(pDoc: TAcApDocument; lockMode: TAcAp_DocLockMode = AcAp_kNone; activate: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.setCurDocument(0, RxObject, activate, lockMode, pDoc);
end;

function TDAcApDocManager.activateDocument(pAcTargetDocument: TAcApDocument; bPassScript: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.activateDocument(0, RxObject, bPassScript, pAcTargetDocument);
end;

function TDAcApDocManager.sendStringToExecute(pAcTargetDocument: TAcApDocument; const pszExecute: AnsiString; bActivate: LongBool = True; bWrapUpInactiveDoc: LongBool = False; bEchoString: LongBool = True): TAcad_ErrorStatus;
begin
  Result := RxObject.sendStringToExecute(0, RxObject, bEchoString, bWrapUpInactiveDoc, bActivate, extern_darxStrPChar(pszExecute), pAcTargetDocument);
end;

function TDAcApDocManager.appContextNewDocument(const pszTemplateName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.appContextNewDocument(0, RxObject, extern_darxStrPChar(pszTemplateName));
end;

function TDAcApDocManager.appContextOpenDocument(const pszDrawingName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.appContextOpenDocument(0, RxObject, extern_darxStrPChar(pszDrawingName));
end;

function TDAcApDocManager.newDocument: TAcad_ErrorStatus;
begin
  Result := RxObject.newDocument(0, RxObject);
end;

function TDAcApDocManager.openDocument: TAcad_ErrorStatus;
begin
  Result := RxObject.openDocument(0, RxObject);
end;

function TDAcApDocManager.closeDocument(pAcTargetDocument: TAcApDocument): TAcad_ErrorStatus;
begin
  Result := RxObject.closeDocument(0, RxObject, pAcTargetDocument);
end;

function TDAcApDocManager.inputPending(pAcTargetDocument: TAcApDocument): integer;
begin
  Result := RxObject.inputPending(0, RxObject, pAcTargetDocument);
end;

function TDAcApDocManager.disableDocumentActivation: TAcad_ErrorStatus;
begin
  Result := RxObject.disableDocumentActivation(0, RxObject);
end;

function TDAcApDocManager.enableDocumentActivation: TAcad_ErrorStatus;
begin
  Result := RxObject.enableDocumentActivation(0, RxObject);
end;

function TDAcApDocManager.isDocumentActivationEnabled: LongBool;
begin
  Result := RxObject.isDocumentActivationEnabled(0, RxObject);
end;

procedure TDAcApDocManager.executeInApplicationContext(pFunc: PprocAddr; pData: Pointer);
begin
  RxObject.executeInApplicationContext(0, RxObject, pData, pFunc);
end;

function TDAcApDocManager.documentCount: integer;
begin
  Result := RxObject.documentCount(0, RxObject);
end;

procedure TDAcApDocManager.pushResourceHandle(hNewResourceHandle: Longint);
begin
  RxObject.pushResourceHandle(0, RxObject, hNewResourceHandle);
end;

procedure TDAcApDocManager.pushAcadResourceHandle;
begin
  RxObject.pushAcadResourceHandle(0, RxObject);
end;

procedure TDAcApDocManager.popResourceHandle;
begin
  RxObject.popResourceHandle(0, RxObject);
end;

{ TDAcRxEvent }

function TDAcRxEvent.RxObject: TAcRxEvent;
var
  SysRegistry: TAcRxDictionary;
begin
  if FRxObject = nil then begin
      SysRegistry := AextCLib.extern_acrxSysRegistry;
        // #define acrxEvent AcRxEvent::cast(acrxSysRegistry()->at(ACRX_EVENT_OBJ))
    if SysRegistry <> nil then FRxObject := TAcRxEvent.cast(SysRegistry.at(0, SysRegistry, extern_darxStrPChar(FKey)));
  end;
  Result := TAcRxEvent(FRxObject);
end;

procedure TDAcRxEvent.addReactor(newObj: TDAcRxEventReactor);
begin
  if darxAcRxEventReactorManager = nil then darxAcRxEventReactorManager := TDrxAcRxEventReactorArray.Create;
  if darxAcRxEventReactorManager = nil then exit;
  darxAcRxEventReactorManager.Add(newObj);
end;

procedure TDAcRxEvent.removeReactor(delObj: TDAcRxEventReactor);
begin
  if darxAcRxEventReactorManager = nil then exit;
  darxAcRxEventReactorManager.Delete(delObj);
end;

{ TDAcRxService }

function TDAcRxService.RxObject: TAcRxService;
begin
  Result := TAcRxService(FRxObject);
end;

function TDAcRxService.getSysInfo: TAcRxObject;
begin
  Result := RxObject.getSysInfo(0, RxObject);
end;

procedure TDAcRxService.setSysInfo(sysInfoObj: TAcRxObject);
begin
  RxObject.setSysInfo(0, RxObject, sysInfoObj);
end;

procedure TDAcRxService.addDependency;
begin
  RxObject.addDependency(0, RxObject);
end;

procedure TDAcRxService.removeDependency;
begin
  RxObject.removeDependency(0, RxObject);
end;

function TDAcRxService.unloadable: TAdesk_Boolean;
begin
  Result := RxObject.unloadable(0, RxObject);
end;

function TDAcRxService.dependencyFunctionPtr: PDepFuncPtr;
begin
  Result := RxObject.dependencyFunctionPtr(0, RxObject);
end;

procedure TDAcRxService.setDependencyFunctionPtr(dptr: PDepFuncPtr);
begin
  RxObject.setDependencyFunctionPtr(0, RxObject, dptr);
end;

{ TDAcRxKernel }

function TDAcRxKernel.RxObject: TAcRxKernel;
begin
  if FRxObject = nil then begin
        // #define acrxKernel AcRxKernel::cast(AcRxDictionary::cast(acrxSysRegistry()->at(ACRX_SERVICE_DICTIONARY))->at(ACRX_KERNEL_SERVICES))
    FRxObject := TAcRxKernel.cast(DArxObj.acrxServiceDictionary.at(ACRX_KERNEL_SERVICES));
  end;
  Result := TAcRxKernel(FRxObject);
end;

function TDAcRxKernel.newAcRxDictionary(const filter: TAcRxClass): TAcRxDictionary;
begin
  Result := RxObject.newAcRxDictionary(0, RxObject, filter);
end;

function TDAcRxKernel.newAcRxDictionary(length: Longword; delObjects: TAdesk_Boolean; sorted: TAdesk_Boolean = True{= Adesk_kTrue}; ignoreCase: TAdesk_Boolean = False{= Adesk_kFalse}): TAcRxDictionary;
begin
  Result := RxObject.newAcRxDictionary(0, RxObject, ignoreCase, sorted, delObjects, length);
end;

function TDAcRxKernel.newAcRxDictionary(sorted: TAdesk_Boolean = True {Adesk_kTrue}; ignoreCase: TAdesk_Boolean = False {Adesk_kFalse}): TAcRxDictionary;
begin
  Result := RxObject.newAcRxDictionary(0, RxObject, ignoreCase, sorted);
end;

{ TDAcEdCommandStack }

function TDAcEdCommandStack.RxObject: TAcEdCommandStack;
var
  SysRegistry: TAcRxDictionary;
begin
  if FRxObject = nil then begin
      SysRegistry := AextCLib.extern_acrxSysRegistry;
        // #define acedRegCmds AcEdCommandStack::cast(acrxSysRegistry()->at(ACRX_COMMAND_DOCK))
    if SysRegistry <> nil then FRxObject := TAcEdCommandStack.cast(SysRegistry.at(0, SysRegistry, extern_darxStrPChar(FKey)));
  end;
  Result := TAcEdCommandStack(FRxObject);
end;

function TDAcEdCommandStack.atPut(const cmdGroupName: AnsiString; var cmdsGlobal: TAcRxDictionary; var cmdsLocal: TAcRxDictionary): LongBool;
begin
  Result := RxObject.atPut(0, RxObject, cmdsLocal, cmdsGlobal, extern_darxStrPChar(cmdGroupName));
end;

function TDAcEdCommandStack.addCommand(const cmdGroupName, cmdGlobalName, cmdLocalName: AnsiString; commandFlags: TAdesk_Int32; FunctionAddr: PAcRxFunctionPtr;
                                                                      UIContext: TAcEdUIContext = nil; fcode: integer = -1; hResourceHandle: Longint = 0; cmdPtrRet: TAcEdCommand = nil): TAcad_ErrorStatus;
begin
  if (Acad_Release)or(DArxAcltObject = nil) then
    Result := RxObject.addCommand(0, RxObject, cmdPtrRet, hResourceHandle, fcode, UIContext, FunctionAddr, commandFlags, extern_darxStrPChar(cmdLocalName), extern_darxStrPChar(cmdGlobalName), extern_darxStrPChar(cmdGroupName))
  else
    Result := DArxAcltObject.addCommand(extern_darxStrPChar(cmdGroupName), extern_darxStrPChar(cmdGlobalName), extern_darxStrPChar(cmdLocalName), commandFlags, FunctionAddr, UIContext, fcode, hResourceHandle, cmdPtrRet);
end;

function TDAcEdCommandStack.iterator: TAcEdCommandIterator;
begin
  Result := RxObject.iterator(0, RxObject);
end;

function TDAcEdCommandStack.lookupGlobalCmd(const cmdName: AnsiString): TAcEdCommand;
begin
  Result := RxObject.lookupGlobalCmd(0, RxObject, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.lookupLocalCmd(const cmdName: AnsiString): TAcEdCommand;
begin
  Result := RxObject.lookupLocalCmd(0, RxObject, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.lookupCmd(const cmdName: AnsiString; globalFlag, allGroupsFlag, skipUndefed: LongBool): TAcEdCommand;
begin
  Result := RxObject.lookupCmd(0, RxObject, skipUndefed, allGroupsFlag, globalFlag, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.lookupCmd(const cmdName: AnsiString; GlobalFlag, allGroupsFlag: LongBool): TAcEdCommand;
begin
  Result := RxObject.lookupCmd(0, RxObject, allGroupsFlag, GlobalFlag, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.lookupCmd(cmdName: AnsiString; globalFlag: LongBool): TAcEdCommand;
begin
  Result := RxObject.lookupCmd(0, RxObject, globalFlag, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.lookupCmd2(const cmdName: AnsiString; globalFlag, allGroupsFlag: LongBool; skipFlags: integer; match: LongBool = False): TAcEdCommand;
begin
  Result := RxObject.lookupCmd2(0, RxObject, match, skipFlags,allGroupsFlag, globalFlag, extern_darxStrPChar(cmdName));
end;

function TDAcEdCommandStack.popGroupToTop(const cmdGroupName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.popGroupToTop(0, RxObject, extern_darxStrPChar(cmdGroupName));
end;

function TDAcEdCommandStack.removeCmd(const cmdGroupName, cmdGlobalName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.removeCmd(0, RxObject, extern_darxStrPChar(cmdGlobalName), extern_darxStrPChar(cmdGroupName));
  if (Acad_Release)or(DArxAcltObject = nil) then exit;
  Result := DArxAcltObject.removeCmd(extern_darxStrPChar(cmdGroupName), extern_darxStrPChar(cmdGlobalName));
end;

function TDAcEdCommandStack.removeGroup(const groupName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.removeGroup(0, RxObject, extern_darxStrPChar(groupName));
  if (Acad_Release)or(DArxAcltObject = nil) then exit;
  Result := DArxAcltObject.removeGroup(extern_darxStrPChar(groupName));
end;

{ TDAcEditor }

function TDAcEditor.RxObject: TAcEditor;
var
  SysRegistry: TAcRxDictionary;
begin
  if FRxObject = nil then begin
      SysRegistry := AextCLib.extern_acrxSysRegistry;
        // #define acedEditor AcEditor::cast(acrxSysRegistry()->at(ACED_EDITOR_OBJ))
    if SysRegistry <> nil then FRxObject := TAcEditor.cast(SysRegistry.at(0, SysRegistry, extern_darxStrPChar(FKey)));
  end;
  Result := TAcEditor(FRxObject);
end;

procedure TDAcEditor.addReactor(newObj: TDAcEditorReactor);
begin
  if darxAcEditorReactorManager = nil then darxAcEditorReactorManager := TDrxAcEditorReactorArray.Create;
  if darxAcEditorReactorManager = nil then exit;
  darxAcEditorReactorManager.Add(newObj);
end;

procedure TDAcEditor.removeReactor(delObj: TDAcEditorReactor);
begin
  if darxAcEditorReactorManager = nil then exit;
  darxAcEditorReactorManager.Delete(delObj);
end;

{ TDAcDbLayoutManager }

function TDAcDbLayoutManager.RxObject: TAcDbLayoutManager;
begin
  if FRxObject = nil then FRxObject := AextCLib.extern_acdbLayoutManager;
  Result := TAcDbLayoutManager(FRxObject);
end;

function TDAcDbLayoutManager.setCurrentLayout(const newname: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setCurrentLayout(0, RxObject, extern_darxStrPChar(newname));
end;

function TDAcDbLayoutManager.setCurrentLayoutId(layoutId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setCurrentLayoutId(0, RxObject, layoutId);
end;

function TDAcDbLayoutManager.findActiveLayout(allowModel: TAdesk_Boolean): AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.findActiveLayout(0, RxObject, allowModel);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbLayoutManager.getActiveLayoutBTRId: TAcDbObjectId;
begin
  Result := RxObject.getActiveLayoutBTRId(0, RxObject);
end;

function TDAcDbLayoutManager.findLayoutNamed(const name: AnsiString; leaveRecordOpen: TAdesk_Boolean = False): TAcDbLayout;
begin
  Result := RxObject.findLayoutNamed(0, RxObject,leaveRecordOpen, extern_darxStrPChar(name));
end;

function TDAcDbLayoutManager.copyLayout(const copyname, newname: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.copyLayout(0, RxObject, extern_darxStrPChar(newname), extern_darxStrPChar(copyname));
end;

function TDAcDbLayoutManager.deleteLayout(delname: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.deleteLayout(0, RxObject, extern_darxStrPChar(delname));
end;

function TDAcDbLayoutManager.createLayout(const newname: AnsiString; var layoutId, blockTableRecId: TAcDbObjectId; pDatabase: TAcDbDatabase = nil): TAcad_ErrorStatus;
begin
  Result := RxObject.createLayout(0, RxObject, pDatabase, blockTableRecId, layoutId, extern_darxStrPChar(newname));
end;

function TDAcDbLayoutManager.renameLayout(const oldname, newname: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.renameLayout(0, RxObject, extern_darxStrPChar(newname), extern_darxStrPChar(oldname));
end;

function TDAcDbLayoutManager.cloneLayout(pLBTR: TAcDbLayout;  const newname: AnsiString; newTabOrder: Integer = 0): TAcad_ErrorStatus;
begin
  Result := RxObject.cloneLayout(0, RxObject, newTabOrder, extern_darxStrPChar(newname), pLBTR);
end;

function TDAcDbLayoutManager.getNonRectVPIdFromClipId(clipId: TAcDbObjectId): TAcDbObjectId;
begin
  Result := RxObject.getNonRectVPIdFromClipId(0, RxObject, clipId);
end;

function TDAcDbLayoutManager.isVpnumClipped(index: Smallint): LongBool;
begin
  Result := RxObject.isVpnumClipped(0, RxObject, index);
end;

function TDAcDbLayoutManager.countLayouts(useDb: TAcDbDatabase = nil):Integer;
begin
  Result := RxObject.countLayouts(0, RxObject, useDb);
end;

procedure TDAcDbLayoutManager.addReactor(newObj: TDAcDbLayoutManagerReactor);
begin
  if darxAcDbLayoutManagerReactorManager = nil then darxAcDbLayoutManagerReactorManager := TDrxAcDbLayoutManagerReactorArray.Create;
  if darxAcDbLayoutManagerReactorManager = nil then exit;
  darxAcDbLayoutManagerReactorManager.Add(newObj);
end;

procedure TDAcDbLayoutManager.removeReactor(delObj: TDAcDbLayoutManagerReactor);
begin
  if darxAcDbLayoutManagerReactorManager = nil then exit;
  darxAcDbLayoutManagerReactorManager.Delete(delObj);
end;

{ TDAcDbHostApplicationServices }

function TDAcDbHostApplicationServices.RxObject: TAcDbHostApplicationServices;
begin
  Result := TAcDbHostApplicationServices(FRxObject);
end;

function TDAcDbHostApplicationServices.findFile(pcFullPathOut: AnsiString; nBufferLength: Integer; const pcFilename: AnsiString; pDb: TAcDbDatabase = nil; hint: TAcDbHostApplicationServices_FindFileHint = AcDbHostApplicationServices_kDefault): TAcad_ErrorStatus;
begin
  Result := RxObject.findFile(0, RxObject, hint, pDb, extern_darxStrPChar(pcFilename), nBufferLength, extern_darxStrPChar(pcFullPathOut));
end;

function TDAcDbHostApplicationServices.selectFile(userCancel: PSmallint; var chosenPath: AnsiString; h: Pointer; const nFlags: Integer; const prompt, dir, name, atype: AnsiString; pnChoice: PInteger; pbReadOnly: PLongBool; const pszWSTags: AnsiString; pReserved: Pointer): TAcad_ErrorStatus;
var
  lpchosenPath: PChar;
begin
  lpchosenPath := nil;
  Result := RxObject.selectFile(0, RxObject, pReserved, extern_darxStrPChar(pszWSTags), pbReadOnly, pnChoice, extern_darxStrPChar(atype), extern_darxStrPChar(name), extern_darxStrPChar(dir), extern_darxStrPChar(prompt), nFlags, h, lpchosenPath, userCancel);
  if lpchosenPath = nil then chosenPath := '' else chosenPath := extern_darxPString(lpchosenPath);
  extern_darxFreeString(lpchosenPath);
end;

function TDAcDbHostApplicationServices.registerSelectFileCallback(const appName: AnsiString; proc: PSELECTFILEPROC; unRegister: LongBool = False; asPrimary: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.registerSelectFileCallback(0, RxObject, asPrimary, unRegister, proc, extern_darxStrPChar(appName));
end;

function TDAcDbHostApplicationServices.primaryClientForSelectFileCallback: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.primaryClientForSelectFileCallback(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.getRegisteredSelectFileClients(var clients: TAcArray): TAcad_ErrorStatus;
begin
  Result := RxObject.getRegisteredSelectFileClients(0, RxObject, clients);
end;

function TDAcDbHostApplicationServices.mapFile(var newName: AnsiString; const filename: AnsiString; context: Integer; pReserved: Pointer): TAcad_ErrorStatus;
var
  lpnewName: PChar;
begin
  lpnewName := nil;
  Result := RxObject.mapFile(0, RxObject, pReserved, context, extern_darxStrPChar(filename), lpnewName);
  if lpnewName = nil then newName := '' else newName := extern_darxPString(lpnewName);
  extern_darxFreeString(lpnewName);
end;

function TDAcDbHostApplicationServices.registerMapFileCallback(const appName: AnsiString; proc: PREMAPPROC; unRegister: LongBool = False; asPrimary: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.registerMapFileCallback(0, RxObject, asPrimary, unRegister, proc, extern_darxStrPChar(appName));
end;

function TDAcDbHostApplicationServices.primaryClientForMapFileCallback: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.primaryClientForMapFileCallback(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.setMapFlag(setIt: LongBool): LongBool;
begin
  Result := RxObject.setMapFlag(0, RxObject, setIt);
end;

function TDAcDbHostApplicationServices.getRegisteredFileMapClients(var clients: TAcArray): TAcad_ErrorStatus;
begin
  Result := RxObject.getRegisteredFileMapClients(0, RxObject, clients);
end;

function TDAcDbHostApplicationServices.registerMapFileNotification(const appName:AnsiString; proc: PMAPFILENOTIFYPROC; unRegister: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.registerMapFileNotification(0, RxObject, unRegister, proc, extern_darxStrPChar(appName));
end;

procedure TDAcDbHostApplicationServices.fatalError(format: array of AnsiString);
begin
  //RxObject.fatalError(0, RxObject, format: array of AnsiString);
end;

procedure TDAcDbHostApplicationServices.reportUnhandledArxException(const pExcPtrs: PEXCEPTION_POINTERS; const pAppName: AnsiString);
begin
  RxObject.reportUnhandledArxException(0, RxObject, extern_darxStrPChar(pAppName), pExcPtrs);
end;

function TDAcDbHostApplicationServices.userBreak(updCtrlsWhenEnteringIdle: LongBool = true): TAdesk_Boolean;
begin
  Result := RxObject.userBreak(0, RxObject, updCtrlsWhenEnteringIdle);
end;

procedure TDAcDbHostApplicationServices.displayChar(c: Shortint);
begin
  RxObject.displayChar(0, RxObject, c);
end;

procedure TDAcDbHostApplicationServices.displayString(astring: AnsiString; count: Integer);
begin
  RxObject.displayString(0, RxObject, count, extern_darxStrPChar(astring));
end;

function TDAcDbHostApplicationServices.readyToDisplayMessages: TAdesk_Boolean;
begin
  Result := RxObject.readyToDisplayMessages(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.enableMessageDisplay(ra: TAdesk_Boolean);
begin
  RxObject.enableMessageDisplay(0, RxObject, ra);
end;

function TDAcDbHostApplicationServices.doFullCRCCheck: TAdesk_Boolean;
begin
  Result := RxObject.doFullCRCCheck(0, RxObject);
end;

function TDAcDbHostApplicationServices.getTempPath(lBufferSize: TAdesk_UInt32; pcBuffer: AnsiString): Longword;
begin
  Result := RxObject.getTempPath(0, RxObject, extern_darxStrPChar(pcBuffer), lBufferSize);
end;

function TDAcDbHostApplicationServices.getEnv(const avar: AnsiString): AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.getEnv(0, RxObject, extern_darxStrPChar(avar));
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.newProgressMeter: TAcDbHostApplicationProgressMeter;
begin
  Result := RxObject.newProgressMeter(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setWorkingProgressMeter(pNewMeter: TAcDbHostApplicationProgressMeter);
begin
  RxObject.setWorkingProgressMeter(0, RxObject, pNewMeter);
end;

function TDAcDbHostApplicationServices.newClipBoundaryRectangular: TAcDbAbstractClipBoundaryDefinitionz;
begin
  Result := RxObject.newClipBoundaryRectangular(0, RxObject);
end;

function TDAcDbHostApplicationServices.newClipBoundaryPolygonal: TAcDbAbstractClipBoundaryDefinition;
begin
  Result := RxObject.newClipBoundaryPolygonal(0, RxObject);
end;

function TDAcDbHostApplicationServices.newClipBoundaryArray: TClipBoundaryArray;
begin
  Result := RxObject.newClipBoundaryArray(0, RxObject);
end;

function TDAcDbHostApplicationServices.workingDatabase: TAcDbDatabase;
begin
  Result := RxObject.workingDatabase(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setWorkingDatabase(pDatabase: TAcDbDatabase);
begin
  RxObject.setWorkingDatabase(0, RxObject, pDatabase);
end;

function TDAcDbHostApplicationServices.defaultUndoController: TAcDbUndoController;
begin
  Result := RxObject.defaultUndoController(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setDefaultUndoController(pUndoCtrl: TAcDbUndoController);
begin
  RxObject.setDefaultUndoController(0, RxObject, pUndoCtrl);
end;

function TDAcDbHostApplicationServices.workingTransactionManager: TAcDbTransactionManager;
begin
  Result := RxObject.workingTransactionManager(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setWorkingTransactionManager(pTM: TAcDbTransactionManager);
begin
  RxObject.setWorkingTransactionManager(0, RxObject, pTM);
end;

function TDAcDbHostApplicationServices.createWorkingGlobals: TAcDbGlobals;
begin
  Result := RxObject.createWorkingGlobals(0, RxObject);
end;

function TDAcDbHostApplicationServices.workingGlobals: TAcDbGlobals;
begin
  Result := RxObject.workingGlobals(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setWorkingGlobals(pGlobals: TAcDbGlobals);
begin
  RxObject.setWorkingGlobals(0, RxObject, pGlobals);
end;

function TDAcDbHostApplicationServices.workingAppSysvars: TAcDbAppSystemVariables;
begin
  Result := RxObject.workingAppSysvars(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setWorkingAppSysvars(pSysvars: TAcDbAppSystemVariables);
begin
  RxObject.setWorkingAppSysvars(0, RxObject, pSysvars);
end;

function TDAcDbHostApplicationServices.rxProgram: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.rxProgram(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.product: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.product(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.companyName: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.companyName(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.prodcode: TProdIdCode;
begin
  Result := RxObject.prodcode(0, RxObject);
end;

function TDAcDbHostApplicationServices.releaseMajorMinorString: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.releaseMajorMinorString(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.releaseMajorVersion: Integer;
begin
  Result := RxObject.releaseMajorVersion(0, RxObject);
end;

function TDAcDbHostApplicationServices.releaseMinorVersion: Integer;
begin
  Result := RxObject.releaseMinorVersion(0, RxObject);
end;

function TDAcDbHostApplicationServices.versionString: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.versionString(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.getRegistryProductRootKey: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.getRegistryProductRootKey(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.getRegistryProductLCID: TLCID;
begin
  Result := RxObject.getRegistryProductLCID(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.setSystemCodePage(id: Tcode_page_id);
begin
  RxObject.setSystemCodePage(0, RxObject, id);
end;

function TDAcDbHostApplicationServices.getSystemCodePage: Tcode_page_id;
begin
  Result := RxObject.getSystemCodePage(0, RxObject);
end;

function TDAcDbHostApplicationServices.acadInternalServices: TAcadInternalServices;
begin
  Result := RxObject.acadInternalServices(0, RxObject);
end;

procedure TDAcDbHostApplicationServices.acadInternalGetvar(const name: AnsiString);
begin
  RxObject.acadInternalGetvar(0, RxObject, extern_darxStrPChar(name));
end;

function TDAcDbHostApplicationServices.isURL(const pszURL: AnsiString): TAdesk_Boolean;
begin
  Result := RxObject.isURL(0, RxObject, extern_darxStrPChar(pszURL));
end;

function TDAcDbHostApplicationServices.isRemoteFile(const pszLocalFile: AnsiString; pszURL: AnsiString): TAdesk_Boolean;
begin
  Result := RxObject.isRemoteFile(0, RxObject, extern_darxStrPChar(pszURL), extern_darxStrPChar(pszLocalFile));
end;

function TDAcDbHostApplicationServices.getRemoteFile(const pszURL: AnsiString; pszLocalFile: AnsiString; bIgnoreCache: TAdesk_Boolean = Adesk_kFalse): TAcad_ErrorStatus;
begin
  Result := RxObject.getRemoteFile(0, RxObject, bIgnoreCache, extern_darxStrPChar(pszLocalFile), extern_darxStrPChar(pszURL));
end;

function TDAcDbHostApplicationServices.putRemoteFile(const pszURL: AnsiString; const pszLocalFile: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.putRemoteFile(0, RxObject, extern_darxStrPChar(pszLocalFile), extern_darxStrPChar(pszURL));
end;

function TDAcDbHostApplicationServices.launchBrowserDialog(pszSelectedURL: AnsiString; const pszDialogTitle, pszOpenButtonCaption, pszStartURL: AnsiString; const pszRegistryRootKey: AnsiString = ''; bOpenButtonAlwaysEnabled: TAdesk_Boolean = Adesk_kFalse): TAdesk_Boolean;
begin
  Result := RxObject.launchBrowserDialog(0, RxObject, bOpenButtonAlwaysEnabled, extern_darxStrPChar(pszRegistryRootKey), extern_darxStrPChar(pszStartURL), extern_darxStrPChar(pszOpenButtonCaption), extern_darxStrPChar(pszDialogTitle), extern_darxStrPChar(pszSelectedURL));
end;

procedure TDAcDbHostApplicationServices.drawOleOwnerDrawItem(pItem: TposCOleClientItem; hdc, left, top, right, bottom: Longint);
begin
  RxObject.drawOleOwnerDrawItem(0, RxObject, bottom, right, top, left, hdc, pItem);
end;

function TDAcDbHostApplicationServices.getNewOleClientItem(var pItem: TposCOleClientItem): TAcad_ErrorStatus;
begin
  Result := RxObject.getNewOleClientItem(0, RxObject, pItem);
end;

function TDAcDbHostApplicationServices.serializeOleItem(pItem: TposCOleClientItem; obj: TposCArchive): TAcad_ErrorStatus;
begin
  Result := RxObject.serializeOleItem(0, RxObject, obj, pItem);
end;

function TDAcDbHostApplicationServices.entToWorldTransform(normal: Tads_point; tran: Tflagmat): TAdesk_Boolean;
begin
  Result := RxObject.entToWorldTransform(0, RxObject, tran, normal);
end;

procedure TDAcDbHostApplicationServices.terminateScript;
begin
  RxObject.terminateScript(0, RxObject);
end;

function TDAcDbHostApplicationServices.getSubstituteFont(var pFileName: AnsiString; prompt: AnsiString; atype, fontAlt: Integer): TAdesk_Boolean;
var
  lpFileName: PChar;
begin
  lpFileName := nil;
  Result := RxObject.getSubstituteFont(0, RxObject, fontAlt, atype, extern_darxStrPChar(prompt), lpFileName);
  if lpFileName = nil then pFileName := '' else pFileName := extern_darxPString(lpFileName);
  extern_darxFreeString(lpFileName);
end;

procedure TDAcDbHostApplicationServices.alert(const astring: AnsiString);
begin
  RxObject.alert(0, RxObject, extern_darxStrPChar(astring));
end;

procedure TDAcDbHostApplicationServices.auditPrintReport(pAuditInfo: TAcDbAuditInfo; const line: AnsiString; both: Integer);
begin
  RxObject.auditPrintReport(0, RxObject, both, extern_darxStrPChar(line), pAuditInfo);
end;

function TDAcDbHostApplicationServices.getAlternateFontName: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.getAlternateFontName(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.getFontMapFileName: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.getFontMapFileName(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbHostApplicationServices.cacheSymbolIndices: LongBool;
begin
  Result := RxObject.cacheSymbolIndices(0, RxObject);
end;

function TDAcDbHostApplicationServices.plotSettingsValidator: TAcDbPlotSettingsValidator;
begin
  Result := RxObject.plotSettingsValidator(0, RxObject);
end;

function TDAcDbHostApplicationServices.layoutManager: TAcDbLayoutManager;
begin
  Result := RxObject.layoutManager(0, RxObject);
end;

function TDAcDbHostApplicationServices.loadApp(const appName: AnsiString; why: TAcadApp_LoadReasons; printit, asCmd: LongBool): LongBool;
begin
  Result := RxObject.loadApp(0, RxObject, asCmd, printit, why, extern_darxStrPChar(appName));
end;

procedure TDAcDbHostApplicationServices.getDefaultPlotCfgInfo(plotDeviceName, plotStyleName: AnsiString);
begin
  RxObject.getDefaultPlotCfgInfo(0, RxObject, extern_darxStrPChar(plotStyleName), extern_darxStrPChar(plotDeviceName));
end;

{ TDGlobalAcDbHostApplicationServices }

function TDGlobalAcDbHostApplicationServices.RxObject: TAcDbHostApplicationServices;
begin
  Result := extern_acdbHostApplicationServices;
end;

{ TDAcGiDrawable }

function TDAcGiDrawable.RxObject: TAcGiDrawable;
begin
  Result := TAcGiDrawable(FRxObject);
end;

function TDAcGiDrawable.setAttributes(pTraits: TAcGiDrawableTraits): TAdesk_UInt32;
begin
  Result := RxObject.setAttributes(0, RxObject, pTraits);
end;

function TDAcGiDrawable.worldDraw(pWd: TAcGiWorldDraw): TAdesk_Boolean;
begin
  Result := RxObject.worldDraw(0, RxObject, pWd);
end;

procedure TDAcGiDrawable.viewportDraw(pVd: TAcGiViewportDraw);
begin
  RxObject.viewportDraw(0, RxObject, pVd);
end;

function TDAcGiDrawable.isPersistent: TAdesk_Boolean;
begin
  Result := RxObject.isPersistent(0, RxObject);
end;

function TDAcGiDrawable.id: TposAcDbObjectId;
begin
  Result := RxObject.id(0, RxObject);
end;

procedure TDAcGiDrawable.setGsNode(pNode: TAcGsNode);
begin
  RxObject.setGsNode(0, RxObject, pNode);
end;

function TDAcGiDrawable.gsNode: TAcGsNode;
begin
  Result := RxObject.gsNode(0, RxObject);
end;

function TDAcGiDrawable.viewportDrawLogicalFlags(vd: TAcGiViewportDraw): TAdesk_UInt32;
begin
  Result := RxObject.viewportDrawLogicalFlags(0, RxObject, vd);
end;

{ TDAcDbObject }

function TDAcDbObject.RxObject: TAcDbObject;
begin
  Result := TAcDbObject(FRxObject);
end;

function TDAcDbObject.objectId: TAcDbObjectId;
begin
  Result := RxObject.objectId(0, RxObject);
end;

function TDAcDbObject.ownerId: TAcDbObjectId;
begin
  Result := RxObject.ownerId(0, RxObject);
end;

function TDAcDbObject.setOwnerId(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setOwnerId(0, RxObject, objId);
end;

procedure TDAcDbObject.getAcDbHandle(var handle: TAcDbHandle);
begin
  RxObject.getAcDbHandle(0, RxObject, handle);
end;

function TDAcDbObject.database: TAcDbDatabase;
begin
  Result := RxObject.database(0, RxObject);
end;

function TDAcDbObject.createExtensionDictionary: TAcad_ErrorStatus;
begin
  Result := RxObject.createExtensionDictionary(0, RxObject);
end;

function TDAcDbObject.extensionDictionary: TAcDbObjectId;
begin
  Result := RxObject.extensionDictionary(0, RxObject);
end;

function TDAcDbObject.releaseExtensionDictionary: TAcad_ErrorStatus;
begin
  Result := RxObject.releaseExtensionDictionary(0, RxObject);
end;

function TDAcDbObject.upgradeOpen: TAcad_ErrorStatus;
begin
  Result := RxObject.upgradeOpen(0, RxObject);
end;

function TDAcDbObject.upgradeFromNotify: TAcad_ErrorStatus;
begin
  Result := RxObject.upgradeFromNotify(0, RxObject);
end;

function TDAcDbObject.downgradeOpen: TAcad_ErrorStatus;
begin
  Result := RxObject.downgradeOpen(0, RxObject);
end;

function TDAcDbObject.downgradeToNotify: TAcad_ErrorStatus;
begin
  Result := RxObject.downgradeToNotify(0, RxObject);
end;

function TDAcDbObject.subOpen: TAcad_ErrorStatus;
begin
  Result := RxObject.subOpen(0, RxObject);
end;

function TDAcDbObject.cancel: TAcad_ErrorStatus;
begin
  Result := RxObject.cancel(0, RxObject);
end;

function TDAcDbObject.subCancel: TAcad_ErrorStatus;
begin
  Result := RxObject.subCancel(0, RxObject);
end;

function TDAcDbObject.close: TAcad_ErrorStatus;
begin
  Result := RxObject.close(0, RxObject);
end;

function TDAcDbObject.closeAndPage(onlyWhenClean: TAdesk_Boolean = True): TAcad_ErrorStatus;
begin
  Result := RxObject.closeAndPage(0, RxObject, onlyWhenClean);
end;

function TDAcDbObject.subClose: TAcad_ErrorStatus;
begin
  Result := RxObject.subClose(0, RxObject);
end;

function TDAcDbObject.erase(erasing: TAdesk_Boolean = True): TAcad_ErrorStatus;
begin
  Result := RxObject.erase(0, RxObject, erasing);
end;

function TDAcDbObject.subErase(erasing: TAdesk_Boolean): TAcad_ErrorStatus;
begin
  Result := RxObject.subErase(0, RxObject, erasing);
end;

function TDAcDbObject.handOverTo(newObject: TAcDbObject; keepXData: TAdesk_Boolean = True; keepExtDict: TAdesk_Boolean = True): TAcad_ErrorStatus;
begin
  Result := RxObject.handOverTo(0, RxObject, keepExtDict, keepXData, newObject);
end;

function TDAcDbObject.subHandOverTo(newObject: TAcDbObject): TAcad_ErrorStatus;
begin
  Result := RxObject.subHandOverTo(0, RxObject, newObject);
end;

function TDAcDbObject.swapIdWith(otherId: TAcDbObjectId; swapXdata: TAdesk_Boolean = False; swapExtDict: TAdesk_Boolean = False): TAcad_ErrorStatus;
begin
  Result := RxObject.swapIdWith(0, RxObject, swapExtDict, swapXdata, otherId);
end;

function TDAcDbObject.subSwapIdWith(otherId: TAcDbObjectId; swapXdata: TAdesk_Boolean = False; swapExtDict: TAdesk_Boolean = False): TAcad_ErrorStatus;
begin
  Result := RxObject.subSwapIdWith(0, RxObject, swapExtDict, swapXdata, otherId);
end;

function TDAcDbObject.swapReferences(var idMap: TAcDbIdMapping): TAcad_ErrorStatus;
begin
  Result := RxObject.swapReferences(0, RxObject, idMap);
end;

function TDAcDbObject.audit(pAuditInfo: TAcDbAuditInfo): TAcad_ErrorStatus;
begin
  Result := RxObject.audit(0, RxObject, pAuditInfo);
end;

function TDAcDbObject.dwgIn(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dwgIn(0, RxObject, pFiler);
end;

function TDAcDbObject.dwgInFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dwgInFields(0, RxObject, pFiler);
end;

function TDAcDbObject.dwgOut(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dwgOut(0, RxObject, pFiler);
end;

function TDAcDbObject.dwgOutFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dwgOutFields(0, RxObject, pFiler);
end;

function TDAcDbObject.dxfIn(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfIn(0, RxObject, pFiler);
end;

function TDAcDbObject.dxfInFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfInFields(0, RxObject, pFiler);
end;

function TDAcDbObject.dxfOut(pFiler: TAcDbDwgFiler; allXdFlag: TAdesk_Boolean; regAppTable: TAdesk_uchar): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfOut(0, RxObject, regAppTable, allXdFlag, pFiler);
end;

function TDAcDbObject.dxfOutFields(pFiler: TAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfOutFields(0, RxObject, pFiler);
end;

function TDAcDbObject.mergeStyle: TAcDb_DuplicateRecordCloning;
begin
  Result := RxObject.mergeStyle(0, RxObject);
end;

function TDAcDbObject.xData(const regappName: AnsiString = ''): Presbuf;
begin
  Result := RxObject.xData(0, RxObject, extern_darxStrPChar(regappName));
end;

function TDAcDbObject.setXData(const xdata: Presbuf): TAcad_ErrorStatus;
begin
  Result := RxObject.setXData(0, RxObject, xdata);
end;

function TDAcDbObject.xDataTransformBy(var xform: TAcGeMatrix3d): TAcad_ErrorStatus;
begin
  Result := RxObject.xDataTransformBy(0, RxObject, xform);
end;

function TDAcDbObject.isEraseStatusToggled: TAdesk_Boolean;
begin
  Result := RxObject.isEraseStatusToggled(0, RxObject);
end;

function TDAcDbObject.isErased: TAdesk_Boolean;
begin
  Result := RxObject.isErased(0, RxObject);
end;

function TDAcDbObject.isReadEnabled: TAdesk_Boolean;
begin
  Result := RxObject.isReadEnabled(0, RxObject);
end;

function TDAcDbObject.isWriteEnabled: TAdesk_Boolean;
begin
  Result := RxObject.isWriteEnabled(0, RxObject);
end;

function TDAcDbObject.isNotifyEnabled: TAdesk_Boolean;
begin
  Result := RxObject.isNotifyEnabled(0, RxObject);
end;

function TDAcDbObject.isModified: TAdesk_Boolean;
begin
  Result := RxObject.isModified(0, RxObject);
end;

function TDAcDbObject.isModifiedXData: TAdesk_Boolean;
begin
  Result := RxObject.isModifiedXData(0, RxObject);
end;

function TDAcDbObject.isModifiedGraphics: TAdesk_Boolean;
begin
  Result := RxObject.isModifiedGraphics(0, RxObject);
end;

function TDAcDbObject.isNewObject: TAdesk_Boolean;
begin
  Result := RxObject.isNewObject(0, RxObject);
end;

function TDAcDbObject.isNotifying: TAdesk_Boolean;
begin
  Result := RxObject.isNotifying(0, RxObject);
end;

function TDAcDbObject.isUndoing: TAdesk_Boolean;
begin
  Result := RxObject.isUndoing(0, RxObject);
end;

function TDAcDbObject.isCancelling: TAdesk_Boolean;
begin
  Result := RxObject.isCancelling(0, RxObject);
end;

function TDAcDbObject.isReallyClosing: TAdesk_Boolean;
begin
  Result := RxObject.isReallyClosing(0, RxObject);
end;

function TDAcDbObject.isTransactionResident: TAdesk_Boolean;
begin
  Result := RxObject.isTransactionResident(0, RxObject);
end;

function TDAcDbObject.isAProxy: TAdesk_Boolean;
begin
  Result := RxObject.isAProxy(0, RxObject);
end;

procedure TDAcDbObject.assertReadEnabled;
begin
  RxObject.assertReadEnabled(0, RxObject);
end;

procedure TDAcDbObject.assertWriteEnabled(autoUndo: TAdesk_Boolean = True; recordModified: TAdesk_Boolean = True);
begin
  RxObject.assertWriteEnabled(0, RxObject, recordModified, autoUndo);
end;

procedure TDAcDbObject.assertNotifyEnabled;
begin
  RxObject.assertNotifyEnabled(0, RxObject);
end;

procedure TDAcDbObject.disableUndoRecording(disable: TAdesk_Boolean);
begin
  RxObject.disableUndoRecording(0, RxObject, disable);
end;

function TDAcDbObject.undoFiler: TAcDbDwgFiler;
begin
  Result := RxObject.undoFiler(0, RxObject);
end;

function TDAcDbObject.applyPartialUndo(undoFiler: TAcDbDwgFiler; classObj: TAcRxClass): TAcad_ErrorStatus;
begin
  Result := RxObject.applyPartialUndo(0, RxObject, classObj, undoFiler);
end;

procedure TDAcDbObject.addReactor(newObj: TDAcDbObjectReactor);
begin
  //if darxAcDbDataBaseReactorManager = nil then darxAcDbDataBaseReactorManager := TDrxAcDbDataBaseReactorArray.Create;
  //if darxAcDbDataBaseReactorManager = nil then exit;
  //darxAcDbDataBaseReactorManager.Add(RxObject, newObj);
end;

procedure TDAcDbObject.removeReactor(delObj: TDAcDbObjectReactor);
begin
  //if darxAcDbDataBaseReactorManager = nil then exit;
  //darxAcDbDataBaseReactorManager.Delete(RxObject, delObj);
end;

procedure TDAcDbObject.addPersistentReactor(objId: TAcDbObjectId);
begin
  RxObject.addPersistentReactor(0, RxObject, objId);
end;

function TDAcDbObject.removePersistentReactor(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.removePersistentReactor(0, RxObject, objId);
end;

function TDAcDbObject.reactors: TAcDbVoidPtrArray;
begin
  Result := RxObject.reactors(0, RxObject);
end;

procedure TDAcDbObject.recvPropagateModify(const subObj: TAcDbObject);
begin
  RxObject.recvPropagateModify(0, RxObject, subObj);
end;

procedure TDAcDbObject.xmitPropagateModify;
begin
  RxObject.xmitPropagateModify(0, RxObject);
end;

function TDAcDbObject.deepClone(pOwnerObject: TAcDbObject; var pClonedObject: TAcDbObject; var idMap: TAcDbIdMapping; isPrimary: TAdesk_Boolean = True): TAcad_ErrorStatus;
begin
  Result := RxObject.deepClone(0, RxObject, isPrimary, idMap, pClonedObject, pOwnerObject);
end;

function TDAcDbObject.wblockClone(pOwnerObject: TAcDbObject; var pClonedObject: TAcDbObject; var idMap: TAcDbIdMapping; isPrimary: TAdesk_Boolean = True): TAcad_ErrorStatus;
begin
  Result := RxObject.wblockClone(0, RxObject, isPrimary, idMap, pClonedObject, pOwnerObject);
end;

procedure TDAcDbObject.setAcDbObjectIdsInFlux;
begin
  RxObject.setAcDbObjectIdsInFlux(0, RxObject);
end;

function TDAcDbObject.isAcDbObjectIdsInFlux : TAdesk_Boolean;
begin
  Result := RxObject.isAcDbObjectIdsInFlux(0, RxObject);
end;

procedure TDAcDbObject.cancelled(const dbObj: TAcDbObject);
begin
  RxObject.cancelled(0, RxObject, dbObj);
end;

procedure TDAcDbObject.copied(const dbObj: TAcDbObject; const newObj: TAcDbObject);
begin
  RxObject.copied(0, RxObject, newObj, dbObj);
end;

procedure TDAcDbObject.erased(const dbObj: TAcDbObject; pErasing: TAdesk_Boolean = True);
begin
  RxObject.erased(0, RxObject, pErasing, dbObj);
end;

procedure TDAcDbObject.goodbye(const dbObj: TAcDbObject);
begin
  RxObject.goodbye(0, RxObject, dbObj);
end;

procedure TDAcDbObject.openedForModify(const dbObj: TAcDbObject);
begin
  RxObject.openedForModify(0, RxObject, dbObj);
end;

procedure TDAcDbObject.modified(const dbObj: TAcDbObject);
begin
  RxObject.modified(0, RxObject, dbObj);
end;

procedure TDAcDbObject.subObjModified(const dbObj: TAcDbObject; const subObj: TAcDbObject);
begin
  RxObject.subObjModified(0, RxObject, subObj, dbObj);
end;

procedure TDAcDbObject.modifyUndone(const dbObj: TAcDbObject);
begin
  RxObject.modifyUndone(0, RxObject, dbObj);
end;

procedure TDAcDbObject.modifiedXData(const dbObj: TAcDbObject);
begin
  RxObject.modifiedXData(0, RxObject, dbObj);
end;

procedure TDAcDbObject.unappended(const dbObj: TAcDbObject);
begin
  RxObject.unappended(0, RxObject, dbObj);
end;

procedure TDAcDbObject.reappended(const dbObj: TAcDbObject);
begin
  RxObject.reappended(0, RxObject, dbObj);
end;

procedure TDAcDbObject.objectClosed(const objId: TAcDbObjectId);
begin
  RxObject.objectClosed(0, RxObject, objId);
end;

procedure TDAcDbObject.modifiedGraphics(const dbEnt: TAcDbEntity);
begin
  RxObject.modifiedGraphics(0, RxObject, dbEnt);
end;

function TDAcDbObject.clone: TAcRxObject;
begin
  Result := RxObject.clone(0, RxObject);
end;

function TDAcDbObject.copyFrom(const pSrc: TAcRxObject): TAcad_ErrorStatus;
begin
  Result := RxObject.copyFrom(0, RxObject, pSrc);
end;

function TDAcDbObject.hasSaveVersionOverride: LongBool;
begin
  Result := RxObject.hasSaveVersionOverride(0, RxObject);
end;

procedure TDAcDbObject.setHasSaveVersionOverride(bSetIt: LongBool);
begin
  RxObject.setHasSaveVersionOverride(0, RxObject, bSetIt);
end;

function TDAcDbObject.getObjectSaveVersion(const pFiler: TAcDbDwgFiler; var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus;
begin
  Result := RxObject.getObjectSaveVersion(0, RxObject, maintVer, ver, pFiler);
end;

function TDAcDbObject.getObjectSaveVersion(const pFiler: TAcDbDxfFiler; var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus;
begin
  Result := RxObject.getObjectSaveVersion(0, RxObject, maintVer, ver, pFiler);
end;

function TDAcDbObject.getObjectBirthVersion(var ver: TAcDb_AcDbDwgVersion; var maintVer: TAcDb_MaintenanceReleaseVersion): TAcad_ErrorStatus;
begin
  Result := RxObject.getObjectBirthVersion(0, RxObject, maintVer, ver);
end;

function TDAcDbObject.decomposeForSave(ver: TAcDb_AcDbDwgVersion; var replaceObj: TAcDbObject; var replaceId: TAcDbObjectId; var exchangeXData: TAdesk_Boolean): TAcad_ErrorStatus;
begin
  Result := RxObject.decomposeForSave(0, RxObject, exchangeXData, replaceId, replaceObj, ver);
end;

function TDAcDbObject.drawable: TAcGiDrawable;
begin
  Result := RxObject.drawable(0, RxObject);
end;

function TDAcDbObject.setAttributes(pTraits: TAcGiDrawableTraits): TAdesk_UInt32;
begin
  Result := RxObject.setAttributes(0, RxObject, pTraits);
end;

function TDAcDbObject.worldDraw(pWd: TAcGiWorldDraw): TAdesk_Boolean;
begin
  Result := RxObject.worldDraw(0, RxObject, pWd);
end;

procedure TDAcDbObject.viewportDraw(pVd: TAcGiViewportDraw);
begin
  RxObject.viewportDraw(0, RxObject, pVd);
end;

function TDAcDbObject.isPersistent: TAdesk_Boolean;
begin
  Result := RxObject.isPersistent(0, RxObject);
end;

function TDAcDbObject.id: TposAcDbObjectId;
begin
  Result := RxObject.id(0, RxObject);
end;

procedure TDAcDbObject.setGsNode(pNode: TAcGsNode);
begin
  RxObject.setGsNode(0, RxObject, pNode);
end;

function TDAcDbObject.gsNode: TAcGsNode;
begin
  Result := RxObject.gsNode(0, RxObject);
end;

function TDAcDbObject.getClassID(pClsid: PGUID): TAcad_ErrorStatus;
begin
  Result := RxObject.getClassID(0, RxObject, pClsid);
end;

{ TDAcDbdataBase }

constructor TDAcDbDataBase.Create(buildDefaultDrawing: LongBool = True; noDocument: LongBool = False);
begin
  inherited Create(True);
  FRxObject := new_AcDbDataBase(buildDefaultDrawing, noDocument);
end;

function TDAcDbDataBase.RxObject: TAcDbDataBase;
begin
  Result := TAcDbDataBase(FRxObject);
end;

function TDAcDbDataBase.addAcDbObject(pObj: TposAcDbObject): TAcad_ErrorStatus;
begin
  Result := RxObject.addAcDbObject(0, RxObject, pObj);
end;

function TDAcDbDataBase.addAcDbObject(var objId: TAcDbObjectId; pObj: TposAcDbObject): TAcad_ErrorStatus;
begin
  Result := RxObject.addAcDbObject(0, RxObject, pObj, objId);
end;

function TDAcDbDataBase.getBlockTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getBlockTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getBlockTable(var pTable: TposAcDbBlockTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getBlockTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getLayerTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getLayerTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getLayerTable(var pTable: TposAcDbLayerTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getLayerTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getTextStyleTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getTextStyleTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getTextStyleTable(var pTable: TposAcDbTextStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getTextStyleTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getLinetypeTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getLinetypeTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getLinetypeTable(var pTable: TposAcDbLinetypeTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getLinetypeTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getViewTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getViewTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getViewTable(var pTable: TposAcDbViewTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getViewTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getUCSTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getUCSTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getUCSTable(var pTable: TposAcDbUCSTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getUCSTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getViewportTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getViewportTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getViewportTable(var pTable: TposAcDbViewportTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getViewportTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getRegAppTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getRegAppTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getRegAppTable(var pTable: TposAcDbRegAppTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getRegAppTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getDimStyleTable(var pTable: TposAcDbSymbolTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getDimStyleTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getDimStyleTable(var pTable: TposAcDbDimStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getDimStyleTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbBlockTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbLayerTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbTextStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbLinetypeTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbViewTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbUCSTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbViewportTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbRegAppTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getSymbolTable(var pTable: TposAcDbDimStyleTable; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getSymbolTable(0, RxObject, mode, pTable);
end;

function TDAcDbDataBase.getGroupDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getGroupDictionary(0, RxObject, mode, pDict);
end;

function TDAcDbDataBase.getMLStyleDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getMLStyleDictionary(0, RxObject, mode, pDict);
end;

function TDAcDbDataBase.getLayoutDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getLayoutDictionary(0, RxObject, mode, pDict);
end;

function TDAcDbDataBase.getPlotStyleNameDictionary(var pDict: TposAcDbDictionaryWithDefault; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getPlotStyleNameDictionary(0, RxObject, mode, pDict);
end;

function TDAcDbDataBase.getNamedObjectsDictionary(var pDict: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getNamedObjectsDictionary(0, RxObject, mode, pDict);
end;

function TDAcDbDataBase.getPlotSettingsDictionary(var pTable: TposAcDbDictionary; mode: TAcDb_OpenMode): TAcad_ErrorStatus;
begin
  Result := RxObject.getPlotSettingsDictionary(0, RxObject, mode, pTable);
end;


function TDAcDbDataBase.blockTableId: TAcDbObjectId;
begin
  Result := RxObject.blockTableId(0, RxObject);
end;

function TDAcDbDataBase.layerTableId: TAcDbObjectId;
begin
  Result := RxObject.layerTableId(0, RxObject);
end;

function TDAcDbDataBase.textStyleTableId: TAcDbObjectId;
begin
  Result := RxObject.textStyleTableId(0, RxObject);
end;

function TDAcDbDataBase.linetypeTableId: TAcDbObjectId;
begin
  Result := RxObject.linetypeTableId(0, RxObject);
end;

function TDAcDbDataBase.viewTableId: TAcDbObjectId;
begin
  Result := RxObject.viewTableId(0, RxObject);
end;

function TDAcDbDataBase.UCSTableId: TAcDbObjectId;
begin
  Result := RxObject.UCSTableId(0, RxObject);
end;

function TDAcDbDataBase.viewportTableId: TAcDbObjectId;
begin
  Result := RxObject.viewportTableId(0, RxObject);
end;

function TDAcDbDataBase.regAppTableId: TAcDbObjectId;
begin
  Result := RxObject.regAppTableId(0, RxObject);
end;

function TDAcDbDataBase.dimStyleTableId: TAcDbObjectId;
begin
  Result := RxObject.dimStyleTableId(0, RxObject);
end;

function TDAcDbDataBase.mLStyleDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.mLStyleDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.groupDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.groupDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.layoutDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.layoutDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.plotStyleNameDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.plotStyleNameDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.namedObjectsDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.namedObjectsDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.plotSettingsDictionaryId: TAcDbObjectId;
begin
  Result := RxObject.plotSettingsDictionaryId(0, RxObject);
end;

function TDAcDbDataBase.layerZero: TAcDbObjectId;
begin
  Result := RxObject.layerZero(0, RxObject);
end;

function TDAcDbDataBase.continuousLinetype: TAcDbObjectId;
begin
  Result := RxObject.continuousLinetype(0, RxObject);
end;

function TDAcDbDataBase.byLayerLinetype: TAcDbObjectId;
begin
  Result := RxObject.byLayerLinetype(0, RxObject);
end;

function TDAcDbDataBase.byBlockLinetype: TAcDbObjectId;
begin
  Result := RxObject.byBlockLinetype(0, RxObject);
end;

function TDAcDbDataBase.paperSpaceVportId: TAcDbObjectId;
begin
  Result := RxObject.paperSpaceVportId(0, RxObject);
end;

function TDAcDbDataBase.currentSpaceId: TAcDbObjectId;
begin
  Result := RxObject.currentSpaceId(0, RxObject);
end;

function TDAcDbDataBase.purge(var ids: TposAcDbObjectIdArray): TAcad_ErrorStatus;
begin
  Result := RxObject.purge(0, RxObject, ids);
end;

function TDAcDbDataBase.countHardReferences(const ids: TposAcDbObjectIdArray; pCount: TAdesk_UInt32): TAcad_ErrorStatus;
begin
  Result := RxObject.countHardReferences(0, RxObject, pCount, ids);
end;

function TDAcDbDataBase.getAcDbObjectId(retId: TAcDbObjectId; createIfNotFound: LongBool; const objHandle: TposAcDbHandle; xRefId: TAdesk_UInt32 = 0): TAcad_ErrorStatus;
begin
  Result := RxObject.getAcDbObjectId(0, RxObject, xRefId, objHandle, createIfNotFound, retId);
end;

function TDAcDbDataBase.classDxfName(const pClass: TAcRxClass): AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.classDxfName(0, RxObject, pClass);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbDataBase.readDwgFile(const fileName: AnsiString; shmode: Integer = SH_DENYWR; bAllowCPConversion: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.readDwgFile(0, RxObject, bAllowCPConversion, shmode, extern_darxStrPChar(fileName));
end;

function TDAcDbDataBase.saveAs(const fileName: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.saveAs(0, RxObject, extern_darxStrPChar(fileName));
end;

function TDAcDbDataBase.saveAs(pOutputFiler: TposAcDbDwgFiler): TAcad_ErrorStatus;
begin
  Result := RxObject.saveAsf(0, RxObject, pOutputFiler);
end;

function TDAcDbDataBase.save: TAcad_ErrorStatus;
begin
  Result := RxObject.save(0, RxObject);
end;

function TDAcDbDataBase.dxfIn(const dxfFilename: AnsiString; const logFilename: AnsiString = ''): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfIn(0, RxObject, extern_darxStrPChar(logFilename), extern_darxStrPChar(dxfFilename));
end;

function TDAcDbDataBase.dxfOut(const dxfFilename: AnsiString; const precision: Integer = 16; const saveThumbnailImage: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.dxfOut(0, RxObject, saveThumbnailImage, precision, extern_darxStrPChar(dxfFilename));
end;

function TDAcDbDataBase.closeInput: TAcad_ErrorStatus;
begin
  Result := RxObject.closeInput(0, RxObject);
end;

function TDAcDbDataBase.approxNumObjects: Integer;
begin
  Result := RxObject.approxNumObjects(0, RxObject);
end;

function TDAcDbDataBase.numberOfSaves: TAdesk_Int32;
begin
  Result := RxObject.numberOfSaves(0, RxObject);
end;

function TDAcDbDataBase.originalFileName: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := RxObject.originalFileName(0, RxObject);
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

function TDAcDbDataBase.lastSavedAsVersion: TAcDb_AcDbDwgVersion;
begin
  Result := RxObject.lastSavedAsVersion(0, RxObject);
end;

function TDAcDbDataBase.originalFileVersion: TAcDb_AcDbDwgVersion;
begin
  Result := RxObject.originalFileVersion(0, RxObject);
end;

function TDAcDbDataBase.originalFileSavedByVersion: TAcDb_AcDbDwgVersion;
begin
  Result := RxObject.originalFileSavedByVersion(0, RxObject);
end;

function TDAcDbDataBase.lastSavedAsMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
begin
  Result := RxObject.lastSavedAsMaintenanceVersion(0, RxObject);
end;

function TDAcDbDataBase.originalFileMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
begin
  Result := RxObject.originalFileMaintenanceVersion(0, RxObject);
end;

function TDAcDbDataBase.originalFileSavedByMaintenanceVersion: TAcDb_MaintenanceReleaseVersion;
begin
  Result := RxObject.originalFileSavedByMaintenanceVersion(0, RxObject);
end;

function TDAcDbDataBase.inputFiler: TposAcDbDwgFiler;
begin
  Result := RxObject.inputFiler(0, RxObject);
end;

class function TDAcDbDataBase.open(var pNewDb: TAcDbDatabase; pInputFiler: TposAcDbDwgFiler; enableUndo: LongBool = False; noDocument: LongBool = False): TAcad_ErrorStatus;
begin
  Result := TAcDbDataBase.open(pNewDb, pInputFiler, enableUndo, noDocument);
end;

class function TDAcDbDataBase.salvage(var pNewDb: TAcDbDatabase; pInputFiler: TposAcDbDwgFiler; noDocument: LongBool = False): TAcad_ErrorStatus;
begin
  Result := TAcDbDataBase.salvage(pNewDb, pInputFiler, noDocument);
end;

function TDAcDbDataBase.wblock(var pOutputDb: TAcDbDatabase; const outObjIds: TposAcDbObjectIdArray; const basePoint: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.wblock(0, RxObject, basePoint, outObjIds, pOutputDb);
end;

function TDAcDbDataBase.wblock(var pOutputDb: TAcDbDatabase; blockId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.wblock(0, RxObject, blockId, pOutputDb);
end;

function TDAcDbDataBase.wblock(var pOutputDb: TAcDbDatabase): TAcad_ErrorStatus;
begin
  Result := RxObject.wblock(0, RxObject, pOutputDb);
end;

procedure TDAcDbDataBase.forceWblockDatabaseCopy;
begin
  RxObject.forceWblockDatabaseCopy(0, RxObject);
end;

function TDAcDbDataBase.insert(var blockId: TAcDbObjectId; const pBlockName: AnsiString; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus;
begin
  Result := RxObject.insert(0, RxObject, preserveSourceDatabase, pDb, extern_darxStrPChar(pBlockName), blockId);
end;

function TDAcDbDataBase.insert(const xform: TposAcGeMatrix3d; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus;
begin
  Result := RxObject.insert(0, RxObject, preserveSourceDatabase, pDb, xform);
end;

function TDAcDbDataBase.insert(var blockId: TAcDbObjectId; const pSourceBlockName: AnsiString; const pDestinationBlockName: AnsiString; pDb: TAcDbDatabase; preserveSourceDatabase: LongBool = True): TAcad_ErrorStatus;
begin
  Result := RxObject.insert(0, RxObject, preserveSourceDatabase, pDb, extern_darxStrPChar(pDestinationBlockName), extern_darxStrPChar(pSourceBlockName), blockId);
end;

function TDAcDbDataBase.deepCloneObjects(var objectIds: TposAcDbObjectIdArray; var owner: TAcDbObjectId; var idMap: TAcDbIdMapping; deferXlation: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.deepCloneObjects(0, RxObject, deferXlation, idMap, owner, objectIds);
end;

function TDAcDbDataBase.wblockCloneObjects(var objectIds: TposAcDbObjectIdArray; var owner: TAcDbObjectId; var idMap: TAcDbIdMapping; drc: TAcDb_DuplicateRecordCloning; deferXlation: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.wblockCloneObjects(0, RxObject, deferXlation, Integer(drc), idMap, owner, objectIds);
end;

procedure TDAcDbDataBase.abortDeepClone(var idMap: TAcDbIdMapping);
begin
  RxObject.abortDeepClone(0, RxObject, idMap);
end;

procedure TDAcDbDataBase.addReactor(pReactor: TposAcDbDatabaseReactor);
begin
  RxObject.addReactor(0, RxObject, pReactor);
end;

procedure TDAcDbDataBase.removeReactor(pReactor: TposAcDbDatabaseReactor);
begin
  RxObject.removeReactor(0, RxObject, pReactor);
end;

function TDAcDbDataBase.audit(pInfo: TposAcDbAuditInfo): TAcad_ErrorStatus;
begin
  Result := RxObject.audit(0, RxObject, pInfo);
end;

function TDAcDbDataBase.auditXData(pInfo: TposAcDbAuditInfo): TAcad_ErrorStatus;
begin
  Result := RxObject.auditXData(0, RxObject, pInfo);
end;

function TDAcDbDataBase.undoController: TposAcDbUndoController;
begin
  Result := RxObject.undoController(0, RxObject);
end;

procedure TDAcDbDataBase.disableUndoRecording(disable: LongBool);
begin
  RxObject.disableUndoRecording(0, RxObject, disable);
end;

function TDAcDbDataBase.undoRecording: LOngBool;
begin
  Result := RxObject.undoRecording(0, RxObject);
end;

function TDAcDbDataBase.transactionManager: TposAcDbTransactionManager;
begin
  Result := RxObject.transactionManager(0, RxObject);
end;

function TDAcDbDataBase.maintenanceReleaseVersion: TAdesk_UInt8;
begin
  Result := RxObject.maintenanceReleaseVersion(0, RxObject);
end;

function TDAcDbDataBase.restoreOriginalXrefSymbols: TAcad_ErrorStatus;
begin
  Result := RxObject.restoreOriginalXrefSymbols(0, RxObject);
end;

function TDAcDbDataBase.restoreForwardingXrefSymbols: TAcad_ErrorStatus;
begin
  Result := RxObject.restoreForwardingXrefSymbols(0, RxObject);
end;

function TDAcDbDataBase.xrefBlockId: TAcDbObjectId;
begin
  Result := RxObject.xrefBlockId(0, RxObject);
end;

function TDAcDbDataBase.thumbnailBitmap: Pointer;
begin
  Result := RxObject.thumbnailBitmap(0, RxObject);
end;

function TDAcDbDataBase.setThumbnailBitmap(pBmp: Pointer): TAcad_ErrorStatus;
begin
  Result := RxObject.setThumbnailBitmap(0, RxObject, pBmp);
end;

function TDAcDbDataBase.retainOriginalThumbnailBitmap: LongBool;
begin
  Result := RxObject.retainOriginalThumbnailBitmap(0, RxObject);
end;

procedure TDAcDbDataBase.setRetainOriginalThumbnailBitmap(retain: LongBool);
begin
  RxObject.setRetainOriginalThumbnailBitmap(0, RxObject, retain);
end;

function TDAcDbDataBase.dimaso: LongBool;
begin
  Result := RxObject.dimaso(0, RxObject);
end;

function TDAcDbDataBase.setDimaso(aso: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimaso(0, RxObject, aso);
end;

function TDAcDbDataBase.dimsho: LongBool;
begin
  Result := RxObject.dimsho(0, RxObject);
end;

function TDAcDbDataBase.setDimsho(aso: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimsho(0, RxObject, aso);
end;

function TDAcDbDataBase.plinegen: LongBool;
begin
  Result := RxObject.plinegen(0, RxObject);
end;

function TDAcDbDataBase.setPlinegen(gen: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlinegen(0, RxObject, gen);
end;

function TDAcDbDataBase.orthomode: LongBool;
begin
  Result := RxObject.orthomode(0, RxObject);
end;

function TDAcDbDataBase.setOrthomode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setOrthomode(0, RxObject, mode);
end;

function TDAcDbDataBase.regenmode: LongBool;
begin
  Result := RxObject.regenmode(0, RxObject);
end;

function TDAcDbDataBase.setRegenmode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setRegenmode(0, RxObject, mode);
end;

function TDAcDbDataBase.fillmode: LongBool;
begin
  Result := RxObject.fillmode(0, RxObject);
end;

function TDAcDbDataBase.setFillmode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setFillmode(0, RxObject, mode);
end;

function TDAcDbDataBase.qtextmode: LongBool;
begin
  Result := RxObject.qtextmode(0, RxObject);
end;

function TDAcDbDataBase.setQtextmode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setQtextmode(0, RxObject, mode);
end;

function TDAcDbDataBase.psltscale: LongBool;
begin
  Result := RxObject.psltscale(0, RxObject);
end;

function TDAcDbDataBase.setPsltscale(scale: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setPsltscale(0, RxObject, scale);
end;

function TDAcDbDataBase.limcheck: LongBool;
begin
  Result := RxObject.limcheck(0, RxObject);
end;

function TDAcDbDataBase.setLimcheck(check: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setLimcheck(0, RxObject, check);
end;

function TDAcDbDataBase.blipmode: LongBool;
begin
  Result := RxObject.blipmode(0, RxObject);
end;

function TDAcDbDataBase.setBlipmode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setBlipmode(0, RxObject, mode);
end;

function TDAcDbDataBase.saveproxygraphics:TAdesk_Int16;
begin
  Result := RxObject.saveproxygraphics(0, RxObject);
end;

function TDAcDbDataBase.setSaveproxygraphics(saveimg: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSaveproxygraphics(0, RxObject, saveimg);
end;

function TDAcDbDataBase.delUsedObj: LongBool;
begin
  Result := RxObject.delUsedObj(0, RxObject);
end;

function TDAcDbDataBase.setDelUsedObj(deleteObj: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setDelUsedObj(0, RxObject, deleteObj);
end;

function TDAcDbDataBase.dispSilh: LongBool;
begin
  Result := RxObject.dispSilh(0, RxObject);
end;

function TDAcDbDataBase.setDispSilh(silh: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setDispSilh(0, RxObject, silh);
end;

function TDAcDbDataBase.plineEllipse: LongBool;
begin
  Result := RxObject.plineEllipse(0, RxObject);
end;

function TDAcDbDataBase.setPlineEllipse(pline: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlineEllipse(0, RxObject, pline);
end;

function TDAcDbDataBase.usrtimer: LongBool;
begin
  Result := RxObject.usrtimer(0, RxObject);
end;

function TDAcDbDataBase.setUsrtimer(timer: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setUsrtimer(0, RxObject, timer);
end;

function TDAcDbDataBase.skpoly: LongBool;
begin
  Result := RxObject.skpoly(0, RxObject);
end;

function TDAcDbDataBase.setSkpoly(asPoly: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setSkpoly(0, RxObject, asPoly);
end;

function TDAcDbDataBase.angdir: LongBool;
begin
  Result := RxObject.angdir(0, RxObject);
end;

function TDAcDbDataBase.setAngdir(dir: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setAngdir(0, RxObject, dir);
end;

function TDAcDbDataBase.splframe: LongBool;
begin
  Result := RxObject.splframe(0, RxObject);
end;

function TDAcDbDataBase.setSplframe(disp: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setSplframe(0, RxObject, disp);
end;

function TDAcDbDataBase.attreq: LongBool;
begin
  Result := RxObject.attreq(0, RxObject);
end;

function TDAcDbDataBase.setAttreq(req: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setAttreq(0, RxObject, req);
end;

function TDAcDbDataBase.attdia: LongBool;
begin
  Result := RxObject.attdia(0, RxObject);
end;

function TDAcDbDataBase.setAttdia(dia: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setAttdia(0, RxObject, dia);
end;

function TDAcDbDataBase.mirrtext: LongBool;
begin
  Result := RxObject.mirrtext(0, RxObject);
end;

function TDAcDbDataBase.setMirrtext(mirror: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setMirrtext(0, RxObject, mirror);
end;

function TDAcDbDataBase.worldview: LongBool;
begin
  Result := RxObject.worldview(0, RxObject);
end;

function TDAcDbDataBase.setWorldview(view: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setWorldview(0, RxObject, view);
end;

function TDAcDbDataBase.tilemode: LongBool;
begin
  Result := RxObject.tilemode(0, RxObject);
end;

function TDAcDbDataBase.setTilemode(mode: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setTilemode(0, RxObject, mode);
end;

function TDAcDbDataBase.plimcheck: LongBool;
begin
  Result := RxObject.plimcheck(0, RxObject);
end;

function TDAcDbDataBase.setPlimcheck(check: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlimcheck(0, RxObject, check);
end;

function TDAcDbDataBase.visretain: LongBool;
begin
  Result := RxObject.visretain(0, RxObject);
end;

function TDAcDbDataBase.setVisretain(retain: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setVisretain(0, RxObject, retain);
end;

function TDAcDbDataBase.dragmode:TAdesk_Int16;
begin
  Result := RxObject.dragmode(0, RxObject);
end;

function TDAcDbDataBase.setDragmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setDragmode(0, RxObject, mode);
end;

function TDAcDbDataBase.treedepth:TAdesk_Int16;
begin
  Result := RxObject.treedepth(0, RxObject);
end;

function TDAcDbDataBase.setTreedepth(depth: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setTreedepth(0, RxObject, depth);
end;

function TDAcDbDataBase.lunits:TAdesk_Int16;
begin
  Result := RxObject.lunits(0, RxObject);
end;

function TDAcDbDataBase.setLunits(lunits: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setLunits(0, RxObject, lunits);
end;

function TDAcDbDataBase.luprec:TAdesk_Int16;
begin
  Result := RxObject.luprec(0, RxObject);
end;

function TDAcDbDataBase.setLuprec(prec: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setLuprec(0, RxObject, prec);
end;

function TDAcDbDataBase.aunits: TAdesk_Int16;
begin
  Result := RxObject.aunits(0, RxObject);
end;

function TDAcDbDataBase.setAunits(aunits: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setAunits(0, RxObject, aunits);
end;

function TDAcDbDataBase.auprec: TAdesk_Int16;
begin
  Result := RxObject.auprec(0, RxObject);
end;

function TDAcDbDataBase.setAuprec(auprec: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setAuprec(0, RxObject, auprec);
end;

function TDAcDbDataBase.osmode: TAdesk_Int16;
begin
  Result := RxObject.osmode(0, RxObject);
end;

function TDAcDbDataBase.setOsmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setOsmode(0, RxObject, mode);
end;

function TDAcDbDataBase.attmode: TAdesk_Int16;
begin
  Result := RxObject.attmode(0, RxObject);
end;

function TDAcDbDataBase.setAttmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setAttmode(0, RxObject, mode);
end;

function TDAcDbDataBase.coords: TAdesk_Int16;
begin
  Result := RxObject.coords(0, RxObject);
end;

function TDAcDbDataBase.setCoords(coords: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setCoords(0, RxObject, coords);
end;

function TDAcDbDataBase.pdmode: TAdesk_Int16;
begin
  Result := RxObject.pdmode(0, RxObject);
end;

function TDAcDbDataBase.setPdmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setPdmode(0, RxObject, mode);
end;

function TDAcDbDataBase.pickstyle: TAdesk_Int16;
begin
  Result := RxObject.pickstyle(0, RxObject);
end;

function TDAcDbDataBase.setPickstyle(style: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setPickstyle(0, RxObject, style);
end;

function TDAcDbDataBase.useri1: TAdesk_Int16;
begin
  Result := RxObject.useri1(0, RxObject);
end;

function TDAcDbDataBase.setUseri1(val: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUseri1(0, RxObject, val);
end;

function TDAcDbDataBase.useri2: TAdesk_Int16;
begin
  Result := RxObject.useri2(0, RxObject);
end;

function TDAcDbDataBase.setUseri2(val: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUseri2(0, RxObject, val);
end;

function TDAcDbDataBase.useri3: TAdesk_Int16;
begin
  Result := RxObject.useri3(0, RxObject);
end;

function TDAcDbDataBase.setUseri3(val: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUseri3(0, RxObject, val);
end;

function TDAcDbDataBase.useri4: TAdesk_Int16;
begin
  Result := RxObject.useri4(0, RxObject);
end;

function TDAcDbDataBase.setUseri4(val: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUseri4(0, RxObject, val);
end;

function TDAcDbDataBase.useri5:TAdesk_Int16;
begin
  Result := RxObject.useri5(0, RxObject);
end;

function TDAcDbDataBase.setUseri5(val: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUseri5(0, RxObject, val);
end;

function TDAcDbDataBase.splinesegs:TAdesk_Int16;
begin
  Result := RxObject.splinesegs(0, RxObject);
end;

function TDAcDbDataBase.setSplinesegs(segs: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSplinesegs(0, RxObject, segs);
end;

function TDAcDbDataBase.surfu: TAdesk_Int16;
begin
  Result := RxObject.surfu(0, RxObject);
end;

function TDAcDbDataBase.setSurfu(u: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSurfu(0, RxObject, u);
end;

function TDAcDbDataBase.surfv: TAdesk_Int16;
begin
  Result := RxObject.surfv(0, RxObject);
end;

function TDAcDbDataBase.setSurfv(v: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSurfv(0, RxObject, v);
end;

function TDAcDbDataBase.surftype: TAdesk_Int16;
begin
  Result := RxObject.surftype(0, RxObject);
end;

function TDAcDbDataBase.setSurftype(atype: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSurftype(0, RxObject, atype);
end;

function TDAcDbDataBase.surftab1: TAdesk_Int16;
begin
  Result := RxObject.surftab1(0, RxObject);
end;

function TDAcDbDataBase.setSurftab1(tab1: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSurftab1(0, RxObject, tab1);
end;

function TDAcDbDataBase.surftab2: TAdesk_Int16;
begin
  Result := RxObject.surftab2(0, RxObject);
end;

function TDAcDbDataBase.setSurftab2(tab2: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSurftab2(0, RxObject, tab2);
end;

function TDAcDbDataBase.splinetype: TAdesk_Int16;
begin
  Result := RxObject.splinetype(0, RxObject);
end;

function TDAcDbDataBase.setSplinetype(atype: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setSplinetype(0, RxObject, atype);
end;

function TDAcDbDataBase.shadedge: TAdesk_Int16;
begin
  Result := RxObject.shadedge(0, RxObject);
end;

function TDAcDbDataBase.setShadedge(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setShadedge(0, RxObject, mode);
end;

function TDAcDbDataBase.shadedif: TAdesk_Int16;
begin
  Result := RxObject.shadedif(0, RxObject);
end;

function TDAcDbDataBase.setShadedif(def: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setShadedif(0, RxObject, def);
end;

function TDAcDbDataBase.measurement: TAcDb_MeasurementValue;
begin
  Result := RxObject.measurement(0, RxObject);
end;

function TDAcDbDataBase.setMeasurement(atype: TAcDb_MeasurementValue): TAcad_ErrorStatus;
begin
  Result := RxObject.setMeasurement(0, RxObject, atype);
end;

function TDAcDbDataBase.unitmode: TAdesk_Int16;
begin
  Result := RxObject.unitmode(0, RxObject);
end;

function TDAcDbDataBase.setUnitmode(mode: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setUnitmode(0, RxObject, mode);
end;

function TDAcDbDataBase.maxactvp: TAdesk_Int16;
begin
  Result := RxObject.maxactvp(0, RxObject);
end;

function TDAcDbDataBase.setMaxactvp(max: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setMaxactvp(0, RxObject, max);
end;

function TDAcDbDataBase.isolines: TAdesk_Int16;
begin
  Result := RxObject.isolines(0, RxObject);
end;

function TDAcDbDataBase.setIsolines(isolines: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setIsolines(0, RxObject, isolines);
end;

function TDAcDbDataBase.ltscale: Double;
begin
  Result := RxObject.ltscale(0, RxObject);
end;

function TDAcDbDataBase.setLtscale(scale: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setLtscale(0, RxObject, scale);
end;

function TDAcDbDataBase.textsize: Double;
begin
  Result := RxObject.textsize(0, RxObject);
end;

function TDAcDbDataBase.setTextsize(size: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setTextsize(0, RxObject, size);
end;

function TDAcDbDataBase.tracewid: Double;
begin
  Result := RxObject.tracewid(0, RxObject);
end;

function TDAcDbDataBase.setTracewid(width: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setTracewid(0, RxObject, width);
end;

function TDAcDbDataBase.sketchinc: Double;
begin
  Result := RxObject.sketchinc(0, RxObject);
end;

function TDAcDbDataBase.setSketchinc(inc: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setSketchinc(0, RxObject, inc);
end;

function TDAcDbDataBase.filletrad: Double;
begin
  Result := RxObject.filletrad(0, RxObject);
end;

function TDAcDbDataBase.setFilletrad(radius: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setFilletrad(0, RxObject, radius);
end;

function TDAcDbDataBase.thickness: Double;
begin
  Result := RxObject.thickness(0, RxObject);
end;

function TDAcDbDataBase.setThickness(thickness: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setThickness(0, RxObject, thickness);
end;

function TDAcDbDataBase.celweight: TAcDb_LineWeight;
begin
  Result := RxObject.celweight(0, RxObject);
end;

function TDAcDbDataBase.setCelweight(weight: TAcDb_LineWeight): TAcad_ErrorStatus;
begin
  Result := RxObject.setCelweight(0, RxObject, weight);
end;

class function TDAcDbDataBase.isValidLineWeight(weight: Integer): LongBool;
begin
  Result := TAcDbDataBase.isValidLineWeight(weight);
end;

class function TDAcDbDataBase.getNearestLineWeight(weight: Integer): TAcDb_LineWeight;
begin
  Result := TAcDbDataBase.getNearestLineWeight(weight);
end;

function TDAcDbDataBase.endCaps: TAcDb_EndCaps;
begin
  Result := RxObject.endCaps(0, RxObject);
end;

function TDAcDbDataBase.setEndCaps(atype: TAcDb_EndCaps): TAcad_ErrorStatus;
begin
  Result := RxObject.setEndCaps(0, RxObject, atype);
end;

function TDAcDbDataBase.joinStyle: TAcDb_JoinStyle;
begin
  Result := RxObject.joinStyle(0, RxObject);
end;

function TDAcDbDataBase.setJoinStyle(style: TAcDb_JoinStyle): TAcad_ErrorStatus;
begin
  Result := RxObject.setJoinStyle(0, RxObject, style);
end;

function TDAcDbDataBase.lineWeightDisplay: LongBool;
begin
  Result := RxObject.lineWeightDisplay(0, RxObject);
end;

function TDAcDbDataBase.setLineWeightDisplay(display: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setLineWeightDisplay(0, RxObject, display);
end;

function TDAcDbDataBase.xrefEditEnabled: LongBool;
begin
  Result := RxObject.xrefEditEnabled(0, RxObject);
end;

function TDAcDbDataBase.setXrefEditEnabled(enable: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setXrefEditEnabled(0, RxObject, enable);
end;

function TDAcDbDataBase.oleStartUp: LongBool;
begin
  Result := RxObject.oleStartUp(0, RxObject);
end;

function TDAcDbDataBase.setOleStartUp(val: LongBool): TAcad_ErrorStatus;
begin
  Result := RxObject.setOleStartUp(0, RxObject, val);
end;

function TDAcDbDataBase.angbase: Double;
begin
  Result := RxObject.angbase(0, RxObject);
end;

function TDAcDbDataBase.setAngbase(angle: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setAngbase(0, RxObject, angle);
end;

function TDAcDbDataBase.pdsize: Double;
begin
  Result := RxObject.pdsize(0, RxObject);
end;

function TDAcDbDataBase.setPdsize(size: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setPdsize(0, RxObject, size);
end;

function TDAcDbDataBase.plinewid: Double;
begin
  Result := RxObject.plinewid(0, RxObject);
end;

function TDAcDbDataBase.setPlinewid(width: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlinewid(0, RxObject, width);
end;

function TDAcDbDataBase.userr1: Double;
begin
  Result := RxObject.userr1(0, RxObject);
end;

function TDAcDbDataBase.setUserr1(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setUserr1(0, RxObject, val);
end;

function TDAcDbDataBase.userr2: Double;
begin
  Result := RxObject.userr2(0, RxObject);
end;

function TDAcDbDataBase.setUserr2(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setUserr2(0, RxObject, val);
end;

function TDAcDbDataBase.userr3: Double;
begin
  Result := RxObject.userr3(0, RxObject);
end;

function TDAcDbDataBase.setUserr3(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setUserr3(0, RxObject, val);
end;

function TDAcDbDataBase.userr4: Double;
begin
  Result := RxObject.userr4(0, RxObject);
end;

function TDAcDbDataBase.setUserr4(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setUserr4(0, RxObject, val);
end;

function TDAcDbDataBase.userr5: Double;
begin
  Result := RxObject.userr5(0, RxObject);
end;

function TDAcDbDataBase.setUserr5(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setUserr5(0, RxObject, val);
end;

function TDAcDbDataBase.chamfera: Double;
begin
  Result := RxObject.chamfera(0, RxObject);
end;

function TDAcDbDataBase.setChamfera(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setChamfera(0, RxObject, val);
end;

function TDAcDbDataBase.chamferb: Double;
begin
  Result := RxObject.chamferb(0, RxObject);
end;

function TDAcDbDataBase.setChamferb(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setChamferb(0, RxObject, val);
end;

function TDAcDbDataBase.chamferc: Double;
begin
  Result := RxObject.chamferc(0, RxObject);
end;

function TDAcDbDataBase.setChamferc(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setChamferc(0, RxObject, val);
end;

function TDAcDbDataBase.chamferd: Double;
begin
  Result := RxObject.chamferd(0, RxObject);
end;

function TDAcDbDataBase.setChamferd(val: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setChamferd(0, RxObject, val);
end;

function TDAcDbDataBase.facetres: Double;
begin
  Result := RxObject.facetres(0, RxObject);
end;

function TDAcDbDataBase.setFacetres(facetres: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setFacetres(0, RxObject, facetres);
end;

function TDAcDbDataBase.getMenu(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getMenu(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.tdcreate: TposAcDbDate;
begin
  Result := RxObject.tdcreate(0, RxObject);
end;

function TDAcDbDataBase.tdupdate: TposAcDbDate;
begin
  Result := RxObject.tdupdate(0, RxObject);
end;

function TDAcDbDataBase.tducreate: TposAcDbDate;
begin
  Result := RxObject.tducreate(0, RxObject);
end;

function TDAcDbDataBase.tduupdate: TposAcDbDate;
begin
  Result := RxObject.tduupdate(0, RxObject);
end;

function TDAcDbDataBase.tdindwg: TposAcDbDate;
begin
  Result := RxObject.tdindwg(0, RxObject);
end;

function TDAcDbDataBase.tdusrtimer: TposAcDbDate;
begin
  Result := RxObject.tdusrtimer(0, RxObject);
end;

function TDAcDbDataBase.cecolor: TposAcCmColor;
begin
  Result := RxObject.cecolor(0, RxObject);
end;

function TDAcDbDataBase.setCecolor(color: TposAcCmColor): TAcad_ErrorStatus;
begin
  Result := RxObject.setCecolor(0, RxObject, color);
end;

function TDAcDbDataBase.handseed: TposAcDbHandle;
begin
  Result := RxObject.handseed(0, RxObject);
end;

function TDAcDbDataBase.setHandseed(handle: TposAcDbHandle): TAcad_ErrorStatus;
begin
  Result := RxObject.setHandseed(0, RxObject, handle);
end;

function TDAcDbDataBase.clayer: TAcDbObjectId;
begin
  Result := RxObject.clayer(0, RxObject);
end;

function TDAcDbDataBase.setClayer(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setClayer(0, RxObject, objId);
end;

function TDAcDbDataBase.getCePlotStyleNameId(var id: TAcDbObjectId): TAcDb_PlotStyleNameType;
begin
  Result := RxObject.getCePlotStyleNameId(0, RxObject, id);
end;

function TDAcDbDataBase.setCePlotStyleName(NameType: TAcDb_PlotStyleNameType; newId: TAcDbObjectId = nil): TAcad_ErrorStatus;
begin
  Result := RxObject.setCePlotStyleName(0, RxObject, newId, NameType);
end;

function TDAcDbDataBase.textstyle: TAcDbObjectId;
begin
  Result := RxObject.textstyle(0, RxObject);
end;

function TDAcDbDataBase.setTextstyle(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setTextstyle(0, RxObject, objId);
end;

function TDAcDbDataBase.celtype: TAcDbObjectId;
begin
  Result := RxObject.celtype(0, RxObject);
end;

function TDAcDbDataBase.setCeltype(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setCeltype(0, RxObject, objId);
end;

function TDAcDbDataBase.dimstyle: TAcDbObjectId;
begin
  Result := RxObject.dimstyle(0, RxObject);
end;

function TDAcDbDataBase.setDimstyle(styleId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimstyle(0, RxObject, styleId);
end;

function TDAcDbDataBase.getDimstyleData(var pRec: TposAcDbDimStyleTableRecord): TAcad_ErrorStatus;
begin
  Result := RxObject.getDimstyleData(0, RxObject, pRec);
end;

function TDAcDbDataBase.getDimstyleChildData(pDimClass: TAcRxClass; var pRec: TposAcDbDimStyleTableRecord; var style: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.getDimstyleChildData(0, RxObject, style, pRec, pDimClass);
end;

function TDAcDbDataBase.getDimstyleChildId(pDimClass: TAcRxClass; var parentStyle: TAcDbObjectId): TAcDbObjectId;
begin
  Result := RxObject.getDimstyleChildId(0, RxObject, parentStyle, pDimClass);
end;

function TDAcDbDataBase.getDimstyleParentId(var childStyle: TAcDbObjectId): TAcDbObjectId;
begin
  Result := RxObject.getDimstyleParentId(0, RxObject, childStyle);
end;

function TDAcDbDataBase.setDimstyleData(pRec: TposAcDbDimStyleTableRecord): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimstyleData(0, RxObject, pRec);
end;

function TDAcDbDataBase.setDimstyleData(id: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimstyleData(0, RxObject, id);
end;

function TDAcDbDataBase.cmlstyleID: TAcDbObjectId;
begin
  Result := RxObject.cmlstyleID(0, RxObject);
end;

function TDAcDbDataBase.setCmlstyleID(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setCmlstyleID(0, RxObject, objId);
end;

function TDAcDbDataBase.cmljust: TAdesk_Int16;
begin
  Result := RxObject.cmljust(0, RxObject);
end;

function TDAcDbDataBase.setCmljust(just: TAdesk_Int16): TAcad_ErrorStatus;
begin
  Result := RxObject.setCmljust(0, RxObject, just);
end;

function TDAcDbDataBase.cmlscale: Double;
begin
  Result := RxObject.cmlscale(0, RxObject);
end;

function TDAcDbDataBase.setCmlscale(scale: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setCmlscale(0, RxObject, scale);
end;

function TDAcDbDataBase.celtscale: Double;
begin
  Result := RxObject.celtscale(0, RxObject);
end;

function TDAcDbDataBase.setCeltscale(scale: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setCeltscale(0, RxObject, scale);
end;

function TDAcDbDataBase.pinsbase: TposAcGePoint3d;
begin
  Result := RxObject.pinsbase(0, RxObject);
end;

function TDAcDbDataBase.setPinsbase(var base: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setPinsbase(0, RxObject, base);
end;

function TDAcDbDataBase.pextmin: TposAcGePoint3d;
begin
  Result := RxObject.pextmin(0, RxObject);
end;

function TDAcDbDataBase.pextmax: TposAcGePoint3d;
begin
  Result := RxObject.pextmax(0, RxObject);
end;

function TDAcDbDataBase.setPextmin(var min: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setPextmin(0, RxObject, min);
end;

function TDAcDbDataBase.setPextmax(var max: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setPextmax(0, RxObject, max);
end;

function TDAcDbDataBase.plimmin: TposAcGePoint2d;
begin
  Result := RxObject.plimmin(0, RxObject);
end;

function TDAcDbDataBase.setPlimmin(var min: TposAcGePoint2d): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlimmin(0, RxObject, min);
end;

function TDAcDbDataBase.plimmax: TposAcGePoint2d;
begin
  Result := RxObject.plimmax(0, RxObject);
end;

function TDAcDbDataBase.setPlimmax(var max: TposAcGePoint2d): TAcad_ErrorStatus;
begin
  Result := RxObject.setPlimmax(0, RxObject, max);
end;

function TDAcDbDataBase.pelevation: Double;
begin
  Result := RxObject.pelevation(0, RxObject);
end;

function TDAcDbDataBase.setPelevation(elev: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setPelevation(0, RxObject, elev);
end;

function TDAcDbDataBase.pucsorg: TposAcGePoint3d;
begin
  Result := RxObject.pucsorg(0, RxObject);
end;

function TDAcDbDataBase.pucsxdir: TposAcGeVector3d;
begin
  Result := RxObject.pucsxdir(0, RxObject);
end;

function TDAcDbDataBase.pucsydir: TposAcGeVector3d;
begin
  Result := RxObject.pucsydir(0, RxObject);
end;

function TDAcDbDataBase.pucsname: TAcDbObjectId;
begin
  Result := RxObject.pucsname(0, RxObject);
end;

function TDAcDbDataBase.pucsBase: TAcDbObjectId;
begin
  Result := RxObject.pucsBase(0, RxObject);
end;

function TDAcDbDataBase.setPucsBase(ucsid: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setPucsBase(0, RxObject, ucsid);
end;

function TDAcDbDataBase.worldPucsBaseOrigin(orthoView: TAcDb_OrthographicView): TposAcGePoint3d;
begin
  Result := RxObject.worldPucsBaseOrigin(0, RxObject, orthoView);
end;

function TDAcDbDataBase.setWorldPucsBaseOrigin(origin: TposAcGePoint3d; orthoView: TAcDb_OrthographicView): TAcad_ErrorStatus;
begin
  Result := RxObject.setWorldPucsBaseOrigin(0, RxObject, orthoView, origin);
end;

function TDAcDbDataBase.isPucsOrthographic(var orthoView: TAcDb_OrthographicView): LongBool;
begin
  Result := RxObject.isPucsOrthographic(0, RxObject, orthoView);
end;

function TDAcDbDataBase.insbase: TposAcGePoint3d;
begin
  Result := RxObject.insbase(0, RxObject);
end;

function TDAcDbDataBase.setInsbase(base: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setInsbase(0, RxObject, base);
end;

function TDAcDbDataBase.extmin: TposAcGePoint3d;
begin
  Result := RxObject.extmin(0, RxObject);
end;

function TDAcDbDataBase.extmax: TposAcGePoint3d;
begin
  Result := RxObject.extmax(0, RxObject);
end;

function TDAcDbDataBase.updateExt(doBestFit: LongBool = False): TAcad_ErrorStatus;
begin
  Result := RxObject.updateExt(0, RxObject, doBestFit);
end;

function TDAcDbDataBase.setExtmin(min: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setExtmin(0, RxObject, min);
end;

function TDAcDbDataBase.setExtmax(max: TposAcGePoint3d): TAcad_ErrorStatus;
begin
  Result := RxObject.setExtmax(0, RxObject, max);
end;

function TDAcDbDataBase.limmin: TposAcGePoint2d;
begin
  Result := RxObject.limmin(0, RxObject);
end;

function TDAcDbDataBase.setLimmin(min: TposAcGePoint2d): TAcad_ErrorStatus;
begin
  Result := RxObject.setLimmin(0, RxObject, min);
end;

function TDAcDbDataBase.limmax: TposAcGePoint2d;
begin
  Result := RxObject.limmax(0, RxObject);
end;

function TDAcDbDataBase.setLimmax(max: TposAcGePoint2d): TAcad_ErrorStatus;
begin
  Result := RxObject.setLimmax(0, RxObject, max);
end;

function TDAcDbDataBase.elevation: Double;
begin
  Result := RxObject.elevation(0, RxObject);
end;

function TDAcDbDataBase.elevationi: Integer;
begin
  Result := RxObject.elevationi(0, RxObject);
end;

function TDAcDbDataBase.setElevation(elev: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setElevation(0, RxObject, elev);
end;

function TDAcDbDataBase.ucsorg: TposAcGePoint3d;
begin
  Result := RxObject.ucsorg(0, RxObject);
end;

function TDAcDbDataBase.ucsxdir: TposAcGeVector3d;
begin
  Result := RxObject.ucsxdir(0, RxObject);
end;

function TDAcDbDataBase.ucsydir: TposAcGeVector3d;
begin
  Result := RxObject.ucsydir(0, RxObject);
end;

function TDAcDbDataBase.ucsname: TAcDbObjectId;
begin
  Result := RxObject.ucsname(0, RxObject);
end;

function TDAcDbDataBase.ucsBase: TAcDbObjectId;
begin
  Result := RxObject.ucsBase(0, RxObject);
end;

function TDAcDbDataBase.setUcsBase(ucsid: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := RxObject.setUcsBase(0, RxObject, ucsid);
end;

function TDAcDbDataBase.worldUcsBaseOrigin(orthoView: TAcDb_OrthographicView): TposAcGePoint3d;
begin
  Result := RxObject.worldUcsBaseOrigin(0, RxObject, orthoView);
end;

function TDAcDbDataBase.setWorldUcsBaseOrigin(origin: TposAcGePoint3d; orthoView: TAcDb_OrthographicView): TAcad_ErrorStatus;
begin
  Result := RxObject.setWorldUcsBaseOrigin(0, RxObject, orthoView, origin);
end;

function TDAcDbDataBase.isUcsOrthographic(var orthoView: TAcDb_OrthographicView): LongBool;
begin
  Result := RxObject.isUcsOrthographic(0, RxObject, orthoView);
end;

function TDAcDbDataBase.getDimpost(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getDimpost(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.getDimapost(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getDimapost(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.getDimblk(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getDimblk(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.getDimblk1(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getDimblk1(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.getDimblk2(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getDimblk2(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.dimfit: Integer;
begin
  Result := RxObject.dimfit(0, RxObject);
end;

function TDAcDbDataBase.setDimfit(fit: Integer): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimfit(0, RxObject, fit);
end;

function TDAcDbDataBase.setDimunit(aunit: Integer): TAcad_ErrorStatus;
begin
  Result := RxObject.setDimunit(0, RxObject, aunit);
end;

function TDAcDbDataBase.getDimRecentStyleList(var objIds: TposAcDbObjectIdArray): TAcad_ErrorStatus;
begin
  Result := RxObject.getDimRecentStyleList(0, RxObject, objIds);
end;

function TDAcDbDataBase.loadLineTypeFile(ltn: AnsiString; filename: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.loadLineTypeFile(0, RxObject, extern_darxStrPChar(filename), extern_darxStrPChar(ltn));
end;

function TDAcDbDataBase.getProjectName(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getProjectName(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.setProjectName(pOutput: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setProjectName(0, RxObject, extern_darxStrPChar(pOutput));
end;

function TDAcDbDataBase.getHyperlinkBase(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getHyperlinkBase(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.setHyperlinkBase(pOutput: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setHyperlinkBase(0, RxObject, extern_darxStrPChar(pOutput));
end;

function TDAcDbDataBase.getStyleSheet(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getStyleSheet(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.setStyleSheet(pOutput: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setStyleSheet(0, RxObject, extern_darxStrPChar(pOutput));
end;

function TDAcDbDataBase.getFilename(var pOutput: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getFilename(0, RxObject, lpStr);
  if lpStr = nil then pOutput := '' else pOutput := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.isPartiallyOpened: LongBool;
begin
  Result := RxObject.isPartiallyOpened(0, RxObject);
end;

function TDAcDbDataBase.applyPartialOpenFilters(pSpatialFilter: TposAcDbSpatialFilter; pLayerFilter: TposAcDbLayerFilter): TAcad_ErrorStatus;
begin
  Result := RxObject.applyPartialOpenFilters(0, RxObject, pLayerFilter, pSpatialFilter);
end;

procedure TDAcDbDataBase.disablePartialOpen;
begin
  RxObject.disablePartialOpen(0, RxObject);
end;

function TDAcDbDataBase.getFingerprintGuid(var guidString: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getFingerprintGuid(0, RxObject, lpStr);
  if lpStr = nil then guidString := '' else guidString := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.setFingerprintGuid(pNewGuid: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setFingerprintGuid(0, RxObject, extern_darxStrPChar(pNewGuid));
end;

function TDAcDbDataBase.newFingerprintGuid: TAcad_ErrorStatus;
begin
  Result := RxObject.newFingerprintGuid(0, RxObject);
end;

function TDAcDbDataBase.getVersionGuid(var guidString: AnsiString): TAcad_ErrorStatus;
var
  lpStr: PChar;
begin
  lpStr := nil;
  Result := RxObject.getVersionGuid(0, RxObject, lpStr);
  if lpStr = nil then guidString := '' else guidString := extern_darxPString(lpStr);
  extern_darxFreeString(lpStr);
end;

function TDAcDbDataBase.setVersionGuid(pNewGuid: AnsiString): TAcad_ErrorStatus;
begin
  Result := RxObject.setVersionGuid(0, RxObject, extern_darxStrPChar(pNewGuid));
end;

function TDAcDbDataBase.newVersionGuid: TAcad_ErrorStatus;
begin
  Result := RxObject.newVersionGuid(0, RxObject);
end;

function TDAcDbDataBase.tstackalign: Integer;
begin
  Result := RxObject.tstackalign(0, RxObject);
end;

function TDAcDbDataBase.setTStackAlign(val: Integer): TAcad_ErrorStatus;
begin
  Result := RxObject.setTStackAlign(0, RxObject, val);
end;

function TDAcDbDataBase.tstacksize: Integer;
begin
  Result := RxObject.tstacksize(0, RxObject);
end;

function TDAcDbDataBase.setTStackSize(val: Integer): TAcad_ErrorStatus;
begin
  Result := RxObject.setTStackSize(0, RxObject, val);
end;

function TDAcDbDataBase.insunits: TAcDb_UnitsValue;
begin
  Result := RxObject.insunits(0, RxObject);
end;

function TDAcDbDataBase.setInsunits(units: TAcDb_UnitsValue): TAcad_ErrorStatus;
begin
  Result := RxObject.setInsunits(0, RxObject, units);
end;

procedure TDAcDbDataBase.setGsModel(mode: TposAcGsModel);
begin
  RxObject.setGsModel(0, RxObject, mode);
end;

function TDAcDbDataBase.gsModel: TposAcGsModel;
begin
  Result := RxObject.gsModel(0, RxObject);
end;

function TDAcDbDataBase.plotStyleMode: LongBool;
begin
  Result := RxObject.plotStyleMode(0, RxObject);
end;

function TDAcDbDataBase.viewportScaleDefault: Double;
begin
  Result := RxObject.viewportScaleDefault(0, RxObject);
end;

function TDAcDbDataBase.setViewportScaleDefault(newDefaultVPScale: Double): TAcad_ErrorStatus;
begin
  Result := RxObject.setViewportScaleDefault(0, RxObject, newDefaultVPScale);
end;

function TDAcDbDataBase.dwgFileWasSavedByAutodeskSoftware: LongBool;
begin
  Result := RxObject.dwgFileWasSavedByAutodeskSoftware(0, RxObject);
end;

end.
