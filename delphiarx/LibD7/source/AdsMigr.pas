unit AdsMigr;

// ******************************************************
//      DelphiARX2002 The old adsrx Functions Library
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
  Windows, SysUtils, DArxH;

// ***************************************** ACUTMIGR.H *****

function newBuffer(var pOutput: PChar; size: Tsize_t): TAcad_ErrorStatus;
function newString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
function updString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
procedure delString(var pString: PChar);
procedure delBuffer(var pString: PChar);

// ***************************************** ACED.H *****

// ***************************************** ADS.H *****
function ads_getappname: AnsiString;
function ads_update(vport: Integer; p1, p2: Tads_point): Integer;

function ads_newrb(const v: Integer): PResBuf;

function ads_relrb(var rb: PResBuf): Integer;
function ads_buildlist(const rType: array of Variant): PResBuf;
function ads_usrbrk: Integer;
function ads_cmd(const rbp: PResBuf): Integer;
function ads_command(rtype: array of Variant): Integer;
procedure ads_fail(const str: AnsiString);

function ads_defun(const sname: AnsiString; const funcno: Smallint): Integer;
function ads_undef(const sname: AnsiString; const funcno: Smallint): Integer;
function ads_getfuncode: Integer;
function ads_getargs: PResBuf;
function ads_regfunc(const fhdl: Pointer; const fcode: Integer): Integer;
function ads_invoke(const args: PResBuf; var retbuf: PResBuf): Integer;
// function ads_loaded: PResBuf;
// function ads_xload(const app: AnsiString): Integer;
// function ads_xunload(const app: AnsiString): Integer;
function ads_arxloaded: PResBuf;
function ads_arxload(const app: AnsiString): Integer;
function ads_arxunload(const app: AnsiString): Integer;

function ads_setfunhelp(const pszFunctionName, pszHelpfile, pszTopic: AnsiString; iCmd: Integer): Integer;

function ads_retlist(const rbuf: PResBuf): Integer;
function ads_retval(const rbuf: PResBuf): Integer;
function ads_retpoint(const pt: Tads_Point): Integer;
function ads_retstr(const s: AnsiString): Integer;
function ads_retname(const aname: Tads_Name; const ntype: Integer): Integer;
function ads_retint(const ival: Integer): Integer;
function ads_retreal(const rval: Tads_Real): Integer;
function ads_rett: Integer;
function ads_retnil: Integer;
function ads_retvoid: Integer;

function ads_entdel(const ent: Tads_Name): Integer;
function ads_entgetx(const ent: Tads_Name; const args: PResBuf): PResBuf;
function ads_entget(const ent: Tads_Name): PResBuf;
function ads_entlast(var entres: Tads_Name): Integer;
function ads_entnext(const ent: Tads_Name; var entres: Tads_Name): Integer;
function ads_entupd(const ent: Tads_Name): Integer;
function ads_entmod(const ent: PResBuf): Integer;
function ads_entmake(const ent: PResBuf): Integer;
function ads_entmakex(const entm: PResBuf; entres: Tads_Name): Integer;
function ads_entsel(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point): Integer;
function ads_nentsel(const str: AnsiString; var entres: Tads_name; var ptres: Tads_point; var xformres4: Tads_point4; var refstkres: PResBuf): Integer;
function ads_nentselp(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point; const pickflag: Boolean; var xformres: Tads_Matrix; var refstkres: PResBuf): Integer;

function ads_ssget(const str: AnsiString; const pt1: Pointer; const pt2: Pads_Point; const filter: PResBuf; var ssres: Tads_Name): Integer;
function ads_ssgetfirst(var grip_set, pickfirst_set: PResBuf): Integer;
function ads_sssetfirst(const grip_set, pickfirst_set: Tads_name): Integer;
function ads_ssfree(var sname: Tads_Name): Integer;
function ads_sslength(const sname: Tads_Name; var len: Longint): Integer;
function ads_ssadd(const ename, sname: Pads_Name; var entres: Tads_Name): Integer;
function ads_ssdel(const ename, ss: Tads_Name): Integer;
function ads_ssmemb(const ename, ss: Tads_Name): Integer;
function ads_ssname(const ss: Tads_Name; const i: Longint; var entres: Tads_Name): Integer;
function ads_ssnamex(var rbpp: PResBuf; const ss: Tads_Name; const i: Longint): Integer;

function ads_ssGetKwordCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
function ads_ssSetKwordCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
function ads_ssGetOtherCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
function ads_ssSetOtherCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;

function ads_xdroom(const ent: Tads_name; var longres: Longint): Integer;
function ads_xdsize(const rb: PResBuf; var longres: Longint): Integer;
function ads_tblnext(const tblname: AnsiString; rewind: Integer): PResBuf;
function ads_tblsearch(const tblname, sym: AnsiString; setnext: Integer): PResBuf;
function ads_namedobjdict(var nameres: Tads_name): Integer;
function ads_dictsearch(const tblname: Tads_name; const sym: AnsiString; setnext: Integer): PResBuf;
function ads_dictnext(const tblname: Tads_name; rewind: Integer): PResBuf;
function ads_dictrename(const dictname: Tads_name; const oldsym, newsym: AnsiString): Integer;
function ads_dictremove(const dictname: Tads_name; const symname: AnsiString): Integer;
function ads_dictadd(const dictname: Tads_name; const symname: AnsiString; const newobj: Tads_name): Integer;
function ads_tblobjname(const tblname, sym: AnsiString; var nameres: Tads_name): Integer;
function ads_handent(const handle: AnsiString; var entres: Tads_Name): Integer;
function ads_trans(const pt: Tads_Point; const rfrom, rto: PResBuf; const disp: Boolean; var posres: Tads_Point): Integer;
function ads_angtos(v: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
function ads_cvunit(value: Tads_real; const oldunit, newunit: AnsiString; var realres: Tads_real): Integer;
function ads_wcmatch(const str, pattern: AnsiString): Integer;
function ads_rtos(val: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
function ads_angtof(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
function ads_distof(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;

function ads_setvar(const sym: AnsiString; const resbuf: PResBuf): Integer;
// The specifying use of the ads_setvar function : Sets character string data to the system variable.
// ads_setvar関数の特定使用: 文字列データをシステム変数へ設定します。
function ads_setvarStr(const sym: AnsiString; const StrRes: AnsiString): Integer;
// The specifying use of the ads_setvar function : Sets real value data to the system variable.
// ads_setvar関数の特定使用: 実数値データをシステム変数へ設定します。
function ads_setvarReal(const sym: AnsiString; const RealRes: Tads_Real): Integer;
// The specifying use of the ads_setvar function : Sets integer value data to the system variable.
// ads_setvar関数の特定使用: 整数値データをシステム変数へ設定します。
function ads_setvarLong(const sym: AnsiString; const LongRes: Longint): Integer;

function ads_initget(val: Integer; const kwl: AnsiString): Integer;
function ads_getsym(const sname: AnsiString; var value: PResBuf): Integer;
function ads_putsym(const sname: AnsiString; const value: PResBuf): Integer;
function ads_help(szFilename, szTopic: AnsiString; iCmd: Integer): Integer;
function ads_printf(const strformat: AnsiString; const args: array of const): Integer;
function ads_inters(const from1, to1, from2, to2: Tads_point; teston: Integer; var posres: Tads_point): Integer;

function ads_getvar(const sym: AnsiString; var retbuf: PResBuf): Integer;
// The specifying use of the ads_getvar function : Acquires character string data from the system variable.
// ads_getvar関数の特定使用: システム変数から文字列データを取得します。
function ads_getvarStr(const sym: AnsiString; var StrRes: AnsiString): Integer;
// The specifying use of the ads_getvar function : Acquires real value data from the system variable.
// ads_getvar関数の特定使用: システム変数から実数値データを取得します。
function ads_getvarReal(const sym: AnsiString; var RealRes: Tads_Real): Integer;
// The specifying use of the ads_getvar function : Acquires integer value data from the system variable.
// ads_getvar関数の特定使用: システム変数から整数値データを取得します。
function ads_getvarLong(const sym: AnsiString; var LongRes: Longint): Integer;

function ads_findfile(const fname: AnsiString; var fileres: AnsiString): Integer;

function ads_agetenv(const sym: AnsiString; var val: AnsiString): Integer;
function ads_asetenv(const sym, val: AnsiString): Integer;
function ads_getenv(const sym: AnsiString; var val: AnsiString): Integer;
function ads_setenv(const sym, val: AnsiString): Integer;

// R13 ignores the last len argument.
// R13では、最後のlen引数は無視します
function ads_agetcfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer;
function ads_asetcfg(const sym, val: AnsiString): Integer;
function ads_getcfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer;
function ads_setcfg(const sym, val: AnsiString): Integer;
function ads_snvalid(const tbstr: AnsiString; pipetest: Integer): Integer;
function ads_xstrsave(const pSource: AnsiString; var pDest: AnsiString): AnsiString;
function ads_xstrcase(str: AnsiString): Integer;

function ads_getstring(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString): Integer;
function ads_getstringb(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString; bufsize: Integer): Integer;
function ads_menucmd(const str: AnsiString): Integer;
function ads_prompt(const str: AnsiString): Integer;
function ads_alert(const str: AnsiString): Integer;

function ads_regapp(const appname: AnsiString): Integer;
function ads_regappx(const appname: AnsiString; xsave12: Integer): Integer;

function ads_getangle(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
function ads_getcorner(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
function ads_getdist(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
function ads_getorient(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;

function ads_getpoint(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
function ads_getBoth(const pt: Tads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;

function ads_getint(const prompt: AnsiString; var intres: Integer): Integer;
function ads_getkword(const prompt: AnsiString; var kwordres: AnsiString): Integer;
function ads_getreal(const prompt: AnsiString; var realres: Tads_Real): Integer;
function ads_getinput(str: AnsiString): Integer;

function ads_vports(var vlist: PResBuf): Integer;
function ads_textscr: Integer;
function ads_graphscr: Integer;
function ads_textpage: Integer;
function ads_redraw(const ent: Tads_name; mode: Integer): Integer;
function ads_osnap(const pt: Tads_point; const mode: AnsiString; var posres: Tads_point): Integer;
function ads_grread(track: Integer; var itype: Integer; var retbuf: PResBuf): Integer;
function ads_grtext(box: Integer; const text: AnsiString; hl: Integer): Integer;
function ads_grdraw(const from1, to1: Tads_point; color: Integer; hl: Boolean): Integer;
function ads_grvecs(const vlist: PResBuf; mat: Tads_matrix): Integer;

function ads_xformss(const ssname: Tads_Name; genmat: Tads_Matrix): Integer;
function ads_draggen(const ss: Tads_Name; const pmt: AnsiString; const cursor: Integer; const scnf: Pointer; var p: Tads_Point): Integer;
function ads_setview(const view: PResBuf; vport: Integer): Integer;

function ads_angle(const pt1, pt2: Tads_point): Tads_real;
function ads_distance(const pt1, pt2: Tads_point): Tads_real;
procedure ads_polar(const pt: Tads_point; angle, dist: Tads_real; var ptres: Tads_point);

function ads_getfiled(const title, defawlt, ext: AnsiString; const flags: Integer; var retbuf: PResBuf): Integer;
function ads_textbox(const args: PResBuf; var pt1, pt2: Tads_point): Integer;
function ads_tablet(const args: PResBuf; var retbuf: PResBuf): Integer;

function ads_isalpha(c: Char): Boolean;
function ads_isupper(c: Char): Boolean;
function ads_islower(c: Char): Boolean;
function ads_isdigit(c: Char): Boolean;
function ads_isxdigit(c: Char): Boolean;
function ads_isspace(c: Char): Boolean;
function ads_ispunct(c: Char): Boolean;
function ads_isalnum(c: Char): Boolean;
function ads_isprint(c: Char): Boolean;
function ads_isgraph(c: Char): Boolean;
function ads_iscntrl(c: Char): Boolean;
function ads_toupper(c: Char): Char;
function ads_tolower(c: Char): Char;

function ads_getcname(const cmd: AnsiString; var strres: AnsiString): Integer;

function ads_fnsplit(const pathToSplit, prebuf, namebuf, extbuf: PChar): Integer;

// **********************************************************

procedure ads_Point_Set(const formPos: Tads_Point; var toPos: Tads_Point);
procedure ads_Name_Set(const formName: Tads_Name; var toName: Tads_Name);
procedure ads_Matrix_Set(const formMatrix: Tads_Matrix; var toMatrix: Tads_Matrix);
procedure ads_Point_Clear(Point: Tads_Point);
procedure ads_Matrix_Clear(var Matrix: Tads_Matrix);
function ads_Name_Nil(const Name: Tads_Name): Boolean;
function ads_Name_Equal(const Name1, Name2: Tads_Name): Boolean;

implementation

uses
  DArxApi;

// ********************************************************************************************

procedure ads_Point_Set(const formPos: Tads_Point; var toPos: Tads_Point);
begin
  toPos := formPos;
end;

procedure ads_Name_Set(const formName: Tads_Name; var toName: Tads_Name);
begin
  toName := formName;
end;

procedure ads_Matrix_Set(const formMatrix: Tads_Matrix; var toMatrix: Tads_Matrix);
begin
  toMatrix := formMatrix;
end;

procedure ads_Point_Clear(Point: Tads_Point);
begin
  acdbPointClear(Point);
end;

procedure ads_Name_Clear(var Name: Tads_Name);
begin
  acdbNameClear(Name);
end;

procedure ads_Matrix_Clear(var Matrix: Tads_Matrix);
begin
  acdbMatrixClear(Matrix);
end;

function ads_Name_Nil(const Name: Tads_Name): Boolean;
begin
  Result := acdbNameNil(Name);
end;

function ads_Name_Equal(const Name1, Name2: Tads_Name): Boolean;
begin
  Result := acdbNameEqual(Name1, Name2);
end;

// ***************************************** ACUTMIGR.H *****

function newBuffer(var pOutput: PChar; size: Tsize_t): TAcad_ErrorStatus;
begin
  Result := DArxApi.acutNewBuffer(pOutput, size);
end;

function newString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
begin
  Result := DArxApi.acutNewString(pInput, pOutput);
end;

function updString(const pInput: PChar; var pOutput: PChar): TAcad_ErrorStatus;
begin
  Result := DArxApi.acutUpdString(pInput, pOutput);
end;

procedure delString(var pString: PChar);
begin
  DArxApi.acutDelString(pString);
end;

procedure delBuffer(var pString: PChar);
begin
  DArxApi.acutDelString(pString);
end;

// ***************************************** ACED.H *****

// ***************************************** ADS.H *****

function ads_getappname: AnsiString;
begin
  Result := DArxApi.acedGetAppName;
end;

function ads_update(vport: Integer; p1, p2: Tads_point): Integer;
begin
  Result := DArxApi.acedUpdate(vport, p1, p2);
end;

// ***********************************************************************: Memory Function

function ads_malloc(const sz: Cardinal): Pointer;
begin
  Result := DArxApi.acad_malloc(sz);
end;

procedure ads_free(var p: Pointer);
begin
  DArxApi.acad_free(p);
end;

function ads_msize(const p: Pointer): Cardinal;
begin
  Result := DArxApi.acad_msize(p);
end;

function ads_realloc(const p: Pointer; const ns: Cardinal): Pointer;
begin
  Result := DArxApi.acad_realloc(p, ns);
end;

function ads_calloc(sz1, sz2: Cardinal): Pointer;
begin
  Result := DArxApi.acad_calloc(sz1, sz2);
end;

function ads_strdup(const p: PChar): PChar;
begin
  Result := DArxApi.acad_strdup(p);
end;

function ads_newrb(const v: Integer): PResBuf;
begin
  Result := acutNewRb(V);
end;

function ads_relrb(var rb: PResBuf): Integer;
begin
  Result := acutRelRb(rb);
end;

function ads_buildlist(const rType: array of Variant): PResBuf;
begin
  Result := acutBuildList(rType);
end;

function ads_usrbrk: Integer;
begin
  Result := acedUsrBrk;
end;

function ads_cmd(const rbp: PResBuf): Integer;
begin
  Result := acedCmd(rbp);
end;

function ads_command(rtype: array of Variant): Integer;
begin
  Result := acedCommand(rtype);
end;

procedure ads_fail(const str: AnsiString);
begin
  acdbFail(str);
end;

function ads_defun(const sname: AnsiString; const funcno: Smallint): Integer;
begin
  Result := acedDefun(sname, funcno);
end;

function ads_undef(const sname: AnsiString; const funcno: Smallint): Integer;
begin
  Result := acedUndef(sname, funcno);
end;

function ads_getfuncode: Integer;
begin
  Result := acedGetFunCode;
end;

function ads_getargs: PResBuf;
begin
  Result := acedGetArgs;
end;

function ads_regfunc(const fhdl: Pointer; const fcode: Integer): Integer;
begin
  Result := acedRegFunc(fhdl, fcode);
end;

function ads_invoke(const args: PResBuf; var retbuf: PResBuf): Integer;
begin
  Result := acedInvoke(args, retbuf);
end;

function ads_arxloaded: PResBuf;
begin
  Result := acedArxLoaded;
end;

function ads_arxload(const app: AnsiString): Integer;
begin
  Result := acedArxLoad(app);
end;

function ads_arxunload(const app: AnsiString): Integer;
begin
  Result := acedArxUnload(app);
end;

function ads_setfunhelp(const pszFunctionName, pszHelpfile, pszTopic: AnsiString; iCmd: Integer): Integer;
begin
  Result := acedSetFunHelp(pszFunctionName, pszHelpfile, pszTopic,iCmd);
end;

function ads_retlist(const rbuf: PResBuf): Integer;
begin
  Result := acedRetList(rbuf);
end;

function ads_retval(const rbuf: PResBuf): Integer;
begin
  Result := acedRetVal(rbuf);
end;

function ads_retpoint(const pt: Tads_Point): Integer;
begin
  Result := acedRetPoint(pt);
end;

function ads_retstr(const s: AnsiString): Integer;
begin
  Result := acedRetStr(s);
end;

function ads_retname(const aname: Tads_Name; const ntype: Integer): Integer;
begin
  Result := acedRetName(aname, ntype);
end;

function ads_retint(const ival: Integer): Integer;
begin
  Result := acedRetInt(ival);
end;

function ads_retreal(const rval: Tads_Real): Integer;
begin
  Result := acedRetReal(rval);
end;

function ads_rett: Integer;
begin
  Result := acedRetT;
end;

function ads_retnil: Integer;
begin
  Result := acedRetNil;
end;

function ads_retvoid: Integer;
begin
  Result := acedRetVoid;
end;

function ads_entdel(const ent: Tads_Name): Integer;
begin
  Result := acdbEntDel(ent);
end;

function ads_entgetx(const ent: Tads_Name; const args: PResBuf): PResBuf;
begin
  Result := acdbEntGetX(ent, args);
end;

function ads_entget(const ent: Tads_Name): PResBuf;
begin
  Result := acdbEntGet(ent);
end;

function ads_entlast(var entres: Tads_Name): Integer;
begin
  Result := acdbEntLast(entres);
end;

function ads_entnext(const ent: Tads_Name; var entres: Tads_Name): Integer;
begin
  Result := acdbEntNext(ent, entres);
end;

function ads_entupd(const ent: Tads_Name): Integer;
begin
  Result := acdbEntUpd(ent);
end;

function ads_entmod(const ent: PResBuf): Integer;
begin
  Result := acdbEntMod(ent);
end;

function ads_entmake(const ent: PResBuf): Integer;
begin
  Result := acdbEntMake(ent);
end;

function ads_entmakex(const entm: PResBuf; entres: Tads_Name): Integer;
begin
  Result := acdbEntMakeX(entm, entres);
end;

function ads_entsel(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point): Integer;
begin
  Result := acedEntSel(str, entres, ptres);
end;

function ads_nentsel(const str: AnsiString; var entres: Tads_name; var ptres: Tads_point; var xformres4: Tads_point4; var refstkres: PResBuf): Integer;
begin
  Result := acedNEntSel(str, entres, ptres, xformres4, refstkres);
end;

function ads_nentselp(const str: AnsiString; var entres: Tads_Name; var ptres: Tads_Point; const pickflag: Boolean; var xformres: Tads_Matrix; var refstkres: PResBuf): Integer;
begin
  Result := acedNEntSelP(str, entres, ptres, pickflag, xformres, refstkres);
end;

function ads_ssget(const str: AnsiString; const pt1: Pointer; const pt2: Pads_Point; const filter: PResBuf; var ssres: Tads_Name): Integer;
begin
  Result := acedSSGet(str, pt1, pt2, filter, ssres);
end;

function ads_ssgetfirst(var grip_set, pickfirst_set: PResBuf): Integer; //function ads_ssgetfirst(var gset, pset: PResBuf): Integer;
begin
  Result := acedSSGetFirst(grip_set, grip_set);
end;

function ads_sssetfirst(const grip_set, pickfirst_set: Tads_name): Integer; //function ads_sssetfirst(const gset, pset: Tads_name): Integer;
begin
  Result := acedSSSetFirst(grip_set, pickfirst_set);
end;

function ads_ssfree(var sname: Tads_Name): Integer;
begin
  Result := acedSSFree(sname)
end;

function ads_sslength(const sname: Tads_Name; var len: Longint): Integer;
begin
  Result := acedSSLength(sname, len);
end;

function ads_ssadd(const ename, sname: Pads_Name; var entres: Tads_Name): Integer;
begin
  Result := acedSSAdd(ename, sname, entres);
end;

function ads_ssdel(const ename, ss: Tads_Name): Integer;
begin
  Result := acedSSDel(ename, ss);
end;

function ads_ssmemb(const ename, ss: Tads_Name): Integer;
begin
  Result := acedSSMemb(ename, ss);
end;

function ads_ssname(const ss: Tads_Name; const i: Longint; var entres: Tads_Name): Integer;
begin
  Result := acedSSName(ss, i, entres);
end;

function ads_ssnamex(var rbpp: PResBuf; const ss: Tads_Name; const i: Longint): Integer;
begin
  Result := acedSSNameX(rbpp, ss, i);
end;

function ads_ssGetKwordCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
begin
  Result := acedSSGetKwordCallbackPtr(pFunc);
end;

function ads_ssSetKwordCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
begin
  Result := acedSSSetKwordCallbackPtr(pFunc);
end;

function ads_ssGetOtherCallbackPtr(var pFunc: PKwordCallbackPtr): Integer;
begin
  Result := acedSSGetOtherCallbackPtr(pFunc);
end;

function ads_ssSetOtherCallbackPtr(const pFunc: PKwordCallbackPtr): Integer;
begin
  Result := acedSSSetOtherCallbackPtr(pFunc);
end;

function ads_xdroom(const ent: Tads_name; var longres: Longint): Integer;
begin
  Result := acdbXdRoom(ent, longres);
end;

function ads_xdsize(const rb: PResBuf; var longres: Longint): Integer;
begin
  Result := acdbXdSize(rb, longres);
end;

function ads_tblnext(const tblname: AnsiString; rewind: Integer): PResBuf;
begin
  Result := acdbTblNext(tblname, rewind);
end;

function ads_tblsearch(const tblname, sym: AnsiString; setnext: Integer): PResBuf;
begin
  Result := acdbTblSearch(tblname, sym, setnext);
end;

function ads_namedobjdict(var nameres: Tads_name): Integer;
begin
  Result := acdbNamedObjDict(nameres);
end;

function ads_dictsearch(const tblname: Tads_name; const sym: AnsiString; setnext: Integer): PResBuf;
begin
  Result := acdbDictSearch(tblname, sym, setnext);
end;

function ads_dictnext(const tblname: Tads_name; rewind: Integer): PResBuf;
begin
  Result := acdbDictNext(tblname, rewind);
end;

function ads_dictrename(const dictname: Tads_name; const oldsym, newsym: AnsiString): Integer;
begin
  Result := acdbDictRename(dictname, oldsym, newsym);
end;

function ads_dictremove(const dictname: Tads_name; const symname: AnsiString): Integer;
begin
  Result := acdbDictRemove(dictname, symname);
end;

function ads_dictadd(const dictname: Tads_name; const symname: AnsiString; const newobj: Tads_name): Integer;
begin
  Result := acdbDictAdd(dictname, symname, newobj);
end;

function ads_tblobjname(const tblname, sym: AnsiString; var nameres: Tads_name): Integer;
begin
  Result := acdbTblObjName(tblname, sym, nameres);
end;

function ads_handent(const handle: AnsiString; var entres: Tads_Name): Integer;
begin
  Result := acdbHandEnt(handle, entres);
end;

function ads_trans(const pt: Tads_Point; const rfrom, rto: PResBuf; const disp: Boolean; var posres: Tads_Point): Integer;
begin
  Result := acedTrans(pt, rfrom, rto, disp, posres);
end;

function ads_angtos(v: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
begin
  Result := acdbAngToS(v, iunit, prec, str);
end;

function ads_cvunit(value: Tads_real; const oldunit, newunit: AnsiString; var realres: Tads_real): Integer;
begin
  Result := acutCvUnit(value, oldunit, newunit, realres);
end;

function ads_wcmatch(const str, pattern: AnsiString): Integer;
begin
  Result := acutWcMatch(str, pattern);
end;

function ads_rtos(val: Tads_real; iunit, prec: Integer; var str: AnsiString): Integer;
begin
  Result := acdbRToS(val, iunit, prec, str);
end;

function ads_angtof(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
begin
  Result := acdbAngToF(str, iunit, v);
end;

function ads_distof(const str: AnsiString; iunit: Integer; var v: Tads_real): Integer;
begin
  Result := acdbDisToF(str, iunit, v);
end;

function ads_setvar(const sym: AnsiString; const resbuf: PResBuf): Integer;
begin
  Result := acedSetVar(sym, resbuf);
end;

function ads_setvarStr(const sym: AnsiString; const StrRes: AnsiString): Integer;
// ** DelphiARX addition function ** 文字列のシステム変数にデータを代入する
begin
  Result := acedSetVar(sym, StrRes);
end;

function ads_setvarReal(const sym: AnsiString; const RealRes: Tads_Real): Integer;
// ** DelphiARX addition function ** 実数値のシステム変数にデータを代入する
begin
  Result := acedSetVar(sym, RealRes);
end;

function ads_setvarLong(const sym: AnsiString; const LongRes: Longint): Integer;
// ** DelphiARX addition function ** 整数値のシステム変数にデータを代入する
begin
  Result := acedSetVar(sym, LongRes);
end;


function ads_initget(val: Integer; const kwl: AnsiString): Integer;
begin
  Result := acedInitGet(val, kwl);
end;

function ads_getsym(const sname: AnsiString; var value: PResBuf): Integer;
begin
  Result := acedGetSym(sname, value);
end;

function ads_putsym(const sname: AnsiString; const value: PResBuf): Integer;
begin
  Result := acedPutSym(sname, value);
end;

function ads_help(szFilename, szTopic: AnsiString; iCmd: Integer): Integer;
begin
  Result := acedHelp(szFilename, szTopic, iCmd);
end;

function ads_printf(const strformat: AnsiString; const args: array of const): Integer;
begin
  Result := acutPrintf(strformat, args);
end;

function ads_inters(const from1, to1, from2, to2: Tads_point; teston: Integer; var posres: Tads_point): Integer;
begin
  Result := acdbInters(from1, to1, from2, to2, teston, posres);
end;

function ads_getvar(const sym: AnsiString; var retbuf: PResBuf): Integer;
begin
  Result := acedGetVar(sym, retbuf);
end;

function ads_getvarStr(const sym: AnsiString; var StrRes: AnsiString): Integer;
begin
  Result := acedGetVar(sym, StrRes);
end;

function ads_getvarReal(const sym: AnsiString; var RealRes: Tads_Real): Integer;
begin
  Result := acedGetVar(sym, RealRes);
end;

function ads_getvarLong(const sym: AnsiString; var LongRes: Longint): Integer;
begin
  Result := acedGetVar(sym, LongRes);
end;

function ads_findfile(const fname: AnsiString; var fileres: AnsiString): Integer;
begin
  Result := acedFindFile(fname, fileres);
end;

function ads_agetenv(const sym: AnsiString; var val: AnsiString): Integer;
begin
  Result := acedGetEnv(sym, val);
end;

function ads_asetenv(const sym, val: AnsiString): Integer;
begin
  Result := acedSetEnv(sym, val);
end;

function ads_getenv(const sym: AnsiString; var val: AnsiString): Integer;
begin
  Result := acedGetEnv(sym, val);
end;

function ads_setenv(const sym, val: AnsiString): Integer;
begin
  Result := acedSetEnv(sym, val);
end;

function ads_agetcfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer;
begin
  Result := acedGetCfg(sym, val, len);
end;

function ads_asetcfg(const sym, val: AnsiString): Integer;
begin
  Result := acedSetCfg(sym, val);
end;

function ads_getcfg(const sym: AnsiString; var val: AnsiString; len: Integer): Integer;
begin
  Result := acedGetCfg(sym, val, len);
end;

function ads_setcfg(const sym, val: AnsiString): Integer;
begin
  Result := acedSetCfg(sym, val);
end;

function ads_snvalid(const tbstr: AnsiString; pipetest: Integer): Integer;
begin
  Result := acdbSNValid(tbstr, pipetest);
end;

function ads_xstrsave(const pSource: AnsiString; var pDest: AnsiString): AnsiString;
begin
  Result := acdbXStrSave(pSource, pDest);
end;

function ads_xstrcase(str: AnsiString): Integer;
begin
  Result := acdbXStrCase(str);
end;

function ads_getstring(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString): Integer;
begin
  Result := acedGetString(cronly, prompt, strres);
end;

function ads_getstringb(cronly: Boolean; const prompt: AnsiString; var strres: AnsiString; bufsize: Integer): Integer;
begin
  Result := acedGetStringB(cronly, prompt, strres, bufsize);
end;

function ads_menucmd(const str: AnsiString): Integer;
begin
  Result := acedMenuCmd(str);
end;

function ads_prompt(const str: AnsiString): Integer;
begin
  Result := acedPrompt(str);
end;

function ads_alert(const str: AnsiString): Integer;
begin
  Result := acedAlert(str);
end;

function ads_regapp(const appname: AnsiString): Integer;
begin
  Result := acdbRegApp(appname);
end;

function ads_regappx(const appname: AnsiString; xsave12: Integer): Integer;
begin
  Result := acdbRegApp(appname);
end;

function ads_getangle(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := acedGetAngle(pt, prompt, realres);
end;

function ads_getcorner(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := acedGetCorner(pt, prompt, posres);
end;

function ads_getdist(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := acedGetDist(pt, prompt, realres);
end;

function ads_getorient(const pt: Pads_Point; const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := acedGetOrient(pt, prompt, realres);
end;

function ads_getpoint(const pt: Pads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := acedGetPoint(pt, prompt, posres);
end;

function ads_getBoth(const pt: Tads_Point; const prompt: AnsiString; var posres: Tads_Point): Integer;
begin
  Result := acedGetPoint(pt, prompt, posres);
end;

function ads_getint(const prompt: AnsiString; var intres: Integer): Integer;
begin
  Result := acedGetInt(prompt, intres);
end;

function ads_getkword(const prompt: AnsiString; var kwordres: AnsiString): Integer;
begin
  Result := acedGetKword(prompt, kwordres);
end;

function ads_getreal(const prompt: AnsiString; var realres: Tads_Real): Integer;
begin
  Result := acedGetReal(prompt, realres);
end;

function ads_getinput(str: AnsiString): Integer;
begin
  Result := acedGetInput(str);
end;

function ads_vports(var vlist: PResBuf): Integer;
begin
  Result := acedVports(vlist);
end;

function ads_textscr: Integer;
begin
  Result := acedTextScr;
end;

function ads_graphscr: Integer;
begin
  Result := acedGraphScr;
end;

function ads_textpage: Integer;
begin
  Result := acedTextPage;
end;

function ads_redraw(const ent: Tads_name; mode: Integer): Integer;
begin
  Result := acedRedraw(ent, mode);
end;

function ads_osnap(const pt: Tads_point; const mode: AnsiString; var posres: Tads_point): Integer;
begin
  Result := acedOsnap(pt, mode, posres);
end;

function ads_grread(track: Integer; var itype: Integer; var retbuf: PResBuf): Integer;
begin
  Result := acedGrRead(track, itype, retbuf);
end;

function ads_grtext(box: Integer; const text: AnsiString; hl: Integer): Integer;
begin
  Result := acedGrText(box, text, hl);
end;

function ads_grdraw(const from1, to1: Tads_point; color: Integer; hl: Boolean): Integer;
begin
  Result := acedGrDraw(from1, to1, color, hl);
end;

function ads_grvecs(const vlist: PResBuf; mat: Tads_matrix): Integer;
begin
  Result := acedGrVecs(vlist, mat);
end;

function ads_xformss(const ssname: Tads_Name; genmat: Tads_Matrix): Integer;
begin
  Result := acedXformSS(ssname, genmat);
end;

function ads_draggen(const ss: Tads_Name; const pmt: AnsiString; const cursor: Integer; const scnf: Pointer; var p: Tads_Point): Integer;
begin
  Result := acedDragGen(ss, pmt, cursor, scnf, p);
end;

function ads_setview(const view: PResBuf; vport: Integer): Integer;
begin
  Result := acedSetView(view, vport);
end;

function ads_angle(const pt1, pt2: Tads_point): Tads_real;
begin
  Result := acutAngle(pt1, pt2);
end;

function ads_distance(const pt1, pt2: Tads_point): Tads_real;
begin
  Result := acutDistance(pt1, pt2);
end;

procedure ads_polar(const pt: Tads_point; angle, dist: Tads_real; var ptres: Tads_point);
begin
  acutPolar(pt, angle, dist, ptres);
end;

function ads_getfiled(const title, defawlt, ext: AnsiString; const flags: Integer; var retbuf: PResBuf): Integer;
begin
  Result := acedGetFileD(title, defawlt, ext, flags, retbuf);
end;

function ads_textbox(const args: PResBuf; var pt1, pt2: Tads_point): Integer;
begin
  Result := acedTextBox(args, pt1, pt2);
end;

function ads_tablet(const args: PResBuf; var retbuf: PResBuf): Integer;
begin
  Result := acedTablet(args, retbuf);
end;

function ads_isalpha(c: Char): Boolean;
begin
  Result := acutIsAlpha(C);
end;

function ads_isupper(c: Char): Boolean;
begin
  Result := acutIsUpper(c);
end;

function ads_islower(c: Char): Boolean;
begin
  Result := acutIsLower(c);
end;

function ads_isdigit(c: Char): Boolean;
begin
  Result := acutIsDigit(c);
end;

function ads_isxdigit(c: Char): Boolean;
begin
  Result := acutIsXDigit(c);
end;

function ads_isspace(c: Char): Boolean;
begin
  Result := acutIsSpace(c);
end;

function ads_ispunct(c: Char): Boolean;
begin
  Result := acutIsPunct(c);
end;

function ads_isalnum(c: Char): Boolean;
begin
  Result := acutIsAlNum(c);
end;

function ads_isprint(c: Char): Boolean;
begin
  Result := acutIsPrint(c);
end;

function ads_isgraph(c: Char): Boolean;
begin
  Result := acutIsGraph(c);
end;

function ads_iscntrl(c: Char): Boolean;
begin
  Result := acutIsCntrl(c);
end;

function ads_toupper(c: Char): Char;
begin
  Result := acutToUpper(c);
end;

function ads_tolower(c: Char): Char;
begin
  Result := acutToLower(c);
end;

function ads_getcname(const cmd: AnsiString; var strres: AnsiString): Integer;
begin
  Result := acedGetCName(cmd, strres);
end;

function ads_fnsplit(const pathToSplit, prebuf, namebuf, extbuf: PChar): Integer;
begin
  Result := acedFNSplit(pathToSplit, prebuf, namebuf, extbuf);
end;

// ***************************************** ADSDLG.H *****

// ***************************************** ADSLIB.H *****

// ***************************************** RXCLASS.H *****

// ***************************************** RXDICT.H *****

// ***************************************** RXREGSVC.H *****

// **********************************************************

end.
