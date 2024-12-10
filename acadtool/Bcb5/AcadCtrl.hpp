// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadCtrl.pas' rev: 5.00

#ifndef AcadCtrlHPP
#define AcadCtrlHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcadUnit.hpp>	// Pascal unit
#include <AcadFunc.hpp>	// Pascal unit
#include <AcadVInf.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadctrl
{
//-- type declarations -------------------------------------------------------
typedef void __fastcall (__closure *TInteruptCallMethod)(const HWND CallhWnd, bool &NextInterupt);

struct TInteruptCallList;
typedef TInteruptCallList *PInteruptCallList;

struct TInteruptCallList
{
	TInteruptCallList *pNext;
	HWND CallhWnd;
	TInteruptCallMethod InteruptCall;
} ;

#pragma option push -b-
enum TAcadType { atNOACAD, atACLT95, atACLT97, atACLT98, atACLT2000, atACLT2000i, atACLT2002, atACLT2004, 
	atResv3, atResv4, atACAD13, atACAD14, atACAD2000, atACAD2000i, atACAD2002, atACAD2004 };
#pragma option pop

#pragma option push -b-
enum TShowState { ssNORMAL, ssMINIMIZE, ssMAXIMIZE };
#pragma option pop

#pragma option push -b-
enum TCmdSearch { csALLCHECK, csCMDLINE, csNOCHECK };
#pragma option pop

#pragma option push -b-
enum TDxfVersion { dvDXFNA, dvDXFR12, dvDXFR13, dvDXFR14, dvDXF2000, dvDXF2004 };
#pragma option pop

#pragma option push -b-
enum TAttOutType { atCDFOUT, atSDFOUT, atDXXOUT };
#pragma option pop

typedef void __fastcall (__closure *TActiveChangeEvent)(System::TObject* Sender, HWND LosthWnd, HWND 
	ActivehWnd, bool &ReLoad);

typedef void __fastcall (__closure *TDialogEvent)(System::TObject* Sender, HWND DialoghWnd, AnsiString 
	DialogCaption, AnsiString ControlText, bool &DialogClose);

typedef void __fastcall (__closure *TChildChangeEvent)(System::TObject* Sender, HWND NewWindow);

typedef void __fastcall (__closure *TAsyncCmdSendingEvent)(System::TObject* Sender, int SendNo, HWND 
	Target);

typedef void __fastcall (__closure *TAsyncCmdSendedEvent)(System::TObject* Sender, int SendNo, HWND 
	Target, bool Resulted);

typedef void __fastcall (__closure *TCommandEnabledEvent)(System::TObject* Sender, bool CmdEnabled);
	

typedef void __fastcall (__closure *TCommandEvent)(System::TObject* Sender, AnsiString CmdParam, bool 
	CmdWait);

typedef void __fastcall (__closure *TEnterNextEvent)(System::TObject* Sender, AnsiString CmdMessage, 
	bool &NextEnter);

typedef void __fastcall (__closure *TUserWaitFirstEvent)(System::TObject* Sender, int CallID, bool &
	NextExecute);

typedef void __fastcall (__closure *TUserWaitNextEvent)(System::TObject* Sender, int CallID, AnsiString 
	CmdStr, bool &ResultMode);

typedef void __fastcall (__closure *TProcessLoopEvent)(System::TObject* Sender, int &ProIndex);

class DELPHICLASS TAcadControl;
class PASCALIMPLEMENTATION TAcadControl : public Classes::TComponent 
{
	typedef Classes::TComponent inherited;
	
private:
	bool FDestroyMode;
	HWND FApplicationWindow;
	bool FShellCall;
	bool FCloseCall;
	bool FCommandCall;
	bool FExportCall;
	bool FTimeRev;
	bool FTimeOn;
	int FInterval;
	bool FInterMode;
	bool FEnabled;
	bool FAcadLocked;
	TAcadType FAcadType;
	bool FLoadAcadType;
	TCmdSearch FCmdSearch;
	TShowState FShellState;
	AnsiString FShellCmdLine;
	bool FWaitNonStr;
	AnsiString FWaitMessage;
	AnsiString FWaitBuffer;
	bool FDxfBinary;
	TDxfVersion FDxfVersion;
	AnsiString FDxfFile;
	TAttOutType FAttOutType;
	AnsiString FAttTempFile;
	AnsiString FAttOutFile;
	AnsiString FScriptFile;
	bool FMDILock;
	int FChildWndCount;
	HWND FOldActivehWnd;
	HWND FOldDialoghWnd;
	bool FOldCmdEnabled;
	AnsiString FOldHistCmd;
	AnsiString FOldNewCmd;
	Byte FCmdWaitNext;
	bool FInteruptCancel;
	AnsiString FSelAddCmd;
	int FProIndex;
	bool FAutoEnter;
	int FFindTexthWndNo;
	Acadfunc::TWindowList* FFindTexthWnd;
	Classes::TList* FOwnerWndList;
	Classes::TList* FChildWndList;
	Acadunit::TAcadObject* FAcadWindow;
	HWND FWindowHandle;
	TActiveChangeEvent FOnActiveChange;
	TDialogEvent FOnAcadDialog;
	Classes::TNotifyEvent FOnAcadLoaded;
	TCommandEnabledEvent FOnAcadCmdActive;
	TCommandEvent FOnAcadCmdChange;
	TEnterNextEvent FOnAcadEnterNext;
	Classes::TNotifyEvent FOnAcadCmdWait;
	TAsyncCmdSendingEvent FOnAsyncSending;
	TAsyncCmdSendedEvent FOnAsyncSended;
	TCommandEvent FOnWaitMessage;
	Classes::TNotifyEvent FOnAcadClose;
	TChildChangeEvent FOnChildChange;
	TUserWaitFirstEvent FOnUserWaitFirst;
	TUserWaitNextEvent FOnUserWaitNext;
	TProcessLoopEvent FOnProcessLoop;
	Classes::TNotifyEvent FOnTimer;
	void __fastcall TimerWndProc(Messages::TMessage &Msg);
	void __fastcall ResetAcadInfo(void);
	void __fastcall UpdateTimer(void);
	void __fastcall CheckChildWindow(void);
	void __fastcall SetAcEnabled(bool Value);
	void __fastcall SetInterval(int Value);
	void __fastcall SetInterMode(bool Value);
	void __fastcall SetCmdSearch(TCmdSearch Value);
	void __fastcall SetAcadType(TAcadType Value);
	void __fastcall SetOnProcessLoop(TProcessLoopEvent Value);
	void __fastcall SetOnTimer(Classes::TNotifyEvent Value);
	void __fastcall SetWaitMessage(AnsiString Value);
	bool __fastcall GetCmdIdle(void);
	void __fastcall SetCmdIdle(bool Value);
	void __fastcall InteruptCallBack(const HWND CallhWnd, bool &NextInterupt);
	bool __fastcall DoUserFirstEvents(int CallID);
	bool __fastcall DoUserNextEvents(int CallID, AnsiString CmdStr);
	HWND __fastcall GetApplicationWindow(void);
	void __fastcall SetApplicationWindow(const HWND Value);
	
protected:
	virtual void __fastcall Loaded(void);
	void __fastcall DoAsyncCmdSending(System::TObject* Sender, int SendNo, unsigned Target, const bool 
		Resulted);
	void __fastcall DoAsyncCmdSended(System::TObject* Sender, int SendNo, unsigned Target, const bool Resulted
		);
	virtual HWND __fastcall CheckAcadActive(int &AcadCount);
	virtual void __fastcall CheckShowDialog(void);
	virtual void __fastcall DoShowDialog(HWND DialoghWnd);
	virtual bool __fastcall IsCmdEnabledMode(void);
	virtual void __fastcall SearchEvent(void);
	
public:
	AnsiString __fastcall GetExeFile(void);
	AnsiString __fastcall GetExePath(void);
	bool __fastcall IsInstall(void);
	bool __fastcall IsCanExec(void);
	bool __fastcall IsExecuting(void);
	AnsiString __fastcall GetExeVersion(void);
	AnsiString __fastcall GetAutoCADName(void);
	TAcadType __fastcall GetACADNameType(AnsiString AcadName);
	TAcadType __fastcall GetFirstAcadType(void);
	TAcadType __fastcall GetLastAcadType(void);
	TAcadType __fastcall GetNewAcltType(void);
	TAcadType __fastcall GetNewAcadType(void);
	bool __fastcall IsRegular(void);
	bool __fastcall IsRegistry(void);
	bool __fastcall IsMDIWindowModel(void);
	TDxfVersion __fastcall GetDxfVersion(void);
	AnsiString __fastcall GetProductVersion(void);
	int __fastcall GetExecutMax(void);
	HWND __fastcall GetLastFocus(void);
	TAcadType __fastcall GetLastFocusType(void);
	AnsiString __fastcall GetLastFocusCaption(void);
	AnsiString __fastcall GetRegLocalMachine(void);
	AnsiString __fastcall GetRegClassesRoot(void);
	AnsiString __fastcall GetCurVer(void);
	AnsiString __fastcall GetCurrentProfile(void);
	AnsiString __fastcall GetEnumProfiles(void);
	bool __fastcall SetCurrentProfiles(const AnsiString Profile);
	bool __fastcall CopyProfile(const AnsiString SrcProfile, const AnsiString DesProfile);
	AnsiString __fastcall GetCurVerRegStr(AnsiString Path, AnsiString Name);
	unsigned __fastcall GetCurVerRegInt(AnsiString Path, AnsiString Name);
	bool __fastcall SetCurVerRegStr(AnsiString Path, AnsiString Name, AnsiString Value, bool Refresh);
	bool __fastcall SetCurVerRegInt(AnsiString Path, AnsiString Name, unsigned Value, bool Refresh);
	AnsiString __fastcall GetCurProfileStr(AnsiString Path, AnsiString Name);
	unsigned __fastcall GetCurProfileInt(AnsiString Path, AnsiString Name);
	bool __fastcall SetCurProfileStr(AnsiString Path, AnsiString Name, AnsiString Value, bool Refresh);
		
	bool __fastcall SetCurProfileInt(AnsiString Path, AnsiString Name, unsigned Value, bool Refresh);
	bool __fastcall IsSDIMode(void);
	bool __fastcall SetSDIMode(bool SDIMode);
	bool __fastcall DefaultSDIMode(void);
	bool __fastcall Shell(void);
	bool __fastcall Close(AnsiString SaveFile);
	bool __fastcall AcadLoad(HWND AcadhWnd);
	void __fastcall Clear(void);
	HWND __fastcall FirstFindTextWnd(void);
	HWND __fastcall NextFindTextWnd(void);
	bool __fastcall IsExecut(void);
	bool __fastcall IsActive(void);
	bool __fastcall IsCmdEnabled(void);
	TAcadType __fastcall Version(void);
	bool __fastcall GetSize(int &ALeft, int &ATop, int &AWidth, int &AHeight);
	bool __fastcall GetDialogSize(int &ALeft, int &ATop, int &AWidth, int &AHeight);
	TShowState __fastcall GetState(void);
	HWND __fastcall Handle(void);
	HWND __fastcall GraphHandle(void);
	HWND __fastcall TextHandle(void);
	HWND __fastcall CmdLineHandle(void);
	HWND __fastcall DialogHandle(void);
	HWND __fastcall MDIClient(void);
	Acadfunc::TWindowList* __fastcall Childs(void);
	bool __fastcall HideTextWindow(bool HideMode);
	AnsiString __fastcall GetCaption(void);
	AnsiString __fastcall GetDwgCaption(void);
	AnsiString __fastcall GetDialogCaption(void);
	AnsiString __fastcall GetLogHist(void);
	AnsiString __fastcall GetCmdLine(void);
	AnsiString __fastcall GetCmdParam(void);
	bool __fastcall IsCmdWait(void);
	bool __fastcall IsAsyncBuffer(void);
	bool __fastcall Command(AnsiString CmdStr);
	bool __fastcall AsyncCommand(AnsiString CmdStr, int SendNo);
	void __fastcall AsyncCancel(void);
	bool __fastcall CmdScript(const AnsiString CmdStr, const bool Int);
	bool __fastcall AsyncScript(const AnsiString CmdStr, const bool Int);
	bool __fastcall RunScript(const AnsiString Script, const bool Int);
	bool __fastcall ScriptExec(const bool Int, const AnsiString WaitCode);
	bool __fastcall SendCtrlKey(const char CharKey);
	bool __fastcall ClickMenu(const AnsiString MenuItem);
	bool __fastcall MouseClick(AnsiString Caption, AnsiString ClassName, bool TopMove, bool DoubleClick
		, bool RightClick);
	bool __fastcall Active(void);
	void __fastcall WaitIdle(void);
	bool __fastcall WaitCommand(void);
	bool __fastcall AcReSize(int ALeft, int ATop, int AWidth, int AHeight);
	bool __fastcall SetState(TShowState State);
	bool __fastcall MoveDialog(int ALeft, int ATop);
	int __fastcall GetChildCount(void);
	HWND __fastcall FirstChildWindow(void);
	HWND __fastcall NextChildWindow(void);
	bool __fastcall SetTopChild(HWND ChildWindow);
	bool __fastcall GetClientSize(int &ALeft, int &ATop, int &AWidth, int &AHeight);
	bool __fastcall GetChildWindowSize(int &ALeft, int &ATop, int &AWidth, int &AHeight);
	bool __fastcall ReSizeChildWindow(int ALeft, int ATop, int AWidth, int AHeight);
	TShowState __fastcall GetChildWindowState(void);
	bool __fastcall ReStateChildWindow(TShowState State);
	bool __fastcall GetVar(const AnsiString VarName, AnsiString &Value);
	bool __fastcall GetVarNew(const AnsiString VarName, const AnsiString NewValue, AnsiString &Value);
	bool __fastcall GetPoint(const bool Correct, double &X, double &Y, double &Z);
	bool __fastcall SelectDxf(const bool SingleSelect);
	bool __fastcall SelectAtt(const bool SingleSelect);
	bool __fastcall GetDist(AnsiString &ResDist);
	bool __fastcall GetArea(const AnsiString Option, AnsiString &ResArea);
	bool __fastcall GetList(AnsiString &ResList);
	bool __fastcall SaveDxfFile(const AnsiString FileName, const TDxfVersion DxfVer, const bool DxfBin)
		;
	bool __fastcall UserWait(const int CallID, const AnsiString WaitCommand);
	void __fastcall InterCancel(void);
	bool __fastcall GetWindowSize(HWND WinHdl, int &ALeft, int &ATop, int &AWidth, int &AHeight);
	AnsiString __fastcall GetWindowCaption(HWND WinHdl);
	AnsiString __fastcall GetWindowClass(HWND WinHdl);
	TShowState __fastcall GetWindowState(HWND WinHdl);
	bool __fastcall SetReSizeWindow(HWND WinHdl, int ALeft, int ATop, int AWidth, int AHeight);
	bool __fastcall SetMoveWindow(HWND WinHdl, int ALeft, int ATop);
	bool __fastcall SetWindowState(HWND WinHdl, TShowState State);
	bool __fastcall CloseWindow(HWND WinHdl);
	bool __fastcall ActiveWindow(HWND WinHdl);
	unsigned __fastcall ShellApp(const AnsiString ExeFile, const AnsiString CmdLine, const TShowState ShowMode
		, const bool Wait);
	int __fastcall FirstWindowChilds(const HWND WinHdl, const bool ChildOnly);
	HWND __fastcall NextWindowChilds(AnsiString &ChildCaption, AnsiString &ChildClass);
	HWND __fastcall GetApplicationHandle(const HWND AnyHandle);
	HWND __fastcall GetProcessApplicationHandle(const unsigned ProcessId);
	void __fastcall ResetOwnerWnd(void);
	HWND __fastcall NextOwnerWnd(AnsiString &OwnerCaption, AnsiString &OwnerClass);
	HWND __fastcall GetOwnerWnd(void);
	HWND __fastcall ActiveOwnerWnd(void);
	int __fastcall AcadCtrVer(void);
	__fastcall virtual TAcadControl(Classes::TComponent* AOwner);
	__fastcall virtual ~TAcadControl(void);
	__property HWND ApplicationWindow = {read=GetApplicationWindow, write=SetApplicationWindow, nodefault
		};
	
__published:
	__property TAttOutType AttOutType = {read=FAttOutType, write=FAttOutType, default=0};
	__property AnsiString AttTempFile = {read=FAttTempFile, write=FAttTempFile};
	__property AnsiString AttOutFile = {read=FAttOutFile, write=FAttOutFile};
	__property bool DxfBinary = {read=FDxfBinary, write=FDxfBinary, default=0};
	__property TDxfVersion DxfVersion = {read=FDxfVersion, write=FDxfVersion, default=0};
	__property AnsiString DxfFile = {read=FDxfFile, write=FDxfFile};
	__property bool Enabled = {read=FEnabled, write=SetAcEnabled, default=1};
	__property int Interval = {read=FInterval, write=SetInterval, default=500};
	__property bool InterMode = {read=FInterMode, write=SetInterMode, default=1};
	__property bool AcadLocked = {read=FAcadLocked, write=FAcadLocked, default=1};
	__property TAcadType AcadType = {read=FAcadType, write=SetAcadType, stored=false, nodefault};
	__property bool LoadAcadType = {read=FLoadAcadType, write=FLoadAcadType, default=1};
	__property TCmdSearch CmdSearch = {read=FCmdSearch, write=SetCmdSearch, default=0};
	__property bool CmdIdle = {read=GetCmdIdle, write=SetCmdIdle, default=0};
	__property TShowState ShellState = {read=FShellState, write=FShellState, default=0};
	__property AnsiString ShellCmdLine = {read=FShellCmdLine, write=FShellCmdLine};
	__property AnsiString ScriptFile = {read=FScriptFile, write=FScriptFile};
	__property AnsiString WaitMessage = {read=FWaitMessage, write=SetWaitMessage};
	__property AnsiString SelAddCmd = {read=FSelAddCmd, write=FSelAddCmd};
	__property bool MDILock = {read=FMDILock, write=FMDILock, default=1};
	__property int ProIndex = {read=FProIndex, write=FProIndex, default=0};
	__property bool AutoEnter = {read=FAutoEnter, write=FAutoEnter, default=0};
	__property TActiveChangeEvent OnActiveChange = {read=FOnActiveChange, write=FOnActiveChange};
	__property Classes::TNotifyEvent OnAcadClose = {read=FOnAcadClose, write=FOnAcadClose};
	__property TCommandEnabledEvent OnAcadCmdActive = {read=FOnAcadCmdActive, write=FOnAcadCmdActive};
	__property TCommandEvent OnAcadCmdChange = {read=FOnAcadCmdChange, write=FOnAcadCmdChange};
	__property Classes::TNotifyEvent OnAcadCmdWait = {read=FOnAcadCmdWait, write=FOnAcadCmdWait};
	__property TEnterNextEvent OnAcadEnterNext = {read=FOnAcadEnterNext, write=FOnAcadEnterNext};
	__property TAsyncCmdSendingEvent OnAsyncSending = {read=FOnAsyncSending, write=FOnAsyncSending};
	__property TAsyncCmdSendedEvent OnAsyncSended = {read=FOnAsyncSended, write=FOnAsyncSended};
	__property TDialogEvent OnAcadDialog = {read=FOnAcadDialog, write=FOnAcadDialog};
	__property Classes::TNotifyEvent OnAcadLoaded = {read=FOnAcadLoaded, write=FOnAcadLoaded};
	__property TChildChangeEvent OnChildChange = {read=FOnChildChange, write=FOnChildChange};
	__property TUserWaitFirstEvent OnUserWaitFirst = {read=FOnUserWaitFirst, write=FOnUserWaitFirst};
	__property TUserWaitNextEvent OnUserWaitNext = {read=FOnUserWaitNext, write=FOnUserWaitNext};
	__property TCommandEvent OnWaitMessage = {read=FOnWaitMessage, write=FOnWaitMessage};
	__property TProcessLoopEvent OnProcessLoop = {read=FOnProcessLoop, write=SetOnProcessLoop};
	__property Classes::TNotifyEvent OnTimer = {read=FOnTimer, write=SetOnTimer};
};


//-- var, const, procedure ---------------------------------------------------
static const Byte ACADCONTROLVER = 0xbf;

}	/* namespace Acadctrl */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadctrl;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadCtrl
