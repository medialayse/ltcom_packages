unit DArxEnty;

//[VER1.20]
// ******************************************************
//     DelphiARX Arx Entry Module unit
//     NOTE: DO NOT edit this unit.
//
//     DelphiARX2002-D5 AppWizard
// ******************************************************

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

interface

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
	Windows, Messages, SysUtils, Classes, DArxH, DArxObj, DArxAds, DArxEnts;

// This function is the entry point which AutoCAD summons.
function acrxEntryPoint(Msg: TAcrx_AppMsgCode; Pkt: Pointer): TAcrx_AppRetCode;

{$DEFINE NOLISPCMD}

const
//[ARX DEPELOPER SYMBOL NAME]
	DARX_RDS = 'SMP';

//[ARX REGISTORY APPNAME]
	DARX_REGAPPNAME: PChar = DARX_RDS + 'comsamp';

{$IFNDEF NOLISPCMD}
const
//{{DARX_ELEMENTS
	ELEMENTSMAX = 0;
	ELEMENTS_NAME: array[0..ELEMENTSMAX]of PChar = (
	'');
//}}DARX_ELEMENTS
{$ENDIF}

//{{DARX_LISPINDEX
//}}DARX_LISPINDEX

//{{DARX_ARXINDEX
const
	ARXCMD_COMCIRCLE = 1;
	ARXCMD_COMMENU = 2;
	ARXCMD_COMLEADER = 3;
	ARXCMD_COMPOS = 4;
//}}DARX_ARXINDEX

implementation

uses
	DArxLib, DArxDoc, DArxApi,
//{{DARX_ADDUNIT
//}}DARX_ADDUNIT
{$IFDEF DARXDEBUG}
	AdsDebug,
{$ENDIF}
	MsgMain, DocMain;

//[ARXCOMMAND]******************************************************************

procedure ARXCMDCOMCIRCLE;
begin
	darxDocManager.ArxCommand(ARXCMD_COMCIRCLE);
end;

procedure ARXCMDCOMMENU;
begin
	darxDocManager.ArxCommand(ARXCMD_COMMENU);
end;

procedure ARXCMDCOMLEADER;
begin
	darxDocManager.ArxCommand(ARXCMD_COMLEADER);
end;

procedure ARXCMDCOMPOS;
begin
	darxDocManager.ArxCommand(ARXCMD_COMPOS);
end;

//[ADSDODFUN]*******************************************************************

{$IFNDEF NOLISPCMD}
/////////////////////////////////////////////////////////////////////
// dofun(internal)
// This function is called to invoke the function which has the registerd function code that is obtained from acedGetFunCode.
function LispDoFun: TAcrx_AppRetCode; cdecl;
var
	nCmdNo: Integer;
begin
	Result := AcRx_kRetOK;
	acedRetVoid;
	nCmdNo := acedGetFunCode;
	if (1 > nCmdNo)or(nCmdNo > ELEMENTSMAX) then exit;
	darxDocManager.LispCommand(nCmdNo, Result);
	if Result = RTNORM then Result := AcRx_kRetOK else if Result = RTERROR then Result := AcRx_kRetError;
end;

//////////////////////////////////////////////////////////////////////////
// funcload(internal)
// This function is called to define all function names in the ADS function table.
// Each named function will be callable from lisp or invokable from another ADS application.
procedure LispFuncLoad;
var
	ni: Integer;
begin
	for ni := 0 to (ELEMENTSMAX - 1) do begin
		if acedDefun(ELEMENTS_NAME[ni], ni + 1) <> RTNORM then break;
		if acedRegFunc(@LispDoFun, ni + 1) <> RTNORM then break;
	end;
end;

/////////////////////////////////////////////////////////////////////
// funclunoad(internal)
// This function is called to undefine all function names in the ADS function table.
// Each named function will be removed from the AutoLISP hash table.
procedure LispFuncUnload;
var
	ni: Integer;
begin
	// Undefine each function we defined
	for ni := 0 to (ELEMENTSMAX - 1) do acedUndef(ELEMENTS_NAME[ni], ni + 1);
end;
{$ENDIF}
/////////////////////////////////////////////////////////////////////
// Adds ARX command function
// This functions registers an ARX command.
// It can be used to read the localized command name from a string table stored in the resources.
// NOTE: DO NOT edit the following lines.
procedure AddCommand(const cmdGroup, cmdInt, cmdLoc: AnsiString; const cmdFlags: Integer; const cmdProc: PAcRxFunctionPtr; const idLocal: Integer = -1);
var
	cmdLocRes: array[0..64]of Char;
begin
	// If idLocal is not -1, it is treated as an ID for a string stored in the resources.
	if (idLocal <> -1) then begin
		cmdLocRes[0] := #0;
		// Load strings from the string table and register the command.
		Windows.LoadString(hInstance, idLocal, PChar(@cmdLocRes[0]), 64);
		acedRegCmds.addCommand(cmdGroup, cmdInt, PChar(@cmdLocRes[0]), cmdFlags, cmdProc);
	end else begin
		// idLocal is -1, so the "hard coded" localized function name is used.
		acedRegCmds.addCommand(cmdGroup, cmdInt, cmdLoc, cmdFlags, cmdProc);
	end;
end;

/////////////////////////////////////////////////////////////////////
// This functions registers an ARX command.
// It can be used to read the localized command name from a string table stored in the resources.
procedure RegisterArxApp;
//{{ARX_ADDREGAPP
begin
end;
//}}ARX_ADDREGAPP

//[ENTRYFUNCTION]***************************************************************

procedure InitAppEntryFunction(Pkt: Pointer);
begin
	acrxDynamicLinker.unlockApplication(pkt);
	acrxDynamicLinker.registerAppMDIAware(pkt);
	DArxDoc.InitApplication;
	RegisterArxApp;
//{{DARX_ADDREACTOR
//}}DARX_ADDREACTOR
//{{DARX_ARXADDCMD
	AddCommand(DARX_RDS + 'SDA', 'COMCIRCLE', 'COMCIRCLE', ACRX_CMD_TRANSPARENT or ACRX_CMD_USEPICKSET, @ARXCMDCOMCIRCLE);
	AddCommand(DARX_RDS + 'SDA', 'COMMENU', 'COMMENU', ACRX_CMD_TRANSPARENT or ACRX_CMD_USEPICKSET, @ARXCMDCOMMENU);
	AddCommand(DARX_RDS + 'SDA', 'COMLEADER', 'COMLEADER', ACRX_CMD_TRANSPARENT or ACRX_CMD_USEPICKSET, @ARXCMDCOMLEADER);
	AddCommand(DARX_RDS + 'SDA', 'COMPOS', 'COMPOS', ACRX_CMD_TRANSPARENT or ACRX_CMD_USEPICKSET, @ARXCMDCOMPOS);
//}}DARX_ARXADDCMD
	MsgMain.InitApplication;
end;

procedure UnloadAppEntryFunction;
begin
	MsgMain.UnloadApplication;
//{{DARX_ARXDELGRP
	acedRegCmds.removeGroup(DARX_RDS + 'SDA');
//}}DARX_ARXDELGRP
//{{DARX_DELREACTOR
//}}DARX_DELREACTOR
	DArxDoc.FinalApplication;
{$IFDEF DARXDEBUG}
	AdsDebug.darx_DebugClose;
{$ENDIF}
end;

procedure LoadDwgEntryFunction;
begin
{$IFNDEF NOLISPCMD}
	LispFuncLoad;
{$ENDIF}
//{{DARX_LOADDWG
//}}DARX_LOADDWG
end;

procedure UnloadDwgEntryFunction;
begin
{$IFNDEF NOLISPCMD}
	LispFuncUnload;
{$ENDIF}
//{{DARX_UNLOADDWG
//}}DARX_UNLOADDWG
end;

procedure InvkSubrMsgEntryFunction;
begin
{$IFNDEF NOLISPCMD}
	LispDoFun;
{$ENDIF}
//{{DARX_INVKSUB
//}}DARX_INVKSUB
end;

//[ARXENTRYPOINT]***************************************************************
// ObjectARX EntryPoint
// NOTE: DO NOT edit the following lines.

function acrxEntryPoint(Msg: TAcrx_AppMsgCode; Pkt: Pointer): TAcrx_AppRetCode;
begin
	Result := AcRx_kRetOK;
	case Msg of
		acrx_kInitAppMsg			: InitAppEntryFunction(Pkt);
		acrx_kUnloadAppMsg		: UnloadAppEntryFunction;
		acrx_kLoadDwgMsg      : LoadDwgEntryFunction;
		acrx_kUnloadDwgMsg		: UnloadDwgEntryFunction;
		acrx_kInvkSubrMsg			: InvkSubrMsgEntryFunction;
//{{ADDENTRYMSG
//}}ADDENTRYMSG
	end;
end;

end.
