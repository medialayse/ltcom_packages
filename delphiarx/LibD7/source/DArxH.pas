unit DArxH;

// ******************************************************
//          DelphiARX2002 ObjectARX Declare unit.
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
  Windows, SysUtils, Messages, CommCtrl;

// ***************************************************************************** ObjectARX Cast Classes
// このエリアは、Delphiのユニット循環参照の問題を解決するために、
// 実際の定義クラスとは別に、キャストすることを前提にしたクラス型定義の
// のリストである。
// ここに記述しているクラスが定義された関数、メソッドを使う場合は、元の
// クラスをキャストしなければならない。

type
  TposAcRxObject = type Pointer;
  TposAcDbServices = type Pointer;
  TposAcRxDictionary = type Pointer;
  TposAcApDocument = type Pointer;
  TposAcApDocManager = type Pointer;
  TposAcApProfileManager = type Pointer;
  TposAcTransactionManager = type Pointer;
  TposAcApLongTransactionManager = type Pointer;
  TposAcDbHostApplicationServices = type Pointer;
  TposAcDbDwgFiler = type Pointer;
  TposENTITY = type Pointer;
  TposAcDbGlobals = type Pointer;
  TposAcDbObjectId = type Pointer;
  TposAcDbObject = type Pointer;
  TposAcDbEntity = type Pointer;
  TposAcDbVoidPtrArray =type  Pointer;
  TposAcDbDatabase = type Pointer;
  TposAcGiContext = type Pointer;
  TposAcDbXrefGraph = type Pointer;
  TposAcRxClass = type Pointer;
  TposAcDbIdMapping = type Pointer;
  TposAcGePoint2d = type Pointer;
  TposAcGePoint2dArray = type Pointer;
  TposAcGePoint3d = type Pointer;
  TposAcGeVector3d = type Pointer;
  TposAcGeMatrix2d = type Pointer;
  TposAcGeMatrix3d = type Pointer;
  TposAcDbPolyline = type Pointer;
  TposAcEdCommand = type Pointer;
  TposAcRxGenHand = type Pointer;

  TposAcDbLayoutManager = type Pointer;
  TposAcDbSymbolTable = type Pointer;
  TposAcDbBlockTable = type Pointer;
  TposAcDbLayerTable = type Pointer;
  TposAcDbTextStyleTable = type Pointer;
  TposAcDbLinetypeTable = type Pointer;
  TposAcDbViewTable = type Pointer;
  TposAcDbRegAppTable = type Pointer;
  TposAcDbDimStyleTable = type Pointer;
  TposAcDbDictionary = type Pointer;
  TposAcDbDictionaryWithDefault = type Pointer;
  TposAcDbUCSTable = type Pointer;
  TposAcDbViewportTable = type Pointer;
  TposAcDbObjectIdArray = type Pointer;
  TposAcDbHandle = type Pointer;
  TposAcDbDatabaseReactor = type Pointer;
  TposAcDbAuditInfo = type Pointer;
  TposAcDbUndoController = type Pointer;
  TposAcDbTransactionManager = type Pointer;
  TposAcDbDate = type Pointer;
  TposAcCmColor = type Pointer;
  TposAcDbDimStyleTableRecord = type Pointer;
  TposAcDbLayerFilter = type Pointer;
  TposAcDbSpatialFilter = type Pointer;
  TposAcGsModel = type Pointer;

  TposAcGePlane = type Pointer;
  TposAcDbExtents = type Pointer;
  TposAcDbFullSubentPath = type Pointer;
  TposAcDbIntArray = type Pointer;
  TposAcGePoint3dArray = type Pointer;
  TposAcGiWorldDrawd = type Pointer;

  TposCOleClientItem = type Pointer;
  TposCArchive = type Pointer;

  Tflagmat = type Pointer;

  TClipBoundaryArray = type Pointer;      // class
  TAcadInternalServices = type Pointer; // class

// ***************************************************************************** VisualC++ Standard Type
type
  Tsize_t = Cardinal;   // size_t

  PPChar = ^PChar;
  PLongBool = ^LongBool;
  TLCID = type Longword;    // typedef unsigned long LCID;

  PMCObject = ^TMCObject;
  TMCObject = record
    vfTable: Pointer;
  end;

  PMCCmdTarget = ^TMCCmdTarget;
  TMCCmdTarget = record
    parent: TMCObject;
    m_dwRef: Longint;
    m_pOuterUnknown: Pointer;
    m_xInnerUnknown: DWORD;
    m_xDispatch: Pointer;
    m_bResultExpected: BOOL;
    m_xConnPtContainer: Pointer;
    m_pModuleState: Pointer;
  end;

  PMCWnd = ^TMCWnd;
  TMCWnd = record
    parent: TMCCmdTarget;
    m_hWnd: HWND;
  end;

  PMCView = ^TMCView;
  TMCView = TMCWnd;

  PMCDocument = ^TMCDocument;
  TMCDocument = record
    parent: TMCCmdTarget;
    m_strTitle: PChar;
    m_strPathName: PChar;
    m_pDocTemplate: Pointer;
    m_viewList: Pointer;
    m_bModified: Longbool;
    m_bAutoDelete: Longbool;
    m_bEmbedded: Longbool;
  end;

  PMCFrameWnd = ^TMCFrameWnd;
  TMCFrameWnd = record
    parent: TMCWnd;
    m_bAutoMenuEnable: Longbool;
    m_nWindow: Integer;
    m_hMenuDefault: HMENU;
    m_hAccelTable: HACCEL;
    m_dwPromptContext: DWORD;
    m_bHelpMode: BOOL;
    m_pNextFrameWnd: PMCFrameWnd;
    m_rectBorder: TRECT;
    m_pNotifyHook: Pointer;
    m_listControlBars: Pointer;
    m_nShowDelay: Integer;
  end;

  PMCMDIFrameWnd = ^TMCMDIFrameWnd;
  TMCMDIFrameWnd = record
    parent: TMCFrameWnd;
    m_hWndMDIClient: HWND;
  end;

  PMCWinThread = ^TMCWinThread;
  TMCWinThread = record
    parent: TMCCmdTarget;
    m_pMainWnd: PMCWnd;
    m_pActiveWnd: PMCWnd;
    m_bAutoDelete: BOOL;
    m_hThread: THandle;
    m_nThreadID: DWORD;
    m_nDisablePumpCount: Integer;
    m_msgCur: TMSG;
    m_pThreadParams: Pointer;
    m_pfnThreadProc: Pointer;
    m_pMessageFilter: Pointer;
    m_ptCursorLast: TPOINT;
    m_nMsgLast: UINT;
  end;

  PMCWinApp = ^TMCWinApp;
  TMCWinApp = record
    parent: TMCWinThread;
    m_hInstance: THandle;
    m_hPrevInstance: THandle;
    m_lpCmdLine: LPTSTR;
    m_nCmdShow: Integer;
    m_pszAppName: LPCTSTR;
    m_pszRegistryKey: LPCTSTR;
    m_pDocManager: Pointer;
    m_bHelpMode: BOOL;
    m_pszExeName: LPCTSTR;
    m_pszHelpFilePath: LPCTSTR;
    m_pszProfileName: LPCTSTR;
    m_hDevMode: HGLOBAL;
    m_hDevNames: HGLOBAL;
    m_dwPromptContext: DWORD;
    m_nWaitCursorCount: Integer;
    m_hcurWaitCursorRestore: HCURSOR;
    m_pRecentFileList: Pointer;
    m_pCmdInfo: Pointer;
    m_atomApp: ATOM;
    m_atomSystemTopic: ATOM;
    m_nNumPreviewPages: UINT;
    m_nSafetyPoolSize: Tsize_t;
  end;

const
  // ドッキング位置の指定(ArxRunEx.TDAcDockControlBar)
  AFX_IDW_DOCKBAR_TOP    = $E81B;   // フレーム ウィンドウの上辺にドッキングします。
  AFX_IDW_DOCKBAR_LEFT   = $E81C;   // フレーム ウィンドウの左辺にドッキングします。
  AFX_IDW_DOCKBAR_RIGHT  = $E81D;   // フレーム ウィンドウの右辺にドッキングします。
  AFX_IDW_DOCKBAR_BOTTOM = $E81E;   // フレーム ウィンドウの下辺にドッキングします。
  AFX_IDW_DOCKBAR_FLOAT  = $E81F;

  // ドッキング可能なエリアの指定(ArxRunEx.TArxControlBar)
  CBRS_ALIGN_LEFT     = $1000;
  CBRS_ALIGN_TOP      = $2000;
  CBRS_ALIGN_RIGHT    = $4000;
  CBRS_ALIGN_BOTTOM   = $8000;
  CBRS_ALIGN_ANY      = $F000;

  CBRS_BORDER_LEFT    = $0100;
  CBRS_BORDER_TOP     = $0200;
  CBRS_BORDER_RIGHT   = $0400;
  CBRS_BORDER_BOTTOM  = $0800;
  CBRS_BORDER_ANY     = $0F00;

  CBRS_TOOLTIPS       = $0010;
  CBRS_FLYBY          = $0020;
  CBRS_FLOAT_MULTI    = $0040;
  CBRS_BORDER_3D      = $0080;
  CBRS_HIDE_INPLACE   = $0008;
  CBRS_SIZE_DYNAMIC   = $0004;
  CBRS_SIZE_FIXED     = $0002;
  CBRS_FLOATING       = $0001;

  CBRS_GRIPPER        = $00400000;
  CBRS_ORIENT_HORZ    = CBRS_ALIGN_TOP or CBRS_ALIGN_BOTTOM;    // コントロール バーを水平方向にします。
  CBRS_ORIENT_VERT    = CBRS_ALIGN_LEFT or CBRS_ALIGN_RIGHT;    // コントロール バーを垂直方向にします。
  CBRS_ORIENT_ANY     = CBRS_ORIENT_HORZ or CBRS_ORIENT_VERT;
  CBRS_ALL            = $0040FFFF;
  CBRS_NOALIGN        = $00000000;
  CBRS_LEFT           = CBRS_ALIGN_LEFT or CBRS_BORDER_RIGHT;
  CBRS_TOP            = CBRS_ALIGN_TOP or CBRS_BORDER_BOTTOM;
  CBRS_RIGHT          = CBRS_ALIGN_RIGHT or CBRS_BORDER_LEFT;
  CBRS_BOTTOM         = CBRS_ALIGN_BOTTOM or CBRS_BORDER_TOP;

type
  TControlBarStyle = set of (cbrsAlignLeft, cbrsAlignTop, cbrsAlignRight, cbrsAlignBottom, cbrsAlignAny,
                             cbrsBorderLeft, cbrsBorderTop, cbrsBorderRight, cbrsBorderBottom, cbrsBorderAny,
                             cbrsFloatMulti, cbrsToolTips, cbrsFlyby, cbrsGripper);

  TDockBarSide = (idwDockBarLeft, idwDockBarTop, idwDockBarRight, idwDockBarBottom, idwDockBarFloat);

  TCtrlBarState = (cbsSHOW, cbsHIDE, cbsENABLED, cbsDISABLED, cbsDOCK, cbsFLOAT);

  TAfxControlWndProc = procedure(MsgID: Integer; Message: PMessage) of object;
  TOnAcadKeepFocus = procedure(Sender: TObject; var KeepFocus: Boolean) of object;
  TOnControlChangedEvent = procedure(Sender: TObject; CtrlState: TCtrlBarState) of object;
  TOnCommandEvent = procedure(Sender: TObject; wParam: WPARAM; lParam: LPARAM; var ActiveCmd: Boolean) of object;
  TOnHideControlEvent = procedure(Sender: TObject; var DoHide: Boolean) of object;
  TOnFloatingMinSizeEvent = procedure(Sender: TObject; var MinWidth, MinHeight: Integer) of object;
  TOnAddCustomMenuItemsEvent = procedure(Sender: TObject; hMenu: Cardinal; var DoCancel: Boolean) of object;
  TOnUserSizingEvent = procedure(Sender: TObject; nSide: Cardinal; var SizeRect: TRECT) of object;
  TOnCanFrameworkTakeFocusEvent = procedure(Sender: TObject; var DoFocus: Boolean) of object;
  TOnCalcDynamicLayoutEvent = procedure(Sender: TObject; nLength: Integer; nMode: DWORD; var rSize: TSIZE) of object;
  TOnToolHitTestEvent = procedure(Sender: TObject; mPoint: TPOINT; var TI: TOOLINFO; var resCode: Integer) of object;
  TOnUpdateCmdUIEvent = procedure(Sender: TObject; hTarget: HWND; bDisableIfNoHndler: Boolean) of object;
  TOnBarStyleChangeEvent = procedure(Sender: TObject; dwOldStyle, dwNewStyle: DWORD; var BtnSize: TSIZE) of object;

// ***************************************************************************** DelphiARX Orignal Type

const
  // 予めメモリ確保が必要なリザルトや文字列の最大値
  // The maximum of ResultBuffer and the character string which needs memory securing beforehand
  RESULTLENMAX = 512;

var
// AutoCAD main window handle is maintained.
// AutoCADメインウィンドウハンドルが保持される
  adsw_hwndAcad: HWND = 0;

// AutoCAD document handle is maintained.
// AutoCADドキュメントハンドルが保持される
  adsw_hwndDoc: HWND = 0;     // AutoCADドキュメントハンドル

// ***************************************************************************** AcApLib/ACDOCMAN
type
  // void (*procAddr)(void *)
  PprocAddr = ^TprocAddr;
  TprocAddr = procedure(P: Pointer); cdecl;

  // struct AcAp {
  TAcAp_DocLockMode = Integer;
  TAcApDocument_SaveFormat = Integer;

const
  AC_DOCUMENT_MANAGER_OBJ = 'AcApDocManager';                   // #define AC_DOCUMENT_MANAGER_OBJ "AcApDocManager"

  // enum DocLockMode   {
  AcAp_kNone                                = TAcAp_DocLockMode($00);        // kNone               = 0x00,
  AcAp_kAutoWrite                           = TAcAp_DocLockMode($01);        // kAutoWrite          = 0x01,
  AcAp_kNotLocked                           = TAcAp_DocLockMode($02);        // kNotLocked          = 0x02,
  AcAp_kWrite                               = TAcAp_DocLockMode($04);        // kWrite              = 0x04,
  AcAp_kProtectedAutoWrite                  = TAcAp_DocLockMode($14);        // kProtectedAutoWrite = 0x14,
  AcAp_kRead                                = TAcAp_DocLockMode($20);        // kRead               = 0x20,
  AcAp_kXWrite                              = TAcAp_DocLockMode($40);        // kXWrite             = 0x40};

  // class AcApDocument : public AcRxObject //enum SaveFormat {
  AcApDocument_kUnknown                     = TAcApDocument_SaveFormat(-1);  // kUnknown             = -1,      // Invalid format
  AcApDocument_kR12_dxf                     = TAcApDocument_SaveFormat(1);   // kR12_dxf             = 1,       // AutoCAD R12/LT2 DXF (*.dxf)
  AcApDocument_kR13_dwg                     = TAcApDocument_SaveFormat(4);   // kR13_dwg             = 4,       // AutoCAD R13/LT95 Drawing (*.dwg)
  AcApDocument_kR13_dxf                     = TAcApDocument_SaveFormat(5);   // kR13_dxf             = 5,       // AutoCAD R13/LT95 DXF (*.dxf)
  AcApDocument_kR14_dwg                     = TAcApDocument_SaveFormat(8);   // kR14_dwg             = 8,       // AutoCAD R14/LT97 Drawing (*.dwg)
  AcApDocument_kR14_dxf                     = TAcApDocument_SaveFormat(9);   // kR14_dxf             = 9,       // AutoCAD R14/LT97 DXF (*.dxf)
  AcApDocument_kR15_dwg                     = TAcApDocument_SaveFormat(12);  // kR15_dwg             = 12,      // AutoCAD R15 Drawing (*.dwg)
  AcApDocument_kR15_dxf                     = TAcApDocument_SaveFormat(13);  // kR15_dxf             = 13,      // AutoCAD R15 DXF (*.dxf)
  AcApDocument_kR15_Template                = TAcApDocument_SaveFormat(14);  // kR15_Template        = 14,      // R15 Drawing Template File (*.dwt)
  AcApDocument_kNative                      = TAcApDocument_SaveFormat(12);  // kNative              = kR15_dwg // Current dwg version is R15 };

// ***************************************************************************** AcGiLib/ACGI
// ####################### 未登録！
type
  TTextParams = Integer;
  TFontInfo = Integer;

// ***************************************************************************** ACADSTRC.H
const
  Acad_eInetBase = 20000;   // #define eInetBase       20000

type
  // struct Acad {
  TAcad_ErrorStatus = Integer;
  TAcad_PointHistory = Integer;
  TAcad_PromptStatus = Integer;

const
  // enum ErrorStatus {
  Acad_eOk                                    = TAcad_ErrorStatus(0);        // eOk                      =  0,
  Acad_eNotImplementedYet                     = TAcad_ErrorStatus(1);        // eNotImplementedYet       =  1,
  Acad_eNotApplicable                         = TAcad_ErrorStatus(2);        // eNotApplicable           =  2,
  Acad_eInvalidInput                          = TAcad_ErrorStatus(3);        // eInvalidInput            =  3,
  Acad_eAmbiguousInput                        = TAcad_ErrorStatus(4);        // eAmbiguousInput          =  4,
  Acad_eAmbiguousOutput                       = TAcad_ErrorStatus(5);        // eAmbiguousOutput         =  5,
  Acad_eOutOfMemory                           = TAcad_ErrorStatus(6);        // eOutOfMemory             =  6,
  Acad_eBufferTooSmall                        = TAcad_ErrorStatus(7);        // eBufferTooSmall          =  7,
  Acad_eInvalidOpenState                      = TAcad_ErrorStatus(8);        // eInvalidOpenState        =  8,
  Acad_eEntityInInactiveLayout                = TAcad_ErrorStatus(9);        // eEntityInInactiveLayout  =  9,

  Acad_eHandleExists                          = TAcad_ErrorStatus(10);       // eHandleExists            = 10,
  Acad_eNullHandle                            = TAcad_ErrorStatus(11);       // eNullHandle              = 11,
  Acad_eBrokenHandle                          = TAcad_ErrorStatus(12);       // eBrokenHandle            = 12,
  Acad_eUnknownHandle                         = TAcad_ErrorStatus(13);       // eUnknownHandle           = 13,
  Acad_eHandleInUse                           = TAcad_ErrorStatus(14);       // eHandleInUse             = 14,
  Acad_eNullObjectPointer                     = TAcad_ErrorStatus(15);       // eNullObjectPointer       = 15,
  Acad_eNullObjectId                          = TAcad_ErrorStatus(16);       // eNullObjectId            = 16,
  Acad_eNullBlockName                         = TAcad_ErrorStatus(17);       // eNullBlockName           = 17,
  Acad_eContainerNotEmpty                     = TAcad_ErrorStatus(18);       // eContainerNotEmpty       = 18,

  Acad_eNullEntityPointer                     = TAcad_ErrorStatus(20);       // eNullEntityPointer       = 20,
  Acad_eIllegalEntityType                     = TAcad_ErrorStatus(21);       // eIllegalEntityType       = 21,
  Acad_eKeyNotFound                           = TAcad_ErrorStatus(22);       // eKeyNotFound             = 22,
  Acad_eDuplicateKey                          = TAcad_ErrorStatus(23);       // eDuplicateKey            = 23,
  Acad_eInvalidIndex                          = TAcad_ErrorStatus(24);       // eInvalidIndex            = 24,
  Acad_eDuplicateIndex                        = TAcad_ErrorStatus(25);       // eDuplicateIndex          = 25,
  Acad_eAlreadyInDb                           = TAcad_ErrorStatus(26);       // eAlreadyInDb             = 26,
  Acad_eOutOfDisk                             = TAcad_ErrorStatus(27);       // eOutOfDisk               = 27,
  Acad_eDeletedEntry                          = TAcad_ErrorStatus(28);       // eDeletedEntry            = 28,
  Acad_eNegativeValueNotAllowed               = TAcad_ErrorStatus(29);       // eNegativeValueNotAllowed = 29,
  Acad_eInvalidExtents                        = TAcad_ErrorStatus(30);       // eInvalidExtents          = 30,
  Acad_eInvalidAdsName                        = TAcad_ErrorStatus(31);       // eInvalidAdsName          = 31,
  Acad_eInvalidSymbolTableName                = TAcad_ErrorStatus(32);       // eInvalidSymbolTableName  = 32,
  Acad_eInvalidKey                            = TAcad_ErrorStatus(33);       // eInvalidKey              = 33,
  Acad_eWrongObjectType                       = TAcad_ErrorStatus(34);       // eWrongObjectType         = 34,
  Acad_eWrongDatabase                         = TAcad_ErrorStatus(35);       // eWrongDatabase           = 35,
  Acad_eObjectToBeDeleted                     = TAcad_ErrorStatus(36);       // eObjectToBeDeleted       = 36,
  Acad_eInvalidDwgVersion                     = TAcad_ErrorStatus(37);       // eInvalidDwgVersion       = 37,
  Acad_eAnonymousEntry                        = TAcad_ErrorStatus(38);       // eAnonymousEntry          = 38,
  Acad_eIllegalReplacement                    = TAcad_ErrorStatus(39);       // eIllegalReplacement      = 39,

  Acad_eEndOfObject                           = TAcad_ErrorStatus(40);       // eEndOfObject             = 40,
  Acad_eEndOfFile                             = TAcad_ErrorStatus(41);       // eEndOfFile               = 41,
  Acad_eIsReading                             = TAcad_ErrorStatus(42);       // eIsReading               = 42,
  Acad_eIsWriting                             = TAcad_ErrorStatus(43);       // eIsWriting               = 43,
  Acad_eNotOpenForRead                        = TAcad_ErrorStatus(44);       // eNotOpenForRead          = 44,
  Acad_eNotOpenForWrite                       = TAcad_ErrorStatus(45);       // eNotOpenForWrite         = 45,
  Acad_eNotThatKindOfClass                    = TAcad_ErrorStatus(46);       // eNotThatKindOfClass      = 46,
  Acad_eInvalidBlockName                      = TAcad_ErrorStatus(47);       // eInvalidBlockName        = 47,
  Acad_eMissingDxfField                       = TAcad_ErrorStatus(48);       // eMissingDxfField         = 48,
  Acad_eDuplicateDxfField                     = TAcad_ErrorStatus(49);       // eDuplicateDxfField       = 49,
  Acad_eInvalidDxfCode                        = TAcad_ErrorStatus(50);       // eInvalidDxfCode          = 50,
  Acad_eInvalidResBuf                         = TAcad_ErrorStatus(51);       // eInvalidResBuf           = 51,
  Acad_eBadDxfSequence                        = TAcad_ErrorStatus(52);       // eBadDxfSequence          = 52,
  Acad_eFilerError                            = TAcad_ErrorStatus(53);       // eFilerError              = 53,
  Acad_eVertexAfterFace                       = TAcad_ErrorStatus(54);       // eVertexAfterFace         = 54,
  Acad_eInvalidFaceVertexIndex                = TAcad_ErrorStatus(55);       // eInvalidFaceVertexIndex  = 55,
  Acad_eInvalidMeshVertexIndex                = TAcad_ErrorStatus(56);       // eInvalidMeshVertexIndex  = 56,
  Acad_eOtherObjectsBusy                      = TAcad_ErrorStatus(57);       // eOtherObjectsBusy        = 57,
  Acad_eMustFirstAddBlockToDb                 = TAcad_ErrorStatus(58);       // eMustFirstAddBlockToDb   = 58,
  Acad_eCannotNestBlockDefs                   = TAcad_ErrorStatus(59);       // eCannotNestBlockDefs     = 59,

  Acad_eDwgRecoveredOK                        = TAcad_ErrorStatus(60);       // eDwgRecoveredOK          = 60,
  Acad_eDwgNotRecoverable                     = TAcad_ErrorStatus(61);       // eDwgNotRecoverable       = 61,
  Acad_eDxfPartiallyRead                      = TAcad_ErrorStatus(62);       // eDxfPartiallyRead        = 62,
  Acad_eDxfReadAborted                        = TAcad_ErrorStatus(63);       // eDxfReadAborted          = 63,
  Acad_eDxbPartiallyRead                      = TAcad_ErrorStatus(64);       // eDxbPartiallyRead        = 64,
  Acad_eDwgCRCDoesNotMatch                    = TAcad_ErrorStatus(65);       // eDwgCRCDoesNotMatch      = 65,
  Acad_eDwgSentinelDoesNotMatch               = TAcad_ErrorStatus(66);       // eDwgSentinelDoesNotMatch = 66,
  Acad_eDwgObjectImproperlyRead               = TAcad_ErrorStatus(67);       // eDwgObjectImproperlyRead = 67,
  Acad_eNoInputFiler                          = TAcad_ErrorStatus(68);       // eNoInputFiler            = 68,
  Acad_eDwgNeedsAFullSave                     = TAcad_ErrorStatus(69);       // eDwgNeedsAFullSave       = 69,

  Acad_eDxbReadAborted                        = TAcad_ErrorStatus(70);       // eDxbReadAborted          = 70,
  Acad_eFileLockedByACAD                      = TAcad_ErrorStatus(71);       // eFileLockedByACAD        = 71,
  Acad_eFileAccessErrD                        = TAcad_ErrorStatus(72);       // eFileAccessErr           = 72,
  Acad_eFileSystemErr                         = TAcad_ErrorStatus(73);       // eFileSystemErr           = 73,
  Acad_eFileInternalErr                       = TAcad_ErrorStatus(74);       // eFileInternalErr         = 74,
  Acad_eFileTooManyOpen                       = TAcad_ErrorStatus(75);       // eFileTooManyOpen         = 75,
  Acad_eFileNotFound                          = TAcad_ErrorStatus(76);       // eFileNotFound            = 76,
  Acad_eDwkLockFileFound                      = TAcad_ErrorStatus(77);       // eDwkLockFileFound        = 77,

  Acad_eWasErased                             = TAcad_ErrorStatus(80);       // eWasErased               = 80,
  Acad_ePermanentlyErased                     = TAcad_ErrorStatus(81);       // ePermanentlyErased       = 81,
  Acad_eWasOpenForRead                        = TAcad_ErrorStatus(82);       // eWasOpenForRead          = 82,
  Acad_eWasOpenForWrite                       = TAcad_ErrorStatus(83);       // eWasOpenForWrite         = 83,
  Acad_eWasOpenForUndo                        = TAcad_ErrorStatus(84);       // eWasOpenForUndo          = 84,
  Acad_eWasNotifying                          = TAcad_ErrorStatus(85);       // eWasNotifying            = 85,
  Acad_eWasOpenForNotify                      = TAcad_ErrorStatus(86);       // eWasOpenForNotify        = 86,
  Acad_eOnLockedLayer                         = TAcad_ErrorStatus(87);       // eOnLockedLayer           = 87,
  Acad_eMustOpenThruOwner                     = TAcad_ErrorStatus(88);       // eMustOpenThruOwner       = 88,
  Acad_eSubentitiesStillOpen                  = TAcad_ErrorStatus(89);       // eSubentitiesStillOpen    = 89,

  Acad_eAtMaxReaders                          = TAcad_ErrorStatus(90);       // eAtMaxReaders            = 90,
  Acad_eIsWriteProtected                      = TAcad_ErrorStatus(91);       // eIsWriteProtected        = 91,
  Acad_eIsXRefObject                          = TAcad_ErrorStatus(92);       // eIsXRefObject            = 92,
  Acad_eNotAnEntity                           = TAcad_ErrorStatus(93);       // eNotAnEntity             = 93,
  Acad_eHadMultipleReaders                    = TAcad_ErrorStatus(94);       // eHadMultipleReaders      = 94,
  Acad_eDuplicateRecordName                   = TAcad_ErrorStatus(95);       // eDuplicateRecordName     = 95,
  Acad_eXRefDependent                         = TAcad_ErrorStatus(96);       // eXRefDependent           = 96,
  Acad_eSelfReference                         = TAcad_ErrorStatus(97);       // eSelfReference           = 97,
  Acad_eMissingSymbolTable                    = TAcad_ErrorStatus(98);       // eMissingSymbolTable      = 98,
  Acad_eMissingSymbolTableRec                 = TAcad_ErrorStatus(99);       // eMissingSymbolTableRec   = 99,

  Acad_eWasNotOpenForWrite                    = TAcad_ErrorStatus(100);       // eWasNotOpenForWrite     = 100,
  Acad_eCloseWasNotifying                     = TAcad_ErrorStatus(101);       // eCloseWasNotifying      = 101,
  Acad_eCloseModifyAborted                    = TAcad_ErrorStatus(102);       // eCloseModifyAborted     = 102,
  Acad_eClosePartialFailure                   = TAcad_ErrorStatus(103);       // eClosePartialFailure    = 103,
  Acad_eCloseFailObjectDamaged                = TAcad_ErrorStatus(104);       // eCloseFailObjectDamaged = 104,
  Acad_eCannotBeErasedByCaller                = TAcad_ErrorStatus(105);       // eCannotBeErasedByCaller = 105,
  Acad_eCannotBeResurrected                   = TAcad_ErrorStatus(106);       // eCannotBeResurrected    = 106,

  Acad_eInsertAfter                           = TAcad_ErrorStatus(110);       // eInsertAfter            = 110,

  Acad_eFixedAllErrors                        = TAcad_ErrorStatus(120);       // eFixedAllErrors         = 120,
  Acad_eLeftErrorsUnfixed                     = TAcad_ErrorStatus(122);       // eLeftErrorsUnfixed      = 122,
  Acad_eUnrecoverableErrors                   = TAcad_ErrorStatus(123);       // eUnrecoverableErrors    = 123,
  Acad_eNoDatabase                            = TAcad_ErrorStatus(124);       // eNoDatabase             = 124,
  Acad_eXdataSizeExceeded                     = TAcad_ErrorStatus(125);       // eXdataSizeExceeded      = 125,
  Acad_eRegappIdNotFound                      = TAcad_ErrorStatus(126);       // eRegappIdNotFound       = 126,
  Acad_eRepeatEntity                          = TAcad_ErrorStatus(127);       // eRepeatEntity           = 127,
  Acad_eRecordNotInTable                      = TAcad_ErrorStatus(128);       // eRecordNotInTable       = 128,
  Acad_eIteratorDone                          = TAcad_ErrorStatus(129);       // eIteratorDone           = 129,
  Acad_eNullIterator                          = TAcad_ErrorStatus(130);       // eNullIterator           = 130,
  Acad_eNotInBlock                            = TAcad_ErrorStatus(131);       // eNotInBlock             = 131,
  Acad_eOwnerNotInDatabase                    = TAcad_ErrorStatus(132);       // eOwnerNotInDatabase     = 132,
  Acad_eOwnerNotOpenForRead                   = TAcad_ErrorStatus(133);       // eOwnerNotOpenForRead    = 133,
  Acad_eOwnerNotOpenForWrite                  = TAcad_ErrorStatus(134);       // eOwnerNotOpenForWrite   = 134,
  Acad_eExplodeBeforeTransform                = TAcad_ErrorStatus(135);       // eExplodeBeforeTransform = 135,
  Acad_eCannotScaleNonUniformly               = TAcad_ErrorStatus(136);       // eCannotScaleNonUniformly= 136,
  Acad_eNotInDatabase                         = TAcad_ErrorStatus(137);       // eNotInDatabase          = 137,
  Acad_eNotCurrentDatabase                    = TAcad_ErrorStatus(138);       // eNotCurrentDatabase     = 138,
  Acad_eIsAnEntity                            = TAcad_ErrorStatus(139);       // eIsAnEntity             = 139,

  Acad_eCannotChangeActiveViewport            = TAcad_ErrorStatus(140);       // eCannotChangeActiveViewport = 140,
  Acad_eNotInPaperspace                       = TAcad_ErrorStatus(141);       // eNotInPaperspace            = 141,
  Acad_eCommandWasInProgress                  = TAcad_ErrorStatus(142);       // eCommandWasInProgress       = 142,

  Acad_eGeneralModelingFailure                = TAcad_ErrorStatus(150);       // eGeneralModelingFailure = 150,
  Acad_eOutOfRange                            = TAcad_ErrorStatus(151);       // eOutOfRange             = 151,
  Acad_eNonCoplanarGeometry                   = TAcad_ErrorStatus(152);       // eNonCoplanarGeometry    = 152,
  Acad_eDegenerateGeometry                    = TAcad_ErrorStatus(153);       // eDegenerateGeometry     = 153,
  Acad_eInvalidAxis                           = TAcad_ErrorStatus(154);       // eInvalidAxis            = 154,
  Acad_ePointNotOnEntity                      = TAcad_ErrorStatus(155);       // ePointNotOnEntity       = 155,
  Acad_eSingularPoint                         = TAcad_ErrorStatus(156);       // eSingularPoint          = 156,
  Acad_eInvalidOffset                         = TAcad_ErrorStatus(157);       // eInvalidOffset          = 157,
  Acad_eNonPlanarEntity                       = TAcad_ErrorStatus(158);       // eNonPlanarEntity        = 158,
  Acad_eCannotExplodeEntity                   = TAcad_ErrorStatus(159);       // eCannotExplodeEntity    = 159,

  Acad_eStringTooLong                         = TAcad_ErrorStatus(160);       // eStringTooLong           = 160,
  Acad_eInvalidSymTableFlag                   = TAcad_ErrorStatus(161);       // eInvalidSymTableFlag     = 161,
  Acad_eUndefinedLineType                     = TAcad_ErrorStatus(162);       // eUndefinedLineType       = 162,
  Acad_eInvalidTextStyle                      = TAcad_ErrorStatus(163);       // eInvalidTextStyle        = 163,
  Acad_eTooFewLineTypeElements                = TAcad_ErrorStatus(164);       // eTooFewLineTypeElements  = 164,
  Acad_eTooManyLineTypeElements               = TAcad_ErrorStatus(165);       // eTooManyLineTypeElements = 165,
  Acad_eExcessiveItemCount                    = TAcad_ErrorStatus(166);       // eExcessiveItemCount      = 166,
  Acad_eIgnoredLinetypeRedef                  = TAcad_ErrorStatus(167);       // eIgnoredLinetypeRedef    = 167,
  Acad_eBadUCS                                = TAcad_ErrorStatus(168);       // eBadUCS                  = 168,
  Acad_eBadPaperspaceView                     = TAcad_ErrorStatus(169);       // eBadPaperspaceView       = 169,

  Acad_eSomeInputDataLeftUnread               = TAcad_ErrorStatus(170);       // eSomeInputDataLeftUnread = 170,
  Acad_eNoInternalSpace                       = TAcad_ErrorStatus(171);       // eNoInternalSpace         = 171,
  Acad_eInvalidDimStyle                       = TAcad_ErrorStatus(172);       // eInvalidDimStyle         = 172,
  Acad_eInvalidLayer                          = TAcad_ErrorStatus(173);       // eInvalidLayer            = 173,

  Acad_eUserBreak                             = TAcad_ErrorStatus(180);       // eUserBreak               = 180,

  Acad_eDwgNeedsRecovery                      = TAcad_ErrorStatus(190);       // eDwgNeedsRecovery        = 190,
  Acad_eDeleteEntity                          = TAcad_ErrorStatus(191);       // eDeleteEntity            = 191,
  Acad_eInvalidFix                            = TAcad_ErrorStatus(192);       // eInvalidFix              = 192,
  Acad_eFSMError                              = TAcad_ErrorStatus(193);       // eFSMError                = 193,

  Acad_eBadLayerName                          = TAcad_ErrorStatus(200);       // eBadLayerName                 = 200,
  Acad_eLayerGroupCodeMissing                 = TAcad_ErrorStatus(201);       // eLayerGroupCodeMissing        = 201,
  Acad_eBadColorIndex                         = TAcad_ErrorStatus(202);       // eBadColorIndex                = 202,
  Acad_eBadLinetypeName                       = TAcad_ErrorStatus(203);       // eBadLinetypeName              = 203,
  Acad_eBadLinetypeScale                      = TAcad_ErrorStatus(204);       // eBadLinetypeScale             = 204,
  Acad_eBadVisibilityValue                    = TAcad_ErrorStatus(205);       // eBadVisibilityValue           = 205,
  Acad_eProperClassSeparatorExpected          = TAcad_ErrorStatus(206);       // eProperClassSeparatorExpected = 206,
  Acad_eBadLineWeightValue                    = TAcad_ErrorStatus(207);       // eBadLineWeightValue           = 207,

  Acad_ePagerError                            = TAcad_ErrorStatus(210);       // ePagerError              = 210,
  Acad_eOutOfPagerMemory                      = TAcad_ErrorStatus(211);       // eOutOfPagerMemory        = 211,
  Acad_ePagerWriteError                       = TAcad_ErrorStatus(212);       // ePagerWriteError         = 212,
  Acad_eWasNotForwarding                      = TAcad_ErrorStatus(213);       // eWasNotForwarding        = 213,

  Acad_eInvalidIdMap                          = TAcad_ErrorStatus(220);       // eInvalidIdMap            = 220,
  Acad_eInvalidOwnerObject                    = TAcad_ErrorStatus(221);       // eInvalidOwnerObject      = 221,
  Acad_eOwnerNotSet                           = TAcad_ErrorStatus(222);       // eOwnerNotSet             = 222,

  Acad_eWrongSubentityType                    = TAcad_ErrorStatus(230);       // eWrongSubentityType      = 230,
  Acad_eTooManyVertices                       = TAcad_ErrorStatus(231);       // eTooManyVertices         = 231,
  Acad_eTooFewVertices                        = TAcad_ErrorStatus(232);       // eTooFewVertices          = 232,

  Acad_eNoActiveTransactions                  = TAcad_ErrorStatus(250);       // eNoActiveTransactions             = 250,
  Acad_eNotTopTransaction                     = TAcad_ErrorStatus(251);       // eNotTopTransaction                = 251,
  Acad_eTransactionOpenWhileCommandEnded      = TAcad_ErrorStatus(252);       // eTransactionOpenWhileCommandEnded = 252,
  Acad_eInProcessOfCommitting                 = TAcad_ErrorStatus(253);       // eInProcessOfCommitting            = 253,
  Acad_eNotNewlyCreated                       = TAcad_ErrorStatus(254);       // eNotNewlyCreated                  = 254,
  Acad_eLongTransReferenceError               = TAcad_ErrorStatus(255);       // eLongTransReferenceError          = 255,
  Acad_eNoWorkSet                             = TAcad_ErrorStatus(256);       // eNoWorkSet                        = 256,

  Acad_eAlreadyInGroup                        = TAcad_ErrorStatus(260);       // eAlreadyInGroup            = 260,
  Acad_eNotInGroup                            = TAcad_ErrorStatus(261);       // eNotInGroup                = 261,

  Acad_eInvalidREFIID                         = TAcad_ErrorStatus(290);       // eInvalidREFIID             = 290,
  Acad_eInvalidNormal                         = TAcad_ErrorStatus(291);       // eInvalidNormal             = 291,
  Acad_eInvalidStyle                          = TAcad_ErrorStatus(292);       // eInvalidStyle              = 292,

  Acad_eCannotRestoreFromAcisFile             = TAcad_ErrorStatus(300);       // eCannotRestoreFromAcisFile = 300,
  Acad_eMakeMeProxy                           = TAcad_ErrorStatus(301);       // eMakeMeProxy               = 301,
  Acad_eNLSFileNotAvailable                   = TAcad_ErrorStatus(302);       // eNLSFileNotAvailable       = 302,
  Acad_eNotAllowedForThisProxy                = TAcad_ErrorStatus(303);       // eNotAllowedForThisProxy    = 303,

  Acad_eNotSupportedInDwgApi                  = TAcad_ErrorStatus(310);       // eNotSupportedInDwgApi      = 310,
  Acad_ePolyWidthLost                         = TAcad_ErrorStatus(311);       // ePolyWidthLost             = 311,
  Acad_eNullExtents                           = TAcad_ErrorStatus(312);       // eNullExtents               = 312,
  Acad_eExplodeAgain                          = TAcad_ErrorStatus(313);       // eExplodeAgain              = 313,
  Acad_eBadDwgHeader                          = TAcad_ErrorStatus(314);       // eBadDwgHeader              = 314,

  Acad_eLockViolation                         = TAcad_ErrorStatus(320);       // eLockViolation             = 320,
  Acad_eLockConflict                          = TAcad_ErrorStatus(321);       // eLockConflict              = 321,
  Acad_eDatabaseObjectsOpen                   = TAcad_ErrorStatus(322);       // eDatabaseObjectsOpen       = 322,
  Acad_eLockChangeInProgress                  = TAcad_ErrorStatus(323);       // eLockChangeInProgress      = 323,

  Acad_eVetoed                                = TAcad_ErrorStatus(325);       // eVetoed                  = 325,

  Acad_eNoDocument                            = TAcad_ErrorStatus(330);       // eNoDocument              = 330,
  Acad_eNotFromThisDocument                   = TAcad_ErrorStatus(331);       // eNotFromThisDocument     = 331,
  Acad_eLISPActive                            = TAcad_ErrorStatus(332);       // eLISPActive              = 332,
  Acad_eTargetDocNotQuiescent                 = TAcad_ErrorStatus(333);       // eTargetDocNotQuiescent   = 333,
  Acad_eDocumentSwitchDisabled                = TAcad_ErrorStatus(334);       // eDocumentSwitchDisabled  = 334,
  Acad_eInvalidContext                        = TAcad_ErrorStatus(335);       // eInvalidContext          = 335,

  Acad_eCreateFailed                          = TAcad_ErrorStatus(337);       // eCreateFailed              = 337,
  Acad_eCreateInvalidName                     = TAcad_ErrorStatus(338);       // eCreateInvalidName         = 338,
  Acad_eSetFailed                             = TAcad_ErrorStatus(340);       // eSetFailed                 = 340,
  Acad_eDelDoesNotExist                       = TAcad_ErrorStatus(342);       // eDelDoesNotExist           = 342,
  Acad_eDelIsModelSpace                       = TAcad_ErrorStatus(343);       // eDelIsModelSpace           = 343,
  Acad_eDelLastLayout                         = TAcad_ErrorStatus(344);       // eDelLastLayout             = 344,
  Acad_eDelUnableToSetCurrent                 = TAcad_ErrorStatus(345);       // eDelUnableToSetCurrent     = 345,
  Acad_eDelUnableToFind                       = TAcad_ErrorStatus(346);       // eDelUnableToFind           = 346,
  Acad_eRenameDoesNotExist                    = TAcad_ErrorStatus(348);       // eRenameDoesNotExist        = 348,
  Acad_eRenameIsModelSpace                    = TAcad_ErrorStatus(349);       // eRenameIsModelSpace        = 349,
  Acad_eRenameInvalidLayoutName               = TAcad_ErrorStatus(350);       // eRenameInvalidLayoutName   = 350,
  Acad_eRenameLayoutAlreadyExists             = TAcad_ErrorStatus(351);       // eRenameLayoutAlreadyExists = 351,
  Acad_eRenameInvalidName                     = TAcad_ErrorStatus(352);       // eRenameInvalidName         = 352,
  Acad_eCopyDoesNotExist                      = TAcad_ErrorStatus(354);       // eCopyDoesNotExist          = 354,
  Acad_eCopyIsModelSpace                      = TAcad_ErrorStatus(355);       // eCopyIsModelSpace          = 355,
  Acad_eCopyFailed                            = TAcad_ErrorStatus(356);       // eCopyFailed                = 356,
  Acad_eCopyInvalidName                       = TAcad_ErrorStatus(357);       // eCopyInvalidName           = 357,
  Acad_eCopyNameExists                        = TAcad_ErrorStatus(358);       // eCopyNameExists            = 358,

  Acad_eProfileDoesNotExist                   = TAcad_ErrorStatus(359);       // eProfileDoesNotExist       = 359,
  Acad_eInvalidFileExtension                  = TAcad_ErrorStatus(360);       // eInvalidFileExtension      = 360,
  Acad_eInvalidProfileName                    = TAcad_ErrorStatus(361);       // eInvalidProfileName        = 361,
  Acad_eFileExists                            = TAcad_ErrorStatus(362);       // eFileExists                = 362,
  Acad_eProfileIsInUse                        = TAcad_ErrorStatus(363);       // eProfileIsInUse            = 363,
  Acad_eCantOpenFile                          = TAcad_ErrorStatus(364);       // eCantOpenFile              = 364,
  Acad_eNoFileName                            = TAcad_ErrorStatus(365);       // eNoFileName                = 365,
  Acad_eRegistryAccessError                   = TAcad_ErrorStatus(366);       // eRegistryAccessError       = 366,
  Acad_eRegistryCreateError                   = TAcad_ErrorStatus(367);       // eRegistryCreateError       = 367,

  Acad_eBadDxfFile                            = TAcad_ErrorStatus(368);       // eBadDxfFile                = 368,
  Acad_eUnknownDxfFileFormat                  = TAcad_ErrorStatus(369);       // eUnknownDxfFileFormat      = 369,
  Acad_eMissingDxfSection                     = TAcad_ErrorStatus(370);       // eMissingDxfSection         = 370,
  Acad_eInvalidDxfSectionName                 = TAcad_ErrorStatus(371);       // eInvalidDxfSectionName     = 371,
  Acad_eNotDxfHeaderGroupCode                 = TAcad_ErrorStatus(372);       // eNotDxfHeaderGroupCode     = 372,
  Acad_eUndefinedDxfGroupCode                 = TAcad_ErrorStatus(373);       // eUndefinedDxfGroupCode     = 373,
  Acad_eNotInitializedYet                     = TAcad_ErrorStatus(374);       // eNotInitializedYet         = 374,
  Acad_eInvalidDxf2dPoint                     = TAcad_ErrorStatus(375);       // eInvalidDxf2dPoint         = 375,
  Acad_eInvalidDxf3dPoint                     = TAcad_ErrorStatus(376);       // eInvalidDxf3dPoint         = 376,
  Acad_eBadlyNestedAppData                    = TAcad_ErrorStatus(378);       // eBadlyNestedAppData        = 378,
  Acad_eIncompleteBlockDefinition             = TAcad_ErrorStatus(379);       // eIncompleteBlockDefinition = 379,
  Acad_eIncompleteComplexObject               = TAcad_ErrorStatus(380);       // eIncompleteComplexObject   = 380,
  Acad_eBlockDefInEntitySection               = TAcad_ErrorStatus(381);       // eBlockDefInEntitySection   = 381,
  Acad_eNoBlockBegin                          = TAcad_ErrorStatus(382);       // eNoBlockBegin              = 382,
  Acad_eDuplicateLayerName                    = TAcad_ErrorStatus(383);       // eDuplicateLayerName        = 383,
  Acad_eBadPlotStyleName                      = TAcad_ErrorStatus(384);       // eBadPlotStyleName          = 384,
  Acad_eDuplicateBlockName                    = TAcad_ErrorStatus(385);       // eDuplicateBlockName        = 385,
  Acad_eBadPlotStyleType                      = TAcad_ErrorStatus(386);       // eBadPlotStyleType          = 386,
  Acad_eBadPlotStyleNameHandle                = TAcad_ErrorStatus(387);       // eBadPlotStyleNameHandle    = 387,
  Acad_eUndefineShapeName                     = TAcad_ErrorStatus(388);       // eUndefineShapeName         = 388,
  Acad_eDuplicateBlockDefinition              = TAcad_ErrorStatus(389);       // eDuplicateBlockDefinition  = 389,
  Acad_eMissingBlockName                      = TAcad_ErrorStatus(390);       // eMissingBlockName          = 390,
  Acad_eBinaryDataSizeExceeded                = TAcad_ErrorStatus(391);       // eBinaryDataSizeExceeded    = 391,
  Acad_eObjectIsReferenced                    = TAcad_ErrorStatus(392);       // eObjectIsReferenced        = 392,
  Acad_eNoThumbnailBitmap                     = TAcad_ErrorStatus(393);       // eNoThumbnailBitmap         = 393,
  Acad_eGuidNoAddress                         = TAcad_ErrorStatus(394);       // eGuidNoAddress             = 394,

  Acad_eMustBe0to2                            = TAcad_ErrorStatus(395);       // setDimxxx: TAcad_ErrorStatus() return);        // eMustBe0to2  = 395,    // setDimxxx() returns
  Acad_eMustBe0to3                            = TAcad_ErrorStatus(396);       // eMustBe0to3                = 396,
  Acad_eMustBe0to4                            = TAcad_ErrorStatus(397);       // eMustBe0to4                = 397,
  Acad_eMustBe0to5                            = TAcad_ErrorStatus(398);       // eMustBe0to5                = 398,
  Acad_eMustBe0to8                            = TAcad_ErrorStatus(399);       // eMustBe0to8                = 399,
  Acad_eMustBe1to8                            = TAcad_ErrorStatus(400);       // eMustBe1to8                = 400,
  Acad_eMustBe1to15                           = TAcad_ErrorStatus(401);       // eMustBe1to15               = 401,
  Acad_eMustBePositive                        = TAcad_ErrorStatus(402);       // eMustBePositive            = 402,
  Acad_eMustBeNonNegative                     = TAcad_ErrorStatus(403);       // eMustBeNonNegative         = 403,
  Acad_eMustBeNonZero                         = TAcad_ErrorStatus(404);       // eMustBeNonZero             = 404,
  Acad_eMustBe1to6                            = TAcad_ErrorStatus(405);       // eMustBe1to6                = 405,

  Acad_eNoPlotStyleTranslationTable           = TAcad_ErrorStatus(406);       // eNoPlotStyleTranslationTable   = 406,
  Acad_ePlotStyleInColorDependentMode         = TAcad_ErrorStatus(407);       // ePlotStyleInColorDependentMode = 407,
  Acad_eMaxLayouts                            = TAcad_ErrorStatus(408);       // eMaxLayouts                    = 408,
  Acad_eNoClassId                             = TAcad_ErrorStatus(409);       // eNoClassId                     = 409,

  Acad_eUndoOperationNotAvailable             = TAcad_ErrorStatus(410);       // eUndoOperationNotAvailable     = 410,
  Acad_eUndoNoGroupBegin                      = TAcad_ErrorStatus(411);       // eUndoNoGroupBegin              = 411,

  Acad_eHatchTooDense                         = TAcad_ErrorStatus(420);       // eHatchTooDense                 = 420,

  Acad_eOpenFileCancelled                     = TAcad_ErrorStatus(430);       // eOpenFileCancelled             = 430,
  Acad_eNotHandled                            = TAcad_ErrorStatus(431);       // eNotHandled                    = 431,
  Acad_eMakeMeProxyAndResurrect               = TAcad_ErrorStatus(432);       // eMakeMeProxyAndResurrect       = 432,

// BEGIN: Internet-related status codes eveything went through just fine
  Acad_eInetOk                                = TAcad_ErrorStatus(20000);     // eInetOk                    = eInetBase,
  Acad_eInetInCache                           = TAcad_ErrorStatus(20001);     // eInetInCache,  // file already downloaded

// File access
  Acad_eInetFileNotFound                      = TAcad_ErrorStatus(20002);     // eInetFileNotFound,     // CFileException::fileNotFound
  Acad_eInetBadPath                           = TAcad_ErrorStatus(20003);     // eInetBadPath,          // CFileException::badPath
  Acad_eInetTooManyOpenFiles                  = TAcad_ErrorStatus(20004);     // eInetTooManyOpenFiles, // CFileException::tooManyOpenFiles
  Acad_eInetFileAccessDenied                  = TAcad_ErrorStatus(20005);     // eInetFileAccessDenied, // CFileException::accessDenied
  Acad_eInetInvalidFileHandle                 = TAcad_ErrorStatus(20006);     // eInetInvalidFileHandle,// CFileException::invalidFile
  Acad_eInetDirectoryFull                     = TAcad_ErrorStatus(20007);     // eInetDirectoryFull,    // CFileException::directoryFull
  Acad_eInetHardwareError                     = TAcad_ErrorStatus(20008);     // eInetHardwareError,    // CFileException::hardIO
  Acad_eInetSharingViolation                  = TAcad_ErrorStatus(20009);     // eInetSharingViolation, // CFileException::sharingViolation
  Acad_eInetDiskFull                          = TAcad_ErrorStatus(20010);     // eInetDiskFull,         // CFileException::diskFull
  Acad_eInetFileGenericError                  = TAcad_ErrorStatus(20011);     // eInetFileGenericError, // CFileException::generic

// AcadInet-specific
  Acad_eInetValidURL                          = TAcad_ErrorStatus(20012);     // eInetValidURL,
  Acad_eInetNotAnURL                          = TAcad_ErrorStatus(20013);     // eInetNotAnURL,         // Not a valid URL
  Acad_eInetNoWinInet                         = TAcad_ErrorStatus(20014);     // eInetNoWinInet,        // Could not locate WININET.DLL on the system
  Acad_eInetOldWinInet                        = TAcad_ErrorStatus(20015);     // eInetOldWinInet,       // an old version of WININET.DLL was found
  Acad_eInetNoAcadInet                        = TAcad_ErrorStatus(20016);     // eInetNoAcadInet,       // Could not locate ACADINET.DLL on the system
  Acad_eInetNotImplemented                    = TAcad_ErrorStatus(20017);     // eInetNotImplemented,   // probably a result of ::GetProcAddress() failure
  Acad_eInetProtocolNotSupported              = TAcad_ErrorStatus(20018);     // eInetProtocolNotSupported,// gopher, mailto, etc.

  Acad_eInetCreateInternetSessionFailed       = TAcad_ErrorStatus(20019);     // eInetCreateInternetSessionFailed,  // CAcInternetSessionFactory::CreateSession() failed
  Acad_eInetInternetSessionConnectFailed      = TAcad_ErrorStatus(20020);     // eInetInternetSessionConnectFailed,
  Acad_eInetInternetSessionOpenFailed         = TAcad_ErrorStatus(20021);     // eInetInternetSessionOpenFailed,

  Acad_eInetInvalidAccessType                 = TAcad_ErrorStatus(20022);     // eInetInvalidAccessType,    // something other than a download/upload request
  Acad_eInetFileOpenFailed                    = TAcad_ErrorStatus(20023);     // eInetFileOpenFailed,       // specifically, the OpenFile() method returned NULL
  Acad_eInetHttpOpenRequestFailed             = TAcad_ErrorStatus(20024);     // eInetHttpOpenRequestFailed,// OpenRequest() returned 0
  Acad_eInetUserCancelledTransfer             = TAcad_ErrorStatus(20025);     // eInetUserCancelledTransfer,

// WinInet-specific
  Acad_eInetHttpBadRequest                    = TAcad_ErrorStatus(20026);     // eInetHttpBadRequest,                   // HTTP_STATUS_BAD_REQUEST         400 - invalid syntax
  Acad_eInetHttpAccessDenied                  = TAcad_ErrorStatus(20027);     // eInetHttpAccessDenied,                 // HTTP_STATUS_DENIED              401 - access denied
  Acad_eInetHttpPaymentRequired               = TAcad_ErrorStatus(20028);     // eInetHttpPaymentRequired,              // HTTP_STATUS_PAYMENT_REQ         402 - payment required
  Acad_eInetHttpRequestForbidden              = TAcad_ErrorStatus(20029);     // eInetHttpRequestForbidden,             // HTTP_STATUS_FORBIDDEN           403 - request forbidden
  Acad_eInetHttpObjectNotFound                = TAcad_ErrorStatus(20030);     // eInetHttpObjectNotFound,               // HTTP_STATUS_NOT_FOUND           404 - object not found
  Acad_eInetHttpBadMethod                     = TAcad_ErrorStatus(20031);     // eInetHttpBadMethod,                    // HTTP_STATUS_BAD_METHOD          405 - method is not allowed
  Acad_eInetHttpNoAcceptableResponse          = TAcad_ErrorStatus(20032);     // eInetHttpNoAcceptableResponse,         // HTTP_STATUS_NONE_ACCEPTABLE     406 - no response acceptable to client found
  Acad_eInetHttpProxyAuthorizationRequired    = TAcad_ErrorStatus(20033);     // eInetHttpProxyAuthorizationRequired,   // HTTP_STATUS_PROXY_AUTH_REQ      407 - proxy authentication required
  Acad_eInetHttpTimedOut                      = TAcad_ErrorStatus(20034);     // eInetHttpTimedOut,                     // HTTP_STATUS_REQUEST_TIMEOUT     408 - server timed out waiting for request
  Acad_eInetHttpConflict                      = TAcad_ErrorStatus(20035);     // eInetHttpConflict,                     // HTTP_STATUS_CONFLICT            409 - user should resubmit with more info
  Acad_eInetHttpResourceGone                  = TAcad_ErrorStatus(20036);     // eInetHttpResourceGone,                 // HTTP_STATUS_GONE                410 - the resource is no longer available
  Acad_eInetHttpLengthRequired                = TAcad_ErrorStatus(20037);     // eInetHttpLengthRequired,               // HTTP_STATUS_LENGTH_REQUIRED     411 - the server refused to accept request w/o a length
  Acad_eInetHttpPreconditionFailure           = TAcad_ErrorStatus(20038);     // eInetHttpPreconditionFailure,          // HTTP_STATUS_PRECOND_FAILED      412 - precondition given in request failed
  Acad_eInetHttpRequestTooLarge               = TAcad_ErrorStatus(20039);     // eInetHttpRequestTooLarge,              // HTTP_STATUS_REQUEST_TOO_LARGE   413 - request entity was too large
  Acad_eInetHttpUriTooLong                    = TAcad_ErrorStatus(20040);     // eInetHttpUriTooLong,                   // HTTP_STATUS_URI_TOO_LONG        414 - request URI too long
  Acad_eInetHttpUnsupportedMedia              = TAcad_ErrorStatus(20041);     // eInetHttpUnsupportedMedia,             // HTTP_STATUS_UNSUPPORTED_MEDIA   415 - unsupported media type

  Acad_eInetHttpServerError                   = TAcad_ErrorStatus(20042);     // eInetHttpServerError,                  // HTTP_STATUS_SERVER_ERROR        500 - internal server error
  Acad_eInetHttpNotSupported                  = TAcad_ErrorStatus(20043);     // eInetHttpNotSupported,                 // HTTP_STATUS_NOT_SUPPORTED       501 - required not supported
  Acad_eInetHttpBadGateway                    = TAcad_ErrorStatus(20044);     // eInetHttpBadGateway,                   // HTTP_STATUS_BAD_GATEWAY         502 - error response received from gateway
  Acad_eInetHttpServiceUnavailable            = TAcad_ErrorStatus(20045);     // eInetHttpServiceUnavailable,           // HTTP_STATUS_SERVICE_UNAVAIL     503 - temporarily overloaded
  Acad_eInetHttpGatewayTimeout                = TAcad_ErrorStatus(20046);     // eInetHttpGatewayTimeout,               // HTTP_STATUS_GATEWAY_TIMEOUT     504 - timed out waiting for gateway
  Acad_eInetHttpVersionNotSupported           = TAcad_ErrorStatus(20047);     // eInetHttpVersionNotSupported,          // HTTP_STATUS_VERSION_NOT_SUP     505 - HTTP version not supported

  Acad_eInetInternetError                     = TAcad_ErrorStatus(20048);     // eInetInternetError,                    // all other error codes
// corresponding to the MFC CException
  Acad_eInetGenericException                  = TAcad_ErrorStatus(20049);     // eInetGenericException,

// all others
  Acad_eInetUnknownError                      = TAcad_ErrorStatus(20050);     // eInetUnknownError,
// END: Internet-related status codes

// AcDbCustomOsnapManager specific
  Acad_eAlreadyActive                         = TAcad_ErrorStatus(20051);     // eAlreadyActive,
  Acad_eAlreadyInactive                       = TAcad_ErrorStatus(20052);     // eAlreadyInactive};
// End AcDbCustomOsnapManager specific

  // enum PointHistory {
  // !eTablet implies window cursor tracking, as opposed to tablet mode.
  Acad_eTablet                                = TAcad_PointHistory($0001);    // eTablet = 0x0001,
  // Implies rawPoint was typed, at keyboard or fed by program or script or menu macro expansion or digitizer pick event;
  // anything but digitizer motion.
  Acad_eNotDigitizer                          = TAcad_PointHistory($0002);    // eNotDigitizer= 0x0002,
  // indicates lastPoint is valid.
  Acad_eLastPt                                = TAcad_PointHistory($0004);    // eLastPt     = 0x0004,
  // Fell into grip gravity
  Acad_eGripped                               = TAcad_PointHistory($0008);    // eGripped    = 0x008,
  // Snap mode on ("old" cartesian snap, that is.)
  Acad_eCartSnapped                           = TAcad_PointHistory($0010);    // eCartSnapped= 0x0010,
  // Ortho on
  Acad_eOrtho                                 = TAcad_PointHistory($0020);    // eOrtho      = 0x0020,
  // indicates caller is "cycling" so this is not the necessarily the "best" osnap/alignment computation.
  Acad_eCyclingPt                             = TAcad_PointHistory($0040);    // eCyclingPt  = 0x0040,
  // Osnap did something
  Acad_eOsnapped                              = TAcad_PointHistory($0080);    // eOsnapped   = 0x0080,
  // Polar Snap on
  Acad_ePolarAngle                            = TAcad_PointHistory($0100);    // ePolarAngle = 0x0100,
  // AutoAlign did something
  Acad_eAligned                               = TAcad_PointHistory($0400);    // eAligned    = 0x0400,

  // If a point filter is registered (only monitors will get this bit).
  Acad_eAppFiltered                           = TAcad_PointHistory($0800);    // eAppFiltered = 0x0800,

  // "Forced Picking" is enabled
  Acad_eForcedPick                            = TAcad_PointHistory($1000);    // eForcedPick = 0x1000,
  // AND mask to strip out "pick mode" bits to compare with eDidNotPick, eUsedPickBox and eUsedOsnapBox as enums.
  // more of the 7 values may be used in the future.
  Acad_ePickMask                              = TAcad_PointHistory($E000);    // ePickMask   = 0xE000,
  // No picking was done, i.e. !eForcedPick & no OSNAP was performed.
  Acad_eDidNotPick                            = TAcad_PointHistory($0000);    // eDidNotPick = 0x0000,
  // "Forced picking" used Pick box. used as enum within
  Acad_eUsedPickBox                           = TAcad_PointHistory($2000);    // eUsedPickBox = 0x2000,
  // "Forced picking" used OSNAP box.
  Acad_eUsedOsnapBox                          = TAcad_PointHistory($4000);    // eUsedOsnapBox = 0x4000,
  // If picking of the apertureEntities has been aborted because of out-stating mouse move messagesin AutoCAD's message queue.
  Acad_ePickAborted                           = TAcad_PointHistory($8000);    // ePickAborted  = 0x8000,

  // XCoord Pending
  Acad_eXPending                              = TAcad_PointHistory($10000);   // eXPending   = 0x10000,
  // YCoord Pending
  Acad_eYPending                              = TAcad_PointHistory($20000);   // eYPending   = 0x20000,
  // ZCoord Pending
  Acad_eZPending                              = TAcad_PointHistory($40000);   // eZPending   = 0x40000,
  // Mask for preceding pending coordinate bits.
  Acad_eCoordPending                          = TAcad_PointHistory($70000);   // eCoordPending = 0x70000,
  // Coordinate has been typed in by the user
  Acad_eFromKeyboard                          = TAcad_PointHistory($80000);   // eFromKeyboard = 0x80000,
  // Coordinate came from script, menu macro expansion, a LISP (command) call or ads_command().
  Acad_eNotInteractive                        = TAcad_PointHistory($100000);  // eNotInteractive = 0x100000};

  // enum PromptStatus {
  Acad_eNone                                  = TAcad_PromptStatus(5000);     // eNone     =  5000,
  Acad_eNormal                                = TAcad_PromptStatus(5100);     // eNormal   =  5100,
  Acad_eError                                 = TAcad_PromptStatus(-5001);    // eError    = -5001,
  Acad_eCancel                                = TAcad_PromptStatus(-5002);    // eCancel   = -5002,
  Acad_eRejected                              = TAcad_PromptStatus(-5003);    // eRejected = -5003,
  Acad_eFailed                                = TAcad_PromptStatus(-5004);    // eFailed   = -5004,
  Acad_eKeyword                               = TAcad_PromptStatus(-5005);    // eKeyword  = -5005,
  // Passed to endGetPoint if the getpoint was nested within another geometric value prompt,
  // (such as angle) and the entered response was such a value rather than a point.
  Acad_eDirect                                = TAcad_PromptStatus(-5999);    // eDirect   = -5999};

// ***************************************************************************** AcAxLib/AXLOCK
type
  TAcAxDocLock_DocLockType = Integer;

const
  // class AcAxDocLock  //enum DocLockType  {
  AcAxDocLock_kNormal                       = TAcAxDocLock_DocLockType(0);    // kNormal         = 0,    // Locking to allow write operations
  AcAxDocLock_kCurDocSwitch                 = TAcAxDocLock_DocLockType(1);    // kCurDocSwitch   = 1     // Locking + switch the doc context;
//  document activation is disabled in this mode. };

// ***************************************************************************** ADESK.H
type

// struct Adesk  {
// The types Int8, Int16 and Int32 will be conditionally compiled to guarantee
// that each one represents an integer type of exactly
// 8, 16 and 32 bits respectively.  These are to be used only when
// the EXACT size of the integer is critical.
  PAdesk_Int8   = ^TAdesk_Int8;
  TAdesk_Int8   = type Byte;          // typedef char Int8;
  PAdesk_Int16  = ^TAdesk_Int16;
  TAdesk_Int16  = type Smallint;      // typedef short Int16;
  PAdesk_Int32  = ^TAdesk_Int32;
  TAdesk_Int32  = type Longint;       // typedef long Int32;

// The unsigned versions of the above types.

  TAdesk_UInt8  = type Byte;          // typedef unsigned char UInt8;
  TAdesk_UInt16 = type Word;          // typedef unsigned short UInt16;
  TAdesk_UInt32 = type Longword;      // typedef unsigned long UInt32;

// Convenient abbreviations (use optionally).

  TAdesk_uchar  = type Byte;         // typedef unsigned char uchar;
  TAdesk_ushort = type Word;         // typedef unsigned short ushort;
  TAdesk_uint   = type Cardinal;     // typedef unsigned int uint;
  TAdesk_ulong  = type Longword;     // typedef unsigned long ulong;

// Logical type (Note: never use int when Boolean is intended!)

  // #ifndef Adesk_Boolean_is_bool
  // typedef int     Boolean;
  // enum      { kFalse = 0, kTrue = 1 };
  // #else
  TAdesk_Boolean = LongBool;         // typedef bool Boolean;
  // enum      { kFalse = false, kTrue = true };

const
  Adesk_kFalse = TAdesk_Boolean(False);
  Adesk_kTrue  = TAdesk_Boolean(True);
  // #endif
  // };

// ***************************************************************************** AcCmLib/ACCMD

const
  ACRX_CMD_MODAL            = $00000000;  // #define ACRX_CMD_MODAL             0x00000000
  ACRX_CMD_TRANSPARENT      = $00000001;  // #define ACRX_CMD_TRANSPARENT       0x00000001
  ACRX_CMD_USEPICKSET       = $00000002;  // #define ACRX_CMD_USEPICKSET        0x00000002
  ACRX_CMD_REDRAW           = $00000004;  // #define ACRX_CMD_REDRAW            0x00000004
  ACRX_CMD_NOPERSPECTIVE    = $00000008;  // #define ACRX_CMD_NOPERSPECTIVE     0x00000008  // NOT allowed in perspective views
  ACRX_CMD_NOMULTIPLE       = $00000010;  // #define ACRX_CMD_NOMULTIPLE        0x00000010
  ACRX_CMD_NOTILEMODE       = $00000020;  // #define ACRX_CMD_NOTILEMODE        0x00000020  // NOT allowed with TILEMODE == 1
  ACRX_CMD_NOPAPERSPACE     = $00000040;  // #define ACRX_CMD_NOPAPERSPACE      0x00000040  // NOT allowed in Paperspace
  ACRX_CMD_PLOTONLY         = $00000080;  // #define ACRX_CMD_PLOTONLY          0x00000080  // Allowed in plot-only state
  ACRX_CMD_NOOEM            = $00000100;  // #define ACRX_CMD_NOOEM             0x00000100
  ACRX_CMD_UNDEFINED        = $00000200;  // #define ACRX_CMD_UNDEFINED         0x00000200
  ACRX_CMD_INPROGRESS       = $00000400;  // #define ACRX_CMD_INPROGRESS        0x00000400
  ACRX_CMD_DEFUN            = $00000800;  // #define ACRX_CMD_DEFUN             0x00000800
  ACRX_CMD_NONEWSTACK       = $00010000;  // #define ACRX_CMD_NONEWSTACK        0x00010000  //For internal use only
  ACRX_CMD_NOINTERNALLOCK   = $00020000;  // #define ACRX_CMD_NOINTERNALLOCK    0x00020000
  ACRX_CMD_NOMADIC          = $00040000;  // #define ACRX_CMD_NOMADIC           0x00040000
  ACRX_CMD_DOCREADLOCK      = $00080000;  // #define ACRX_CMD_DOCREADLOCK       0x00080000  // not set = DOCWRITELOCK
  ACRX_CMD_DOCEXCLUSIVELOCK = $00100000;  // #define ACRX_CMD_DOCEXCLUSIVELOCK  0x00100000  // not set = DOCSHAREDLOCK
  ACRX_CMD_SESSION          = $00200000;  // #define ACRX_CMD_SESSION           0x00200000  // Run cmd handler in the session fiber

  ACRX_COMMAND_DOCK: PChar  = 'ACAD_REGISTERED_COMMANDS'; // #define ACRX_COMMAND_DOCK "ACAD_REGISTERED_COMMANDS"
  ACRX_MAX_CMDNAME_LEN      = 64;               // #define ACRX_MAX_CMDNAME_LEN   64

type
  PAcRxFunctionPtr = ^TAcRxFunctionPtr;
  TAcRxFunctionPtr = procedure; cdecl;              // typedef void (*AcRxFunctionPtr) ();

  PAcEdCommandStruc = ^TAcEdCommandStruc;
  TAcEdCommandStruc = record                        // struct AcEdCommandStruc {
    fcnAddr: PAcRxFunctionPtr;                      // AcRxFunctionPtr fcnAddr;
    flags: Longint;                                 // long            flags;
    app: Pointer;                                   // void         *app;
    hResHandle: Longint;                            // HINSTANCE       hResHandle;
    //This member should obviate the need to the ones above since they are already contained in AcEdCommand.
    cmd: TposAcEdCommand;                           // AcEdCommand    *cmd;
  end;                                              // };

// ***************************************************************************** RXEVENT.H

const
  ACRX_EVENT_OBJ = 'AcRxEvent';                     // #define ACRX_EVENT_OBJ "AcRxEvent"

// ***************************************************************************** RXCLASS.H

type
  PpseudoConstructor = ^TpseudoConstructor;
  TpseudoConstructor = function: TposAcRxObject; cdecl;   // AcRxObject* (*pseudoConstructor)() = NULL

// ***************************************************************************** AcDbLib/ACDB
type
  // struct AcDb {
  TAcDb_OpenMode = Integer;
  TAcDb_FileVersion = Integer;
  TAcDb_CoordAxis = Integer;
  TAcDb_CoordSystem = Integer;
  TAcDb_Intersect = Integer;
  TAcDb_Visibility = Integer;
  TAcDb_DxfCode = TAdesk_Int16;
  TAcDb_DwgDataType = Integer;
  TAcDb_OsnapMask = Integer;
  TAcDb_OsnapMode = Integer;
  TAcDb_ShowImagesMode = Integer;
  TAcDb_SaveImagesMode = Integer;
  TAcDb_TextHorzMode = Integer;
  TAcDb_TextVertMode = Integer;
  TAcDb_LineSpacingStyle = Integer;
  TAcDb_Planarity = Integer;
  TAcDb_PointIndex = Integer;
  TAcDb_EdgeIndex = Integer;
  TAcDb_Poly2dType = Integer;
  TAcDb_Poly3dType = Integer;
  TAcDb_PolyMeshType = Integer;
  TAcDb_Vertex2dType = Integer;
  TAcDb_k3dSimpleVertex = Integer;
  TAcDb_SpaceValueType = Integer;
  TAcDb_BoolOperType = Integer;
  TAcDb_SubentType = TAdesk_UInt32;
  TAcDb_GeomId = TAdesk_UInt32;
  TAcDb_GeomType = Integer;
  TAcDb_FilerType = Integer;
  TAcDb_FilerSeekType = Integer;
  TAcDb_AcDbDwgVersion = Integer;
  TAcDb_MaintenanceReleaseVersion = Integer;
  TAcDb_SaveType = Integer;
  TAcDb_GroupOperType = Integer;
  TAcDb_DeepCloneType = Integer;
  TAcDb_DuplicateRecordCloning = Integer;
  TAcDb_XrefStatus = Integer;
  TAcDb_MeasurementValue = Integer;
  TAcDb_UnitsValue = Integer;
  TAcDb_LineWeight = Integer;
  TAcDb_EndCaps = Integer;
  TAcDb_JoinStyle = Integer;
  TAcDb_PlotStyleNameType = Integer;
  TAcDb_DimArrowFlags = Integer;
  TAcDb_DimblkFlags = Integer;
  TAcDb_OrthographicView = Integer;
  TAcDb_VpFreezeOps = Integer;
  TAcDb_reservedStringEnumType = Integer;


// ***************************************************************************** AcDbLib/ACDB
const
  ACDB_SERVICES: PChar                  = 'AcDbServices';           // #define ACDB_SERVICES                  (*MSG0*)"AcDbServices"
  ACDB_MODEL_SPACE: PChar               = 'Model_Space';            // #define ACDB_MODEL_SPACE               (*MSG0*)"*Model_Space"
  ACDB_PAPER_SPACE: PChar               = 'Paper_Space';            // #define ACDB_PAPER_SPACE               (*MSG0*)"*Paper_Space"
  ACDB_NULL_HANDLE: PChar               = '#0+#0+#0+#0+#0+#0+#0';   // #define ACDB_NULL_HANDLE               (*MSG0*)"\0\0\0\0\0\0\0"  #0+#0
  ACDB_BROKEN_HANDLE: PChar             = 'FFFFFFFF';               // #define ACDB_BROKEN_HANDLE             (*MSG0*)"FFFFFFFF"
  ACDB_OPEN_BRACE_STR: PChar            = '{';                      // #define ACDB_OPEN_BRACE_STR            (*MSG0*)"{"
  ACDB_OPEN_BRACE_CHAR: Char            = '{';                      // #define ACDB_OPEN_BRACE_CHAR           (*MSG0*)'{'
  ACDB_CLOSE_BRACE_STR: PChar           = '}';                      // #define ACDB_CLOSE_BRACE_STR           (*MSG0*)"}"
  ACDB_CLOSE_BRACE_CHAR: Char           = '}';                      // #define ACDB_CLOSE_BRACE_CHAR          (*MSG0*)'}'
  ACDB_GROUP_DICTIONARY: PChar          = 'ACAD_GROUP';             // #define ACDB_GROUP_DICTIONARY          (*MSG0*)"ACAD_GROUP"
  ACDB_MLINESTYLE_DICTIONARY: PChar     = 'ACAD_MLINESTYLE';        // #define ACDB_MLINESTYLE_DICTIONARY     (*MSG0*)"ACAD_MLINESTYLE"
  ACDB_LAYOUT_DICTIONARY: PChar         = 'ACAD_LAYOUT';            // #define ACDB_LAYOUT_DICTIONARY         (*MSG0*)"ACAD_LAYOUT"
  ACDB_PLOTSETTINGS_DICTIONARY: PChar   = 'ACAD_PLOTSETTINGS';      // #define ACDB_PLOTSETTINGS_DICTIONARY   (*MSG0*)"ACAD_PLOTSETTINGS"
  ACDB_PLOTSTYLENAME_DICTIONARY: PChar  = 'ACAD_PLOTSTYLENAME';     // #define ACDB_PLOTSTYLENAME_DICTIONARY  (*MSG0*)"ACAD_PLOTSTYLENAME"
  ACDB_EMBEDDED_OBJECT_STR: PChar       = 'Embedded Object';        // #define ACDB_EMBEDDED_OBJECT_STR       (*MSG0*)"Embedded Object"

const
  // enum OpenMode {
  AcDb_kForRead                               =  TAcDb_OpenMode(0);           // kForRead           = 0,
  AcDb_kForWrite                              = TAcDb_OpenMode(1);            // kForWrite          = 1,
  AcDb_kForNotify                             = TAcDb_OpenMode(2);            // kForNotify         = 2 };

  // enum FileVersion {
  AcDb_kR12                                   = TAcDb_FileVersion(0);         // kR12         = 0,
  AcDb_kR13                                   = TAcDb_FileVersion(1);         // kR13         = 1,
  AcDb_kR13Custom                             = TAcDb_FileVersion(2);         // kR13Custom   = 2,
  AcDb_kMaxVersion                            = TAcDb_FileVersion(500);       // kMaxVersion  = 500 };

  // enum CoordAxis {
  AcDb_kX                                     = TAcDb_CoordAxis(0);           // kX       = 0,
  AcDb_kY                                     = TAcDb_CoordAxis(1);           // kY       = 1,
  AcDb_kZ                                     = TAcDb_CoordAxis(2);           // kZ       = 2 };

  // enum CoordSystem {
  AcDb_kWorldCS                               = TAcDb_CoordSystem(0);         // kWorldCS           = 0,
  AcDb_kUserCS                                = TAcDb_CoordSystem(1);         // kUserCS            = 1,
  AcDb_kCurDisplayCS                          = TAcDb_CoordSystem(2);         // kCurDisplayCS      = 2,
  AcDb_kPaperDisplayCS                        = TAcDb_CoordSystem(3);         // kPaperDisplayCS    = 3,
  AcDb_kEntityCS                              = TAcDb_CoordSystem(4);         // kEntityCS          = 4 };

  // enum Intersect {
  AcDb_kOnBothOperands                        = TAcDb_Intersect(0);           // kOnBothOperands    = 0,
  AcDb_kExtendThis                            = TAcDb_Intersect(1);           // kExtendThis        = 1,
  AcDb_kExtendArg                             = TAcDb_Intersect(2);           // kExtendArg         = 2,
  AcDb_kExtendBoth                            = TAcDb_Intersect(3);           // kExtendBoth        = 3 };

  // enum Visibility {
  AcDb_kInvisible                             = TAcDb_Visibility(1);          // kInvisible         = 1,
  AcDb_kVisible                               = TAcDb_Visibility(0);            // kVisible           = 0 };

  // typedef Adesk::Int16 DxfCode;
  // enum {
  AcDb_kDxfInvalid                            = TAcDb_DxfCode(-9999);         // kDxfInvalid        = -9999,
  AcDb_kDxfXDictionary                        = TAcDb_DxfCode(-6);            // kDxfXDictionary     = -6,
  AcDb_kDxfPReactors                          = TAcDb_DxfCode(-5);            // kDxfPReactors       = -5,
  AcDb_kDxfUndo                               = TAcDb_DxfCode(-4);            // kDxfUndo            = -4,
  AcDb_kDxfXDataStart                         = TAcDb_DxfCode(-3);            // kDxfXDataStart      = -3,
  AcDb_kDxfHeaderId                           = TAcDb_DxfCode(-2);            // kDxfHeaderId        = -2,
  AcDb_kDxfFirstEntId                         = TAcDb_DxfCode(-2);            // kDxfFirstEntId      = -2,
  AcDb_kDxfEnd                                = TAcDb_DxfCode(-1);            // kDxfEnd             = -1,
  AcDb_kDxfStartt                             = TAcDb_DxfCode(0);             // kDxfStart           = 0,
  AcDb_kDxfText                               = TAcDb_DxfCode(1);             // kDxfText            = 1,
  AcDb_kDxfXRefPath                           = TAcDb_DxfCode(1);             // kDxfXRefPath        = 1,
  AcDb_kDxfShapeName                          = TAcDb_DxfCode(2);             // kDxfShapeName       = 2,
  AcDb_kDxfBlockName                          = TAcDb_DxfCode(2);             // kDxfBlockName       = 2,
  AcDb_kDxfAttributeTag                       = TAcDb_DxfCode(2);             // kDxfAttributeTag    = 2,
  AcDb_kDxfSymbolTableName                    = TAcDb_DxfCode(2);             // kDxfSymbolTableName = 2,
  AcDb_kDxfMstyleName                         = TAcDb_DxfCode(2);             // kDxfMstyleName      = 2,
  AcDb_kDxfSymTableRecName                    = TAcDb_DxfCode(2);             // kDxfSymTableRecName = 2,
  AcDb_kDxfAttributePrompt                    = TAcDb_DxfCode(3);             // kDxfAttributePrompt = 3,
  AcDb_kDxfDimStyleName                       = TAcDb_DxfCode(3);             // kDxfDimStyleName    = 3,
  AcDb_kDxfLinetypeProse                      = TAcDb_DxfCode(3);             // kDxfLinetypeProse   = 3,
  AcDb_kDxfTextFontFile                       = TAcDb_DxfCode(3);             // kDxfTextFontFile    = 3,
  AcDb_kDxfDescription                        = TAcDb_DxfCode(3);             // kDxfDescription     = 3,
  AcDb_kDxfDimPostStr                         = TAcDb_DxfCode(3);             // kDxfDimPostStr      = 3,
  AcDb_kDxfTextBigFontFile                    = TAcDb_DxfCode(4);             // kDxfTextBigFontFile = 4,
  AcDb_kDxfDimAPostStr                        = TAcDb_DxfCode(4);             // kDxfDimAPostStr     = 4,
  AcDb_kDxfCLShapeName                        = TAcDb_DxfCode(4);             // kDxfCLShapeName     = 4,
  AcDb_kDxfSymTableRecComments                = TAcDb_DxfCode(4);             // kDxfSymTableRecComments = 4,
  AcDb_kDxfHandle                             = TAcDb_DxfCode(5);             // kDxfHandle              = 5,
  AcDb_kDxfDimBlk                             = TAcDb_DxfCode(5);             // kDxfDimBlk              = 5,
  AcDb_kDxfDimBlk1                            = TAcDb_DxfCode(6);             // kDxfDimBlk1             = 6,
  AcDb_kDxfLinetypeName                       = TAcDb_DxfCode(6);             // kDxfLinetypeName        = 6,
  AcDb_kDxfDimBlk2                            = TAcDb_DxfCode(7);             // kDxfDimBlk2             = 7,
  AcDb_kDxfTextStyleName                      = TAcDb_DxfCode(7);             // kDxfTextStyleName       = 7,
  AcDb_kDxfLayerName                          = TAcDb_DxfCode(8);             // kDxfLayerName           = 8,
  AcDb_kDxfCLShapeText                        = TAcDb_DxfCode(9);             // kDxfCLShapeText         = 9,

  AcDb_kDxfXCoord                             = TAcDb_DxfCode(10);            // kDxfXCoord         = 10,
  AcDb_kDxfYCoord                             = TAcDb_DxfCode(20);            // kDxfYCoord         = 20,
  AcDb_kDxfZCoord                             = TAcDb_DxfCode(30);            // kDxfZCoord         = 30,

  AcDb_kDxfElevation                          = TAcDb_DxfCode(38);            // kDxfElevation      = 38,
  AcDb_kDxfThickness                          = TAcDb_DxfCode(39);            // kDxfThickness      = 39,

  AcDb_kDxfReal                               = TAcDb_DxfCode(40);            // kDxfReal           = 40,
  AcDb_kDxfViewportHeight                     = TAcDb_DxfCode(40);            // kDxfViewportHeight = 40,
  AcDb_kDxfTxtSize                            = TAcDb_DxfCode(40);            // kDxfTxtSize        = 40,
  AcDb_kDxfTxtStyleXScale                     = TAcDb_DxfCode(41);            // kDxfTxtStyleXScale = 41,
  AcDb_kDxfViewWidth                          = TAcDb_DxfCode(41);            // kDxfViewWidth      = 41,
  AcDb_kDxfViewportAspect                     = TAcDb_DxfCode(41);            // kDxfViewportAspect = 41,
  AcDb_kDxfTxtStylePSize                      = TAcDb_DxfCode(42);            // kDxfTxtStylePSize  = 42,
  AcDb_kDxfViewLensLength                     = TAcDb_DxfCode(42);            // kDxfViewLensLength = 42,
  AcDb_kDxfViewFrontClip                      = TAcDb_DxfCode(43);            // kDxfViewFrontClip  = 43,
  AcDb_kDxfViewBackClip                       = TAcDb_DxfCode(44);            // kDxfViewBackClip   = 44,
  AcDb_kDxfShapeXOffset                       = TAcDb_DxfCode(44);            // kDxfShapeXOffset   = 44,
  AcDb_kDxfShapeYOffset                       = TAcDb_DxfCode(45);            // kDxfShapeYOffset   = 45,
  AcDb_kDxfViewHeight                         = TAcDb_DxfCode(45);            // kDxfViewHeight     = 45,
  AcDb_kDxfShapeScale                         = TAcDb_DxfCode(46);            // kDxfShapeScale     = 46,
  AcDb_kDxfPixelScale                         = TAcDb_DxfCode(47);            // kDxfPixelScale     = 47,

  AcDb_kDxfLinetypeScale                      = TAcDb_DxfCode(48);            // kDxfLinetypeScale  = 48,

  AcDb_kDxfDashLength                         = TAcDb_DxfCode(49);            // kDxfDashLength       = 49,
  AcDb_kDxfMlineOffset                        = TAcDb_DxfCode(49);            // kDxfMlineOffset      = 49,
  AcDb_kDxfLinetypeElement                    = TAcDb_DxfCode(49);            // kDxfLinetypeElement = 49,

  AcDb_kDxfAngle                              = TAcDb_DxfCode(50);            // kDxfAngle             = 50,
  AcDb_kDxfViewportSnapAngle                  = TAcDb_DxfCode(50);            // kDxfViewportSnapAngle = 50,
  AcDb_kDxfViewportTwist                      = TAcDb_DxfCode(51);            // kDxfViewportTwist     = 51,

  AcDb_kDxfVisibility                         = TAcDb_DxfCode(60);            // kDxfVisibility     = 60,
  AcDb_kDxfLayerLinetype                      = TAcDb_DxfCode(61);            // kDxfLayerLinetype  = 61,
  AcDb_kDxfColor                              = TAcDb_DxfCode(62);            // kDxfColor          = 62,
// Removed codes intended only for internal use:63-65
  AcDb_kDxfHasSubentities                     = TAcDb_DxfCode(66);            // kDxfHasSubentities     = 66,
  AcDb_kDxfViewportVisibility                 = TAcDb_DxfCode(67);            // kDxfViewportVisibility = 67,
  AcDb_kDxfViewportActive                     = TAcDb_DxfCode(68);            // kDxfViewportActive     = 68,
  AcDb_kDxfViewportNumber                     = TAcDb_DxfCode(69);            // kDxfViewportNumber     = 69,

  AcDb_kDxfInt16                              = TAcDb_DxfCode(70);            // kDxfInt16              = 70,
  AcDb_kDxfViewMode                           = TAcDb_DxfCode(71);            // kDxfViewMode           = 71,
  AcDb_kDxfCircleSides                        = TAcDb_DxfCode(72);            // kDxfCircleSides        = 72,
  AcDb_kDxfViewportZoom                       = TAcDb_DxfCode(73);            // kDxfViewportZoom       = 73,
  AcDb_kDxfViewportIcon                       = TAcDb_DxfCode(74);            // kDxfViewportIcon       = 74,
  AcDb_kDxfViewportSnap                       = TAcDb_DxfCode(75);            // kDxfViewportSnap       = 75,
  AcDb_kDxfViewportGrid                       = TAcDb_DxfCode(76);            // kDxfViewportGrid       = 76,
  AcDb_kDxfViewportSnapStyle                  = TAcDb_DxfCode(77);            // kDxfViewportSnapStyle  = 77,
  AcDb_kDxfViewportSnapPair                   = TAcDb_DxfCode(78);            // kDxfViewportSnapPair   = 78,

  AcDb_kDxfRegAppFlags                        = TAcDb_DxfCode(71);            // kDxfRegAppFlags        = 71,

  AcDb_kDxfTxtStyleFlags                      = TAcDb_DxfCode(71);            // kDxfTxtStyleFlags      = 71,
  AcDb_kDxfLinetypeAlign                      = TAcDb_DxfCode(72);            // kDxfLinetypeAlign      = 72,
  AcDb_kDxfLinetypePDC                        = TAcDb_DxfCode(73);            // kDxfLinetypePDC        = 73,

  AcDb_kDxfInt32                              = TAcDb_DxfCode(90);            // kDxfInt32              = 90,

// Subclass Section Marker

// to be followed by subclass name.

  AcDb_kDxfSubclass                           = TAcDb_DxfCode(100);           // kDxfSubclass            = 100,
  AcDb_kDxfEmbeddedObjectStart                = TAcDb_DxfCode(101);           // kDxfEmbeddedObjectStart = 101,
  AcDb_kDxfControlString                      = TAcDb_DxfCode(102);           // kDxfControlString       = 102,

// DimVarTableRecords have been using 5 for a string value.  With R13, they get a handle value as well.  Since 5 is already in use, we use 105 for this special case.

  AcDb_kDxfDimVarHandle                       = TAcDb_DxfCode(105);           // kDxfDimVarHandle   = 105,

  AcDb_kDxfUCSOrg                             = TAcDb_DxfCode(110);           // kDxfUCSOrg         = 110,
  AcDb_kDxfUCSOriX                            = TAcDb_DxfCode(111);           // kDxfUCSOriX        = 111,
  AcDb_kDxfUCSOriY                            = TAcDb_DxfCode(112);           // kDxfUCSOriY        = 112,

  AcDb_kDxfXReal                              = TAcDb_DxfCode(140);           // kDxfXReal          = 140,

  AcDb_kDxfXInt16                             = TAcDb_DxfCode(170);           // kDxfXInt16         = 170,

  AcDb_kDxfNormalX                            = TAcDb_DxfCode(210);           // kDxfNormalX        = 210,
  AcDb_kDxfNormalY                            = TAcDb_DxfCode(220);           // kDxfNormalY        = 220,
  AcDb_kDxfNormalZ                            = TAcDb_DxfCode(230);           // kDxfNormalZ        = 230,

  AcDb_kDxfXXInt16                            = TAcDb_DxfCode(270);           // kDxfXXInt16        = 270,

  AcDb_kDxfInt8                               = TAcDb_DxfCode(280);           // kDxfInt8           = 280,
  AcDb_kDxfRenderMode                         = TAcDb_DxfCode(281);           // kDxfRenderMode     = 281,

  AcDb_kDxfBool                               = TAcDb_DxfCode(290);           // kDxfBool           = 290,

//  More string values 300-309
  AcDb_kDxfXTextString                        = TAcDb_DxfCode(300);           // kDxfXTextString    = 300,

//  Arbitrary Binary Chunks 310-319
  AcDb_kDxfBinaryChunk                        = TAcDb_DxfCode(310);           // kDxfBinaryChunk    = 310,

//  Arbitrary Object Handles 320-329
  AcDb_kDxfArbHandle                          = TAcDb_DxfCode(320);           // kDxfArbHandle      = 320,

  AcDb_kDxfSoftPointerId                      = TAcDb_DxfCode(330);           // kDxfSoftPointerId   = 330,  // 330-339
  AcDb_kDxfHardPointerId                      = TAcDb_DxfCode(340);           // kDxfHardPointerId   = 340,  // 340-349
  AcDb_kDxfSoftOwnershipId                    = TAcDb_DxfCode(350);           // kDxfSoftOwnershipId = 350,  // 350-359
  AcDb_kDxfHardOwnershipId                    = TAcDb_DxfCode(360);           // kDxfHardOwnershipId = 360,  // 360-369

// New base entity properties Lineweight is either an integer or "BYLAYER" or "BYBLOCK"
  AcDb_kDxfLineWeight                         = TAcDb_DxfCode(370);           // kDxfLineWeight        = 370,
  AcDb_kDxfPlotStyleNameType                  = TAcDb_DxfCode(380);           // kDxfPlotStyleNameType = 380,
  AcDb_kDxfPlotStyleNameId                    = TAcDb_DxfCode(390);           // kDxfPlotStyleNameId   = 390,
  AcDb_kDxfXXXInt16                           = TAcDb_DxfCode(400);           // kDxfXXXInt16          = 400,

  AcDb_kDxfLayoutName                         = TAcDb_DxfCode(410);           // kDxfLayoutName       = 410,

  AcDb_kDxfComment                            = TAcDb_DxfCode(999);           // kDxfComment          = 999,

  AcDb_kDxfXdAsciiString                      = TAcDb_DxfCode(1000);          // kDxfXdAsciiString    = 1000,
  AcDb_kDxfRegAppName                         = TAcDb_DxfCode(1001);          // kDxfRegAppName       = 1001,
  AcDb_kDxfXdControlString                    = TAcDb_DxfCode(1002);          // kDxfXdControlString  = 1002,
  AcDb_kDxfXdLayerName                        = TAcDb_DxfCode(1003);          // kDxfXdLayerName      = 1003,
  AcDb_kDxfXdBinaryChunk                      = TAcDb_DxfCode(1004);          // kDxfXdBinaryChunk    = 1004,
  AcDb_kDxfXdHandle                           = TAcDb_DxfCode(1005);          // kDxfXdHandle         = 1005,

  AcDb_kDxfXdXCoord                           = TAcDb_DxfCode(1010);          // kDxfXdXCoord         = 1010,
  AcDb_kDxfXdYCoord                           = TAcDb_DxfCode(1020);          // kDxfXdYCoord         = 1020,
  AcDb_kDxfXdZCoord                           = TAcDb_DxfCode(1030);          // kDxfXdZCoord         = 1030,

  AcDb_kDxfXdWorldXCoord                      = TAcDb_DxfCode(1011);          // kDxfXdWorldXCoord    = 1011,
  AcDb_kDxfXdWorldYCoord                      = TAcDb_DxfCode(1021);          // kDxfXdWorldYCoord    = 1021,
  AcDb_kDxfXdWorldZCoord                      = TAcDb_DxfCode(1031);          // kDxfXdWorldZCoord    = 1031,

  AcDb_kDxfXdWorldXDisp                       = TAcDb_DxfCode(1012);          // kDxfXdWorldXDisp     = 1012,
  AcDb_kDxfXdWorldYDisp                       = TAcDb_DxfCode(1022);          // kDxfXdWorldYDisp     = 1022,
  AcDb_kDxfXdWorldZDisp                       = TAcDb_DxfCode(1032);          // kDxfXdWorldZDisp     = 1032,

  AcDb_kDxfXdWorldXDir                        = TAcDb_DxfCode(1032);          // kDxfXdWorldXDir      = 1013,
  AcDb_kDxfXdWorldYDir                        = TAcDb_DxfCode(1032);          // kDxfXdWorldYDir      = 1023,
  AcDb_kDxfXdWorldZDir                        = TAcDb_DxfCode(1032);          // kDxfXdWorldZDir      = 1033,

  AcDb_kDxfXdReal                             = TAcDb_DxfCode(1040);          // kDxfXdReal           = 1040,
  AcDb_kDxfXdDist                             = TAcDb_DxfCode(1041);          // kDxfXdDist           = 1041,
  AcDb_kDxfXdScale                            = TAcDb_DxfCode(1042);          // kDxfXdScale          = 1042,

  AcDb_kDxfXdInteger16                        = TAcDb_DxfCode(1070);          // kDxfXdInteger16      = 1070,
  AcDb_kDxfXdInteger32                        = TAcDb_DxfCode(1071);          // kDxfXdInteger32      = 1071 };

// Primitives.

  // enum DwgDataType  {
  AcDb_kDwgNull                               = TAcDb_DwgDataType(0);         // kDwgNull            = 0,
  AcDb_kDwgReall                              = TAcDb_DwgDataType(1);         // kDwgReal            = 1,
  AcDb_kDwgInt32                              = TAcDb_DwgDataType(2);         // kDwgInt32           = 2,
  AcDb_kDwgInt16                              = TAcDb_DwgDataType(3);         // kDwgInt16           = 3,
  AcDb_kDwgInt8                               = TAcDb_DwgDataType(4);         // kDwgInt8            = 4,
  AcDb_kDwgText                               = TAcDb_DwgDataType(5);         // kDwgText            = 5,
  AcDb_kDwgBChunk                             = TAcDb_DwgDataType(6);         // kDwgBChunk          = 6,
  AcDb_kDwgHandle                             = TAcDb_DwgDataType(7);         // kDwgHandle          = 7,
  AcDb_kDwgHardOwnershipId                    = TAcDb_DwgDataType(8);         // kDwgHardOwnershipId = 8,
  AcDb_kDwgSoftOwnershipId                    = TAcDb_DwgDataType(9);         // kDwgSoftOwnershipId = 9,
  AcDb_kDwgHardPointerId                      = TAcDb_DwgDataType(10);        // kDwgHardPointerId   = 10,
  AcDb_kDwgSoftPointerId                      = TAcDb_DwgDataType(11);        // kDwgSoftPointerId   = 11,
  AcDb_kDwg3Real                              = TAcDb_DwgDataType(12);        // kDwg3Real           = 12,
  AcDb_kDwgNotRecognized                      = TAcDb_DwgDataType(19);        // kDwgNotRecognized   = 19 };

// OsnapMask:  Specifies Osnap Operation.

  // enum OsnapMask {
  AcDb_kOsMaskEnd                             = TAcDb_OsnapMask(1);           // kOsMaskEnd          = 1,
  AcDb_kOsMaskMid                             = TAcDb_OsnapMask(2);           // kOsMaskMid          = 2,
  AcDb_kOsMaskCen                             = TAcDb_OsnapMask(4);           // kOsMaskCen          = 4,
  AcDb_kOsMaskNode                            = TAcDb_OsnapMask(8);           // kOsMaskNode         = 8,
  AcDb_kOsMaskQuad                            = TAcDb_OsnapMask($10);         // kOsMaskQuad         = 0x10,
  AcDb_kOsMaskInt                             = TAcDb_OsnapMask($20);         // kOsMaskInt          = 0x20,
  AcDb_kOsMaskIns                             = TAcDb_OsnapMask($40);         // kOsMaskIns          = 0x40,
  AcDb_kOsMaskPerp                            = TAcDb_OsnapMask($80);         // kOsMaskPerp         = 0x80,
  AcDb_kOsMaskTan                             = TAcDb_OsnapMask($100);        // kOsMaskTan          = 0x100,
  AcDb_kOsMaskNear                            = TAcDb_OsnapMask($200);        // kOsMaskNear         = 0x200,
  AcDb_kOsMaskQuick                           = TAcDb_OsnapMask($400);        // kOsMaskQuick        = 0x400,
  AcDb_kOsMaskApint                           = TAcDb_OsnapMask($800);        // kOsMaskApint        = 0x800,
  AcDb_kOsMaskImmediate                       = TAcDb_OsnapMask($10000);      // kOsMaskImmediate    = 0x10000,
  AcDb_kOsMaskAllowTan                        = TAcDb_OsnapMask($20000);      // kOsMaskAllowTan     = 0x20000,
  AcDb_kOsMaskDisablePerp                     = TAcDb_OsnapMask($40000);      // kOsMaskDisablePerp  = 0x40000,
  AcDb_kOsMaskRelCartesian                    = TAcDb_OsnapMask($80000);      // kOsMaskRelCartesian = 0x80000,
  AcDb_kOsMaskRelPolar                        = TAcDb_OsnapMask($100000);     // kOsMaskRelPolar     = 0x100000 };

// OsnapMode:  Specifies Object query. Binary and Virtual Operations not represented.

  // enum OsnapMode {
  AcDb_kOsModeEnd                             = TAcDb_OsnapMode(1);           // kOsModeEnd          = 1,
  AcDb_kOsModeMid                             = TAcDb_OsnapMode(2);           // kOsModeMid          = 2,
  AcDb_kOsModeCen                             = TAcDb_OsnapMode(3);           // kOsModeCen          = 3,
  AcDb_kOsModeNode                            = TAcDb_OsnapMode(4);           // kOsModeNode         = 4,
  AcDb_kOsModeQuad                            = TAcDb_OsnapMode(5);           // kOsModeQuad         = 5,
  AcDb_kOsModeIns                             = TAcDb_OsnapMode(7);           // kOsModeIns          = 7,
  AcDb_kOsModePerp                            = TAcDb_OsnapMode(8);           // kOsModePerp         = 8,
  AcDb_kOsModeTan                             = TAcDb_OsnapMode(9);           // kOsModeTan          = 9,
  AcDb_kOsModeNear                            = TAcDb_OsnapMode(10);          // kOsModeNear         = 10 };

  // enum ShowImagesMode  {
  AcDb_kNeverShow                             = TAcDb_ShowImagesMode(0);      // kNeverShow       = 0,
  AcDb_kAlwaysShow                            = TAcDb_ShowImagesMode(1);      // kAlwaysShow      = 1,
  AcDb_kBoundingBoxShow                       = TAcDb_ShowImagesMode(2);      // kBoundingBoxShow = 2 };

  // enum SaveImagesMode  {
  AcDb_kNeverSave                             = TAcDb_SaveImagesMode(0);      // kNeverSave     = 0,
  AcDb_kAlwaysSave                            = TAcDb_SaveImagesMode(1);      // kAlwaysSave    = 1 };

  // enum TextHorzMode  {
  AcDb_kTextLeft                              = TAcDB_TextHorzMode(0);        // kTextLeft    = 0,   // TH_LEFT,
  AcDb_kTextCenter                            = TAcDB_TextHorzMode(1);        // kTextCenter  = 1,   // TH_CENT,
  AcDb_kTextRight                             = TAcDB_TextHorzMode(2);        // kTextRight   = 2,   // TH_RIGHT,
  AcDb_kTextAlign                             = TAcDB_TextHorzMode(3);        // kTextAlign   = 3,   // THV_ALIGN,
  AcDb_kTextMid                               = TAcDB_TextHorzMode(4);        // kTextMid     = 4,   // THV_MID,
  AcDb_kTextFit                               = TAcDB_TextHorzMode(5);        // kTextFit     = 5 }; // THV_FIT

  // enum TextVertMode  {
  AcDb_kTextBase                              = TAcDB_TextVertMode(0);        // kTextBase    = 0,   // TV_BASE,
  AcDb_kTextBottom                            = TAcDB_TextVertMode(1);        // kTextBottom  = 1,   // TV_BOT,
  AcDb_kTextVertMid                           = TAcDB_TextVertMode(2);        // kTextVertMid = 2,   // TV_MID,
  AcDb_kTextTop                               = TAcDB_TextVertMode(3);        // kTextTop     = 3 }; // TV_TOP

  // enum LineSpacingStyle  {
  AcDb_kAtLeast                               = TAcDB_LineSpacingStyle(1);    // kAtLeast = 1,
  AcDb_kExactly                               = TAcDB_LineSpacingStyle(2);    // kExactly = 2 };

  // enum Planarity  {
  AcDb_kNonPlanar                             = TAcDB_Planarity(0);           // kNonPlanar = 0,
  AcDb_kPlanar                                = TAcDB_Planarity(1);           // kPlanar    = 1,
  AcDb_kLinear                                = TAcDB_Planarity(2);           // kLinear    = 2 };

  // enum PointIndex  {
  AcDb_kMPoint1                               = TAcDb_PointIndex(0);          // kMPoint1    = 0,
  AcDb_kMPoint2                               = TAcDb_PointIndex(1);          // kMPoint2    = 1,
  AcDb_kMPoint3                               = TAcDb_PointIndex(2);          // kMPoint3    = 2,
  AcDb_kMPoint4                               = TAcDb_PointIndex(3);          // kMPoint4    = 3 };

  // enum EdgeIndex  {
  AcDb_kMEdge1                                = TAcDb_EdgeIndex(0);           //kMEdge1     = 0,
  AcDb_kMEdge2                                = TAcDb_EdgeIndex(1);           // kMEdge2    = 1,
  AcDb_kMEdge3                                = TAcDb_EdgeIndex(2);           // kMEdge3    = 2,
  AcDb_kMEdge4                                = TAcDb_EdgeIndex(3);           // kMEdge4    = 3 };

  // enum Poly2dType  {
  AcDb_k2dSimplePoly                          = TAcDb_Poly2dType(0);          // k2dSimplePoly      = 0,
  AcDb_k2dFitCurvePoly                        = TAcDb_Poly2dType(1);          // k2dFitCurvePoly    = 1,
  AcDb_k2dQuadSplinePoly                      = TAcDb_Poly2dType(2);          // k2dQuadSplinePoly  = 2,
  AcDb_k2dCubicSplinePoly                     = TAcDb_Poly2dType(3);          // k2dCubicSplinePoly = 3 };

  // enum Poly3dType  {
  AcDb_k3dSimplePoly                          = TAcDb_Poly3dType(0);          // k3dSimplePoly      = 0,
  AcDb_k3dQuadSplinePoly                      = TAcDb_Poly3dType(1);          // k3dQuadSplinePoly  = 1,
  AcDb_k3dCubicSplinePoly                     = TAcDb_Poly3dType(2);          // k3dCubicSplinePoly = 2 };

  // enum PolyMeshType  {
  AcDb_kSimpleMesh                            = TAcDb_PolyMeshType(0);        // kSimpleMesh        = 0,
  AcDb_kQuadSurfaceMesh                       = TAcDb_PolyMeshType(5);        // kQuadSurfaceMesh   = 5,
  AcDb_kCubicSurfaceMesh                      = TAcDb_PolyMeshType(6);        // kCubicSurfaceMesh  = 6,
  AcDb_kBezierSurfaceMesh                     = TAcDb_PolyMeshType(8);        // kBezierSurfaceMesh = 8 };

  // enum Vertex2dType  {
  AcDb_k2dVertex                              = TAcDB_Vertex2dType(0);        // k2dVertex          = 0,
  AcDb_k2dSplineCtlVertex                     = TAcDB_Vertex2dType(1);        // k2dSplineCtlVertex = 1,
  AcDb_k2dSplineFitVertex                     = TAcDB_Vertex2dType(2);        // k2dSplineFitVertex = 2,
  AcDb_k2dCurveFitVertex                      = TAcDB_Vertex2dType(3);        // k2dCurveFitVertex =  3 };

  // enum Vertex3dType  {
  AcDb_k3dSimpleVertex                        = TAcDb_k3dSimpleVertex(0);     // k3dSimpleVertex    = 0,
  AcDb_k3dControlVertex                       = TAcDb_k3dSimpleVertex(1);     // k3dControlVertex   = 1,
  AcDb_k3dFitVertex                           = TAcDb_k3dSimpleVertex(2);     // k3dFitVertex       = 2 };

  // enum SpaceValueType  {
  AcDb_kUndefined                             = TAcDb_SpaceValueType(0);      // kUndefined,
  AcDb_kStubPtr                               = TAcDb_SpaceValueType(1);      // kStubPtr,
  AcDb_kEndOfFile                             = TAcDb_SpaceValueType(2);      // kEndOfFile,
  AcDb_kBackwardBranch                        = TAcDb_SpaceValueType(3);      // kBackwardBranch,
  AcDb_kForwardBranch                         = TAcDb_SpaceValueType(4);      // kForwardBranch,
  AcDb_kDetour                                = TAcDb_SpaceValueType(5);      // kDetour };

  // enum BoolOperType  {
  AcDb_kBoolUnite                             = TAcDb_BoolOperType(0);        // kBoolUnite      = 0,
  AcDb_kBoolIntersect                         = TAcDb_BoolOperType(1);        // kBoolIntersect  = 1,
  AcDb_kBoolSubtract                          = TAcDb_BoolOperType(2);        // kBoolSubtract   = 2 };

  // typedef Adesk::UInt32    SubentType;
  // enum  {
  AcDb_kNullSubentType                        = TAcDb_SubentType(0);          // kNullSubentType    = 0,
  AcDb_kFaceSubentType                        = TAcDb_SubentType(1);          // kFaceSubentType      = 1,
  AcDb_kEdgeSubentType                        = TAcDb_SubentType(2);          // kEdgeSubentType    = 2,
  AcDb_kVertexSubentType                      = TAcDb_SubentType(3);          // kVertexSubentType  = 3,

////////////////////////////////////////////////////////////
//
// Mline specific type                 //
//
  // kMlineSubentCache = 4        //  Beauty is in the eye
//   of the beholder.
//
////////////////////////////////////////////////////////////

  // };

  // typedef Adesk::UInt32    GeomId;
  // enum  {
  AcDb_kNoGeom                              = TAcDb_GeomId(0);                // kNoGeom = 0 };

  // enum GeomType  {
  AcDb_kInvalidGeom                         = TAcDb_GeomType(0);              // kInvalidGeom = 0,
  AcDb_kPointGeom                           = TAcDb_GeomType(1);              // kPointGeom,
  AcDb_kLineGeom                            = TAcDb_GeomType(2);              // kLineGeom,
  AcDb_kCircleGeom                          = TAcDb_GeomType(3);              // kCircleGeom,
  AcDb_kPlaneGeom                           = TAcDb_GeomType(4);              // kPlaneGeom };

  // enum FilerType  {
  AcDb_kFileFiler                           = TAcDb_FilerType(0);             // kFileFiler       = 0,
  AcDb_kCopyFiler                           = TAcDb_FilerType(1);             // kCopyFiler         = 1,
  AcDb_kUndoFiler                           = TAcDb_FilerType(2);             // kUndoFiler         = 2,
  AcDb_kBagFiler                            = TAcDb_FilerType(3);             // kBagFiler          = 3,
  AcDb_kIdXlateFiler                        = TAcDb_FilerType(4);             // kIdXlateFiler      = 4,
  AcDb_kPageFiler                           = TAcDb_FilerType(5);             // kPageFiler         = 5,
  AcDb_kDeepCloneFiler                      = TAcDb_FilerType(6);             // kDeepCloneFiler    = 6,
  AcDb_kIdFiler                             = TAcDb_FilerType(7);             // kIdFiler           = 7,
  AcDb_kPurgeFiler                          = TAcDb_FilerType(8);             // kPurgeFiler        = 8,
  AcDb_kWblockCloneFiler                    = TAcDb_FilerType(9);             // kWblockCloneFiler  = 9 };

  // enum FilerSeekType  {
  AcDb_kSeekFromStart                       =  TAcDb_FilerSeekType(0);        // kSeekFromStart   = 0,
  AcDb_kSeekFromCurrent                     =  TAcDb_FilerSeekType(1);        // kSeekFromCurrent = 1,
  AcDb_kSeekFromEnd                         =  TAcDb_FilerSeekType(2);        // kSeekFromEnd     = 2 };

  // enum AcDbDwgVersion  {
  AcDb_kDHL_MC0_0                           = TAcDb_AcDbDwgVersion(0);        // kDHL_MC0_0   = 0,
  AcDb_kDHL_AC1_2                           = TAcDb_AcDbDwgVersion(1);        // kDHL_AC1_2   = 1,
  AcDb_kDHL_AC1_40                          = TAcDb_AcDbDwgVersion(2);        // kDHL_AC1_40  = 2,
  AcDb_kDHL_AC1_50                          = TAcDb_AcDbDwgVersion(3);        // kDHL_AC1_50  = 3,
  AcDb_kDHL_AC2_20                          = TAcDb_AcDbDwgVersion(4);        // kDHL_AC2_20  = 4,
  AcDb_kDHL_AC2_10                          = TAcDb_AcDbDwgVersion(5);        // kDHL_AC2_10  = 5,
  AcDb_kDHL_AC2_21                          = TAcDb_AcDbDwgVersion(6);        // kDHL_AC2_21  = 6,
  AcDb_kDHL_AC2_22                          = TAcDb_AcDbDwgVersion(7);        // kDHL_AC2_22  = 7,
  AcDb_kDHL_1001                            = TAcDb_AcDbDwgVersion(8);        // kDHL_1001    = 8,
  AcDb_kDHL_1002                            = TAcDb_AcDbDwgVersion(9);        // kDHL_1002    = 9,      // AutoCAD 2.5
  AcDb_kDHL_1003                            = TAcDb_AcDbDwgVersion(10);       // kDHL_1003    = 10,     // AutoCAD 2.6
  AcDb_kDHL_1004                            = TAcDb_AcDbDwgVersion(11);       // kDHL_1004    = 11,     // Release 9
  AcDb_kDHL_1005                            = TAcDb_AcDbDwgVersion(12);       // kDHL_1005    = 12,
  AcDb_kDHL_1006                            = TAcDb_AcDbDwgVersion(13);       // kDHL_1006    = 13,     // Release 10
  AcDb_kDHL_1007                            = TAcDb_AcDbDwgVersion(14);       // kDHL_1007    = 14,
  AcDb_kDHL_1008                            = TAcDb_AcDbDwgVersion(15);       // kDHL_1008    = 15,
  AcDb_kDHL_1009                            = TAcDb_AcDbDwgVersion(16);       // kDHL_1009    = 16,     // R11 and R12
  AcDb_kDHL_1010                            = TAcDb_AcDbDwgVersion(17);       // kDHL_1010    = 17,
  AcDb_kDHL_1011                            = TAcDb_AcDbDwgVersion(18);       // kDHL_1011    = 18,
  AcDb_kDHL_1012                            = TAcDb_AcDbDwgVersion(19);       // kDHL_1012    = 19,     // R13
  AcDb_kDHL_1013                            = TAcDb_AcDbDwgVersion(20);       // kDHL_1013    = 20,     // R14 mid version.
  AcDb_kDHL_1014                            = TAcDb_AcDbDwgVersion(21);       // kDHL_1014    = 21,     // R14 final version.
  AcDb_kDHL_1500                            = TAcDb_AcDbDwgVersion(22);       // kDHL_1500    = 22,     // R15 development (Tahoe)
  AcDb_kDHL_1015                            = TAcDb_AcDbDwgVersion(23);       // kDHL_1015    = 23,     // R15 final version.
  AcDb_kDHL_CURRENT                         = TAcDb_AcDbDwgVersion(23);       // kDHL_CURRENT = kDHL_1015,
  AcDb_kDHL_Unknown                         = TAcDb_AcDbDwgVersion(32766);    // kDHL_Unknown = 32766,
  AcDb_kDHL_Max                             = TAcDb_AcDbDwgVersion(32767);    // kDHL_Max     = 32767 };

// kDHL_1012, kMRelease0 = R13c0-3
// kDHL_1012, kMRelease1 = R13c0-3
// kDHL_1012, kMRelease4 = R13c4
// kDHL_1012, kMRelease5 = R13c4_m
// kDHL_1012, kMRelease6 = R13c4a
  //
// kDHL_1013, kMRelease0 = Sedona s000..s045
// kDHL_1013, kMRelease1 = Sedona s046..s050
// kDHL_1013, kMRelease2 = Sedona s051..s052
// kDHL_1013, kMRelease3 = Sedona s053..s054
// kDHL_1013, kMRelease4 = Sedona s055..s059
// kDHL_1013, kMRelease5 = Sedona s060..s063
// kDHL_1013, kMRelease6 = Sedona s064..
// kDHL_1014, kMRelease0 = R14.0
  //
// kDHL_1500, kMRelease0  = Tahoe t010..t016
// kDHL_1500, kMRelease1  = Tahoe t017
// kDHL_1500, kMRelease2  = Tahoe t018, t019
// kDHL_1500, kMRelease3  = Tahoe t020
// kDHL_1500, kMRelease4  = Tahoe t021..t023
// kDHL_1500, kMRelease5  = Tahoe t024
// kDHL_1500, kMRelease6  = Tahoe t025..t027
// kDHL_1500, kMRelease7  = Tahoe t028
// kDHL_1500, kMRelease8  = Tahoe t029
// kDHL_1500, kMRelease9  = Tahoe t030
// kDHL_1500, kMRelease10 = Tahoe t031..t033
// kDHL_1500, kMRelease11 = Tahoe t034
// kDHL_1500, kMRelease12 = Tahoe t035..t036
// kDHL_1500, kMRelease13 = Tahoe t037..t038
// kDHL_1500, kMRelease14 = Tahoe t039
// kDHL_1500, kMRelease15 = Tahoe t040..t041
// kDHL_1500, kMRelease17 = Tahoe t042
// kDHL_1500, kMRelease20 = Tahoe t047
// kDHL_1500, kMRelease21 = Tahoe t048
// kDHL_1500, kMRelease22 = Tahoe t049..t050
// kDHL_1500, kMRelease23 = Tahoe t051
// kDHL_1500, kMRelease24 = Tahoe t052..t053
// kDHL_1500, kMRelease25 = Tahoe t054
// kDHL_1500, kMRelease26 = Tahoe t055
// kDHL_1500, kMRelease27 = Tahoe t056
// kDHL_1500, kMRelease28 = not used
// kDHL_1500, kMRelease29 = Tahoe t057
// kDHL_1500, kMRelease30 = Tahoe t058
// kDHL_1500, kMRelease31 = Tahoe t059
// kDHL_1500, kMRelease32 = Tahoe t060
// kDHL_1500, kMRelease33 = Tahoe t061
// kDHL_1500, kMRelease34 = Tahoe t062..t063
// kDHL_1500, kMRelease35 = Tahoe t064
// kDHL_1500, kMRelease36 = Tahoe t065
// kDHL_1500, kMRelease37 = Tahoe t066
// kDHL_1500, kMRelease38 = Tahoe t067
// kDHL_1500, kMRelease39 = Tahoe t068
// kDHL_1500, kMRelease40 = Tahoe t069..t070 (fmt changed, tho this didn't)
// kDHL_1500, kMRelease41 = Tahoe t071
// kDHL_1500, kMRelease42 = Tahoe t072
// kDHL_1500, kMRelease43 = Tahoe t073
// kDHL_1500, kMRelease44 = Tahoe t074
// kDHL_1500, kMRelease45 = Tahoe t075..t077
// kDHL_1500, kMRelease46 = Tahoe t078
// kDHL_1015, kMRelease0  = Tahoe t079..t080
// kDHL_1015, kMRelease1  = Tahoe t081..t083
// kDHL_1015, kMRelease2  = Tahoe t084..t086
// kDHL_1015, kMRelease3  = Tahoe t087..t088
// kDHL_1015, kMRelease4  = Tahoe t089..

  // enum MaintenanceReleaseVersion  {
  AcDb_kMRelease0                           = TAcDb_MaintenanceReleaseVersion(0);       // kMRelease0         = 0,
  AcDb_kMRelease1                           = TAcDb_MaintenanceReleaseVersion(1);       // kMRelease1         = 1,
  AcDb_kMRelease2                           = TAcDb_MaintenanceReleaseVersion(2);       // kMRelease2         = 2,
  AcDb_kMRelease3                           = TAcDb_MaintenanceReleaseVersion(3);       // kMRelease3         = 3,
  AcDb_kMRelease4                           = TAcDb_MaintenanceReleaseVersion(4);       // kMRelease4         = 4,
  AcDb_kMRelease5                           = TAcDb_MaintenanceReleaseVersion(5);       // kMRelease5         = 5,
  AcDb_kMRelease6                           = TAcDb_MaintenanceReleaseVersion(6);       // kMRelease6         = 6,
  AcDb_kMRelease7                           = TAcDb_MaintenanceReleaseVersion(7);       // kMRelease7         = 7,
  AcDb_kMRelease8                           = TAcDb_MaintenanceReleaseVersion(8);       // kMRelease8         = 8,
  AcDb_kMRelease9                           = TAcDb_MaintenanceReleaseVersion(9);       // kMRelease9         = 9,
  AcDb_kMRelease10                          = TAcDb_MaintenanceReleaseVersion(10);      // kMRelease10        = 10,
  AcDb_kMRelease11                          = TAcDb_MaintenanceReleaseVersion(11);      // kMRelease11        = 11,
  AcDb_kMRelease12                          = TAcDb_MaintenanceReleaseVersion(12);      // kMRelease12        = 12,
  AcDb_kMRelease13                          = TAcDb_MaintenanceReleaseVersion(13);      // kMRelease13        = 13,
  AcDb_kMRelease14                          = TAcDb_MaintenanceReleaseVersion(14);      // kMRelease14        = 14,
  AcDb_kMRelease15                          = TAcDb_MaintenanceReleaseVersion(15);      // kMRelease15        = 15,
  AcDb_kMRelease16                          = TAcDb_MaintenanceReleaseVersion(16);      // kMRelease16        = 16,
  AcDb_kMRelease17                          = TAcDb_MaintenanceReleaseVersion(17);      // kMRelease17        = 17,
  AcDb_kMRelease18                          = TAcDb_MaintenanceReleaseVersion(18);      // kMRelease18        = 18,
  AcDb_kMRelease19                          = TAcDb_MaintenanceReleaseVersion(19);      // kMRelease19        = 19,
  AcDb_kMRelease20                          = TAcDb_MaintenanceReleaseVersion(20);      // kMRelease20        = 20,
  AcDb_kMRelease21                          = TAcDb_MaintenanceReleaseVersion(21);      // kMRelease21        = 21,
  AcDb_kMRelease22                          = TAcDb_MaintenanceReleaseVersion(22);      // kMRelease22        = 22,
  AcDb_kMRelease23                          = TAcDb_MaintenanceReleaseVersion(23);      // kMRelease23        = 23,
  AcDb_kMRelease24                          = TAcDb_MaintenanceReleaseVersion(24);      // kMRelease24        = 24,
  AcDb_kMRelease25                          = TAcDb_MaintenanceReleaseVersion(25);      // kMRelease25        = 25,
  AcDb_kMRelease26                          = TAcDb_MaintenanceReleaseVersion(26);      // kMRelease26        = 26,
  AcDb_kMRelease27                          = TAcDb_MaintenanceReleaseVersion(27);      // kMRelease27        = 27,
  AcDb_kMRelease28                          = TAcDb_MaintenanceReleaseVersion(28);      // kMRelease28        = 28,
  AcDb_kMRelease29                          = TAcDb_MaintenanceReleaseVersion(29);      // kMRelease29        = 29,
  AcDb_kMRelease30                          = TAcDb_MaintenanceReleaseVersion(30);      // kMRelease30        = 30,
  AcDb_kMRelease31                          = TAcDb_MaintenanceReleaseVersion(31);      // kMRelease31        = 31,
  AcDb_kMRelease32                          = TAcDb_MaintenanceReleaseVersion(32);      // kMRelease32        = 32,
  AcDb_kMRelease33                          = TAcDb_MaintenanceReleaseVersion(33);      // kMRelease33        = 33,
  AcDb_kMRelease34                          = TAcDb_MaintenanceReleaseVersion(34);      // kMRelease34        = 34,
  AcDb_kMRelease35                          = TAcDb_MaintenanceReleaseVersion(35);      // kMRelease35        = 35,
  AcDb_kMRelease36                          = TAcDb_MaintenanceReleaseVersion(36);      // kMRelease36        = 36,
  AcDb_kMRelease37                          = TAcDb_MaintenanceReleaseVersion(37);      // kMRelease37        = 37,
  AcDb_kMRelease38                          = TAcDb_MaintenanceReleaseVersion(38);      // kMRelease38        = 38,
  AcDb_kMRelease39                          = TAcDb_MaintenanceReleaseVersion(39);      // kMRelease39        = 39,
  AcDb_kMRelease40                          = TAcDb_MaintenanceReleaseVersion(40);      // kMRelease40        = 40,
  AcDb_kMRelease41                          = TAcDb_MaintenanceReleaseVersion(41);      // kMRelease41        = 41,
  AcDb_kMRelease42                          = TAcDb_MaintenanceReleaseVersion(41);      // kMReleaseFirstValid1500 = kMRelease41,
  AcDb_kMRelease43                          = TAcDb_MaintenanceReleaseVersion(42);      // kMRelease42        = 42,
  AcDb_kMRelease44                          = TAcDb_MaintenanceReleaseVersion(43);      // kMRelease43        = 43,
  AcDb_kMRelease45                          = TAcDb_MaintenanceReleaseVersion(44);      // kMRelease44        = 44,
  AcDb_kMRelease46                          = TAcDb_MaintenanceReleaseVersion(45);      // kMRelease45        = 45,
  AcDb_kMRelease47                          = TAcDb_MaintenanceReleaseVersion(46);      // kMRelease46        = 46,
  AcDb_kMRelease48                          = TAcDb_MaintenanceReleaseVersion(47);      // kMRelease47        = 47,
  AcDb_kMRelease49                          = TAcDb_MaintenanceReleaseVersion(48);      // kMRelease48        = 48,
  AcDb_kMRelease50                          = TAcDb_MaintenanceReleaseVersion(49);      // kMRelease49        = 49,
  AcDb_kMRelease51                          = TAcDb_MaintenanceReleaseVersion(4);       // kMReleaseCurrent   = kMRelease4,
  AcDb_kMRelease52                          = TAcDb_MaintenanceReleaseVersion(126);     // kMReleaseUnknown   = 126,
  AcDb_kMRelease53                          = TAcDb_MaintenanceReleaseVersion(127);     // kMReleaseMax       = 127 };

  // enum SaveType  {
  AcDb_kNoSave                              = TAcDb_SaveType(0);              // kNoSave = 0,
  AcDb_kR12Save                             = TAcDb_SaveType(1);              // kR12Save,
  AcDb_kR13Save                             = TAcDb_SaveType(2);              // kR13Save,
  AcDb_kR14Save                             = TAcDb_SaveType(3);              // kR14Save };

  // enum GroupOperType  {
  AcDb_kNoOp                                = TAcDb_GroupOperType(0);         // kNoOp           = 0,
  AcDb_kAdd                                 = TAcDb_GroupOperType(1);         // kAdd            = 1,
  AcDb_kRemove                              = TAcDb_GroupOperType(2);         // kRemove         = 2,
  AcDb_kRename                              = TAcDb_GroupOperType(3);         // kRename         = 3,
  AcDb_kOrdered                             = TAcDb_GroupOperType(4);         // kOrdered        = 4,       // Members reordered
  AcDb_kGrpDesc                             = TAcDb_GroupOperType(5);         // kGrpDesc        = 5,       // Description Modified
  AcDb_kSelect                              = TAcDb_GroupOperType(6);         // kSelect         = 6,       // Selectibility flag
  AcDb_kCreate                              = TAcDb_GroupOperType(7);         // kCreate         = 7,       // New group creation
  AcDb_kPrepend                             = TAcDb_GroupOperType(8);         // kPrepend        = 8,
  AcDb_kInsert                              = TAcDb_GroupOperType(9);         // kInsert         = 9,
  AcDb_kGrpFlags                            = TAcDb_GroupOperType(10);        // kGrpFlags       = 10 };

// kDcInsert     => Database INSERT in which entities from the source
//                  database could be moved into the destination database.
// kDcInsertCopy => Database INSERT in which the source database is left
//                  intact. Objects are copied to the destination database.

  // enum DeepCloneType  {
  AcDb_kDcCopy                              = TAcDb_DeepCloneType(0);         // kDcCopy           = 0,
  AcDb_kDcExplode                           = TAcDb_DeepCloneType(1);         // kDcExplode        = 1,
  AcDb_kDcBlock                             = TAcDb_DeepCloneType(2);         // kDcBlock          = 2,
  AcDb_kDcXrefBind                          = TAcDb_DeepCloneType(3);         // kDcXrefBind       = 3,
  AcDb_kDcSymTableMerge                     = TAcDb_DeepCloneType(4);         // kDcSymTableMerge  = 4,
  AcDb_kDcInsert                            = TAcDb_DeepCloneType(6);         // kDcInsert         = 6,
  AcDb_kDcWblock                            = TAcDb_DeepCloneType(7);         // kDcWblock         = 7,
  AcDb_kDcObjects                           = TAcDb_DeepCloneType(8);         // kDcObjects        = 8,
  AcDb_kDcXrefInsert                        = TAcDb_DeepCloneType(9);         // kDcXrefInsert     = 9,
  AcDb_kDcInsertCopy                        = TAcDb_DeepCloneType(10);        // kDcInsertCopy     = 10,
  AcDb_kDcWblkObjects                       = TAcDb_DeepCloneType(11);        // kDcWblkObjects    = 11 };

// Handling for duplicate Symbol and Dictionary records

  // enum DuplicateRecordCloning {
  AcDb_kDrcNotApplicable                    = TAcDb_DuplicateRecordCloning(0);        // kDrcNotApplicable  = 0,
  AcDb_kDrcIgnore                           = TAcDb_DuplicateRecordCloning(1);        // kDrcIgnore         = 1,   // Keep existing
  AcDb_kDrcReplace                          = TAcDb_DuplicateRecordCloning(2);        // kDrcReplace        = 2,   // Use clone
  AcDb_kDrcXrefMangleName                   = TAcDb_DuplicateRecordCloning(3);        // kDrcXrefMangleName = 3,   // <xref>$0$<name>
  AcDb_kDrcMangleName                       = TAcDb_DuplicateRecordCloning(4);        // kDrcMangleName     = 4,   // $0$<name>
  AcDb_kDrcUnmangleName                     = TAcDb_DuplicateRecordCloning(5);        // kDrcUnmangleName   = 5 };

  // enum XrefStatus {
  AcDb_kXrfNotAnXref                        = TAcDb_XrefStatus(0);            // kXrfNotAnXref     = 0,
  AcDb_kXrfResolved                         = TAcDb_XrefStatus(1);            // kXrfResolved      = 1,
  AcDb_kXrfUnloaded                         = TAcDb_XrefStatus(2);            // kXrfUnloaded      = 2,
  AcDb_kXrfUnreferenced                     = TAcDb_XrefStatus(3);            // kXrfUnreferenced  = 3,
  AcDb_kXrfFileNotFound                     = TAcDb_XrefStatus(4);            // kXrfFileNotFound  = 4,
  AcDb_kXrfUnresolved                       = TAcDb_XrefStatus(5);            // kXrfUnresolved    = 5 };

  // enum MeasurementValue {
  AcDb_kEnglish                             = TAcDb_MeasurementValue(0);      // kEnglish = 0,
  AcDb_kMetric                              = TAcDb_MeasurementValue(1);      // kMetric  = 1, };

  // enum UnitsValue {
  AcDb_kUnitsUndefined                      = TAcDb_UnitsValue(0);            // kUnitsUndefined     = 0,
  AcDb_kUnitsInches                         = TAcDb_UnitsValue(1);            // kUnitsInches        = 1,
  AcDb_kUnitsFeet                           = TAcDb_UnitsValue(2);            // kUnitsFeet          = 2,
  AcDb_kUnitsMiles                          = TAcDb_UnitsValue(3);            // kUnitsMiles         = 3,
  AcDb_kUnitsMillimeters                    = TAcDb_UnitsValue(4);            // kUnitsMillimeters   = 4,
  AcDb_kUnitsCentimeters                    = TAcDb_UnitsValue(5);            // kUnitsCentimeters   = 5,
  AcDb_kUnitsMeters                         = TAcDb_UnitsValue(6);            // kUnitsMeters        = 6,
  AcDb_kUnitsKilometers                     = TAcDb_UnitsValue(7);            // kUnitsKilometers    = 7,
  AcDb_kUnitsMicroinches                    = TAcDb_UnitsValue(8);            // kUnitsMicroinches   = 8,
  AcDb_kUnitsMils                           = TAcDb_UnitsValue(9);            // kUnitsMils          = 9,
  AcDb_kUnitsYards                          = TAcDb_UnitsValue(10);           // kUnitsYards         = 10,
  AcDb_kUnitsAngstroms                      = TAcDb_UnitsValue(11);           // kUnitsAngstroms     = 11,
  AcDb_kUnitsNanometers                     = TAcDb_UnitsValue(12);           // kUnitsNanometers    = 12,
  AcDb_kUnitsMicrons                        = TAcDb_UnitsValue(13);           // kUnitsMicrons       = 13,
  AcDb_kUnitsDecimeters                     = TAcDb_UnitsValue(14);           // kUnitsDecimeters    = 14,
  AcDb_kUnitsDekameters                     = TAcDb_UnitsValue(15);           // kUnitsDekameters    = 15,
  AcDb_kUnitsHectometers                    = TAcDb_UnitsValue(16);           // kUnitsHectometers   = 16,
  AcDb_kUnitsGigameters                     = TAcDb_UnitsValue(17);           // kUnitsGigameters    = 17,
  AcDb_kUnitsAstronomical                   = TAcDb_UnitsValue(18);           // kUnitsAstronomical  = 18,
  AcDb_kUnitsLightYears                     = TAcDb_UnitsValue(19);           // kUnitsLightYears    = 19,
  AcDb_kUnitsParsecs                        = TAcDb_UnitsValue(20);           // kUnitsParsecs       = 20,
  AcDb_kUnitsMax                            = TAcDb_UnitsValue(20);           // kUnitsMax           = kUnitsParsecs, };

// lineweights are in 100ths of a millimeter

  // enum LineWeight  {
  AcDb_kLnWt000                             = TAcDb_LineWeight(0);            // kLnWt000          =   0,
  AcDb_kLnWt005                             = TAcDb_LineWeight(5);            // kLnWt005          =   5,
  AcDb_kLnWt009                             = TAcDb_LineWeight(9);            // kLnWt009          =   9,
  AcDb_kLnWt013                             = TAcDb_LineWeight(13);           // kLnWt013          =  13,
  AcDb_kLnWt015                             = TAcDb_LineWeight(15);           // kLnWt015          =  15,
  AcDb_kLnWt018                             = TAcDb_LineWeight(18);           // kLnWt018          =  18,
  AcDb_kLnWt020                             = TAcDb_LineWeight(20);           // kLnWt020          =  20,
  AcDb_kLnWt025                             = TAcDb_LineWeight(25);           // kLnWt025          =  25,
  AcDb_kLnWt030                             = TAcDb_LineWeight(30);           // kLnWt030          =  30,
  AcDb_kLnWt035                             = TAcDb_LineWeight(35);           // kLnWt035          =  35,
  AcDb_kLnWt040                             = TAcDb_LineWeight(40);           // kLnWt040          =  40,
  AcDb_kLnWt050                             = TAcDb_LineWeight(50);           // kLnWt050          =  50,
  AcDb_kLnWt053                             = TAcDb_LineWeight(53);           // kLnWt053          =  53,
  AcDb_kLnWt060                             = TAcDb_LineWeight(60);           // kLnWt060          =  60,
  AcDb_kLnWt070                             = TAcDb_LineWeight(70);           // kLnWt070          =  70,
  AcDb_kLnWt080                             = TAcDb_LineWeight(80);           // kLnWt080          =  80,
  AcDb_kLnWt090                             = TAcDb_LineWeight(90);           // kLnWt090          =  90,
  AcDb_kLnWt100                             = TAcDb_LineWeight(100);          // kLnWt100          = 100,
  AcDb_kLnWt106                             = TAcDb_LineWeight(106);          // kLnWt106          = 106,
  AcDb_kLnWt120                             = TAcDb_LineWeight(120);          // kLnWt120          = 120,
  AcDb_kLnWt140                             = TAcDb_LineWeight(140);          // kLnWt140          = 140,
  AcDb_kLnWt158                             = TAcDb_LineWeight(158);          // kLnWt158          = 158,
  AcDb_kLnWt200                             = TAcDb_LineWeight(200);          // kLnWt200          = 200,
  AcDb_kLnWt211                             = TAcDb_LineWeight(211);          // kLnWt211          = 211,
  AcDb_kLnWtByLayer                         = TAcDb_LineWeight(-1);           // kLnWtByLayer         = -1,
  AcDb_kLnWtByBlock                         = TAcDb_LineWeight(-2);           // kLnWtByBlock         = -2,
  AcDb_kLnWtByLwDefault                     = TAcDb_LineWeight(-3);           // kLnWtByLwDefault   = -3 };


  // enum EndCaps  {
  AcDb_kEndCapNone                          = TAcDb_EndCaps(0);               // kEndCapNone       =  0,
  AcDb_kEndCapRound                         = TAcDb_EndCaps(1);               // kEndCapRound      =  1,
  AcDb_kEndCapAngle                         = TAcDb_EndCaps(2);               // kEndCapAngle      =  2,
  AcDb_kEndCapSquare                        = TAcDb_EndCaps(3);               // kEndCapSquare     =  3 };

  // enum JoinStyle  {
  AcDb_kJnStylNone                          = TAcDb_JoinStyle(0);             // kJnStylNone       =  0,
  AcDb_kJnStylRound                         = TAcDb_JoinStyle(1);             // kJnStylRound      =  1,
  AcDb_kJnStylAngle                         = TAcDb_JoinStyle(2);             // kJnStylAngle      =  2,
  AcDb_kJnStylFlat                          = TAcDb_JoinStyle(3);             // kJnStylFlat       =  3 };

  // enum PlotStyleNameType {
  AcDb_kPlotStyleNameByLayer                = TAcDb_PlotStyleNameType(0);     // kPlotStyleNameByLayer       = 0,
  AcDb_kPlotStyleNameByBlock                = TAcDb_PlotStyleNameType(1);     // kPlotStyleNameByBlock       = 1,
  AcDb_kPlotStyleNameIsDictDefault          = TAcDb_PlotStyleNameType(2);     // kPlotStyleNameIsDictDefault = 2,
  AcDb_kPlotStyleNameById                   = TAcDb_PlotStyleNameType(3);     // kPlotStyleNameById          = 3 };

  // enum DimArrowFlags  {
  AcDb_kFirstArrow                          = TAcDb_DimArrowFlags($00);       // kFirstArrow  = 0x00,
  AcDb_kSecondArrow                         = TAcDb_DimArrowFlags($01);       // kSecondArrow = 0x01 };

  // enum DimblkFlags  {
  AcDb_kDimblk                              = TAcDb_DimblkFlags(0);           // kDimblk = 0,
  AcDb_kDimblk1                             = TAcDb_DimblkFlags(1);           // kDimblk1,
  AcDb_kDimblk2                             = TAcDb_DimblkFlags(2);           // kDimblk2,
  AcDb_kDimLdrBlk                           = TAcDb_DimblkFlags(3);           // kDimLdrBlk };

  // enum OrthographicView  {
  AcDb_kNonOrthoView                        = TAcDb_OrthographicView(0);      // kNonOrthoView = 0,
  AcDb_kTopView                             = TAcDb_OrthographicView(1);      // kTopView      = 1,
  AcDb_kBottomView                          = TAcDb_OrthographicView(2);      // kBottomView   = 2,
  AcDb_kFrontView                           = TAcDb_OrthographicView(3);      // kFrontView    = 3,
  AcDb_kBackView                            = TAcDb_OrthographicView(4);      // kBackView     = 4,
  AcDb_kLeftView                            = TAcDb_OrthographicView(5);      // kLeftView     = 5,
  AcDb_kRightView                           = TAcDb_OrthographicView(6);      // kRightView    = 6 };

  // enum VpFreezeOps  {
  AcDb_kFreeze                              = TAcDb_VpFreezeOps(0);           // kFreeze = 0,
  AcDb_kThaw                                = TAcDb_VpFreezeOps(1);           // kThaw,
  AcDb_kReset                               = TAcDb_VpFreezeOps(2);           // kReset };

// If adding to the following enum you must change the array in constant.cpp and the initialization string in constant.xmf.
  // enum reservedStringEnumType  {
  AcDb_kByLayer                             = TAcDb_reservedStringEnumType(0);  // kByLayer      = 0,
  AcDb_kByBlock                             = TAcDb_reservedStringEnumType(1);  // kByBlock      = 1,
  AcDb_kNone                                = TAcDb_reservedStringEnumType(2);  // kNone         = 2,
  AcDb_kContinuous                          = TAcDb_reservedStringEnumType(3);  // kContinuous   = 3,
  AcDb_kStandard                            = TAcDb_reservedStringEnumType(4);  // kStandard     = 4,
  AcDb_kNormal                              = TAcDb_reservedStringEnumType(5);  // kNormal       = 5,
  AcDb_kDefPoints                           = TAcDb_reservedStringEnumType(6);  // kDefPoints    = 6,
  AcDb_kDefault                             = TAcDb_reservedStringEnumType(7);  // kDefault      = 7,
  AcDb_kMissing                             = TAcDb_reservedStringEnumType(8);  // kMissing      = 8,
  AcDb_kByColor                             = TAcDb_reservedStringEnumType(9);  // kByColor      = 9,
  AcDb_kModel                               = TAcDb_reservedStringEnumType(10); // kModel        = 10,
  AcDb_kReservedStringCount                 = TAcDb_reservedStringEnumType(11); // kReservedStringCount };
  // };      // struct AcDb


// ***************************************************************************** AcDbLib/DBMSTYLE
const
  SH_DENYRW = $10;    // deny read/write mode
  SH_DENYWR = $20;    // deny write mode
  SH_DENYRD = $30;    // deny read mode
  SH_DENYNO = $40;    // deny none mode

  MSTYLE_NAME_LENGTH          = 32;   // #define MSTYLE_NAME_LENGTH 32
  MSTYLE_DESCRIPTION_LENGTH   = 256;  // #define MSTYLE_DESCRIPTION_LENGTH 256
  LTYPE_LENGTH                = 32;   // #define LTYPE_LENGTH 32
  MLINE_MAX_ELEMENTS          = 16;   // #define MLINE_MAX_ELEMENTS 16
// 10 degrees
  // #define MIN_ANGLE (10.0 * PI / 180.0)
// 170 degrees
  // #define MAX_ANGLE (170.0 * PI / 180.0)
  MSTYLE_DXF_FILL_ON          = $1;     // #define MSTYLE_DXF_FILL_ON           (0x1)
  MSTYLE_DXF_SHOW_MITERS      = $2;     // #define MSTYLE_DXF_SHOW_MITERS       (0x2)
  MSTYLE_DXF_START_SQUARE_CAP = $10;    // #define MSTYLE_DXF_START_SQUARE_CAP  (0x10)
  MSTYLE_DXF_START_INNER_ARCS = $20;    // #define MSTYLE_DXF_START_INNER_ARCS  (0x20)
  MSTYLE_DXF_START_ROUND_CAP  = $40;    // #define MSTYLE_DXF_START_ROUND_CAP   (0x40)
  MSTYLE_DXF_END_SQUARE_CAP   = $100;   // #define MSTYLE_DXF_END_SQUARE_CAP    (0x100)
  MSTYLE_DXF_END_INNER_ARCS   = $200;   // #define MSTYLE_DXF_END_INNER_ARCS    (0x200)
  MSTYLE_DXF_END_ROUND_CAP    = $400;   // #define MSTYLE_DXF_END_ROUND_CAP     (0x400)
  MSTYLE_DXF_JUST_TOP         = $1000;  // #define MSTYLE_DXF_JUST_TOP          (0x1000)
  MSTYLE_DXF_JUST_ZERO        = $2000;  // #define MSTYLE_DXF_JUST_ZERO         (0x2000)
  MSTYLE_DXF_JUST_BOT         = $4000;  // #define MSTYLE_DXF_JUST_BOT          (0x4000)



// ***************************************************************************** AcDbLib/DBAPSERV
type
  TAcSDIValues = Integer;
  TProdIdCode = Integer;
  TAcDbHostApplicationServices_FindFileHint = Integer;
  TAcDbHostApplicationServices_RemapFileContext = Integer;

const
  // enum  AcSDIValues {
  AcSDIValues_kMDIEnabled                   = TAcSDIValues(0);                // kMDIEnabled = 0,
  AcSDIValues_kSDIUserEnforced              = TAcSDIValues(1);                // kSDIUserEnforced,
  AcSDIValues_kSDIAppEnforced               = TAcSDIValues(2);                // kSDIAppEnforced,
  AcSDIValues_kSDIUserAndAppEnforced        = TAcSDIValues(3);                // kSDIUserAndAppEnforced };

  // enum ProdIdCode {
  ProdIdCode_kProd_ACAD                     = TProdIdCode(1);                 // kProd_ACAD = 1,
  ProdIdCode_kProd_LT                       = TProdIdCode(2);                 // kProd_LT,
  ProdIdCode_kProd_OEM                      = TProdIdCode(3);                 // kProd_OEM,
  ProdIdCode_kProd_AcDb                     = TProdIdCode(4);                 // kProd_AcDb };

  //class AcDbHostApplicationServices  // enum FindFileHint {
  AcDbHostApplicationServices_kDefault              = TAcDbHostApplicationServices_FindFileHint(0);     // kDefault = 0,
  AcDbHostApplicationServices_kFontFile             = TAcDbHostApplicationServices_FindFileHint(1);     // kFontFile,              // Could be either
  AcDbHostApplicationServices_kCompiledShapeFile    = TAcDbHostApplicationServices_FindFileHint(2);     // kCompiledShapeFile,     // shx
  AcDbHostApplicationServices_kTrueTypeFontFile     = TAcDbHostApplicationServices_FindFileHint(3);     // kTrueTypeFontFile,      // ttf
  AcDbHostApplicationServices_kEmbeddedImageFile    = TAcDbHostApplicationServices_FindFileHint(4);     // kEmbeddedImageFile,
  AcDbHostApplicationServices_kXRefDrawing          = TAcDbHostApplicationServices_FindFileHint(5);     // kXRefDrawing,
  AcDbHostApplicationServices_kPatternFile          = TAcDbHostApplicationServices_FindFileHint(6);     // kPatternFile,
  AcDbHostApplicationServices_kARXApplication       = TAcDbHostApplicationServices_FindFileHint(7);     // kARXApplication,
  AcDbHostApplicationServices_kFontMapFile          = TAcDbHostApplicationServices_FindFileHint(8);     // kFontMapFile };

  // class AcDbHostApplicationServices  //enum RemapFileContext {
  AcDbHostApplicationServicest_kDrawingOpen         = TAcDbHostApplicationServices_RemapFileContext(0); // kDrawingOpen,
  AcDbHostApplicationServices_kXrefResolution       = TAcDbHostApplicationServices_RemapFileContext(1); // kXrefResolution,
  AcDbHostApplicationServices_kRasterResolution     = TAcDbHostApplicationServices_RemapFileContext(2); // kRasterResolution };


// ***************************************************************************** AcDbLib/DBAUDITA
type
  TAcDbAuditInfo_AuditPass = Integer;

const
  //class AcDbAuditInfo  // enum AuditPass {
  PASS1                                     = TAcDbAuditInfo_AuditPass(1);    // PASS1 = 1,
  PASS2                                     = TAcDbAuditInfo_AuditPass(2);    // PASS2 = 2 };


// ***************************************************************************** AcDbLib/DBCOLOR
type
  TAcCmEntityColor_Color = Integer;
  TAcCmEntityColor_ColorMethod = Integer;
  TAcCmEntityColor_ACIcolorMethod = Integer;

  TRGBM = record                                  // union RGBM {
    case rgbtype: byte of
    0: (whole: TAdesk_UInt32);                          //   Adesk::UInt32    whole;
    1: (indirect: TAdesk_Int16);                        //   Adesk::Int16     indirect;
    2: (blue, green, red, colorMethod: TAdesk_UInt8);   //   struct { Adesk::UInt8 blue, green, red, colorMethod;};
  end;                                                    // };

const
  //class AcCmEntityColor  // enum Color {
  AcCmEntityColor_kRed                      = TAcCmEntityColor_Color(0);      // kRed,
  AcCmEntityColor_kGreen                    = TAcCmEntityColor_Color(1);      // kGreen,
  AcCmEntityColor_kBlue                     = TAcCmEntityColor_Color(2);      // kBlue  };

  // Color Method.
  //class AcCmEntityColor  // enum ColorMethod {
  AcCmEntityColor_kByLayer                  = TAcCmEntityColor_ColorMethod($C0);        // kByLayer =0xC0,
  AcCmEntityColor_kByBlock                  = TAcCmEntityColor_ColorMethod($C1);        // kByBlock,
  AcCmEntityColor_kByColor                  = TAcCmEntityColor_ColorMethod($C2);        // kByColor,
  AcCmEntityColor_kByACI                    = TAcCmEntityColor_ColorMethod($C3);        // kByACI,
  AcCmEntityColor_kByPen                    = TAcCmEntityColor_ColorMethod($C4);        // kByPen,
  AcCmEntityColor_kForeground               = TAcCmEntityColor_ColorMethod($C5);        // kForeground,
  AcCmEntityColor_CkLayerOff                = TAcCmEntityColor_ColorMethod($C6);        // kLayerOff,
// Run-time states
  AcCmEntityColor_kLayerFrozen              = TAcCmEntityColor_ColorMethod($C7);        // kLayerFrozen,
  AcCmEntityColor_kNone                     = TAcCmEntityColor_ColorMethod($C8);        // kNone };

  //class AcCmEntityColor  // enum ACIcolorMethod {
  AcCmEntityColor_kACIbyBlock               = TAcCmEntityColor_ACIcolorMethod(0);       // kACIbyBlock    = 0,
  AcCmEntityColor_kACIforeground            = TAcCmEntityColor_ACIcolorMethod(7);       // kACIforeground = 7,
  AcCmEntityColor_kACIbyLayer               = TAcCmEntityColor_ACIcolorMethod(256);     // kACIbyLayer    = 256,
// Run-time states
  AcCmEntityColor_kACIclear                 = TAcCmEntityColor_ACIcolorMethod(0);       // kACIclear      = 0,
  AcCmEntityColor_kACIstandard              = TAcCmEntityColor_ACIcolorMethod(7);       // kACIstandard   = 7,
  AcCmEntityColor_kACImaximum               = TAcCmEntityColor_ACIcolorMethod(255);     // kACImaximum    = 255,
  AcCmEntityColor_kACInone                  = TAcCmEntityColor_ACIcolorMethod(257);     // kACInone       = 257,
  AcCmEntityColor_kACIfrozenLayer           = TAcCmEntityColor_ACIcolorMethod(-32700);  // kACIfrozenLayer= -32700 };

// ***************************************************************************** AcDbLib/DBDATE
type
  TAcDbDate_InitialValue = Integer;

const
  //class AcDbDate  // enum InitialValue {
  AcDbDate_kInitZero                        = TAcDbDate_InitialValue(1);      // kInitZero          = 1,
  AcDbDate_kInitLocalTime                   = TAcDbDate_InitialValue(2);      // kInitLocalTime     = 2,
  AcDbDate_kInitUniversalTime               = TAcDbDate_InitialValue(3);      // kInitUniversalTime = 3 };



// ***************************************************************************** AcDbLib/DBENTS
type
  TAcDbViewport_StandardScaleType = Integer;

const
  //class AcDbViewport: public AcDbEntity   // enum StandardScaleType {
  AcDbViewport_kScaleToFit                  = TAcDbViewport_StandardScaleType(0);       // kScaleToFit,                  // Scaled to Fit
  AcDbViewport_kCustomScale                 = TAcDbViewport_StandardScaleType(1);       // kCustomScale,                 // Scale is not a standard scale
  AcDbViewport_k1_1                         = TAcDbViewport_StandardScaleType(2);       // k1_1,                         // 1:1
  AcDbViewport_k1_2                         = TAcDbViewport_StandardScaleType(3);       // k1_2,                         // 1:2
  AcDbViewport_k1_4                         = TAcDbViewport_StandardScaleType(4);       // k1_4,                         // 1:4
  AcDbViewport_k1_8                         = TAcDbViewport_StandardScaleType(5);       // k1_8,                         // 1:8
  AcDbViewport_k1_10                        = TAcDbViewport_StandardScaleType(6);       // k1_10,                        // 1:10
  AcDbViewport_k1_16                        = TAcDbViewport_StandardScaleType(7);       // k1_16,                        // 1:16
  AcDbViewport_k1_20                        = TAcDbViewport_StandardScaleType(9);       // k1_20,                        // 1:20
  AcDbViewport_k1_30                        = TAcDbViewport_StandardScaleType(10);      // k1_30,                        // 1:30
  AcDbViewport_k1_40                        = TAcDbViewport_StandardScaleType(11);      // k1_40,                        // 1:40
  AcDbViewport_k1_50                        = TAcDbViewport_StandardScaleType(12);      // k1_50,                        // 1:50
  AcDbViewport_k1_100                       = TAcDbViewport_StandardScaleType(13);      // k1_100,                       // 1:100
  AcDbViewport_k2_1                         = TAcDbViewport_StandardScaleType(14);      // k2_1,                         // 2:1
  AcDbViewport_k4_1                         = TAcDbViewport_StandardScaleType(15);      // k4_1,                         // 4:1
  AcDbViewport_k8_1                         = TAcDbViewport_StandardScaleType(16);      // k8_1,                         // 8:1
  AcDbViewport_k10_1                        = TAcDbViewport_StandardScaleType(17);      // k10_1,                        // 10:1
  AcDbViewport_k100_1                       = TAcDbViewport_StandardScaleType(18);      // k100_1,                       // 100:1
  AcDbViewport_k1_128in_1ft                 = TAcDbViewport_StandardScaleType(19);      // k1_128in_1ft,                 // 1/128"= 1'
  AcDbViewport_k1_64in_1ft                  = TAcDbViewport_StandardScaleType(20);      // k1_64in_1ft,                  // 1/64"= 1'
  AcDbViewport_k1_32in_1ft                  = TAcDbViewport_StandardScaleType(21);      // k1_32in_1ft,                  // 1/32"= 1'
  AcDbViewport_k1_16in_1ft                  = TAcDbViewport_StandardScaleType(22);      // k1_16in_1ft,                  // 1/16"= 1'
  AcDbViewport_k3_32in_1ft                  = TAcDbViewport_StandardScaleType(23);      // k3_32in_1ft,                  // 3/32"= 1'
  AcDbViewport_k1_8in_1ft                   = TAcDbViewport_StandardScaleType(24);      // k1_8in_1ft,                   // 1/8" = 1'
  AcDbViewport_k3_16in_1ft                  = TAcDbViewport_StandardScaleType(25);      // k3_16in_1ft,                  // 3/16"= 1'
  AcDbViewport_k1_4in_1ft                   = TAcDbViewport_StandardScaleType(26);      // k1_4in_1ft,                   // 1/4" = 1'
  AcDbViewport_k3_8in_1ft                   = TAcDbViewport_StandardScaleType(27);      // k3_8in_1ft,                   // 3/8" = 1'
  AcDbViewport_k1_2in_1ft                   = TAcDbViewport_StandardScaleType(28);      // k1_2in_1ft,                   // 1/2" = 1'
  AcDbViewport_k3_4in_1ft                   = TAcDbViewport_StandardScaleType(29);      // k3_4in_1ft,                   // 3/4" = 1'
  AcDbViewport_k1in_1ft                     = TAcDbViewport_StandardScaleType(30);      // k1in_1ft,                     // 1"= 1'
  AcDbViewport_k3in_1ft                     = TAcDbViewport_StandardScaleType(31);      // k3in_1ft,                     // 3"= 1'
  AcDbViewport_k6in_1ft                     = TAcDbViewport_StandardScaleType(32);      // k6in_1ft,                     // 6"= 1'
  AcDbViewport_k1ft_1ft                     = TAcDbViewport_StandardScaleType(33);      // k1ft_1ft                      // 1'= 1'  };


// ***************************************************************************** AcDbLib/DBHATCH
type
  TAcDbHatch_HatchLoopType = Integer;
  TAcDbHatch_HatchEdgeType = Integer;
  TAcDbHatch_HatchPatternType = Integer;
  TAcDbHatch_HatchStyle = Integer;

const
  //class AcDbHatch: public AcDbEntity    // enum HatchLoopType {
  AcDbHatch_kDefault                        = TAcDbHatch_HatchLoopType(0);    // kDefault            = 0,
  AcDbHatch_kExternal                       = TAcDbHatch_HatchLoopType(1);    // kExternal           = 1,
  AcDbHatch_kPolyline                       = TAcDbHatch_HatchLoopType(2);    // kPolyline           = 2,
  AcDbHatch_kDerived                        = TAcDbHatch_HatchLoopType(4);    // kDerived            = 4,
  AcDbHatch_kTextbox                        = TAcDbHatch_HatchLoopType(8);    // kTextbox            = 8,
  AcDbHatch_kOutermost                      = TAcDbHatch_HatchLoopType($10);  // kOutermost        = 0x10,
  AcDbHatch_kNotClosed                      = TAcDbHatch_HatchLoopType($20);  // kNotClosed        = 0x20,
  AcDbHatch_kSelfIntersecting               = TAcDbHatch_HatchLoopType($40);  // kSelfIntersecting = 0x40,
  AcDbHatch_kTextIsland                     = TAcDbHatch_HatchLoopType($80);  // kTextIsland       = 0x80  };

  //class AcDbHatch: public AcDbEntity    // enum HatchEdgeType {
  AcDbHatch_kLine                           = TAcDbHatch_HatchEdgeType(1);    // kLine             = 1,
  AcDbHatch_kCirArc                         = TAcDbHatch_HatchEdgeType(2);    // kCirArc           = 2,
  AcDbHatch_kEllArc                         = TAcDbHatch_HatchEdgeType(3);    // kEllArc           = 3,
  AcDbHatch_kSpline                         = TAcDbHatch_HatchEdgeType(4);    // kSpline           = 4 };

  //class AcDbHatch: public AcDbEntity    // enum HatchPatternType {
  AcDbHatch_kUserDefined                    = TAcDbHatch_HatchPatternType(0); // kUserDefined      = 0,
  AcDbHatch_kPreDefined                     = TAcDbHatch_HatchPatternType(1); // kPreDefined       = 1,
  AcDbHatch_kCustomDefined                  = TAcDbHatch_HatchPatternType(2); // kCustomDefined    = 2 };

  //class AcDbHatch: public AcDbEntity    // enum HatchStyle {
  AcDbHatch_kNormal                         = TAcDbHatch_HatchStyle(0);       // kNormal      = 0,
  AcDbHatch_kOuter                          = TAcDbHatch_HatchStyle(1);       // kOuter       = 1,
  AcDbHatch_HatchStyle_kIgnore              = TAcDbHatch_HatchStyle(2);       // kIgnore      = 2 };


// ***************************************************************************** AcDbLib/DBINDEX
type
  TAcDbIndexUpdateData_UpdateFlags = Integer;

const
  //class AcDbIndexUpdateData   // enum UpdateFlags { // kModified and kDeleted are READ ONLY.
  AcDbIndexUpdateData_kModified             = TAcDbIndexUpdateData_UpdateFlags(1);              // kModified   = 1,   //
  AcDbIndexUpdateData_kDeleted              = TAcDbIndexUpdateData_UpdateFlags(2);              // kDeleted    = 2,   // kDeleted is somewhat redundant with  AcDbObject::isErased()
// except that it also accounts for uncreated objects, and does not force an object to be paged in.
// These two are writable. They are for application use.
  AcDbIndexUpdateData_kProcessed            = TAcDbIndexUpdateData_UpdateFlags(4);              // kProcessed  = 4,   // kProcessed can be used to avoid rexamining an id.
  AcDbIndexUpdateData_kUnknownKey           = TAcDbIndexUpdateData_UpdateFlags(8);              // kUnknownKey = 8    // kUnknownKey is used, for example, to denote unknown extents when building the spatial ind.
// The remaining bits can be used by applications as they wish.  (Bits 3- 7). };


// ***************************************************************************** AcDbLib/DBJIG
type
  TAcEdJig_UserInputControls = Integer;
  TAcEdJig_DragStatus = Integer;
  TAcEdJig_CursorType = Integer;

const
  //class AcEdJig: public AcRxObject    // typedef enum UserInputControls {
  AcEdJig_kGovernedByOrthoMode              = TAcEdJig_UserInputControls($0001);      // kGovernedByOrthoMode         = 0x0001, //Non-operational.  Will be removed in future release
  AcEdJig_kNullResponseAccepted             = TAcEdJig_UserInputControls($0002);      // kNullResponseAccepted        = 0x0002,
  AcEdJig_kDontEchoCancelForCtrlC           = TAcEdJig_UserInputControls($0004);      // kDontEchoCancelForCtrlC      = 0x0004,
  AcEdJig_kDontUpdateLastPoint              = TAcEdJig_UserInputControls($0008);      // kDontUpdateLastPoint         = 0x0008,
  AcEdJig_kNoDwgLimitsChecking              = TAcEdJig_UserInputControls($0010);      // kNoDwgLimitsChecking         = 0x0010,
  AcEdJig_kNoZeroResponseAccepted           = TAcEdJig_UserInputControls($0020);      // kNoZeroResponseAccepted      = 0x0020,
  AcEdJig_kNoNegativeResponseAccepted       = TAcEdJig_UserInputControls($0040);      // kNoNegativeResponseAccepted  = 0x0040,
  AcEdJig_kAccept3dCoordinates              = TAcEdJig_UserInputControls($0080);      // kAccept3dCoordinates         = 0x0080,
  AcEdJig_kAcceptMouseUpAsPoint             = TAcEdJig_UserInputControls($0100);      // kAcceptMouseUpAsPoint        = 0x0100,
  AcEdJig_kAnyBlankTerminatesInput          = TAcEdJig_UserInputControls($0200);      // kAnyBlankTerminatesInput     = 0x0200,
  AcEdJig_kInitialBlankTerminatesInput      = TAcEdJig_UserInputControls($0400);      // kInitialBlankTerminatesInput = 0x0400,
  AcEdJig_kAcceptOtherInputString           = TAcEdJig_UserInputControls($0800);      // kAcceptOtherInputString      = 0x0800 };

  //class AcEdJig: public AcRxObject    // typedef enum DragStatus {
  AcEdJig_kNoChange                         = TAcEdJig_DragStatus(-6);        // kNoChange       = -6,
  AcEdJig_kCancel                           = TAcEdJig_DragStatus(-4);        // kCancel         = -4,
  AcEdJig_kOther                            = TAcEdJig_DragStatus(-3);        // kOther          = -3,
  AcEdJig_kNull                             = TAcEdJig_DragStatus(-1);        // kNull           = -1,
  AcEdJig_kNormal                           = TAcEdJig_DragStatus(0);         // kNormal         = 0,
  AcEdJig_kKW1                              = TAcEdJig_DragStatus(1);         // kKW1,
  AcEdJig_kKW2                              = TAcEdJig_DragStatus(2);         // kKW2,
  AcEdJig_kKW3                              = TAcEdJig_DragStatus(3);         // kKW3,
  AcEdJig_kKW4                              = TAcEdJig_DragStatus(4);         // kKW4,
  AcEdJig_kKW5                              = TAcEdJig_DragStatus(5);         // kKW5,
  AcEdJig_kKW6                              = TAcEdJig_DragStatus(6);         // kKW6,
  AcEdJig_kKW7                              = TAcEdJig_DragStatus(7);         // kKW7,
  AcEdJig_kKW8                              = TAcEdJig_DragStatus(8);         // kKW8,
  AcEdJig_kKW9                              = TAcEdJig_DragStatus(9);         // kKW9 };

  //class AcEdJig: public AcRxObject    // typedef enum CursorType {
  AcEdJig_kNoSpecialCursor                  = TAcEdJig_CursorType(-1);        // kNoSpecialCursor = -1,           // No Special Cursor Specified
  AcEdJig_kCrosshair                        = TAcEdJig_CursorType(0);         // kCrosshair = 0,                  // Full Screen Cross Hair.
  AcEdJig_kRectCursor                       = TAcEdJig_CursorType(1);         // kRectCursor,                     // Rectangular cursor.
  AcEdJig_kRubberBand                       = TAcEdJig_CursorType(2);         // kRubberBand,                     // Rubber band line.
  AcEdJig_kNotRotated                       = TAcEdJig_CursorType(3);         // kNotRotated,                     // NotRotated Type.
  AcEdJig_kTargetBox                        = TAcEdJig_CursorType(4);         // kTargetBox,                      // Target Box Type.
  AcEdJig_kRotatedCrosshair                 = TAcEdJig_CursorType(5);         // kRotatedCrosshair,               // Rotated Crosshair w/ rubber band.
  AcEdJig_kCrosshairNoRotate                = TAcEdJig_CursorType(6);         // kCrosshairNoRotate,              // Crosshairs forced non-rotated.
  AcEdJig_kInvisible                        = TAcEdJig_CursorType(7);         // kInvisible,                      // Invisible cursor.
  AcEdJig_kEntitySelect                     = TAcEdJig_CursorType(8);         // kEntitySelect,                   // Entity selection target cursor.
  AcEdJig_kParallelogram                    = TAcEdJig_CursorType(9);         // kParallelogram,                  // Parallelogram cursor.
  AcEdJig_kEntitySelectNoPersp              = TAcEdJig_CursorType(10);        // kEntitySelectNoPersp,            // Pickbox, suppressed in persp.
  AcEdJig_kPkfirstOrGrips                   = TAcEdJig_CursorType(11);        // kPkfirstOrGrips                  // Auto-select cursor. };
  // AcEdJig();
  // virtual ~AcEdJig();


// ***************************************************************************** AcDbLib/DBLEAD
type
  TAcDbLeader_AnnoType = Integer;

const
  //class AcDbLeader: public  AcDbCurve   // enum AnnoType {
  AcDbLeader_AnnoType_kMText                = TAcDbLeader_AnnoType(0);        // kMText = 0,
  AcDbLeader_AnnoType_kFcf                  = TAcDbLeader_AnnoType(1);        // kFcf,
  AcDbLeader_AnnoType_kBlockRef             = TAcDbLeader_AnnoType(2);        // kBlockRef,
  AcDbLeader_AnnoType_kNoAnno               = TAcDbLeader_AnnoType(3);        // kNoAnno };


// ******************************************************************** AcDbLib/DBLTRANS
type
  TACDB_DECLARE_MEMBERS = Integer;

const
  // enum {
  ACDB_DECLARE_MEMBERS_kSameDb              = TACDB_DECLARE_MEMBERS(0);       // kSameDb      = 0,
  ACDB_DECLARE_MEMBERSkXrefDb               = TACDB_DECLARE_MEMBERS(1);       // kXrefDb      = 1,
  ACDB_DECLARE_MEMBERSkUnrelatedDb          = TACDB_DECLARE_MEMBERS(2);       // kUnrelatedDb = 2  };


// ***************************************************************************** AcDbLib/DBMATCH
type
  TAcDbMatchProperties_Flags = Integer;

const
  // {
  // public:
  //class AcDbMatchProperties               = public AcRxObject   // enum Flags {
  AcDbMatchProperties_kColorFlag            = TAcDbMatchProperties_Flags($1);   // kColorFlag     = 0x1,
  AcDbMatchProperties_kLayerFlag            = TAcDbMatchProperties_Flags($2);   // kLayerFlag     = 0x2,
  AcDbMatchProperties_kLtypeFlag            = TAcDbMatchProperties_Flags($4);   // kLtypeFlag     = 0x4,
  AcDbMatchProperties_kThicknessFlag        = TAcDbMatchProperties_Flags($8);   // kThicknessFlag = 0x8,
  AcDbMatchProperties_kLtscaleFlag          = TAcDbMatchProperties_Flags($10);  // kLtscaleFlag   = 0x10,
  AcDbMatchProperties_TextFlag              = TAcDbMatchProperties_Flags($20);  // kTextFlag      = 0x20,
  AcDbMatchProperties_kDimensionFlag        = TAcDbMatchProperties_Flags($40);  // kDimensionFlag = 0x40,
  AcDbMatchProperties_kHatchFlag            = TAcDbMatchProperties_Flags($80);  // kHatchFlag     = 0x80,
  AcDbMatchProperties_kLweightFlag          = TAcDbMatchProperties_Flags($100); // kLweightFlag   = 0x100,
  AcDbMatchProperties_kPlotstylenameFlag    = TAcDbMatchProperties_Flags($200); // kPlotstylenameFlag = 0x200,
  AcDbMatchProperties_kSetAllFlagsOn        = TAcDbMatchProperties_Flags($3FF); // kSetAllFlagsOn = 0x3FF };



// ***************************************************************************** AcDbLib/DBMLINE
type
  // struct Mline {
  // typedef Adesk::Int8 MlineJustification;
  TMline_MlineJustification = TAdesk_Int8;

const
  // enum {
  Mline_kTop                                = TMline_MlineJustification(0);   // kTop        = 0,
  Mline_kZero                               = TMline_MlineJustification(1);   // kZero       = 1,
  Mline_kBottom                             = TMline_MlineJustification(2);   // kBottom     = 2 };

  // enum {
  Mline_kOpen                               = TMline_MlineJustification(0);   // kOpen        = 0,
  Mline_kClosed                             = TMline_MlineJustification(1);   // kClosed      = 1,
  Mline_kMerged                             = TMline_MlineJustification(2);   // kMerged      = 2 };
  // };

// ***************************************************************************** AcDbLib/DBMTEXT
type
  TAcDbMText_AttachmentPoint = Integer;
  TAcDbMText_FlowDirection = Integer;

  TAcDbMTextFragment = record             // struct AcDbMTextFragment {
    //  position data
    location: TposAcGePoint3d;                    //   AcGePoint3d  location;
    normal: TposAcGeVector3d;                   //   AcGeVector3d normal;
    direction: TposAcGeVector3d;                  //   AcGeVector3d direction;
    //  text characters
    text: PChar;                                  //   char*        text;
    //  font names
    font: PChar;                                  //   char*        font;
    bigfont: PChar;                               //   char*        bigfont;
    //  metrics
    extents: TposAcGePoint2d;                   //   AcGePoint2d  extents;
    capsHeight: Double;                           //   double       capsHeight;
    widthFactor: Double;                          //   double       widthFactor;
    obliqueAngle: Double;                         //   double       obliqueAngle;
    trackingFactor: Double;                       //   double       trackingFactor;
    colorIndex: TAdesk_UInt16;                    //   Adesk::UInt16 colorIndex;
    //  stack flags
    stackTop_1: Cardinal;                         //   unsigned stackTop:1;
    stackBottom_1: Cardinal;                      //   unsigned stackBottom:1;
    //  underline/overline data
    underlined_1: Cardinal;                       //   unsigned    underlined:1;
    overlined_1: Cardinal;                        //   unsigned    overlined:1;
    underPoints: array[0..1]of TposAcGePoint3d; //   AcGePoint3d underPoints[2];
    overPoints: array[0..1]of TposAcGePoint3d;    //   AcGePoint3d overPoints[2];
    //  true type font data
    fontname: PChar;                              //   char * fontname;
    bold: Boolean;                                //   bool bold;
    italic: Boolean;                              //   bool italic;
  end;                                            // };

const
  // double   textHeight() const;
  // Acad::ErrorStatus  setTextHeight(double);
  //
  //class AcDbMText: public  AcDbEntity   // enum AttachmentPoint {
  AcDbMText_kTopLeft                        = TAcDbMText_AttachmentPoint(1);  // kTopLeft        = 1,
  AcDbMText_kTopCenter                      = TAcDbMText_AttachmentPoint(2);  // kTopCenter      = 2,
  AcDbMText_kTopRight                       = TAcDbMText_AttachmentPoint(3);  // kTopRight       = 3,
  AcDbMText_kMiddleLeft                     = TAcDbMText_AttachmentPoint(4);  // kMiddleLeft     = 4,
  AcDbMText_kMiddleCenter                   = TAcDbMText_AttachmentPoint(5);  // kMiddleCenter   = 5,
  AcDbMText_kMiddleRight                    = TAcDbMText_AttachmentPoint(6);  // kMiddleRight    = 6,
  AcDbMText_kBottomLeft                     = TAcDbMText_AttachmentPoint(7);  // kBottomLeft     = 7,
  AcDbMText_kBottomCenter                   = TAcDbMText_AttachmentPoint(8);  // kBottomCenter   = 8,
  AcDbMText_kBottomRight                    = TAcDbMText_AttachmentPoint(9);  // kBottomRight    = 9,
  AcDbMText_kBaseLeft                       = TAcDbMText_AttachmentPoint(10); // kBaseLeft       = 10,   // Reserved for future use
  AcDbMText_kBaseCenter                     = TAcDbMText_AttachmentPoint(11); // kBaseCenter     = 11,   // Reserved for future use
  AcDbMText_kBaseRight                      = TAcDbMText_AttachmentPoint(12); // kBaseRight      = 12,   // Reserved for future use
  AcDbMText_kBaseAlign                      = TAcDbMText_AttachmentPoint(13); // kBaseAlign      = 13,   // Reserved for future use
  AcDbMText_kBottomAlign                    = TAcDbMText_AttachmentPoint(14); // kBottomAlign    = 14,   // Reserved for future use
  AcDbMText_kMiddleAlign                    = TAcDbMText_AttachmentPoint(15); // kMiddleAlign    = 15,   // Reserved for future use
  AcDbMText_kTopAlign                       = TAcDbMText_AttachmentPoint(16); // kTopAlign       = 16,   // Reserved for future use
  AcDbMText_kBaseFit                        = TAcDbMText_AttachmentPoint(17); // kBaseFit        = 17,   // Reserved for future use
  AcDbMText_kBottomFit                      = TAcDbMText_AttachmentPoint(18); // kBottomFit      = 18,   // Reserved for future use
  AcDbMText_kMiddleFit                      = TAcDbMText_AttachmentPoint(19); // kMiddleFit      = 19,   // Reserved for future use
  AcDbMText_kTopFit                         = TAcDbMText_AttachmentPoint(20); // kTopFit         = 20,   // Reserved for future use
  AcDbMText_kBaseMid                        = TAcDbMText_AttachmentPoint(21); // kBaseMid        = 21,   // Reserved for future use
  AcDbMText_kBottomMid                      = TAcDbMText_AttachmentPoint(22); // kBottomMid      = 22,   // Reserved for future use
  AcDbMText_kMiddleMid                      = TAcDbMText_AttachmentPoint(23); // kMiddleMid      = 23,   // Reserved for future use
  AcDbMText_kTopMid                         = TAcDbMText_AttachmentPoint(24); // kTopMid         = 24,   // Reserved for future use };

  //class AcDbMText: public  AcDbEntity  // enum FlowDirection {
  AcDbMText_kLtoR                           = TAcDbMText_FlowDirection(1);    // kLtoR    = 1,
  AcDbMText_kRtoL                           = TAcDbMText_FlowDirection(2);    // kRtoL    = 2,  //  not currently supported
  AcDbMText_kTtoB                           = TAcDbMText_FlowDirection(3);    // kTtoB    = 3,
  AcDbMText_kBtoT                           = TAcDbMText_FlowDirection(4);    // kBtoT    = 4,  //  not currently supported
  AcDbMText_kByStyle                        = TAcDbMText_FlowDirection(5);    // kByStyle = 5  };

// ***************************************************************************** AcDbLib/DBPL
type
  TAcDbPolyline_SegType = Integer;

const
  //class AcDbPolyline : public AcDbCurve   // enum SegType {
  AcDbPolyline__kLine                       = TAcDbPolyline_SegType(0);       // kLine,
  AcDbPolyline__kArc                        = TAcDbPolyline_SegType(1);       // kArc,
  AcDbPolyline__kCoincident                 = TAcDbPolyline_SegType(2);       // kCoincident,
  AcDbPolyline__kPoint                      = TAcDbPolyline_SegType(3);       // kPoint,
  AcDbPolyline__kEmpty                      = TAcDbPolyline_SegType(4);       // kEmpty  };


// ***************************************************************************** AcDbLib/DBPLOTSETTINGS
type
  TAcDbPlotSettings_PlotPaperUnits = Integer;
  TAcDbPlotSettings_PlotRotation = Integer;
  TAcDbPlotSettings_PlotType = Integer;
  TAcDbPlotSettings_StdScaleType = Integer;

const
  //class AcDbPlotSettings: public AcDbObject // enum PlotPaperUnits {
  AcDbPlotSettings_kInches                  = TAcDbPlotSettings_PlotPaperUnits(0);  // kInches,
  AcDbPlotSettings__kMillimeters            = TAcDbPlotSettings_PlotPaperUnits(1);  // kMillimeters,
  AcDbPlotSettings__kPixels                 = TAcDbPlotSettings_PlotPaperUnits(2);  // kPixels };

  //class AcDbPlotSettings: public AcDbObject // enum PlotRotation {
  AcDbPlotSettings_k0degrees                = TAcDbPlotSettings_PlotRotation(0);    // k0degrees,
  AcDbPlotSettings_k90degrees               = TAcDbPlotSettings_PlotRotation(1);    // k90degrees,
  AcDbPlotSettings_k180degrees              = TAcDbPlotSettings_PlotRotation(2);    // k180degrees,
  AcDbPlotSettings_k270degrees              = TAcDbPlotSettings_PlotRotation(3);    // k270degrees };

  //class AcDbPlotSettings: public AcDbObject // enum PlotType {
  AcDbPlotSettings_kDisplay                 = TAcDbPlotSettings_PlotType(0);        // kDisplay,
  AcDbPlotSettings_kExtents                 = TAcDbPlotSettings_PlotType(1);        // kExtents,
  AcDbPlotSettings_kLimits                  = TAcDbPlotSettings_PlotType(2);        // kLimits,
  AcDbPlotSettings_kView                    = TAcDbPlotSettings_PlotType(3);        // kView,
  AcDbPlotSettings_kWindow                  = TAcDbPlotSettings_PlotType(4);        // kWindow,
  AcDbPlotSettings_kLayout                  = TAcDbPlotSettings_PlotType(5);        // kLayout };

  //class AcDbPlotSettings: public AcDbObject // enum StdScaleType {
  AcDbPlotSettings_kScaleToFit              = TAcDbPlotSettings_StdScaleType(0);    // kScaleToFit,     // Scaled to Fit
  AcDbPlotSettings_k1_128in_1ft             = TAcDbPlotSettings_StdScaleType(1);    // k1_128in_1ft,    // 1/128"(1'
  AcDbPlotSettings_k1_64in_1ft              = TAcDbPlotSettings_StdScaleType(2);    // k1_64in_1ft,     // 1/64"(1'
  AcDbPlotSettings_k1_32in_1ft              = TAcDbPlotSettings_StdScaleType(3);    // k1_32in_1ft,     // 1/32"(1'
  AcDbPlotSettings_k1_16in_1ft              = TAcDbPlotSettings_StdScaleType(4);    // k1_16in_1ft,     // 1/16"(1'
  AcDbPlotSettings_k3_32in_1ft              = TAcDbPlotSettings_StdScaleType(5);    // k3_32in_1ft,     // 3/32"(1'
  AcDbPlotSettings_k1_8in_1ft               = TAcDbPlotSettings_StdScaleType(6);    // k1_8in_1ft,      // 1/8" (1'
  AcDbPlotSettings_k3_16in_1ft              = TAcDbPlotSettings_StdScaleType(7);    // k3_16in_1ft,     // 3/16"(1'
  AcDbPlotSettings_k1_4in_1ft               = TAcDbPlotSettings_StdScaleType(8);    // k1_4in_1ft,      // 1/4" (1'
  AcDbPlotSettings_k3_8in_1ft               = TAcDbPlotSettings_StdScaleType(9);    // k3_8in_1ft,      // 3/8" (1'
  AcDbPlotSettings_k1_2in_1ft               = TAcDbPlotSettings_StdScaleType(10);   // k1_2in_1ft,      // 1/2" (1'
  AcDbPlotSettings_k3_4in_1ft               = TAcDbPlotSettings_StdScaleType(11);   // k3_4in_1ft,      // 3/4" (1'
  AcDbPlotSettings_k1in_1ft                 = TAcDbPlotSettings_StdScaleType(12);   // k1in_1ft,        // 1"(1'
  AcDbPlotSettings_k3in_1ft                 = TAcDbPlotSettings_StdScaleType(13);   // k3in_1ft,        // 3"(1'
  AcDbPlotSettings_k6in_1ft                 = TAcDbPlotSettings_StdScaleType(14);   // k6in_1ft,        // 6"(1'
  AcDbPlotSettings_k1ft_1ft                 = TAcDbPlotSettings_StdScaleType(15);   // k1ft_1ft,        // 1'(1'
  AcDbPlotSettings_k1_1                     = TAcDbPlotSettings_StdScaleType(16);   // k1_1,            // 1:1
  AcDbPlotSettings_k1_2                     = TAcDbPlotSettings_StdScaleType(17);   // k1_2,            // 1:2
  AcDbPlotSettings_k1_4                     = TAcDbPlotSettings_StdScaleType(18);   // k1_4,            // 1:4
  AcDbPlotSettings_k1_8                     = TAcDbPlotSettings_StdScaleType(19);   // k1_8,            // 1:8
  AcDbPlotSettings_k1_10                    = TAcDbPlotSettings_StdScaleType(20);   // k1_10,         // 1:10
  AcDbPlotSettings_k1_16                    = TAcDbPlotSettings_StdScaleType(21);   // k1_16,         // 1:16
  AcDbPlotSettings_k1_20                    = TAcDbPlotSettings_StdScaleType(22);   // k1_20,         // 1:20
  AcDbPlotSettings_k1_30                    = TAcDbPlotSettings_StdScaleType(23);   // k1_30,         // 1:30
  AcDbPlotSettings_k1_40                    = TAcDbPlotSettings_StdScaleType(24);   // k1_40,         // 1:40
  AcDbPlotSettings_k1_50                    = TAcDbPlotSettings_StdScaleType(25);   // k1_50,         // 1:50
  AcDbPlotSettings_k1_100                   = TAcDbPlotSettings_StdScaleType(26);   // k1_100,          // 1:100
  AcDbPlotSettings_k2_1                     = TAcDbPlotSettings_StdScaleType(27);   // k2_1,            // 2:1
  AcDbPlotSettings_k4_1                     = TAcDbPlotSettings_StdScaleType(28);   // k4_1,            // 4:1
  AcDbPlotSettings_k8_1                     = TAcDbPlotSettings_StdScaleType(29);   // k8_1,            // 8:1
  AcDbPlotSettings_k10_1                    = TAcDbPlotSettings_StdScaleType(30);   // k10_1,         // 10:1
  AcDbPlotSettings_k100_1                   = TAcDbPlotSettings_StdScaleType(31);   // k100_1,          // 100:1
  AcDbPlotSettings_k1000_1                  = TAcDbPlotSettings_StdScaleType(32);   // k1000_1          // 1000:1 };


// ***************************************************************************** AcDbLib/DBPROXY
type
  TAcDbProxyObject_ProxyObjEnum = Integer;
  TAcDbProxyEntity_GraphicsMetafileType = Integer;
  TAcDbProxyEntity_ProxyEntEnum = Integer;

const
  //class AcDbProxyObject : public AcDbObject   // AcDbProxyObject enum {
  AcDbProxyObject_kNoOperation              = TAcDbProxyObject_ProxyObjEnum(0);           //  kNoOperation          = 0,
  AcDbProxyObject_kEraseAllowed             = TAcDbProxyObject_ProxyObjEnum($1);          // kEraseAllowed         = 0x1,
  AcDbProxyObject_kCloningAllowed           = TAcDbProxyObject_ProxyObjEnum($80);         // kCloningAllowed       = 0x80,
  AcDbProxyObject_kAllButCloningAllowed     = TAcDbProxyObject_ProxyObjEnum($1);          // kAllButCloningAllowed = 0x1,
  AcDbProxyObject_kAllAllowedBits           = TAcDbProxyObject_ProxyObjEnum($81);         // kAllAllowedBits       = 0x81,
  AcDbProxyObject_kMergeIgnore              = TAcDbProxyObject_ProxyObjEnum(0);           // kMergeIgnore          = 0,      // Keep existing (= default)
  AcDbProxyObject_kMergeReplace             = TAcDbProxyObject_ProxyObjEnum($100);        // kMergeReplace         = 0x100,  // Use clone
  AcDbProxyObject_kMergeMangleName          = TAcDbProxyObject_ProxyObjEnum($200);        // kMergeMangleName      = 0x200,  // anonymous name };

  //class AcDbProxyEntity: public AcDbEntity    // enum GraphicsMetafileType {
  AcDbProxyEntity_kNoMetafile               = TAcDbProxyEntity_GraphicsMetafileType(0);   // kNoMetafile   = 0,
  AcDbProxyEntity_kBoundingBox              = TAcDbProxyEntity_GraphicsMetafileType(1);   // kBoundingBox  = 1,
  AcDbProxyEntity_kFullGraphics             = TAcDbProxyEntity_GraphicsMetafileType(2);   // kFullGraphics = 2 };

  //class AcDbProxyEntity: public AcDbEntity    // AcDbProxyEntity  enum {
  AcDbProxyEntity_kNoOperation                  = TAcDbProxyEntity_ProxyEntEnum(0);       // kNoOperation                 = 0,
  AcDbProxyEntity_kEraseAllowed                 = TAcDbProxyEntity_ProxyEntEnum($1);      // kEraseAllowed                = 0x1,
  AcDbProxyEntity_kTransformAllowed             = TAcDbProxyEntity_ProxyEntEnum($2);      // kTransformAllowed            = 0x2,
  AcDbProxyEntity_kColorChangeAllowed           = TAcDbProxyEntity_ProxyEntEnum($4);      // kColorChangeAllowed          = 0x4,
  AcDbProxyEntity_kLayerChangeAllowed           = TAcDbProxyEntity_ProxyEntEnum($8);      // kLayerChangeAllowed          = 0x8,
  AcDbProxyEntity_kLinetypeChangeAllowed        = TAcDbProxyEntity_ProxyEntEnum($10);     // kLinetypeChangeAllowed       = 0x10,
  AcDbProxyEntity_kLinetypeScaleChangeAllowed   = TAcDbProxyEntity_ProxyEntEnum($20);     // kLinetypeScaleChangeAllowed  = 0x20,
  AcDbProxyEntity_kVisibilityChangeAllowed      = TAcDbProxyEntity_ProxyEntEnum($40);     // kVisibilityChangeAllowed     = 0x40,
  AcDbProxyEntity_kCloningAllowed               = TAcDbProxyEntity_ProxyEntEnum($80);     // kCloningAllowed              = 0x80,
  AcDbProxyEntity_kLineWeightChangeAllowed      = TAcDbProxyEntity_ProxyEntEnum($100);    // kLineWeightChangeAllowed     = 0x100,
  AcDbProxyEntity_kPlotStyleNameChangeAllowed   = TAcDbProxyEntity_ProxyEntEnum($200);    // kPlotStyleNameChangeAllowed  = 0x200,
  AcDbProxyEntity_kAllButCloningAllowed         = TAcDbProxyEntity_ProxyEntEnum($37F);    // kAllButCloningAllowed        = 0x37F,
  AcDbProxyEntity_kAllAllowedBits               = TAcDbProxyEntity_ProxyEntEnum($3FF);    // kAllAllowedBits              = 0x3FF };



// ******************************************************************** AcDbLib/DBSYMUTL
type
  TCompatibilityMode = Boolean;
  TNameCaseMode = Boolean;
  TNewNameMode = Boolean;
  TVerticalBarMode = Boolean;

const
  // namespace AcDbSymbolUtilities  {
  // enum CompatibilityMode {
  CompatibilityMode_kExtendedNames          = TCompatibilityMode(True);       // kExtendedNames    = true,
  CompatibilityMode_kPreExtendedNames       = TCompatibilityMode(False);      // kPreExtendedNames = false };

  // enum NameCaseMode {
  kPreserveCase                             = TNameCaseMode(True);            // kPreserveCase     = true,
  kForceToUpper                             = TNameCaseMode(False);           // kForceToUpper     = false  };

  // enum NewNameMode {
  NameCaseMode_kAsNewName                   = TNewNameMode(True);             // kAsNewName        = true,
  NameCaseMode_kAsExistingName              = TNewNameMode(False);            // kAsExistingName   = false  };

  // enum VerticalBarMode {
  VerticalBarMode_kAllowVerticalBar         = TVerticalBarMode(True);         // kAllowVerticalBar = true,
  VerticalBarMode_kNoVerticalBar            = TVerticalBarMode(False);        // kNoVerticalBar    = false  };


// ***************************************************************************** AcDbLib/GRAPH
type
  TAcDbGraphNode_Flags = Integer;

const
  //class AcDbGraphNode   // enum Flags    {
  AcDbGraphNode_kNone                       = TAcDbGraphNode_Flags($00);      // kNone          = 0x00,
  AcDbGraphNode_kVisited                    = TAcDbGraphNode_Flags($01);      // kVisited       = 0x01,   // Cycle: detection
  AcDbGraphNode_kOutsideRefed               = TAcDbGraphNode_Flags($02);      // kOutsideRefed  = 0x02,   // List: cannot Detach
  AcDbGraphNode_kSelected                   = TAcDbGraphNode_Flags($04);      // kSelected      = 0x04,   // List: user's selection
  AcDbGraphNode_kInList                     = TAcDbGraphNode_Flags($08);      // kInList        = 0x08,   // List: is on it
  AcDbGraphNode_kListAll                    = TAcDbGraphNode_Flags($0E);      // kListAll       = 0x0E,   // List: for clear all
  AcDbGraphNode_kFirstLevel                 = TAcDbGraphNode_Flags($10);      // kFirstLevel    = 0x10,   // has edge from root
  AcDbGraphNode_kUnresTree                  = TAcDbGraphNode_Flags($20);      // kUnresTree     = 0x20,   // In an Unresolved tree
  AcDbGraphNode_kAll                        = TAcDbGraphNode_Flags($2F);      // kAll           = 0x2F }; // Note, this does not clear kFirstLevel, which is read-only


// ******************************************************************** AcDbLib/IMGDEF
type
  TClassVersion = Integer;
  TUnits = Integer;

const
  // enum ClassVersion {
  ClassVersion_kVersion1                    = TClassVersion(0);               // kVersion1   = 0,   // S039 Oct 21, 1996
  ClassVersion_kVersion2                    = TClassVersion(1);               // kVersion2   = 1,   // S052 Jan 16, 1996
  ClassVersion_kVersion3                    = TClassVersion(2);               // kVersion3   = 2    // S061 Mar 21, 1997 };

  // enum Units {
  Units_kNone                               = TUnits(0);                      // kNone         = 0,
  Units_kMillimeter                         = TUnits(1);                      // kMillimeter   = 1,
  Units_kCentimeter                         = TUnits(2);                      // kCentimeter   = 2,
  Units_kMeter                              = TUnits(3);                      // kMeter        = 3,
  Units_kKilometer                          = TUnits(4);                      // kKilometer    = 4,
  Units_kInch                               = TUnits(5);                      // kInch         = 5,
  Units_kFoot                               = TUnits(6);                      // kFoot         = 6,
  Units_kYard                               = TUnits(7);                      // kYard         = 7,
  Units_kMile                               = TUnits(8);                      // kMile         = 8,
  Units_kMicroinches                        = TUnits(9);                      // kMicroinches  = 9,
  Units_kMils                               = TUnits(10);                     // kMils         = 10,
  Units_kAngstroms                          = TUnits(11);                     // kAngstroms    = 11,
  Units_kNanometers                         = TUnits(12);                     // kNanometers   = 12,
  Units_kMicrons                            = TUnits(13);                     // kMicrons      = 13,
  Units_kDecimeters                         = TUnits(14);                     // kDecimeters   = 14,
  Units_kDekameters                         = TUnits(15);                     // kDekameters   = 15,
  Units_kHectometers                        = TUnits(16);                     // kHectometers  = 16,
  Units_kGigameters                         = TUnits(17);                     // kGigameters   = 17,
  Units_kAstronomical                       = TUnits(18);                     // kAstronomical = 18,
  Units_kLightYears                         = TUnits(19);                     // kLightYears   = 19,
  Units_kParsecs                            = TUnits(20);                     // kParsecs      = 20 };



// ***************************************************************************** AcDbLib/IMGENT
type
  TAcDbRasterImage_ClipBoundaryType = Integer;
  TAcDbRasterImage_ImageDisplayOpt = Integer;

const
  //class ISMDLLACCESS AcDbRasterImage : public AcDbImage   // enum ClipBoundaryType {
  AcDbRasterImage_kInvalid                  = TAcDbRasterImage_ClipBoundaryType(0);               // kInvalid,
  AcDbRasterImage_kRect                     = TAcDbRasterImage_ClipBoundaryType(1);               // kRect,
  AcDbRasterImage_kPoly                     = TAcDbRasterImage_ClipBoundaryType(2);             // kPoly };

  //class ISMDLLACCESS AcDbRasterImage : public AcDbImage // enum ImageDisplayOpt {
  AcDbRasterImage_ImageDisplayOpt_kShow                 = TAcDbRasterImage_ImageDisplayOpt(1);    // kShow             = 1,
  AcDbRasterImage_ImageDisplayOpt_kShowUnAligned        = TAcDbRasterImage_ImageDisplayOpt(2);    // kShowUnAligned    = 2,
  AcDbRasterImage_ImageDisplayOpt_kClip                 = TAcDbRasterImage_ImageDisplayOpt(4);    // kClip             = 4,
  AcDbRasterImage_ImageDisplayOpt_kTransparent          = TAcDbRasterImage_ImageDisplayOpt(8);    // kTransparent      = 8  };

// ***************************************************************************** AcDbLib/IMGVARS
type
  TAcDbRasterVariables_FrameSettings = Integer;
  TAcDbRasterVariables_ImageQuality = Integer;

const
  //class ISMDLLACCESS AcDbRasterVariables : public AcDbObject  // enum FrameSettings {
  AcDbRasterVariables_FrameSettings_kImageFrameInvalid  = TAcDbRasterVariables_FrameSettings(-1);   // kImageFrameInvalid = -1,
  AcDbRasterVariables_FrameSettings_kImageFrameOff      = TAcDbRasterVariables_FrameSettings(0);    // kImageFrameOff   = 0,
  AcDbRasterVariables_FrameSettings_kImageFrameAbove    = TAcDbRasterVariables_FrameSettings(1);    // kImageFrameAbove = 1,
  AcDbRasterVariables_FrameSettings_kImageFrameBelow    = TAcDbRasterVariables_FrameSettings(2);    // kImageFrameBelow = 2 };

  //class ISMDLLACCESS AcDbRasterVariables : public AcDbObject // enum ImageQuality {
  AcDbRasterVariables_ImageQuality_kImageQualityInvalid = TAcDbRasterVariables_FrameSettings(-1);   // kImageQualityInvalid = -1,
  AcDbRasterVariables_ImageQuality_kImageQualityDraft   = TAcDbRasterVariables_FrameSettings(0);    // kImageQualityDraft = 0,
  AcDbRasterVariables_ImageQuality_kImageQualityHigh    = TAcDbRasterVariables_FrameSettings(1);    // kImageQualityHigh  = 1 };


// ******************************************************************** AcEDLib/ACED
const
  ACED_SERVICES: PChar   = 'AcEdServices';        // #define ACED_SERVICES  "AcEdServices"
  ACED_EDITOR_OBJ: PChar = 'AcEditor';            // #define ACED_EDITOR_OBJ "AcEditor"

type
  TAcadContextMenuMode = Integer;
  TxrefSubcommandActivities = Integer;
  TundoSubcommandActivities = Integer;

const
// The various modes for context menus.
  // enum AcadContextMenuMode {
  AcadContextMenuMode_kDefault              = TAcadContextMenuMode(0);        // kDefault = 0,   // No selection set, no command active.
  AcadContextMenuMode_kEdit                 = TAcadContextMenuMode(1);        // kEdit,          // Select set, no command active.
  AcadContextMenuMode_kCommand              = TAcadContextMenuMode(2);        // kCommand,       // Command active.
  AcadContextMenuMode_kHotGrip              = TAcadContextMenuMode(3);        // kHotGrip,       // Hot grip exists.
  AcadContextMenuMode_kOsnap                = TAcadContextMenuMode(4);        // kOsnap,         // Shift key down. };

  // enum xrefSubcommandActivities {
  xrefSubcommandActivities_kStart             = TxrefSubcommandActivities(0);   // kStart             = 0,
  xrefSubcommandActivities_kStartItem         = TxrefSubcommandActivities(2);   // kStartItem         = 2,
  xrefSubcommandActivities_kEndItem           = TxrefSubcommandActivities(3);   // kEndItem           = 3,
  xrefSubcommandActivities_kEnd               = TxrefSubcommandActivities(4);   // kEnd               = 4,
  xrefSubcommandActivities_kWillAbort         = TxrefSubcommandActivities(5);   // kWillAbort         = 5,
  xrefSubcommandActivities_kAborted           = TxrefSubcommandActivities(6);   // kAborted           = 6,
  xrefSubcommandActivities_kStartXBindBlock   = TxrefSubcommandActivities(7);   // kStartXBindBlock   = 7,
  xrefSubcommandActivities_kStartXBindSymbol  = TxrefSubcommandActivities(8);   // kStartXBindSymbol  = 8 };

  // enum undoSubcommandActivities {
  undoSubcommandActivities_kNone            = TundoSubcommandActivities(0);   // kNone  = 0,
  undoSubcommandActivities_kOne             = TundoSubcommandActivities(1);   // kOne   = 1,
  undoSubcommandActivities_kAll             = TundoSubcommandActivities(2);   // kAll   = 2 };

// ***************************************************************************** AcGeLib/GEGBLGE
type
  TAcGeLibVersion = Integer;
  TAcGe_enum = Integer;
  TAcGe_EntityId = Integer;
  TAcGe_ExternalEntityKind = Integer;
  TAcGe_PointContainment = Integer;
  TAcGe_NurbSurfaceProperties = Integer;
  TAcGe_OffsetCrvExtType = Integer;
  TAcGe_AcGeXConfig = Integer;
  TAcGe_BooleanType = Integer;
  TAcGe_ClipError = Integer;
  TAcGe_ClipCondition = Integer;
  TAcGe_ErrorCondition = Integer;
  TAcGe_csiConfig = Integer;
  TAcGe_ssiType = Integer;
  TAcGe_ssiConfig = Integer;
  TAcGe_AcGeIntersectError = Integer;

  TAcGe = record
    gLibVersion: TAcGeLibVersion;
    enum: TAcGe_enum;
    EntityId: TAcGe_EntityId;
  end;

  // struct
  // #ifdef AC_GEGBL_CPP
  // GE_DLLEXPORT
  // #else
  // GE_DLLIMPORT
  // #endif
  // AcGe
  // {
  // static const AcGeLibVersion gLibVersion;

const
  // enum {
  AcGe_eGood                                = TAcGe_enum(0);                  // eGood,
  AcGe_eBad                                 = TAcGe_enum(1);                  // eBad };

  // enum EntityId {
  AcGe_kEntity2d                            = TAcGe_EntityId(0);              // kEntity2d,
  AcGe_kEntity3d                            = TAcGe_EntityId(1);              // kEntity3d,
  AcGe_kPointEnt2d                          = TAcGe_EntityId(2);              // kPointEnt2d,
  AcGe_kPointEnt3d                          = TAcGe_EntityId(3);              // kPointEnt3d,
  AcGe_kPosition2d                          = TAcGe_EntityId(4);              // kPosition2d,
  AcGe_kPosition3d                          = TAcGe_EntityId(5);              // kPosition3d,
  AcGe_kPointOnCurve2d                      = TAcGe_EntityId(6);              // kPointOnCurve2d,
  AcGe_kPointOnCurve3d                      = TAcGe_EntityId(7);              // kPointOnCurve3d,
  AcGe_kPointOnSurface                      = TAcGe_EntityId(8);              // kPointOnSurface,
  AcGe_kBoundedPlane                        = TAcGe_EntityId(9);              // kBoundedPlane,
  AcGe_kCircArc2d                           = TAcGe_EntityId(10);             // kCircArc2d,
  AcGe_kCircArc3d                           = TAcGe_EntityId(11);             // kCircArc3d,
  AcGe_kConic2d                             = TAcGe_EntityId(12);             // kConic2d,
  AcGe_kConic3d                             = TAcGe_EntityId(13);             // kConic3d,
  AcGe_kCurve2d                             = TAcGe_EntityId(14);             // kCurve2d,
  AcGe_kCurve3d                             = TAcGe_EntityId(15);             // kCurve3d,
  AcGe_kEllipArc2d                          = TAcGe_EntityId(16);             // kEllipArc2d,
  AcGe_kEllipArc3d                          = TAcGe_EntityId(17);             // kEllipArc3d,
  AcGe_kLine2d                              = TAcGe_EntityId(18);             // kLine2d,
  AcGe_kLine3d                              = TAcGe_EntityId(19);             // kLine3d,
  AcGe_kLinearEnt2d                         = TAcGe_EntityId(20);             // kLinearEnt2d,
  AcGe_kLinearEnt3d                         = TAcGe_EntityId(21);             // kLinearEnt3d,
  AcGe_kLineSeg2d                           = TAcGe_EntityId(22);             // kLineSeg2d,
  AcGe_kLineSeg3d                           = TAcGe_EntityId(23);             // kLineSeg3d,
  AcGe_kPlanarEnt                           = TAcGe_EntityId(24);             // kPlanarEnt,
  AcGe_kPlane                               = TAcGe_EntityId(25);             // kPlane,
  AcGe_kRay2d                               = TAcGe_EntityId(26);             // kRay2d,
  AcGe_kRay3d                               = TAcGe_EntityId(27);             // kRay3d,
  AcGe_kSurface                             = TAcGe_EntityId(28);             // kSurface,
  AcGe_kSphere                              = TAcGe_EntityId(29);             // kSphere,
  AcGe_kCylinder                            = TAcGe_EntityId(30);             // kCylinder,
  AcGe_kTorus                               = TAcGe_EntityId(31);             // kTorus,
  AcGe_kCone                                = TAcGe_EntityId(32);             // kCone,
  AcGe_kSplineEnt2d                         = TAcGe_EntityId(33);             // kSplineEnt2d,
  AcGe_kPolyline2d                          = TAcGe_EntityId(34);             // kPolyline2d,
  AcGe_kAugPolyline2d                       = TAcGe_EntityId(35);             // kAugPolyline2d,
  AcGe_kNurbCurve2d                         = TAcGe_EntityId(36);             // kNurbCurve2d,
  AcGe_kDSpline2d                           = TAcGe_EntityId(37);             // kDSpline2d,
  AcGe_kCubicSplineCurve2d                  = TAcGe_EntityId(38);             // kCubicSplineCurve2d,
  AcGe_kSplineEnt3d                         = TAcGe_EntityId(39);             // kSplineEnt3d,
  AcGe_kPolyline3d                          = TAcGe_EntityId(40);             // kPolyline3d,
  AcGe_kAugPolyline3d                       = TAcGe_EntityId(41);             // kAugPolyline3d,
  AcGe_kNurbCurve3d                         = TAcGe_EntityId(42);             // kNurbCurve3d,
  AcGe_kDSpline3d                           = TAcGe_EntityId(43);             // kDSpline3d,
  AcGe_kCubicSplineCurve3d                  = TAcGe_EntityId(44);             // kCubicSplineCurve3d,
  AcGe_kTrimmedCrv2d                        = TAcGe_EntityId(45);             // kTrimmedCrv2d,
  AcGe_kCompositeCrv2d                      = TAcGe_EntityId(46);             // kCompositeCrv2d,
  AcGe_kCompositeCrv3d                      = TAcGe_EntityId(47);             // kCompositeCrv3d,
  AcGe_kExternalSurface                     = TAcGe_EntityId(48);             // kExternalSurface,
  AcGe_kNurbSurface                         = TAcGe_EntityId(49);             // kNurbSurface,
  AcGe_kTrimmedSurface                      = TAcGe_EntityId(50);             // kTrimmedSurface,
  AcGe_kOffsetSurface                       = TAcGe_EntityId(51);             // kOffsetSurface,
  AcGe_kEnvelope2d                          = TAcGe_EntityId(52);             // kEnvelope2d,
  AcGe_kCurveBoundedSurface                 = TAcGe_EntityId(53);             // kCurveBoundedSurface,
  AcGe_kExternalCurve3d                     = TAcGe_EntityId(54);             // kExternalCurve3d,
  AcGe_kExternalCurve2d                     = TAcGe_EntityId(55);             //kExternalCurve2d,
  AcGe_kSurfaceCurve2dTo3d                  = TAcGe_EntityId(56);             // kSurfaceCurve2dTo3d,
  AcGe_kSurfaceCurve3dTo2d                  = TAcGe_EntityId(57);             // kSurfaceCurve3dTo2d,
  AcGe_kExternalBoundedSurface              = TAcGe_EntityId(58);             // kExternalBoundedSurface,
  AcGe_kCurveCurveInt2d                     = TAcGe_EntityId(59);             //kCurveCurveInt2d,
  AcGe_kCurveCurveInt3d                     = TAcGe_EntityId(60);             // kCurveCurveInt3d,
  AcGe_kBoundBlock2d                        = TAcGe_EntityId(61);             // kBoundBlock2d,
  AcGe_kBoundBlock3d                        = TAcGe_EntityId(62);             // kBoundBlock3d,
  AcGe_kOffsetCurve2d                       = TAcGe_EntityId(63);             // kOffsetCurve2d,
  AcGe_kOffsetCurve3d                       = TAcGe_EntityId(64);             // kOffsetCurve3d,
  AcGe_kPolynomCurve3d                      = TAcGe_EntityId(65);             // kPolynomCurve3d,
  AcGe_kBezierCurve3d                       = TAcGe_EntityId(66);             // kBezierCurve3d,
  AcGe_kObject                              = TAcGe_EntityId(67);             // kObject,
  AcGe_kFitData3d                           = TAcGe_EntityId(68);             // kFitData3d,
  AcGe_kHatch                               = TAcGe_EntityId(69);             // kHatch,
  AcGe_kTrimmedCurve2d                      = TAcGe_EntityId(70);             // kTrimmedCurve2d,
  AcGe_kTrimmedCurve3d                      = TAcGe_EntityId(71);             // kTrimmedCurve3d,
  AcGe_kCurveSampleData                     = TAcGe_EntityId(72);             // kEllipCone,
  AcGe_kEllipCone                           = TAcGe_EntityId(73);             // kEllipCone,
  AcGe_kEllipCylinder                       = TAcGe_EntityId(74);             // kEllipCylinder,
  AcGe_kIntervalBoundBlock                  = TAcGe_EntityId(75);             // kIntervalBoundBlock,
  AcGe_kClipBoundary2d                      = TAcGe_EntityId(76);             // kClipBoundary2d,
  AcGe_kExternalObject                      = TAcGe_EntityId(77);             // kExternalObject,
  AcGe_kCurveSurfaceInt                     = TAcGe_EntityId(78);             // kCurveSurfaceInt,
  AcGe_kSurfaceSurfaceIn                    = TAcGe_EntityId(79);             // kSurfaceSurfaceInt };

  // enum ExternalEntityKind {
  AcGe_kAcisEntity                          = TAcGe_ExternalEntityKind(0);    //kAcisEntity= 0,
  AcGe_kExternalEntityUndefined             = TAcGe_ExternalEntityKind(1);    // kExternalEntityUndefined};

  // enum PointContainment {
  AcGe_kInside                              = TAcGe_PointContainment(0);      //kInside,
  AcGe_kOutside                             = TAcGe_PointContainment(1);      //kOutside,
  AcGe_kOnBoundary                          = TAcGe_PointContainment(2);      //kOnBoundary};

  // enum NurbSurfaceProperties {
  AcGe_kOpen                                = TAcGe_NurbSurfaceProperties($01);  // kOpen=0x01,
  AcGe_kClosed                              = TAcGe_NurbSurfaceProperties($02);  // kClosed=0x02,
  AcGe_kPeriodic                            = TAcGe_NurbSurfaceProperties($04);  // kPeriodic=0x04,
  AcGe_kRational                            = TAcGe_NurbSurfaceProperties($08);  // kRational=0x08,
  AcGe_kNoPoles                             = TAcGe_NurbSurfaceProperties($10);  // kNoPoles=0x10,
  AcGe_kPoleAtMin                           = TAcGe_NurbSurfaceProperties($20);  // kPoleAtMin=0x20,
  AcGe_kPoleAtMax                           = TAcGe_NurbSurfaceProperties($40);  // kPoleAtMax=0x40,
  AcGe_kPoleAtBoth                          = TAcGe_NurbSurfaceProperties($80);  // kPoleAtBoth=0x80};

  // enum OffsetCrvExtType {
  AcGe_kFillet                              = TAcGe_OffsetCrvExtType(0);      // kFillet,
  AcGe_kChamfer                             = TAcGe_OffsetCrvExtType(1);      // kChamfer,
  AcGe_kExtend                              = TAcGe_OffsetCrvExtType(2);      // kExtend};

  // enum AcGeXConfig {
  AcGe_kNotDefined                          = TAcGe_AcGeXConfig(1);           // kNotDefined = 1 << 0,
  AcGe_kUnknown                             = TAcGe_AcGeXConfig(1);           // kUnknown = 1 << 1,
  AcGe_kLeftRight                           = TAcGe_AcGeXConfig(1);           // kLeftRight = 1 << 2,
  AcGe_kRightLeft                           = TAcGe_AcGeXConfig(1);           // kRightLeft = 1 << 3,
  AcGe_kLeftLeft                            = TAcGe_AcGeXConfig(1);           // kLeftLeft = 1 << 4,
  AcGe_kRightRight                          = TAcGe_AcGeXConfig(1);           // kRightRight = 1 << 5,
  AcGe_kPointLeft                           = TAcGe_AcGeXConfig(1);           // kPointLeft = 1 << 6,
  AcGe_kPointRight                          = TAcGe_AcGeXConfig(1);           // kPointRight = 1 << 7,
  AcGe_kLeftOverlap                         = TAcGe_AcGeXConfig(1);           // kLeftOverlap = 1 << 8,
  AcGe_kOverlapLeft                         = TAcGe_AcGeXConfig(1);           // kOverlapLeft = 1 << 9,
  AcGe_kRightOverlap                        = TAcGe_AcGeXConfig(1);           // kRightOverlap = 1 << 10,
  AcGe_kOverlapRight                        = TAcGe_AcGeXConfig(1);           // kOverlapRight = 1 << 11,
  AcGe_kOverlapStart                        = TAcGe_AcGeXConfig(1);           // kOverlapStart = 1 << 12,
  AcGe_kOverlapEnd                          = TAcGe_AcGeXConfig(1);           // kOverlapEnd = 1 << 13,
  AcGe_kOverlapOverlap                      = TAcGe_AcGeXConfig(1);           // kOverlapOverlap = 1 << 14  };

  // enum BooleanType {
  AcGe_kUnion                               = TAcGe_BooleanType(0);           // kUnion,
  AcGe_kSubtract                            = TAcGe_BooleanType(1);           // kSubtract,
  AcGe_kCommon                              = TAcGe_BooleanType(2);           // kCommon };

  // enum ClipError {
  AcGe_eOk                                  = TAcGe_ClipError(0);             // eOk,
  AcGe_eInvalidClipBoundary                 = TAcGe_ClipError(1);             // eInvalidClipBoundary,
  AcGe_eNotInitialized                      = TAcGe_ClipError(2);             // eNotInitialized  };

  // enum ClipCondition {
  AcGe_kInvalid                             = TAcGe_ClipCondition(0);         // kInvalid,
  AcGe_kAllSegmentsInside                   = TAcGe_ClipCondition(1);         // kAllSegmentsInside,
  AcGe_kSegmentsIntersect                   = TAcGe_ClipCondition(2);         // kSegmentsIntersect,
  AcGe_kAllSegmentsOutsideZeroWinds         = TAcGe_ClipCondition(3);         // kAllSegmentsOutsideZeroWinds,
  AcGe_kAllSegmentsOutsideOddWinds          = TAcGe_ClipCondition(4);         // kAllSegmentsOutsideOddWinds,
  AcGe_kAllSegmentsOutsideEvenWinds         = TAcGe_ClipCondition(5);         // kAllSegmentsOutsideEvenWinds  };

  // enum ErrorCondition  {
  AcGe_kOk                                  = TAcGe_ErrorCondition(0);        // kOk,
  AcGe_k0This                               = TAcGe_ErrorCondition(1);        // k0This,
  AcGe_k0Arg1                               = TAcGe_ErrorCondition(2);        // k0Arg1,
  AcGe_k0Arg2                               = TAcGe_ErrorCondition(3);        // k0Arg2,
  AcGe_kPerpendicularArg1Arg2               = TAcGe_ErrorCondition(4);        // kPerpendicularArg1Arg2,
  AcGe_kEqualArg1Arg2k                      = TAcGe_ErrorCondition(5);        // kEqualArg1Arg2,
  AcGe_kEqualArg1Arg3                       = TAcGe_ErrorCondition(6);        // kEqualArg1Arg3,
  AcGe_kEqualArg2Arg3                       = TAcGe_ErrorCondition(7);        // kEqualArg2Arg3,
  AcGe_kLinearlyDependentArg1Arg2Arg3       = TAcGe_ErrorCondition(8);        // kLinearlyDependentArg1Arg2Arg3,
  AcGe_kArg1TooBig                          = TAcGe_ErrorCondition(9);        // kArg1TooBig,
  AcGe_kArg1OnThis                          = TAcGe_ErrorCondition(10);       // kArg1OnThis,
  AcGe_kArg1InsideThis                      = TAcGe_ErrorCondition(11);       // kArg1InsideThis  };

// Curve/surface intersection configuration.
// Categorize an intersection and categorize a neighborhood of the
// curve just above or below the curve/surface intersection.
// 'Above' and 'below' is with respect to the curve parameterization.
// If an intersection is not empty, coincident or tangent, it is transverse.
// 'Inside' and 'outside' the surface is with respect to its surface normal
// orientation.
  // enum csiConfig {
  AcGe_kXUnknown                            = TAcGe_csiConfig(0);             // kXUnknown,
  AcGe_kXOut                                = TAcGe_csiConfig(1);             // kXOut,                 // Transverse.  Curve neighborhood is outside the surface.
  AcGe_kXIn                                 = TAcGe_csiConfig(2);             // kXIn,                  // Transverse.  Curve neighborhood is inside the surface.
  AcGe_kXTanOut                             = TAcGe_csiConfig(3);             // kXTanOut,              // Tangent.  Curve neighborhood is outside the surface.
  AcGe_kXTanIn                              = TAcGe_csiConfig(4);             // kXTanIn,               //  Tangent.  Curve neighborhood is inside the surface.
  AcGe_kXCoincident                         = TAcGe_csiConfig(5);             // kXCoincident,          // Non-zero length.  Point is on the intersection boundary.
  AcGe_kXCoincidentUnbounded                = TAcGe_csiConfig(6);             // kXCoincidentUnbounded  // Non-zero length.  Point is an arbitrary point on an unbounded intersection.   };

// Categorize the surface/surface intersection component.
  // enum ssiType {
  AcGe_kSSITransverse                       = TAcGe_ssiType(0);               // kSSITransverse,  // Non-tangent intersection.
  AcGe_kSSITangent                          = TAcGe_ssiType(1);               // kSSITangent,   // Tangent intersection.
// Surface normals identical at any point within the component.
  AcGe_kSSIAntiTangent                      = TAcGe_ssiType(2);               // kSSIAntiTangent  // Tangent intersection.
// Surface normals opposite at any point within the component. };

// Surface/surface intersection configuration.
// Categorize the neighborhood of a surface just to the left or right of the
// surface/surface intersection curve with respect to the other surface.
// Inside (outside) means that the neighborhood is inside (outside) the
// other surface with respect to the surface normal orientation
// of the other surface.
// The surface neighborhoods 'left' and 'right' of a curve on a surface
// are with respect to its surface normal orientation and the direction of
// the curve parameterization.
  // enum ssiConfig {
  AcGe_kSSIUnknown                          = TAcGe_ssiConfig(0);             // kSSIUnknown,
  AcGe_kSSIOut                              = TAcGe_ssiConfig(1);             // kSSIOut,            // Neighborhood is outside the surface.
  AcGe_kSSIIn                               = TAcGe_ssiConfig(2);             // kSSIIn,            // Neighborhood is inside the surface.
  AcGe_kSSICoincident                       = TAcGe_ssiConfig(3);             // kSSICoincident      // Non-zero area intersection. };

  // enum AcGeIntersectError {
  AcGe_kXXOk                                = TAcGe_AcGeIntersectError(0);    // kXXOk,
  AcGe_kXXIndexOutOfRange                   = TAcGe_AcGeIntersectError(0);    // kXXIndexOutOfRange,
  AcGe_kXXWrongDimensionAtIndex             = TAcGe_AcGeIntersectError(0);    // kXXWrongDimensionAtIndex,
  AcGe_kXXUnknown                           = TAcGe_AcGeIntersectError(0);    // kXXUnknown  };


// ***************************************************************************** AcGeLib/GELIBVER
const
  IMAGE_MAJOR_VER       = 2;  // #define IMAGE_MAJOR_VER          2
  IMAGE_MINOR_VER       = 0;  // #define IMAGE_MINOR_VER          0
  IMAGE_CORRECTIVE_VER  = 0;  // #define IMAGE_CORRECTIVE_VER     0
  IMAGE_INTERNAL_VER    = 0;  // #define IMAGE_INTERNAL_VER       0

// ***************************************************************************** AcGiLib/ACGI
type
  TAcGiRegenType = Integer;
  TAcGiFillType = Integer;
  TAcGiVisibility = Integer;
  TAcGiArcType = Integer;
  TAcGiOrientationType = Integer;
  TAcGiDeviationType = Integer;
  TAcGiImageOrg = Integer;
  TAcGiImageOrient = Integer;

const
  ACGI_SERVICES: PChar    = 'AcGiServices'; // #define ACGI_SERVICES  (*MSG0*)"AcGiServices"


const
// These are the current kinds of viewport regeneration modes. This mode is not settable by the user, but it can be queried in case you need to take different actions for different regeneration modes.
  // typedef enum {
  AcGiRegenType_eAcGiRegenTypeInvalid       = TAcGiRegenType(0);              // eAcGiRegenTypeInvalid = 0,
  AcGiRegenType_kAcGiStandardDisplay        = TAcGiRegenType(2);              // kAcGiStandardDisplay = 2,
  AcGiRegenType_kAcGiHideOrShadeCommand     = TAcGiRegenType(3);              // kAcGiHideOrShadeCommand,
  AcGiRegenType_kAcGiRenderCommand          = TAcGiRegenType(4);              // kAcGiRenderCommand,
  AcGiRegenType_kAcGiForExplode             = TAcGiRegenType(5);              // kAcGiForExplode,
  AcGiRegenType_kAcGiSaveWorldDrawForProxy  = TAcGiRegenType(6);              // kAcGiSaveWorldDrawForProxy } AcGiRegenType;

// No longer supported and will be removed
  kAcGiSaveWorldDrawForR12                      = 5;  // #define kAcGiSaveWorldDrawForR12 kAcGiForExplode

// These are the current face filling modes
  // typedef enum {
  AcGiFillType_kAcGiFillAlways              = TAcGiFillType(1);               // kAcGiFillAlways = 1,
  AcGiFillType_kAcGiFillNever               = TAcGiFillType(2);               // kAcGiFillNever } AcGiFillType;

// These are the edge visibility types
  // typedef enum {
  AcGiVisibility_kAcGiInvisible             = TAcGiVisibility(0);             // kAcGiInvisible = 0,
  AcGiVisibility_kAcGiVisible               = TAcGiVisibility(1);             // kAcGiVisible,
  AcGiVisibility_kAcGiSilhouette            = TAcGiVisibility(2);             // kAcGiSilhouette  } AcGiVisibility;

// These are the types of arcs
  // typedef enum {
  AcGiArcType_kAcGiArcSimple                = TAcGiArcType(0);                // kAcGiArcSimple = 0, // just the arc (not fillable)
  AcGiArcType_kAcGiArcSector                = TAcGiArcType(1);                // kAcGiArcSector,     // area bounded by the arc and its center of curvature
  AcGiArcType_kAcGiArcChord                 = TAcGiArcType(2);                // kAcGiArcChord       // area bounded by the arc and its end points } AcGiArcType;

// These are the possible types of vertex orientation
  // typedef enum {
  AcGiOrientationType_kAcGiCounterClockwise   = TAcGiOrientationType(-1);     // kAcGiCounterClockwise = -1,
  AcGiOrientationType_kAcGiNoOrientation      = TAcGiOrientationType(0);      // kAcGiNoOrientation = 0,
  AcGiOrientationType_kAcGiClockwise          = TAcGiOrientationType(1);      // kAcGiClockwise = 1 } AcGiOrientationType;

// This signifies how to calculate maximum deviation for tesselation
  // typedef enum {
  AcGiDeviationType_kAcGiMaxDevForCircle      = TAcGiDeviationType(0);        // kAcGiMaxDevForCircle = 0,
  AcGiDeviationType_kAcGiMaxDevForCurve       = TAcGiDeviationType(1);        // kAcGiMaxDevForCurve,
  AcGiDeviationType_kAcGiMaxDevForBoundary    = TAcGiDeviationType(2);        // kAcGiMaxDevForBoundary,
  AcGiDeviationType_kAcGiMaxDevForIsoline     = TAcGiDeviationType(3);        // kAcGiMaxDevForIsoline,
  AcGiDeviationType_kAcGiMaxDevForFacet       = TAcGiDeviationType(4);        // kAcGiMaxDevForFacet  } AcGiDeviationType;

// Raster image organization
  // typedef enum {
  AcGiImageOrg_kAcGiBitonal                 = TAcGiImageOrg(0);               // kAcGiBitonal,
  AcGiImageOrg_kAcGiPalette                 = TAcGiImageOrg(1);               // kAcGiPalette,
  AcGiImageOrg_kAcGiGray                    = TAcGiImageOrg(2);               // kAcGiGray,
  AcGiImageOrg_kAcGiRGBA                    = TAcGiImageOrg(3);               // kAcGiRGBA,
  AcGiImageOrg_kAcGiBGRA                    = TAcGiImageOrg(4);               // kAcGiBGRA,
  AcGiImageOrg_kAcGiARGB                    = TAcGiImageOrg(5);               // kAcGiARGB,
  AcGiImageOrg_kAcGiABGR                    = TAcGiImageOrg(6);               // kAcGiABGR,
  AcGiImageOrg_kAcGiBGR                     = TAcGiImageOrg(7);               // kAcGiBGR,
  AcGiImageOrg_kAcGiRGB                     = TAcGiImageOrg(8);               // kAcGiRGB  } AcGiImageOrg;

// Raster image orientation
  // typedef enum {
  AcGiImageOrient_kAcGiXLeftToRightTopFirst     = TAcGiImageOrient(0);        // kAcGiXLeftToRightTopFirst,
  AcGiImageOrient_kAcGiXLeftToRightBottomFirst  = TAcGiImageOrient(1);        // kAcGiXLeftToRightBottomFirst,
  AcGiImageOrient_kAcGiXRightToLeftTopFirst     = TAcGiImageOrient(2);        // kAcGiXRightToLeftTopFirst,
  AcGiImageOrient_kAcGiXRightToLeftBottomFirst  = TAcGiImageOrient(3);        // kAcGiXRightToLeftBottomFirst,
  AcGiImageOrient_kAcGiYTopToBottomLeftFirst    = TAcGiImageOrient(4);        // kAcGiYTopToBottomLeftFirst,
  AcGiImageOrient_kAcGiYTopToBottomRightFirst   = TAcGiImageOrient(5);        // kAcGiYTopToBottomRightFirst,
  AcGiImageOrient_kAcGiYBottomToTopLeftFirst    = TAcGiImageOrient(6);        // kAcGiYBottomToTopLeftFirst,
  AcGiImageOrient_kAcGiYBottomToTopRightFirst   = TAcGiImageOrient(7);        // kAcGiYBottomToTopRightFirst } AcGiImageOrient;


type
  // struct AcGiSentScanLines  {
  TAcGiSentScanLines_IsmRequestStatus = Integer;                                       // enum IsmRequestStatus {

const
  AcGiSentScanLines_eOk                     = TAcGiSentScanLines_IsmRequestStatus(0);  // eOk,                      // No Failure.
  AcGiSentScanLines_eInvalidInput           = TAcGiSentScanLines_IsmRequestStatus(1);  // eInvalidInput,          // unknown image organization
  AcGiSentScanLines_eInvalidColorDepth      = TAcGiSentScanLines_IsmRequestStatus(2);  // eInvalidColorDepth,     // mColorDepth to big or too small for request
  AcGiSentScanLines_eInvalidPixelRequest    = TAcGiSentScanLines_IsmRequestStatus(3);  // eInvalidPixelRequest,   // IefAffine (matrix scaling) failed for some reason
  AcGiSentScanLines_eInvalidDeliveryMethod  = TAcGiSentScanLines_IsmRequestStatus(4);  // eInvalidDeliveryMethod,   // Frame buffer delivery + compression - not valid
  AcGiSentScanLines_eNoValidCompressors     = TAcGiSentScanLines_IsmRequestStatus(5);  // eNoValidCompressors,     // no compressors for image data
  AcGiSentScanLines_eInsufficientMemory     = TAcGiSentScanLines_IsmRequestStatus(6);  // eInsufficientMemory      // low memory conditions.. very bad  };

type
  // struct AcGiRequestScanLines {
  TAcGiRequestScanLines_IEDitherMethod = Integer;
  TAcGiRequestScanLines_IEColorSystem  = Integer;
  TAcGiRequestScanLines_IIEColorSystem = Integer;
  TAcGiRequestScanLines_ImagePaletteType = Integer;

const
  // enum IEDitherMethod {
  AcGiRequestScanLines_kIEAnyPalette            = TAcGiRequestScanLines_IEDitherMethod(0);  // kIEAnyPalette,
  AcGiRequestScanLines_kCustomDithering         = TAcGiRequestScanLines_IEDitherMethod(1);  // kCustomDithering,
  AcGiRequestScanLines_kCustomDitheringMethod   = TAcGiRequestScanLines_IEDitherMethod(2);  // kCustomDitheringMethod };

  // enum IEColorSystem {
  AcGiRequestScanLines_kBitonal             = TAcGiRequestScanLines_IIEColorSystem(0);      // kBitonal,
  AcGiRequestScanLines_kCMY                 = TAcGiRequestScanLines_IIEColorSystem(1);      // kCMY,
  AcGiRequestScanLines_kCMYK                = TAcGiRequestScanLines_IIEColorSystem(2);      // kCMYK,
  AcGiRequestScanLines_kRGBl                = TAcGiRequestScanLines_IIEColorSystem(3);      // kRGB };

  // enum ImagePaletteType {
  AcGiRequestScanLines_kFromDevice          = TAcGiRequestScanLines_ImagePaletteType(0);    // kFromDevice,
  AcGiRequestScanLines_kFromIeWholeImage    = TAcGiRequestScanLines_ImagePaletteType(1);    // kFromIeWholeImage };

type
  // typedef enum AcGiColorIntensity {
  TAcGiColorIntensity = Integer;

const
  AcGiColorIntensity_kAcGiMinColorIntensity = TAcGiColorIntensity($0);        // kAcGiMinColorIntensity = 0x0,
  AcGiColorIntensity_kAcGiColorIntensity1   = TAcGiColorIntensity($1);        // kAcGiColorIntensity1   = 0x1,
  AcGiColorIntensity_kAcGiColorIntensity2   = TAcGiColorIntensity($2);        // kAcGiColorIntensity2   = 0x2,
  AcGiColorIntensity_kAcGiColorIntensity3   = TAcGiColorIntensity($3);        // kAcGiColorIntensity3   = 0x3,
  AcGiColorIntensity_kAcGiColorIntensity4   = TAcGiColorIntensity($4);        // kAcGiColorIntensity4   = 0x4,
  AcGiColorIntensity_kAcGiColorIntensity5   = TAcGiColorIntensity($5);        // kAcGiColorIntensity5   = 0x5,
  AcGiColorIntensity_kAcGiColorIntensity6   = TAcGiColorIntensity($6);        // kAcGiColorIntensity6   = 0x6,
  AcGiColorIntensity_kAcGiMaxColorIntensity = TAcGiColorIntensity($7);        // kAcGiMaxColorIntensity = 0x7 };

type
  TAcGiDrawableTraits_LayerFlags = Integer;
  TAcGiViewportGeometry_ImageSource  = Integer;

const
  //class AcGiDrawableTraits: public AcGiSubEntityTraits  // enum LayerFlags {
  AcGiDrawableTraits_kNone                  = TAcGiDrawableTraits_LayerFlags($00);  // kNone       = 0x00,
  AcGiDrawableTraits_kOff                   = TAcGiDrawableTraits_LayerFlags($01);  // kOff        = 0x01,
  AcGiDrawableTraits_kFrozen                = TAcGiDrawableTraits_LayerFlags($02);  // kFrozen     = 0x02,
  AcGiDrawableTraits_kZero                  = TAcGiDrawableTraits_LayerFlags($03);  // kZero       = 0x04 };

  //class AcGiViewportGeometry: public AcGiGeometry   //    enum ImageSource {
  AcGiViewportGeometry_kFromDwg             = TAcGiViewportGeometry_ImageSource(0); //        kFromDwg,
  AcGiViewportGeometry_kFromOleObject       = TAcGiViewportGeometry_ImageSource(1); //        kFromOleObject,
  AcGiViewportGeometry_kFromRender          = TAcGiViewportGeometry_ImageSource(2); //        kFromRender };

type
  TAcGiSentScanLines = record                     // struct AcGiSentScanLines {
    mpPixelBuffer: PAdesk_Int8;                           //   Adesk::Int8 *    mpPixelBuffer;          // one pointer per scan line
    mRowBytes: TAdesk_UInt32;                             //   Adesk::UInt32    mRowBytes;              // number of bytes per scan line
    mpImageId: Pointer;                                   //   void *        mpImageId;              // image id ptr
    mIsCancelled: TAdesk_Int16;                           //   Adesk::Int16     mIsCancelled;           // boolean: user cancelled
    mHasFailed: TAdesk_Int16;                             //   Adesk::Int16     mHasFailed;             // boolean: request failed
    mpCompressionModes: PChar;                            //   char *           mpCompressionModes;
    mBytes: TAdesk_UInt32;                                //   Adesk::UInt32    mBytes;
    mRequestStatus: TAcGiSentScanLines_IsmRequestStatus;  //   IsmRequestStatus mRequestStatus;
  end;                                                    // };

  TAcGiRequestScanLines_BackgroundColor = record        // union {
    case rgbtype: Byte of
    0: (mBackgroundIndex: TAdesk_Int16);                      //   Adesk::Int16 mBackgroundIndex;
    1: (mBackgroundRGB: array[0..2]of TAdesk_Int8);           //   Adesk::Int8 mBackgroundRGB[3];
  end;                                                        // } mBackgroundColor;       // current background color

  TAcGiRequestScanLines_TransparentColor = record     // union {
    case rgbtype: Byte of
    0: (mTransparentIndex: TAdesk_Int16);                     //   Adesk::Int16 mTransparentIndex;
    1: (mTransparentRGB: array[0..2]of TAdesk_Int8);          //   Adesk::Int8 mTransparentRGB[3];
  end;                                                        // } mTransparentColor;      // current background color

  TAcGiRequestScanLines_EntityColor = record            // union {
    case rgbtype: Byte of
    0: (mEntityIndex: TAdesk_Int16);                          //   Adesk::Int16 mEntityIndex;
    1: (mEntityRGB: array[0..2]of TAdesk_Int8);               //   Adesk::Int8 mEntityRGB[3];
  end;                                                        // } mEntityColor;           // bitonal image foregrnd color

  TAcGiRequestScanLines = record                          // struct AcGiRequestScanLines {
    mPixelMinX: TAdesk_UInt32;                                    //   Adesk::UInt32       mPixelMinX;             // requested pixel corners
    mPixelMinY: TAdesk_UInt32;                                    //   Adesk::UInt32       mPixelMinY;
    mPixelMaxX: TAdesk_UInt32;                                    //   Adesk::UInt32       mPixelMaxX;
    mPixelMaxY: TAdesk_UInt32;                                    //   Adesk::UInt32       mPixelMaxY;
    mLowerLeft: TposAcGePoint2d;                                  //   AcGePoint2d         mLowerLeft;             // requested lower left corner
    mUpperRight: TposAcGePoint2d;                               //   AcGePoint2d         mUpperRight;            // requested upper right corner
    mpImageId: Pointer;                                           //   void *              mpImageId;              // image handle
    mImageOrg: TAcGiImageOrg;                                     //   AcGiImageOrg        mImageOrg;              // enum type: palette, RGB
    mImageOrient: TAcGiImageOrient;                               //   AcGiImageOrient     mImageOrient;           // enum type
    mWindowId: TAdesk_Int16;                                      //   Adesk::Int16        mWindowId;              // acad window id
    mColorDepth: TAdesk_Int16;                                    //   Adesk::Int16        mColorDepth;            // bits per pixel
    mBackgroundColor: TAcGiRequestScanLines_BackgroundColor;      //   union {Adesk::Int16 mBackgroundIndex; Adesk::Int8 mBackgroundRGB[3];} mBackgroundColor;       // current background color
    mTransparentColor: TAcGiRequestScanLines_TransparentColor;    //   union {Adesk::Int16 mTransparentIndex; Adesk::Int8 mTransparentRGB[3];} mTransparentColor;    // current background color
    mEntityColor: TAcGiRequestScanLines_EntityColor;              //   union {Adesk::Int16 mEntityIndex; Adesk::Int8 mEntityRGB[3];} mEntityColor;           // bitonal image foregrnd color
    mPaletteIncarnation: TAdesk_Int32;                            //   Adesk::Int32        mPaletteIncarnation;    // unique palette indentifier
    mpPalette: PAdesk_Int8;                                       //   Adesk::Int8 *       mpPalette;              // pointer to 256 RGB triples
    mIsDisplay: TAdesk_Int16;                                     //   Adesk::Int16        mIsDisplay;             // boolean: TRUE=dsply, FALSE=hrdcpy
    mRasterRatio: Double;                                         //   double              mRasterRatio;           // raster resolution
    mPixelToDc: TposAcGeMatrix2d;                               //   AcGeMatrix2d        mPixelToDc;             // source pixel-to-dc transform
    mpCompressionModes: PChar;                                    //   char *              mpCompressionModes;
    mPaletteType: TAcGiRequestScanLines_ImagePaletteType;         //   ImagePaletteType    mPaletteType;
    mpDataBuffer: Pointer;                                        //   void *              mpDataBuffer;
    mRowWidth: TAdesk_Int32;                                      //   Adesk::Int32        mRowWidth;
    mNumRows: TAdesk_Int32;                                       //   Adesk::Int32   mNumRows;
    mpBoundaryPoints: PAdesk_Int32;                               //   Adesk::Int32 const *mpBoundaryPoints;        // array of x,y pairs
    mnContours: TAdesk_UInt32;                                    //   Adesk::UInt32       mnContours;              // number of contours
    mpCounts: PAdesk_Int32;                                       //   Adesk::Int32 const *mpCounts;                // pt count for each contour
  end;                                                            // };

  TAcGiClipBoundary = record                                // struct AcGiClipBoundary {
    m_vNormal: TposAcGeVector3d;                                  //   AcGeVector3d        m_vNormal;
    m_ptPoint: TposAcGePoint3d;                                 //   AcGePoint3d         m_ptPoint;
    m_aptPoints: TposAcGePoint2dArray;                            //   AcGePoint2dArray    m_aptPoints;
    m_xToClipSpace: TposAcGeMatrix3d;                           //   AcGeMatrix3d        m_xToClipSpace;          // Transformation from model to clip space
    m_xInverseBlockRefXForm: TposAcGeMatrix3d;                    //   AcGeMatrix3d        m_xInverseBlockRefXForm; // Xform from block space to world
    m_bClippingFront: TAdesk_Boolean;                             //   Adesk::Boolean      m_bClippingFront;
    m_bClippingBack: TAdesk_Boolean;                              //   Adesk::Boolean      m_bClippingBack;
    m_dFrontClipZ: Double;                                        //   double              m_dFrontClipZ;
    m_dBackClipZ: Double;                                         //   double              m_dBackClipZ;
    m_bDrawBoundary: TAdesk_Boolean;                              //   Adesk::Boolean      m_bDrawBoundary;
  end;                                                            // };

// ***************************************************************************** AcGiLib/DRAWABLE
type
  TAcGiDrawable_SetAttributesFlags = Integer;

 const
  //class AcGiDrawable : public AcRxObject  // enum SetAttributesFlags {
// Default drawable, just uses acgi primitives and does not use nested calls to draw()
  AcgiDrawable_kDrawableNone                          = TAcGiDrawable_SetAttributesFlags(0);    // kDrawableNone   =  0,

// AcDbEntity derived classes (may require some special processing)
  AcgiDrawable_kDrawableIsAnEntity                    = TAcGiDrawable_SetAttributesFlags(1);    // kDrawableIsAnEntity   =  1,

// (block table record) Uses nesting but does not send down additional primitives.
// It uses draw() exclusively and makes no calls to the other AcGi primitives such as circle or shell
  AcgiDrawable_kDrawableUsesNesting                   = TAcGiDrawable_SetAttributesFlags(2);    // kDrawableUsesNesting  =  2,

// You MUST specify this value if you nest entities as a block does.
  AcgiDrawable_kDrawableIsCompoundObject              = TAcGiDrawable_SetAttributesFlags(4);    // kDrawableIsCompoundObject  =  4,

// Employ per-Viewport caching of viewportDraw geometry.  As well, this drawable does not use worldDraw.
  AcgiDrawable_kDrawableViewIndependentViewportDraw   = TAcGiDrawable_SetAttributesFlags(8);    // kDrawableViewIndependentViewportDraw  =  8,

// If this entity is not visible (AcDbEntity::visibility())
  AcgiDrawable_kDrawableIsInvisible                   = TAcGiDrawable_SetAttributesFlags(16);   // kDrawableIsInvisible =  16,

// If a compound object has attributes it must specify this value
  AcgiDrawable_kDrawableHasAttributes                 = TAcGiDrawable_SetAttributesFlags(32);   // kDrawableHasAttributes   =  32,

// If the geometry you elaborate is dependant on the regentype; for instance, if your drawable draws itself as a set of polygons in a
// "shaded" regen-mode but as a set of wires in "standard display", specify this flag
  AcgiDrawable_kDrawableRegenTypeDependantGeometry    = TAcGiDrawable_SetAttributesFlags(64);   // kDrawableRegenTypeDependantGeometry  =  64,

// Dimensions recieve special handling, behaving similarly to blocks
  AcgiDrawable_kDrawableIsDimension                   = TAcGiDrawable_SetAttributesFlags(133);  // kDrawableIsDimension = (kDrawableIsAnEntity + kDrawableIsCompoundObject + 128) };

// ***************************************************************************** SCENE.H
const
  FACEVER = 0;          // #define FACEVER  0   (* The internal version in header rec *)

  HEADER  = Char('H');  // #define    HEADER          (*MSG0*)'H'
  ENTITY  = Char('E');  // #define    ENTITY          (*MSG0*)'E'
  EVERTEX = Char('V');  // #define    EVERTEX         (*MSG0*)'V'
  POLYGON = Char('P');  // #define    POLYGON         (*MSG0*)'P'
  CONTOUR = Char('X');  // #define    CONTOUR         (*MSG0*)'X'
  SHADER  = Char('D');  // #define    SHADER          (*MSG0*)'D'
  CMESH   = Char('H');  // #define    CMESH           (*MSG0*)'H'
  BLOCK_B = Char('U');  // #define    BLOCK_B         (*MSG0*)'U'     (* pUsh block *)
  BLOCK_E = Char('O');  // #define    BLOCK_E         (*MSG0*)'O'     (* pOp block *)
  E_LAYER = Char('L');  // #define    E_LAYER         (*MSG0*)'L'     (* Layer entity *)

  // (* The status field *)
  // (*#define         CURVE           0x1*)
  TOPBOT  = $2;         // #define         TOPBOT          0x2


  // (* Bits defined for the entity flags field *)
  ENT_HAS_CMESH   = 1;  // #define ENT_HAS_CMESH  1  (* set if cmesh output for this mesh *)
  ENT_HAS_XFORM   = 2;  // #define ENT_HAS_XFORM  2  (* set if transform follows entity *)
  ENT_HAS_XDATA   = 4;  // #define ENT_HAS_XDATA  4  (* Set if entity has xdata *)
  ENT_HAS_NORMAL  = 8;  // #define ENT_HAS_NORMAL 8  (* Set if entity has normals *)
  ENT_HAS_SUBENT  = 16; // #define ENT_HAS_SUBENT 16 (* Set if entity has subentity *)
  RENDER_CACHE    = 1;  // #define RENDER_CACHE      1

type
  Tscn_cmesh = record                       // struct scn_cmesh {
    id: Char;                                       //   char   id;
    flags: Smallint;                                //   short  flags;
    next: Longint;                                  //   long   next;
    mshtype: Smallint;                              //   short  mshtype;
    color: Smallint;                                //   short  color;
    nverts: Smallint;                               //   short  nverts;
    m: Smallint;                                    //   short  m;
    n: Smallint;                                    //   short  n;
  end;                                              //    };

// The SCENE file vertex record. Note that all of the face's vertices will be written sequentially
type
  Tscn_vrtc = record                          // struct scn_vrtc {
    id: Char;                                       //   char   id;
    vert: array[0..2]of Double;                     //   double vert[3];      /* vertex coordinates */
  end;                                              //   };

// The scene file polygonal mesh record
type
  Tscn_pmsh = record                          // struct scn_pmsh {
    id: Char;                                       //   char   id;
    flags: Smallint;                                //   short  flags;        /* Flag    TOP/BOTTOM */
    adr1: Longint;                                  //   long   adr1;         /* entity address */
    adr2: Longint;                                   //   long   adr2;          /* validation code of address */
    layerindex: Longint;                            //   long   layerindex;   /* index into the layer table for this */
    color: Smallint;                                //   short  color;        /* Face's surface property */
    ncvrtx: Smallint;                               //   short  ncvrtx;       /* Number of contour vertexes */
  end;                                              //  };

// The scene file polygon contour vertex record
type
  Tscn_cvrt = record                          // struct scn_cvrt {
    id: Char;                                       //   char   id;
    index: Longint;                                 //   long   index;        /* Mesh vertex number */
  end;                                              // };

// Description of the temporary record used to keep the polygonal mesh vertexes. This record belongs to the temporary file (VERTEX.$AS) which is a binary tree of all of the vertexes of a given polygonal mesh
type
  Tscn_node = record                          // struct scn_node {
    vertex: array[0..2]of Double;                   //  double vertex[3];     /* The vertex */
    normal: array[0..2]of Double;                   //  double normal[3];     /* The normal */
    left: Longint;                                  //  long left;            /* Address of the left node */
    right: Longint;                                 //  long right;           /* Address of the right node */
  end;                                              // };

// New record types for the ent2face() facility. We use a slightly different approach than the filmroll file, and treat everything
// as a polymesh.  We also put out an Entity record for each entity as it is regen'd and this record contains slightly different information than the current scn_ent record.

// Size of color map in bytes.  This is a bit-coded color map used to tell the application which colors are used in the ent2face file
const
  CMAPSIZE    = 32;                                 // #define CMAPSIZE 32

type
  Pe2f_hdr = ^Te2f_hdr;
  Te2f_hdr = record                         // struct e2f_hdr {          /* Header Record */
    id: Char;                                       //   char id;                /* Record type */
    flags: Smallint;                                //   short flags;            /* bit flags */
    version: Smallint;                              //   short version;          /* version ID */
    nents: Longint;                                 //   long nents;             /* Number of entities that follow */
    npoly: Longint;                                 //   long npoly;             /* Total number of polygons */
    nlayers: Longint;                               //   long nlayers;           /* Total number of layers */
    bgcolor: Dword;                                 //   unsigned long bgcolor;  /* AutoCAD's background color */
    cmaplen: Smallint;                              //   short cmaplen;          /* Length of color map */
    cmap: PChar;                                    //   char *cmap;             /* Bit-coded colour map */
  end;                                              // };

  Te2f_layer = record                       // struct e2f_layer {        /* Layer Record */
    id: Char;                                       //   char id;                /* Record type */
    layernamelen: Smallint;                         //   short layernamelen;     /* Length of layer name */
    lname: PChar;                                   //   char *lname;            /* Name of the layer */
  end;                                              // };

  Te2f_ent = record                           // struct e2f_ent {          /* Entity Record */
    id: Char;                                       //   char id;                /* Record type */
    flags: Smallint;                                //   short flags;            /* bit flags */
    etype: Smallint;                                //   short type;             /* E.tcode */
    adr1: Longint;                                  //   long  adr1;             /* entity address */
    adr2: Longint;                                  //   long  adr2;             /* validation code of address */
    npoly: Longint;                                 //   long  npoly;            /* Number of polygons */
    nverts: Longint;                                //   long  nverts;           /* Number of vertices */
    color: Smallint;                                //   short color;            /* color of entity */
    layerindex: Smallint;                           //   long layerindex;        /* index into the layer table for this entities layer */
  end;                                              // };

type
  Te2f_xform = record                       // struct e2f_xform {        /* Transform Record */
    id: Char;                                       //    char id;               /* Record type */
    flags: Smallint;                                //    short flags;           /* bit flags */
    xfmatrix: array[0..3,0..3]of Double;            //    double xfmatrix[4][4]; /* 4 x 4 transform */
  end;                                              //  };

// ***************************************************************************** AcRxLib/RXDEFS
type
  // struct AcRx {
  TAcRx_DictIterType = Integer;
  TAcRx_Ordering = Integer;
  TAcRx_AppMsgCode = Integer;
  TAcRx_AppRetCode = Integer;

const
  // typedef void (*FcnPtr) ();
  // enum DictIterType {
  AcRx_kDictSorted          = TAcRx_DictIterType(0);  // kDictSorted   = 0,
  AcRx_kDictCollated        = TAcRx_DictIterType(1);  // kDictCollated = 1 };

  // enum  Ordering {
  AcRx_kLessThan            = TAcRx_Ordering(-1);     // kLessThan     = -1,
  AcRx_kEqual               = TAcRx_Ordering(0);      // kEqual        = 0,
  AcRx_kGreaterThan         = TAcRx_Ordering(1);      // kGreaterThan  = 1,
  AcRx_kNotOrderable        = TAcRx_Ordering(2);      // kNotOrderable = 2 };

  // enum  AppMsgCode {
  AcRx_kNullMsg             = TAcRx_AppMsgCode(0);    // kNullMsg         = 0,
  AcRx_kInitAppMsg          = TAcRx_AppMsgCode(1);    // kInitAppMsg      = 1,
  AcRx_kUnloadAppMsg        = TAcRx_AppMsgCode(2);    // kUnloadAppMsg    = 2,
  AcRx_kLoadDwgMsg          = TAcRx_AppMsgCode(3);    // kLoadDwgMsg      = 3,
  AcRx_kUnloadDwgMsg        = TAcRx_AppMsgCode(4);    // kUnloadDwgMsg    = 4,
  AcRx_kInvkSubrMsg         = TAcRx_AppMsgCode(5);    // kInvkSubrMsg     = 5,
  AcRx_kCfgMsg              = TAcRx_AppMsgCode(6);    // kCfgMsg          = 6,
  AcRx_kEndMsg              = TAcRx_AppMsgCode(7);    // kEndMsg          = 7,
  AcRx_kQuitMsg             = TAcRx_AppMsgCode(8);    // kQuitMsg         = 8,
  AcRx_kSaveMsg             = TAcRx_AppMsgCode(9);    // kSaveMsg         = 9,
  AcRx_kDependencyMsg       = TAcRx_AppMsgCode(10);   // kDependencyMsg   = 10,
  AcRx_kNoDependencyMsg     = TAcRx_AppMsgCode(11);   // kNoDependencyMsg = 11,
  AcRx_kOleUnloadAppMsg     = TAcRx_AppMsgCode(12);   // kOleUnloadAppMsg = 12,
  AcRx_kPreQuitMsg          = TAcRx_AppMsgCode(13);   // kPreQuitMsg      = 13,
  AcRx_kInitDialogMsg       = TAcRx_AppMsgCode(14);   // kInitDialogMsg   = 14,
  AcRx_kEndDialogMsg        = TAcRx_AppMsgCode(15);   // kEndDialogMsg    = 15 };

  AcRx_kLoadDrxMsg          = TAcRx_AppMsgCode(-1);   // DelphiARX
  AcRx_kUnloadDrxMsg        = TAcRx_AppMsgCode(-2);   // DelphiARX

  // enum  AppRetCode {
  AcRx_kRetOK               = TAcRx_AppRetCode(0);    // kRetOK     = 0,
  AcRx_kRetError            = TAcRx_AppRetCode(3);    // kRetError  = 3 };
  // };


// ***************************************************************************** AcRxLib/RXDLINKR
type
  // struct AcadApp {
   TAcadApp_LoadReasons = Integer;
   TAcadApp_ErrorStatus = Integer;

const
  // enum LoadReasons {
  AcadApp_kOnProxyDetection                 = TAcadApp_LoadReasons($01);      // kOnProxyDetection       = 0x01,
  AcadApp_kOnAutoCADStartup                 = TAcadApp_LoadReasons($02);      // kOnAutoCADStartup       = 0x02,
  AcadApp_kOnCommandInvocation              = TAcadApp_LoadReasons($04);      // kOnCommandInvocation    = 0x04,
  AcadApp_kOnLoadRequest                    = TAcadApp_LoadReasons($08);      // kOnLoadRequest          = 0x08,
  AcadApp_kLoadDisabled                     = TAcadApp_LoadReasons($10);      // kLoadDisabled           = 0x10,
  AcadApp_kTransparentlyLoadable            = TAcadApp_LoadReasons($20);      // kTransparentlyLoadable  = 0x20 };

  // enum ErrorStatus {
  AcadApp_eOk                               = TAcadApp_ErrorStatus(0);        // eOk              = 0,
  AcadApp_eInvalidKeyk                      = TAcadApp_ErrorStatus(1);        // eInvalidKey      = 1,
  AcadApp_eInvalidSubKey                    = TAcadApp_ErrorStatus(2);        // eInvalidSubKey   = 2,
  AcadApp_eKeyNotFound                      = TAcadApp_ErrorStatus(3);        // eKeyNotFound     = 3,
  AcadApp_eOutOfMemory                      = TAcadApp_ErrorStatus(4);        // eOutOfMemory     = 4,
  AcadApp_eInvalidValue                     = TAcadApp_ErrorStatus(5);        // eInvalidValue    = 5,
  AcadApp_eValueNotFound                    = TAcadApp_ErrorStatus(6);        // eValueNotFound   = 6,
  AcadApp_eKeyExists                        = TAcadApp_ErrorStatus(7);        // eKeyExists       = 7,
  AcadApp_eRegAccessDenied                  = TAcadApp_ErrorStatus(8);        // eRegAccessDenied = 8,
  AcadApp_eRejected                         = TAcadApp_ErrorStatus(9);        // eRejected        = 9 };


// ***************************************************************************** RXNAMES
const
  ACRX_SYS_INIT_MOD_FILE: Pchar     = 'acad.rx';            // #define ACRX_SYS_INIT_MOD_FILE        "acad.rx"
  ACRX_CLASS_DICTIONARY: Pchar      = 'ClassDictionary';    // #define ACRX_CLASS_DICTIONARY         "ClassDictionary"
  ACRX_DYNAMIC_LINKER: Pchar        = 'DynamicLinker';      // #define ACRX_DYNAMIC_LINKER           "DynamicLinker"
  ACRX_SERVICE_DICTIONARY: Pchar    = 'ServiceDictionary';  // #define ACRX_SERVICE_DICTIONARY       "ServiceDictionary"
  ACRX_KERNEL_SERVICES: Pchar       = 'KernelServices';     // #define ACRX_KERNEL_SERVICES          "KernelServices"


// ***************************************************************************** AcUiLib/ACUIEDIT
const
// data styles
  AC_ES_STRING    = $01;  // #define AC_ES_STRING   0x01
  AC_ES_SYMBOL    = $02;  // #define  AC_ES_SYMBOL  0x02
  AC_ES_NUMERIC   = $04;  // #define AC_ES_NUMERIC  0x04
  AC_ES_ANGLE     = $08;  // #define AC_ES_ANGLE    0x08

// behavior styles
  AC_ES_VAL_ONKILLFOCUS     = $10;  // #define AC_ES_VAL_ONKILLFOCUS     0x10
  AC_ES_CONV_ONKILLFOCUS    = $20;  // #define AC_ES_CONV_ONKILLFOCUS    0x20
  AC_ES_SHOW_ERRMSG         = $40;  // #define AC_ES_SHOW_ERRMSG         0x40
  AC_ES_ERRMSG_ALLOWIGNORE  = $80;  // #define AC_ES_ERRMSG_ALLOWIGNORE  0x80

// validation styles
  AC_ES_NOZERO      = $100; // #define AC_ES_NOZERO      0x100
  AC_ES_NOBLANK     = $200; // #define AC_ES_NOBLANK     0x200
  AC_ES_NONEGATIVE  = $400; // #define AC_ES_NONEGATIVE  0x400
  AC_ES_INRANGE     = $800; // #define  AC_ES_INRANGE    0x800

type
  TACUI_ERROR_CODE = Integer;

const
  // typedef enum {
  ACUI_ERROR_CODE_kAcUiError_None           = TACUI_ERROR_CODE(0);            // kAcUiError_None,      // No error; OK.
  ACUI_ERROR_CODE_kAcUiError_Blank          = TACUI_ERROR_CODE(1);            // kAcUiError_Blank,     // Data is blank
  ACUI_ERROR_CODE_kAcUiError_Symbol         = TACUI_ERROR_CODE(2);            // kAcUiError_Symbol,    // Detected illegal symbol syntax
  ACUI_ERROR_CODE_kAcUiError_Numeric        = TACUI_ERROR_CODE(3);            // kAcUiError_Numeric,   // Detected non-numeric data
  ACUI_ERROR_CODE_kAcUiError_Angle          = TACUI_ERROR_CODE(4);            // kAcUiError_Angle,     // Data does not represent an angle
  ACUI_ERROR_CODE_kAcUiError_Zero           = TACUI_ERROR_CODE(5);            // kAcUiError_Zero,      // Data is zero
  ACUI_ERROR_CODE_kAcUiError_Negative       = TACUI_ERROR_CODE(6);            // kAcUiError_Negative,  // Data is negative
  ACUI_ERROR_CODE_kAcUiError_Range          = TACUI_ERROR_CODE(7);            // kAcUiError_Range      // Data is out of range  // } ACUI_ERROR_CODE;


// ***************************************************************************** ADESKABB.H
type
  INT8    = type TAdesk_Int8;     // typedef Adesk::Int8      Int8;
  INT16   = type TAdesk_Int16;    // typedef Adesk::Int16     Int16;
  INT32   = type TAdesk_Int32;    // typedef Adesk::Int32     Int32;
  UINT8   = type TAdesk_UInt8;    // typedef Adesk::UInt8     UInt8;
  UINT16  = type TAdesk_UInt16;   // typedef Adesk::UInt16    UInt16;
  UINT32  = type TAdesk_UInt32;   // typedef Adesk::UInt32    UInt32;
  UCHAR   = type TAdesk_uchar;    // typedef Adesk::uchar     uchar;
  USHORT  = type TAdesk_ushort;   // typedef Adesk::ushort    ushort;
  UINT    = type TAdesk_uint;     // typedef Adesk::uint      uint;
  ULONG   = type TAdesk_ulong;    // typedef Adesk::ulong     ulong;
//  Boolean = type TAdesk_Boolean;  // typedef Adesk::Boolean   Boolean;

// ***************************************************************************** ADSCODES.H
const
  // AutoCAD to ADS program request type codes
  RQSAVE              = 14;   // #define RQSAVE  14 (* ACAD is saving the drawing *)
  RQEND               = 15;   // #define RQEND   15 (* ACAD is ending the drawing editor *)
  RQQUIT              = 16;   // #define RQQUIT  16 (* ACAD quits *)
  RQCFG               = 22;   // #define RQCFG   22 (* AutoCAD is returning from CONFIG *)

  // (* The following are LISP to Application ONLY request codes.They form the interface for ADS*)
  RQXLOAD             = 100;  // #define RQXLOAD 100 (* Load external functions *)
  RQXUNLD             = 101;  // #define RQXUNLD 101 (* UN-Load application  *)
  RQSUBR              = 102;  // #define RQSUBR  102 (* External subroutine request *)
  RQHUP               = 105;  // #define RQHUP   105 (* Acad has disconnected from the app *)
  RQXHELP             = 118;  // #define RQXHELP 118 (* Define help for this function *)

  // (*  ADS program to AutoCAD result type codes *)
  RSRSLT              = 1;    // #define RSRSLT   1 (* Result returned *)
  RSERR               = 3;    // #define RSERR    3 (* Error in evaluation -- no result *)

  // (*  Result value type codes
  // (* These are used in the resbuf.  These ARE NOT the same as the group codes used in the entity access routines, and sould
  // not be confused with those.  The same result buffer IS used for entity records, however, in which case the restype field may take
  // on many more values than those listed here.*)
  RTNONE              = 5000; // #define RTNONE    5000 (* No result *)
  RTREAL              = 5001; // #define RTREAL    5001 (* Real number *)
  RTPOINT             = 5002; // #define RTPOINT   5002 (* 2D point X and Y only *)
  RTSHORT             = 5003; // #define RTSHORT   5003 (* Short integer *)
  RTANG               = 5004; // #define RTANG     5004 (* Angle *)
  RTSTR               = 5005; // #define RTSTR     5005 (* String *)
  RTENAME             = 5006; // #define RTENAME   5006 (* Entity name *)
  RTPICKS             = 5007; // #define RTPICKS   5007 (* Pick set *)
  RTORINT             = 5008; // #define RTORINT   5008 (* Orientation *)
  RT3DPOINT           = 5009; // #define RT3DPOINT 5009 (* 3D point - X, Y, and Z *)
  RTLONG              = 5010; // #define RTLONG    5010 (* Long integer *)
  RTVOID              = 5014; // #define RTVOID    5014 (* Blank symbol *)
  RTLB                = 5016; // #define RTLB      5016 (* list begin *)
  RTLE                = 5017; // #define RTLE      5017 (* list end *)
  RTDOTE              = 5018; // #define RTDOTE    5018 (* dotted pair *)
  RTNIL               = 5019; // #define RTNIL     5019 (* nil *)
  RTDXF0              = 5020; // #define RTDXF0    5020 (* DXF code 0 for ads_buildlist only *)
  RTT                 = 5021; // #define RTT       5021 (* T atom *)
  RTRESBUF            = 5023; // #define RTRESBUF  5023 (* resbuf *)

  // (* The following RT codes are for the ADS program interface.
  // They are used to signal success or failure (error) of the ADS library functions.  RTFAIL in particular means that
  // the link has failed (most likely because AutoLISP has died or exited), and the application should cleanup and exit. *)
  RTNORM              = 5100; // #define RTNORM    5100 (* Request succeeded *)

  // (* Various error codes returned to ADS application by library *)
  RTERROR             = -5001; // #define RTERROR          (-5001) // Some other error
  RTCAN               = -5002; // #define RTCAN            (-5002) // User cancelled request -- Ctl-C
  RTREJ               = -5003; // #define RTREJ            (-5003) // AutoCAD rejected request -- invalid
  RTFAIL              = -5004; // #define RTFAIL           (-5004) // Link failure -- Lisp probably died
  RTKWORD             = -5005; // #define RTKWORD          (-5005) // Keyword returned from getxxx() routine
  RTINPUTTRUNCATED    = -5008; // #define RTINPUTTRUNCATED (-5008) // Input didn't all fit in the buffer

// ***************************************************************************** RXMFCAPI.H
const
  // Message codes for use with modeless Windows dialogs
  WM_ACAD_KEEPFOCUS   = WM_USER + $6D01;

type
  tagColorSettings = record
    dwGfxModelBkColor, dwGfxLayoutBkColor: DWORD;             // Graphics window
    dwTextForeColor, dwTextBkColor: DWORD;                    // Text window colors
    dwCmdLineForeColor, dwCmdLineBkColor: DWORD;              // Command line window
    dwModelCrossHairColor, dwLayoutCrossHairColor: DWORD;     // Graphics crosshair color
    dwAutoTrackingVecColor: DWORD;                            // AutoTrackin vector color
  end;
  TAcColorSettings = tagColorSettings;
  PAcColorSettings = ^TAcColorSettings;

  PacedDwgPoint = ^TacedDwgPoint;
  TacedDwgPoint = array[0..2]of double;                       // typedef double acedDwgPoint[3];

  PPMSG = ^PMSG;
  PAcedWatchWinMsgFn = ^TAcedWatchWinMsgFn;
  TAcedWatchWinMsgFn = procedure(const Message: PMSG); cdecl;      // typedef void (* AcedWatchWinMsgFn)(const MSG*);
  PAcedFilterWinMsgFn = ^TAcedFilterWinMsgFn;
  TAcedFilterWinMsgFn = function(Message: PMSG): LongBool; cdecl;  // typedef BOOL (* AcedFilterWinMsgFn)(MSG*);

// ***************************************************************************** ADSDEF.H
const
//  TRUE      = 1;  // #define TRUE    1
//  FALSE     = 0;  // #define FALSE   0
  EOS: Char   = #0; // #define EOS     '\0'

  // #pragma pack(push, 8)
type
  Pads_real   = ^Tads_real;
  Tads_real   = Double;                               // typedef double   ads_real;
  Pads_point  = ^Tads_point;
  Tads_point  = array[0..2]of Tads_real;              // typedef ads_real ads_point[3];
  Pads_name   = ^Tads_name;
  Tads_name   = array[0..1]of Longint;                // typedef long     ads_name[2];
  Pads_Matrix = ^Tads_Matrix;
  Tads_matrix = array[0..3,0..3]of Tads_real;         // typedef ads_real ads_matrix[4][4];
  Pads_point4 = ^Tads_point4;
  Tads_point4 = array[0..3]of Tads_point;

  // (* When you want something that's explicitly a pointer type and not an array type, use ads_pointp and ads_namep.  Remember that if your function takes an
  // *array* of points, it still declares ads_point[] foo; *)
  Tads_pointp = Pads_point;                          // typedef ads_real *ads_pointp;
  Tads_namep  = Pads_name;                           // typedef long     *ads_namep;

const
  // #ifndef _XYZT_DEFINED

  X = 0; // #define _XYZT_DEFINED
  Y = 1; // enum { X = 0, Y = 1, Z = 2 }; (* The coordinates of a point. *)
  Z = 2; // enum { T = 3 };               (* The translation vector of a 3D matrix *)
  T = 3; // #endif // !_XYZT_DEFINED

  // (* The PAUSE token for ads_command and ads_cmd *)
  PAUSE: AnsiString   = '\'; // #define PAUSE "\\"

  // (* The ADS_INITGET control bits *)
  // enum {
  RSG_NONULL      = $01;    // RSG_NONULL      = 0x01,  // Disallow null input
  RSG_NOZERO      = $02;    // RSG_NOZERO      = 0x02,  // Disallow zero input
  RSG_NONEG       = $04;    // RSG_NONEG       = 0x04,  // Disallow negative input
  RSG_NOLIM       = $08;    // RSG_NOLIM       = 0x08,  // Do not check limits
  RSG_GETZ        = $10;    // RSG_GETZ        = 0x10,  // Get Z coordinate
  RSG_DASH        = $20;    // RSG_DASH        = 0x20,  // Draw dashed rubber band/box
// (not a GEDIT control bit)
  RSG_2D          = $40;    // RSG_2D          = 0x40,  // Restrict (getdist) to 2D (causes the UD_GETZ control bit to be cleared)
  RSG_OTHER       = $80;    // RSG_OTHER       = 0x80,  // Return input string if unknown
  RSG_DDISTFIRST  = $100;   // RSG_DDISTFIRST  = 0x100  // Give DD entry precedence over arbitrary input };

  // (* The following control bits are the old names for the RSG_control bits above.
  // These names are provided for backward compatibility.  You should use the RSG_names above. *)

  // enum {
  INP_NNULL       = $01;    // INP_NNULL   = RSG_NONULL,
  INP_NZERO       = $02;    // INP_NZERO   = RSG_NOZERO,
  INP_NNEG        = $04;    // INP_NNEG    = RSG_NONEG,
  INP_NLIM        = $08;    // INP_NLIM    = RSG_NOLIM,
  INP_DASH        = $20;    // INP_DASH    = RSG_DASH,
  INP_NZCOORD     = $40;    // INP_NZCOORD = RSG_2D};

  HANDLE_SIZE     = 7;

type
  // (* Binary data stream structure *)
  Pads_binary = ^Tads_binary;
  Tads_binary = record  // struct ads_binary {    (* Binary data chunk structure *)
    cLen: SmallInt;            // short clen;        (* length of chunk in bytes *)
    Buf: PChar;                // char *buf;         (* binary data *)
  end;                         // };

  Pads_Handles = ^Tads_Handles;
  Tads_Handles = array[0..HANDLE_SIZE]of Byte;

  // (*  Union for storing different ADS data types. *)
  Pads_u_val = ^Tads_u_val;
  Tads_u_val = record
    case Byte of                                    // union ads_u_val {
      0: (rreal: Tads_real);                        // ads_real rreal;
      1: (rpoint: Tads_point);                      // ads_real rpoint[3];
      2: (rint: SmallInt);                          // short rint;
      3: (rstring: PChar);                          // char *rstring;
      4: (rlName: Tads_name);                       // long rlname[2];
      5: (rlong: Longint);                          // long rlong;
      6: (rbinary: Tads_binary);                    // struct ads_binary rbinary;// (* TEMPORARY probably, for internal use only at the moment *)
      7: (ihandle: array[0..HANDLE_SIZE]of Byte);   // unsigned char ihandle[8];
    end;                                            // };

  // (* The following is the structure definition of the general result buffer.
  // This is used for both passing back results from functions, as well
  // as exotic applications like entity lists, and command function lists.
  // It is as close as we come to the AutoLISP node structure. *)

  PPresbuf = ^Presbuf;
  Presbuf = ^Tresbuf;         // typedef struct resbuf *pResbuf;
  Tresbuf = record            // struct resbuf {
    rbnext: Presbuf;          // struct resbuf *rbnext; (* Allows them to be "linked" *)
    restype: SmallInt;        // short restype;
    resval: Tads_u_Val;       // union ads_u_val resval;
  end;                        // };
  TkpResbuf = Presbuf;        // KPtypedef const struct resbuf *kpResbuf;  /* for declarations */

// ***************************************************************************** AdUiLib/ADUI
const
  MOVEX     = $00001; // #define MOVEX               0x00001
  MOVEY     = $00002; // #define MOVEY               0x00002
  MOVEXY    = $00003; // #define MOVEXY              0x00003
  ELASTICX  = $00010; // #define ELASTICX            0x00010
  ELASTICY  = $00020; // #define ELASTICY            0x00020
  ELASTICXY = $00030; // #define ELASTICXY           0x00030

type
  PdlgControlTag = ^TdlgControlTag;
  TdlgControlTag = record   // typedef struct _dlgControlTag {
    id: DWord;                      //    DWORD       id;
    flags: DWord;                   //    DWORD       flags;
    pct: DWord;                     //    DWORD       pct;
  end;                              //  } DLGCTLINFO, *PDLGCTLINFO;
  TDLGCTLINFO = TdlgControlTag;
  PDLGCTLINFO = PdlgControlTag;

// ***************************************************************************** AdUiLib/ADUIDOCK
const
  ADUI_DOCK_POSITION_TOOL_KEY: Pchar      = 'DockedTools';  // #define ADUI_DOCK_POSITION_TOOL_KEY "DockedTools"
  ADUI_DOCK_STARTUP_TOOL_KEY: Pchar       = 'RestartTools'; // #define ADUI_DOCK_STARTUP_TOOL_KEY  "RestartTools"
  //
  ID_ADUI_ALLOWDOCK             = $1001;          // #define ID_ADUI_ALLOWDOCK           0x1001
  ID_ADUI_HIDEBAR               = $1002;          // #define ID_ADUI_HIDEBAR             0x1002
  //
  ADUI_DOCK_CS_DESTROY_ON_CLOSE = $01;            // #define ADUI_DOCK_CS_DESTROY_ON_CLOSE  0x01    // closing the floating window closes the control bar
  ADUI_DOCK_CS_STDMOUSECLICKS   = $02;            // #define ADUI_DOCK_CS_STDMOUSECLICKS    0x02    // standard mouse handling for the menu
  //
  ADUI_DOCK_NF_SIZECHANGED      = $01;            // #define ADUI_DOCK_NF_SIZECHANGED       0x01
  ADUI_DOCK_NF_STATECHANGED     = $02;            // #define ADUI_DOCK_NF_STATECHANGED      0x02

// ***************************************************************************** AseLib/ASECONST
const
  // (* The Database Object attribute masks *)
  ASE_DO_CURRENT          = $01;  // #define        ASE_DO_CURRENT     0x01  (* The DOis the current *)
  ASE_DO_REG              = $02;  // #define        ASE_DO_REG         0x02  (* The DO is registered *)
  ASE_DO_EXIST            = $04;  // #define        ASE_DO_EXIST       0x04  (* The DO exists in the SQL database*)
  ASE_DO_CON              = $08;  // #define        ASE_DO_CON         0x08  (* The DO belong to the connected env*)
  ASE_DO_UNKNOWN          = $10;  // #define        ASE_DO_UNKNOWN     0x10  (* Can't check the DO existance *)
  ASE_DO_WRONGKEY         = $20;  // #define        ASE_DO_WRONGKEY    0x20  (* Some registered key columns *)
  // (* doesn't exist in the real table *)
  ASE_DO_WRONGKEYTYPE     = $40;  // #define        ASE_DO_WRONGKEYTYPE 0x40  (* Some registered key columns *)


type
  TEAseLinkType = Integer;
  TEAseLinkAttr = Integer;
  TEAseDoNameCode = Integer;
  TEAseErrDsc = Integer;
  TEAseErrCodes = Integer;
  TEAseFileErrCodes = Integer;
  TEAseDbErrCodes = Integer;
  TEAseDwgErrCodes = Integer;
  TEAseDlgErrCodes = Integer;
  TEAseApiErrCodes = Integer;
  TEAseLinkErrCodes = Integer;
  TEAseDiagParms = Integer;
  TEAseApiClassId = Integer;
  TDatasourceTranslationCode = Integer;

const
  // typedef enum {
  EAseLinkType_kAseUnknownLinkType            = TEAseLinkType(0);             // kAseUnknownLinkType = 0,
  EAseLinkType_kAseEntityLink                 = TEAseLinkType(1);             // kAseEntityLink=1,  (* Ordinary Entity link *)
  EAseLinkType_kAseDALink                     = TEAseLinkType(2);             // kAseDALink=2,      (* DA (MText Label) link *)
  EAseLinkType_kAseLeaderLink                 = TEAseLinkType(3);             // kAseLeaderLink=3   (* DA (Leader Label) link *)  // } EAseLinkType ;

  // (* The link attribute identification codes *)
  // typedef enum  {
  // (* Normal attributes *)
  EAseLinkAttr_kAseAttrAll                    = TEAseLinkAttr(0);             // kAseAttrAll=0,  (* All link attributes *)
  EAseLinkAttr_kAseAttrId                     = TEAseLinkAttr(1);             // kAseAttrId=1,   (* link identifier (valid in the one drawing session) *)
  EAseLinkAttr_kAseAttrType                   = TEAseLinkAttr(2);             // kAseAttrType=2,   (* link type code *)
  EAseLinkAttr_kAseAttrStatus                 = TEAseLinkAttr(3);             // kAseAttrStatus=3,   (* link status *)
  EAseLinkAttr_kAseAttrEnt                    = TEAseLinkAttr(4);             // kAseAttrEnt=4,  (* entity name *)
  EAseLinkAttr_kAseAttrName                   = TEAseLinkAttr(5);             // kAseAttrName=5,   (* Link Table Name *)
  EAseLinkAttr_kAseAttrKeyValue               = TEAseLinkAttr(6);             // kAseAttrKeyValue=6,   (* key value *)
  EAseLinkAttr_kAseAttrDAColumns              = TEAseLinkAttr(7);             // kAseAttrDAColumns=7,  (* the DA column names list (for DA link) *)
  EAseLinkAttr_kAseAttrDAParms                = TEAseLinkAttr(8);             // kAseAttrDAParms=8,  (* the DA entity parameters (for DA link) *)
  EAseLinkAttr_kAseAttrDAValues               = TEAseLinkAttr(9);             // kAseAttrDAValues=9,   (* the known DA entity values (for DA link) *)
  EAseLinkAttr_kAseAttrXName                  = TEAseLinkAttr(10);            // kAseAttrXName=10,   (* the Xref/Block name (for enclosed link) *)
  EAseLinkAttr_kAseAttrReserved1              = TEAseLinkAttr(11);            // kAseAttrReserved1=11,  (* internal reserved attribute *)
  EAseLinkAttr_kAseAttrParKeyValue            = TEAseLinkAttr(12);            // kAseAttrParKeyValue=12,(* partial key value *)

  // (* Extended attributes *)
  EAseLinkAttr_kAseExtAttrTextCond            = TEAseLinkAttr(-1);            // kAseExtAttrTextCond=-1,(* text condition *)
  EAseLinkAttr_kAseExtAttrEntities            = TEAseLinkAttr(-2);            // kAseExtAttrEntities=-2,(* selection set name *)
  EAseLinkAttr_kAseExtAttrDoPath              = TEAseLinkAttr(-3);            // kAseExtAttrDoPath=-3  (* The Database Object Path *)  } EAseLinkAttr;


  // (* Database Object Reference definition codes *)
  // typedef enum {
  EAseDoNameCode_kAseUnknownNameCode          = TEAseDoNameCode(0);           // kAseUnknownNameCode=0, (* Unknown DO name code *)
  EAseDoNameCode_kAseEnvCode                  = TEAseDoNameCode(1);           // kAseEnvCode=1,      (* DataSource / Environment *)
  EAseDoNameCode_kAseCatCode                  = TEAseDoNameCode(2);           // kAseCatCode=2,      (* Catalog *)
  EAseDoNameCode_kAseSchemaCode               = TEAseDoNameCode(3);           // kAseSchemaCode=3,       (* Schema *)
  EAseDoNameCode_kAseTableCode                = TEAseDoNameCode(4);           // kAseTableCode=4,      (* Table *)
  EAseDoNameCode_kAseLpnCode                  = TEAseDoNameCode(5);           // kAseLpnCode=5,      (* Link Path Name *)
  EAseDoNameCode_kAsePathCode                 = TEAseDoNameCode(6);           // kAsePathCode=6,       (* Full path code *)
  EAseDoNameCode_kAseDOCode                   = TEAseDoNameCode(7);           // kAseDOCode=7,       (* DO path only *)
  EAseDoNameCode_kAseSQLCode                  = TEAseDoNameCode(8);           // kAseSQLCode=8       (* SQL object path *) } EAseDoNameCode ;

  // (* ASE error code in the ASI error codes sequence *)
  // #define eAseErrEntry   (MinUserDefErrorCode+1)

  // (* Detects whether or not the error entry contains ASE error data *)
  // #define isAseErr(x)   (x == eAseErrEntry ? kAsiTrue : kAsiFalse)

  // (* Status of Ase Path. Set and get by CAsePath::GetStatus, CAsePath::SetStatus *)
  // #define      ASEPATH_STAT_EMPTY    0   (* void *)

  // (* Query and table are mutual exclusive *)
  // #define      ASEPATH_STAT_TABLE    0x01  (* Table *)
  // #define      ASEPATH_STAT_QUERY    0x02  (* Query *)


  // (* The ASE error description codes *)
  // typedef enum {

  EAseErrDsc_eAseEDscUnknown                = TEAseErrDsc(0);                 // eAseEDscUnknown = 0, (* Unknown error  *)
  EAseErrDsc_eAseEDscInternal               = TEAseErrDsc(1);                 // eAseEDscInternal = 1,  (* Internal ASE error. This code hasn't be assigned*)
  // (* in the normal situation. It indicates about an *)
  // (* internally detected ASE bug. See EAseErrCodes. *)

  EAseErrDsc_eAseEDscAse                    = TEAseErrDsc(2);                 // eAseEDscAse  = 2,   (* Logical common error, see EAseErrCodes. *)
  EAseErrDsc_eAseEDscFile                   = TEAseErrDsc(3);                 // eAseEDscFile = 3,   (* File I/O error, see ASI error diagnostic *)
  EAseErrDsc_eAseEDscAsi                    = TEAseErrDsc(4);                 // eAseEDscAsi  = 4,   (* ASI error, see ASI error diagnostic *)
  EAseErrDsc_eAseEDscDb                     = TEAseErrDsc(5);                 // eAseEDscDb   = 5,   (* ASI group error qualificator, see EAseDbErrCodes *)
  EAseErrDsc_eAseEDscDwg                    = TEAseErrDsc(6);                 // eAseEDscDwg  = 6,   (* Drawing error, see EAseDwgErrCodes for error codes *)
  EAseErrDsc_eAseEDscDlg                    = TEAseErrDsc(7);                 // eAseEDscDlg  = 7,   (* Dialogue errors, see EAseDlgErrCodes for error codes *)
  EAseErrDsc_eAseEDscApi                    = TEAseErrDsc(8);                 // eAseEDscApi  = 8,   (* API errors, see EAseApiErrCodes for error codes *)
  EAseErrDsc_eAseEDscLink                   = TEAseErrDsc(9);                 // eAseEDscLink = 9    (* Internal error with the Link Information,*)
  // (* see EAseLinkErrCodes *)
  // } EAseErrDsc ;

  // (* The common ASE error codes *)
  // typedef enum {
  EAseErrCode_eAseErrUnknown                = TEAseErrCodes(0);               // eAseErrUnknown=0,          (* Unknown ASE error *)
  EAseErrCode_eAseErrInternal               = TEAseErrCodes(1);               // eAseErrInternal=1,         (* Internal ASE error, inconsistent call of the*)
  // (* internal ASE functions.*)
  EAseErrCode_eAseErrMemory                 = TEAseErrCodes(2);               // eAseErrMemory=2,           (* No memory*)
  EAseErrCode_eAseErrInfo                   = TEAseErrCodes(3);               // eAseErrInfo=3,             (* Information message entry*)
  EAseErrCode_eAseErrMaxQty                 = TEAseErrCodes(4);               // eAseErrMaxQty=4,           (* The maximum quantity of the errors is exceded*)
  EAseErrCode_eAseErrNoReg                  = TEAseErrCodes(10);              // eAseErrNoReg=10,           (* No one DO is registered*)
  EAseErrCode_eAseErrDoReg                  = TEAseErrCodes(11);              // eAseErrDoReg=11,           (* The DO isn't registered*)
  EAseErrCode_eAseErrEnvNotConnected        = TEAseErrCodes(12);              // eAseErrEnvNotConnected=12, (* Environment isn't connected*)
  EAseErrCode_eAseErrNoLpn                  = TEAseErrCodes(13);              // eAseErrNoLpn=13,           (* LPN isn't set*)
  EAseErrCode_eAseErrNoEnvName              = TEAseErrCodes(14);              // eAseErrNoEnvName=14,       (* Environment name isn't specified*)
  EAseErrCode_eAseErrNoCatName              = TEAseErrCodes(15);              // eAseErrNoCatName=15,       (* Catalog name isn't specified*)
  EAseErrCode_eAseErrNoSchemaName           = TEAseErrCodes(16);              // eAseErrNoSchemaName=16,    (* Schema name isn't specified*)
  EAseErrCode_eAseErrNoTableName            = TEAseErrCodes(17);              // eAseErrNoTableName=17,     (* Table name isn't specified*)
  EAseErrCode_eAseErrLpnExist               = TEAseErrCodes(18);              // eAseErrLpnExist=18,        (* Link Path Name already exists*)
  EAseErrCode_eAseErrWrongKey               = TEAseErrCodes(19);              // eAseErrWrongKey=19,        (* Some of the key columns doesn't exist in table*)
  EAseErrCode_eAseErrWrongKeyType           = TEAseErrCodes(20);              // eAseErrWrongKeyType=20,    (* Wrong key column type is detected:*)
  // (* table structure was changed or BIT, BITVAR*)
  // (* column types are specified*)
  EAseErrCode_eAseErrNoSelEnts                = TEAseErrCodes(21);            // eAseErrNoSelEnts=21,       (* No one entity is selected*)
  EAseErrCode_eAseErrNoSelLinks               = TEAseErrCodes(22);            // eAseErrNoSelLinks=22,      (* No one links exist in the specified entities*)
  EAseErrCode_eAseErrNoSelDALinks             = TEAseErrCodes(23);            // eAseErrNoSelDALinks=23,    (* No one links exist in the specified entities*)
  EAseErrCode_eAseErrNoDoLinks                = TEAseErrCodes(24);            // eAseErrNoDoLinks=24,       (* No one links to the DO is specified*)
  EAseErrCode_eAseErrDAUpd                    = TEAseErrCodes(25);            // eAseErrDAUpd=25,           (* Some of the DAs aren't updatable *)

  EAseErrCode_eAseErrWrongDoName              = TEAseErrCodes(26);            // eAseErrWrongDoName=26,     (* Invalid DO Name *)
  EAseErrCode_EAseErrCode_eAseErrWrongResbuf  = TEAseErrCodes(27);            // eAseErrWrongResbuf=27,     (* Invalid resbuf*)
  EAseErrCode_eAseErrBadR12DOR                = TEAseErrCodes(28);            // eAseErrBadR12DOR=28,       (* Can't find the R13 terms for R12 DOR *)
  EAseErrCode_eAseErrWrongLPN                 = TEAseErrCodes(29);            // eAseErrWrongLPN=29,        (* Invalid LPN *)
  EAseErrCode_eAseErrWrongPath                = TEAseErrCodes(30);            // eAseErrWrongPath=30,       (* Invalid DO path *)
  EAseErrCode_eAseErrLinkUpd                  = TEAseErrCodes(31);            // eAseErrLinkUpd=31,         (* Some of the links aren't updatable *)
  EAseErrCode_eAseErrLinkSynch                = TEAseErrCodes(32);            // eAseErrLinkSynch=32,       (* The links(s) can't be synchronized *)
  EAseErrCode_eAseErrLPSynch                  = TEAseErrCodes(33);            // eAseErrLPSynch=33,         (* The Link Path(s) can't be synchronized *)
  EAseErrCode_eAseErrCharSet                  = TEAseErrCodes(34);            // eAseErrCharSet=34          (* Can't find character set *) } EAseErrCodes ;

  // (* The File I/O related error codes *)
  // typedef enum {
  EAseFileErrCodes_eAseFileErrUnknown       = TEAseFileErrCodes(400);         // eAseFileErrUnknown=400,  (* Unknown error*)
  EAseFileErrCodes_eAseFileNotFound         = TEAseFileErrCodes(401);         // eAseFileNotFound,        (* File not found*)
  EAseFileErrCodes_eAseFileErrOpen          = TEAseFileErrCodes(402);         // eAseFileErrOpen,         (* Can't open file*)
  EAseFileErrCodes_eAseFileErrRead          = TEAseFileErrCodes(403);         // eAseFileErrRead,         (* Read error*)
  EAseFileErrCodes_eAseFileErrWrite         = TEAseFileErrCodes(404);         // eAseFileErrWrite         (* Write error*)  } EAseFileErrCodes;


  // (* ASI group error codes*)
  // typedef enum {
  EAseDbErrCodes_eAseDbErrUnknown           = TEAseDbErrCodes(500);           // eAseDbErrUnknown =500,   (* Unknown ASE error*)
  EAseDbErrCodes_eAseDbErrSyntax            = TEAseDbErrCodes(501);           // eAseDbErrSyntax  =501,   (* SQL syntax error*)
  EAseDbErrCodes_eAseDbErrPrepare           = TEAseDbErrCodes(502);           // eAseDbErrPrepare =502,   (* Can't prepare SQL statement*)
  EAseDbErrCodes_eAseDbErrExecute           = TEAseDbErrCodes(503);           // eAseDbErrExecute =503,   (* Can't execute the statement*)
  EAseDbErrCodes_eAseDbErrOpenCsr           = TEAseDbErrCodes(504);           // eAseDbErrOpenCsr =504,   (* Can't open the cursor*)
  EAseDbErrCodes_eAseDbErrEntry             = TEAseDbErrCodes(505);           // eAseDbErrEntry   =505,   (* Wrong entry format in ASE_R12 section of*)
  // (* ASI.INI file*)
  EAseDbErrCodes_eAseDbErrIni               = TEAseDbErrCodes(506);           // eAseDbErrIni     =506,   (* Can't get ASI.INI file*)
  EAseDbErrCodes_eAseDbErrFetch             = TEAseDbErrCodes(507);           // eAseDbErrFetch   =507    (* Can't fetch *)  } EAseDbErrCodes ;

  // (* The AutoCAD drawing related codes*)
  // typedef enum {
  EAseDwgErrCodes_eAseDwgErrUnknown              = TEAseDwgErrCodes(700);     // eAseDwgErrUnknown              = (700,
  EAseDwgErrCodes_eAseDwgErrOpenReadEntity       = TEAseDwgErrCodes(701);     // eAseDwgErrOpenReadEntity       = 701,
  // (* Error openning entity for read. Object is to be opened for read as soon as any entity information, such as name of the layer, name of the parent block, XData ant etc. is requested. *)
  EAseDwgErrCodes_eAseDwgErrTranslateHandle      = TEAseDwgErrCodes(702);     // eAseDwgErrTranslateHandle      = 702,
  // (* Error translation entity handle, stored in the R12 Link, to the R13 AcDbObjectId *)
  EAseDwgErrCodes_eAseDwgErrAdsNameId            = TEAseDwgErrCodes(700);     // eAseDwgErrAdsNameId            = 703,
  // (* Can not convert AcDbObjectId to ads_name *)
  EAseDwgErrCodes_eAseDwgErrXEDAppidNotFound     = TEAseDwgErrCodes(704);     // eAseDwgErrXEDAppidNotFound     = 704,
  // (* XData is corrupt - APPID group not found *)
  EAseDwgErrCodes_eAseDwgErrXEDCorrupt           = TEAseDwgErrCodes(705);     // eAseDwgErrXEDCorrupt           = 705,
  // (* R13 XData is corrupt *)
  EAseDwgErrCodes_eAseDwgErrUpdateXED            = TEAseDwgErrCodes(706);     // eAseDwgErrUpdateXED            = 706,
  // (* Can not write/update XData. *)
  EAseDwgErrCodes_eAseDwgErrParcingLink          = TEAseDwgErrCodes(707);     // eAseDwgErrParcingLink          = 707,
  // (* Can not parce ASE Link XData *)
  EAseDwgErrCodes_eAseDwgErrParcingLPN           = TEAseDwgErrCodes(708);     // eAseDwgErrParcingLPN           = 708,
  // (* Can not parce ASE LPN XData *)
  EAseDwgErrCodes_eAseDwgErrOpenWriteEntity      = TEAseDwgErrCodes(709);     // eAseDwgErrOpenWriteEntity      = 709,
  // (* Can not open entity for write *)
  EAseDwgErrCodes_eAseDwgErrConvertingLink       = TEAseDwgErrCodes(710);     // eAseDwgErrConvertingLink       = 710,
  // (* Error converting link to the result buffer *)
  EAseDwgErrCodes_eAseDwgErrOpenBlockTable       = TEAseDwgErrCodes(711);     // eAseDwgErrOpenBlockTable       = 711,
  // (* Can not open block table *)
  EAseDwgErrCodes_eAseDwgErrAppendBlockTable     = TEAseDwgErrCodes(712);     // eAseDwgErrAppendBlockTable     = 712,
  // (* Can not add DA block definition to the block table *)
  EAseDwgErrCodes_eAseDwgErrAppendObjBlockTable  = TEAseDwgErrCodes(713);     // eAseDwgErrAppendObjBlockTable  = 713,
  // (* Can not append DA to the MODEL_SPACE or PAPER_SPACE sections *)
  EAseDwgErrCodes_eAseDwgErrOpenBlock            = TEAseDwgErrCodes(714);     // eAseDwgErrOpenBlock            = 714,
  // (* Can not open Block Table Record *)
  EAseDwgErrCodes_eAseDwgErrDelSelSet            = TEAseDwgErrCodes(715);     // eAseDwgErrDelSelSet            = 715,
  // (* Error releasing selection set *)
  EAseDwgErrCodes_eAseDwgErrFilterSelSet         = TEAseDwgErrCodes(716);     // eAseDwgErrFilterSelSet         = 716,
  // (* Error scanning block hierarchy *)
  EAseDwgErrCodes_eAseDwgErrCreateLPNTable       = TEAseDwgErrCodes(717);     // eAseDwgErrCreateLPNTable       = 717,
  // (* Can not create LPN dictionary in the Drawing Database *)
  EAseDwgErrCodes_eAseDwgErrFindLPNTable         = TEAseDwgErrCodes(718);     // eAseDwgErrFindLPNTable         = 718,
  // (* Can not find LPN dictionary in the Drawing Database *)
  EAseDwgErrCodes_eAseDwgErrFindAppid            = TEAseDwgErrCodes(719);     // eAseDwgErrFindAppid            = 719,
  // (* Can not find ASE APPID *)
  EAseDwgErrCodes_eAseDwgErrOpenLPNDict          = TEAseDwgErrCodes(720);     // eAseDwgErrOpenLPNDict          = 720,
  // (* Can not open LPN Dictionary *)
  EAseDwgErrCodes_eAseDwgErrAddEntry             = TEAseDwgErrCodes(721);     // eAseDwgErrAddEntry             = 721,
  // (*  Can not add entry to the LPN dictionary *)
  EAseDwgErrCodes_eAseDwgErrRemoveEntry          = TEAseDwgErrCodes(722);     // eAseDwgErrRemoveEntry          = 722,
  // (* Can not remove entry from the LPN dictionary *)
  EAseDwgErrCodes_eAseDwgErrUnexpSymb            = TEAseDwgErrCodes(723);     // eAseDwgErrUnexpSymb            = 723,
  // (* Unexpected symbol in ASE XData found. XData is corrupted. *)
  EAseDwgErrCodes_eAseDwgErrDwgInit              = TEAseDwgErrCodes(724);     // eAseDwgErrDwgInit              = 724,
  // (* Can not initialize Drawing Subsystem *)
  EAseDwgErrCodes_eAseDwgErrBlockIterator        = TEAseDwgErrCodes(725);     // eAseDwgErrBlockIterator        = 725,
  // (* Can not open Block Table Record iterator *)
  EAseDwgErrCodes_eAseDwgErrTransOpen            = TEAseDwgErrCodes(726);     // eAseDwgErrTransOpen            = 726,
  // (* Previous drawing transaction is not closed *)
  EAseDwgErrCodes_eAseDwgErrTransClose           = TEAseDwgErrCodes(727);     // eAseDwgErrTransClose           = 727,
  // (* Current Drawing transaction has not been opened *)
  EAseDwgErrCodes_eAseDwgErrGrips                = TEAseDwgErrCodes(728);     // eAseDwgErrGrips                = 728,
  // (* Can not store selection set in the AutoCAD via ads_sssetfirst() function. The error can accure in ASEROWS and ASESELECT commands *)
  EAseDwgErrCodes_eAseDwgErrFindBlock            = TEAseDwgErrCodes(729);     // eAseDwgErrFindBlock            = 729,
  // (* Block not found in the Block Table *)
  EAseDwgErrCodes_eAseDwgErrOpenRegapTable       = TEAseDwgErrCodes(730);     // eAseDwgErrOpenRegapTable       = 730,
  // (* Can not open AutoCAD REGAPP table. This operation is to be fulfilled as soon as ASE information should be stored in the drawing for the first time in the ASE session. *)
  EAseDwgErrCodes_eAseDwgErrRegisterAppid        = TEAseDwgErrCodes(731);     // eAseDwgErrRegisterAppid        = 731,
  // (* Can not register ASE APPID. APPID should be registered before ASE information should be stored in the drawing for the first time in the ASE session. *)
  EAseDwgErrCodes_eAseDwgErrInitObject           = TEAseDwgErrCodes(732);     // eAseDwgErrInitObject           = 732,
  // (* Can not initialize CAseDEntity object *)
  EAseDwgErrCodes_eAseDwgErrAddLink              = TEAseDwgErrCodes(733);     // eAseDwgErrAddLink               = 733,
  // (* Can not write link in the drawing *)
  EAseDwgErrCodes_eAseDwgErrAddLPN               = TEAseDwgErrCodes(734);     // eAseDwgErrAddLPN                = 734,
  // (* Can not write LPN in the drawing *)
  EAseDwgErrCodes_eAseDwgErrDelLink              = TEAseDwgErrCodes(735);     // eAseDwgErrDelLink               = 735,
  // (* Can not delete link from the drawing *)
  EAseDwgErrCodes_eAseDwgErrDelLPN               = TEAseDwgErrCodes(736);     // eAseDwgErrDelLPN                = 736,
  // (* Can not delet LPN from the drawing *)
  EAseDwgErrCodes_eAseDwgErrUpdLink              = TEAseDwgErrCodes(737);     // eAseDwgErrUpdLink               = 737,
  // (* Can not update link in the drawing *)
  EAseDwgErrCodes_eAseDwgErrUpdLPN               = TEAseDwgErrCodes(738);     // eAseDwgErrUpdLPN                = 738,
  // (* Can not update LPN in the drawing *)
  EAseDwgErrCodes_eAseDwgErrDeleteObj            = TEAseDwgErrCodes(739);     // eAseDwgErrDeleteObj             = 739,
  // (* Can not delete DA object from the drawing *)
  EAseDwgErrCodes_eAseDwgErrCorruptDA            = TEAseDwgErrCodes(740);     // eAseDwgErrCorruptDA             = 740,
  // (* Can not read DA column values from DA block attributes *)
  EAseDwgErrCodes_eAseDwgErrErasedObj            = TEAseDwgErrCodes(741);     // eAseDwgErrErasedObj             = 741,
  // (* Can not open object - it has been erased *)
  EAseDwgErrCodes_eAseDwgErrOpenNotify           = TEAseDwgErrCodes(742);     // eAseDwgErrOpenNotify            = 742,
  // (* Object can not be updated - it is opened for notify *)
  EAseDwgErrCodes_eAseDwgErrOpenUndo             = TEAseDwgErrCodes(743);     // eAseDwgErrOpenUndo              = 743,
  // (* Object can not be updated - it is opened for undo *)
  EAseDwgErrCodes_eAseDwgErrOpenWrite            = TEAseDwgErrCodes(744);     // eAseDwgErrOpenWrite             = 744,
  // (* Object can not be updated - it is opened for write *)
  EAseDwgErrCodes_eAseDwgErrOpenRead             = TEAseDwgErrCodes(744);     // eAseDwgErrOpenRead              = 744,
  // (* Object can not be updated - it is opened for read *)
  EAseDwgErrCodes_eAseDwgErrOpenXref             = TEAseDwgErrCodes(745);     // eAseDwgErrOpenXref              = 745,
  // (* Object can not be updated - it is object from XRef *)
  EAseDwgErrCodes_eAseDwgErrOpenLocked           = TEAseDwgErrCodes(746);     // eAseDwgErrOpenLocked            = 746,
  // (* Object can not be updated - it is on the locked layer *)
  EAseDwgErrCodes_eAseDwgErrDelR12DOMesh         = TEAseDwgErrCodes(747);     // eAseDwgErrDelR12DOMesh          = 747,
  // (* Can not delete R12 DO Mesh *)
  EAseDwgErrCodes_eAseDwgErrDelR12LinkMesh       = TEAseDwgErrCodes(748);     // eAseDwgErrDelR12LinkMesh        = 748,
  // (* Can not delete R12 Link Mesh *)
  EAseDwgErrCodes_eAseDwgErrReadLTypeTable       = TEAseDwgErrCodes(749);     // eAseDwgErrReadLTypeTable        = 749,
  // (* Can not read line style table *)
  EAseDwgErrCodes_eAseDwgErrReadLayerTable       = TEAseDwgErrCodes(750);     // eAseDwgErrReadLayerTable        = 750,
  // (* Can not read layer table *)
  EAseDwgErrCodes_eAseDwgErrReadStyleTable       = TEAseDwgErrCodes(751);     // eAseDwgErrReadStyleTable        = 751,
  // (* Can not read style table *)
  EAseDwgErrCodes_eAseDwgErrOpenLPNEntry         = TEAseDwgErrCodes(752);     // eAseDwgErrOpenLPNEntry          = 752,
  // (* Can not open LPN dictionary entry *)
  EAseDwgErrCodes_eAseDwgErrAppendBlkBlockHierarchy   = TEAseDwgErrCodes(753);  // eAseDwgErrAppendBlkBlockHierarchy  = 753,
  // (* Can not add block to ASE block hierarchy *)
   EAseDwgErrCodes_eAseDwgErrAppendRefBlockHierarchy  = TEAseDwgErrCodes(754);  // eAseDwgErrAppendRefBlockHierarchy  = 754,
  // (* Can not add block reference to ASE block hierarchy *)
  EAseDwgErrCodes_eAseDwgErrFindBlkBlockHierarchy     = TEAseDwgErrCodes(755);  // eAseDwgErrFindBlkBlockHierarchy    = 755,
  // (* Can not find block in ASE block hierarchy *)
  EAseDwgErrCodes_eAseDwgErrDelBlkBlockHierarchy      = TEAseDwgErrCodes(756);  // eAseDwgErrDelBlkBlockHierarchy     = 756,
  // (* Can not delete block from ASE block hierarchy *)
  EAseDwgErrCodes_eAseDwgErrInvR12Mesh                = TEAseDwgErrCodes(757);  // eAseDwgErrInvR12Mesh               = 757,
  // (* Invalid R12 Polimesh found. *)
  EAseDwgErrCodes_eAseDwgErrEOR                       = TEAseDwgErrCodes(758);  // eAseDwgErrEOR                      = 758,
  // (* Unexpected End of ASE XData found *)
  EAseDwgErrCodes_eAseDwgErrBraceExpected             = TEAseDwgErrCodes(758);  // eAseDwgErrBraceExpected            = 758,
  // (* Brace is mismatched in ASE XData *)
  EAseDwgErrCodes_eAseDwgErrBlockName                 = TEAseDwgErrCodes(759);  // eAseDwgErrBlockName                = 759,
  // (* Can not get name of the block  from AcDbBlockTableRecord *)
  EAseDwgErrCodes_eAseDwgErrOpenLayer                 = TEAseDwgErrCodes(760);  // eAseDwgErrOpenLayer                = 760
  // (* Can not open layer table record for update *)   } EAseDwgErrCodes ;

  // (* The AutoCAD Dialog related codes *)
  // typedef enum {
  EAseDlgErrCodes_eAseDlgErrUnknown         = TEAseDlgErrCodes(800);          // eAseDlgErrUnknown=800, (* Unknown ASE error *)
  EAseDlgErrCodes_eAseDlgWrongObj           = TEAseDlgErrCodes(801);          // eAseDlgWrongObj,
  EAseDlgErrCodes_eAseDlgNoDsc              = TEAseDlgErrCodes(802);          // eAseDlgNoDsc,
  EAseDlgErrCodes_eAseDlgMakeKey            = TEAseDlgErrCodes(803);          // eAseDlgMakeKey,
  EAseDlgErrCodes_eAseDlgReadStyleTable     = TEAseDlgErrCodes(804);          // eAseDlgReadStyleTable  } EAseDlgErrCodes ;

  // (* ASE API related error codes *)
  // typedef enum {
  EAseApiErrCodes_eAseApiErrUnknown         = TEAseApiErrCodes(900);          // eAseApiErrUnknown = 900,         (* Unknown ASE error *)
  EAseApiErrCodes_eAseApiErrWrongData       = TEAseApiErrCodes(901);          // eAseApiErrWrongData = 901,       (* Input data in the wrong format *)
  EAseApiErrCodes_eAseApiErrInitObj         = TEAseApiErrCodes(902);          // eAseApiErrInitObj = 902,         (* The API class isn't initialized *)
  EAseApiErrCodes_eAseApiErrInitApp         = TEAseApiErrCodes(903);          // eAseApiErrInitApp = 903,         (* Communication with ASE isn't extablished *)
  EAseApiErrCodes_eAseApiErrWrongAttr       = TEAseApiErrCodes(904);          // eAseApiErrWrongAttr = 904,       (* Wrong link attribute code *)
  EAseApiErrCodes_eAseApiErrXmx             = TEAseApiErrCodes(905);          // eAseApiErrXmx = 905,             (* Can't load XMX file *)
  EAseApiErrCodes_eAseApiErrWrongFunc       = TEAseApiErrCodes(906);          // eAseApiErrWrongFunc = 906,       (* Wrong call of API func. *)
  EAseApiErrCodes_eAseApiErrEmptyList       = TEAseApiErrCodes(907);          // eAseApiErrEmptyList = 907,       (* Can't find DO list *)
  EAseApiErrCodes_eAseApiErrMissingTable    = TEAseApiErrCodes(908);          // eAseApiErrMissingTable = 908,    (* Missing table path in filter *)
  EAseApiErrCodes_eAseApiErrLinkNotFound    = TEAseApiErrCodes(909);          // eAseApiErrLinkNotFound = 909,    (* Can't find link by link ID *)
  EAseApiErrCodes_eAseApiErrLinkMake        = TEAseApiErrCodes(910);          // eAseApiErrLinkMake = 910,        (* Error in link creation *)
  EAseApiErrCodes_eAseApiErrLinkUpdate      = TEAseApiErrCodes(911);          // eAseApiErrLinkUpdate = 911,      (* Error in link updating *)
  EAseApiErrCodes_eAseApiErrLinkDelete      = TEAseApiErrCodes(912);          // eAseApiErrLinkDelete = 912,      (* Error in link deleting *)
  EAseApiErrCodes_eAseApiErrMissingLinkType = TEAseApiErrCodes(913);          // eAseApiErrMissingLinkType = 913, (* Missing link type *)
  EAseApiErrCodes_eAseApiErrWrongLinkType   = TEAseApiErrCodes(914);          // eAseApiErrWrongLinkType = 914,   (* Wrong link type value *)
  EAseApiErrCodes_eAseApiErrMissingLinkID   = TEAseApiErrCodes(915);          // eAseApiErrMissingLinkID = 915,   (* Missing link ID *)
  EAseApiErrCodes_eAseApiErrWrongLinkID     = TEAseApiErrCodes(916);          // eAseApiErrWrongLinkID = 916,     (* Wrong link ID value *)
  EAseApiErrCodes_eAseApiErrMissingEntName  = TEAseApiErrCodes(917);          // eAseApiErrMissingEntName = 917,  (* Missing entity name *)
  EAseApiErrCodes_eAseApiErrWrongEntName    = TEAseApiErrCodes(918);          // eAseApiErrWrongEntName = 918,    (* Wrong entity name value *)
  EAseApiErrCodes_eAseApiErrMissingLpn      = TEAseApiErrCodes(919);          // eAseApiErrMissingLpn = 919,      (* Missing LPN *)
  EAseApiErrCodes_eAseApiErrWrongLpn        = TEAseApiErrCodes(920);          // eAseApiErrWrongLpn = 920,        (* Invalid LPN *)
  EAseApiErrCodes_eAseApiErrMissingKeyVal   = TEAseApiErrCodes(921);          // eAseApiErrMissingKeyVal = 921,   (* Missing Key value list *)
  EAseApiErrCodes_eAseApiErrWrongKeyVal     = TEAseApiErrCodes(922);          // eAseApiErrWrongKeyVal = 922,     (* Invalid Key valie list *)
  EAseApiErrCodes_eAseApiErrSelNotFound     = TEAseApiErrCodes(923);          // eAseApiErrSelNotFound = 923,     (* Can't find link selection by ID *)
  EAseApiErrCodes_eAseApiErrSelAddLink      = TEAseApiErrCodes(924);          // eAseApiErrSelAddLink = 924,      (* Can't add link to the link sel. *)
  EAseApiErrCodes_eAseApiErrSelDelLink      = TEAseApiErrCodes(925);          // eAseApiErrSelDelLink = 925,      (* Can't delete link from the link sel. *)
  EAseApiErrCodes_eAseApiErrSelFree         = TEAseApiErrCodes(926);          // eAseApiErrSelFree = 926,         (* Can't free the link sel. *)
  EAseApiErrCodes_eAseApiErrSelEmpty        = TEAseApiErrCodes(927);          // eAseApiErrSelEmpty = 927,        (* Empty link sel. *)
  EAseApiErrCodes_eAseApiErrMissingKeyNames = TEAseApiErrCodes(928);          // eAseApiErrMissingKeyNames = 928, (* Missing Key names list *)
  EAseApiErrCodes_eAseApiErrWrongKeyNames   = TEAseApiErrCodes(929);          // eAseApiErrWrongKeyNames = 929,   (* Invalid Key names list *)
  EAseApiErrCodes_eAseApiErrKeyNameNotFound = TEAseApiErrCodes(930);          // eAseApiErrKeyNameNotFound = 930, (* Key column name is not found in the table *)
  EAseApiErrCodes_eAseApiErrDupKeyNames     = TEAseApiErrCodes(931);          // eAseApiErrDupKeyNames = 931,     (* Duplicated Key names *)
  EAseApiErrCodes_eAseApiErrLpnNew          = TEAseApiErrCodes(932);          // eAseApiErrLpnNew = 932,          (* Error in creation of new LPN *)
  EAseApiErrCodes_eAseApiErrLpnDel          = TEAseApiErrCodes(933);          // eAseApiErrLpnDel = 933,          (* Error in deleting of LPN *)
  EAseApiErrCodes_eAseApiErrLpnNotFound     = TEAseApiErrCodes(934);          // eAseApiErrLpnNotFound = 934,     (* LPN is not exist *)
  EAseApiErrCodes_eAseApiErrLpnRen          = TEAseApiErrCodes(935);          // eAseApiErrLpnRen = 935,          (* Error in renaming of LPN *)
  EAseApiErrCodes_eAseApiErrWrongEntSel     = TEAseApiErrCodes(936);          // eAseApiErrWrongEntSel = 936,     (* Invalid entity sel. set name *)
  EAseApiErrCodes_eAseApiErrWrongBlock      = TEAseApiErrCodes(937);          // eAseApiErrWrongBlock = 937,      (* Invalid Xref/Block name *)
  EAseApiErrCodes_eAseApiErrWrongWhere      = TEAseApiErrCodes(938);          // eAseApiErrWrongWhere = 938,      (* Invalid WHERE condition *)
  EAseApiErrCodes_eAseApiErrSelUnite        = TEAseApiErrCodes(939);          // eAseApiErrSelUnite = 939,        (* Error in union *)
  EAseApiErrCodes_eAseApiErrSelSubtract     = TEAseApiErrCodes(940);          // eAseApiErrSelSubtract = 940,     (* Error in subtract *)
  EAseApiErrCodes_eAseApiErrSelIntersect    = TEAseApiErrCodes(941);          // eAseApiErrSelIntersect = 941,    (* Error in intersect *)
  EAseApiErrCodes_eAseApiErrSelErase        = TEAseApiErrCodes(942);          // eAseApiErrSelErase = 942,        (* Can't erase link sel. with links *)
  EAseApiErrCodes_eAseApiErrSelEraseLinks   = TEAseApiErrCodes(943);          // eAseApiErrSelEraseLinks = 943,   (* Can't erase some links *)
  EAseApiErrCodes_eAseApiErrCurrent         = TEAseApiErrCodes(944);          // eAseApiErrCurrent = 944,         (* Can't set current path *)
  EAseApiErrCodes_eAseApiErrWrongRowVal     = TEAseApiErrCodes(945);          // eAseApiErrWrongRowVal = 945,     (* Invalid row values *)
  EAseApiErrCodes_eAseApiErrDuplicatedLink  = TEAseApiErrCodes(946);          // eAseApiErrDuplicatedLink = 946,  (* Attempt of duplicated link creation *)
  EAseApiErrCodes_eAseApiErrMissingDANames  = TEAseApiErrCodes(947);          // eAseApiErrMissingDANames = 947,  (* Missing DA names list *)
  EAseApiErrCodes_eAseApiErrWrongDANames    = TEAseApiErrCodes(948);          // eAseApiErrWrongDANames = 948,    (* Invalid DA names list *)
  EAseApiErrCodes_eAseApiErrWrongDAVal      = TEAseApiErrCodes(949);          // eAseApiErrWrongDAVal = 949,      (* Invalid DA values list *)
  EAseApiErrCodes_eAseApiErrMissingDAPar    = TEAseApiErrCodes(950);          // eAseApiErrMissingDAPar = 950,    (* Missing DA parameters *)
  EAseApiErrCodes_eAseApiErrWrongDAPar      = TEAseApiErrCodes(951);          // eAseApiErrWrongDAPar = 951,      (* Invalid DA parameters *)
  EAseApiErrCodes_eAseApiErrMakeDA          = TEAseApiErrCodes(952);          // eAseApiErrMakeDA = 952           (* Error in make DA *) } EAseApiErrCodes ;

  // (* Internal Link Information related codes*)
  // typedef enum {
  EAseLinkErrCodes_eAseLinkErrUnknown           = TEAseLinkErrCodes(1000);    // eAseLinkErrUnknown       = 1000, (* Unknown ASE error*)
  EAseLinkErrCodes_eAseLinkErrWrongRegPath      = TEAseLinkErrCodes(1001);    // eAseLinkErrWrongRegPath  = 1001,
  // (* a) Invalid path to register table.
  //    b) LPN syntax error. LPN with prefix can't be registered.
  //    c) LPN syntax error. Wrong Xref name syntax. *)

  EAseLinkErrCodes_eAseLinkErrWrongRegDsc       = TEAseLinkErrCodes(1002);    // eAseLinkErrWrongRegDsc   = 1002,
  // (* a) Wrong column desriptor. registration
  //    b) Invalid list of the key columns to register. *)

  EAseLinkErrCodes_eAseLinkErrWrongPath12       = TEAseLinkErrCodes(1003);    // eAseLinkErrWrongPath12   = 1003,
  // (* Invalid path to Database Object Release 12 to registration register. *)

  EAseLinkErrCodes_eAseLinkErrWrongTypeDsc      = TEAseLinkErrCodes  (1005);  // eAseLinkErrWrongTypeDsc  = 1005,
  // (* a) Unknown column descriptor data type. registration
  //    b) Length of the key value can't be defined.   access to key value *)

  EAseLinkErrCodes_eAseLinkErrWrongLsAddOp      = TEAseLinkErrCodes(1007);    // eAseLinkErrWrongLsAddOp  = 1007,
  // (* Wrong Link Selection Identifier   Link Selection addition *)

  EAseLinkErrCodes_eAseLinkErrWrongLsSubOp      = TEAseLinkErrCodes(1008);    // eAseLinkErrWrongLsSubOp  = 1008,
  // (* Wrong Link Selection Identifier   Link Selection subraction *)

  EAseLinkErrCodes_eAseLinkErrWrongLsId         = TEAseLinkErrCodes (1009);   // eAseLinkErrWrongLsId   = 1009,
  // (* Wrong Link Selection Identifier   Access to Link Selection *)

  EAseLinkErrCodes_eAseLinkErrWrongEntityId     = TEAseLinkErrCodes(1010);    // eAseLinkErrWrongEntityId = 1010,
  // (* Undefined drawing object to link    DA Link creation *)

  EAseLinkErrCodes_eAseLinkErrUndefDa           = TEAseLinkErrCodes(1011);    // eAseLinkErrUndefDa   = 1011,
  // (* Undefined DA list   DA link creation *)

  EAseLinkErrCodes_eAseLinkErrNoMemForLs        = TEAseLinkErrCodes (1012);   // eAseLinkErrNoMemForLs    = 1012,
  // (* Out of memory     Link Selection manipulation *)

  EAseLinkErrCodes_eAseLinkErrWrongPtrToLnk     = TEAseLinkErrCodes(1013);    // eAseLinkErrWrongPtrToLnk = 1013,
  // (* Wrong Link Identifier     Access to Link *)

  EAseLinkErrCodes_eAseLinkErrNoLinkInLMem      = TEAseLinkErrCodes(1014);    // eAseLinkErrNoLinkInLMem  = 1014,
  // (* Link was lost   Access to Link  *)

  EAseLinkErrCodes_eAseLinkErrNoEntityForLink   = TEAseLinkErrCodes (1016);   // eAseLinkErrNoEntityForLink = 1016,
  // (* Invalid Link in the memory    Access to Link *)

  EAseLinkErrCodes_eAseLinkErrWrongPtrToLs      = TEAseLinkErrCodes(1017);    // eAseLinkErrWrongPtrToLs  = 1017,
  // (* Wrong Link Selection Identifier   Access to Link Selection *)

  EAseLinkErrCodes_eAseLinkErrNoLsInLMem        = TEAseLinkErrCodes (1018);   // eAseLinkErrNoLsInLMem    = 1018,
  // (* Link Selection was lost   Access to Link Selection *)

  EAseLinkErrCodes_eAseLinkErrMLsNotValid       = TEAseLinkErrCodes(1019);    // eAseLinkErrMLsNotValid   = 1019,
  // (* Invalid Link Selection    Access to Link Selection *)

  EAseLinkErrCodes_eAseLinkErrMLinkNotValid     = TEAseLinkErrCodes(1020);    // eAseLinkErrMLinkNotValid = 1020,
  // (* Invalid Link in the memory    ASE Transaction *)
  //
  EAseLinkErrCodes_eAseLinkErrTabNoChanges      = TEAseLinkErrCodes(1021);    // eAseLinkErrTabNoChanges  = 1021,
  // (*  Link Information assosiated with   Erase LPN LPN can't be changed *)

  EAseLinkErrCodes_eAseLinkErrRnmWrongOldLPN    = TEAseLinkErrCodes(1022);    // eAseLinkErrRnmWrongOldLPN  = 1022,
  // (* Old LPN is invalid    LPN Renaming *)

  EAseLinkErrCodes_eAseLinkErrRnmWrongNewLPN    = TEAseLinkErrCodes(1023);    // eAseLinkErrRnmWrongNewLPN  = 1023,
  // (* New LPN is invalid    LPN Renaming *)

  EAseLinkErrCodes_eAseLinkErrRnmNoUpd          = TEAseLinkErrCodes(1024);    // eAseLinkErrRnmNoUpd    = 1024,
  // (* Link Information associated with LPN    LPN Renaming isn't updatable *)

  EAseLinkErrCodes_eAseLinkErrLLinkNotValid     = TEAseLinkErrCodes(1025);    // eAseLinkErrLLinkNotValid = 1025,
  // (* CAseLLink object is not valid. Object   Link Manipulations had not been initialized *)

  EAseLinkErrCodes_eAseLinkErrLLinkNotUpdate    = TEAseLinkErrCodes(1026);    // eAseLinkErrLLinkNotUpdate  = 1026,
  // (*  Link can't be modified. Drawing object   Link modification isn't updatable *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoMakeDup    = TEAseLinkErrCodes(1027);    // eAseLinkErrLLinkNoMakeDup  = 1027,
  // (* Can't create duplicated link    Link creation *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoMakeKey    = TEAseLinkErrCodes(1029);    // eAseLinkErrLLinkNoMakeKey  = 1029,
  // (*  Can't create link. Wrong keys    Link creation *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoMakeStore  = TEAseLinkErrCodes(1030);    // eAseLinkErrLLinkNoMakeStore  = 1030,
  // (* Can't store Link into drawing   Link creation *)

  EAseLinkErrCodes_eAseLinkErrLLinkWrongId      = TEAseLinkErrCodes(1031);    // eAseLinkErrLLinkWrongId  = 1031,
  // (* Can't intialize CAseLLink object. Access to Link Wrong Link Identifier *)

  EAseLinkErrCodes_eAseLinkErrLLinkWrongType    = TEAseLinkErrCodes(1032);    // eAseLinkErrLLinkWrongType  = 1032,
  // (* a) Can't intialize CAseLLink object.   Access to Link Wrong Link type
  //    b) Can't update DA. Link isn't DA link    DA Link updating *)

  EAseLinkErrCodes_eAseLinkErrLLinkManyLinks    = TEAseLinkErrCodes(1033);    // eAseLinkErrLLinkManyLinks  = 1033,
  // (* Can't intialize CAseLLink object by   CAseLLink object initialization drawing object. Drawing object contains several links. *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoMake       = TEAseLinkErrCodes(1034);    // eAseLinkErrLLinkNoMake   = 1034,
  // (* a) Can't make link. Duplicate link.   Link creation
  //    b) Can't store Link in the memory.
  //    c) Can't make link. Wrong keys. *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoDel        = TEAseLinkErrCodes(1035);    // eAseLinkErrLLinkNoDel    = 1035,
  // (* a) Can't delete link. Link is not valid   Link deleting
  //     b) Can't delete link. Link is not updatable
  //     c) Can't delete Xdata assocoated with link *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoUpd        = TEAseLinkErrCodes(1036);    // eAseLinkErrLLinkNoUpd    = 1036,
  // (* a) Can't update link. Link Information  Link modification was not changed.
  //    b) Can't update link. Link isn't valid
  //    c) Can't update link. Drawing object is not updatable. *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoDATab      = TEAseLinkErrCodes(1037);    // eAseLinkErrLLinkNoDATab  = 1037,
  // (* Wrong DA Link modification.   DA link modification. Table name can't be changed for DA link *)

  EAseLinkErrCodes_eAseLinkErrLLinkNoDAEnt      = TEAseLinkErrCodes(1038);    // eAseLinkErrLLinkNoDAEnt  = 1038,
  // (* Wrong  DA Link modification DA link modification Drawing object can't be changed for DA link *)

  EAseLinkErrCodes_eAseLinkErrLLinkWrongEnt     = TEAseLinkErrCodes(1039);    // eAseLinkErrLLinkWrongEnt = 1039,
  // (* CAseLLink obejct was not initialized correctly  Access to link *)

  EAseLinkErrCodes_eAseLinkErrLLinkWrongDA      = TEAseLinkErrCodes(1040);    // eAseLinkErrLLinkWrongDA  = 1040,
  // (* Wrong DA columns  DA Link creation *)

  EAseLinkErrCodes_eAseLinkErrLLinkAbsent       = TEAseLinkErrCodes(1041);    // eAseLinkErrLLinkAbsent   = 1041,
  // (* Can't find out Link by Link Identifier  Access to Link *)

  EAseLinkErrCodes_eAseLinkErrLSWrongFilter     = TEAseLinkErrCodes(1042);    // eAseLinkErrLSWrongFilter = 1042,
  // (* Wrong filter  Link Selection filtering *)

  EAseLinkErrCodes_eAseLinkErrInLMem            = TEAseLinkErrCodes(1045);    // eAseLinkErrInLMem    = 1045,
  // (* Can't clear Link Selection. Access to Link Selection *)

  EAseLinkErrCodes_eAseLinkErrKeyNotValid       = TEAseLinkErrCodes(1046);    // eAseLinkErrKeyNotValid   = 1046,
  // (* Key isn't valid   Access to key values *)

  EAseLinkErrCodes_eAseLinkErrWrongKeyVal       = TEAseLinkErrCodes(1047);    // eAseLinkErrWrongKeyVal   = 1047,
  // (* Wrong key value Row registration *)

  EAseLinkErrCodes_eAseLinkErrCantStoreKeyVal   = TEAseLinkErrCodes(1048);    // eAseLinkErrCantStoreKeyVal = 1048,
  // (* Key value can't be stored. It is possible if ASE have not enough memory or key column descriptor is not correct. *)

  EAseLinkErrCodes_eAseLinkErrWrongDsc          = TEAseLinkErrCodes(1048);    // eAseLinkErrWrongDsc    = 1049,
  // (* Can't store key value. Descriptor is not  Row registration correct *)

  EAseLinkErrCodes_eAseLinkErrWrongKeyInit      = TEAseLinkErrCodes(1050);    // eAseLinkErrWrongKeyInit  = 1050,
  // (* Can't initialize CAseLKey object. Row registration LPN is not valid. *)

  EAseLinkErrCodes_eAseLinkErrValid             = TEAseLinkErrCodes(1051);    // eAseLinkErrValid   = 1051,
  // (* Link Subsystem is not valid. Internal error. *)
  //
  EAseLinkErrCodes_eAseLinkErrStart             = TEAseLinkErrCodes(1052);    // eAseLinkErrStart   = 1052,
  // (* Link subsystem can't begin ASE transaction. Internal error. *)
  //
  EAseLinkErrCodes_eAseLinkErrLMemWrongId       = TEAseLinkErrCodes(1053);    // eAseLinkErrLMemWrongId   = 1053,
  // (* Wrong Link Identifier Access to link *)
  //
  EAseLinkErrCodes_eAseLinkErrLMemInternal      = TEAseLinkErrCodes(1054);    // eAseLinkErrLMemInternal  = 1054,
  // (* Link Subsystem internal error Access to link *)
  //
  EAseLinkErrCodes_eAseLinkErrLMemRBack         = TEAseLinkErrCodes(1055);    // eAseLinkErrLMemRBack   = 1055,
  // (* Can't restore link  Rollback of the ASE Transaction *)
  //
  EAseLinkErrCodes_eAseLinkErrWrongTransForUpd  = TEAseLinkErrCodes(1056);    // eAseLinkErrWrongTransForUpd  = 1056,
  // (* Can't update link. Transaction wasn't opend.Updating of the link *)
  //
  EAseLinkErrCodes_eAseLinkErrEnameEIdConvert   = TEAseLinkErrCodes(1059);    // eAseLinkErrEnameEIdConvert = 1059,
  // (* Can't convert ads_name to AcDbEntityId.  Link making *)
  //
  EAseLinkErrCodes_eAseLinkErrEntNoUpd          = TEAseLinkErrCodes(1060);    // eAseLinkErrEntNoUpd    = 1060,
  // (* Entity is not updatable. Link can't be created. Link making *)
  //
  EAseLinkErrCodes_eAseLinkErrContainerItem     = TEAseLinkErrCodes(1061);    // eAseLinkErrContainerItem = 1061,
  // (* Can't intialize Link Selection for container. ASELINKS command *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfEraseUnlinkedEntity    = TEAseLinkErrCodes(1062);  // eAseLinkErrNtfEraseUnlinkedEntity = 1062,
  // (* Link Subsystem has got notification to delete Processing of the notifications links, but specified object has no links. from linked drawing object *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfCopyUnlinkedEntity     = TEAseLinkErrCodes(1063);  // eAseLinkErrNtfCopyUnlinkedEntity = 1063,
  // (* Link Subsystem has got notification to copy Processing of the notifications links, but specified object has no links. from linked drawing object *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfCanTProcess            = TEAseLinkErrCodes(1064);  // eAseLinkErrNtfCanTProcess  = 1064,
  // (* Link Subsysten can't process the notification.    Processing of the notifications *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfUnXED                  = TEAseLinkErrCodes(1065);  // eAseLinkErrNtfUnXED    = 1065,
  // (* Can't restore link. Wrong Xdata. Processing of the notifications from linked drawing objects. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfUnKey                  = TEAseLinkErrCodes(1066);  // eAseLinkErrNtfUnKey    = 1066,
  // (* Can't restore link. Row can't be registered. Processing of the notifications from linked drawing objects. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfUnDA                   = TEAseLinkErrCodes(1067);  // eAseLinkErrNtfUnDA   = 1067,
  // (* Can't restore link. Can't store DA columns  Processing of the notifications from linked drawing objects. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrNtfUnErase                = TEAseLinkErrCodes(1069);  // eAseLinkErrNtfUnErase    = 1069,
  // (* Can't restore link. Link isn't found out in the Processing of the notifications Link memory from linked drawing objects. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrInternal                  = TEAseLinkErrCodes(1070);  // eAseLinkErrInternal    = 1070,
  // (* Internal error of the Link Subsystem. *)
  //
  EAseLinkErrCodes_eAseLinkErrWrongRecordLpnPos         = TEAseLinkErrCodes(1071);  // eAseLinkErrWrongRecordLpnPos = 1071,
  // (* Link subsystem can't set the position of the Lpn  Reading link information in the Xdata from drawing *)
  //
  EAseLinkErrCodes_eAseLinkErrWrongLpnSyntax            = TEAseLinkErrCodes(1073);  // eAseLinkErrWrongLpnSyntax  = 1073,
  // (* LPN syntax error. Reading link information from drawing *)
  //
  EAseLinkErrCodes_eAseLinkErrCantRegLink               = TEAseLinkErrCodes(1076);  // eAseLinkErrCantRegLink   = 1076,
  // (* Can't store link. Link Path Name isn't Reading link information from registered yet. drawing. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrCantInitKey               = TEAseLinkErrCodes(1077);  // eAseLinkErrCantInitKey   = 1077,
  // (* Can't initilize key row to register.  Reading link information from drawing. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrWrongLinkNumber           = TEAseLinkErrCodes(1078);  // eAseLinkErrWrongLinkNumber = 1078,
  // (* Wrong link structure in the drawing object. Reading link information from drawing. Undo command *)
  //
  EAseLinkErrCodes_eAseLinkErrDuplicateReg              = TEAseLinkErrCodes(1079);  // eAseLinkErrDuplicateReg  = 1079,
  // (* Duplicate registration. LPN registration *)
  //
  EAseLinkErrCodes_eAseLinkErrTrRbackUndel              = TEAseLinkErrCodes(1081);  // eAseLinkErrTrRbackUndel  = 1081,
  // (* Can't restore the deleted link. Rollback ASE Transaction *)
  //
  EAseLinkErrCodes_eAseLinkErrTrRbackTable              = TEAseLinkErrCodes(1082);  // eAseLinkErrTrRbackTable  = 1082,
  // (* Link subsystem can't execute rollback ASE Rollback ASE Transaction Transaction for link table. *)
  //
  EAseLinkErrCodes_eAseLinkErrTrRback                   = TEAseLinkErrCodes(1083);  // eAseLinkErrTrRback   = 1083,
  // (* Link subsystem can't execute rollback ASE Rollback ASE Transaction Transaction, because transaction wasn't opened. *)
  //
  EAseLinkErrCodes_eAseLinkErrTrCommit                  = TEAseLinkErrCodes(1084);  // eAseLinkErrTrCommit    = 1084,
  // (* Link subsystem can't execute commit ASE Transaction, because transaction wasn't opened. *)
  //
  EAseLinkErrCodes_eAseLinkErrTrCommitTable             = TEAseLinkErrCodes(1085);  // eAseLinkErrTrCommitTable = 1085,
  // (* Link subsystem can't execute commit for Link Table. *)
  //
  EAseLinkErrCodes_eAseLinkErrTrCommitDelLink           = TEAseLinkErrCodes(1086);  // eAseLinkErrTrCommitDelLink = 1086,
  // (* Link subsystem can't delete link data from Commit ASE Transaction Xdata of the drawing object. *)
  //
  EAseLinkErrCodes_eAseLinkErrTrCommitAddLink           = TEAseLinkErrCodes(1087);  // eAseLinkErrTrCommitAddLink = 1087,
  // (* Link subsystem can't add new link Xdata of Commit ASE Transaction drawing object. *)
  //
  EAseLinkErrCodes_eAseLinkErrLnkDestroed               = TEAseLinkErrCodes(1088);  // eAseLinkErrLnkDestroed   = 1088,
  // (* Linked row is deleted from link memory before Commands            = Open, New Rx/Unload accosiated link have been erased Quit *)
  //
  EAseLinkErrCodes_eAseLinkErrDupUpdLnk               = TEAseLinkErrCodes(1090);    // eAseLinkErrDupUpdLnk   = 1090,
  // (* Can't update link. Duplicated links. Link updating. *)
  //
  EAseLinkErrCodes_eAseLinkErrRubbNoMem               = TEAseLinkErrCodes(1091);    // eAseLinkErrRubbNoMem   = 1091,
  // (* Can't execute rubbish collector algorithm. Commit ASE Transaction Out of memory *)
  //
  EAseLinkErrCodes_eAseLinkErrCommitNoMem             = TEAseLinkErrCodes(1092);    // eAseLinkErrCommitNoMem   = 1092,
  // (* Can't execute commit ASE Transaction. Commit ASE Transaction *)
  //
  EAseLinkErrCodes_eAseLinkErrCommit                  = TEAseLinkErrCodes(1093);    // eAseLinkErrCommit    = 1093,
  // (* Link Sybsystem can't commit ASE Transaction Commit ASE Transaction *)
  //
  EAseLinkErrCodes_eAseLinkErrTrExportLpn             = TEAseLinkErrCodes(1094);    // eAseLinkErrTrExportLpn   = 1094,
  // (* Can't store the export LPN to external database   Wblock command *)
  //
  EAseLinkErrCodes_eAseLinkErrLostLink                = TEAseLinkErrCodes(1095);    // eAseLinkErrLostLink    = 1095,
  // (* Can't store the link from Xdata *)
  //
  EAseLinkErrCodes_eAseLinkErrLinkToLeaderLink        = TEAseLinkErrCodes(1096);    // eAseLinkErrLinkToLeaderLink    = 1096
  // (* Can't create link because the entity is leader link component *) } EAseLinkErrCodes ;

  // (* ASE Diagnostic Parameters*)
  // typedef enum {
  EAseDiagParms_kAseDiagErrDsc              = TEAseDiagParms($0401);          // kAseDiagErrDsc    =  MinUserDefDiagParam + 1, (* ASE error description - Int*)
  EAseDiagParms_kAseDiagErrCode             = TEAseDiagParms($0402);          // kAseDiagErrCode   =  MinUserDefDiagParam + 2, (* Error Code           - Int*)
  EAseDiagParms_kAseDiagErrMsg              = TEAseDiagParms($0403);          // kAseDiagErrMsg    =  MinUserDefDiagParam + 3, (* ASE Error Message - Char*)
  EAseDiagParms_kAseDiagStatement           = TEAseDiagParms($0404);          // kAseDiagStatement =  MinUserDefDiagParam + 4, (* SQL statement  - Char*)
  EAseDiagParms_kAseDiagSynErrPos           = TEAseDiagParms($0405);          // kAseDiagSynErrPos =  MinUserDefDiagParam + 5, (* Syntax error position - Int*)
  EAseDiagParms_kAseDiagLPName              = TEAseDiagParms($0406);          // kAseDiagLPName    =  MinUserDefDiagParam + 6, (* Link Path Name   - Char*)
  EAseDiagParms_kAseDiagEnvName             = TEAseDiagParms($0407);          // kAseDiagEnvName   =  MinUserDefDiagParam + 7, (* Environment name   - Char*)
  EAseDiagParms_kAseDiagEntHandle           = TEAseDiagParms($0408);          // kAseDiagEntHandle =  MinUserDefDiagParam + 8, (* Entity handle  - Char*)
  EAseDiagParms_kAseDiagBlockName           = TEAseDiagParms($0409);          // kAseDiagBlockName =  MinUserDefDiagParam + 9, (* Block name       - Char*)
  EAseDiagParms_kAseDiagLayerName           = TEAseDiagParms($0410);          // kAseDiagLayerName =  MinUserDefDiagParam + 10,(* Layer name        - Char*)
  EAseDiagParms_kAseDiagLabelName           = TEAseDiagParms($0411);          // kAseDiagLabelName =  MinUserDefDiagParam + 11,(* Label name        - Char*)
  EAseDiagParms_kAseDiagAcApDoc             = TEAseDiagParms($0412);          // kAseDiagAcApDoc   =  MinUserDefDiagParam + 12,(* AcApDocument Address  - Int*)
  EAseDiagParms_kAseDiagGroupName           = TEAseDiagParms($0413);          // kAseDiagGroupName =  MinUserDefDiagParam + 13,(* LinkTemplateGroup - Char*)
  EAseDiagParms_kAseDiagQueryName           = TEAseDiagParms($0414);          // kAseDiagQueryName =  MinUserDefDiagParam + 14,(* QueryName         - Char*)
  EAseDiagParms_kAseDiagTableName           = TEAseDiagParms($0415);          // kAseDiagTableName =  MinUserDefDiagParam + 15 (* TableName         - Char*) } EAseDiagParms ;

  // (* API class codes*)
  // typedef enum {
  EAseApiClassId_kAseApiUnknownId           = TEAseApiClassId(0);             // kAseApiUnknownId,(* Unknown API class*)
  EAseApiClassId_kAseApiAppl                = TEAseApiClassId(1);             // kAseApiAppl,  (* for class CAseAppl and descriptor ASE_APPLDSC*)
  EAseApiClassId_kAseApiLinkPath            = TEAseApiClassId(2);             // kAseApiLinkPath, (* for class CAseLinkPath and descriptor ASE_LPDSC*)
  EAseApiClassId_kAseApiLink                = TEAseApiClassId(3);             // kAseApiLink,  (* for class CAseLink and descriptor ASE_LINKDSC*)
  EAseApiClassId_kAseApiLinkSel             = TEAseApiClassId(4);             // kAseApiLinkSel  (* for class CAseLinkSel and descriptor ASE_LSELDSC*) } EAseApiClassId ;


// Data source translation codes
//
  // enum DatasourceTranslationCode {
  DatasourceTranslationCode_kTranslateFromR14toR15     = TDatasourceTranslationCode(0); // kTranslateFromR14toR15 = 0,
  DatasourceTranslationCode_kTranslateFromR15toR14     = TDatasourceTranslationCode(1); // kTranslateFromR15toR14 };

  // ******************************************************************** AsiLib/ASICONST
type
   TEAsiBoolean = Integer;
   TEAsiDataType = Integer;
   TEAsiDTType = Integer;
   TEAsiIType = Integer;
   TEAsiTrimSpec = Integer;
   TEAsiHostType = Integer;
   TEAsiDrvStatus = Cardinal;
   TEAsiSIDataType = Cardinal;
   TEAsiSITransactionType = Cardinal;
   TEAsiStatInfo = Integer;
   TEAsiStatement = Integer;
   TEAsiTILevel = Integer;
   TEAsiTMode = Integer;
   TEAsiConstrCheck = Integer;
   TEAsiCurScr = Integer;
   TEAsiCurSns = Integer;
   TEAsiDirection = Integer;
   TEAsiCurPos = Integer;
   TEAsiCAttr = Integer;
   TEAsiInfSchTab = Integer;
   TEAsiDataSourceType = Integer;
   TEAsiDiag = Integer;
   TEAsiError = Integer;

const
  // (* *)
  // typedef enum {
  EAsiBoolean_kAsiUnknown                   = TEAsiBoolean(-1);               // kAsiUnknown  = -1, (* Boolean value is undefined *)
  EAsiBoolean_kAsiFalse                     = TEAsiBoolean(0);                // kAsiFalse    = 0,
  EAsiBoolean_kAsiTrue                      = TEAsiBoolean(1);                // kAsiTrue     = 1,
  EAsiBoolean_kAsiBad                       = TEAsiBoolean(0);                // kAsiBad      = 0,
  EAsiBoolean_kAsiGood                      = TEAsiBoolean(1);                // kAsiGood     = 1  } EAsiBoolean;

  // #define EAsiFlag EAsiBoolean

  // (* SQL data types *)
  // typedef enum {
  EAsiDataType_kAsiVector                   = TEAsiDataType(-2);              // kAsiVector       = -2,   (* Row *)
  EAsiDataTypekAsiImplDefined               = TEAsiDataType(-1);              // kAsiImplDefined  = -1,   (* Implementation-defined data type *)
  EAsiDataTypekAsiTUnknown                  = TEAsiDataType(0);               // kAsiTUnknown     = 0,
  EAsiDataTypekAsiChar                      = TEAsiDataType(1);               // kAsiChar         = 1,
  EAsiDataTypekAsiNumeric                   = TEAsiDataType(1);               // kAsiNumeric,
  EAsiDataTypekAsiDecimal                   = TEAsiDataType(3);               // kAsiDecimal,
  EAsiDataTypekAsiInteger                   = TEAsiDataType(4);               // kAsiInteger,
  EAsiDataTypekAsiSmallInt                  = TEAsiDataType(5);               // kAsiSmallInt,
  EAsiDataTypekAsiFloat                     = TEAsiDataType(6);               // kAsiFloat,
  EAsiDataTypekAsiReal                      = TEAsiDataType(7);               // kAsiReal,
  EAsiDataTypekAsiDouble                    = TEAsiDataType(8);               // kAsiDouble,
  EAsiDataTypekAsiDateTime                  = TEAsiDataType(9);               // kAsiDateTime,
  EAsiDataTypekAsiInterval                  = TEAsiDataType(10);              // kAsiInterval,
  EAsiDataTypekAsiCharVar                   = TEAsiDataType(12);              // kAsiCharVar  = 12,
  EAsiDataTypekAsiBit                       = TEAsiDataType(14);              // kAsiBit          = 14,
  EAsiDataTypekAsiBitVar                    = TEAsiDataType(15);              // kAsiBitVar,
  EAsiDataTypekAsiPoint                     = TEAsiDataType(16);              // kAsiPoint, (* n-dimentional point  *)
  EAsiDataTypekAsiBlob                      = TEAsiDataType(17);              // kAsiBlob  } EAsiDataType;

  // (* Date time types *)
  // typedef enum {
  EAsiDTType_kAsiDTUnknown                  = TEAsiDTType(0);                 // kAsiDTUnknown  = 0,
  EAsiDTType_kAsiDate                       = TEAsiDTType(1);                 // kAsiDate       = 1,
  EAsiDTType_kAsiTime                       = TEAsiDTType(2);                 // kAsiTime,
  EAsiDTType_kAsiTimeStamp                  = TEAsiDTType(3);                 // kAsiTimeStamp,
  EAsiDTType_kAsiTimeTZ                     = TEAsiDTType(4);                 // kAsiTimeTZ,
  EAsiDTType_kAsiTimeStampTZ                = TEAsiDTType(5);                 // kAsiTimeStampTZ  } EAsiDTType;

  // (* Interval types *)
  // typedef enum {
  EAsiIType_kAsiIUnknown                    = TEAsiIType(0);                  // kAsiIUnknown   = 0,
  EAsiIType_kAsiYear                        = TEAsiIType(1);                  // kAsiYear       = 1,
  EAsiIType_kAsiMonth                       = TEAsiIType(2);                  // kAsiMonth,
  EAsiIType_kAsiDay                         = TEAsiIType(3);                  // kAsiDay,
  EAsiIType_kAsiHour                        = TEAsiIType(4);                  // kAsiHour,
  EAsiIType_EAsiIType_kAsiMinute            = TEAsiIType(5);                  // kAsiMinute,
  EAsiIType_kAsiSecond                      = TEAsiIType(6);                  // kAsiSecond,
  EAsiIType_kAsiYear2Month                  = TEAsiIType(7);                  // kAsiYear2Month,
  EAsiIType_kAsiDay2Hour                    = TEAsiIType(8);                  // kAsiDay2Hour,
  EAsiIType_kAsiDay2Minute                  = TEAsiIType(9);                  // kAsiDay2Minute,
  EAsiIType_kAsiDay2Second                  = TEAsiIType(10);                 // kAsiDay2Second,
  EAsiIType_kAsiHour2Minute                 = TEAsiIType(11);                 // kAsiHour2Minute,
  EAsiIType_kAsiHour2Second                 = TEAsiIType(12);                 // kAsiHour2Second,
  EAsiIType_kAsiMinute2Second               = TEAsiIType(13);                 // kAsiMinute2Second  } EAsiIType;


  // typedef unsigned int uint;

  // (* //////////////////////////////////////////////////////////// *)
  // (* *)
  // (* Trim specification *)

  // (* *)
  // typedef enum {
  EAsiTrimSpec_kAsiLeading                  = TEAsiTrimSpec(0);               // kAsiLeading = 0,
  EAsiTrimSpec_kAsiTrailing                 = TEAsiTrimSpec(1);               // kAsiTrailing,
  EAsiTrimSpec_kAsiBoth                     = TEAsiTrimSpec(2);               // kAsiBoth } EAsiTrimSpec;


  // (* Host variable type *)
  // (* *)
  // typedef enum {
  EAsiHostType_kAsiHnull                    = TEAsiHostType(0);               // kAsiHnull  = 0,           (* Type undefined *)
  EAsiHostType_kAsiHshort                   = TEAsiHostType(1);               // kAsiHshort = 1,           (* short int *)
  EAsiHostType_kAsiHlong                    = TEAsiHostType(2);               // kAsiHlong,                (* long int *)
  EAsiHostType_kAsiHfloat                   = TEAsiHostType(3);               // kAsiHfloat,               (* float *)
  EAsiHostType_kAsiHreal                    = TEAsiHostType(4);               // kAsiHreal,                (* double *)
  EAsiHostType_kAsiHchar                    = TEAsiHostType(5);               // kAsiHchar,                (* null terminated character string *)
  EAsiHostType_kAsiHunicode                 = TEAsiHostType(6);               // kAsiHunicode,             (* unicode string (wide characters string) *)
  EAsiHostType_kAsiHbinary                  = TEAsiHostType(7);               // kAsiHbinary,              (* binary buffer *)
  EAsiHostType_kAsiHdate                    = TEAsiHostType(8);               // kAsiHdate,                (* date  (ASI_DTDATE) *)
  EAsiHostType_kAsiHtime                    = TEAsiHostType(9);               // kAsiHtime,                (* time  (ASI_DTTIME) *)
  EAsiHostType_kAsiHtimestamp               = TEAsiHostType(10);              // kAsiHtimestamp,           (* timestamp (ASI_DTTIMESTAMP) *)
  EAsiHostType_kAsiHyear                    = TEAsiHostType(11);              // kAsiHyear,                (* Year (ASI_IYEAR) *)
  EAsiHostType_kAsiHyeartomonth             = TEAsiHostType(12);              // kAsiHyeartomonth,         (* Year to Month (ASI_IYEARTOMONTH) *)
  EAsiHostType_kAsiHmonth                   = TEAsiHostType(13);              // kAsiHmonth,               (* Month (ASI_IMONTH) *)
  EAsiHostType_kAsiHday                     = TEAsiHostType(14);              // kAsiHday,                 (* Day (ASI_IDAY) *)
  EAsiHostType_kAsiHdaytohour               = TEAsiHostType(15);              // kAsiHdaytohour,           (* Day to hour (ASI_IDAYTOHOUR) *)
  EAsiHostType_kAsiHdaytominute             = TEAsiHostType(16);              // kAsiHdaytominute,         (* Day to minute (ASI_IDAYTOMINUTE) *)
  EAsiHostType_kAsiHdaytosecond             = TEAsiHostType(17);              // kAsiHdaytosecond,         (* Day to second (ASI_IDAYTOSECOND) *)
  EAsiHostType_kAsiHhour                    = TEAsiHostType(18);              // kAsiHhour,                (* Hour (ASI_IHOUR) *)
  EAsiHostType_kAsiHhourtominute            = TEAsiHostType(19);              // kAsiHhourtominute,        (* Hour to minute (ASI_IHOURTOMINUTE) *)
  EAsiHostType_kAsiHhourtosecond            = TEAsiHostType(20);              // kAsiHhourtosecond,        (* Hour to second (ASI_IHOURTOSECOND) *)
  EAsiHostType_kAsiHminute                  = TEAsiHostType(21);              // kAsiHminute,              (* Minute (ASI_IMINUTE) *)
  EAsiHostType_kAsiHminutetosecond          = TEAsiHostType(22);              // kAsiHminutetosecond,      (* Minute to second (ASI_IMINUTETOSECOND) *)
  EAsiHostType_kAsiHsecond                  = TEAsiHostType(23);              // kAsiHsecond               (* Second (ASI_ISECOND) *) } EAsiHostType;

  // (* *)
  // (*  EAsiDrvStatus, EAsiSIDataType, and EAsiSITransactionType  *)
  // (*  sepecify features and capabilities that connection supports. *)
  // (*  They can be retrieved by means of CAsiSQLObject::GetStatus function *)
  // (* *)

  // (* Supported general features codes *)
  // (* *)
  // typedef enum {
  EAsiDrvStatus_kAsiStatUsername            = TEAsiDrvStatus($00000001);      // kAsiStatUsername        = (int)0x00000001      (* User name *)
  EAsiDrvStatus_kAsiStatPassword            = TEAsiDrvStatus($00000002);      // ,kAsiStatPassword       = (int)0x00000002      (* Password *)
  EAsiDrvStatus_kAsiStatCatalog             = TEAsiDrvStatus($00000004);      // ,kAsiStatCatalog        = (int)0x00000004      (* Catalog feature *)
  EAsiDrvStatus_kAsiStatSchema              = TEAsiDrvStatus($00000008);      // ,kAsiStatSchema         = (int)0x00000008      (* Schema feature *)
  EAsiDrvStatus_kAsiStatTimeZone            = TEAsiDrvStatus($00000010);      // ,kAsiStatTimeZone       = (int)0x00000010      (* Time zone *)
  EAsiDrvStatus_kAsiStatNames               = TEAsiDrvStatus($00000020);      // ,kAsiStatNames          = (int)0x00000020      (* Character set names *)
  EAsiDrvStatus_kAsiStatTranslation         = TEAsiDrvStatus($00000040);      // ,kAsiStatTranslation    = (int)0x00000040      (* Translations *)
  EAsiDrvStatus_kAsiStatInfoSchema          = TEAsiDrvStatus($00000080);      // ,kAsiStatInfoSchema     = (int)0x00000080      (* Information schema facility *)
  EAsiDrvStatus_kAsiStatCDCatalog           = TEAsiDrvStatus($00000100);      // ,kAsiStatCDCatalog      = (int)0x00000100      (* Catalog definition/drop catalog *)
  EAsiDrvStatus_kAsiStatCDSchema            = TEAsiDrvStatus($00000200);      // ,kAsiStatCDSchema       = (int)0x00000200      (* Schema definition/drop schema *)
  EAsiDrvStatus_kAsiStatCDTable             = TEAsiDrvStatus($00000400);      // ,kAsiStatCDTable        = (int)0x00000400      (* Table definition/drop table *)
  EAsiDrvStatus_kAsiStatCDView              = TEAsiDrvStatus($00000800);      // ,kAsiStatCDView         = (int)0x00000800      (* View definition/drop view *)
  EAsiDrvStatus_kAsiStatCDIndex             = TEAsiDrvStatus($00001000);      // ,kAsiStatCDIndex        = (int)0x00001000      (* Index definition/drop index *)
  EAsiDrvStatus_kAsiStatCDTranslation       = TEAsiDrvStatus($00002000);      // ,kAsiStatCDTranslation  = (int)0x00002000      (* Translation definition/drop translation *)
  EAsiDrvStatus_kAsiStatCDAssertion         = TEAsiDrvStatus($00004000);      // ,kAsiStatCDAssertion    = (int)0x00004000      (* Create assertion/drop assertion *)
  EAsiDrvStatus_kAsiStatCDCharset           = TEAsiDrvStatus($00008000);      // ,kAsiStatCDCharset      = (int)0x00008000      (* Character set definition/drop character set *)
  EAsiDrvStatus_kAsiStatCDCollation         = TEAsiDrvStatus($00010000);      // ,kAsiStatCDCollation    = (int)0x00010000      (* Collation definition/drop collation *)
  EAsiDrvStatus_kAsiStatCDDomain            = TEAsiDrvStatus($00020000);      // ,kAsiStatCDDomain       = (int)0x00020000      (* Domain definition/drop domain *)
  EAsiDrvStatus_kAsiStatADomain             = TEAsiDrvStatus($00040000);      // ,kAsiStatADomain        = (int)0x00040000      (* Alter domain *)
  EAsiDrvStatus_kAsiStatATable              = TEAsiDrvStatus($00080000);      // ,kAsiStatATable         = (int)0x00080000      (* Alter table *)
  EAsiDrvStatus_kAsiStatPrivileges          = TEAsiDrvStatus($00100000);      // ,kAsiStatPrivileges     = (int)0x00100000      (* Grant/revoke privileges *)
  EAsiDrvStatus_kAsiStatCommitRollback      = TEAsiDrvStatus($00200000);      // ,kAsiStatCommitRollback = (int)0x00200000      (* Commit work/Rollback work *)
  EAsiDrvStatus_kAsiStatSetTrans            = TEAsiDrvStatus($00400000);      // ,kAsiStatSetTrans       = (int)0x00400000      (* Set transaction *)
  EAsiDrvStatus_kAsiStatSetConstr           = TEAsiDrvStatus($00800000);      // ,kAsiStatSetConstr      = (int)0x00800000      (* Set constraint *)
  EAsiDrvStatus_kAsiStatCursor              = TEAsiDrvStatus($01000000);      // ,kAsiStatCursor         = (int)0x01000000      (* Cursor manipulation (open, close, fetch next) *)
  EAsiDrvStatus_kAsiStatFetch               = TEAsiDrvStatus($02000001);      // ,kAsiStatFetch          = (int)0x02000000      (* Fetches Prior, First, Last, Absolute, Relative *)
  EAsiDrvStatus_kAsiStatSingSelect          = TEAsiDrvStatus($04000000);      // ,kAsiStatSingSelect     = (int)0x04000000      (* Select statement: single row  *)
  EAsiDrvStatus_kAsiStatDeletePos           = TEAsiDrvStatus($08000000);      // ,kAsiStatDeletePos      = (int)0x08000000      (* Delete: positioned *)
  EAsiDrvStatus_kAsiStatUpdatePos           = TEAsiDrvStatus($10000000);      // ,kAsiStatUpdatePos      = (int)0x10000000      (* Update: positioned *)
  EAsiDrvStatus_kAsiStatDeleteSearch        = TEAsiDrvStatus($20000000);      // ,kAsiStatDeleteSearch   = (int)0x20000000      (* Delete: searched *)
  EAsiDrvStatus_kAsiStatUpdateSearch        = TEAsiDrvStatus($40000000);      // ,kAsiStatUpdateSearch   = (int)0x40000000      (* Update: searched *)
  EAsiDrvStatus_kAsiStatInsert              = TEAsiDrvStatus($80000000);      // ,kAsiStatInsert         = (int)0x80000000      (* Insert *)  } EAsiDrvStatus;


  // (* Supported data type  *)
  // typedef enum {
  EAsiSIDataType_kAsiSDImplDefined          = TEAsiSIDataType($00000001);     // kAsiSDImplDefined = (int)0x00000001,
  EAsiSIDataType_kAsiSDChar                 = TEAsiSIDataType($00000002);     // kAsiSDChar        = (int)0x00000002,
  EAsiSIDataType_kAsiSDNumeric              = TEAsiSIDataType($00000004);     // kAsiSDNumeric     = (int)0x00000004,
  EAsiSIDataType_kAsiSDDecimal              = TEAsiSIDataType($00000008);     // kAsiSDDecimal     = (int)0x00000008,
  EAsiSIDataType_kAsiSDInteger              = TEAsiSIDataType($00000010);     // kAsiSDInteger     = (int)0x00000010,
  EAsiSIDataType_kAsiSDSmallInt             = TEAsiSIDataType($00000020);     // kAsiSDSmallInt    = (int)0x00000020,
  EAsiSIDataType_kAsiSDFloat                = TEAsiSIDataType($00000040);     // kAsiSDFloat       = (int)0x00000040,
  EAsiSIDataType_kAsiSDReal                 = TEAsiSIDataType($00000080);     // kAsiSDReal        = (int)0x00000080,
  EAsiSIDataType_kAsiSDDouble               = TEAsiSIDataType($00000100);     // kAsiSDDouble      = (int)0x00000100,
  EAsiSIDataType_kAsiSDDate                 = TEAsiSIDataType($00000200);     // kAsiSDDate        = (int)0x00000200,
  EAsiSIDataType_kAsiSDTime                 = TEAsiSIDataType($00000400);     // kAsiSDTime        = (int)0x00000400,
  EAsiSIDataType_kAsiSDTimeTZ               = TEAsiSIDataType($00000800);     // kAsiSDTimeTZ      = (int)0x00000800,
  EAsiSIDataType_kAsiSDTimestamp            = TEAsiSIDataType($00001000);     // kAsiSDTimestamp   = (int)0x00001000,
  EAsiSIDataType_kAsiSDTimestampTZ          = TEAsiSIDataType($00002000);     // kAsiSDTimestampTZ = (int)0x00002000,
  EAsiSIDataType_kAsiSDYM                   = TEAsiSIDataType($00004000);     // kAsiSDYM          = (int)0x00004000,
  EAsiSIDataType_kAsiSDDT                   = TEAsiSIDataType($00008000);     // kAsiSDDT          = (int)0x00008000,
  EAsiSIDataType_kAsiSDCharVar              = TEAsiSIDataType($00010000);     // kAsiSDCharVar     = (int)0x00010000,
  EAsiSIDataType_kAsiSDBit                  = TEAsiSIDataType($00020000);     // kAsiSDBit         = (int)0x00020000,
  EAsiSIDataType_kAsiSDBitVar               = TEAsiSIDataType($00040000);     // kAsiSDBitVar      = (int)0x00040000,
  EAsiSIDataType_kAsiSDBLOB                 = TEAsiSIDataType($00080000);     // kAsiSDBLOB        = (int)0x00080000 } EAsiSIDataType;


  // (* Supported transaction types *)
  // typedef enum {
  // kAsiTSUndefined = (int )0,    (* Undefined *)
  // (* Read/Write, Read Uncommitted is not possible *)
  EAsiSITransactionType_kAsiTSRWRC          = TEAsiSITransactionType($00000001);    // kAsiTSRWRC = (int)0x00000001,    (* Read/Write, Read Committed *)
  EAsiSITransactionType_kAsiTSRWRR          = TEAsiSITransactionType($00000002);    // kAsiTSRWRR = (int)0x00000002,    (* Read/Write, Repeatable Read *)
  EAsiSITransactionType_kAsiTSRWSR          = TEAsiSITransactionType($00000004);    // kAsiTSRWSR = (int)0x00000004,    (* Read/Write, Serializable *)
  EAsiSITransactionType_kAsiTSRORU          = TEAsiSITransactionType($00000008);    // kAsiTSRORU = (int)0x00000008,    (* Read Only, Read Uncommitted  *)
  EAsiSITransactionType_kAsiTSRORC          = TEAsiSITransactionType($00000010);    // kAsiTSRORC = (int)0x00000010,    (* Read Only, Read Committed *)
  EAsiSITransactionType_kAsiTSRORR          = TEAsiSITransactionType($00000020);    // kAsiTSRORR = (int)0x00000020,    (* Read Only, Repeatable Read *)
  EAsiSITransactionType_kAsiTSROSR          = TEAsiSITransactionType($00000040);    // kAsiTSROSR = (int)0x00000040     (* Read Only, Serializable *) } EAsiSITransactionType);


  // (* Driver features, capabilities and status codes *)
  // typedef enum {
  EAsiStatInfo_kAsiSISupportedFeatures      = TEAsiStatInfo(0);               // kAsiSISupportedFeatures             (* Supported base features codes (EAsiDrvStatus) *)
  EAsiStatInfo_kAsiSITransaction            = TEAsiStatInfo(1);               // ,kAsiSITransaction                  (* Transaction state (EAsiBoolean) *)
  EAsiStatInfo_kAsiSICsrState               = TEAsiStatInfo(2);               // ,kAsiSICsrState                     (* Open/Close cursor (EAsiBoolean) *)
  EAsiStatInfo_kAsiSICsrSns                 = TEAsiStatInfo(3);               // ,kAsiSICsrSns                       (* Sensitive/insensitive cursor (EAsiBoolean) *)
  EAsiStatInfo_kAsiSICsrScr                 = TEAsiStatInfo(4);               // ,kAsiSICsrScr                       (* Scroll/non scroll cursor (EAsiBoolean) *)
  EAsiStatInfo_kAsiSICsrPos                 = TEAsiStatInfo(5);               // ,kAsiSICsrPos                       (* Cursor position (long) *)
  EAsiStatInfo_kAsiSICsrUpd                 = TEAsiStatInfo(6);               // ,kAsiSICsrUpd                       (* Cursor updatability (EAsiBoolean) *)
  EAsiStatInfo_kAsiSIDataType               = TEAsiStatInfo(7);               // ,kAsiSIDataType                     (* Supported data types (EAsiSIDataType) *)
  EAsiStatInfo_kAsiSIBindDataType           = TEAsiStatInfo(8);               // ,kAsiSIBindDataType                 (* Supported bind data types  (EAsiSIDataType) *)
  EAsiStatInfo_kAsiSITransactionType        = TEAsiStatInfo(9);               // ,kAsiSITransactionType              (* Supported types of tranactions (EAsiSITransactionType) *)  } EAsiStatInfo;
  //
  // #ifdef A
{$IFDEF A}
  // (* SQL statement types *)
  // (* *)
  // typedef enum {
  EAsiStatement_kAsiTYPE_UNDEFINED          = TEAsiStatement(0);              // kAsiTYPE_UNDEFINED = 0,   (*  undefined *)
  EAsiStatement_kAsiALLOC_CURSOR            = TEAsiStatement(1);              // kAsiALLOC_CURSOR,         (*  allocate cursor  *)
  EAsiStatement_kAsiALLOC_STATEMENT         = TEAsiStatement(2);              // kAsiALLOC_STATEMENT,      (*  allocate statement *)
  EAsiStatement_kAsiALTER_DOMAIN            = TEAsiStatement(3);              // kAsiALTER_DOMAIN,         (*  alter domain *)
  EAsiStatement_kAsiALTER_TABLE             = TEAsiStatement(4);              // kAsiALTER_TABLE,          (*  alter table *)
  EAsiStatement_kAsiCREATE_ASSERTION        = TEAsiStatement(5);              // kAsiCREATE_ASSERTION,     (*  assertion definition *)
  EAsiStatement_kAsiCREATE_CATALOG          = TEAsiStatement(6);              // kAsiCREATE_CATALOG,       (*  create catalog *)
  EAsiStatement_kAsiCREATE_CHARACTER_SET    = TEAsiStatement(7);              // kAsiCREATE_CHARACTER_SET, (*  character set definition *)
  EAsiStatement_kAsiCREATE_COLLATION        = TEAsiStatement(8);              // kAsiCREATE_COLLATION,     (*  collation definition *)
  EAsiStatement_kAsiCREATE_DOMAIN           = TEAsiStatement(9);              // kAsiCREATE_DOMAIN,        (*  domain definition *)
  EAsiStatement_kAsiCLOSE_CURSOR            = TEAsiStatement(10);             // kAsiCLOSE_CURSOR,         (*  close cursor  *)
  EAsiStatement_kAsiCOMMIT                  = TEAsiStatement(11);             // kAsiCOMMIT,               (*  commit work *)
  EAsiStatement_kAsiCONNECT                 = TEAsiStatement(12);             // kAsiCONNECT,              (*  connect  *)
  EAsiStatement_kAsiCREATE_SCHEMA           = TEAsiStatement(13);             // kAsiCREATE_SCHEMA,        (*  schema definition *)
  EAsiStatement_kAsiCREATE_TABLE            = TEAsiStatement(14);             // kAsiCREATE_TABLE,         (*  table definition *)
  EAsiStatement_kAsiCREATE_VIEW             = TEAsiStatement(15);             // kAsiCREATE_VIEW,          (*  view definition *)
  EAsiStatement_kAsiCREATE_INDEX            = TEAsiStatement(16);             // kAsiCREATE_INDEX,         (*  index definition *)
  EAsiStatement_kAsiCREATE_TRANSLATION      = TEAsiStatement(17);             // kAsiCREATE_TRANSLATION,   (*  translation definition *)
  EAsiStatement_kAsiCURSOR                  = TEAsiStatement(18);             // kAsiCURSOR,               (*  cursor specification *)
  EAsiStatement_kAsiDELETE_CURSOR           = TEAsiStatement(19);             // kAsiDELETE_CURSOR,        (*  delete positioned *)
  EAsiStatement_kAsiDELETE_WHERE            = TEAsiStatement(20);             // kAsiDELETE_WHERE,         (*  delete searched *)
  EAsiStatement_kAsiDEALLOCATE_STATEMENT    = TEAsiStatement(21);             // kAsiDEALLOCATE_STATEMENT, (*  deallocate statement *)
  EAsiStatement_kAsiDISCONNECT              = TEAsiStatement(22);             // kAsiDISCONNECT,           (*  disconnect *)
  EAsiStatement_kAsiDROP_ASSERTION          = TEAsiStatement(23);             // kAsiDROP_ASSERTION,       (*  drop assertion *)
  EAsiStatement_kAsiDROP_CATALOG            = TEAsiStatement(24);             // kAsiDROP_CATALOG,         (*  drop catalog *)
  EAsiStatement_kAsiDROP_CHARACTER_SET      = TEAsiStatement(25);             // kAsiDROP_CHARACTER_SET,   (*  drop character set *)
  EAsiStatement_kAsiDROP_COLLATION          = TEAsiStatement(26);             // kAsiDROP_COLLATION,       (*  drop collation *)
  EAsiStatement_kAsiDROP_DOMAIN             = TEAsiStatement(27);             // kAsiDROP_DOMAIN,          (*  drop domain *)
  EAsiStatement_kAsiDROP_SCHEMA             = TEAsiStatement(28);             // kAsiDROP_SCHEMA,          (*  drop schema *)
  EAsiStatement_kAsiDROP_TABLE              = TEAsiStatement(29);             // kAsiDROP_TABLE,           (*  drop table *)
  EAsiStatement_kAsiDROP_TRANSLATION        = TEAsiStatement(30);             // kAsiDROP_TRANSLATION,     (*  drop translatio  kAsiTYPE_UNDEFINED: TEAsiStatement  = 0;    n *)
  EAsiStatement_kAsiDROP_VIEW               = TEAsiStatement(31);             // kAsiDROP_VIEW,            (*  drop view *)
  EAsiStatement_kAsiDROP_INDEX              = TEAsiStatement(32);             // kAsiDROP_INDEX,           (*  drop index *)
  EAsiStatement_kAsiEXECUTE_IMMEDIATE       = TEAsiStatement(33);             // kAsiEXECUTE_IMMEDIATE,    (*  immediate execute *)
  EAsiStatement_kAsiEXECUTE                 = TEAsiStatement(34);             // kAsiEXECUTE,              (*  execute *)
  EAsiStatement_kAsiFETCH                   = TEAsiStatement(35);             // kAsiFETCH,                (*  fetch *)
  EAsiStatement_kAsiGRANT                   = TEAsiStatement(36);             // kAsiGRANT,                (*  grant privileges *)
  EAsiStatement_kAsiINSERT                  = TEAsiStatement(37);             // kAsiINSERT,               (*  insert *)
  EAsiStatement_kAsiOPEN                    = TEAsiStatement(38);             // kAsiOPEN,                 (*  open cursor *)
  EAsiStatement_kAsiPREPARE                 = TEAsiStatement(39);             // kAsiPREPARE,              (*  prepare *)
  EAsiStatement_kAsiREVOKE                  = TEAsiStatement(40);             // kAsiREVOKE,               (*  revoke privileges *)
  EAsiStatement_kAsiROLLBACK                = TEAsiStatement(41);             // kAsiROLLBACK,             (*  rollback work *)
  EAsiStatement_kAsiSELECT                  = TEAsiStatement(42);             // kAsiSELECT,               (*  select statement: single row *)
  EAsiStatement_kAsiSET_CATALOG             = TEAsiStatement(43);             // kAsiSET_CATALOG,          (*  set catalog *)
  EAsiStatement_kAsiSET_SCHEMA              = TEAsiStatement(44);             // kAsiSET_SCHEMA,           (*  set schema *)
  EAsiStatement_kAsiSET_TIME_ZONE           = TEAsiStatement(45);             // kAsiSET_TIME_ZONE,        (*  set time zone *)
  EAsiStatement_kAsiSET_NAMES               = TEAsiStatement(46);             // kAsiSET_NAMES,            (*  set names  *)
  EAsiStatement_kAsiSET_TRANSACTION         = TEAsiStatement(47);             // kAsiSET_TRANSACTION,      (*  set transaction *)
  EAsiStatement_kAsiSET_CONSTRAINT          = TEAsiStatement(48);             // kAsiSET_CONSTRAINT,       (*  set constraint mode  *)
  EAsiStatement_kAsiSET_AUTHORIZATION       = TEAsiStatement(49);             // kAsiSET_AUTHORIZATION,    (*  set authorization identifier *)
  EAsiStatement_kAsiUPDATE_CURSOR           = TEAsiStatement(50);             // kAsiUPDATE_CURSOR,        (*  update: positioned *)
  EAsiStatement_kAsiUPDATE_WHERE            = TEAsiStatement(51);             // kAsiUPDATE_WHERE          (*  update: searched *)} EAsiStatement;
  // #endif
{$ENDIF}

  // (* Transaction isolation level *)
  // typedef enum {
  EAsiTILevel_kAsiTIUndefined               = TEAsiTILevel(0);                // kAsiTIUndefined  = 0,
  EAsiTILevel_kAsiReadUncommitted           = TEAsiTILevel(1);                // kAsiReadUncommitted  = 1,
  EAsiTILevel_kAsiReadCommitted             = TEAsiTILevel(2);                // kAsiReadCommitted,
  EAsiTILevel_kAsiRepeatableRead            = TEAsiTILevel(3);                // kAsiRepeatableRead,
  EAsiTILevel_kAsiSerializable              = TEAsiTILevel(4);                // kAsiSerializable } EAsiTILevel;

  // (* Transaction mode *)
  // typedef enum {
  EAsiTMode_kAsiTMUndefined                 = TEAsiTMode(0);                  // kAsiTMUndefined      = 0,
  EAsiTMode_kAsiTReadOnly                   = TEAsiTMode(1);                  // kAsiTReadOnly        = 1,
  EAsiTMode_kAsiTReadWrite                  = TEAsiTMode(2);                  // kAsiTReadWrite  } EAsiTMode;

  // (* default diagnostics size *)
  // #define  DefaultDiagSize 32

  // (* Defer or immediate constriant checking *)
  // typedef enum {
  EAsiConstrCheck_kAsiCDefer                = TEAsiConstrCheck(1);            // kAsiCDefer = 1,
  EAsiConstrCheck_kAsiCImmediate            = TEAsiConstrCheck(2);            // kAsiCImmediate  } EAsiConstrCheck;


  // (* Cursor scrollability *)
  // typedef enum {
  EAsiCurScr_kAsiNonScroll                  = TEAsiCurScr(0);                 // kAsiNonScroll  = 0,
  EAsiCurScr_kAsiScroll                     = TEAsiCurScr(1);                 // kAsiScroll     = 1  } EAsiCurScr;

  // (* Cursor Sensitivity *)
  // typedef enum {
  EAsiCurSns_kAsiSnsUndef                   = TEAsiCurSns(0);                 // kAsiSnsUndef     = 0,      (* Cursor sensitivity is undefined *)
  EAsiCurSns_kAsiInsensitive                = TEAsiCurSns(1);                 // kAsiInsensitive  = 1 } EAsiCurSns;

  // (* Fetch direction *)
  // typedef enum {
  EAsiDirection_kAsiNext                    = TEAsiDirection(1);              // kAsiNext = 1,
  EAsiDirection_kAsiPrior                   = TEAsiDirection(2);              // kAsiPrior,
  EAsiDirection_kAsiFirst                   = TEAsiDirection(3);              // kAsiFirst,
  EAsiDirection_kAsiLast                    = TEAsiDirection(4);              // kAsiLast,
  EAsiDirection_kAsiAbsolute                = TEAsiDirection(5);              // kAsiAbsolute,
  EAsiDirection_kAsiRelative                = TEAsiDirection(6);              // kAsiRelative  } EAsiDirection;

  // (* Cursor position *)
  // (* *)
  // typedef enum {
  EAsiCurPos_kAsiCPUnknown                  = TEAsiCurPos(0);                 // kAsiCPUnknown = 0,     (* Position unknown *)
  EAsiCurPos_kAsiTos                        = TEAsiCurPos(1);                 // kAsiTos       = 1,     (* Before the first row *)
  EAsiCurPos_kAsiEos                        = TEAsiCurPos(2);                 // kAsiEos       = 2,     (* After the last row *)
  EAsiCurPos_kAsiBnr                        = TEAsiCurPos(3);                 // kAsiBnr       = 3,     (* Before row (on deleted row) *)
  EAsiCurPos_kAsiOcr                        = TEAsiCurPos(4);                 // kAsiOcr       = 4      (* Current row *) } EAsiCurPos;

  // (*  Coercibility attributes *)
  // (* *)
  // typedef enum {
  EAsiCAttr_kAsiCACoercible                 = TEAsiCAttr(0);                  // kAsiCACoercible = 0,    (* Coercible *)
  EAsiCAttr_kAsiCAImplicit                  = TEAsiCAttr(1);                  // kAsiCAImplicit  = 1,    (* Implicit *)
  EAsiCAttr_kAsiNoCollation                 = TEAsiCAttr(2);                  // kAsiNoCollation = 2,    (* No collating sequence  *)
  EAsiCAttr_kAsiCAExplicit                  = TEAsiCAttr(3);                  // kAsiCAExplicit  = 3     (* Explicit *)  } EAsiCAttr;


  // (* Information schema tables *)
  // typedef enum {
  EAsiDataSourceType_kAsiISUnknown          = TEAsiDataSourceType(0);         // kAsiISUnknown                    = 0

  // Logical tables
  EAsiDataSourceType_kAsiIS_ASSERTIONS           = TEAsiInfSchTab(1);         // ,kAsiIS_ASSERTIONS               = 1
  EAsiDataSourceType_kAsiIS_CHARACTER_SETS       = TEAsiInfSchTab(2);         // ,kAsiIS_CHARACTER_SETS           = 2
  EAsiDataSourceType_kAsiIS_CHECK_CONSTRAINTS    = TEAsiInfSchTab(3);         // ,kAsiIS_CHECK_CONSTRAINTS        = 3
  EAsiDataSourceType_kAsiIS_COLLATIONS           = TEAsiInfSchTab(4);         // ,kAsiIS_COLLATIONS               = 4
  EAsiDataSourceType_kAsiIS_COLUMN_DOMAIN_USAGE  = TEAsiInfSchTab(5);         // ,kAsiIS_COLUMN_DOMAIN_USAGE      = 5
  EAsiDataSourceType_kAsiIS_COLUMN_PRIVILEGES    = TEAsiInfSchTab(6);         // ,kAsiIS_COLUMN_PRIVILEGES        = 6
  EAsiDataSourceType_kAsiIS_COLUMNS              = TEAsiInfSchTab(7);         // ,kAsiIS_COLUMNS                  = 7
  EAsiDataSourceType_kAsiIS_CONSTRAINT_COLUMN_USAGE  = TEAsiInfSchTab(8);     // ,kAsiIS_CONSTRAINT_COLUMN_USAGE  = 8
  EAsiDataSourceType_kAsiIS_CONSTRAINT_TABLE_USAGE   = TEAsiInfSchTab(9);     // ,kAsiIS_CONSTRAINT_TABLE_USAGE   = 9
  EAsiDataSourceType_kAsiIS_FOREIGN_KEYS             = TEAsiInfSchTab(10);    // ,kAsiIS_FOREIGN_KEYS             = 10
  EAsiDataSourceType_kAsiIS_KEY_COLUMN_USAGE         = TEAsiInfSchTab(11);    // ,kAsiIS_KEY_COLUMN_USAGE         = 11
  EAsiDataSourceType_kAsiIS_PRIMARY_KEYS             = TEAsiInfSchTab(12);    // ,kAsiIS_PRIMARY_KEYS             = 12
  EAsiDataSourceType_kAsiIS_PROCEDURE_COLUMNS        = TEAsiInfSchTab(13);    // ,kAsiIS_PROCEDURE_COLUMNS        = 13
  EAsiDataSourceType_kAsiIS_PROCEDURE_PARAMETERS     = TEAsiInfSchTab(14);    // ,kAsiIS_PROCEDURE_PARAMETERS     = 14
  EAsiDataSourceType_kAsiIS_PROCEDURES               = TEAsiInfSchTab(15);    // ,kAsiIS_PROCEDURES               = 15
  EAsiDataSourceType_kAsiIS_REFERENTIAL_CONSTRAINTS  = TEAsiInfSchTab(16);    // ,kAsiIS_REFERENTIAL_CONSTRAINTS  = 16
  EAsiDataSourceType_kAsiIS_SCHEMATA                 = TEAsiInfSchTab(17);    // ,kAsiIS_SCHEMATA                 = 17
  EAsiDataSourceType_kAsiIS_SQL_LANGUAGES            = TEAsiInfSchTab(18);    // ,kAsiIS_SQL_LANGUAGES            = 18
  EAsiDataSourceType_kAsiIS_TABLE_CONSTRAINTS        = TEAsiInfSchTab(19);    // ,kAsiIS_TABLE_CONSTRAINTS        = 19
  EAsiDataSourceType_kAsiIS_TABLE_PRIVILEGES         = TEAsiInfSchTab(20);    // ,kAsiIS_TABLE_PRIVILEGES         = 20
  EAsiDataSourceType_kAsiIS_TABLES                   = TEAsiInfSchTab(21);    // ,kAsiIS_TABLES                   = 21
  EAsiDataSourceType_kAsiIS_TRANSLATIONS             = TEAsiInfSchTab(22);    // ,kAsiIS_TRANSLATIONS             = 22
  EAsiDataSourceType_kAsiIS_USAGE_PRIVILEGES         = TEAsiInfSchTab(23);    // ,kAsiIS_USAGE_PRIVILEGES         = 23
  EAsiDataSourceType_kAsiIS_VIEW_COLUMN_USAGE        = TEAsiInfSchTab(24);    // ,kAsiIS_VIEW_COLUMN_USAGE        = 24
  EAsiDataSourceType_kAsiIS_VIEW_TABLE_USAGE         = TEAsiInfSchTab(25);    // ,kAsiIS_VIEW_TABLE_USAGE         = 25
  EAsiDataSourceType_kAsiIS_VIEWS                    = TEAsiInfSchTab(26);    // ,kAsiIS_VIEWS                    = 26

  // Physical
  EAsiDataSourceType_kAsiIS_CATALOGS        = TEAsiInfSchTab(27);             // ,kAsiIS_CATALOGS                 = 27
  EAsiDataSourceType_kAsiIS_INDEXES         = TEAsiInfSchTab(28);             // ,kAsiIS_INDEXES                  = 28
  EAsiDataSourceType_kAsiIS_PROVIDER_TYPES  = TEAsiInfSchTab(29);             // ,kAsiIS_PROVIDER_TYPES           = 29
  EAsiDataSourceType_kAsiIS_STATISTICS      = TEAsiInfSchTab(30);             // ,kAsiIS_STATISTICS               = 30 } EAsiInfSchTab;


  // (* Datasource type *)
  // typedef enum {
  EAsiDataSourceType_kAsiDSSOURCETYPE_BOTH           = TEAsiDataSourceType(0);    // kAsiDSSOURCETYPE_BOTH       = 0,
  EAsiDataSourceType_kAsiDSSOURCETYPE_DATASOURCE     = TEAsiDataSourceType(1);    // kAsiDSSOURCETYPE_DATASOURCE = 1,
  EAsiDataSourceType_kAsiDSSOURCETYPE_ENUMERATOR     = TEAsiDataSourceType(2);    // kAsiDSSOURCETYPE_ENUMERATOR = 2 } EAsiDataSourceType;




  // (* //////////////////////////////////////////////////////////////// *)
  // (* *)
  // (* Default, minimal and maximal setting for ASI data *)
  // (*  *)
  MaxCharLength               = 256;  // #define MaxCharLength             256
  DefaultCharLength           = 1;    // #define DefaultCharLength         1

  MaxBinaryLength             = 256*8;// #define MaxBinaryLength           (256*8)
  DefaultBinaryLength         = 1;    // #define DefaultBinaryLength       1

  SmallIntPrecision           = 6;    // #define SmallIntPrecision         6

  IntegerPrecision            = 10;   // #define IntegerPrecision          10

  MaxNumericPrecision         = 32;   // #define MaxNumericPrecision       32
  MaxNumericScale             = 32;   // #define MaxNumericScale           MaxNumericPrecision
  DefaultNumericPrecision     = 18;   // #define DefaultNumericPrecision   18
  DefaultNumericScale         = 0;    // #define DefaultNumericScale       0

  MaxDecimalPrecision         = 32;   // #define MaxDecimalPrecision       32
  MaxDecimalScale             = 32;   // #define MaxDecimalScale           MaxDecimalPrecision
  DefaultDecimalPrecision     = 18;   // #define DefaultDecimalPrecision   18
  DefaultDecimalScale         = 0;    // #define DefaultDecimalScale       0

  MaxFloatPrecision           = 32;   // #define MaxFloatPrecision         32
  DefaultFloatPrecision       = 16;   // #define DefaultFloatPrecision     16

  RealPrecision               = 32;   // #define RealPrecision             32

  DoublePrecision             = 64;   // #define DoublePrecision           64

  MaxLeadingFieldPrec         = 6;    // #define MaxLeadingFieldPrec       6    (* Interval  *)
  MaxFracSecondPrec           = 8;    // #define MaxFracSecondPrec         8
  MinLeadingFieldPrec         = 2;    // #define MinLeadingFieldPrec       2
  MinFracSecondPrec           = 0;    // #define MinFracSecondPrec         0
  DefaultLeadingFieldPrec     = 4;    // #define DefaultLeadingFieldPrec   4
  DefaultFracSecondPrec       = 0;    // #define DefaultFracSecondPrec     0

  MaxTimePrecision            = 6;    // #define MaxTimePrecision          6
  DefaultTimePrecision        = 0;    // #define DefaultTimePrecision      0

  MaxTimeStampPrecision       = 6;    // #define MaxTimeStampPrecision     6
  DefaultTimeStampPrecision   = 6;    // #define DefaultTimeStampPrecision 6

  MaxIdentLength              = 256;  // #define MaxIdentLength            256

  DefaultPointDimension       = 3;    // #define DefaultPointDimension     3


  // (* //////////////////////////////////////////////////////////////// *)
  // (* *)
  // (* Implementation defined data definition *)
  // (* *)
  AsiImplDefFxdMin            = 0000; // #define AsiImplDefFxdMin          0000 (* 0000 - 1999 reserved for ASI *)
  AsiImplDefFxdUser           = 2000; // #define AsiImplDefFxdUser         2000 (* 2000 - 3999 avail for User *)
  AsiImplDefFxdMax            = 3999; // #define AsiImplDefFxdMax          3999
  AsiImplDefRawMin            = 4000; // #define AsiImplDefRawMin          4000 (* 4000 - 5999 reserved for ASI *)
  AsiImplDefRawUser           = 6000; // #define AsiImplDefRawUser         6000 (* 6000 - 8000 avail for User *)
  AsiImplDefRawMax            = 8000; // #define AsiImplDefRawMax          8000


  // (* //////////////////////////////////////////////////////////////////// *)
  // (* *)
  // (* Condition information item names *)
  // (* *)
  // typedef enum {                (* Type of data in buffer *)
  EAsiDiag_kAsiConditionNumber              = TEAsiDiag(1);                   // kAsiConditionNumber  (1,  (* Integer *)
  EAsiDiag_kAsiMessageLength                = TEAsiDiag(2);                   // kAsiMessageLength,        (* Integer *)
  EAsiDiag_kAsiMessageOctetLength           = TEAsiDiag(3);                   // kAsiMessageOctetLength,   (* Integer *)

  EAsiDiag_kAsiHRESULT                      = TEAsiDiag(4);                   // kAsiHRESULT          ( 4,(* HRESULT *)

  EAsiDiag_kAsiConditionStrings             = TEAsiDiag(20);                  // kAsiConditionStrings (20,
  EAsiDiag_kAsiReturnedSQLSTATE             = TEAsiDiag(21);                  // kAsiReturnedSQLSTATE,     (* Char *)
  EAsiDiag_kAsiClassOrigin                  = TEAsiDiag(22);                  // kAsiClassOrigin,          (* Char *)
  EAsiDiag_kAsiSubClassOrigin               = TEAsiDiag(23);                  // kAsiSubClassOrigin,       (* Char *)
  EAsiDiag_kAsiServerName                   = TEAsiDiag(24);                  // kAsiServerName,           (* Char *)
  EAsiDiag_kAsiConnectionName               = TEAsiDiag(25);                  // kAsiConnectionName,       (* Char *)
  EAsiDiag_kAsiConstraintCatalog            = TEAsiDiag(26);                  // kAsiConstraintCatalog,    (* Char *)
  EAsiDiag_kAsiConstraintSchema             = TEAsiDiag(27);                  // kAsiConstraintSchema,     (* Char *)
  EAsiDiag_kAsiConstraintName               = TEAsiDiag(28);                  // kAsiConstraintName,       (* Char *)
  EAsiDiag_kAsiCatalogName                  = TEAsiDiag(29);                  // kAsiCatalogName,          (* Char *)
  EAsiDiag_kAsiSchemaName                   = TEAsiDiag(30);                  // kAsiSchemaName,           (* Char *)
  EAsiDiag_kAsiTableName                    = TEAsiDiag(31);                  // kAsiTableName,            (* Char *)
  EAsiDiag_kAsiColumnName                   = TEAsiDiag(32);                  // kAsiColumnName,           (* Char *)
  EAsiDiag_kAsiCursorName                   = TEAsiDiag(33);                  // kAsiCursorName,           (* Char *)
  EAsiDiag_kAsiMessageText                  = TEAsiDiag(34);                  // kAsiMessageText,          (* Char *)

  EAsiDiag_kAsiInterface                    = TEAsiDiag(35);                  // kAsiInterface        = 35 (*IID*) } EAsiDiag;

  // typedef unsigned int AsiDiag;
  MinUserDefDiagParam       = $0400;  // #define MinUserDefDiagParam         0x0400



  // (* //////////////////////////////////////////////////////////////////// *)
  // (* *)
  // (* Exception conditions used in ASI. *)
  // (* *)
  // typedef enum {

  EAsiError_kAsiErrUndefined                = TEAsiError(-1);                 // kAsiErrUndefined = -1

  EAsiError_AsiError_kAsiNoError            = TEAsiError(0);                  // ,kAsiNoError = 0   (* Successful completion *)
  EAsiError_kAsiOKAY                        = TEAsiError(0);                  // ,kAsiOKAY    = 0

  // (* The following error codes are for standard SQLSTATE values *)
  // (* *)
  EAsiError_kAsiSQLWARN                     = TEAsiError($0100);              // ,kAsiSQLWARN =           0x0100  (* warning  *)
  EAsiError_kAsiSQLWARNCUROP                = TEAsiError($0101);              // ,kAsiSQLWARNCUROP                (* cursor operation conflict  *)
  EAsiError_kAsiSQLWARNDISC                 = TEAsiError($0102);              // ,kAsiSQLWARNDISC                 (* disconnect error  *)
  EAsiError_kAsiSQLNULLSET                  = TEAsiError($0103);              // ,kAsiSQLNULLSET                  (* null value eliminated in set function  *)
  EAsiError_kAsiSQLWARNRTRUNC               = TEAsiError($0104);              // ,kAsiSQLWARNRTRUNC               (* string data, right truncation  *)
  EAsiError_kAsiSQLWARNINSUFDESC            = TEAsiError($0105);              // ,kAsiSQLWARNINSUFDESC            (* insufficient item descriptor areas  *)
  EAsiError_kAsiSQLWARNREVOKE               = TEAsiError($0106);              // ,kAsiSQLWARNREVOKE               (* privilege not revoked  *)
  EAsiError_kAsiSQLWARNGRANT                = TEAsiError($0107);              // ,kAsiSQLWARNGRANT                (* privilege not granted  *)
  EAsiError_kAsiSQLWARNBITPAD               = TEAsiError($0108);              // ,kAsiSQLWARNBITPAD               (* implicit zero-bit padding  *)
  EAsiError_kAsiSQLWARNLONGCOND             = TEAsiError($0109);              // ,kAsiSQLWARNLONGCOND             (* search condition too long for information schema  *)
  EAsiError_kAsiSQLWARNLONGEXPR             = TEAsiError($0110);              // ,kAsiSQLWARNLONGEXPR             (* query expression too long for information schema  *)

  EAsiError_kAsiSQLNODATA                   = TEAsiError($0200);              // ,kAsiSQLNODATA =         0x0200  (* no data  *)
  EAsiError_kAsiSQLNDSearchStm              = TEAsiError($0201);              // ,kAsiSQLNDSearchStm              (* rows were not modified by searched statement *)
  EAsiError_kAsiSQLNDSingSelect             = TEAsiError($0202);              // ,kAsiSQLNDSingSelect             (* row doesn't match single select *)
  EAsiError_kAsiSQLNDEOS                    = TEAsiError($0203);              // ,kAsiSQLNDEOS                    (* fetch: end of selection set *)
  EAsiError_kAsiSQLNDTOS                    = TEAsiError($0204);              // ,kAsiSQLNDTOS                    (* fetch: top of selection set *)

  EAsiError_kAsiSQLDYN                      = TEAsiError($0700);              // ,kAsiSQLDYN    =         0x0700  (* dynamic SQL error  *)
  EAsiError_kAsiSQLDYNUPMISMATCH            = TEAsiError($0701);              // ,kAsiSQLDYNUPMISMATCH            (* using clause does not match dynamic parameter specification  *)
  EAsiError_kAsiSQLDYNUTMISMATCH            = TEAsiError($0701);              // ,kAsiSQLDYNUTMISMATCH            (* using clause does not match target specification  *)
  EAsiError_kAsiSQLDYNEXECUR                = TEAsiError($0703);              // ,kAsiSQLDYNEXECUR                (* cursor specification cannot be executed  *)
  EAsiError_kAsiSQLDYNUSINGMIS              = TEAsiError($0704);              // ,kAsiSQLDYNUSINGMIS              (* using clause required for dynamic parameter  *)
  EAsiError_kAsiSQLDYNNOTCURSOR             = TEAsiError($0705);              // ,kAsiSQLDYNNOTCURSOR             (* prepared statement not a cursor specification  *)
  EAsiError_kAsiSQLDYNAVIOLATION            = TEAsiError($0706);              // ,kAsiSQLDYNAVIOLATION            (* restricted data type attribute violation  *)
  EAsiError_kAsiSQLDYNINTOMIS               = TEAsiError($0707);              // ,kAsiSQLDYNINTOMIS               (* using clause required for result fields  *)
  EAsiError_kAsiSQLDYNINVDSCCOUN            = TEAsiError($0708);              // ,kAsiSQLDYNINVDSCCOUN            (* invalid descriptor count  *)
  EAsiError_kAsiSQLDYNINVDSCIDX             = TEAsiError($0709);              // ,kAsiSQLDYNINVDSCIDX             (* invalid descriptor index  *)
  EAsiError_kAsiSQLDYNNOTPREPARED           = TEAsiError($0710);              // ,kAsiSQLDYNNOTPREPARED           (* statement was not prepared *)
  EAsiError_kAsiSQLDYNAlreadyBound          = TEAsiError($0711);              // ,kAsiSQLDYNAlreadyBound          (* columns were already bound with host buffers *)

  EAsiError_kAsiSQLCON                      = TEAsiError($0800);              // ,kAsiSQLCON     =        0x0800  (* connection exception  *)
  EAsiError_kAsiSQLCONCLIENT                = TEAsiError($0801);                // ,kAsiSQLCONCLIENT                (* SQL-client unable to establish SQL- connection  *)
  EAsiError_kAsiSQLCONNAMEUSE               = TEAsiError($0802);              // ,kAsiSQLCONNAMEUSE               (* connection name in use  *)
  EAsiError_kAsiSQLCONNOTEXIST              = TEAsiError($0803);              // ,kAsiSQLCONNOTEXIST              (* connection does not exist *)
  EAsiError_kAsiSQLCONSERVER                = TEAsiError($0804);              // ,kAsiSQLCONSERVER                (* SQL-server rejected establishment of SQL-connection  *)
  EAsiError_kAsiSQLCONOPENOBJS              = TEAsiError($0805);              // ,kAsiSQLCONOPENOBJS        (* open objects associated with session *)
  EAsiError_kAsiSQLCONFAILURE               = TEAsiError($0806);              // ,kAsiSQLCONFAILURE               (* connection failure    *)
  EAsiError_kAsiSQLCONTRANS                 = TEAsiError($0807);              // ,kAsiSQLCONTRANS                 (* transaction resolution unknown  *)

  EAsiError_kAsiSQLCURCONFLICT              = TEAsiError($0900);              // ,kAsiSQLCURCONFLICT =    0x0900  (* cursor operation conflict   *)

  EAsiError_kAsiSQLNOTSUPPORTED             = TEAsiError($0A00);              // ,kAsiSQLNOTSUPPORTED =   0x0A00  (* feature not supported  *)
  EAsiError_kAsiSQLMULTRANS                 = TEAsiError($0A01);              // ,kAsiSQLMULTRANS                 (* multiple environment transaction  *)

  EAsiError_kAsiSQLCARVIOLATION             = TEAsiError($2100);              // ,kAsiSQLCARVIOLATION  =  0x2100  (* cardinality violation  *)

  EAsiError_kAsiSQLDATA                     = TEAsiError($2200);              // ,kAsiSQLDATA          =  0x2200  (* data exception  *)
  EAsiError_kAsiSQLDATASRTRUN               = TEAsiError($2201);              // ,kAsiSQLDATASRTRUN               (* string data, right truncation  *)
  EAsiError_kAsiSQLDATANOIND                = TEAsiError($2202);              // ,kAsiSQLDATANOIND                (* null value, no indicator parameter *)
  EAsiError_kAsiSQLDATANUMRANGE             = TEAsiError($2203);              // ,kAsiSQLDATANUMRANGE             (* numeric value out of range  *)
  EAsiError_kAsiSQLDATANUMTRUNC             = TEAsiError($2204);              // ,kAsiSQLDATANUMTRUNC             (* decimal fractional part was rounded *)
  EAsiError_kAsiSQLDATAASSIGN               = TEAsiError($2205);              // ,kAsiSQLDATAASSIGN               (* error in assignment  *)
  EAsiError_kAsiSQLDATAFETSEQ               = TEAsiError($2206);              // ,kAsiSQLDATAFETSEQ               (* invalid fetch sequence *)
  EAsiError_kAsiSQLDATADTFORMAT             = TEAsiError($2207);              // ,kAsiSQLDATADTFORMAT             (* invalid datetime format *)
  EAsiError_kAsiSQLDATADTOVF                = TEAsiError($2208);              // ,kAsiSQLDATADTOVF                (* datetime field overflow *)
  EAsiError_kAsiSQLDATATZDISP               = TEAsiError($2209);              // ,kAsiSQLDATATZDISP               (* invalid time zone displacement value  *)
  EAsiError_kAsiSQLDATA10                   = TEAsiError($2210);              // ,kAsiSQLDATA10                   (* Undefined *)
  EAsiError_kAsiSQLDATASUBSTRERR            = TEAsiError($2211);              // ,kAsiSQLDATASUBSTRERR            (* substring error  *)
  EAsiError_kAsiSQLDATAZERODIV              = TEAsiError($2212);              // ,kAsiSQLDATAZERODIV              (* division by zero *)
  EAsiError_kAsiSQLDATA13                   = TEAsiError($2213);              // ,kAsiSQLDATA13                   (* Undefined *)
  EAsiError_kAsiSQLDATAINFORMAT             = TEAsiError($2214);              // ,kAsiSQLDATAINFORMAT             (* invalid interval format (ASI extra) *)
  EAsiError_kAsiSQLINTEROVF                 = TEAsiError($2215);              // ,kAsiSQLINTEROVF                 (* interval field overflow  *)
  EAsiError_kAsiSQLColRO                    = TEAsiError($2216);              // ,kAsiSQLColRO                    (* column is read only *)
  EAsiError_kAsiSQLDATA17                   = TEAsiError($2217);              // ,kAsiSQLDATA17                   (* Undefined *)
  EAsiError_kAsiSQLDATACHARCAST             = TEAsiError($2218);              // ,kAsiSQLDATACHARCAST             (* invalid character value for cast *)
  EAsiError_kAsiSQLDATAESCCHAR              = TEAsiError($2219);              // ,kAsiSQLDATAESCCHAR              (* invalid escape character  *)
  EAsiError_kAsiSQLDATA20                   = TEAsiError($2220);              // ,kAsiSQLDATA20                   (* Undefined *)
  EAsiError_kAsiSQLDATACHAR                 = TEAsiError($2221);              // ,kAsiSQLDATACHAR                 (* character not in repertoire *)
  EAsiError_kAsiSQLDATAINDIVF               = TEAsiError($2222);              // ,kAsiSQLDATAINDIVF               (* indicator overflow  *)
  EAsiError_kAsiSQLDATAPARVAL               = TEAsiError($2223);              // ,kAsiSQLDATAPARVAL               (* invalid parameter value  *)
  EAsiError_kAsiSQLDATACSTR                 = TEAsiError($2224);              // ,kAsiSQLDATACSTR                 (* unterminated C string  *)
  EAsiError_kAsiSQLDATAESCSEQ               = TEAsiError($2225);              // ,kAsiSQLDATAESCSEQ               (* invalid escape sequence  *)
  EAsiError_kAsiSQLDATASTRLEN               = TEAsiError($2226);              // ,kAsiSQLDATASTRLEN               (* string data, length mismatch  *)
  EAsiError_kAsiSQLDATATRIMERR              = TEAsiError($2227);              // ,kAsiSQLDATATRIMERR              (* trim error  *)
  EAsiError_kAsiSQLDATADTUNDF               = TEAsiError($2228);              // ,kAsiSQLDATADTUNDF               (* datetime field underflow *)

  EAsiError_kAsiSQLINTCONSTR                = TEAsiError($2300);              // ,kAsiSQLINTCONSTR     =  0x2300  (* integrity constraint violation  *)

  EAsiError_kAsiSQLINVCURSTATE              = TEAsiError($2400);              // ,kAsiSQLINVCURSTATE   =  0x2400  (* invalid cursor state  *)
  EAsiError_kAsiSQLICSDeallocStm            = TEAsiError($2401);              // ,kAsiSQLICSDeallocStm =  0x2401  (* deallocate statement associated with open cursor *)
  EAsiError_kAsiSQLICSClose                 = TEAsiError($2402);              // ,kAsiSQLICSClose      =  0x2402  (* cursor is in close state *)
  EAsiError_kAsiSQLICSNotScroll             = TEAsiError($2400);              // ,kAsiSQLICSNotScroll  =  0x2403  (* can only fetch next in non-scroll cursor *)
  EAsiError_kAsiSQLICSReadOnly              = TEAsiError($2404);              // ,kAsiSQLICSReadOnly   =  0x2404  (* cursor is read only *)
  EAsiError_kAsiSQLICSNoCurRow              = TEAsiError($2405);              // ,kAsiSQLICSNoCurRow   =  0x2405  (* cursor is not positioned on row *)
  EAsiError_kAsiSQLICSOpen                  = TEAsiError($2406);              // ,kAsiSQLICSOpen       =  0x2406  (* cursor is in open state *)

  EAsiError_kAsiSQLINVTRSTATE               = TEAsiError($2500);              // ,kAsiSQLINVTRSTATE    =  0x2500  (* invalid transaction state  *)
  EAsiError_kAsiSQLITSActive                = TEAsiError($2501);              // ,kAsiSQLITSActive     =  0x2501  (* disconnect while transaction is active *)
  EAsiError_kAsiSQLITSNotActive             = TEAsiError($2502);              // ,kAsiSQLITSNotActive  =  0x2502  (* transaction is in-active *)
  EAsiError_kAsiSQLITSSetTrans              = TEAsiError($2503);              // ,kAsiSQLITSSetTrans   =  0x2503  (* set transaction (transaction is active) *)
  EAsiError_kAsiSQLINVTSTabRO               = TEAsiError($2504);              // ,kAsiSQLINVTSTabRO    =  0x2504  (* Table is read only *)
  EAsiError_kAsiSQLINVTSTrsRO               = TEAsiError($2505);              // ,kAsiSQLINVTSTrsRO    =  0x2505  (* Transaction is read only *)
  EAsiError_kAsiSQLINVTSAuth                = TEAsiError($2506);              // ,kAsiSQLINVTSAuth     =  0x2506  (* Set authorization id but transaction is active *)


  EAsiError_kAsiSQLINVSTMNAME               = TEAsiError($2600);                // ,kAsiSQLINVSTMNAME    =  0x2600  (* invalid SQL statement name  *)

  EAsiError_kAsiSQLTRIGCHNVIOL              = TEAsiError($2700);                // ,kAsiSQLTRIGCHNVIOL   =  0x2700  (* triggered data change violation  *)

  EAsiError_kAsiSQLINVAUTHID                = TEAsiError($2800);                // ,kAsiSQLINVAUTHID     =  0x2800  (* invalid authorization specification  *)

  EAsiError_kAsiSQLDIRSYNACS                = TEAsiError($2A00);              // ,kAsiSQLDIRSYNACS     =  0x2A00  (* syntax error or access rule violation in direct SQL statement  *)

  EAsiError_kAsiSQLPRIVEXIST                = TEAsiError($2B00);              // ,kAsiSQLPRIVEXIST     =  0x2B00  (* dependent privilege descriptor still exist  *)

  EAsiError_kAsiSQLINVCHARSET               = TEAsiError($2C00);              // ,kAsiSQLINVCHARSET    =  0x2C00  (* invalid character set name    *)

  EAsiError_kAsiSQLINVTRTERM                = TEAsiError($2D00);              // ,kAsiSQLINVTRTERM     =  0x2D00  (* invalid transaction termination     *)

  EAsiError_kAsiSQLINVDESC                  = TEAsiError($3300);              // ,kAsiSQLINVDESC       =  0x3300  (* invalid SQL descriptor name  *)

  EAsiError_kAsiSQLINVCURNAME               = TEAsiError($3400);              // ,kAsiSQLINVCURNAME    =  0x3400  (* invalid cursor name  *)

  EAsiError_kAsiSQLINVCONDNUM               = TEAsiError($3500);              // ,kAsiSQLINVCONDNUM    =  0x3500  (* invalid condition number  *)

  EAsiError_kAsiSQLDYNSYNACS                = TEAsiError($3700);              // ,kAsiSQLDYNSYNACS     =  0x3700  (* syntax error or access rule violation in dynamic SQL statement  *)
  // (* ASI syntax errors *)
  EAsiError_kAsiErSynWrStr                  = TEAsiError($3701);              // ,kAsiErSynWrStr                  (* Wrong string format *)
  EAsiError_kAsiErSynLongStr                = TEAsiError($3702);              // ,kAsiErSynLongStr                (* String is too long (character, binary) *)
  EAsiError_kAsiErSynMisQuot                = TEAsiError($3703);              // ,kAsiErSynMisQuot                (* Missing right quotas  *)
  EAsiError_kAsiErSynHexDigit               = TEAsiError($3704);              // ,kAsiErSynHexDigit               (* Wrong Hexadecimal digit *)
  EAsiError_kAsiErSynBinDigit               = TEAsiError($3705);              // ,kAsiErSynBinDigit               (* Wrong Binary digit *)
  EAsiError_kAsiErSynInterval               = TEAsiError($3706);              // ,kAsiErSynInterval               (* Wrong interval string *)
  EAsiError_kAsiErSynTypeMatch              = TEAsiError($3707);              // ,kAsiErSynTypeMatch              (* Data types mismatch  *)
  EAsiError_kAsiErSynCollate                = TEAsiError($3708);              // ,kAsiErSynCollate                (* Invalid collate clause *)
  EAsiError_kAsiErSynWrTimeZone             = TEAsiError($3709);              // ,kAsiErSynWrTimeZone             (* Misleading time zone specification  *)
  EAsiError_kAsiErSynMisZone                = TEAsiError($3710);              // ,kAsiErSynMisZone                (* Missing ZONE keyword   *)
  EAsiError_kAsiErSynNotTimeZone            = TEAsiError($3711);              // ,kAsiErSynNotTimeZone            (* Not a time zone interval *)
  EAsiError_kAsiErSynUnbalPar               = TEAsiError($3712);              // ,kAsiErSynUnbalPar               (* Unbalance parenthesis *)
  EAsiError_kAsiErSynExprEx                 = TEAsiError($3713);              // ,kAsiErSynExprEx                 (* Expression expected *)
  EAsiError_kAsiErSynMisCol                 = TEAsiError($3714);              // ,kAsiErSynMisCol                 (* Missing column specification  *)
  EAsiError_kAsiErSynWrColSpec              = TEAsiError($3715);              // ,kAsiErSynWrColSpec              (* Wrong column specification  *)
  EAsiError_kAsiErSynNoLeftPar              = TEAsiError($3716);              // ,kAsiErSynNoLeftPar              (* Left parenthesis expected  *)
  EAsiError_kAsiErSynMlStar                 = TEAsiError($3717);              // ,kAsiErSynMlStar                 (* Misleading star symbol *)
  EAsiError_kAsiErSynMisIn                  = TEAsiError($3718);              // ,kAsiErSynMisIn                  (* Expected IN keyword *)
  EAsiError_kAsiErSynWrDTField              = TEAsiError($3719);              // ,kAsiErSynWrDTField              (* Wrong datetime field for extraction *)
  EAsiError_kAsiErSynMisFrom                = TEAsiError($3720);              // ,kAsiErSynMisFrom                (* Expected FROM keyword *)
  EAsiError_kAsiErSynMisUsing               = TEAsiError($3721);              // ,kAsiErSynMisUsing               (* Expected USING keyword *)
  EAsiError_kAsiErSynFOUorTR                = TEAsiError($3722);              // ,kAsiErSynFOUorTR                (* Form-of-use or translation name expected *)
  EAsiError_kAsiErSynMisTimePrec            = TEAsiError($3723);              // ,kAsiErSynMisTimePrec            (* Missing time precision *)
  EAsiError_kAsiErSynWrCollName             = TEAsiError($3724);              // ,kAsiErSynWrCollName             (* Wrong collation name *)
  EAsiError_kAsiErSynWrSetSq                = TEAsiError($3725);              // ,kAsiErSynWrSetSq                (* Set function or subquery can't be set function argument *)
  EAsiError_kAsiErSynNoComma                = TEAsiError($3726);              // ,kAsiErSynNoComma                (* Missing comma *)
  EAsiError_kAsiErSynNoWhen                 = TEAsiError($3727);              // ,kAsiErSynNoWhen                 (* Missing when clause *)
  EAsiError_kAsiErSynMisThen                = TEAsiError($3728);              // ,kAsiErSynMisThen                (* Missing then clause *)
  EAsiError_kAsiErSynMisEnd                 = TEAsiError($3729);              // ,kAsiErSynMisEnd                 (* Missing END  *)
  EAsiError_kAsiErSynWrNot                  = TEAsiError($3730);              // ,kAsiErSynWrNot                  (* Wrong usage of NOT  *)
  EAsiError_kAsiErSynNull                   = TEAsiError($3731);              // ,kAsiErSynNull                   (* NULL expected  *)
  EAsiError_kAsiErSynCompare                = TEAsiError($3732);              // ,kAsiErSynCompare                (* Compare operator expected  *)
  EAsiError_kAsiErSynWrComma                = TEAsiError($3733);              // ,kAsiErSynWrComma                (* Wrong comma position *)
  EAsiError_kAsiErSynMask                   = TEAsiError($3734);              // ,kAsiErSynMask                   (* Mask should be of character type *)
  EAsiError_kAsiErSynEsc                    = TEAsiError($3735);              // ,kAsiErSynEsc                    (* Escape character expected  *)
  EAsiError_kAsiErSynMisSq                  = TEAsiError($3736);              // ,kAsiErSynMisSq                  (* Subquery expected *)
  EAsiError_kAsiErSynAndBet                 = TEAsiError($3737);              // ,kAsiErSynAndBet                 (* AND was missed in BETWEEN predicate  *)
  EAsiError_kAsiErSynNotJoin                = TEAsiError($3738);              // ,kAsiErSynNotJoin                (* Not a joined table *)
  EAsiError_kAsiErSynMisJoin                = TEAsiError($3739);              // ,kAsiErSynMisJoin                (* Missing JOIN keyword *)
  EAsiError_kAsiErSynWrNatural              = TEAsiError($3740);              // ,kAsiErSynWrNatural              (* Union join can't be natural union  *)
  EAsiError_kAsiErSynMisJoinSpec            = TEAsiError($3741);              // ,kAsiErSynMisJoinSpec            (* Misleading join specification *)
  EAsiError_kAsiErSynMisCorName             = TEAsiError($3742);              // ,kAsiErSynMisCorName             (* Missing correlation name  *)
  EAsiError_kAsiErSynWrTabSpec              = TEAsiError($3743);              // ,kAsiErSynWrTabSpec              (* Wrong table specification  *)
  EAsiError_kAsiErSynEmptyList              = TEAsiError($3744);              // ,kAsiErSynEmptyList              (* List of columns is empty  *)
  EAsiError_kAsiErSynNoJoinSpec             = TEAsiError($3745);              // ,kAsiErSynNoJoinSpec             (* Missing join specification *)
  EAsiError_kAsiErSynMisName                = TEAsiError($3746);              // ,kAsiErSynMisName                (* Missing database object name  *)
  EAsiError_kAsiErSynMisQueryPrimary        = TEAsiError($3747);              // ,kAsiErSynMisQueryPrimary        (* Missing query primary *)
  EAsiError_kAsiErSynEEEEEEEEEEEEEEE        = TEAsiError($3748);              // ,kAsiErSynEEEEEEEEEEEEEEE        (* Not Used              *)
  EAsiError_kAsiErSynNotJoinedTable         = TEAsiError($3749);              // ,kAsiErSynNotJoinedTable         (* Not a joined table *)
  EAsiError_kAsiErSynMisTabValConstr        = TEAsiError($3750);              // ,kAsiErSynMisTabValConstr        (* Missing table value constructor *)
  EAsiError_kAsiErSynMisSelect              = TEAsiError($3751);              // ,kAsiErSynMisSelect              (* Missing SELECT keyword *)
  EAsiError_kAsiErSynMisColName             = TEAsiError($3752);              // ,kAsiErSynMisColName             (* Missing column name *)
  EAsiError_kAsiErSynMisGroup               = TEAsiError($3753);              // ,kAsiErSynMisGroup               (* Selection list contains set functions and columns  *)
  // (* references but GROUP BY clause was missed  *)
  EAsiError_kAsiErSynNotScalar              = TEAsiError($3754);              // ,kAsiErSynNotScalar              (* Scalar expression expected *)
  EAsiError_kAsiErSynElementInParen         = TEAsiError($3755);              // ,kAsiErSynElementInParen         (* Element can't be in parenthesis *)
  EAsiError_kAsiErSynOvrlDegree             = TEAsiError($3756);              // ,kAsiErSynOvrlDegree             (* Wrong overlaps operand degree  *)
  EAsiError_kAsiErSynDegreeViolation        = TEAsiError($3757);              // ,kAsiErSynDegreeViolation        (* Degree violation *)
  EAsiError_kAsiErSynMisAs                  = TEAsiError($3758);              // ,kAsiErSynMisAs                  (* Missing keyword AS  *)
  EAsiError_kAsiErSynWrongCast              = TEAsiError($3759);              // ,kAsiErSynWrongCast              (* Wrong cast *)
  EAsiError_kAsiErSynInvalidDomain          = TEAsiError($3760);              // ,kAsiErSynInvalidDomain          (* Invalid domain name *)
  EAsiError_kAsiErSynCharExpected           = TEAsiError($3761);              // ,kAsiErSynCharExpected           (* CHAR expected *)
  EAsiError_kAsiErSynTypeExpected           = TEAsiError($3762);              // ,kAsiErSynTypeExpected           (* Data type specification expected  *)
  EAsiError_kAsiErSynWrongPrecLength        = TEAsiError($3763);              // ,kAsiErSynWrongPrecLength        (* Wrong precision or length *)
  EAsiError_kAsiErSynScaleExpected          = TEAsiError($3764);              // ,kAsiErSynScaleExpected          (* Scale expected *)
  EAsiError_kAsiErSynWrongScale             = TEAsiError($3765);              // ,kAsiErSynWrongScale             (* Wrong scale *)
  EAsiError_kAsiErSynWithTimeZoneExpected   = TEAsiError($3766);              // ,kAsiErSynWithTimeZoneExpected   (* Wrong WITH TIME ZONE sentence *)
  EAsiError_kAsiErSynNoVarLength            = TEAsiError($3767);              // ,kAsiErSynNoVarLength            (* Missing varying length *)
  EAsiError_kAsiErSynOrderByExpected        = TEAsiError($3768);              // ,kAsiErSynOrderByExpected        (* ORDER BY expected *)
  EAsiError_kAsiErSynReadOnlyExpected       = TEAsiError($3769);              // ,kAsiErSynReadOnlyExpected       (* READ ONLY expected *)
  EAsiError_kAsiErSynWrongSortKey           = TEAsiError($3770);              // ,kAsiErSynWrongSortKey           (* Wrong sort key *)
  EAsiError_kAsiErSynEmptySortList          = TEAsiError($3771);              // ,kAsiErSynEmptySortList          (* Empty sort list *)
  EAsiError_kAsiErSynWrongToken             = TEAsiError($3772);              // ,kAsiErSynWrongToken             (* Wrong token was met  *)
  EAsiError_kAsiErSynWrTabName              = TEAsiError($3773);              // ,kAsiErSynWrTabName              (* Wrong table name *)
  EAsiError_kAsiErSynMisOf                  = TEAsiError($3774);              // ,kAsiErSynMisOf                  (* Missing keyword OF  *)
  EAsiError_kAsiErSynMisCursorName          = TEAsiError($3775);              // ,kAsiErSynMisCursorName          (* Missing cursor name *)
  EAsiError_kAsiErSynMisSet                 = TEAsiError($3776);              // ,kAsiErSynMisSet                 (* Missing keyword SET *)
  EAsiError_kAsiErSynMisBecome              = TEAsiError($3777);              // ,kAsiErSynMisBecome              (* = expected in UPDATE set clause *)
  EAsiError_kAsiErSynMisInto                = TEAsiError($3778);              // ,kAsiErSynMisInto                (* Missing INTO keyword  *)
  EAsiError_kAsiErSynMisValues              = TEAsiError($3779);              // ,kAsiErSynMisValues              (* Missing VALUES keyword  *)
  EAsiError_kAsiErSynMisTarget              = TEAsiError($3780);              // ,kAsiErSynMisTarget              (* Missing target specification *)
  EAsiError_kAsiErSynDubTransMode           = TEAsiError($3781);              // ,kAsiErSynDubTransMode           (* Diplicate definition of transaction mode *)
  EAsiError_kAsiErSynMisSize                = TEAsiError($3782);              // ,kAsiErSynMisSize                (* Missing SIZE keyword *)
  EAsiError_kAsiErSynWrDiagSize             = TEAsiError($3783);              // ,kAsiErSynWrDiagSize             (* Wrong diagnostics area size *)
  EAsiError_kAsiErSynMisTransMode           = TEAsiError($3784);              // ,kAsiErSynMisTransMode           (* Transaction modes are not specified *)
  EAsiError_kAsiErSynInCompLevelMode        = TEAsiError($3785);              // ,kAsiErSynInCompLevelMode        (* Incompatible transaction access mode and isolation level *)
  EAsiError_kAsiErSynWrConstrChkMode        = TEAsiError($3786);              // ,kAsiErSynWrConstrChkMode        (* Wrong constraint checking mode *)
  EAsiError_kAsiErSynWrConstrName           = TEAsiError($3787);              // ,kAsiErSynWrConstrName           (* Wrong constraint name *)
  EAsiError_kAsiErSynMisRead                = TEAsiError($3788);              // ,kAsiErSynMisRead                (* Missing READ keyword  *)
  EAsiError_kAsiErSynMisAuthorization       = TEAsiError($3789);              // ,kAsiErSynMisAuthorization       (* Missing AUTHORIZATION keyword *)
  EAsiError_kAsiErSynMisTemporary           = TEAsiError($3790);              // ,kAsiErSynMisTemporary           (* Missing TEMPORARY keyword *)
  EAsiError_kAsiErSynMisTable               = TEAsiError($3791);              // ,kAsiErSynMisTable               (* Missing TABLE keyword *)
  EAsiError_kAsiErSynOnCommit               = TEAsiError($3792);              // ,kAsiErSynOnCommit               (* Shall be ON COMMIT *)
  EAsiError_kAsiErSynNotTemporary           = TEAsiError($3793);              // ,kAsiErSynNotTemporary           (* Commit behaviour only for temporary table *)
  EAsiError_kAsiErSynWrComBehaviour         = TEAsiError($3794);              // ,kAsiErSynWrComBehaviour         (* Wrong commit behaviour *)
  EAsiError_kAsiErSynMisRows                = TEAsiError($3795);              // ,kAsiErSynMisRows                (* Missing ROWS keyword *)
  EAsiError_kAsiErSynMisTableName           = TEAsiError($3796);              // ,kAsiErSynMisTableName           (* Missing table name *)
  EAsiError_kAsiErSynWrCheckTime            = TEAsiError($3797);              // ,kAsiErSynWrCheckTime            (* Wrong constraint time specification *)
  EAsiError_kAsiErSynMisDeferrable          = TEAsiError($3798);              // ,kAsiErSynMisDeferrable          (* Keyword DEFERRABLE expected *)
  EAsiError_kAsiErSynWrNotDefer             = TEAsiError($3799);              // ,kAsiErSynWrNotDefer             (* Initialy deferred constraint can't be not deferrable *)
  EAsiError_kAsiErSynNotNull                = TEAsiError($3800);              // ,kAsiErSynNotNull                (* Not Null shall be specified for constraint *)
  EAsiError_kAsiErSynPrimaryKey             = TEAsiError($3801);              // ,kAsiErSynPrimaryKey             (* Primary key shall be specified for constraint *)
  EAsiError_kAsiErSynMisConstr              = TEAsiError($3802);              // ,kAsiErSynMisConstr              (* Missing constraint specification *)
  EAsiError_kAsiErSynMisRefSpec             = TEAsiError($3803);              // ,kAsiErSynMisRefSpec             (* Missing references specification *)
  EAsiError_kAsiErSynMisRefTable            = TEAsiError($3804);              // ,kAsiErSynMisRefTable            (* Referenced table and columns expected *)
  EAsiError_kAsiErSynWrMatchType            = TEAsiError($3805);              // ,kAsiErSynWrMatchType            (* Wrong match type of constraint  *)
  EAsiError_kAsiErSynSetAction              = TEAsiError($3806);              // ,kAsiErSynSetAction              (* Set triggered action expected *)
  EAsiError_kAsiErSynDuplAction             = TEAsiError($3807);              // ,kAsiErSynDuplAction             (* Duplicated triggered action specification *)
  EAsiError_kAsiErSynMisTrigRule            = TEAsiError($3808);              // ,kAsiErSynMisTrigRule            (* Missing triggered rule    *)
  EAsiError_kAsiErSynForeignKey             = TEAsiError($3809);              // ,kAsiErSynForeignKey             (* Foreign key shall be specified for constraint *)
  EAsiError_kAsiErSynNoColDef               = TEAsiError($3810);              // ,kAsiErSynNoColDef               (* No column definitions *)
  EAsiError_kAsiErSynMisAlterAction         = TEAsiError($3811);              // ,kAsiErSynMisAlterAction         (* Missing alter action *)
  EAsiError_kAsiErSynDropDefault            = TEAsiError($3812);              // ,kAsiErSynDropDefault            (* Drop default action expected *)
  EAsiError_kAsiErSynSetDefault             = TEAsiError($3813);              // ,kAsiErSynSetDefault             (* Set default action expected *)
  EAsiError_kAsiErSynMisDropBehaviour       = TEAsiError($3814);              // ,kAsiErSynMisDropBehaviour       (* Missing drop behaviour *)
  EAsiError_kAsiErSynNotCheckConstr         = TEAsiError($3815);              // ,kAsiErSynNotCheckConstr         (* Domain constraint shall be check constraint *)
  EAsiError_kAsiErSynMisCheckOption         = TEAsiError($3816);              // ,kAsiErSynMisCheckOption         (* CHECK OPTION expected *)
  EAsiError_kAsiErSynMisCharSet             = TEAsiError($3817);              // ,kAsiErSynMisCharSet             (* CHARACTER SET expected *)
  EAsiError_kAsiErSynMisCharSetSource       = TEAsiError($3818);              // ,kAsiErSynMisCharSetSource       (* Character set source expected *)
  EAsiError_kAsiErSynCharSetExp             = TEAsiError($3819);              // ,kAsiErSynCharSetExp             (* Character set expected *)
  EAsiError_kAsiErSynPadAttr                = TEAsiError($3820);              // ,kAsiErSynPadAttr                (* Pad attribute expected *)
  EAsiError_kAsiErSynMisTransName           = TEAsiError($3821);              // ,kAsiErSynMisTransName           (* Missing translation name *)
  EAsiError_kAsiErSynCollationExp           = TEAsiError($3822);              // ,kAsiErSynCollationExp           (* Collation expected *)
  EAsiError_kAsiErSynMisExternColl          = TEAsiError($3823);              // ,kAsiErSynMisExternColl          (* Missing external collation *)
  EAsiError_kAsiErSynMisTo                  = TEAsiError($3824);              // ,kAsiErSynMisTo                  (* Missing TO keyword  *)
  EAsiError_kAsiErSynMisOn                  = TEAsiError($3825);              // ,kAsiErSynMisOn                  (* Missing ON keyword  *)
  EAsiError_kAsiErSynMisGrantOption         = TEAsiError($3826);              // ,kAsiErSynMisGrantOption         (* GRANT OPTION expected *)
  EAsiError_kAsiErSynMisFor                 = TEAsiError($3827);              // ,kAsiErSynMisFor                 (* Missing FOR keyword  *)
  EAsiError_kAsiErSynMisObjectName          = TEAsiError($3828);              // ,kAsiErSynMisObjectName          (* Missing object name *)
  EAsiError_kAsiErSynMisGrantee             = TEAsiError($3829);              // ,kAsiErSynMisGrantee             (* Missing grantee *)
  EAsiError_kAsiErSynAllPrivileges          = TEAsiError($3830);              // ,kAsiErSynAllPrivileges          (* ALL PRIVILEGES expected *)
  EAsiError_kAsiErSynMisIndex               = TEAsiError($3831);              // ,kAsiErSynMisIndex               (* INDEX keyword expected *)
  EAsiError_kAsiErSynAuthorExpected         = TEAsiError($3832);              // ,kAsiErSynAuthorExpected         (* Authorization identifier expected *)
  EAsiError_kAsiSynErDublColumnName         = TEAsiError($3833);              // ,kAsiSynErDublColumnName         (* Duplicate column name *)
  EAsiError_kAsiSynErAmbTabRef              = TEAsiError($3834);              // ,kAsiSynErAmbTabRef              (* Ambigious table reference *)
  EAsiError_kAsiSynErTableNotFound          = TEAsiError($3835);              // ,kAsiSynErTableNotFound          (* Table name is not found (+ table name) *)
  EAsiError_kAsiSynErColumnNotFound         = TEAsiError($3836);              // ,kAsiSynErColumnNotFound         (* Column name is not found (+ column name) *)
  EAsiError_kAsiSynErAmbColRef              = TEAsiError($3837);              // ,kAsiSynErAmbColRef              (* Ambigious column reference (+ column name) *)
  EAsiError_kAsiSynErWrongParameterUsage    = TEAsiError($3838);              // ,kAsiSynErWrongParameterUsage    (* Parameter was specified in wrong place *)
  EAsiError_kAsiSynErLocalCol               = TEAsiError($3839);              // ,kAsiSynErLocalCol               (* Column shall be local reference *)
  EAsiError_kAsiSynErOuterCol               = TEAsiError($3840);              // ,kAsiSynErOuterCol               (* Column shall be outer reference *)
  EAsiError_kAsiSynErDuplDistinct           = TEAsiError($3841);              // ,kAsiSynErDuplDistinct           (* Duplicate distinct in query specification *)
  EAsiError_kAsiSynErArgNotColumn           = TEAsiError($3842);              // ,kAsiSynErArgNotColumn           (* Distinct argument shall be column reference *)
  EAsiError_kAsiSynErNoCorrColumns          = TEAsiError($3843);              // ,kAsiSynErNoCorrColumns          (* Corresponding column were not found *)
  EAsiError_kAsiSynErWrongCorrColumn        = TEAsiError($3844);              // ,kAsiSynErWrongCorrColumn        (* Wrong corresponding column name *)
  EAsiError_kAsiSynErMustBeGroupCol         = TEAsiError($3845);              // ,kAsiSynErMustBeGroupCol         (* Column reference must be a group column *)
  EAsiError_kAsiErSynMisLeadSetFunc         = TEAsiError($3846);              // ,kAsiErSynMisLeadSetFunc         (* Misleading set function usage *)
  EAsiError_kAsiErSynWrongEscLength         = TEAsiError($3847);              // ,kAsiErSynWrongEscLength         (* Escape character must be 1 symbol length *)
  EAsiError_kAsiErSynSimpleValue            = TEAsiError($3848);              // ,kAsiErSynSimpleValue            (* Should be simple value *)
  EAsiError_kAsiErSynInvOrderSpec           = TEAsiError($3849);              // ,kAsiErSynInvOrderSpec           (* Invalid order specification *)
  EAsiError_kAsiErSynMustBeOnlyCol          = TEAsiError($3850);              // ,kAsiErSynMustBeOnlyCol          (* Column shall be the single outer reference *)
  EAsiError_kAsiErSynCursorNotFound         = TEAsiError($3851);              // ,kAsiErSynCursorNotFound         (* Cursor name not found *)
  EAsiError_kAsiErSynUpdateColDupl          = TEAsiError($3852);              // ,kAsiErSynUpdateColDupl          (* Column name duplicates in the set clause *)
  EAsiError_kAsiErSynDefaultUse             = TEAsiError($3853);              // ,kAsiErSynDefaultUse             (* DEFAULT shall be specified in INSERT  *)
  EAsiError_kAsiErSynWrColInsert            = TEAsiError($3854);              // ,kAsiErSynWrColInsert            (* Wrong column name in insert list *)
  EAsiError_kAsiErSynNotCastable            = TEAsiError($3855);              // ,kAsiErSynNotCastable            (* Expression can't be casted to the specified type *)
  EAsiError_kAsiErSynMisDefValue            = TEAsiError($3856);              // ,kAsiErSynMisDefValue            (* Missing default value *)
  EAsiError_kAsiErSynMisServerName          = TEAsiError($3857);              // ,kAsiErSynMisServerName          (* Missing server name *)
  EAsiError_kAsiErSynMisCorNameForRemote    = TEAsiError($3858);              // ,kAsiErSynMisCorNameForRemote    (* Missing correlation name for remote table *)
  EAsiError_kAsiErSynWrongForUpdateColSpec  = TEAsiError($3859);              // ,kAsiErSynWrongForUpdateColSpec  (* Wrong column name in FOR UPDATE specification *)
  EAsiError_kAsiErSynNotUpdateCol           = TEAsiError($3860);              // ,kAsiErSynNotUpdateCol           (* Not updatable column *)
  EAsiError_kAsiErSynTransMode              = TEAsiError($3861);              // ,kAsiErSynTransMode              (* Invalid transaction mode specification *)
  EAsiError_kAsiErSynMisLevel               = TEAsiError($3862);              // ,kAsiErSynMisLevel               (* Missing LEVEL keyword *)
  EAsiError_kAsiErSynUncommComm             = TEAsiError($3863);              // ,kAsiErSynUncommComm             (* Uncommitted/committed expected *)
  EAsiError_kAsiErSynDubIsoLevel            = TEAsiError($3864);              // ,kAsiErSynDubIsoLevel            (* Duplicated specification of isolation level *)
  EAsiError_kAsiErSynDubDiagSize            = TEAsiError($3865);              // ,kAsiErSynDubDiagSize            (* Duplicate  kAsiErSynOvrlDegree: TEAsiError       ($3755;d diagnostics size specification *)
  EAsiError_kAsiErSynMisIsoLevel            = TEAsiError($3866);              // ,kAsiErSynMisIsoLevel            (* missing isolation level specification *)
  EAsiError_kAsiErSynCharSetUsage           = TEAsiError($3867);              // ,kAsiErSynCharSetUsage           (* character set usage *)
  EAsiError_kAsiErSynCollatingSeq           = TEAsiError($3868);              // ,kAsiErSynCollatingSeq           (* collating sequence invalid syntax *)
  EAsiError_kAsiErSynNotCharCollate         = TEAsiError($3869);              // ,kAsiErSynNotCharCollate         (* collation can be specified only for character data *)
  EAsiError_kAsiErSynColCharSetMisMatch     = TEAsiError($3870);              // ,kAsiErSynColCharSetMisMatch     (* character set doesn't has specified collation *)
  EAsiError_kAsiErSynDuplJoinCol            = TEAsiError($3871);              // ,kAsiErSynDuplJoinCol            (* Duplicate column name in natural or named column join *)
  EAsiError_kAsiSynErCorrJoinColNotFound    = TEAsiError($3872);              // ,kAsiSynErCorrJoinColNotFound    (* common join columns not found *)
  EAsiError_kAsiSynErFunctionNotExists      = TEAsiError($3873);              // ,kAsiSynErFunctionNotExists      (* function doesn't exist *)
  EAsiError_kAsiSynErNoMatchFunction        = TEAsiError($3874);              // ,kAsiSynErNoMatchFunction        (* no implemetation-defined function match argument list *)
  EAsiError_kAsiSynErWrongBoolFuncUsage     = TEAsiError($3875);              // ,kAsiSynErWrongBoolFuncUsage     (* wrong boolean function usage *)
  EAsiError_kAsiSynErWrongValueFuncUsage    = TEAsiError($3876);              // ,kAsiSynErWrongValueFuncUsage    (* wrong value function usage *)

  EAsiError_kAsiSQLAMBCURSOR                = TEAsiError($3C00);              // ,kAsiSQLAMBCURSOR     =  0x3C00  (* ambiguous cursor name  *)

  EAsiError_kAsiSQLINVCATNAME               = TEAsiError($3D00);              // ,kAsiSQLINVCATNAME    =  0x3D00  (* invalid catalog name     *)

  EAsiError_kAsiSQLINVSCHNAME               = TEAsiError($3F00);              // ,kAsiSQLINVSCHNAME    =  0x3F00  (* invalid schema name      *)

  EAsiError_kAsiSQLTR                       = TEAsiError($4000);              // ,kAsiSQLTR            =  0x4000  (* transaction rollback  *)
  EAsiError_kAsiSQLTRINTEGRITY              = TEAsiError($4001);              // ,kAsiSQLTRINTEGRITY              (* integrity constrint violation      *)
  EAsiError_kAsiSQLTRSER                    = TEAsiError($4002);              // ,kAsiSQLTRSER                    (* serialization failure   *)
  EAsiError_kAsiSQLTRSTMCOMP                = TEAsiError($4003);              // ,kAsiSQLTRSTMCOMP                (* statement completition unknown  *)

  EAsiError_kAsiSQLSYNACS                   = TEAsiError($4200);              // ,kAsiSQLSYNACS        =  0x4200  (* access rule violation (permission denied) *)

  EAsiError_kAsiSQLCHECKOPT                 = TEAsiError($4400);              // ,kAsiSQLCHECKOPT      =  0x4400  (* with check option violation  *)

  EAsiError_kAsiSQLRDA                      = TEAsiError($8000);              // ,kAsiSQLRDA           =  0x8000  (* Remote Database Access   *)


  // (* Generic ASI excpetions *)
  // (*                     *)
  EAsiError_kAsiEXCP                        = TEAsiError($A000);                // ,kAsiEXCP             =  0xA000  (* ASI Exception  *)
  EAsiError_kAsiEXCPINIT                    = TEAsiError($A001);              // ,kAsiEXCPINIT                    (* unable to initialize ASI  *)
  EAsiError_kAsiEXCPTERM                    = TEAsiError($A002);              // ,kAsiEXCPTERM                    (* error during ASI termination  *)
  EAsiError_kAsiEXCPDUPLINIT                = TEAsiError($A003);              // ,kAsiEXCPDUPLINIT                (* ASI was already initialized *)
  EAsiError_kAsiEXCPNOTINIT                 = TEAsiError($A004);              // ,kAsiEXCPNOTINIT                 (* ASI was not initialized *)
  EAsiError_kAsiEXCPBADINI                  = TEAsiError($A005);              // ,kAsiEXCPBADINI                  (* initialization file has errors or is corrupted *)
  EAsiError_kAsiEXCPWRONGENV                = TEAsiError($A006);              // ,kAsiEXCPWRONGENV                (* environment is not defined in AST configuration *)
  EAsiError_kAsiEXCPWRENVPAR                = TEAsiError($A007);              // ,kAsiEXCPWRENVPAR                (* invalid environment parameter in AST configuration *)
  EAsiError_kAsiNoMemory                    = TEAsiError($A008);              // ,kAsiNoMemory                    (* insufficient memory             *)
  EAsiError_kAsiErStkOvrFlw                 = TEAsiError($A009);              // ,kAsiErStkOvrFlw                 (* Stack overflow  *)
  EAsiError_kAsiErStkUnrFlw                 = TEAsiError($A010);              // ,kAsiErStkUnrFlw                 (* Stack underflow *)
  EAsiError_kAsiInvalidParam                = TEAsiError($A011);              // ,kAsiInvalidParam                (* Invalid parameter *)
  EAsiError_kAsiInternalError               = TEAsiError($A012);              // ,kAsiInternalError               (* Iternal error  *)
  EAsiError_kAsiFunctionNotSupported        = TEAsiError($A013);              // ,kAsiFunctionNotSupported        (* Function overflow *)
  EAsiError_kAsiTryTableOverflow            = TEAsiError($A014);              // ,kAsiTryTableOverflow
  EAsiError_kAsiOperationNotSupported       = TEAsiError($A015);              // ,kAsiOperationNotSupported
  EAsiError_kAsiCannotOpenTable             = TEAsiError($A016);              // ,kAsiCannotOpenTable
  EAsiError_kAsiOutOfRange                  = TEAsiError($A017);              // ,kAsiOutOfRange
  EAsiError_kAsiInvalidUcObject             = TEAsiError($A018);              // ,kAsiInvalidUcObject
  EAsiError_kAsiInvalidDDAObject            = TEAsiError($A019);              // ,kAsiInvalidDDAObject            (* Invalid DDA object *)
  EAsiError_kAsiErrEofFound                 = TEAsiError($A020);              // ,kAsiErrEofFound                 (* EOF found *)
  EAsiError_kAsiErrFileLocked               = TEAsiError($A021);              // ,kAsiErrFileLocked               (* File was locked during the timeout period *)
  EAsiError_kAsiRecLocked                   = TEAsiError($A022);              // ,kAsiRecLocked                   (* Record is locked *)
  EAsiError_kAsiTableLocked                 = TEAsiError($A023);              // ,kAsiTableLocked                 (* Table is locked *)
  EAsiError_kAsiNativePrepare               = TEAsiError($A024);              // ,kAsiNativePrepare               (* Native statement cannot be prepared *)
  EAsiError_kAsiNativeExecute               = TEAsiError($A025);              // ,kAsiNativeExecute               (* Native statement cannot be executed *)
  EAsiError_kAsiRemoteTabModification       = TEAsiError($A026);              // ,kAsiRemoteTabModification       (* Remote table has read only access *)
  EAsiError_kAsiInterDBExecution            = TEAsiError($A027);              // ,kAsiInterDBExecution            (* Can't execute interdatabase statement *)
  EAsiError_kAsiErrCodePageNotDefined       = TEAsiError($A028);              // ,kAsiErrCodePageNotDefined       (* Code page not supported *)
  EAsiError_kAsiErrCodePageFileNotFound     = TEAsiError($A029);              // ,kAsiErrCodePageFileNotFound     (* Code page not supported *)
  EAsiError_kAsiErrCodePageFormat           = TEAsiError($A030);              // ,kAsiErrCodePageFormat           (* Corrupted code page data *)
  EAsiError_kAsiErrCollationNotDefined      = TEAsiError($A031);              // ,kAsiErrCollationNotDefined      (* Collation not supported *)
  EAsiError_kAsiErrCollationFileNotFound    = TEAsiError($A032);              // ,kAsiErrCollationFileNotFound    (* Collation not supported *)
  EAsiError_kAsiErrCollationFormat          = TEAsiError($A033);              // ,kAsiErrCollationFormat          (* Corrupted collation data *)
  EAsiError_kAsiErrAsilocNotFound           = TEAsiError($A034);              // ,kAsiErrAsilocNotFound           (* Cannot find asiloc.xmx *)

  // (* Interprocess Communication Exceptions *)
  // (*                                   *)
  EAsiError_kAsiErrDrv                      = TEAsiError($B000);              // ,kAsiErrDrv          = 0xB000    (* IPC exceptions *)
  EAsiError_kAsiErrOpenDrv                  = TEAsiError($B001);              // ,kAsiErrOpenDrv                  (* OLEDB provider not registered *)
  EAsiError_kAsiErrPathNotFound             = TEAsiError($B002);              // ,kAsiErrPathNotFound             (* Path not found *)
  EAsiError_kAsiErrProvNotSpecified         = TEAsiError($B003);              // ,kAsiErrProvNotSpecified         (* OLEDB Provider not specified *)
  EAsiError_kAsiErrToManyFileOpen           = TEAsiError($B004);              // ,kAsiErrToManyFileOpen           (* Too many open files *)
  EAsiError_kAsiErrAccessDenied             = TEAsiError($B005);              // ,kAsiErrAccessDenied             (* Access denied *)
  EAsiError_kAsiErrFileHandle               = TEAsiError($B006);              // ,kAsiErrFileHandle               (* Invalid file handle *)
  EAsiError_kAsiErrSrvNotReg                = TEAsiError($B007);              // ,kAsiErrSrvNotReg        (* Services not registered *)
  EAsiError_kAsiErrCannotRegSrv             = TEAsiError($B008);              // ,kAsiErrCannotRegSrv       (* Unable to register services *)
  EAsiError_kAsiErrCannotFindSrv            = TEAsiError($B009);              // ,kAsiErrCannotFindSrv            (* csp.dll not found *)
  EAsiError_kAsiErrNoRegEntryPoint          = TEAsiError($B010);              // ,kAsiErrNoRegEntryPoint      (* Server doesn't have DllRegisterServer entry point *)
  EAsiError_kAsiErrCannotLoadSrvDll         = TEAsiError($B011);              // ,kAsiErrCannotLoadSrvDll         (* Cannot load services DLL *)
  EAsiError_kAsiErrOutPhysicalMemory        = TEAsiError($B012);              // ,kAsiErrOutPhysicalMemory        (* Out of physical memory *)
  EAsiError_kAsiErrOutSwapSpace             = TEAsiError($B013);              // ,kAsiErrOutSwapSpace             (* Out of swap space *)
  EAsiError_kAsiErrOLEDB20NotInstalled      = TEAsiError($B014);              // ,kAsiErrOLEDB20NotInstalled      (* OLEDB 2.0 not installed *)
  EAsiError_kAsiErrOLENotInit               = TEAsiError($B015);              // ,kAsiErrOLENotInit       (* Cannot initialize OLE or one of its components *)
  EAsiError_kAsiErrNoVirtualMemory          = TEAsiError($B016);              // ,kAsiErrNoVirtualMemory          (* Insufficient virtual memory space *)
  EAsiError_kAsiErrNoConvMemory             = TEAsiError($B017);              // ,kAsiErrNoConvMemory             (* Insufficient conventional memory space *)
  EAsiError_kAsiErrMDLNotFound              = TEAsiError($B018);              // ,kAsiErrMDLNotFound              (* MDL file not found *)
  EAsiError_kAsiErrOpenIni                  = TEAsiError($B019);              // ,kAsiErrOpenIni                  (* Cannot get AST configuration information *)
  EAsiError_kAsiErrNoEnv                    = TEAsiError($B020);              // ,kAsiErrNoEnv                    (* Environment name not specified *)
  EAsiError_kAsiErrIncompEnv                = TEAsiError($B021);              // ,kAsiErrIncompEnv                (* Incompatible environment *)
  EAsiError_kAsiErrNoPath                   = TEAsiError($B022);              // ,kAsiErrNoPath                   (* Driver path and name was not specified *)
  EAsiError_kAsiErrLostConnection           = TEAsiError($B023);              // ,kAsiErrLostConnection           (* Server died, connection lost *)
  EAsiError_kAsiErrToManyDrivers            = TEAsiError($B024);              // ,kAsiErrToManyDrivers            (* Too many driver loaded *)
  EAsiError_kAsiErrInvalidName              = TEAsiError($B025);              // ,kAsiErrInvalidName              (* Driver name is invalid *)
  EAsiError_kAsiErrNotAsiDrv                = TEAsiError($B026);              // ,kAsiErrNotAsiDrv                (* Program referenced in AST configuration
  // (* is not an ASI driver *)
  EAsiError_kAsiErrOsEnv                    = TEAsiError($B027);              // ,kAsiErrOsEnv                    (* Bad format for OS environment *)
  EAsiError_kAsiErrDrvInit                  = TEAsiError($B028);              // ,kAsiErrDrvInit                  (* Error found durring driver initialization *)
  EAsiError_kAsiErrDrvThunk                 = TEAsiError($B029);              // ,kAsiErrDrvThunk                 (* Trap in DBMS communication *)
  EAsiError_kAsiErrComBuf                   = TEAsiError($B030);              // ,kAsiErrComBuf                   (* Cannot create communication buffer *)
  EAsiError_kAsiErrBlockByTSR               = TEAsiError($B031);              // ,kAsiErrBlockByTSR               (* User has loaded TSR from AutoCAD shell command *)
  EAsiError_kAsiErrNoDrv                    = TEAsiError($B032);              // ,kAsiErrNoDrv                    (* Driver not found in AST configuration *)
  EAsiError_kAsiErrMemoryAccess             = TEAsiError($B033);              // ,kAsiErrMemoryAccess             (* Memory access violatation *)
  EAsiError_kAsiErrOS                       = TEAsiError($B034);              // ,kAsiErrOS                       (* OS error *)
  EAsiError_kAsiErrDrvOld                   = TEAsiError($B035);              // ,kAsiErrDrvOld                   (* Old driver's version *)

  EAsiError_kAsiErrDBMSServer               = TEAsiError($CF00);              // ,kAsiErrDBMSServer =  0xCF00     (* Exception raised by DBMS driver  *)
  EAsiError_kAsiErrHRESULT                  = TEAsiError($CF01);              // ,kAsiErrHRESULT                  (* Generate HRESULT description     *) } EAsiError;

  // typedef unsigned int AsiError;

  MinUserDefErrorCode                = $E000; // #define MinUserDefErrorCode         0xE000

type
  Tasi_year = record                    // typedef struct asi_year {
    sign: Longint;                            // long        sign;       /* kAsiTrue if negative */
    years: Cardinal;                          // ulong       years;      /* Years */
  end;                                        // } ASI_IYEAR;
  TASI_IYEAR = Tasi_year;

type
  Tasi_yeartomonth = record           // typedef struct asi_yeartomonth {
    sign: Longint;                            //   long        sign;       /* kAsiTrue if negative */
    years: Cardinal;                          //   ulong       years;      /* Years */
    months: Cardinal;                         //   ulong       months;     /* Months (0-11) */
  end;                                        // } ASI_IYEARTOMONTH;
  TASI_IYEARTOMONTH = Tasi_yeartomonth;

type
  Tasi_month = record                 // typedef struct asi_month {
    sign: Longint;                            //    long        sign;      /* kAsiTrue if negative */
    months: Cardinal;                         //    ulong      months;     /* Months */
  end;                                        // } ASI_IMONTH;
  TASI_IMONTH = Tasi_month;

type
  Tasi_day = record                   //  typedef struct asi_day  {
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    days: Cardinal;                           //    ulong       days;       /* Days */
  end;                                        //  } ASI_IDAY;
  TASI_IDAY = Tasi_day;

type
  Tasi_daytohour = record             // typedef struct asi_daytohour  {
    sign: Longint;                            //  long        sign;       /* kAsiTrue if negative */
    days: Cardinal;                           //  ulong       days;       /* Days */
    hours: Cardinal;                          //  ulong       hours;      /* Hours (0-23) */
  end;                                        // } ASI_IDAYTOHOUR;
  TASI_IDAYTOHOUR = Tasi_daytohour;

type
  Tasi_daytominute = record             // typedef struct asi_daytominute {
    sign: Longint;                            //  long        sign;       /* kAsiTrue if negative */
    days: Cardinal;                           //  ulong       days;       /* Days */
    hours: Cardinal;                          //  ulong       hours;      /* Hours (0-23) */
    minutes: Cardinal;                        //  ulong       minutes;    /* Minutes (0-59) */
  end;                                        // } ASI_IDAYTOMINUTE;
  TASI_IDAYTOMINUTE = Tasi_daytominute;

type
  Tasi_daytosecond = record             // typedef struct asi_daytosecond {
    seconds: Double;                          //    double      seconds;    /* Seconds (0-59.99..9) */
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    days: Cardinal;                           //    ulong       days;       /* Days */
    hours: Cardinal;                          //    ulong       hours;      /* Hours (0-23) */
    minutes: Cardinal;                        //    ulong       minutes;    /* Minutes (0-59) */
  end;                                        //  } ASI_IDAYTOSECOND;
  TASI_IDAYTOSECOND = Tasi_daytosecond;

type
  Tasi_hour = record                    //  typedef struct asi_hour {
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    hours: Cardinal                           //    ulong       hours;      /* Hours */
  end;                                        //  } ASI_IHOUR;
  TASI_IHOUR = Tasi_hour;

type
  Tasi_hourtominute = record            //  typedef struct asi_hourtominute {
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    hours: Cardinal;                          //    ulong       hours;      /* Hours */
    minutes: Cardinal;                        //    ulong       minutes;    /* Minutes (0-59)  */
  end;                                        //  } ASI_IHOURTOMINUTE;
  TASI_IHOURTOMINUTE = Tasi_hourtominute;

type
  Tasi_hourtosecond = record            //  typedef struct asi_hourtosecond {
    seconds: Double;                          //    double      seconds;    /* Seconds (0-59.99..9) */
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    hours: Cardinal;                          //    ulong       hours;      /* Hours */
    minutes: Cardinal;                        //    ulong       minutes;    /* Minutes (0-59) */
  end;                                        //  } ASI_IHOURTOSECOND;
  TASI_IHOURTOSECOND = Tasi_hourtosecond;

type
  Tasi_minute = record                  //  typedef struct asi_minute {
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    minutes: Cardinal;                        //    ulong       minutes;    /* Minutes */
  end;                                        // } ASI_IMINUTE;
  TASI_IMINUTE = Tasi_minute;

type
  Tasi_minuteitosecond = record       //  typedef struct asi_minuteitosecond {
    seconds: Double;                          //    double      seconds;    /* Seconds (0-59.99..9) */
    sign: Longint;                            //    long        sign;       /* kAsiTrue if negative */
    minutes: Cardinal;                        //    ulong       minutes;    /* Minutes */
  end;                                        //  } ASI_IMINUTETOSECOND;
  TASI_IMINUTETOSECOND = Tasi_minuteitosecond;

type
  Tasi_second = record                  //  typedef struct asi_second {
    seconds: Double;                          //    double      seconds;    /* Seconds */
    sign: Longint;                            //    long        sign;       /* kAsiTrueF if negative */
  end;                                        //  } ASI_ISECOND;
  TASI_ISECOND = Tasi_second;

//* Datetime data */
type
  Tasi_date = record                    //  typedef struct asi_date {  /* Date */
    year: Word;                               //    ushort year;             /* Year */
    month: Word;                              //    ushort month;            /* Month (0-11) */
    day: Word;                                //    ushort day;              /* Day (0-31) */
    pad: Smallint;                            //    short  pad;              /* pad short */
  end;                                        //  } ASI_DTDATE;
  TASI_DTDATE = Tasi_date;

type
  Tasi_time = record                    //  typedef struct asi_time {       /* Time with time zone */
    second: double;                           //    double            second;   /* Second (0-59.99..9) */
    timezone: TASI_IHOURTOMINUTE;             //    ASI_IHOURTOMINUTE timezone; /* time zone */
    hour: Word;                               //    ushort            hour;     /* Hour (0-23) */
    minute: Word;                             //    ushort            minute;   /* Minute (0-59) */
  end;                                        // } ASI_DTTIME;
  TASI_DTTIME  = Tasi_time;

type
  Tasi_timestamp = record             //  typedef struct asi_timestamp {  /* Timestamp with time zone */
    time: TASI_DTTIME;                        //    ASI_DTTIME   time;          /* Time */
    date: TASI_DTDATE;                        //    ASI_DTDATE   date;          /* Date */
  end;                                        //  } ASI_DTTIMESTAMP;
  TASI_DTTIMESTAMP = Tasi_timestamp;

// ***************************************************************************** GeneralLib/CATEGORY
const
  PROPCAT_Nil             = -1;   // #define PROPCAT_Nil -1
  PROPCAT_Misc            = -2;   // #define PROPCAT_Misc -2
  PROPCAT_Font            = -3;   // #define PROPCAT_Font -3
  PROPCAT_Position        = -4;   // #define PROPCAT_Position -4
  PROPCAT_Appearance      = -5;   // #define PROPCAT_Appearance -5
  PROPCAT_Behavior        = -6;   // #define PROPCAT_Behavior -6
  PROPCAT_Data            = -7;   // #define PROPCAT_Data -7
  PROPCAT_List            = -8;   // #define PROPCAT_List -8
  PROPCAT_Text            = -9;   // #define PROPCAT_Text -9
  PROPCAT_Scale           = -10;  // #define PROPCAT_Scale -10
  PROPCAT_DDE             = -11;  // #define PROPCAT_DDE -11
  PROPCAT_General         = -12;  // #define PROPCAT_General -12
  PROPCAT_Mass            = -13;  // #define PROPCAT_Mass -13
  PROPCAT_Pattern         = -14;  // #define PROPCAT_Pattern -14
  PROPCAT_DataPoints      = -15;  // #define PROPCAT_DataPoints -15
  PROPCAT_Mesh            = -16;  // #define PROPCAT_Mesh -16
  PROPCAT_ImageAdjust     = -17;  // #define PROPCAT_ImageAdjust -17
  PROPCAT_ControlPoints   = -18;  // #define PROPCAT_ControlPoints -18
  PROPCAT_PrimaryUnits    = -19;  // #define PROPCAT_PrimaryUnits -19
  PROPCAT_AltUnits        = -20;  // #define PROPCAT_AltUnits -20
  PROPCAT_Fit             = -21;  // #define PROPCAT_Fit -21
  PROPCAT_LinesArrows     = -22;  // #define PROPCAT_LinesArrows -22
  PROPCAT_Tolerances      = -23;  // #define PROPCAT_Tolerances -23
  PROPCAT_Geometry        = -24;  // #define PROPCAT_Geometry -24

// ***************************************************************************** GeneralLib/CLIPDATA
type
  TeClipInfoFlags = Integer;
  TeExpandedClipDataTypes = Integer;

const
  // enum eClipInfoFlags {
  eClipInfoFlags_kbDragGeometry             = TeClipInfoFlags($01); // kbDragGeometry = 0x01};

  // enum eExpandedClipDataTypes {
  eExpandedClipDataTypes_kDcPlotStyles      = TeExpandedClipDataTypes(1);     // kDcPlotStyles       = 1,
  eExpandedClipDataTypes_kDcXrefs           = TeExpandedClipDataTypes(2);     // kDcXrefs            = 2,
  eExpandedClipDataTypes_kDcLayouts         = TeExpandedClipDataTypes(3);     // kDcLayouts          = 3,
  eExpandedClipDataTypes_kDcBlocks          = TeExpandedClipDataTypes(4);     // kDcBlocks           = 4,
  eExpandedClipDataTypes_kDcLayers          = TeExpandedClipDataTypes(5);     // kDcLayers           = 5,
  eExpandedClipDataTypes_kDcDrawings        = TeExpandedClipDataTypes(6);     // kDcDrawings         = 6,
  eExpandedClipDataTypes_kDcLinetypes       = TeExpandedClipDataTypes(7);     // kDcLinetypes        = 7,
  eExpandedClipDataTypes_kDcTextStyles      = TeExpandedClipDataTypes(8);     // kDcTextStyles       = 8,
  eExpandedClipDataTypes_kDcDimStyles       = TeExpandedClipDataTypes(9);     // kDcDimStyles        = 9,
  eExpandedClipDataTypes_kDcBlocksWithAttdef  = TeExpandedClipDataTypes(10);  // kDcBlocksWithAttdef = 10};

// ***************************************************************************** GeneralLib/CODEPGID
type
  Tcode_page_id = Integer;

const
  // typedef enum {
  code_page_id_CODE_PAGE_UNDEFINED          = Tcode_page_id(0);               // CODE_PAGE_UNDEFINED = 0,
  code_page_id_CODE_PAGE_ASCII              = Tcode_page_id(1);               // CODE_PAGE_ASCII,
  code_page_id_CODE_PAGE_8859_1             = Tcode_page_id(2);               // CODE_PAGE_8859_1,
  code_page_id_CODE_PAGE_8859_2             = Tcode_page_id(3);               // CODE_PAGE_8859_2,
  code_page_id_CODE_PAGE_8859_3             = Tcode_page_id(4);               // CODE_PAGE_8859_3,
  code_page_id_CODE_PAGE_8859_4             = Tcode_page_id(5);               // CODE_PAGE_8859_4,
  code_page_id_CODE_PAGE_8859_5             = Tcode_page_id(6);               // CODE_PAGE_8859_5,
  code_page_id_CODE_PAGE_8859_6             = Tcode_page_id(7);               // CODE_PAGE_8859_6,
  code_page_id_CODE_PAGE_8859_7             = Tcode_page_id(8);               // CODE_PAGE_8859_7,
  code_page_id_CODE_PAGE_8859_8             = Tcode_page_id(9);               // CODE_PAGE_8859_8,
  code_page_id_CODE_PAGE_8859_9             = Tcode_page_id(10);              // CODE_PAGE_8859_9,
  code_page_id_CODE_PAGE_DOS437             = Tcode_page_id(11);              // CODE_PAGE_DOS437,
  code_page_id_CODE_PAGE_DOS850             = Tcode_page_id(12);              // CODE_PAGE_DOS850,
  code_page_id_CODE_PAGE_DOS852             = Tcode_page_id(13);              // CODE_PAGE_DOS852,
  code_page_id_CODE_PAGE_DOS855             = Tcode_page_id(14);              // CODE_PAGE_DOS855,
  code_page_id_CODE_PAGE_DOS857             = Tcode_page_id(15);              // CODE_PAGE_DOS857,
  code_page_id_CODE_PAGE_DOS860             = Tcode_page_id(16);              // CODE_PAGE_DOS860,
  code_page_id_CODE_PAGE_DOS861             = Tcode_page_id(17);              // CODE_PAGE_DOS861,
  code_page_id_CODE_PAGE_DOS863             = Tcode_page_id(18);              // CODE_PAGE_DOS863,
  code_page_id_CODE_PAGE_DOS864             = Tcode_page_id(19);              // CODE_PAGE_DOS864,
  code_page_id_CODE_PAGE_DOS865             = Tcode_page_id(20);              // CODE_PAGE_DOS865,
  code_page_id_CODE_PAGE_DOS869             = Tcode_page_id(21);              // CODE_PAGE_DOS869,
  code_page_id_CODE_PAGE_DOS932             = Tcode_page_id(22);              // CODE_PAGE_DOS932,
  code_page_id_CODE_PAGE_MACINTOSH          = Tcode_page_id(23);              // CODE_PAGE_MACINTOSH,
  code_page_id_CODE_PAGE_BIG5               = Tcode_page_id(24);              // CODE_PAGE_BIG5,
  code_page_id_CODE_PAGE_KSC5601            = Tcode_page_id(25);              // CODE_PAGE_KSC5601,
  code_page_id_CODE_PAGE_JOHAB              = Tcode_page_id(26);              // CODE_PAGE_JOHAB,
  code_page_id_CODE_PAGE_DOS866             = Tcode_page_id(27);              // CODE_PAGE_DOS866,
  code_page_id_CODE_PAGE_ANSI_1250          = Tcode_page_id(28);              // CODE_PAGE_ANSI_1250,
  code_page_id_CODE_PAGE_ANSI_1251          = Tcode_page_id(29);              // CODE_PAGE_ANSI_1251,
  code_page_id_CODE_PAGE_ANSI_1252          = Tcode_page_id(30);              // CODE_PAGE_ANSI_1252,
  code_page_id_CODE_PAGE_GB2312             = Tcode_page_id(31);              // CODE_PAGE_GB2312,
  code_page_id_CODE_PAGE_ANSI_1253          = Tcode_page_id(32);              // CODE_PAGE_ANSI_1253,
  code_page_id_CODE_PAGE_ANSI_1254          = Tcode_page_id(33);              // CODE_PAGE_ANSI_1254,
  code_page_id_CODE_PAGE_ANSI_1255          = Tcode_page_id(34);              // CODE_PAGE_ANSI_1255,
  code_page_id_CODE_PAGE_ANSI_1256          = Tcode_page_id(35);              // CODE_PAGE_ANSI_1256,
  code_page_id_CODE_PAGE_ANSI_1257          = Tcode_page_id(36);              // CODE_PAGE_ANSI_1257,
  code_page_id_CODE_PAGE_ANSI_874           = Tcode_page_id(37);              // CODE_PAGE_ANSI_874,
  code_page_id_CODE_PAGE_ANSI_932           = Tcode_page_id(38);              // CODE_PAGE_ANSI_932,
  code_page_id_CODE_PAGE_ANSI_936           = Tcode_page_id(39);              // CODE_PAGE_ANSI_936,
  code_page_id_CODE_PAGE_ANSI_949           = Tcode_page_id(40);              // CODE_PAGE_ANSI_949,
  code_page_id_CODE_PAGE_ANSI_950           = Tcode_page_id(41);              // CODE_PAGE_ANSI_950,
  code_page_id_CODE_PAGE_ANSI_1361          = Tcode_page_id(42);              // CODE_PAGE_ANSI_1361,
  code_page_id_CODE_PAGE_ANSI_1200          = Tcode_page_id(43);              // CODE_PAGE_ANSI_1200,
  code_page_id_CODE_PAGE_ANSI_1258          = Tcode_page_id(44);              // CODE_PAGE_ANSI_1258,
  code_page_id_CODE_PAGE_CNT                = Tcode_page_id(45);              // CODE_PAGE_CNT } code_page_id;



// ***************************************************************************** GeneralLib/CSPTYPES
//type
//  TEAsiStatement = Integer;

const
  // typedef (* [uuid] *)
  // enum tagStatement   {
  EAsiStatement_kAsiTYPE_UNDEFINED          = TEAsiStatement(0);              // kAsiTYPE_UNDEFINED(0,
  EAsiStatement_kAsiALLOC_CURSOR            = TEAsiStatement(1);              // kAsiALLOC_CURSOR(kAsiTYPE_UNDEFINED + 1,
  EAsiStatement_kAsiALLOC_STATEMENT         = TEAsiStatement(2);              // kAsiALLOC_STATEMENT(kAsiALLOC_CURSOR + 1,
  EAsiStatement_kAsiALTER_DOMAIN            = TEAsiStatement(3);              // kAsiALTER_DOMAIN(kAsiALLOC_STATEMENT + 1,
  EAsiStatement_kAsiALTER_TABLE             = TEAsiStatement(4);              // kAsiALTER_TABLE  = kAsiALTER_DOMAIN + 1,
  EAsiStatement_kAsiCREATE_ASSERTION        = TEAsiStatement(5);              // kAsiCREATE_ASSERTION = kAsiALTER_TABLE + 1,
  EAsiStatement_kAsiCREATE_CATALOG          = TEAsiStatement(6);              // kAsiCREATE_CATALOG = kAsiCREATE_ASSERTION + 1,
  EAsiStatement_kAsiCREATE_CHARACTER_SET    = TEAsiStatement(7);              // kAsiCREATE_CHARACTER_SET = kAsiCREATE_CATALOG + 1,
  EAsiStatement_kAsiCREATE_COLLATION        = TEAsiStatement(8);              // kAsiCREATE_COLLATION = kAsiCREATE_CHARACTER_SET + 1,
  EAsiStatement_kAsiCREATE_DOMAIN           = TEAsiStatement(9);              // kAsiCREATE_DOMAIN  = kAsiCREATE_COLLATION + 1,
  EAsiStatement_kAsiCLOSE_CURSOR            = TEAsiStatement(10);             // kAsiCLOSE_CURSOR = kAsiCREATE_DOMAIN + 1,
  EAsiStatement_kAsiCOMMIT                  = TEAsiStatement(11);             // kAsiCOMMIT = kAsiCLOSE_CURSOR + 1,
  EAsiStatement_kAsiCONNECT                 = TEAsiStatement(12);             // kAsiCONNECT  = kAsiCOMMIT + 1,
  EAsiStatement_kAsiCREATE_SCHEMA           = TEAsiStatement(13);             // kAsiCREATE_SCHEMA  = kAsiCONNECT + 1,
  EAsiStatement_kAsiCREATE_TABLE            = TEAsiStatement(14);             // kAsiCREATE_TABLE = kAsiCREATE_SCHEMA + 1,
  EAsiStatement_kAsiCREATE_VIEW             = TEAsiStatement(15);             // kAsiCREATE_VIEW  = kAsiCREATE_TABLE + 1,
  EAsiStatement_kAsiCREATE_INDEX            = TEAsiStatement(16);             // kAsiCREATE_INDEX = kAsiCREATE_VIEW + 1,
  EAsiStatement_kAsiCREATE_TRANSLATION      = TEAsiStatement(17);             // kAsiCREATE_TRANSLATION = kAsiCREATE_INDEX + 1,
  EAsiStatement_kAsiCURSOR                  = TEAsiStatement(18);             // kAsiCURSOR = kAsiCREATE_TRANSLATION + 1,
  EAsiStatement_kAsiDELETE_CURSOR           = TEAsiStatement(19);             // kAsiDELETE_CURSOR  = kAsiCURSOR + 1,
  EAsiStatement_kAsiDELETE_WHERE            = TEAsiStatement(20);             // kAsiDELETE_WHERE = kAsiDELETE_CURSOR + 1,
  EAsiStatement_kAsiDEALLOCATE_STATEMENT    = TEAsiStatement(21);             // kAsiDEALLOCATE_STATEMENT = kAsiDELETE_WHERE + 1,
  EAsiStatement_kAsiDISCONNECT              = TEAsiStatement(22);             // kAsiDISCONNECT = kAsiDEALLOCATE_STATEMENT + 1,
  EAsiStatement_kAsiDROP_ASSERTION          = TEAsiStatement(23);             // kAsiDROP_ASSERTION = kAsiDISCONNECT + 1,
  EAsiStatement_kAsiDROP_CATALOG            = TEAsiStatement(24);             // kAsiDROP_CATALOG = kAsiDROP_ASSERTION + 1,
  EAsiStatement_kAsiDROP_CHARACTER_SET      = TEAsiStatement(25);             // kAsiDROP_CHARACTER_SET = kAsiDROP_CATALOG + 1,
  EAsiStatement_kAsiDROP_COLLATION          = TEAsiStatement(26);             // kAsiDROP_COLLATION = kAsiDROP_CHARACTER_SET + 1,
  EAsiStatement_kAsiDROP_DOMAIN             = TEAsiStatement(27);             // kAsiDROP_DOMAIN  = kAsiDROP_COLLATION + 1,
  EAsiStatement_kAsiDROP_SCHEMA             = TEAsiStatement(28);             // kAsiDROP_SCHEMA  = kAsiDROP_DOMAIN + 1,
  EAsiStatement_kAsiDROP_TABLE              = TEAsiStatement(29);             // kAsiDROP_TABLE = kAsiDROP_SCHEMA + 1,
  EAsiStatement_kAsiDROP_TRANSLATION        = TEAsiStatement(30);             // kAsiDROP_TRANSLATION = kAsiDROP_TABLE + 1,
  EAsiStatement_kAsiDROP_VIEW               = TEAsiStatement(31);             // kAsiDROP_VIEW  = kAsiDROP_TRANSLATION + 1,
  EAsiStatement_kAsiDROP_INDEX              = TEAsiStatement(32);             // kAsiDROP_INDEX = kAsiDROP_VIEW + 1,
  EAsiStatement_kAsiEXECUTE_IMMEDIATE       = TEAsiStatement(33);             // kAsiEXECUTE_IMMEDIATE  = kAsiDROP_INDEX + 1,
  EAsiStatement_kAsiEXECUTE                 = TEAsiStatement(34);             // kAsiEXECUTE  = kAsiEXECUTE_IMMEDIATE + 1,
  EAsiStatement_kAsiFETCH                   = TEAsiStatement(35);             // kAsiFETCH  = kAsiEXECUTE + 1,
  EAsiStatement_kAsiGRANT                   = TEAsiStatement(36);             // kAsiGRANT  = kAsiFETCH + 1,
  EAsiStatement_kAsiINSERT                  = TEAsiStatement(37);             // kAsiINSERT = kAsiGRANT + 1,
  EAsiStatement_kAsiOPEN                    = TEAsiStatement(38);             // kAsiOPEN = kAsiINSERT + 1,
  EAsiStatement_kAsiPREPARE                 = TEAsiStatement(39);             // kAsiPREPARE  = kAsiOPEN + 1,
  EAsiStatement_kAsiREVOKE                  = TEAsiStatement(40);             // kAsiREVOKE = kAsiPREPARE + 1,
  EAsiStatement_kAsiROLLBACK                = TEAsiStatement(41);             // kAsiROLLBACK = kAsiREVOKE + 1,
  EAsiStatement_kAsiSELECT                  = TEAsiStatement(42);             // kAsiSELECT = kAsiROLLBACK + 1,
  EAsiStatement_kAsiSET_CATALOG             = TEAsiStatement(43);             // kAsiSET_CATALOG  = kAsiSELECT + 1,
  EAsiStatement_kAsiSET_SCHEMA              = TEAsiStatement(43);             // kAsiSET_SCHEMA = kAsiSET_CATALOG + 1,
  EAsiStatement_kAsiSET_TIME_ZONE           = TEAsiStatement(44);             // kAsiSET_TIME_ZONE  = kAsiSET_SCHEMA + 1,
  EAsiStatement_kAsiSET_NAMES               = TEAsiStatement(45);             // kAsiSET_NAMES  = kAsiSET_TIME_ZONE + 1,
  EAsiStatement_kAsiSET_TRANSACTION         = TEAsiStatement(46);             // kAsiSET_TRANSACTION  = kAsiSET_NAMES + 1,
  EAsiStatement_kAsiSET_CONSTRAINT          = TEAsiStatement(47);             // kAsiSET_CONSTRAINT = kAsiSET_TRANSACTION + 1,
  EAsiStatement_kAsiSET_AUTHORIZATION       = TEAsiStatement(48);             // kAsiSET_AUTHORIZATION  = kAsiSET_CONSTRAINT + 1,
  EAsiStatement_kAsiUPDATE_CURSOR           = TEAsiStatement(49);             // kAsiUPDATE_CURSOR  = kAsiSET_AUTHORIZATION + 1,
  EAsiStatement_kAsiUPDATE_WHERE            = TEAsiStatement(50);             // kAsiUPDATE_WHERE = kAsiUPDATE_CURSOR + 1  }  EAsiStatement;


// ***************************************************************************** GeneralLib/INETSTRC
type
  TAcadInet = Integer;  // namespace AcadInet  {

const
  // enum   {
  AcadInet_TF_VALIDATE_URL                  = TAcadInet($01);                 // TF_VALIDATE_URL  = 0x01, // overrides all other flags              = no transfer is done
  AcadInet_TF_DOWNLOAD_FILE                 = TAcadInet($02);                 // TF_DOWNLOAD_FILE = 0x02,
  AcadInet_TF_UPLOAD_FILE                   = TAcadInet($04);                 // TF_UPLOAD_FILE   = 0x04,
  AcadInet_TF_IGNORE_CACHE                  = TAcadInet($08);                 // TF_IGNORE_CACHE    = 0x08  // applies to downloads only  };
  // }

// ******************************************************************** GeneralLib/OL_ERRNO
const
  OL_GOOD         = 0;  // #define  OL_GOOD 0 (* Everything is just fine *)
  OL_ESNVALID     = 1;  // #define  OL_ESNVALID    1 (* Invalid symbol table name *)
  OL_ENAMEVALID   = 2;  // #define  OL_ENAMEVALID  2 (* Invalid name (entity or ss) value *)
  OL_ESSMAX       = 3;  // #define  OL_ESSMAX      3 (* Exceeded max number of sel. sets *)
  OL_ESSVALID     = 4;  // #define  OL_ESSVALID    4 (* Invalid selection set *)
  OL_EBDEVALID    = 5;  // #define  OL_EBDEVALID   5 (* Improper use of block def. entity *)
  OL_EXDEVALID    = 6;  // #define  OL_EXDEVALID   6 (* Improper use of xref entity *)
  OL_ENTSELPICK   = 7;  // #define  OL_ENTSELPICK  7 (* Entity selection (failed pick) *)
  OL_EEOEF        = 8;  // #define  OL_EEOEF       8 (* End of entity file *)
  OL_EEOBD        = 9;  // #define  OL_EEOBD       9 (* End of Block def. file *)
  OL_EEMPDB       = 10; // #define  OL_EEMPDB     10 (* Failure of entlast *)
  OL_EDELVPORT    = 11; // #define  OL_EDELVPORT  11 (* Illegal entdel of VPORT *)
  OL_EACQPLINE    = 12; // #define  OL_EACQPLINE  12 (* Operation not allowed during PLINE *)
  OL_EHANDLE      = 13; // #define  OL_EHANDLE    13 (* Invalid handle *)
  OL_ENOHAND      = 14; // #define  OL_ENOHAND    14 (* Handles not enabled *)
  OL_ETRANS       = 15; // #define  OL_ETRANS     15 (* Invalid trans request *)
  OL_EXSPACE      = 16; // #define  OL_EXSPACE    16 (* Invalid space trans request *)
  OL_EDELENT      = 17; // #define  OL_EDELENT    17 (* Invalid use of deleted entity *)
  OL_ETBLNAME     = 18; // #define  OL_ETBLNAME   18 (* Invalid table name *)
  OL_ETBLARG      = 19; // #define  OL_ETBLARG    19 (* Invalid table function argument *)
  OL_ERDONLY      = 20; // #define  OL_ERDONLY    20 (* Attempt to set read only variable *)
  OL_ENONZERO     = 21; // #define  OL_ENONZERO   21 (* Zero value invalid *)
  OL_ERANGE       = 22; // #define  OL_ERANGE     22 (* Value out of range *)
  OL_ERGBUSY      = 23; // #define  OL_ERGBUSY    23 (* Complex regen in progress *)
  OL_EMMTYPE      = 24; // #define  OL_EMMTYPE    24 (* Attempt to change entity type *)
  OL_EMMLAY       = 25; // #define  OL_EMMLAY     25 (* Bad layer name *)
  OL_EMMLT        = 26; // #define  OL_EMMLT      26 (* Bad linetype name *)
  OL_EMMCOLOR     = 27; // #define  OL_EMMCOLOR   27 (* Bad color name *)
  OL_EMMSTYLE     = 28; // #define  OL_EMMSTYLE   28 (* Bad text style name *)
  OL_EMMSHAPE     = 29; // #define  OL_EMMSHAPE   29 (* Bad shape name *)
  OL_EMMFTYPE     = 30; // #define  OL_EMMFTYPE   30 (* Bad field for entity type *)
  OL_EMODDEL      = 31; // #define  OL_EMODDEL    31 (* Attempted entmod of deleted entity *)
  OL_EMODSEQ      = 32; // #define  OL_EMODSEQ    32 (* Attempted entmod of SEQEND *)
  OL_EMODHAND     = 33; // #define  OL_EMODHAND   33 (* Attempt to change handle *)
  OL_EMODVPVIS    = 34; // #define  OL_EMODVPVIS  34 (* Illegal modification of vport vis. *)
  OL_EMMLL        = 35; // #define  OL_EMMLL      35 (* Entity on locked layer *)
  OL_EMKTYPE      = 36; // #define  OL_EMKTYPE    36 (* Bad entity type *)
  OL_EMKPLINE     = 37; // #define  OL_EMKPLINE   37 (* Bad PLINE entity *)
  OL_EMKCMPLX     = 38; // #define  OL_EMKCMPLX   38 (* Incomplete complex ent in block *)
  OL_EMKBNAME     = 39; // #define  OL_EMKBNAME   39 (* Invalid block name field *)
  OL_EMKBFLAG     = 40; // #define  OL_EMKBFLAG   40 (* Duplicate block flag fields *)
  OL_EMKDBNAME    = 41; // #define  OL_EMKDBNAME  41 (* Duplicate block name fields *)
  OL_EMKNORM      = 42; // #define  OL_EMKNORM    42 (* Bad normal vector *)
  OL_EMKNOBNM     = 43; // #define  OL_EMKNOBNM   43 (* Missing block name *)
  OL_EMKNOBFLG    = 44; // #define  OL_EMKNOBFLG  44 (* Missing block flags *)
  OL_EMKANON      = 45; // #define  OL_EMKANON    45 (* Invalid anonymous block *)
  OL_EMKBLOCK     = 46; // #define  OL_EMKBLOCK   46 (* Invalid block definition entity *)
  OL_EMKMANDF     = 47; // #define  OL_EMKMANDF   47 (* Manditory field missing *)
  OL_EMMXDTYPE    = 48; // #define  OL_EMMXDTYPE  48 (* Unrecognized extended data type *)
  OL_EMMXDNEST    = 49; // #define  OL_EMMXDNEST  49 (* Improper nesting of list in xdata *)
  OL_EMMXDAPPID   = 50; // #define  OL_EMMXDAPPID 50 (* Improper location of APPID field *)
  OL_EMMXDSIZE    = 51; // #define  OL_EMMXDSIZE  51 (* Exceeded maximum xdata size *)
  OL_ENTSELNULL   = 52; // #define  OL_ENTSELNULL 52 (* Entity selection (null response) *)
  OL_EMXDAPPID    = 53; // #define  OL_EMXDAPPID  53 (* Entmod/entmake with duplicate appid *)
  OL_EMMVPORT     = 54; // #define  OL_EMMVPORT   54 (* Entmod/entmake of VPORT failed *)
  OL_INVEXT       = 55; // #define  OL_INVEXT     55 (* Entmake of XDEF/XREF/XDEP *)
  OL_EFLTR1       = 56; // #define  OL_EFLTR1     56 (* Bad SSGET filter: premature end *)
  OL_EFLTR2       = 57; // #define  OL_EFLTR2     57 (*       "     missing test operand *)
  OL_EFLTR3       = 58; // #define  OL_EFLTR3     58 (*       "     invalid opcode string *)
  OL_EFLTR4       = 59; // #define  OL_EFLTR4     59 (*       "     void clause/bad nesting *)
  OL_EFLTR5       = 60; // #define  OL_EFLTR5     60 (*       "     beg/end clause mismatch *)
  OL_EFLTR6       = 61; // #define  OL_EFLTR6     61 (*       "     wrong # of XOR/NOT args *)
  OL_EFLTR7       = 62; // #define  OL_EFLTR7     62 (*       "     max nesting exceeded *)
  OL_EFLTR8       = 63; // #define  OL_EFLTR8     63 (*       "     invalid group code *)
  OL_EFLTR9       = 64; // #define  OL_EFLTR9     64 (*       "     invalid string test *)
  OL_EFLTR10      = 65; // #define  OL_EFLTR10    65 (*       "     invalid vector test *)
  OL_EFLTR11      = 66; // #define  OL_EFLTR11    66 (*       "     invliad real test *)
  OL_EFLTR12      = 67; // #define  OL_EFLTR12    67 (*       "     invalid integer test *)
  OL_TABNOT       = 68; // #define  OL_TABNOT     68 (* Digitizer isn't a tablet *)
  OL_TABNOCAL     = 69; // #define  OL_TABNOCAL   69 (* Tablet isn't calibrated. *)
  OL_TABERR       = 70; // #define  OL_TABERR     70 (* Invalid (tablet) arguments *)
  OL_ENEWRB       = 71; // #define  OL_ENEWRB     71 (* Unable to allocate resbuf *)
  OL_ENULLPTR     = 72; // #define  OL_ENULLPTR   72 (* NULL Pointer detected *)
  OL_EOPEN        = 73; // #define  OL_EOPEN      73 (* Can't open file *)
  OL_ELOADED      = 74; // #define  OL_ELOADED    74 (* Application is already loaded *)
  OL_EMAXAPP      = 75; // #define  OL_EMAXAPP    75 (* Number of apps exceeds limit *)
  OL_EEXEC        = 76; // #define  OL_EEXEC      76 (* Unable to execute the application *)
  OL_EVERSION     = 77; // #define  OL_EVERSION   77 (* Incompatible version number *)
  OL_EDENIED      = 78; // #define  OL_EDENIED    78 (* Unable to unload nested ADS app *)
  OL_EREFUSE      = 79; // #define  OL_EREFUSE    79 (* The application refused to XUNLOAD *)
  OL_ENOTLOADED   = 80; // #define  OL_ENOTLOADED 80 (* The application isn't loaded *)
  OL_ENOMEM       = 81; // #define  OL_ENOMEM     81 (* Out of memory *)
  OL_EXFMVALID    = 82; // #define  OL_EXFMVALID  82 (* Invalid transformation matrix *)
  OL_ESYMNAM      = 83; // #define  OL_ESYMNAM    83 (* Invalid symbol name *)
  OL_ESYMVAL      = 84; // #define  OL_ESYMVAL    84 (* Invalid symbol value *)
  OL_NONDIALOG    = 85; // #define  OL_NONDIALOG  85 (* Not allowed while dialogue up *)

 (*  Error codes 86-91 reserved.  *)

  OL_ECMDINP      = 92; // #define  OL_ECMDINP    92  (* Illegal while command in progress *)
  OL_EBADTYPE     = 93; // #define  OL_EBADTYPE   93  (* Bad value type *)
  OL_EBADVPID     = 94; // #define  OL_EBADVPID   94  (* Invalid viewport id *)
  OL_EBADVIEW     = 95; // #define  OL_EBADVIEW   95  (* Bad view definition *)
  OL_EGCODE       = 96; // #define  OL_EGCODE     96  (* Unexpected group code *)
  OL_EGDUP        = 97; // #define  OL_EGDUP      97  (* Duplicate group code specified *)
  OL_EBADSSMOD    = 98; // #define  OL_EBADSSMOD  98  (* Bad ssget mode string *)
  OL_EARGMATCH    = 99; // #define  OL_EARGMATCH  99  (* Arguments are not in agreement *)
  OL_SVRECURSE    = 100; // #define  OL_SVRECURSE  100 (* Do not call setvar recursively *)
  OL_MODOPEN      = 101; // #define  OL_MODOPEN    101 (* Attempt to modify an open entity *)
  OL_NOTENTITY    = 102; // #define  OL_NOTENTITY  102 (* ENTNEXT on a non-entity *)
  OL_BADPLMOD     = 103; // #define  OL_BADPLMOD   103 (* Invalid modification of a pline *)
  OL_BADCTLSTR    = 104; // #define  OL_BADCTLSTR  104 (* Badly nested control string *)
  OL_EXDICT_PR    = 105; // #define  OL_EXDICT_PR  105 (* Failure to modify extension dict or Persistent reactor on r12 entity *)
  // (* If you add a new error code, be sure to add it to the set of errors described by ADS_PERR.C.  In addition, please update the following: *)
  MAX_OL_ERRNO    = 105; // #define  MAX_OL_ERRNO  105 (* Could be used for range check *)
  //
  // #endif

// ***************************************************************************** RXSERVICE

type
  // extern "C" {
  // typedef AcRx::AppRetCode (*DepFuncPtr)(AcRx::AppMsgCode, void*);
  // }
  PDepFuncPtr = ^TDepFuncPtr;
  TDepFuncPtr = function(Msg: TAcRx_AppMsgCode; pkt: Pointer): TAcRx_AppRetCode; cdecl;

// ***************************************************************************** ACADADS.H

type
  PPKwordCallbackPtr = ^PKwordCallbackPtr;
  PKwordCallbackPtr = ^TKwordCallbackPtr;
  TKwordCallbackPtr = function(const Kword: PChar): Presbuf; cdecl;             // struct resbuf* (**pFunc)(const char*)

  PDragGenScnfPtr = ^TDragGenScnfPtr;
  TDragGenScnfPtr = function(pt: Tads_point; var mt: Tads_matrix): Integer; cdecl;  // int (*scnf) (ads_point pt, ads_matrix mt)

// *****************************************************************************  ADSDLG.H

type
  Pads_hdlg = ^Tads_hdlg;
  Tads_hdlg = Pointer;                    // typedef void *ads_hdlg;
  Pads_htile = ^Tads_htile;
  Tads_htile = Pointer;                   // typedef void *ads_htile;

  Pads_callback_packet = ^Tads_callback_packet;
  Tads_callback_packet = record   //  typedef struct {
    dialog: Tads_hdlg;                    //    ads_hdlg  dialog;
    tile: Tads_htile;                     //    ads_htile tile;
    value: PChar;                         //    char*     value;
    client_data: Pointer;                 //    void*     client_data;
    reason: Integer;                      //    int       reason;
    x, y: Longint;                        //    long      x, y;
  end;                                    //  } ads_callback_packet;

const
  CBR_SELECT        = 1;                  // #define CBR_SELECT       1
  CBR_LOST_FOCUS    = 2;                  // #define CBR_LOST_FOCUS   2
  CBR_DRAG          = 3;                  // #define CBR_DRAG         3
  CBR_DOUBLE_CLICK  = 4;                  // #define CBR_DOUBLE_CLICK 4

type
// ADS user's function, passed to AutoCAD to be called later
  PCLIENTFUNC = ^TCLIENTFUNC;
  TCLIENTFUNC = procedure(cpkt: Pads_callback_packet); cdecl;   // typedef void (*CLIENTFUNC) (ads_callback_packet *cpkt);

const
  NULLCB: PCLIENTFUNC = nil;                                    // #define NULLCB ((CLIENTFUNC)0)
  BAD_DIALOG        = 0;                                        // #define BAD_DIALOG NULL

// Return by reference integers for ads_start_dialog
  DLGCANCEL         = 0;                                        // #define DLGCANCEL     0 /* User pressed Cancel or equivalent */
  DLGOK             = 1;                                        // #define DLGOK         1 /* User pressed Ok */
  DLGALLDONE        = -1;                                       // #define DLGALLDONE   -1 /* All dialogs terminated with term_dialog */
  DLGSTATUS         = 2;                                        // #define DLGSTATUS     2 /* start of user return codes */

// Preventing redefined warnings. List argument type for ads_start_list();
  LIST_CHANGE       = Smallint(1);                              // #define LIST_CHANGE ((short) 1) /* Change selected listbox contents */
  LIST_APPEND       = Smallint(2);                              // #define LIST_APPEND ((short) 2) /* Append new listbox entry */
  LIST_NEW          = Smallint(3);                              // #define LIST_NEW    ((short) 3) /* Delete old list and create new list */
// Mode argument type for ads_mode_tile();
  MODE_ENABLE       = Smallint(0);                              // #define MODE_ENABLE   ((short) 0) /* Enable tile */
  MODE_DISABLE      = Smallint(1);                              // #define MODE_DISABLE  ((short) 1) /* Disable tile */
  MODE_SETFOCUS     = Smallint(2);                              // #define MODE_SETFOCUS ((short) 2) /* Set focus to tile */
  MODE_SETSEL       = Smallint(3);                              // #define MODE_SETSEL   ((short) 3) /* Set editbox selection--allows auto-clearing of old string */
  MODE_FLIP         = Smallint(4);                              // #define MODE_FLIP     ((short) 4) /* Invert current state */

  MAX_TILE_STR = 40;                                            // #define MAX_TILE_STR  40
  TILE_STR_LIMIT = 255;                                         // #define TILE_STR_LIMIT 255  /* real limit of dialog strings */

// *****************************************************************************

type
  PSELECTFILEPROC = ^TSELECTFILEPROC;
  TSELECTFILEPROC = function(userCancel: PSmallint; var chosenPath: PChar; h: HWND; const nFlags: Integer;
                             const prompt, dir, name, ftype: PChar; pnChoice: PInteger; pbReadOnly: PLongBool;
                             const pszWSTags: PChar; pReserved: Pointer): TAcad_ErrorStatus; cdecl;
// typedef Acad::ErrorStatus (*SELECTFILEPROC )(/*[out]*/ short *userCancel, /*[out]*/ char*& chosenPath, void* h, // HWND
//                                             const int nFlags, const char* prompt, const char* dir, const char* name,
//                                             const char* type, int* pnChoice, bool* pbReadOnly, const char* pszWSTags, void* pReserved);

  PREMAPPROC = ^TREMAPPROC;
  TREMAPPROC = function(var newName: PChar; const filename: PChar; context: Integer; pReserved: Pointer): TAcad_ErrorStatus; cdecl;
// typedef Acad::ErrorStatus (* REMAPPROC) (/*[out]*/ char*& newName, const char* filename, int context, void* pReserved);

  PMAPFILENOTIFYPROC = ^TMAPFILENOTIFYPROC;
  TMAPFILENOTIFYPROC = procedure(const filename, newName: PChar; context: Integer; pReserved: Pointer); cdecl;
// typedef void (* MAPFILENOTIFYPROC) (const char* filename, const char* newName, int context, void* pReserved);

// ***************************************************************************** ADSRXDEF.H

//#pragma pack (push, 8)
type
  PfuncPointer = ^TfuncPointer;
  TfuncPointer = function: Integer; cdecl;

  Pfchnd = ^Tfchnd;
  Tfchnd = record               //  typedef struct fchnd {                /* ads function handler struct */
    next: Pfchnd;                     //    struct fchnd *next;           /* linked */
    fcode: Integer;                   //    int fcode;                    /* function code */
    fhdl: PfuncPointer;               //    int (*fhdl)();                /* registered function pointer */
  end;                                //  } FunHandList;
  PFunHandList = ^TFunHandList;
  TFunHandList = Tfchnd;

  // The following typedef is used for maintaining a connection between AutoLISP and an RXADS application.
  // It is for internal use only
  PRxADSAppTableEntryType = ^TRxADSAppTableEntryType;
  TRxADSAppTableEntryType = record            // class RxADSAppTableEntryType { public:
    lflag: Integer;                                 //   int    lflag;
    appname: PChar;                                 //   char*  appname;
    apphandle: Longint;                             //   long   apphandle;
    ads_fcode: Integer;                             //   int    ads_fcode;
    ads_invkcnt: Integer;                           //   int    ads_invkcnt;
    ads_argl: Presbuf;                              //   struct resbuf* ads_argl;
    ads_fhdl: PFunHandList;                         //   FunHandList* ads_fhdl;
    modhandle: TposAcRxGenHand;                     //   AcRxGenHand * modhandle;
    ads_ret: Presbuf;                               //   resbuf *ads_ret;
    ads_rettype: Integer;                           //   int    ads_rettype;
  end;                                              // };

// *****************************************************************************  gegbl.h
type
  TAcGe_metaTypeIndex = Integer;

type
  PErrorFunc = ^TErrorFunc;
  TErrorFunc = procedure; cdecl;
  POrthoVectorFunc = ^TOrthoVectorFunc;
  TOrthoVectorFunc = procedure(var value1, value2: TposAcGeVector3d); cdecl;
  PAllocMemFunc = ^TAllocMemFunc;
  TAllocMemFunc = function(value: Tsize_t): Pointer; cdecl;
  PAllocMemLeakFunc = ^TAllocMemLeakFunc;
  TAllocMemLeakFunc = function(value1: Tsize_t; value2: PChar; value3: Integer): Pointer; cdecl;

  PFreeMemFunc = ^TFreeMemFunc;
  TFreeMemFunc = procedure(value: Pointer); cdecl;

  PAllocMemNearFunc = ^TAllocMemNearFunc;
  TAllocMemNearFunc = function(value1: Tsize_t; value2: TAcGe_metaTypeIndex; const value3: Pointer): Pointer; cdecl;
  PAllocMemNearVectorFunc = ^TAllocMemNearVectorFunc;
  TAllocMemNearVectorFunc = function(value1: Tsize_t; value2: TAcGe_metaTypeIndex; value3: Cardinal; const value4: Pointer): Pointer; cdecl;
  PSetExternalStoreFunc = ^TSetExternalStoreFunc;
  TSetExternalStoreFunc = procedure(const value: Pointer); cdecl;

type
  PTAcGeTol = Pointer;


  TAcGeContext = record      // struct AcGeContext  {  // System wide default tolerance.
    gTol: PTAcGeTol;                  // static AcGeTol      gTol;
    gErrorFunc: PErrorFunc;         //  static void (*gErrorFunc)();
{$IFNDEF GELIB2D}                   // #ifndef GELIB2D
  // Function to calculate a vector which is orthogonal to the given vector.
    gOrthoVector: POrthoVectorFunc;   //  static void (*gOrthoVector)(const AcGeVector3d&,AcGeVector3d&);
{$ENDIF}                            // #endif
{$IFNDEF unix}                      // #ifndef unix
    gAllocMem: PAllocMemFunc;       //  static void* (*gAllocMem)(size_t);
{$IFDEF MEM_DEBUG}                  // #ifdef MEM_DEBUG
    gAllocMemLeak: PAllocMemLeakFunc; //  static void* (*gAllocMemLeak)(size_t, const char *, int);
{$ENDIF}                            // #endif
    gFreeMem: PFreeMemFunc;           // static void  (*gFreeMem)(void*);
{$ENDIF}                            // #endif
{$IFDEF GE_LOCATED_NEW}             // #ifdef GE_LOCATED_NEW
    gAllocMemNear: PAllocMemNearFunc; // static void* (*gAllocMemNear) (size_t, AcGe::metaTypeIndex, const void* );
    gAllocMemNearVector: PAllocMemNearVectorFunc;     // static void* (*gAllocMemNearVector) (size_t, AcGe::metaTypeIndex, unsigned int, const void* );
    gSetExternalStore: PSetExternalStoreFunc;         // static void (*gSetExternalStore) (const void* );
{$ENDIF}                            // #endif
  end;                              //};

// *****************************************************************************  gs.h

type
  TAcGsColor = record           // struct AcGsColor{
      m_red: Byte;                    //    unsigned char   m_red;
      m_green: Byte;                  //    unsigned char   m_green;
      m_blue: Byte;                   //    unsigned char   m_blue;
      m_filler: Byte;                 //    unsigned char   m_filler;
  end;                                  //  };

type
  PAcGsClientViewInfo = ^TAcGsClientViewInfo;
  TAcGsClientViewInfo = record // struct AcGsClientViewInfo {
    viewportId: Longint;              //    long viewportId;        // returned via AcGiViewport::viewportId()
    acadWindowId: Longint;            //    long acadWindowId;      // returned via AcGiViewport::acadWindowId()
    viewportObjectId: Longint;        //    long viewportObjectId;  // returned via AcGiViewportDraw::viewportObjectId()
  end;                                  //  };



// *****************************************************************************   opmimp.h

type
  PTPROPCAT = Pointer;
  PTLPCOLESTR = Pointer;
  Tdispid = Longint;

  TACAD_OPMPROPMAP_ENTRY = record   //  struct ACAD_OPMPROPMAP_ENTRY  {
    nDescID: UINT;                          //    UINT nDescID;                  //Alternate property name
    dispid: Tdispid;                        //    dispid dispid;               //ID of the property
    catid: PTPROPCAT;                       //    PROPCAT  catid;                //categoryID
    nCatNameID: UINT;                       //    UINT nCatNameID;               //category Name
    nElementStrID: UINT;                    //    UINT nElementStrID;            //expanded property name list (for pts, ex.)
    nPredefinedStrID: UINT;                 //    UINT nPredefinedStrID;         //IPerPropertyBrowsing enumeration strings
    predefinedValues: LPCSTR;               //    LPCSTR    predefinedValues;    //IPerPropertyBrowsing enumeration values
    grouping: Word;                         //    unsigned short grouping;       //expanded property name grouping
    editable: Bool;                         //    bool      editable;            //show property override

    pclsidOther: PGUID;                     //    const CLSID* pclsidOther;      //CLSID for Other.. combo item dlg (not used)
    pclsidPropPage: PGUID;                  //    const CLSID* pclsidPropPage;   //IPerPropertyBrowsing dialog CLSID
    piidDispatch: PGUID;                    //    const IID* piidDispatch;       //dispatch pointer for property
    szEllipsesTxt: PTLPCOLESTR;             //    LPCOLESTR szEllipsesTxt;       //IPerPropertyBrowsing display string
  end;                                      //  };

// **************************************************************: DelphiARX ORIGNAL.

  TEntTableTypes = (etNORM, etTABLE, etVPORT, etLTYPE, etLAYER, etSTYLE, etVIEW, etUCS, etBLOCK);

// --------------------------------------------------------------------------
//    TResBuf構造体のResVal値が、Delphiのどのデータ型か区別する
//    The ResVal value of the TResBuf structure distinguishes between any data type of Delphi.
//
//      ruERROR   ... It doesn't correspond.              // 未対応
//      ruREAL    ... Tads_Real(Double)
//      ruPOINT   ... Tads_Point
//      ruSHORT   ... SmallInt
//      ruSTRING  ... PChar (contains"RTDXF0")            // "RTDXF0"の場合も文字列に含まれる
//      ruLNAME   ... Tads_Name
//      ruLONG    ... Longint
//      ruBINARY  ... Tads_Binary
//      ruHANDLE  ... 8byte Handle                        // ８バイトハンドル
//      ruPOINTER ... 32bit Pointer                       // ポインタ
//      ruRESBUF  ... ResultBuffer(PResBuf)               // リザルトバッファ
//      ruNONE    ... None ResVal Data                    // ResVal自体にはデータを持っていない RTLEなど
//
//    DXFグループコードで定義されたTResBufのデータ変換に利用します。
//    It uses for the data change by TResBuf which was defined with the DXF group code.
//--------------------------------------------------------------------------

  TResbufTypes = (ruERROR, ruREAL, ruPOINT, ruSHORT, ruSTRING, ruLNAME, ruLONG, ruBINARY, ruHANDLE, ruPOINTER, ruRESBUF, ruNONE);

  TResBufTree = record                                  // ResultBuffer Tree record.  リザルトバッファツリー
    FirstBuf: PResBuf;                                  // First PResBuf Pointer.     始めのリザルトバッファポインタ
    LastBuf: PResBuf;                                   // Next PResBuf Pointer.      継続を保持する為のポインタ
  end;

  // The parameter for the line species making          線種作成用パラメータ
  // TDArxTableMake.AddLTYPE (DArxAds.pas) Acad.lin / Acadiso.lin
  TLTypeParam = record
    Name: AnsiString;                                   // Linetype name.             線種名
    Desc: AnsiString;                                   // The description.           線種の説明
    Params: AnsiString;                                 // The other parameter character string.     その他のパラメータ文字列
  end;

function ads_Point(const X, Y, Z: Tads_Real): Tads_Point;
function ads_Name(const name0, name1: Longint): Tads_Name;
procedure acdbPointSet(const formPos: Tads_Point; var toPos: Tads_Point);
procedure acdbNameSet(const formName: Tads_Name; var toName: Tads_Name);
procedure acdbMatrixSet(const formMatrix: Tads_Matrix; var toMatrix: Tads_Matrix);
procedure acdbPointClear(var Point: Tads_Point);
procedure acdbNameClear(var Name: Tads_Name);
procedure acdbMatrixClear(var Matrix: Tads_Matrix);
function acdbPointNil(const Point: Tads_point): Boolean;
function acdbNameNil(const Name: Tads_Name): Boolean;
function acdbMatrixNil(const Matrix: Tads_Matrix): Boolean;
function acdbPointEqual(const Point1, Point2: Tads_point; const PermitArea: Double): Boolean;
function acdbNameEqual(const Name1, Name2: Tads_Name): Boolean;
function acdbMatrixEqual(const Matrix1, Matrix2: Tads_Matrix; const PermitArea: Double): Boolean;

implementation

function ads_Point(const X, Y, Z: Tads_Real): Tads_Point;
begin
  Result[0] := X;
  Result[1] := Y;
  Result[2] := Z;
end;

function ads_Name(const name0, name1: Longint): Tads_Name;
begin
  Result[0] := name0;
  Result[1] := name1;
end;

procedure acdbPointSet(const formPos: Tads_Point; var toPos: Tads_Point);
begin
  toPos := formPos;
end;

procedure acdbNameSet(const formName: Tads_Name; var toName: Tads_Name);
begin
  toName := formName;
end;

procedure acdbMatrixSet(const formMatrix: Tads_Matrix; var toMatrix: Tads_Matrix);
var
  ni, nj: Longint;
begin
  for ni := 0 to 3 do for nj := 0 to 3 do toMatrix[ni, nj] := formMatrix[ni, nj];
end;

procedure acdbPointClear(var Point: Tads_Point);
begin
  Point[0] := 0;
  Point[1] := 0;
  Point[2] := 0;
end;

procedure acdbNameClear(var Name: Tads_Name);
begin
  Name[0] := 0;
  Name[1] := 0;
end;

procedure acdbMatrixClear(var Matrix: Tads_Matrix);
var
  ni, nj: Longint;
begin
  for ni := 0 to 3 do for nj := 0 to 3 do Matrix[ni, nj] := 0;
end;

function acdbPointNil(const Point: Tads_point): Boolean;
begin
  Result := ((Point[0] = 0)and(Point[1] = 0)and(Point[2] = 0));
end;

function acdbNameNil(const Name: Tads_Name): Boolean;
begin
  Result := ((Name[0] = 0)and(Name[1] = 0));
end;

function acdbMatrixNil(const Matrix: Tads_Matrix): Boolean;
var
  ni, nj: Longint;
begin
  Result := True;
  for ni := 0 to 3 do for nj := 0 to 3 do if (Matrix[ni, nj] <> 0) then Result := False;
end;

function acdbPointEqual(const Point1, Point2: Tads_point; const PermitArea: Double): Boolean;
begin
  Result := ((Point1[0] + PermitArea) >= Point2[0])and(Point2[0] >= (Point1[0] - PermitArea))
          and((Point1[1] + PermitArea) >= Point2[1])and(Point2[1] >= (Point1[1] - PermitArea))
          and((Point1[2] + PermitArea) >= Point2[2])and(Point2[2] >= (Point1[2] - PermitArea));
end;

function acdbNameEqual(const Name1, Name2: Tads_Name): Boolean;
begin
  Result := ((Name1[0] = Name2[0])and(Name1[1] = Name2[1]));
end;

function acdbMatrixEqual(const Matrix1, Matrix2: Tads_Matrix; const PermitArea: Double): Boolean;
var
  ni, nj: Longint;
begin
  Result := True;
  for ni := 0 to 3 do for nj := 0 to 3 do begin
    if ((Matrix1[ni, nj] - PermitArea) > Matrix2[ni, nj])or(Matrix2[ni, nj] > (Matrix1[ni, nj] + PermitArea)) then begin
      Result := False;
      break;
    end;
  end;
end;

end.




