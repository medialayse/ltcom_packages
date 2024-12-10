// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadUnit.pas' rev: 5.00

#ifndef AcadUnitHPP
#define AcadUnitHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcThread.hpp>	// Pascal unit
#include <AcadFunc.hpp>	// Pascal unit
#include <AcadVInf.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadunit
{
//-- type declarations -------------------------------------------------------
typedef void __stdcall (*TAppInterruptionProc)(const HWND Handle, bool &LoopOK);

typedef TAppInterruptionProc *PAppInterruptionProc;

typedef bool __fastcall (__closure *TUserFirstMethod)(int CallID);

typedef bool __fastcall (__closure *TUserNextMethod)(int CallID, AnsiString CmdStr);

typedef void __fastcall (__closure *TOnCommandThreadEvent)(System::TObject* Sender, int SendNo, unsigned 
	Target, const bool Resulted);

class DELPHICLASS TAcadCmdThread;
typedef void __fastcall (__closure *TOnReadCommandThreadEvent)(TAcadCmdThread* Sender);

class DELPHICLASS TAcadObject;
class DELPHICLASS TAsyncCmdList;
class PASCALIMPLEMENTATION TAsyncCmdList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	Classes::TList* FList;
	TAcadCmdThread* FAsyncThread;
	_RTL_CRITICAL_SECTION FLock;
	
protected:
	bool __fastcall IsSendStack(void);
	int __fastcall Find(void * Item);
	int __fastcall Remove(void * Item);
	void __fastcall StartCommand(TAcadCmdThread* Sender);
	void __fastcall ReadCommand(TAcadCmdThread* Sender);
	
public:
	__fastcall virtual TAsyncCmdList(void);
	__fastcall virtual ~TAsyncCmdList(void);
	void __fastcall Clear(void);
	int __fastcall Count(void);
	bool __fastcall Add(const int SendNo, const HWND hTarget, const HWND hNewLine, const AnsiString CmdStr
		, const bool CmdIdle, const TOnCommandThreadEvent OnSending, const TOnCommandThreadEvent OnSended)
		;
};


class PASCALIMPLEMENTATION TAcadObject : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	_RTL_CRITICAL_SECTION FLock;
	unsigned FThreadId;
	HWND FMainhWnd;
	HWND FStaticView;
	HWND FGraphWnd;
	HWND FTexthWnd;
	HWND FCmdLinehWnd;
	HWND FNewText;
	HWND FLogText;
	HWND FNewCmdLine;
	HWND FLogCmdLine;
	Acadvinf::TAcadVerStatus FVersion;
	HWND FMDIClient;
	Acadfunc::TWindowList* FChildDocs;
	Acadvinf::TAcadEnumWindowRec FAcadRec;
	bool FWaitLoop;
	int FLoopIndex;
	bool FMDILocked;
	HWND FMDILockWnd;
	bool FCmdIdle;
	Acadfunc::TStaticStringRec FReadCmd;
	Acadfunc::TStaticStringRec FSendCmd;
	TAsyncCmdList* FAsyncList;
	bool FInterMode;
	
protected:
	void __fastcall Lock(void);
	void __fastcall Unlock(void);
	bool __fastcall LoadAcadThread(const unsigned hThreadId);
	AnsiString __fastcall GetSysVar(const AnsiString VarName, bool &ReadOnly);
	int __fastcall FindMDIChilds(const HWND MainhWnd, const HWND ClienthWnd, const Acadfunc::TWindowList* 
		ChildList);
	HWND __fastcall SetMDILock(void);
	void __fastcall ResetMDILock(void);
	void __fastcall CancelLoopWait(void);
	void __fastcall WaitClicking(void);
	
public:
	__fastcall virtual TAcadObject(void);
	__fastcall virtual ~TAcadObject(void);
	void __fastcall Clear(void);
	bool __fastcall SetAcadWin(const HWND Handle);
	bool __fastcall SetAcadRun(const int AcadIndex);
	bool __fastcall SetMDITopChild(void);
	int __fastcall GetMDIChilds(void);
	bool __fastcall SetMDITopFocus(const HWND TopChild);
	HWND __fastcall GetDialoghWnd(void);
	bool __fastcall Shell(Acadvinf::TAcadVerStatus AcadVer, AnsiString CommandLine, AnsiString CurPath, 
		int ShowMode);
	bool __fastcall SetActive(void);
	void __fastcall WaitIdle(void);
	bool __fastcall HideTextWindow(const Windows::TRect &Screen, bool HideMode);
	AnsiString __fastcall GetNewText(void);
	AnsiString __fastcall GetLogText(void);
	AnsiString __fastcall GetNewCmdLine(void);
	AnsiString __fastcall GetLogCmdLine(void);
	bool __fastcall Command(const AnsiString CmdStr);
	bool __fastcall AsyncCommand(const AnsiString CmdStr, const int SendNo, const TOnCommandThreadEvent 
		OnSending, const TOnCommandThreadEvent OnSended);
	void __fastcall AsyncCancel(void);
	bool __fastcall IsAsyncBuffer(void);
	bool __fastcall ClickMenu(const AnsiString MenuItem);
	bool __fastcall SendCtrlKey(const char CharKey);
	bool __fastcall GetVarNew(const AnsiString VarName, const AnsiString NewValue, AnsiString &OldValue
		);
	bool __fastcall GetVar(const AnsiString VarName, AnsiString &Value);
	bool __fastcall UserWaitCommand(const int CallID, const AnsiString WaitCommand, const AnsiString AddCmd
		, const TUserFirstMethod UserFirstMethod, const TUserNextMethod UserNextMethod);
	bool __fastcall GetPoint(AnsiString AddCmd, const bool Correct, double &X, double &Y, double &Z);
	bool __fastcall GetDist(AnsiString &ResDist);
	bool __fastcall GetArea(const AnsiString Option, AnsiString &ResArea);
	bool __fastcall GetList(AnsiString &ResList);
	bool __fastcall SelectDxf(AnsiString AddCmd, const Acadvinf::TAcadDxfStatus DxfVersion, const AnsiString 
		DxfFile, const bool SingleSelect, const bool Binary);
	AnsiString __fastcall MakeDxfout(const AnsiString DxfFile, const Acadvinf::TAcadDxfStatus DxfVersion
		, const bool Binary);
	bool __fastcall SelectAtt(AnsiString AddCmd, const Acadvinf::TAcadAttStatus AtOutMode, const AnsiString 
		AtTempFile, const AnsiString OutFile, const bool SingleSelect);
	bool __fastcall RunScript(const AnsiString ScrFile, const AnsiString Script, const AnsiString WaitCmd
		, const bool Int);
	__property HWND MainhWnd = {read=FMainhWnd, nodefault};
	__property HWND StaticView = {read=FStaticView, nodefault};
	__property HWND GraphWnd = {read=FGraphWnd, nodefault};
	__property HWND TexthWnd = {read=FTexthWnd, nodefault};
	__property HWND CmdLinehWnd = {read=FCmdLinehWnd, nodefault};
	__property HWND NewText = {read=FNewText, nodefault};
	__property HWND LogText = {read=FLogText, nodefault};
	__property HWND NewCmdLine = {read=FNewCmdLine, nodefault};
	__property HWND LogCmdLine = {read=FLogCmdLine, nodefault};
	__property Acadvinf::TAcadVerStatus Version = {read=FVersion, nodefault};
	__property HWND MDIClient = {read=FMDIClient, nodefault};
	__property Acadfunc::TWindowList* ChildDocs = {read=FChildDocs};
	__property bool MDILocked = {read=FMDILocked, write=FMDILocked, default=1};
	__property bool CmdIdle = {read=FCmdIdle, write=FCmdIdle, default=0};
	__property bool InterMode = {read=FInterMode, write=FInterMode, nodefault};
};


class PASCALIMPLEMENTATION TAcadCmdThread : public Acthread::TACThread 
{
	typedef Acthread::TACThread inherited;
	
private:
	TAsyncCmdList* FOwner;
	void *FTaskObject;
	bool FResulted;
	int FSendNo;
	HWND FTarget;
	HWND FNewLine;
	AnsiString FCmdStr;
	bool FCmdIdle;
	TOnCommandThreadEvent FOnSending;
	TOnCommandThreadEvent FOnSended;
	TOnReadCommandThreadEvent FOnStartCommand;
	TOnReadCommandThreadEvent FOnReadCommand;
	
public:
	__fastcall TAcadCmdThread(TAsyncCmdList* AOwner, const TOnReadCommandThreadEvent OwnerStartCommand, 
		const TOnReadCommandThreadEvent OwnerReadCommand);
	virtual void __fastcall Execute(void);
	void __fastcall DoStartCommand(void);
	void __fastcall DoReadCommand(void);
	__property void * TaskObject = {read=FTaskObject, write=FTaskObject};
	__property bool Resulted = {read=FResulted, write=FResulted, nodefault};
	__property int SendNo = {read=FSendNo, write=FSendNo, nodefault};
	__property HWND Target = {read=FTarget, write=FTarget, nodefault};
	__property HWND NewLine = {read=FNewLine, write=FNewLine, nodefault};
	__property AnsiString CmdStr = {read=FCmdStr, write=FCmdStr};
	__property bool CmdIdle = {read=FCmdIdle, write=FCmdIdle, nodefault};
	__property TOnCommandThreadEvent OnSending = {read=FOnSending, write=FOnSending};
	__property TOnCommandThreadEvent OnSended = {read=FOnSended, write=FOnSended};
public:
	#pragma option push -w-inl
	/* TACThread.Destroy */ inline __fastcall virtual ~TAcadCmdThread(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool CreateLoopCancel;
extern PACKAGE unsigned CM_ATOOLDELAYMESSAGE;
extern PACKAGE AnsiString __fastcall AcadToolCopyright(void);
extern PACKAGE void __fastcall SetAppInterrupt(const PAppInterruptionProc AppInterrupt);
extern PACKAGE void __fastcall AcadControlXLoadInstance(void);

}	/* namespace Acadunit */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadunit;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadUnit
