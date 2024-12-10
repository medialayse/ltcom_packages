unit DArxApi;

// ******************************************************
//         DelphiARX2002 Global Functions Library
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
  Windows, SysUtils, DArxH,
  AcRxCLib, AcApCLib, AcDxCLib, AcDbCLib, AcGiCLib, AcTrCLib, AsiCLib, MfcCLib;

// ***************************************** ACUTMEM.H *****

function acutNewBuffer(var pOutput: PChar; size: Tsize_t): TAcad_ErrorStatus;
function acutNewString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
function acutUpdString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
procedure acutDelString(var pString: PChar);
procedure acutDelBuffer(var pString: PChar);

// ***************************************** ADSTEXT.H *****
function acadErrorStatusText(errno: TAcad_ErrorStatus): AnsiString;
function acdbServices: Pointer;

// ***************************************** ACED.H *****
function acedCmdLookup(const cmdStr: AnsiString; globalLookup: Integer; retStruc: Pointer; skipUndef: LongBool = False): Integer;
function acedCmdLookup2(const cmdStr: AnsiString; globalLookup: Integer; recStruc: Pointer; sf: Integer = ACRX_CMD_DEFUN): Integer;
function acedCmdUndefine(const cmdStr: AnsiString; undefIt: Integer): Integer;
function acedPopCommandDirectory(const cmdDirName: AnsiString): Integer;
function acedGetCommandForDocument(pDoc: TAcApDocument; var pGlobalCmdName: AnsiString): TAcad_ErrorStatus;
function acedSetOLELock(handle, flags: Integer): TAdesk_Boolean;
function acedClearOLELock(handle: Integer): TAdesk_Boolean;
function acedPostCommand(const pCmd: AnsiString): TAdesk_Boolean;
procedure acedPostCommandPrompt;
procedure acedUpdateDisplay;

// ***************************************** ADS.H *****
procedure acrx_abort(const format: array of AnsiString);

function acedGetAppName: AnsiString;
function acedUpdate(vport: Integer; p1, p2: Tads_point): Integer;
function acedSetFunHelp(const pszFunctionName, pszHelpfile, pszTopic: AnsiString; iCmd: Integer): Integer;
function acedGetFullInput(var pStr: AnsiString): Integer;
function acedGetFullKword(const pString: AnsiString; var pStr: AnsiString): Integer;
function acedGetFullString(cronly: Integer; const pString: AnsiString; var pResult: AnsiString): Integer;

function acad_malloc(const sz: Cardinal): Pointer;
procedure acad_free(var p: Pointer);
function acad_msize(const p: Pointer): Cardinal;
function acad_realloc(const p: Pointer; const ns: Cardinal): Pointer;
function acad_calloc(sz1, sz2: Cardinal): Pointer;
function acad_strdup(const p: PChar): PChar;

function acutNewRb(const v: Integer): PResbuf; overload;
// The specifying use of the acutNewRb function.
// acutNewRb関数の特定使用
function acutNewRb(const IntType: Integer; const Value: Longint): PResbuf; overload;
function acutNewRb(const RealType: Integer; const Value: Tads_real): PResbuf; overload;
function acutNewRb(const StrType: Integer; const Value: PChar): PResbuf; overload;
function acutNewRb(const PosType: Integer; const Value: Tads_point): PResbuf; overload;
function acutNewRb(const NameType: Integer; const Value: Tads_name): PResbuf; overload;
function acutNewRb(const BinType: Integer; const Value: Tads_binary): PResbuf; overload;
// The specifying use of the acutNewRb function : Makes the RESULT BUFFER which contains specification Result Type data.
// acutNewRb関数の特定使用: 指定リザルト・タイプのデータを含むリザルトバッファを作成します
function acutNewrbVal(const ResType: Smallint; const ResVal: Variant): PResbuf;

function acutRelRb(var rb: PResbuf): Integer;
function acutBuildList(const rType: array of Variant): PResbuf;
function acedUsrBrk: Integer;
function acedCmd(const rbp: PResbuf): Integer;
function acedCommand(rtype: array of Variant): Integer;
procedure acdbFail(const str: AnsiString);

function adsw_acadMainWnd: HWND;
function adsw_acadDocWnd: HWND;

function acedDefun(const sname: AnsiString; const funcno: Smallint): Integer;
function acedUndef(const sname: AnsiString; const funcno: Smallint): Integer;
function acedGetFunCode: Integer;
function acedGetArgs: PResbuf;
function acedRegFunc(const fhdl: PfuncPointer; const fcode: Integer): Integer;
function acedInvoke(const args: PResbuf; var retbuf: PResbuf): Integer;

function acedArxLoaded: PResbuf;
function acedArxLoad(const app: AnsiString): Integer;
function acedArxUnload(const app: AnsiString): Integer;

function acedRetList(const rbuf: PResbuf): Integer;
function acedRetVal(const rbuf: PResbuf): Integer;
function acedRetPoint(const pt: Tads_Point): Integer;
function acedRetStr(const s: AnsiString): Integer;
function acedRetName(const aname: Tads_Name; const ntype: Integer): Integer;
function acedRetInt(const ival: Integer): Integer;
// Long型のデータを強制的に返す
function acedRetLong(const lval: Longint): Integer;
function acedRetReal(const rval: Tads_Real): Integer;
function acedRetT: Integer;
function acedRetNil: Integer;
function acedRetVoid: Integer;

function acdbEntDel(const ent: Tads_Name): Integer;
function acdbEntGetX(const ent: Tads_Name; const args: PResbuf): PResbuf;
function acdbEntGet(const ent: Tads_Name): PResbuf;
function acdbEntLast(var ent: Tads_Name): Integer;
function acdbEntFirst(var entres: Tads_Name): Integer;
function acdbEntNext(const ent: Tads_Name; var entres: Tads_Name): Integer;
function acdbEntUpd(const ent: Tads_Name): Integer;
function acdbEntMod(const ent: PResbuf): Integer;
function acdbEntMake(const ent: PResbuf): Integer;
function acdbEntMakeX(const entm: PResbuf; var entres: Tads_Name): Integer;
function acedEntSel(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point): Integer;
function acedNEntSel(const str: AnsiString; var entres: Tads_name; var ptres: Tads_point; var xformres4: Tads_point4; var refstkres: PResbuf): Integer;
function acedNEntSelP(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point; const pickflag: Boolean; var xformres: Tads_Matrix; var refstkres: PResbuf): Integer;

function acedSSGet(const str: AnsiString; const pt1, pt2: Pointer; const filter: PResbuf; var ss: Tads_Name): Integer;
function acedSSGetFirst(var grip_set, pickfirst_set: PResbuf): Integer;
function acedSSSetFirst(const grip_set, pickfirst_set: Tads_name): Integer;
function acedSSFree(var sname: Tads_Name): Integer;
function acedSSLength(const sname: Tads_Name; var len: Longint): Integer;
function acedSSAdd(const ename, sname: Pads_Name; var entres: Tads_Name): Integer;
function acedSSDel(const ename, ss: Tads_Name): Integer;
function acedSSMemb(const ename, ss: Tads_Name): Integer;
function acedSSName(const ss: Tads_Name; const i: Longint; var entres: Tads_Name): Integer;
function acedSSNameX(var rbpp: PResbuf; const ss: Tads_Name; const i: Longint): Integer;

function acedSSGetKwordCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
function acedSSSetKwordCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
function acedSSGetOtherCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
function acedSSSetOtherCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;

function acdbXdRoom(const ent: Tads_name; var longres: Longint): Integer;
function acdbXdSize(const rb: PResbuf; var longres: Longint): Integer;
function acdbTblNext(const tblname: AnsiString; rewind: Integer): PResbuf;
function acdbTblSearch(const tblname, sym: AnsiString; setnext: Integer): PResbuf;
function acdbNamedObjDict(var nameres: Tads_name): Integer;
function acdbDictSearch(const dict: Tads_name; const sym: AnsiString; setnext: Integer): PResbuf;
function acdbDictNext(const dict: Tads_name; rewind: Integer): PResbuf;
function acdbDictRename(const dictname: Tads_name; const oldsym, newsym: AnsiString): Integer;
function acdbDictRemove(const dictname: Tads_name; const symname: AnsiString): Integer;
function acdbDictAdd(const dictname: Tads_name; const symname: AnsiString; const newobj: Tads_name): Integer;
function acdbTblObjName(const tblname, sym: AnsiString; var nameres: Tads_name): Integer;
function acdbHandEnt(const handle: AnsiString; var entres: Tads_Name): Integer;
function acedTrans(const pt: Tads_Point; const rfrom, rto: PResbuf; const disp: Boolean; var posres: Tads_Point): Integer;
function acdbAngToS(v: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
function acutCvUnit(value: Tads_real; const oldunit, newunit: AnsiString; var realres: Tads_real): Integer;
function acutWcMatch(const str, pattern: AnsiString): Integer;
function acdbRToS(val: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
function acdbAngToF(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
function acdbDisToF(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;

function acedSetVar(const sym: AnsiString; const resbuf: PResbuf): Integer; overload;
// The specifying use of the acedSetVar function : Sets character string data to the system variable.
// acedSetVar関数の特定使用: 文字列データをシステム変数へ設定します。
function acedSetVar(const sym: AnsiString; const StrRes: AnsiString): Integer; overload;
// The specifying use of the acedSetVar function : Sets real value data to the system variable.
// acedSetVar関数の特定使用: 実数値データをシステム変数へ設定します。
function acedSetVar(const sym: AnsiString; const RealRes: Tads_Real): Integer; overload;
function acedSetVarReal(const sym: AnsiString; const RealRes: Tads_Real): Integer;
// The specifying use of the acedSetVar function : Sets integer value data to the system variable.
// acedSetVar関数の特定使用: 整数値データをシステム変数へ設定します。
function acedSetVar(const sym: AnsiString; const LongRes: Longint): Integer; overload;

function acedInitGet(val: Integer; const kwl: AnsiString): Integer;
function acedGetSym(const sname: AnsiString; var value: PResbuf): Integer;
function acedPutSym(const sname: AnsiString; const value: PResbuf): Integer;
function acedHelp(szFilename, szTopic: AnsiString; iCmd: Integer): Integer;
function acutPrintf(const strformat: AnsiString): Integer; overload;
function acutPrintf(const strformat: AnsiString; const args: array of const): Integer; overload;
function acdbInters(const from1, to1, from2, to2: Tads_point; teston: Integer; var posres: Tads_point): Integer;

function acedGetVar(const sym: AnsiString; var retbuf: PResbuf): Integer; overload;
// The specifying use of the acedGetVar function : Acquires character string data from the system variable.
// acedGetVar関数の特定使用: システム変数から文字列データを取得します。
function acedGetVar(const sym: AnsiString; var StrRes: AnsiString): Integer; overload;
// The specifying use of the acedGetVar function : Acquires real value data from the system variable.
// acedGetVar関数の特定使用: システム変数から実数値データを取得します。
function acedGetVar(const sym: AnsiString; var RealRes: Tads_Real): Integer; overload;
// The specifying use of the acedGetVar function : Acquires integer value data from the system variable.
// acedGetVar関数の特定使用: システム変数から整数値データを取得します。
function acedGetVar(const sym: AnsiString; var LongRes: Longint): Integer; overload;

function acedFindFile(const fname: AnsiString; var fileres: AnsiString): Integer;
function acedGetEnv(const sym: AnsiString; var val: AnsiString): Integer;
function acedSetEnv(const sym, val: AnsiString): Integer;

function acedGetCfg(const sym: AnsiString; var val: AnsiString): Integer; overload;
function acedGetCfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer; overload;
function acedSetCfg(const sym, val: AnsiString): Integer;
function acdbSNValid(const tbstr: AnsiString; pipetest: Integer): Integer;
function acdbXStrSave(const pSource: AnsiString; var pDest: AnsiString): AnsiString;
function acdbXStrCase(str: AnsiString): Integer;

function acedGetString(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString): Integer;
function acedGetStringB(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString; bufsize: Integer): Integer;
function acedMenuCmd(const str: AnsiString): Integer;
function acedPrompt(const str: AnsiString): Integer;
function acedAlert(const str: AnsiString): Integer;

function acdbRegApp(const appname: AnsiString): Integer;

function acedGetAngle(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetAngle(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetCorner(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer; overload;
function acedGetCorner(const pt: Tads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer; overload;
function acedGetDist(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetDist(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetOrient(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetOrient(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer; overload;
function acedGetPoint(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer; overload;
function acedGetPoint(const Pt: Tads_Point; const Prompt: AnsiString; var posres: Tads_Point): Integer; overload;

function acedGetInt(const prompt: AnsiString; var intres: Integer): Integer;
function acedGetKword(const prompt: AnsiString; var kwordres: AnsiString): Integer;
function acedGetReal(const prompt: AnsiString; var realres: Tads_Real): Integer;
function acedGetInput(var str: AnsiString): Integer;

function acedVports(var vlist: PResbuf): Integer;
function acedTextScr: Integer;
function acedGraphScr: Integer;
function acedTextPage: Integer;
function acedRedraw(const ent: Tads_name; mode: Integer): Integer; overload;
function acedRedraw(const ent: Pads_name; mode: Integer): Integer; overload;
function acedOsnap(const pt: Tads_point; const mode: AnsiString; var posres: Tads_point): Integer;
function acedGrRead(track: Integer; var itype: Integer; var retbuf: PResbuf): Integer;

function acedGrText(box: Integer; const text: AnsiString; hl: Integer): Integer;
function acedGrDraw(const from1, to1: Tads_point; color: Integer; hl: Boolean): Integer;
function acedGrVecs(const vlist: PResbuf; mat: Tads_matrix): Integer; overload;
function acedGrVecs(const vlist: PResbuf; mat: Pads_matrix): Integer; overload;

function acedXformSS(const ssname: Tads_Name; genmat: Tads_Matrix): Integer;
function acedDragGen(const ss: Tads_Name; const pmt: AnsiString; cursor: Integer; scnf: PDragGenScnfPtr; var p: Tads_Point): Integer;
function acedSetView(const view: PResbuf; vport: Integer): Integer;
function acedSyncFileOpen(const FileToOpen: AnsiString): Integer;

function acutAngle(const pt1, pt2: Tads_point): Tads_real;
function acutDistance(const pt1, pt2: Tads_point): Tads_real;
procedure acutPolar(const pt: Tads_point; angle, dist: Tads_real; var ptres: Tads_point);

function acedGetFileD(const title, defawlt, ext: AnsiString; const flags: Integer; var resbuf: PResbuf): Integer;
function acedGetFileDialog(const title, defawlt, ext: AnsiString; const flags: Integer; var FileName: AnsiString): Integer;
function acedTextBox(const args: PResbuf; var pt1, pt2: Tads_point): Integer;
function acedTablet(const args: PResbuf; var retbuf: PResbuf): Integer;

function acutIsAlpha(c: Char): LongBool;
function acutIsUpper(c: Char): LongBool;
function acutIsLower(c: Char): LongBool;
function acutIsDigit(c: Char): LongBool;
function acutIsXDigit(c: Char): LongBool;
function acutIsSpace(c: Char): LongBool;
function acutIsPunct(c: Char): LongBool;
function acutIsAlNum(c: Char): LongBool;
function acutIsPrint(c: Char): LongBool;
function acutIsGraph(c: Char): LongBool;
function acutIsCntrl(c: Char): LongBool;
function acutToUpper(c: Char): Char;
function acutToLower(c: Char): Char;

function acedGetCName(const cmd: AnsiString; var strres: AnsiString): Integer;

function acedFNSplit(const pathToSplit, prebuf, namebuf, extbuf: PChar): Integer;

// ***************************************** ADSDLG.H *****
function ads_load_dialog(const dclfile: AnsiString; var dcl_id: Integer): Integer;
function ads_unload_dialog(dcl_id: Integer): Integer;
function ads_new_dialog(const dlgname: AnsiString; dcl_id: Integer; def_callback: PCLIENTFUNC; var hdlg: Tads_hdlg): Integer;
function ads_new_positioned_dialog(const dlgname: AnsiString; dcl_id: Integer; def_callback: PCLIENTFUNC; x, y: Integer; var hdlg: Tads_hdlg): Integer;
function ads_start_dialog(hdlg: Tads_hdlg; var status: Integer): Integer;
function ads_term_dialog: Integer;

function ads_action_tile(hdlg: Tads_hdlg; const key: AnsiString; tilefunc: PCLIENTFUNC): Integer;
function ads_done_dialog(hdlg: Tads_hdlg; status: Integer): Integer;
function ads_done_positioned_dialog(hdlg: Tads_hdlg; status: Integer; var x_result, y_result: Integer): Integer;
function ads_set_tile(hdlg: Tads_hdlg; const key, value: AnsiString): Integer;
function ads_client_data_tile(hdlg: Tads_hdlg; const key: AnsiString; var clientdata: Pointer): Integer;
function ads_get_tile(hdlg: Tads_hdlg; const key: AnsiString; var value: AnsiString): Integer; overload;
function ads_get_tile(hdlg: Tads_hdlg; const key: AnsiString; var value: AnsiString; maxlen: Integer): Integer; overload;
function ads_get_attr(hdlg: Tads_hdlg; const key, attr: AnsiString; var value: AnsiString): Integer; overload;
function ads_get_attr(hdlg: Tads_hdlg; const key, attr: AnsiString; var value: AnsiString; len: Integer): Integer; overload;
function ads_get_attr_string(tile: Tads_htile; const attr: AnsiString; var value: AnsiString): Integer; overload;
function ads_get_attr_string(tile: Tads_htile; const attr: AnsiString; var value: AnsiString; len: Integer): Integer; overload;

function ads_start_list(hdlg: Tads_hdlg; const key: AnsiString; operation, index: Smallint): Integer;
function ads_add_list(const item: AnsiString): Integer;
function ads_end_list: Integer;

function ads_mode_tile(hdlg: Tads_hdlg; const key: AnsiString; mode: Smallint): Integer;
function ads_dimensions_tile(hdlg: Tads_hdlg; const key: AnsiString; var cx, cy: Smallint): Integer;

function ads_start_image(hdlg: Tads_hdlg; const key: AnsiString): Integer;
function ads_vector_image(x1, y1, x2, y2, color: Smallint): Integer;
function ads_fill_image(x1, y1, x2, y2, color: Smallint): Integer;
function ads_slide_image(x1, y1, x2, y2: Smallint; const slnam: AnsiString): Integer;
function ads_end_image: Integer;

// ***************************************** ADSLIB.H *****
function acrxUnlockApplication(appId: Pointer): LongBool;
function acrxApplicationIsLocked(const modulename: PChar): LongBool;
function acrxLockApplication(appId: Pointer): LongBool;

// ***************************************** RXCLASS.H *****
function newAcRxClass(const className, parentClassName: PChar; proxyFlags: Integer = 0; pseudoConstructor: PpseudoConstructor = nil; const dxfName: PChar = nil; const appName: PChar = nil): TAcRxClass; overload;
function newAcRxClass(const className, parentClassName: PChar; dwgVer, maintVer: Integer; proxyFlags: Integer = 0; pseudoConstructor: PpseudoConstructor = nil; const dxfName: PChar = nil; const appName: PChar = nil): TAcRxClass; overload;
procedure acrxBuildClassHierarchy;
procedure deleteAcRxClass(pClassObj: TAcRxClass);

// ***************************************** RXDICT.H *****
function acrxSysRegistry: TAcRxDictionary;

// ***************************************** RXREGSVC.H *****
function acrxLoadModule(const moduleName: PChar; printit: LongBool; asCmd: LongBool = False): LongBool;
function acrxLoadApp(const appname: PChar; asCmd: LongBool = False): LongBool;
function acrxUnloadModule(const moduleName: PChar; asCmd: LongBool = False): LongBool;
function acrxUnloadApp(const appName: PChar; asCmd: LongBool = False): LongBool;
function acrxLoadedApps: Pointer;
function acrxProductKey: PChar;
function acrxProductLCID: Cardinal;

function acrxRegisterApp(alr: TAcadApp_LoadReasons; const logicalName, regPath: PChar; regkeyindex: Integer; bDwgU: LongBool = False): TAcadApp_ErrorStatus;
function acrxUnregisterApp(const logicalname: PChar; bDwgU: LongBool = False): TAcadApp_ErrorStatus;
function acrxGetServiceSymbolAddr(serviceName, symbol: PChar): Pointer;
function acrxRegisterService(serviceName: PChar): Pointer;
function acrxServiceIsRegistered(serviceName: PChar): Integer;

// **********************************************************

function ads_queueexpr(const expr: AnsiString): Integer;

// ********************************************************** acdocman.h

function acDocManagerPtr: TAcApDocManager;

// ********************************************************** acedinet.h

function acedCreateShortcut(pvHwndParent: Pointer; const szLinkPath, szObjectPath, szDesc: AnsiString): TAdesk_Boolean;
function acedResolveShortcut(pvHwndParent: Pointer; const szLinkPath: AnsiString; szObjectPath: AnsiString): TAdesk_Boolean;
function acedGetUserFavoritesDir(szFavoritesDir: AnsiString): TAdesk_Boolean;
function acedCreateInternetShortcut(const szURL, szShortcutPath: AnsiString): TAdesk_Boolean;
function acedResolveInternetShortcut(const szLinkFile: AnsiString; szUrl: AnsiString): TAdesk_Boolean;

// ********************************************************** acprofile.h

function acProfileManagerPtr: TAcApProfileManager;

// ********************************************************** actrans.h

function acTransactionManagerPtr: TAcTransactionManager;

// ********************************************************** acutads.h

procedure acad_assert(const Value1, Value2: AnsiString; Value3: Integer);

// ********************************************************** asisys.h

function AsiObjectsInUse: Longint;
function AsiMemoryMalloc(Value1: Cardinal): Pointer;
procedure AsiMemoryFree(Value1: Pointer);
function AsiMemoryRealloc(Value1: Pointer; Value2: Cardinal): Pointer;
function AsiMemoryAddMsg(Value1: Pointer; const Value2: AnsiString): Pointer;

// ********************************************************** dbacis.h

procedure acdbModelerStart;
procedure acdbModelerEnd;
function acdbIsModelerStarted: TAdesk_Boolean;
function acdbAcisSaveEntityToDwgFiler(filer: TAcDbDwgFiler; ent: TENTITY): TAcad_ErrorStatus;
function acdbAcisRestoreEntityFromDwgFiler(filer: TAcDbDwgFiler; var ent: TENTITY): TAcad_ErrorStatus;
//function acdbAcisSaveEntityToDxfFiler(filer: TAcDbDxfFiler; ent: TENTITY): TAcad_ErrorStatus;
//function acdbAcisRestoreEntityFromDxfFiler(filer: TAcDbDxfFiler; var ent: TENTITY): TAcad_ErrorStatus;
procedure acdbAcisSetDeleteBulletins(onOff: TAdesk_Boolean);
function acdbAcisGetDeleteBulletins: TAdesk_Boolean;
procedure acdbAcisDeleteModelerBulletins;

// ********************************************************** dbapserv.h

function getDefaultGlobals: TAcDbGlobals;

// ********************************************************** dbmain.h

function acdbGroupCodeToType(pCode: TAcDb_DxfCode): TAcDb_DwgDataType;
procedure acdbFreeResBufContents(pField: PResbuf);
function acdbIsPersistentReactor(pSomething: Pointer): LongBool;
function acdbPersistentReactorObjectId(pSomething: Pointer): TAcDbObjectId;
function acdbOpenAcDbObject(var pObj: TAcDbObject; id: TAcDbObjectId; mode: TAcDb_OpenMode; openErasedObject: LongBool): TAcad_ErrorStatus;
function acdbOpenAcDbEntity(var pEnt: TAcDbEntity; id: TAcDbObjectId; mode: TAcDb_OpenMode; openErasedEntity: LongBool): TAcad_ErrorStatus;
function acdbGetAdsName(var objName: Pads_name; objId: TAcDbObjectId): TAcad_ErrorStatus;
function acdbGetObjectId(var objId: TAcDbObjectId; const objName: Tads_name): TAcad_ErrorStatus;
function acdbSetReferenced(objId: TAcDbObjectId): TAcad_ErrorStatus;
function acdbActiveDatabaseArray: TAcDbVoidPtrArray;
function acdbLoadMlineStyleFile(const sname, fname: AnsiString): TAcad_ErrorStatus;
function acdbLoadLineTypeFile(const ltname, fname: AnsiString; pDb: TAcDbDatabase): TAcad_ErrorStatus;
function acdbAlloc(Value1: Tsize_t): Pointer;
function acdbAlloc_dbg(ACDBG_FORMAL: Tsize_t): Pointer;
procedure acdbFree(Value1: Pointer);
function acdbSetDefaultAcGiContext(Value1: TAcGiContext): TAcGiContext;
function acdbGetThumbnailBitmapFromDxfFile(const filename: AnsiString; var pBitmap: Pointer): TAcad_ErrorStatus;
function acdbSaveAsR14(pDb: TAcDbDatabase; const filename: AnsiString): TAcad_ErrorStatus;
function acdbSaveAsR13(pDb: TAcDbDatabase; const filename: AnsiString): TAcad_ErrorStatus;
function acdbDxfOutAsR14(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;
function acdbDxfOutAsR13(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;
function acdbDxfOutAsR12(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;

// ********************************************************** lngtrans.h

function acapLongTransactionManagerPtr: TAcApLongTransactionManager;

// ********************************************************** rxregsvc.h

function acrxObjectDBXRegistryKey: AnsiString;

// ********************************************************** xgraph.h

function acedGetCurDwgXrefGraph(var Value1: TAcDbXrefGraph; includeGhosts: TAdesk_Boolean): TAcad_ErrorStatus;

// ********************************************************** rxmfcapi.h

function acedGetAcadWinApp: HWND;
function acedGetAcadDoc: PMCDocument;
function acedGetAcadDwgView: HWND;
function acedGetAcadFrame: PMCMDIFrameWnd;
function acedGetAcadDockCmdLine: HWND;
function acedGetAcadTextCmdLine: HWND;
function acedGetAcadResourceInstance: Longint;
procedure acedCoordFromPixelToWorld(var ptIn: TPOINT; var ptOut: TacedDwgPoint); overload;
function acedCoordFromPixelToWorld(windnum: Integer; ptIn: TPOINT; var ptOut: TacedDwgPoint): LongBool; overload;
function acedCoordFromWorldToPixel(windnum: Integer; ptIn: TacedDwgPoint; var ptOut: TPOINT): LongBool;
function acedGetWinNum(ptx, pty: Integer): Integer;
function acedSetStatusBarProgressMeter(const pszLabel: AnsiString; nMinPos, nMaxPos: Integer): Integer;
function acedSetStatusBarProgressMeterPos(nPos: Integer): Integer;
procedure acedRestoreStatusBar;
function acedRegisterFilterWinMsg(const pfn: PAcedFilterWinMsgFn): LongBool;
function acedRemoveFilterWinMsg(const pfn: PAcedFilterWinMsgFn): LongBool;
function acedRegisterWatchWinMsg(const pfn: PAcedWatchWinMsgFn): LongBool;
function acedRemoveWatchWinMsg(const pfn: PAcedWatchWinMsgFn): LongBool;
function acedGetCurrentColors(var pColorSettings: TAcColorSettings): LongBool;
function acedSetCurrentColors(const pColorSettings: TAcColorSettings): LongBool;
function AcApGetDatabase(pView: TCView): TAcDbDatabase;
function acedGetRegistryCompany: TCString;
function acedRegisterExtendedTab(AppName, DialogName: AnsiString): LongBool;
function acedGetMenu(Alias: AnsiString): HMENU;
function acedIsInputPending: LongBool;

// *************************************************************************: Window Object

function AcadGetIDispatch(AddRef: LongBool): IDispatch;

// ******************************************************************* DelphiARX
// **************************************************************: DelphiARX ORIGNAL. ResBuf Ex.

// --- 規定型をバリアント配列で利用できる型に変換する関数
// --- The function which changes into the type which can use a rule type by the Variant arrangement
// Tads_Point型をバリアント型にする
// It makes Tads_Point type a Variant type.
function APosToVar(const Point: Tads_Point): Longint;
// Tads_Binary型をバリアント型にする
// It makes Tads_Binary type a Variant type.
function ABinToVar(const Binary: Tads_Binary): Longint;
// Tads_Name型をバリアント型にする
// It makes Tads_Name type a Variant type.
function ANameToVar(const Name: Tads_Name): Longint;
// TResBuf型をバリアント型にする
// It makes TResBuf type a Variant type.
function AResBufToVar(const ResBuf: TResBuf): Longint;
// --- darx_GetResValで取得したバリアント値を規定の型に変換する関数
// --- The function which changes the Variant value which was acquired in darx_GetResVal into the type of the rule
// darx_GetResValで取得したResVal値をTads_Pointにする
// It makes the ResVal value which was acquired in darx_GetResVal Tads_Point.
function VarToAPos(const ResVal: Variant): Tads_Point;
// darx_GetResValで取得したResVal値をTads_Binaryにする
// It makes the ResVal value which was acquired in darx_GetResVal Tads_Binary.
function VarToABin(const ResVal: Variant): Tads_Binary;
// darx_GetResValで取得したResVal値をTads_Nameにする
// It makes the ResVal value which was acquired in darx_GetResVal Tads_Name.
function VarToAName(const ResVal: Variant): Tads_Name;
// darx_GetResValで取得したResVal値をTResBuf型にする
// It makes the ResVal value which was acquired in darx_GetResVal TResBuf.
function VarToAResBuf(const ResVal: Variant): TResBuf;

// 文字列をメモリ割り当てして代入する
function darxNewString(const S: AnsiString): PChar;
// 割り当てられたメモリを解放する
function darxFreeString(const S: PChar): PChar;
// 文字列を再割り当てする
function darxRenewString(const oldS: PChar; const S: AnsiString): PChar;
// PChar型文字列をString型で返す
function darxPString(const S: PChar): AnsiString;

// 文字列をメモリ割り当てして代入する
function NewString(const S: AnsiString): PChar;
// 割り当てられたメモリを解放する
function FreeString(const S: PChar): PChar;
// 文字列を再割り当てする
function RenewString(const oldS: PChar; const S: AnsiString): PChar;

// リザルトバッファ操作
// 型不明のResTypeからリザルトコードを得る(RTERRORでコード異常)
function darxGetResCode(const ResType: Variant): Smallint;
// 指定のリザルトタイプがどの型かを返す(0=EOF,RTDXF0=uvString)
function darxGetResType(const ResType: Integer): TResbufTypes;
// リザルトバッファに指定するResTypeでResValデータを適切なメモリ確保をして入れる
function darxResCopy(const ResBuf: PResbuf; const ResType: SmallInt; const ResVal: Variant): TResbufTypes;
// 指定のリザルトバッファのResTypeから適切なデータを得る
function darxGetResVal(const ResBuf: PResbuf; var ResVal: Variant): TResbufTypes;

// リザルトバッファに１つ目のデータをセットする
function darxTreeFirstSet(const ResType: Smallint; const ResVal: Variant; var ResBufTree: TResBufTree): Boolean;
// リザルトバッファに次のデータをセットする
function darxTreeNextSet(const ResType: Smallint; const ResVal: Variant; var ResBufTree: TResBufTree): Boolean;
// リザルトバッファに終了コードをセットする
function darxTreeEofSet(var ResBufTree: TResBufTree): Boolean;

// 指定のＡＲＸがロードされているかチェック
function darxIsLoadedArx(const ArxFileName: AnsiString): Boolean;
// Renews the command line.
// AutoCADを更新する
procedure darxAcadUpDate;
// Confirms whether or not it may access AutoCAD.
// AutoCADへアクセスをしてよいか確認する
function darxIsAccess: Boolean;
// AutoCAD上でメッセージダイアログを実行する
function darxMessageBox(szText, szTitle: AnsiString; fuStyle: Cardinal): Integer;
// 日本語環境であるかテストする
function darxIsJapanese: Boolean;
// Windows98対応 SetForeGroundWindow
function darxWinFocus(const Handle: HWND): Boolean;
// Application.ProcessMessages と同じイベント応答
procedure darxProcessMessages;
// Stands by until the present process becomes an idle condition.
// 現在のプロセスがアイドル状態になるまで待機する
procedure darxWaitIdle;
// AutoCADのコマンドラインへ文字列を外部から送信
function darxInterCommand(const Str: AnsiString): LongBool;

// AcRxObjectと子クラスのオブジェクト解放
procedure deleteRxObj(const vcObject: TAcRxObject);

implementation

uses
  DArxLib, AextCLib, AextCObj;

// ***************************************** ACUTMEM.H *****

function acutNewBuffer(var pOutput: PChar; size: Tsize_t): TAcad_ErrorStatus;
begin
  Result := extern_acutNewBuffer(pOutput, size);
end;

function acutNewString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
begin
  Result := extern_acutNewString(pInput, pOutput);
end;

function acutUpdString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
begin
  Result := extern_acutUpdString(pInput, pOutput);
end;

procedure acutDelString(var pString: PChar);
begin
  extern_acutDelString(pString);
end;

procedure acutDelBuffer(var pString: PChar);
begin
  extern_acutDelBuffer(pString);
end;

// ***************************************** ADSTEXT.H *****

function acadErrorStatusText(errno: TAcad_ErrorStatus): AnsiString;
begin
  Result := extern_darxPString(extern_acadErrorStatusText(errno));
end;

function acdbServices: Pointer;
begin
  Result := extern_acdbServices;
end;

// ***************************************** ACED.H *****

function acedCmdLookup(const cmdStr: AnsiString; globalLookup: Integer; retStruc: Pointer; skipUndef: LongBool = False): Integer;
begin
  Result := extern_acedCmdLookup(PChar(cmdStr), globalLookup, retStruc, skipUndef);
end;

function acedCmdLookup2(const cmdStr: AnsiString; globalLookup: Integer; recStruc: Pointer; sf: Integer = ACRX_CMD_DEFUN): Integer;
begin
  Result := extern_acedCmdLookup2(PChar(cmdStr), globalLookup, recStruc, sf);
end;

function acedCmdUndefine(const cmdStr: AnsiString; undefIt: Integer): Integer;
begin
  Result := extern_acedCmdUndefine(PChar(cmdStr), undefIt);
end;

function acedPopCommandDirectory(const cmdDirName: AnsiString): Integer;
begin
  Result := extern_acedPopCommandDirectory(PChar(cmdDirName));
end;

function acedGetCommandForDocument(pDoc: TAcApDocument; var pGlobalCmdName: AnsiString): TAcad_ErrorStatus;
var
  pBuf: PChar;
begin
  pBuf := nil;
  Result := extern_acedGetCommandForDocument(pdoc, pBuf);
  pGlobalCmdName := extern_darxPString(pBuf);
end;

function acedSetOLELock(handle, flags: Integer): TAdesk_Boolean;
begin
  Result := TAdesk_Boolean(extern_acedSetOLELock(handle, flags));
end;

function acedClearOLELock(handle: Integer): TAdesk_Boolean;
begin
  Result := TAdesk_Boolean(extern_acedClearOLELock(handle));
end;

function acedPostCommand(const pCmd: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedPostCommand(PChar(pCmd));
end;

procedure acedPostCommandPrompt;
begin
  extern_acedPostCommandPrompt;
end;

procedure acedUpdateDisplay;
begin
  extern_acedUpdateDisplay;
end;

// ***************************************** ADS.H *****

procedure acrx_abort(const format: array of AnsiString);
begin
  extern_acrx_abort(format);
end;

function acedGetAppName: AnsiString;
begin
  Result := extern_darxPString(extern_acedGetAppName);
end;

function acedUpdate(vport: Integer; p1, p2: Tads_point): Integer;
begin
  Result := extern_acedUpdate(vport, @p1, @p2);
end;

function acedSetFunHelp(const pszFunctionName, pszHelpfile, pszTopic: AnsiString; iCmd: Integer): Integer;
begin
  Result := extern_acedSetFunHelp(PChar(pszFunctionName), PChar(pszHelpfile), PChar(pszTopic), iCmd);
end;

function acedGetFullInput(var pStr: AnsiString): Integer;
var
  pBuf: PChar;
begin
  pBuf := nil;
  Result := extern_acedGetFullInput(pBuf);
  pStr := extern_darxPString(pBuf);
end;

function acedGetFullKword(const pString: AnsiString; var pStr: AnsiString): Integer;
var
  pBuf: PChar;
begin
  Result := extern_acedGetFullKword(PChar(pString), pBuf);
  pStr := extern_darxPString(pBuf);
end;

function acedGetFullString(cronly: Integer; const pString: AnsiString; var pResult: AnsiString): Integer;
var
  pBuf: PChar;
begin
  Result := extern_acedGetFullString(cronly, PChar(pString), pBuf);
  pResult := extern_darxPString(pBuf);
end;

// ***********************************************************************: Memory Function

function acad_malloc(const sz: Cardinal): Pointer;
begin
  Result := extern_acad_malloc(sz);
end;

procedure acad_free(var p: Pointer);
begin
  if p = nil then exit;
  extern_acad_free(p);
  p := nil;
end;

function acad_msize(const p: Pointer): Cardinal;
begin
  if p = nil then Result := 0 else Result := extern_acad_msize(p);
end;

function acad_realloc(const p: Pointer; const ns: Cardinal): Pointer;
begin
  Result := extern_acad_realloc(p, ns);
end;

function acad_calloc(sz1, sz2: Cardinal): Pointer;
begin
  Result := extern_acad_calloc(sz1, sz2);
end;

function acad_strdup(const p: PChar): PChar;
begin
  Result := extern_acad_strdup(p);
end;

function acutNewRb(const v: Integer): PResbuf;
begin
  Result := extern_acutNewRb(v);
end;

function acutNewRb(const IntType: Integer; const Value: Longint): PResbuf;
begin
  Result := extern_darxNewRbInt(IntType, Value);
end;

function acutNewRb(const RealType: Integer; const Value: Tads_real): PResbuf;
begin
  Result := extern_darxNewRbReal(RealType, Value);
end;

function acutNewRb(const StrType: Integer; const Value: PChar): PResbuf;
begin
  Result := extern_darxNewRbStr(StrType, Value);
end;

function acutNewRb(const PosType: Integer; const Value: Tads_point): PResbuf;
begin
  Result := extern_darxNewRbPos(PosType, Value);
end;

function acutNewRb(const NameType: Integer; const Value: Tads_name): PResbuf;
begin
  Result := extern_darxNewRbName(NameType, Value);
end;

function acutNewRb(const BinType: Integer; const Value: Tads_binary): PResbuf;
begin
  Result := extern_darxNewRbBin(BinType, Value);
end;

function acutNewrbVal(const ResType: Smallint; const ResVal: Variant): PResbuf;
begin
  Result := extern_darxNewrbVal(ResType, ResVal);
end;

function acutRelRb(var rb: PResbuf): Integer;
begin
  Result := RTNORM;
  if rb = nil then exit;
  Result := extern_acutRelRb(rb);
  if Result = RTNORM then rb := nil;
end;

function acutBuildList(const rtype: array of Variant): PResbuf;
begin
  Result := extern_acutBuildList(rType);
end;

function acedUsrBrk: Integer;
begin
  Result := extern_acedUsrBrk;
end;

function acedCmd(const rbp: PResbuf): Integer;
begin
  Result := extern_acedCmd(rbp);
end;

function acedCommand(rtype: array of Variant): Integer;
begin
  Result := extern_acedCommand(rtype);
  extern_darxAcadUpDate;
end;

procedure acdbFail(const str: AnsiString);
begin
  extern_acdbFail(PChar(str));
end;

function adsw_acadMainWnd: HWND;
begin
  Result := extern_adsw_acadMainWnd;
end;

function adsw_acadDocWnd: HWND;
begin
  Result := extern_adsw_acadDocWnd;
end;

function acedDefun(const sname: AnsiString; const funcno: Smallint): Integer;
begin
  Result := extern_acedDefun(PChar(sname), funcno)
end;

function acedUndef(const sname: AnsiString; const funcno: Smallint): Integer;
begin
  Result := extern_acedUndef(PChar(sname), funcno)
end;

function acedGetFunCode: Integer;
begin
  Result := extern_acedGetFunCode
end;

function acedGetArgs: PResbuf;
begin
  Result := extern_acedGetArgs
end;

function acedRegFunc(const fhdl: PfuncPointer; const fcode: Integer): Integer;
begin
  Result := extern_acedRegFunc(fhdl, fcode)
end;

function acedInvoke(const args: PResbuf; var retbuf: PResbuf): Integer;
begin
  Result := extern_acedInvoke(Args, retbuf)
end;

function acedArxLoaded: PResbuf;
begin
  Result := extern_acedArxLoaded
end;

function acedArxLoad(const app: AnsiString): Integer;
begin
  Result := extern_acedArxLoad(PChar(app))
end;

function acedArxUnload(const app: AnsiString): Integer;
begin
  Result := extern_acedArxUnload(PCHar(app))
end;

function acedRetList(const rbuf: PResbuf): Integer;
begin
  Result := extern_acedRetList(rbuf);
end;

function acedRetVal(const rbuf: PResbuf): Integer;
begin
  Result := extern_acedRetVal(rbuf);
end;

function acedRetPoint(const pt: Tads_Point): Integer;
begin
  Result := extern_acedRetPoint(@pt);
end;

function acedRetStr(const s: AnsiString): Integer;
begin
  Result := extern_acedRetStr(PChar(s));
end;

function acedRetName(const aname: Tads_Name; const ntype: Integer): Integer;
begin
  Result := extern_acedRetName(@aname, ntype);
end;

function acedRetInt(const ival: Integer): Integer;
begin
  Result := extern_acedRetInt(ival);
end;

function acedRetLong(const lval: Longint): Integer;
begin
  Result := extern_darxRetLong(lval);
end;

function acedRetReal(const rval: Tads_Real): Integer;
begin
  Result := extern_acedRetReal(rval);
end;

function acedRetT: Integer;
begin
  Result := extern_acedRetT;
end;

function acedRetNil: Integer;
begin
  Result := extern_acedRetNil;
end;

function acedRetVoid: Integer;
begin
  Result := extern_acedRetVoid;
end;

function acdbEntDel(const ent: Tads_Name): Integer;
begin
  Result := extern_acdbEntDel(@ent);
end;

function acdbEntGetX(const ent: Tads_Name; const args: PResbuf): PResbuf;
begin
  Result := extern_acdbEntGetX(@ent, args);
end;

function acdbEntGet(const ent: Tads_Name): PResbuf;
begin
  Result := extern_acdbEntGet(@ent);
end;

function acdbEntLast(var ent: Tads_Name): Integer;
begin
  Result := extern_acdbEntLast(@ent);
end;

function acdbEntFirst(var entres: Tads_Name): Integer;
begin
  Result := extern_acdbEntNext(nil, @entres);
end;

function acdbEntNext(const ent: Tads_Name; var entres: Tads_Name): Integer;
begin
  if acdbNameNil(ent) then
    Result := extern_acdbEntNext(nil, @entres)
  else
    Result := extern_acdbEntNext(@ent, @entres);
end;

function acdbEntUpd(const ent: Tads_Name): Integer;
begin
  Result := extern_acdbEntUpd(@ent);
end;

function acdbEntMod(const ent: PResbuf): Integer;
begin
  Result := extern_acdbEntMod(ent);
end;

function acdbEntMake(const ent: PResbuf): Integer;
begin
  Result := extern_acdbEntMake(ent);
end;

function acdbEntMakeX(const entm: PResbuf; var entres: Tads_Name): Integer;
begin
  Result := extern_acdbEntMakeX(entm, @entres);
end;

function acedEntSel(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point): Integer;
begin
  Result := extern_acedEntSel(PChar(str), @entres, @ptres);
end;

function acedNEntSel(const str: AnsiString; var entres: Tads_name; var ptres: Tads_point; var xformres4: Tads_point4; var refstkres: PResbuf): Integer;
begin
  Result := extern_acedNEntSel(PChar(str), @entres, @ptres, @xformres4, refstkres);
end;

function acedNEntSelP(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point; const pickflag: Boolean; var xformres: Tads_Matrix; var refstkres: PResbuf): Integer;
begin
  Result := extern_acedNEntSelP(PChar(str), @entres, @ptres, pickflag, @xformres, refstkres);
end;

function acedSSGet(const str: AnsiString; const pt1, pt2: Pointer; const filter: PResbuf; var ss: Tads_Name): Integer;
begin
  Result := extern_acedSSGet(PChar(Str), pt1, pt2, filter, @ss);
end;

function acedSSGetFirst(var grip_set, pickfirst_set: PResbuf): Integer;
begin
  Result := extern_acedSSGetFirst(grip_set, pickfirst_set);
end;

function acedSSSetFirst(const grip_set, pickfirst_set: Tads_name): Integer;
begin
  Result := extern_acedSSSetFirst(@grip_set, @pickfirst_set);
end;

function acedSSFree(var sname: Tads_Name): Integer;
begin
  Result := extern_acedSSFree(@sname);
end;

function acedSSLength(const sname: Tads_Name; var len: Longint): Integer;
begin
  Result := extern_acedSSLength(@sname, @len);
end;

function acedSSAdd(const ename, sname: Pads_Name; var entres: Tads_Name): Integer;
begin
  Result := extern_acedSSAdd(ename, sname, @entres);
end;

function acedSSDel(const ename, ss: Tads_Name): Integer;
begin
  Result := extern_acedSSDel(@ename, @ss);
end;

function acedSSMemb(const ename, ss: Tads_Name): Integer;
begin
  Result := extern_acedSSMemb(@ename, @ss);
end;

function acedSSName(const ss: Tads_Name; const i: Longint; var entres: Tads_Name): Integer;
begin
  Result := extern_acedSSName(@ss, i, @entres);
end;

function acedSSNameX(var rbpp: PResbuf; const ss: Tads_Name; const i: Longint): Integer;
begin
  Result := extern_acedSSNameX(rbpp, @ss, i);
end;

function acedSSGetKwordCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
begin
  Result := extern_acedSSGetKwordCallbackPtr(pFunc);
end;

function acedSSSetKwordCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
begin
  Result := extern_acedSSSetKwordCallbackPtr(pFunc);
end;

function acedSSGetOtherCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
begin
  Result := extern_acedSSGetOtherCallbackPtr(pFunc);
end;

function acedSSSetOtherCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
begin
  Result := extern_acedSSSetOtherCallbackPtr(pFunc);
end;

function acdbXdRoom(const ent: Tads_name; var longres: Longint): Integer;
begin
  Result := extern_acdbXdRoom(@ent, @longres);
end;

function acdbXdSize(const rb: PResbuf; var longres: Longint): Integer;
begin
  Result := extern_acdbXdSize(rb, @longres);
end;

function acdbTblNext(const tblname: AnsiString; rewind: Integer): PResbuf;
begin
  Result := extern_acdbTblNext(PChar(tblname), rewind);
end;

function acdbTblSearch(const tblname, sym: AnsiString; setnext: Integer): PResbuf;
begin
  Result := extern_acdbTblSearch(PChar(tblname), PChar(sym), setnext);
end;

function acdbNamedObjDict(var nameres: Tads_name): Integer;
begin
  Result := extern_acdbNamedObjDict(@nameres);
end;

function acdbDictSearch(const dict: Tads_name; const sym: AnsiString; setnext: Integer): PResbuf;
begin
  Result := extern_acdbDictSearch(@dict, PChar(sym), setnext);
end;

function acdbDictNext(const dict: Tads_name; rewind: Integer): PResbuf;
begin
  Result := extern_acdbDictNext(@dict, rewind);
end;

function acdbDictRename(const dictname: Tads_name; const oldsym, newsym: AnsiString): Integer;
begin
  Result := extern_acdbDictRename(@dictname, PChar(oldsym), PChar(newsym));
end;

function acdbDictRemove(const dictname: Tads_name; const symname: AnsiString): Integer;
begin
  Result := extern_acdbDictRemove(@dictname, PChar(symname));
end;

function acdbDictAdd(const dictname: Tads_name; const symname: AnsiString; const newobj: Tads_name): Integer;
begin
  Result := extern_acdbDictAdd(@dictname, PChar(symname), @newobj);
end;

function acdbTblObjName(const tblname, sym: AnsiString; var nameres: Tads_name): Integer;
begin
  Result := extern_acdbTblObjName(PChar(tblname), PChar(sym), @nameres);
end;

function acdbHandEnt(const handle: AnsiString; var entres: Tads_Name): Integer;
begin
  Result := extern_acdbHandEnt(PChar(Handle), @entres);
end;

function acedTrans(const pt: Tads_Point; const rfrom, rto: PResbuf; const disp: Boolean; var posres: Tads_Point): Integer;
var
  iBuf: Integer;
begin
  if disp then iBuf := 1 else iBuf := 0;
  Result := extern_acedTrans(@pt, rfrom, rto, iBuf, @posres);
end;

function acdbAngToS(v: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acdbAngToS(v, iunit, prec, PChar(@pBuf[0]));
  if pBuf[0] = #0 then str := '' else str := extern_darxPString(PChar(@pBuf[0]));
end;

function acutCvUnit(value: Tads_real; const oldunit, newunit: AnsiString; var realres: Tads_real): Integer;
begin
  Result := extern_acutCvUnit(value, PChar(oldunit), PChar(newunit), @realres);
end;

function acutWcMatch(const str, pattern: AnsiString): Integer;
begin
  Result := extern_acutWcMatch(PChar(str), PChar(pattern));
end;

function acdbRToS(val: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acdbRToS(val, iunit, prec, PChar(@pBuf[0]));
  if pBuf[0] = #0 then str := '' else str := extern_darxPString(PChar(@pBuf[0]));
end;

function acdbAngToF(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
begin
  Result := extern_acdbAngToF(PChar(str), iunit, @v);
end;

function acdbDisToF(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
begin
  Result := extern_acdbDisToF(PChar(str), iunit, @v);
end;

function acedSetVar(const sym: AnsiString; const resbuf: PResbuf): Integer;
begin
  Result := extern_acedSetVar(PChar(sym), resbuf);
end;

function acedSetVar(const sym: AnsiString; const StrRes: AnsiString): Integer;
begin
  Result := extern_darxSetVarStr(PChar(sym), PChar(StrRes));
end;

function acedSetVar(const sym: AnsiString; const RealRes: Tads_Real): Integer;
begin
  Result := extern_darxSetVarReal(PChar(sym), RealRes);
end;

function acedSetVarReal(const sym: AnsiString; const RealRes: Tads_Real): Integer;
begin
  Result := extern_darxSetVarReal(PChar(sym), RealRes);
end;

function acedSetVar(const sym: AnsiString; const LongRes: Longint): Integer;
begin
  Result := extern_darxSetVarLong(PChar(sym), LongRes);
end;

function acedInitGet(val: Integer; const kwl: AnsiString): Integer;
begin
  Result := extern_acedInitGet(val, PChar(kwl));
end;

function acedGetSym(const sname: AnsiString; var value: PResbuf): Integer;
begin
  Result := extern_acedGetSym(PChar(sname), value);
end;

function acedPutSym(const sname: AnsiString; const value: PResbuf): Integer;
begin
  Result := extern_acedPutSym(PChar(sname), value);
end;

function acedHelp(szFilename, szTopic: AnsiString; iCmd: Integer): Integer;
begin
  Result := extern_acedHelp(PChar(szFilename), PChar(szTopic), iCmd);
end;

function acutPrintf(const strformat: AnsiString): Integer;
begin
  Result := extern_acutPrintf(PChar(strformat));
  extern_darxAcadUpDate;
end;

function acutPrintf(const strformat: AnsiString; const args: array of const): Integer;
begin
  Result := extern_acutPrintf(PChar(strformat), args);
  extern_darxAcadUpDate;
end;

function acdbInters(const from1, to1, from2, to2: Tads_point; teston: Integer; var posres: Tads_point): Integer;
begin
  Result := extern_acdbInters(@from1, @to1, @from2, @to2, teston, @posres);
end;

function acedGetVar(const sym: AnsiString; var retbuf: PResbuf): Integer;
begin
  Result := extern_acedGetVar(PChar(sym), retbuf);
end;

function acedGetVar(const sym: AnsiString; var StrRes: AnsiString): Integer;
begin
  Result := extern_darxGetVarStr(PChar(sym), StrRes);
end;

function acedGetVar(const sym: AnsiString; var RealRes: Tads_Real): Integer;
begin
  Result := extern_darxGetVarReal(PChar(sym), RealRes);
end;

function acedGetVar(const sym: AnsiString; var LongRes: Longint): Integer;
begin
  Result := extern_darxGetVarLong(PChar(sym), LongRes);
end;

function acedFindFile(const fname: AnsiString; var fileres: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acedFindFile(PChar(fname), pBuf);
  if pBuf[0] = #0 then fileres := '' else fileres := extern_darxPString(PChar(@pBuf[0]));
end;

function acedGetEnv(const sym: AnsiString; var val: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acedGetEnv(PChar(sym), pBuf);
  if pBuf[0] = #0 then val := '' else val := extern_darxPString(PChar(@pBuf[0]));
end;

function acedSetEnv(const sym, val: AnsiString): Integer;
begin
  Result := extern_acedSetEnv(PChar(sym), PChar(val));
end;

function acedGetCfg(const sym: AnsiString; var val: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acedGetCfg(PChar(sym), PChar(@pBuf[0]), RESULTLENMAX);
  if pBuf[0] = #0 then val := '' else val := extern_darxPString(PChar(@pBuf[0]));
end;

function acedGetCfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer;
var
  pBuf: PChar;
begin
  Result := RTERROR;
  val := '';
  if 0 >= len then exit;
  pBuf := extern_acad_malloc(len + 1);
  if pBuf = nil then exit;
  try
    pBuf^ := #0;
    Result := extern_acedGetCfg(PChar(sym), pBuf, len);
    if pBuf^ <> #0 then val := extern_darxPString(pBuf);
  finally
    extern_acad_free(pBuf);
  end;
end;

function acedSetCfg(const sym, val: AnsiString): Integer;
begin
  Result := extern_acedSetCfg(PChar(sym), PChar(val));
end;

function acdbSNValid(const tbstr: AnsiString; pipetest: Integer): Integer;
begin
  Result := extern_acdbSNValid(PChar(tbstr), pipetest);
end;

function acdbXStrSave(const pSource: AnsiString; var pDest: AnsiString): AnsiString;
var
  pRes, pBuf: PChar;
begin
  pBuf := nil;
  pRes := extern_acdbXStrSave(PChar(pSource), pBuf);
  if pBuf = nil then pDest := '' else pDest := extern_darxPString(pBuf);
  if pRes = nil then Result := '' else Result := extern_darxPString(pRes);
end;

function acdbXStrCase(str: AnsiString): Integer;
begin
  Result := extern_acdbXStrCase(PChar(str));
end;

function acedGetString(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString): Integer;
var
  nBuf: Integer;
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  if cronly then nBuf := 1 else nBuf := 0;
  Result := extern_acedGetString(nBuf, PChar(prompt), PChar(@pBuf[0]));
  if pBuf[0] = #0 then strres := '' else strres := extern_darxPString(PChar(@pBuf[0]));
end;

function acedGetStringB(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString; bufsize: Integer): Integer;
var
  nBuf: Integer;
  pBuf: PChar;
begin
  Result := RTERROR;
  if 0 >= bufsize then exit;
  if cronly then nBuf := 1 else nBuf := 0;
  pBuf := extern_acad_malloc(bufsize + 1);
  if pBuf = nil then exit;
  try
    if strres = '' then pBuf^ := #0 else strLCopy(pBuf, PChar(strres), bufsize);
    Result := extern_acedGetStringB(nBuf, PChar(prompt), pBuf, bufsize);
    if pBuf^ = #0 then strres := '' else strres := extern_darxPString(pBuf);
  finally
    extern_acad_free(pBuf);
  end;
end;

function acedMenuCmd(const str: AnsiString): Integer;
begin
  Result := extern_acedMenuCmd(PChar(str));
  extern_darxAcadUpDate;
end;

function acedPrompt(const str: AnsiString): Integer;
begin
  Result := extern_acedPrompt(PChar(Str));
  extern_darxAcadUpDate;
end;

function acedAlert(const str: AnsiString): Integer;
begin
  Result := extern_acedAlert(PChar(str));
end;

function acdbRegApp(const appname: AnsiString): Integer;
begin
  Result := extern_acdbRegApp(PChar(appname));
end;

function acedGetAngle(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetAngle(pt, PChar(prompt), @realres);
end;

function acedGetAngle(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetAngle(@pt, PChar(prompt), @realres);
end;

function acedGetCorner(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := extern_acedGetCorner(pt, PChar(prompt), @posres);
end;

function acedGetCorner(const pt: Tads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := extern_acedGetCorner(@pt, PChar(prompt), @posres);
end;

function acedGetDist(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetDist(pt, PChar(prompt), @realres);
end;

function acedGetDist(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetDist(@pt, PChar(prompt), @realres);
end;

function acedGetOrient(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetOrient(pt, PChar(prompt), @realres);
end;

function acedGetOrient(const pt: Tads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetOrient(@pt, PChar(prompt), @realres);
end;

function acedGetPoint(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := extern_acedGetPoint(pt, PChar(prompt), @posres);
end;

function acedGetPoint(const Pt: Tads_Point; const Prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := extern_acedGetPoint(@Pt, PChar(prompt), @posres);
end;

function acedGetInt(const prompt: AnsiString; var intres: Integer): Integer;
begin
  Result := extern_acedGetInt(PChar(prompt), @intres);
end;

function acedGetKword(const prompt: AnsiString; var kwordres: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acedGetKword(PChar(prompt), PChar(@pBuf[0]));
  if pBuf[0] = #0 then kwordres := '' else kwordres := extern_darxPString(PChar(@pBuf[0]));
end;

function acedGetReal(const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := extern_acedGetReal(PChar(prompt), @realres);
end;

function acedGetInput(var str: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_acedGetInput(PChar(@pBuf[0]));
  if pBuf[0] = #0 then str := '' else str := extern_darxPString(PChar(@pBuf[0]));
end;

function acedVports(var vlist: PResbuf): Integer;
begin
  Result := extern_acedVports(vlist);
end;

function acedTextScr: Integer;
begin
  Result := extern_acedTextScr;
end;

function acedGraphScr: Integer;
begin
  Result := extern_acedGraphScr;
end;

function acedTextPage: Integer;
begin
  Result := extern_acedTextPage;
end;

function acedRedraw(const ent: Tads_name; mode: Integer): Integer; overload;
begin
  Result := extern_acedRedraw(@ent, mode);
end;

function acedRedraw(const ent: Pads_name; mode: Integer): Integer; overload;
begin
  Result := extern_acedRedraw(ent, mode);
end;

function acedOsnap(const pt: Tads_point; const mode: AnsiString; var posres: Tads_point): Integer;
begin
  Result := extern_acedOsnap(@pt, PChar(mode), @posres);
end;

function acedGrRead(track: Integer; var itype: Integer; var retbuf: PResbuf): Integer;
begin
  Result := extern_acedGrRead(track, @itype, retbuf);
end;

function acedGrText(box: Integer; const text: AnsiString; hl: Integer): Integer;
begin
  Result := extern_acedGrText(box, PChar(text), hl);
end;

function acedGrDraw(const from1, to1: Tads_point; color: Integer; hl: Boolean): Integer;
var
  iHl: Integer;
begin
  if hl then iHl := 1 else iHl := 0;
  Result := extern_acedGrDraw(from1, to1, color, iHl);
end;

function acedGrVecs(const vlist: PResbuf; mat: Tads_matrix): Integer; overload;
begin
  Result := extern_acedGrVecs(vlist, @mat);
end;

function acedGrVecs(const vlist: PResbuf; mat: Pads_matrix): Integer; overload;
begin
  Result := extern_acedGrVecs(vlist, mat);
end;

function acedXformSS(const ssname: Tads_Name; genmat: Tads_Matrix): Integer;
begin
  Result := extern_acedXformSS(ssname, @genmat);
end;

function acedDragGen(const ss: Tads_Name; const pmt: AnsiString; cursor: Integer; scnf: PDragGenScnfPtr; var p: Tads_Point): Integer;
begin
  Result := extern_acedDragGen(ss, PChar(pmt), cursor, scnf, @p);
end;

function acedSetView(const view: PResbuf; vport: Integer): Integer;
begin
  Result := extern_acedSetView(view, vport);
end;

function acedSyncFileOpen(const FileToOpen: AnsiString): Integer;
begin
  Result := extern_acedSyncFileOpen(PChar(FileToOpen));
end;

function acutAngle(const pt1, pt2: Tads_point): Tads_real;
begin
  Result := extern_acutAngle(@pt1, @pt2);
end;

function acutDistance(const pt1, pt2: Tads_point): Tads_real;
begin
  Result := extern_acutDistance(@pt1, @pt2);
end;

procedure acutPolar(const pt: Tads_point; angle, dist: Tads_real; var ptres: Tads_point);
begin
  extern_acutPolar(@pt, angle, dist, @ptres);
end;

function acedGetFileD(const title, defawlt, ext: AnsiString; const flags: Integer; var resbuf: PResbuf): Integer;
begin
  Result := extern_acedGetFileD(PChar(title), PChar(defawlt), PChar(ext), Flags, resbuf);
end;

function acedGetFileDialog(const title, defawlt, ext: AnsiString; const flags: Integer; var FileName: AnsiString): Integer;
begin
  Result := extern_acedGetFileDialog(PChar(title), PChar(defawlt), PChar(ext), Flags, FileName);
end;

function acedTextBox(const args: PResbuf; var pt1, pt2: Tads_point): Integer;
begin
  Result := extern_acedTextBox(args, @pt1, @pt2);
end;

function acedTablet(const args: PResbuf; var retbuf: PResbuf): Integer;
begin
  Result := extern_acedTablet(args, retbuf);
end;

function acutIsAlpha(c: Char): LongBool;
begin
  Result := extern_acutIsAlpha(c);
end;

function acutIsUpper(c: Char): LongBool;
begin
  Result := extern_acutIsUpper(c);
end;

function acutIsLower(c: Char): LongBool;
begin
  Result := extern_acutIsLower(c);
end;

function acutIsDigit(c: Char): LongBool;
begin
  Result := extern_acutIsDigit(c);
end;

function acutIsXDigit(c: Char): LongBool;
begin
  Result := extern_acutIsXDigit(c);
end;

function acutIsSpace(c: Char): LongBool;
begin
  Result := extern_acutIsSpace(c);
end;

function acutIsPunct(c: Char): LongBool;
begin
  Result := extern_acutIsPunct(c);
end;

function acutIsAlNum(c: Char): LongBool;
begin
  Result := extern_acutIsAlNum(c);
end;

function acutIsPrint(c: Char): LongBool;
begin
  Result := extern_acutIsPrint(c);
end;

function acutIsGraph(c: Char): LongBool;
begin
  Result := extern_acutIsGraph(c);
end;

function acutIsCntrl(c: Char): LongBool;
begin
  Result := extern_acutIsCntrl(c);
end;

function acutToUpper(c: Char): Char;
begin
  Result := extern_acutToUpper(c);
end;

function acutToLower(c: Char): Char;
begin
  Result := extern_acutToLower(c);
end;

function acedGetCName(const cmd: AnsiString; var strres: AnsiString): Integer;
var
  pBuf: PChar;
begin
  pBuf := nil;
  Result := extern_acedGetCName(PChar(cmd), pBuf);
  strres := extern_darxPString(pBuf);
end;

function acedFNSplit(const pathToSplit, prebuf, namebuf, extbuf: PChar): Integer;
begin
  Result := extern_acedFNSplit(pathToSplit, prebuf, namebuf, extbuf);
end;

// ***************************************** ADSDLG.H *****

function ads_load_dialog(const dclfile: AnsiString; var dcl_id: Integer): Integer;
begin
  Result := extern_ads_load_dialog(PChar(dclfile), @dcl_id);
end;

function ads_unload_dialog(dcl_id: Integer): Integer;
begin
  Result := extern_ads_unload_dialog(dcl_id);
end;

function ads_new_dialog(const dlgname: AnsiString; dcl_id: Integer; def_callback: PCLIENTFUNC; var hdlg: Tads_hdlg): Integer;
begin
  Result := extern_ads_new_dialog(PChar(dlgname), dcl_id, def_callback, @hdlg);
end;

function ads_new_positioned_dialog(const dlgname: AnsiString; dcl_id: Integer; def_callback: PCLIENTFUNC; x, y: Integer; var hdlg: Tads_hdlg): Integer;
begin
  Result := extern_ads_new_positioned_dialog(PChar(dlgname), dcl_id, def_callback, x, y, @hdlg);
end;

function ads_start_dialog(hdlg: Tads_hdlg; var status: Integer): Integer;
begin
  Result := extern_ads_start_dialog(hdlg, @status);
end;

function ads_term_dialog: Integer;
begin
  Result := extern_ads_term_dialog;
end;

function ads_action_tile(hdlg: Tads_hdlg; const key: AnsiString; tilefunc: PCLIENTFUNC): Integer;
begin
  Result := extern_ads_action_tile(hdlg, PChar(key), tilefunc);
end;

function ads_done_dialog(hdlg: Tads_hdlg; status: Integer): Integer;
begin
  Result := extern_ads_done_dialog(hdlg, status);
end;

function ads_done_positioned_dialog(hdlg: Tads_hdlg; status: Integer; var x_result, y_result: Integer): Integer;
begin
  Result := extern_ads_done_positioned_dialog(hdlg, status, @x_result, @y_result);
end;

function ads_set_tile(hdlg: Tads_hdlg; const key, value: AnsiString): Integer;
begin
  Result := extern_ads_set_tile(hdlg, PChar(key), PChar(value));
end;

function ads_client_data_tile(hdlg: Tads_hdlg; const key: AnsiString; var clientdata: Pointer): Integer;
begin
  Result := extern_ads_client_data_tile(hdlg, PChar(key), @clientdata);
end;

function ads_get_tile(hdlg: Tads_hdlg; const key: AnsiString; var value: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_ads_get_tile(hdlg, PChar(key), PChar(@pBuf[0]), RESULTLENMAX);
  if pBuf[0] = #0 then value := '' else value := extern_darxPString(PChar(@pBuf[0]));
end;

function ads_get_tile(hdlg: Tads_hdlg; const key: AnsiString; var value: AnsiString; maxlen: Integer): Integer;
var
  pBuf: PChar;
begin
  Result := RTERROR;
  value := '';
  if 0 >= maxlen then exit;
  pBuf := extern_acad_malloc(maxlen + 1);
  if pBuf = nil then exit;
  try
    pBuf^ := #0;
    Result := extern_ads_get_tile(hdlg, PChar(key), pBuf, maxlen);
    if pBuf^ <> #0 then value := extern_darxPString(pBuf);
  finally
    extern_acad_free(pBuf);
  end;
end;

function ads_get_attr(hdlg: Tads_hdlg; const key, attr: AnsiString; var value: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_ads_get_attr(hdlg, PChar(key), PChar(attr), PChar(@pBuf[0]), RESULTLENMAX);
  if pBuf[0] = #0 then value := '' else value := extern_darxPString(PChar(@pBuf[0]));
end;

function ads_get_attr(hdlg: Tads_hdlg; const key, attr: AnsiString; var value: AnsiString; len: Integer): Integer;
var
  pBuf: PChar;
begin
  Result := RTERROR;
  value := '';
  if 0 >= len then exit;
  pBuf := extern_acad_malloc(len + 1);
  try
    if (pBuf = nil) then exit;
    pBuf^ := #0;
    Result := extern_ads_get_attr(hdlg, PChar(key), PChar(attr), pBuf, len);
    if pBuf^ <> #0 then value := extern_darxPString(pBuf);
  finally
    extern_acad_free(pBuf);
  end;
end;

function ads_get_attr_string(tile: Tads_htile; const attr: AnsiString; var value: AnsiString): Integer;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  pBuf[0] := #0;
  Result := extern_ads_get_attr_string(tile, PChar(attr), PChar(@pBuf[0]), RESULTLENMAX);
  if pBuf[0] = #0 then value := '' else value := extern_darxPString(PChar(@pBuf[0]));
end;

function ads_get_attr_string(tile: Tads_htile; const attr: AnsiString; var value: AnsiString; len: Integer): Integer;
var
  pBuf: PChar;
begin
  Result := RTERROR;
  value := '';
  if 0 >= len then exit;
  pBuf := extern_acad_malloc(len + 1);
  try
    if (pBuf = nil) then exit;
    pBuf^ := #0;
    Result := extern_ads_get_attr_string(tile, PChar(attr), pBuf, len);
    if pBuf^ <> #0 then value := extern_darxPString(pBuf);
  finally
    extern_acad_free(pBuf);
  end;
end;

function ads_start_list(hdlg: Tads_hdlg; const key: AnsiString; operation, index: Smallint): Integer;
begin
  Result := extern_ads_start_list(hdlg, PChar(key), operation, index);
end;

function ads_add_list(const item: AnsiString): Integer;
begin
  Result := extern_ads_add_list(PChar(item));
end;

function ads_end_list: Integer;
begin
  Result := extern_ads_end_list;
end;

function ads_mode_tile(hdlg: Tads_hdlg; const key: AnsiString; mode: Smallint): Integer;
begin
  Result := extern_ads_mode_tile(hdlg, PChar(key), mode);
end;

function ads_dimensions_tile(hdlg: Tads_hdlg; const key: AnsiString; var cx, cy: Smallint): Integer;
begin
  Result := extern_ads_dimensions_tile(hdlg, PChar(key), @cx, @cy);
end;

function ads_start_image(hdlg: Tads_hdlg; const key: AnsiString): Integer;
begin
  Result := extern_ads_start_image(hdlg, PChar(key));
end;

function ads_vector_image(x1, y1, x2, y2, color: Smallint): Integer;
begin
  Result := extern_ads_vector_image(x1, y1, x2, y2, color);
end;

function ads_fill_image(x1, y1, x2, y2, color: Smallint): Integer;
begin
  Result := extern_ads_fill_image(x1, y1, x2, y2, color);
end;

function ads_slide_image(x1, y1, x2, y2: Smallint; const slnam: AnsiString): Integer;
begin
  Result := extern_ads_slide_image(x1, y1, x2, y2, PChar(slnam));
end;

function ads_end_image: Integer;
begin
  Result := extern_ads_end_image;
end;

// ***************************************** ADSLIB.H *****

function acrxUnlockApplication(appId: Pointer): LongBool;
begin
  Result := extern_acrxUnlockApplication(appId);
end;

function acrxApplicationIsLocked(const modulename: PChar): LongBool;
begin
  Result :=extern_acrxApplicationIsLocked(modulename);
end;

function acrxLockApplication(appId: Pointer): LongBool;
begin
  Result := extern_acrxLockApplication(appId);
end;

// ***************************************** RXCLASS.H *****

function newAcRxClass(const className, parentClassName: PChar; proxyFlags: Integer = 0; pseudoConstructor: PpseudoConstructor = nil; const dxfName: PChar = nil; const appName: PChar = nil): TAcRxClass;
begin
  Result := extern_newAcRxClass(className, parentClassName, proxyFlags, pseudoConstructor, dxfName, appName);
end;

function newAcRxClass(const className, parentClassName: PChar; dwgVer, maintVer: Integer; proxyFlags: Integer = 0; pseudoConstructor: PpseudoConstructor = nil; const dxfName: PChar = nil; const appName: PChar = nil): TAcRxClass;
begin
  Result := extern_newAcRxClass(className, parentClassName, dwgVer, maintVer, proxyFlags, pseudoConstructor, dxfName, appName);
end;

procedure acrxBuildClassHierarchy;
begin
  extern_acrxBuildClassHierarchy;
end;

procedure deleteAcRxClass(pClassObj: TAcRxClass);
begin
  extern_deleteAcRxClass(pClassObj);
end;

// ***************************************** RXDICT.H *****

function acrxSysRegistry: TAcRxDictionary;
begin
  Result := extern_acrxSysRegistry;
end;

// ***************************************** RXREGSVC.H *****

function acrxLoadModule(const moduleName: PChar; printit: LongBool; asCmd: LongBool = False): LongBool;
begin
  Result := extern_acrxLoadModule(moduleName, printit, asCmd);
end;

function acrxLoadApp(const appname: PChar; asCmd: LongBool = False): LongBool;
begin
  Result := extern_acrxLoadApp(appname, asCmd);
end;

function acrxUnloadModule(const moduleName: PChar; asCmd: LongBool = False): LongBool;
begin
  Result := extern_acrxUnloadModule(moduleName, asCmd);
end;

function acrxUnloadApp(const appName: PChar; asCmd: LongBool = False): LongBool;
begin
  Result := extern_acrxUnloadApp(appName, asCmd);
end;

function acrxLoadedApps: Pointer;
begin
  Result := extern_acrxLoadedApps;
end;

function acrxProductKey: PChar;
begin
  Result := extern_acrxProductKey;
end;

function acrxProductLCID: Cardinal;
begin
  Result := extern_acrxProductLCID;
end;

function acrxRegisterApp(alr: TAcadApp_LoadReasons; const logicalName, regPath: PChar; regkeyindex: Integer; bDwgU: LongBool = False): TAcadApp_ErrorStatus;
begin
  Result := extern_acrxRegisterApp(alr, logicalName, regPath, regkeyindex, bDwgU);
end;

function acrxUnregisterApp(const logicalname: PChar; bDwgU: LongBool = False): TAcadApp_ErrorStatus;
begin
  Result := extern_acrxUnregisterApp(logicalname, bDwgU);
end;

function acrxGetServiceSymbolAddr(serviceName, symbol: PChar): Pointer;
begin
  Result := extern_acrxGetServiceSymbolAddr(serviceName, symbol);
end;

function acrxRegisterService(serviceName: PChar): Pointer;
begin
  Result := extern_acrxRegisterService(serviceName);
end;

function acrxServiceIsRegistered(serviceName: PChar): Integer;
begin
  Result := extern_acrxServiceIsRegistered(serviceName);
end;

// **********************************************************

function ads_queueexpr(const expr: AnsiString): Integer;
begin
  Result := extern_ads_queueexpr(PChar(expr));
end;

// ********************************************************** acdocman.h

function acDocManagerPtr: TAcApDocManager;
begin
  Result := extern_acDocManagerPtr;
end;

// ********************************************************** acedinet.h

function acedCreateShortcut(pvHwndParent: Pointer; const szLinkPath, szObjectPath, szDesc: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedCreateShortcut(pvHwndParent, PChar(szLinkPath), PChar(szObjectPath), PChar(szDesc));
end;

function acedResolveShortcut(pvHwndParent: Pointer; const szLinkPath: AnsiString; szObjectPath: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedResolveShortcut(pvHwndParent, PChar(szLinkPath), PChar(szObjectPath));
end;

function acedGetUserFavoritesDir(szFavoritesDir: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedGetUserFavoritesDir(PChar(szFavoritesDir));
end;

function acedCreateInternetShortcut(const szURL, szShortcutPath: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedCreateInternetShortcut(PChar(szURL), PChar(szShortcutPath));
end;

function acedResolveInternetShortcut(const szLinkFile: AnsiString; szUrl: AnsiString): TAdesk_Boolean;
begin
  Result := extern_acedResolveInternetShortcut(PChar(szLinkFile), PChar(szUrl));
end;

// ********************************************************** acprofile.h

function acProfileManagerPtr: TAcApProfileManager;
begin
  Result := extern_acProfileManagerPtr;
end;

// ********************************************************** actrans.h

function acTransactionManagerPtr: TAcTransactionManager;
begin
  Result := extern_acTransactionManagerPtr;
end;

// ********************************************************** acutads.h

procedure acad_assert(const Value1, Value2: AnsiString; Value3: Integer);
begin
  extern_acad_assert(PChar(Value1), PChar(Value2), Value3);
end;

// ********************************************************** asisys.h

function AsiObjectsInUse: Longint;
begin
  Result := extern_AsiObjectsInUse;
end;

function AsiMemoryMalloc(Value1: Cardinal): Pointer;
begin
  Result := extern_AsiMemoryMalloc(Value1);
end;

procedure AsiMemoryFree(Value1: Pointer);
begin
  extern_AsiMemoryFree(Value1);
end;

function AsiMemoryRealloc(Value1: Pointer; Value2: Cardinal): Pointer;
begin
  Result := extern_AsiMemoryRealloc(Value1, Value2);
end;

function AsiMemoryAddMsg(Value1: Pointer; const Value2: AnsiString): Pointer;
begin
  Result := extern_AsiMemoryAddMsg(Value1, PChar(Value2));
end;

// ********************************************************** dbacis.h

procedure acdbModelerStart;
begin
  extern_acdbModelerStart;
end;

procedure acdbModelerEnd;
begin
  extern_acdbModelerEnd;
end;

function acdbIsModelerStarted: TAdesk_Boolean;
begin
  Result := extern_acdbIsModelerStarted;
end;

function acdbAcisSaveEntityToDwgFiler(filer: TAcDbDwgFiler; ent: TENTITY): TAcad_ErrorStatus;
begin
  Result := extern_acdbAcisSaveEntityToDwgFiler(filer, ent);
end;

function acdbAcisRestoreEntityFromDwgFiler(filer: TAcDbDwgFiler; var ent: TENTITY): TAcad_ErrorStatus;
begin
  Result := extern_acdbAcisRestoreEntityFromDwgFiler(filer, TposENTITY(ent));
end;

procedure acdbAcisSetDeleteBulletins(onOff: TAdesk_Boolean);
begin
  extern_acdbAcisSetDeleteBulletins(onOff);
end;

function acdbAcisGetDeleteBulletins: TAdesk_Boolean;
begin
  Result := extern_acdbAcisGetDeleteBulletins;
end;

procedure acdbAcisDeleteModelerBulletins;
begin
  extern_acdbAcisDeleteModelerBulletins;
end;

// ********************************************************** dbapserv.h

function getDefaultGlobals: TAcDbGlobals;
begin
  Result := extern_getDefaultGlobals;
end;

// ********************************************************** dbmain.h

function acdbGroupCodeToType(pCode: TAcDb_DxfCode): TAcDb_DwgDataType;
begin
  Result := extern_acdbGroupCodeToType(pCode);
end;

procedure acdbFreeResBufContents(pField: PResbuf);
begin
  extern_acdbFreeResBufContents(pField);
end;

function acdbIsPersistentReactor(pSomething: Pointer): LongBool;
begin
  Result := extern_acdbIsPersistentReactor(pSomething);
end;

function acdbPersistentReactorObjectId(pSomething: Pointer): TAcDbObjectId;
begin
  Result := extern_acdbPersistentReactorObjectId(pSomething);
end;

function acdbOpenAcDbObject(var pObj: TAcDbObject; id: TAcDbObjectId; mode: TAcDb_OpenMode; openErasedObject: LongBool): TAcad_ErrorStatus;
begin
  Result := extern_acdbOpenAcDbObject(TposAcDbObject(pObj), id, mode, openErasedObject);
end;

function acdbOpenAcDbEntity(var pEnt: TAcDbEntity; id: TAcDbObjectId; mode: TAcDb_OpenMode; openErasedEntity: LongBool): TAcad_ErrorStatus;
begin
  Result := extern_acdbOpenAcDbEntity(TposAcDbEntity(pEnt), id, mode, openErasedEntity);
end;

function acdbGetAdsName(var objName: Pads_name; objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := extern_acdbGetAdsName(objName, objId);
end;

function acdbGetObjectId(var objId: TAcDbObjectId; const objName: Tads_name): TAcad_ErrorStatus;
begin
  Result := extern_acdbGetObjectId(TposAcDbObjectId(objId), @objName);
end;

function acdbSetReferenced(objId: TAcDbObjectId): TAcad_ErrorStatus;
begin
  Result := extern_acdbSetReferenced(objId);
end;

function acdbActiveDatabaseArray: TAcDbVoidPtrArray;
begin
  Result := extern_acdbActiveDatabaseArray;
end;

function acdbLoadMlineStyleFile(const sname, fname: AnsiString): TAcad_ErrorStatus;
begin
  Result := extern_acdbLoadMlineStyleFile(PChar(sname), PChar(fname));
end;

function acdbLoadLineTypeFile(const ltname, fname: AnsiString; pDb: TAcDbDatabase): TAcad_ErrorStatus;
begin
  Result := extern_acdbLoadLineTypeFile(PChar(ltname), PChar(fname), pDb);
end;

function acdbAlloc(Value1: Tsize_t): Pointer;
begin
  Result := extern_acdbAlloc(Value1);
end;

function acdbAlloc_dbg(ACDBG_FORMAL: Tsize_t): Pointer;
begin
  Result := extern_acdbAlloc_dbg(ACDBG_FORMAL);
end;

procedure acdbFree(Value1: Pointer);
begin
  extern_acdbFree(Value1);
end;

function acdbSetDefaultAcGiContext(Value1: TAcGiContext): TAcGiContext;
begin
  Result := extern_acdbSetDefaulTposAcGiContext(Value1);
end;

function acdbGetThumbnailBitmapFromDxfFile(const filename: AnsiString; var pBitmap: Pointer): TAcad_ErrorStatus;
begin
  Result := extern_acdbGetThumbnailBitmapFromDxfFile(PChar(filename), Pointer(pBitmap));
end;

function acdbSaveAsR14(pDb: TAcDbDatabase; const filename: AnsiString): TAcad_ErrorStatus;
begin
  Result := extern_acdbSaveAsR14(pDb, PChar(filename));
end;

function acdbSaveAsR13(pDb: TAcDbDatabase; const filename: AnsiString): TAcad_ErrorStatus;
begin
  Result := extern_acdbSaveAsR13(pDb, PChar(fileName));
end;

function acdbDxfOutAsR14(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;
begin
  Result := extern_acdbDxfOutAsR14(pDb, PChar(fileName), precision);
end;

function acdbDxfOutAsR13(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;
begin
  Result := extern_acdbDxfOutAsR13(pDb, PChar(fileName), precision);
end;

function acdbDxfOutAsR12(pDb: TAcDbDatabase; const fileName: AnsiString; const precision: Integer): TAcad_ErrorStatus;
begin
  Result := extern_acdbDxfOutAsR12(pDb, PChar(fileName), precision);
end;

// ********************************************************** lngtrans.h

function acapLongTransactionManagerPtr: TAcApLongTransactionManager;
begin
  Result := extern_acapLongTransactionManagerPtr;
end;

// ********************************************************** rxregsvc.h

function acrxObjectDBXRegistryKey: AnsiString;
var
  pBuf: PChar;
begin
  pBuf := extern_acrxObjectDBXRegistryKey;
  if pBuf = nil then Result := '' else Result := extern_darxPString(pBuf);
end;

// ********************************************************** xgraph.h

function acedGetCurDwgXrefGraph(var Value1: TAcDbXrefGraph; includeGhosts: TAdesk_Boolean): TAcad_ErrorStatus;
begin
  Result := extern_acedGetCurDwgXrefGraph(TposAcDbXrefGraph(Value1), includeGhosts);
end;

// ********************************************************** rxmfcapi.h

function acedGetAcadWinApp: HWND;
var
	lpCWinApp: PMCWinApp;
  lpCWnd: PMCWnd;
begin
	Result := 0;
  lpCWinApp := extern_acedGetAcadWinApp;
  if lpCWinApp = nil then exit;
  lpCWnd := lpCWinApp^.parent.m_pMainWnd;
  if lpCWnd = nil then exit;
  Result := lpCWnd^.m_hWnd;
end;

function acedGetAcadDoc: PMCDocument;
begin
  Result := extern_acedGetAcadDoc;
end;

function acedGetAcadDwgView: HWND;
var
	lpCView: PMCView;
begin
  lpCView := extern_acedGetAcadDwgView;
	if lpCView = nil then Result := 0 else Result := lpCView^.m_hWnd;
end;

function acedGetAcadFrame: PMCMDIFrameWnd;
begin
  Result := extern_acedGetAcadFrame;
end;

function acedGetAcadDockCmdLine: HWND;
var
	lpCWnd: PMCWnd;
begin
  lpCWnd := extern_acedGetAcadDockCmdLine;
  if lpCWnd = nil then Result := 0 else Result := lpCWnd^.m_hWnd;
end;

function acedGetAcadTextCmdLine: HWND;
var
	lpCWnd: PMCWnd;
begin
  lpCWnd := extern_acedGetAcadTextCmdLine;
  if lpCWnd = nil then Result := 0 else Result := lpCWnd^.m_hWnd;
end;

function acedGetAcadResourceInstance: Longint;
begin
  Result := extern_acedGetAcadResourceInstance;
end;

procedure acedCoordFromPixelToWorld(var ptIn: TPOINT; var ptOut: TacedDwgPoint); overload;
begin
  extern_acedCoordFromPixelToWorld(ptIn, @ptOut);
end;

function acedCoordFromPixelToWorld(windnum: Integer; ptIn: TPOINT; var ptOut: TacedDwgPoint): LongBool; overload;
begin
  Result := extern_acedCoordFromPixelToWorld(windnum, ptIn, @ptOut);
end;

function acedCoordFromWorldToPixel(windnum: Integer; ptIn: TacedDwgPoint; var ptOut: TPOINT): LongBool;
begin
  Result := extern_acedCoordFromWorldToPixel(windnum, @ptIn, ptOut);
end;

function acedGetWinNum(ptx, pty: Integer): Integer;
begin
  Result := extern_acedGetWinNum(ptx, pty);
end;

function acedSetStatusBarProgressMeter(const pszLabel: AnsiString; nMinPos, nMaxPos: Integer): Integer;
begin
  Result := extern_acedSetStatusBarProgressMeter(PChar(pszLabel), nMinPos, nMaxPos);
end;

function acedSetStatusBarProgressMeterPos(nPos: Integer): Integer;
begin
  Result := extern_acedSetStatusBarProgressMeterPos(nPos);
end;

procedure acedRestoreStatusBar;
begin
  extern_acedRestoreStatusBar;
end;

function acedRegisterFilterWinMsg(const pfn: PAcedFilterWinMsgFn): LongBool;
begin
  Result := extern_acedRegisterFilterWinMsg(pfn);
end;

function acedRemoveFilterWinMsg(const pfn: PAcedFilterWinMsgFn): LongBool;
begin
  Result := extern_acedRemoveFilterWinMsg(pfn);
end;

function acedRegisterWatchWinMsg(const pfn: PAcedWatchWinMsgFn): LongBool;
begin
  Result := extern_acedRegisterWatchWinMsg(pfn);
end;

function acedRemoveWatchWinMsg(const pfn: PAcedWatchWinMsgFn): LongBool;
begin
  Result :=  extern_acedRemoveWatchWinMsg(pfn);
end;

function acedGetCurrentColors(var pColorSettings: TAcColorSettings): LongBool;
begin
  Result :=  extern_acedGetCurrentColors(@pColorSettings);
end;

function acedSetCurrentColors(const pColorSettings: TAcColorSettings): LongBool;
begin
  Result :=  extern_acedSetCurrentColors(@pColorSettings);
end;

function AcApGetDatabase(pView: TCView): TAcDbDatabase;
begin
  Result :=  extern_AcApGetDatabase(pView);
end;

function acedGetRegistryCompany: TCString;
begin
  Result :=  extern_acedGetRegistryCompany;
end;

function acedRegisterExtendedTab(AppName, DialogName: AnsiString): LongBool;
begin
  Result := extern_acedRegisterExtendedTab(PChar(AppName), PChar(DialogName));
end;

function acedGetMenu(Alias: AnsiString): HMENU;
begin
  Result := extern_acedGetMenu(PChar(Alias));
end;

function acedIsInputPending: LongBool;
begin
  Result := extern_acedIsInputPending;
end;

// *************************************************************************: Window Object

function AcadGetIDispatch(AddRef: LongBool): IDispatch;
begin
  Result := IDispatch(extern_AcadGetIDispatch(AddRef));
end;

// ********************************************************** DelphiARX

// ***************************************************************************

function APosToVar(const Point: Tads_Point): Longint;
begin
  Result := Longint(Pads_Point(@Point));
end;

function ABinToVar(const Binary: Tads_Binary): Longint;
begin
  Result := Longint(Pads_Binary(@Binary));
end;

function ANameToVar(const Name: Tads_Name): Longint;
begin
  Result := Longint(Pads_Name(@Name));
end;

function AResBufToVar(const ResBuf: TResBuf): Longint;
begin
  Result := Longint(PResbuf(@ResBuf));
end;

function VarToAPos(const ResVal: Variant): Tads_Point;
var
  pPos: Pads_Point;
begin
  try
    pPos := Pads_Point(Longint(ResVal));
    if pPos <> nil then begin
      Result := ads_Point(pPos^[0], pPos^[1], pPos^[2]);
    end else begin
      Result := ads_Point(0, 0, 0);
    end;
  except
    Result := ads_Point(0, 0, 0);
  end;
end;

function VarToABin(const ResVal: Variant): Tads_Binary;
var
  pBin: Pads_Binary;
begin
  try
    pBin := Pads_Binary(Longint(ResVal));
    if pBin <> nil then begin
      Result.cLen := pBin^.cLen;
      Result.Buf := pBin^.Buf;
    end else begin
      Result.cLen := 0;
      Result.Buf := nil;
    end;
  except
    Result.cLen := 0;
    Result.Buf := nil;
  end;
end;

function VarToAName(const ResVal: Variant): Tads_Name;
var
  pName: Pads_Name;
begin
  try
    pName := Pads_Name(Longint(ResVal));
    if pName <> nil then begin
      Result[0] := pName^[0];
      Result[1] := pName^[1];
    end else begin
      Result := ads_Name(0, 0);
    end;
  except
    Result := ads_Name(0, 0);
  end;
end;

function VarToAResBuf(const ResVal: Variant): TResBuf;
var
  pRes: PResbuf;
begin
  try
    pRes := PResbuf(Longint(ResVal));
    if pRes <> nil then begin
      Result.rbNext := pRes^.rbNext;
      Result.ResType := pRes^.ResType;
      Result.ResVal := pRes^.ResVal;
    end else begin
      Result.rbNext := nil;
      Result.ResType := RTERROR;
      Result.ResVal.rLong := 0;
    end;
  except
    Result.rbNext := nil;
    Result.ResType := RTERROR;
    Result.ResVal.rLong := 0;
  end;
end;

function darxNewString(const S: AnsiString): PChar;
begin
  Result := extern_darxNewString(S);
end;

function darxFreeString(const S: PChar): PChar;
begin
  Result := extern_darxFreeString(S);
end;

function darxRenewString(const oldS: PChar; const S: AnsiString): PChar;
begin
  Result := extern_darxRenewString(oldS, S);
end;

function darxPString(const S: PChar): AnsiString;
begin
  Result := extern_darxPString(S);
end;

function NewString(const S: AnsiString): PChar;
begin
  Result := extern_NewString(S);
end;

function FreeString(const S: PChar): PChar;
begin
  Result := extern_FreeString(S);
end;

function RenewString(const oldS: PChar; const S: AnsiString): PChar;
begin
  Result := extern_RenewString(oldS, S);
end;

function darxGetResCode(const ResType: Variant): Smallint;
begin
  Result := extern_darxGetResCode(ResType);
end;

function darxGetResType(const ResType: Integer): TResbufTypes;
begin
  Result := extern_darxGetResType(ResType);
end;

function darxResCopy(const ResBuf: PResbuf; const ResType: SmallInt; const ResVal: Variant): TResbufTypes;
begin
  Result := extern_darxResCopy(ResBuf, ResType, ResVal);
end;

function darxGetResVal(const ResBuf: PResbuf; var ResVal: Variant): TResbufTypes;
begin
  Result := extern_darxGetResVal(ResBuf, ResVal);
end;

function darxTreeFirstSet(const ResType: Smallint; const ResVal: Variant; var ResBufTree: TResBufTree): Boolean;
begin
  Result := extern_darxTreeFirstSet(ResType, ResVal, ResBufTree);
end;

function darxTreeNextSet(const ResType: Smallint; const ResVal: Variant; var ResBufTree: TResBufTree): Boolean;
begin
  Result := extern_darxTreeNextSet(ResType, ResVal, ResBufTree);
end;

function darxTreeEofSet(var ResBufTree: TResBufTree): Boolean;
begin
  Result := extern_darxTreeEofSet(ResBufTree);
end;

function darxIsLoadedArx(const ArxFileName: AnsiString): Boolean;
begin
  Result := extern_darxIsLoadedArx(ArxFileName);
end;

procedure darxAcadUpDate;
begin
  extern_darxAcadUpDate;
end;

function darxIsAccess: Boolean;
begin
  Result := extern_darxIsAccess;
end;

function darxMessageBox(szText, szTitle: AnsiString; fuStyle: Cardinal): Integer;
begin
  Result := extern_darxMessageBox(szText, szTitle, fuStyle);
end;

function darxIsJapanese: Boolean;
begin
  Result := extern_darxIsJapanese;
end;

function darxWinFocus(const Handle: HWND): Boolean;
begin
  Result := extern_darxWinFocus(Handle);
end;

procedure darxProcessMessages;
begin
  extern_darxProcessMessages;
end;

procedure darxWaitIdle;
begin
  extern_darxWaitIdle;
end;

function darxInterCommand(const Str: AnsiString): LongBool;
begin
  Result := extern_darxInterCommand(Str);
end;

procedure deleteRxObj(const vcObject: TAcRxObject);
begin
  delete_AcRxObject(vcObject);
end;

end.

