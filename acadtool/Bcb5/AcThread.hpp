// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcThread.pas' rev: 5.00

#ifndef AcThreadHPP
#define AcThreadHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acthread
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TACThread;
class PASCALIMPLEMENTATION TACThread : public Classes::TThread 
{
	typedef Classes::TThread inherited;
	
private:
	_RTL_CRITICAL_SECTION FLock;
	
protected:
	HIDESBASE void __fastcall Synchronize(Classes::TThreadMethod Method);
	virtual void __fastcall Construction(void);
	virtual void __fastcall Destruction(void);
	void __fastcall Lock(void);
	void __fastcall Unlock(void);
	
public:
	__fastcall TACThread(bool CreateSuspended);
	__fastcall virtual ~TACThread(void);
	void __fastcall WaitTerminate(void);
};


struct TACNodeListParam;
typedef TACNodeListParam *PGNodeListParam;

struct TACNodeListParam
{
	TACNodeListParam *lpNext;
} ;

typedef PGNodeListParam *PPGNodeListParam;

class DELPHICLASS TACNodeList;
struct TACNodeListCompParam;
typedef int __fastcall (*TACNodeListSortCompare)(const TACNodeListCompParam &Param, void * Item1, void * 
	Item2);

class PASCALIMPLEMENTATION TACNodeList : public System::TObject 
{
	typedef System::TObject inherited;
	
private:
	bool FMultiThread;
	unsigned FItemSize;
	_RTL_CRITICAL_SECTION FLock;
	TACNodeListParam *FFirst;
	TACNodeListParam *FLast;
	int FCount;
	bool FNextReMoveFlags;
	TACNodeListParam *FNextNodeList;
	TACNodeListParam *FNextPrevList;
	void *FExchangeBuff;
	void __fastcall DestroyNodeParam(const PGNodeListParam delNode);
	void __fastcall RemoveNodeList(const PGNodeListParam PrevNode, const PGNodeListParam delNode);
	void __fastcall InsertNodeList(const PGNodeListParam PrevNode, const PGNodeListParam insNode);
	PGNodeListParam __fastcall GetIndexOfNode(const int Index, const PPGNodeListParam PrevNode);
	PGNodeListParam __fastcall GetItemOfNode(const void * Item, int &Index, const PPGNodeListParam PrevNode
		);
	
protected:
	virtual unsigned __fastcall GetNodeItemSize(void) = 0 ;
	virtual void __fastcall FreeItem(const void * Item) = 0 ;
	virtual void __fastcall NewItem(const void * Item);
	void __fastcall Lock(void);
	void __fastcall Unlock(void);
	int __fastcall AddNodeItem(void * &Item);
	int __fastcall InsertNodeItem(const int Index, void * &Item);
	bool __fastcall RemoveNode(const PGNodeListParam PrevNode, const PGNodeListParam delNode);
	bool __fastcall DeleteNodeItem(const int Index);
	bool __fastcall RemoveNodeItem(const void * Item);
	void __fastcall ClearNode(void);
	void * __fastcall FirstNodeItem(void);
	void * __fastcall NextNodeItem(void);
	void __fastcall CloseNodeItem(void);
	void * __fastcall GetNodeItems(int Index);
	int __fastcall GetItemIndex(void * Item);
	bool __fastcall SwapNodeItem(int Index1, int Index2);
	void __fastcall SortNodeItem(TACNodeListSortCompare Compare, int Mode);
	__property PGNodeListParam FirstNode = {read=FFirst};
	__property PGNodeListParam NextNodeList = {read=FNextNodeList};
	__property PGNodeListParam NextPrevList = {read=FNextPrevList};
	
public:
	__fastcall TACNodeList(const bool MultiThread);
	__fastcall virtual ~TACNodeList(void);
	DYNAMIC void __fastcall Clear(void);
	bool __fastcall Delete(int Index);
	bool __fastcall Exchange(int Index1, int Index2);
	bool __fastcall Move(int CurIndex, int NewIndex);
	__property int Count = {read=FCount, nodefault};
};


struct TACNodeListCompParam
{
	TACNodeList* NodeList;
	int Mode;
	int Index1;
	int Index2;
} ;

struct TGWndNodeListParam;
typedef TGWndNodeListParam *PGWndNodeListParam;

struct TGWndNodeListParam
{
	HWND Window;
	Controls::TWndMethod Method;
} ;

class DELPHICLASS TGWndNodeList;
class PASCALIMPLEMENTATION TGWndNodeList : public TACNodeList 
{
	typedef TACNodeList inherited;
	
protected:
	virtual unsigned __fastcall GetNodeItemSize(void);
	virtual void __fastcall FreeItem(const void * Item);
	
public:
	int __fastcall Add(HWND Window, Controls::TWndMethod Method);
	HIDESBASE void __fastcall Delete(HWND Window);
	bool __fastcall GetMethod(HWND Window, Controls::TWndMethod &WndProc);
public:
	#pragma option push -w-inl
	/* TACNodeList.Create */ inline __fastcall TGWndNodeList(const bool MultiThread) : TACNodeList(MultiThread
		) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TACNodeList.Destroy */ inline __fastcall virtual ~TGWndNodeList(void) { }
	#pragma option pop
	
};


#pragma option push -b-
enum TGAppMessageKind { amkMETHOD, amkWNDPROC, amkSENDMSG, amkPOSTMSG };
#pragma option pop

struct TGAppMessage
{
	HWND Window;
	unsigned uMsg;
	int WParam;
	int LParam;
} ;

struct TGAppMessageMethodParam
{
	TGAppMessageKind Kind;
	Classes::TThreadMethod Method;
	Controls::TWndMethod WndProc;
	TGAppMessage Msg;
} ;

typedef TGAppMessageMethodParam *PGAppMessageMethodParam;

class DELPHICLASS TGAppMessageMethod;
class PASCALIMPLEMENTATION TGAppMessageMethod : public TACNodeList 
{
	typedef TACNodeList inherited;
	
protected:
	virtual unsigned __fastcall GetNodeItemSize(void);
	virtual void __fastcall FreeItem(const void * Item);
	
public:
	PGAppMessageMethodParam __fastcall AddMethod(Classes::TThreadMethod Method);
	PGAppMessageMethodParam __fastcall AddWndProc(Controls::TWndMethod WndProc, int uMsg, int wParam, int 
		lParam);
	PGAppMessageMethodParam __fastcall AddMessage(bool isSend, HWND Window, int uMsg, int wParam, int lParam
		);
	bool __fastcall GetParam(PGAppMessageMethodParam lpParam, TGAppMessageMethodParam &Param);
public:
	#pragma option push -w-inl
	/* TACNodeList.Create */ inline __fastcall TGAppMessageMethod(const bool MultiThread) : TACNodeList(
		MultiThread) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TACNodeList.Destroy */ inline __fastcall virtual ~TGAppMessageMethod(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall IsJapanese(void);
extern PACKAGE int __fastcall ThreadSendMethod(Classes::TThreadMethod Method);
extern PACKAGE int __fastcall ThreadSendWndProc(Controls::TWndMethod WndProc, unsigned uMsg, int wParam
	, int lParam);
extern PACKAGE bool __fastcall ThreadPostWndProc(Controls::TWndMethod WndProc, unsigned uMsg, int wParam
	, int lParam);
extern PACKAGE int __fastcall ThreadSendMessage(HWND Window, unsigned uMsg, int wParam, int lParam);
	
extern PACKAGE bool __fastcall ThreadPostMessage(HWND Window, unsigned uMsg, int wParam, int lParam)
	;
extern PACKAGE HWND __fastcall GetProcessApplicationHandle(const unsigned ProcessId);
extern PACKAGE HWND __fastcall GetApplicationHandle(const HWND AnyHandle);
extern PACKAGE void __fastcall AddThreadDestroyObject(const System::TObject* ThreadObject);
extern PACKAGE void __fastcall FreeThreadDestroyObject(const System::TObject* ThreadObject);

}	/* namespace Acthread */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acthread;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcThread
