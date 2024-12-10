// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadFunc.pas' rev: 5.00

#ifndef AcadFuncHPP
#define AcadFuncHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Messages.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadfunc
{
//-- type declarations -------------------------------------------------------
struct TStaticStringRec
{
	char *Buff;
	int Len;
} ;

struct TMenuItemRec;
typedef TMenuItemRec *PMenuItemRec;

struct TMenuItemRec
{
	HMENU Handle;
	HMENU MainMenu;
	HMENU Menu;
	int ItemNo;
} ;

class DELPHICLASS TWindowList;
class PASCALIMPLEMENTATION TWindowList : public Classes::TList 
{
	typedef Classes::TList inherited;
	
private:
	HWND __fastcall GetHandles(int Index);
	void __fastcall SetHandles(int Index, HWND Value);
	
protected:
	HWND FActiveWindow;
	HWND FLastActiveWindow;
	
public:
	void __fastcall Assign(TWindowList* Source);
	HIDESBASE int __fastcall Add(HWND WinHandle);
	HIDESBASE void __fastcall Insert(int Index, HWND WinHandle);
	HIDESBASE int __fastcall IndexOf(HWND WinHandle);
	__property HWND Handles[int Index] = {read=GetHandles, write=SetHandles};
	__property HWND ActiveWindow = {read=FActiveWindow, nodefault};
	__property HWND LastActiveWindow = {read=FLastActiveWindow, nodefault};
public:
	#pragma option push -w-inl
	/* TList.Destroy */ inline __fastcall virtual ~TWindowList(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TObject.Create */ inline __fastcall TWindowList(void) : Classes::TList() { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE AnsiString __fastcall GetKakoStr(const AnsiString LineText);
extern PACKAGE bool __fastcall IsSuuti(const char C);
extern PACKAGE bool __fastcall GetStr3Pos(const AnsiString PointStr, double &X, double &Y, double &Z
	);
extern PACKAGE bool __fastcall StrToDbl(const AnsiString S, double &D);
extern PACKAGE AnsiString __fastcall GetInfoStrToCode(const AnsiString S);
extern PACKAGE bool __fastcall IsFileRootEnd(const AnsiString Path, const int Index, const char EndChr
	);
extern PACKAGE AnsiString __fastcall RemoveCommentChar(const AnsiString CmdStr);
extern PACKAGE bool __fastcall FileEffective(const AnsiString FileName, const bool FullPath);
extern PACKAGE bool __fastcall FileExistsEx(const AnsiString FileName);
extern PACKAGE AnsiString __fastcall Win32LongFileName(const AnsiString FileName);
extern PACKAGE bool __fastcall GetFileVersion(const AnsiString FileName, AnsiString &VerInfo, const 
	bool FullVer);
extern PACKAGE bool __fastcall IsDriveType(const AnsiString FileName);
extern PACKAGE AnsiString __fastcall GetFullPathFileName(AnsiString Path, AnsiString FileName, char 
	RootChar);
extern PACKAGE unsigned __fastcall WaitForProcessIdle(const unsigned hProcess, const int Timeout);
extern PACKAGE bool __fastcall CreateExeFile(const AnsiString ExeFile, const AnsiString CmdStr, const 
	int OpenMode, const bool Wait, _PROCESS_INFORMATION &pInfo);
extern PACKAGE AnsiString __fastcall GetPathPlus(const AnsiString Path);
extern PACKAGE AnsiString __fastcall GetPathName(const AnsiString Path);
extern PACKAGE bool __fastcall DeleteFileEx(const AnsiString FileName);
extern PACKAGE AnsiString __fastcall GetWinDir(void);
extern PACKAGE AnsiString __fastcall GetWinSysDir(void);
extern PACKAGE AnsiString __fastcall GetTempDirPath(void);
extern PACKAGE bool __fastcall WriteCRLFFile(const AnsiString FileName, const AnsiString Data);
extern PACKAGE bool __fastcall ReadCRLFFile(const AnsiString FileName, AnsiString &Data);
extern PACKAGE __int64 __fastcall GetScrFileSize(const AnsiString FileName);
extern PACKAGE AnsiString __fastcall GetEnvironment(const AnsiString EnvName);
extern PACKAGE bool __fastcall GetRegistryString(const HKEY MainKey, const AnsiString SubKey, const 
	AnsiString Name, AnsiString &Data);
extern PACKAGE bool __fastcall GetRegistryInteger(const HKEY MainKey, const AnsiString SubKey, const 
	AnsiString Name, unsigned &Data);
extern PACKAGE bool __fastcall SetRegistryString(const HKEY MainKey, const AnsiString SubKey, const 
	AnsiString Name, const AnsiString Data, const bool Refresh);
extern PACKAGE bool __fastcall SetRegistryInteger(const HKEY MainKey, const AnsiString SubKey, const 
	AnsiString Name, const unsigned Data, const bool Refresh);
extern PACKAGE bool __fastcall IsRegistryExists(const HKEY MainKey, const AnsiString SubKey);
extern PACKAGE bool __fastcall EnumRegistrySubKey(const HKEY MainKey, const AnsiString SubKey, const 
	int rIndex, AnsiString &Name);
extern PACKAGE bool __fastcall EnumRegistryValue(const HKEY MainKey, const AnsiString SubKey, const 
	int rIndex, AnsiString &Name);
extern PACKAGE bool __fastcall DeleteRegistrySubKey(const HKEY MainKey, const AnsiString SubKey, const 
	bool Refresh);
extern PACKAGE bool __fastcall DeleteRegistryValue(const HKEY MainKey, const AnsiString SubKey, const 
	AnsiString Name, const bool Refresh);
extern PACKAGE bool __fastcall CopyRegistrySubKey(const HKEY SrcMainKey, const AnsiString SrcSubKey, 
	const HKEY DesMainKey, const AnsiString DesSubKey, const bool Refresh);
extern PACKAGE AnsiString __fastcall GetWinClassName(const HWND hTarget);
extern PACKAGE AnsiString __fastcall GetWindowCaption(const HWND hTarget);
extern PACKAGE void __fastcall WaitWindowIdle(const HWND Handle);
extern PACKAGE void __fastcall WaitProcessMessages(const HWND Handle);
extern PACKAGE bool __fastcall Win98ForegroundWindow(const HWND Handle);
extern PACKAGE HWND __fastcall GetChildControl(const HWND Handle, const AnsiString Caption, const AnsiString 
	ClassName);
extern PACKAGE bool __fastcall SendMouseClick(const HWND Handle, const AnsiString Caption, const AnsiString 
	ClassName, const bool TopMove, const bool DoubleClick, const bool RightClick);
extern PACKAGE bool __fastcall SendCtrlKey(const HWND Handle, const char CharKey);
extern PACKAGE TStaticStringRec __fastcall CreateStringRec(void);
extern PACKAGE void __fastcall DestroyStringRec(TStaticStringRec &StrRec);
extern PACKAGE AnsiString __fastcall GetWindowSendText(const int Handle, TStaticStringRec &StrRec);
extern PACKAGE bool __fastcall SendAcadCommand(const HWND hTarget, const HWND hNewLine, const AnsiString 
	CmdStr, const bool CmdIdle, TStaticStringRec &StrRec);
extern PACKAGE AnsiString __fastcall GetMenuItemCaption(const int hMenu, const int MenuItem);
extern PACKAGE TMenuItemRec __fastcall FindMenu(const HWND Handle, const AnsiString MenuStr);
extern PACKAGE bool __fastcall SendMenuItem(const TMenuItemRec &MenuItemRec);
extern PACKAGE bool __fastcall IsMenuExists(const HWND hTarget, const AnsiString MenuStr);
extern PACKAGE bool __fastcall SendMenu(const HWND hTarget, const AnsiString MenuStr);
extern PACKAGE bool __fastcall SendSysMenu(const HWND hTarget, const unsigned CmdType);
extern PACKAGE bool __fastcall CloseSendWindow(const HWND hTarget);
extern PACKAGE bool __fastcall IsKeyMouseNotify(void);
extern PACKAGE bool __fastcall ProcessMessages(void);

}	/* namespace Acadfunc */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadfunc;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadFunc
