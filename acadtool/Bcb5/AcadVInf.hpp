// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadVInf.pas' rev: 5.00

#ifndef AcadVInfHPP
#define AcadVInfHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcadFunc.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadvinf
{
//-- type declarations -------------------------------------------------------
#pragma option push -b-
enum TAcadVerStatus { acsUNKNOWN, acsACLT95, acsACLT97, acsACLT98, acsACLT2000, acsACLT2000i, acsACLT2002, 
	acsACLT2004, acsACADR13, acsACADR14, acsACAD2000, acsACAD2000i, acsACAD2002, acsACAD2004 };
#pragma option pop

#pragma option push -b-
enum TAcadDxfStatus { adsDXFNA, adsDXFR12, adsDXFR13, adsDXFR14, adsDXF2000, adsDXF2004 };
#pragma option pop

#pragma option push -b-
enum TAcadAttStatus { aasCDFOUT, aasSDFOUT, aasDXXOUT };
#pragma option pop

struct TAcadEnumWindowRec;
typedef TAcadEnumWindowRec *PAcadEnumWindowRec;

struct TAcadEnumWindowRec
{
	int ExeFlags;
	unsigned ThreadId;
	TAcadVerStatus VerStatus;
	HWND MainWindow;
	HWND Main_MDIClient;
	HWND Main_MDIClient_AcStaticViewClass;
	HWND Main_AfxControlBar;
	HWND TextWindow;
	HWND Text_AfxFrameOrView;
	HWND Text_View_Marin;
	HWND Text_View_Marin_Headlands;
	HWND Text_View_Marin_MountTam;
	HWND CmdLineWindow;
	HWND CmdLine_AfxWnd;
	HWND CmdLine_Wnd_Marin;
	HWND CmdLine_Wnd_Marin_Headlands;
	HWND CmdLine_Wnd_Marin_MountTam;
	HWND DrawWindow;
	HWND DialogWindow;
	Acadfunc::TWindowList* DrawWindows;
	HWND Old_CmdLineWindow;
	HWND Old_DrawWindow;
	HWND Old_DialogWindow;
} ;

class DELPHICLASS TAcadRunIndex;
class PASCALIMPLEMENTATION TAcadRunIndex : public Acadfunc::TWindowList 
{
	typedef Acadfunc::TWindowList inherited;
	
public:
	int __fastcall SearchDesktop(void);
public:
	#pragma option push -w-inl
	/* TList.Destroy */ inline __fastcall virtual ~TAcadRunIndex(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TAcadRunIndex(void) : Acadfunc::TWindowList() { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString ACADTOOLREGPATH;
extern PACKAGE AnsiString __fastcall Acad_GetExeName(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_GetExeVersion(TAcadVerStatus AcadVer);
extern PACKAGE void __fastcall Acad_SetExecStart(TAcadVerStatus AcadVer, const bool Mode);
extern PACKAGE AnsiString __fastcall Acad_GetCurVer(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_GetCurrentProfile(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_EnumProfiles(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_SetCurrentProfiles(TAcadVerStatus AcadVer, AnsiString Profile);
extern PACKAGE bool __fastcall Acad_CopyProfile(TAcadVerStatus AcadVer, AnsiString SrcProfile, AnsiString 
	DesProfile);
extern PACKAGE bool __fastcall Acad_IsSDIMode(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_SetSDIMode(TAcadVerStatus AcadVer, bool SDIMode);
extern PACKAGE bool __fastcall Acad_DefaultSDIMode(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_IsExecuting(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_IsCanStart(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_ExecuteInfo(TAcadVerStatus AcadVer, AnsiString CommandLine, AnsiString 
	CurPath, int ShowMode, _PROCESS_INFORMATION &pInfo);
extern PACKAGE bool __fastcall Acad_Execute(TAcadVerStatus AcadVer, AnsiString CommandLine, AnsiString 
	CurPath, int ShowMode);
extern PACKAGE bool __fastcall Acad_SetAutodeskCommonEnvironment(const AnsiString AddPath);
extern PACKAGE AnsiString __fastcall Acad_GetCurVerRegStr(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name);
extern PACKAGE unsigned __fastcall Acad_GetCurVerRegInt(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name);
extern PACKAGE bool __fastcall Acad_SetCurVerRegStr(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name, AnsiString Value, bool Refresh);
extern PACKAGE bool __fastcall Acad_SetCurVerRegInt(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name, unsigned Value, bool Refresh);
extern PACKAGE AnsiString __fastcall Acad_GetCurProfileStr(TAcadVerStatus AcadVer, AnsiString Path, 
	AnsiString Name);
extern PACKAGE unsigned __fastcall Acad_GetCurProfileInt(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name);
extern PACKAGE bool __fastcall Acad_SetCurProfileStr(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name, AnsiString Value, bool Refresh);
extern PACKAGE bool __fastcall Acad_SetCurProfileInt(TAcadVerStatus AcadVer, AnsiString Path, AnsiString 
	Name, unsigned Value, bool Refresh);
extern PACKAGE bool __fastcall Acad_IsInstall(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_AutoCADName(TAcadVerStatus AcadVer);
extern PACKAGE TAcadVerStatus __fastcall Acad_ACADNameVerStatus(AnsiString AcadName);
extern PACKAGE bool __fastcall Acad_IsRegular(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_IsRegistry(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_IsMDIWindowModel(TAcadVerStatus AcadVer);
extern PACKAGE TAcadDxfStatus __fastcall Acad_GetDxfVersion(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_GetProductVersion(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_GetRegLocalMachine(TAcadVerStatus AcadVer);
extern PACKAGE AnsiString __fastcall Acad_GetRegClassesRoot(TAcadVerStatus AcadVer);
extern PACKAGE bool __fastcall Acad_IsAcTextWindow(const HWND Target);
extern PACKAGE bool __fastcall Acad_FirstAcWindowRec(const unsigned ThreadId, TAcadEnumWindowRec &EnumWinRec
	);
extern PACKAGE bool __fastcall Acad_NextAcWindowRec(TAcadEnumWindowRec &EnumWinRec);
extern PACKAGE void __fastcall Acad_CloseAcWindowRec(TAcadEnumWindowRec &EnumWinRec);
extern PACKAGE TAcadRunIndex* __fastcall AcadRunIndex(void);
extern PACKAGE bool __fastcall Acad_HideTextWindow(TAcadVerStatus AcadVer, HWND TextWindow, const Windows::TRect 
	&Screen, bool HideMode);
extern PACKAGE bool __fastcall Acad_IsAcadCmdWait(const AnsiString AcadNewText, const AnsiString AcadNewCmdLine
	);
extern PACKAGE AnsiString __fastcall Acad_GetAcadCmdParam(const AnsiString AcadNewText);
extern PACKAGE AnsiString __fastcall Acad_GetNotCancel(const AnsiString AcadLogText);
extern PACKAGE bool __fastcall Acad_IsAcadEnterWait(const AnsiString AcadNewText);

}	/* namespace Acadvinf */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadvinf;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadVInf
