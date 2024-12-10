// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadClr.pas' rev: 5.00

#ifndef AcadClrHPP
#define AcadClrHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcadDraw.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Forms.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadclr
{
//-- type declarations -------------------------------------------------------
struct TAClrMousePoint
{
	Byte Index;
	Windows::TRect PosRect;
} ;

struct TAClrMousePointList
{
	short Count;
	TAClrMousePoint MPos[240];
} ;

#pragma option push -b-
enum TAcadShowMode { smSTANDARD, smRAINBOW, smGRAYS };
#pragma option pop

typedef void __fastcall (__closure *TOnColorMove)(System::TObject* Sender, int ColorNo, AnsiString ColorStr
	);

typedef void __fastcall (__closure *TOnColorClick)(System::TObject* Sender, int ColorNo, AnsiString 
	ColorStr, bool &ChangeCursor);

class DELPHICLASS TAcadColorBox;
class PASCALIMPLEMENTATION TAcadColorBox : public Acaddraw::TCustomAcadControl 
{
	typedef Acaddraw::TCustomAcadControl inherited;
	
private:
	Graphics::TColor FColor;
	TAcadShowMode FShowMode;
	int FColorNo;
	Graphics::TColor FFocusColor;
	bool FFormGroup;
	bool FAutoChange;
	Graphics::TBitmap* FBaseBmp;
	TAClrMousePointList FFrame;
	Classes::TNotifyEvent FChangeColor;
	TOnColorMove FMoveColor;
	TOnColorClick FClickColor;
	
protected:
	int __fastcall GetCursorColorIndex(const int X, const int Y);
	HIDESBASE MESSAGE void __fastcall WmSize(Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall WmEraseBkgnd(Messages::TWMEraseBkgnd &Msg);
	HIDESBASE MESSAGE void __fastcall CmMouseLeave(Messages::TWMNoParams &Msg);
	HIDESBASE MESSAGE void __fastcall CmMouseEnter(Messages::TWMNoParams &Msg);
	DYNAMIC void __fastcall MouseDown(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, 
		int Y);
	DYNAMIC void __fastcall MouseUp(Controls::TMouseButton Button, Classes::TShiftState Shift, int X, int 
		Y);
	DYNAMIC void __fastcall MouseMove(Classes::TShiftState Shift, int X, int Y);
	void __fastcall SetBackColor(Graphics::TColor Value);
	void __fastcall SetShowMode(TAcadShowMode Value);
	void __fastcall SetColorNo(int Value);
	void __fastcall SetFocusColor(Graphics::TColor Value);
	
public:
	__fastcall virtual TAcadColorBox(Classes::TComponent* AOwner);
	__fastcall virtual ~TAcadColorBox(void);
	HIDESBASE bool __fastcall SetColor(const AnsiString Str);
	AnsiString __fastcall GetColor(void);
	void __fastcall SetColorFormGroup(int Value);
	
__published:
	__property Graphics::TColor Color = {read=FColor, write=SetBackColor, default=-2147483633};
	__property TAcadShowMode ShowMode = {read=FShowMode, write=SetShowMode, default=0};
	__property int ColorNo = {read=FColorNo, write=SetColorNo, default=0};
	__property Graphics::TColor FocusColor = {read=FFocusColor, write=SetFocusColor, default=255};
	__property bool FormGroup = {read=FFormGroup, write=FFormGroup, default=1};
	__property bool AutoChange = {read=FAutoChange, write=FAutoChange, default=1};
	__property TOnColorClick ClickColor = {read=FClickColor, write=FClickColor};
	__property Classes::TNotifyEvent ChangeColor = {read=FChangeColor, write=FChangeColor};
	__property TOnColorMove MoveColor = {read=FMoveColor, write=FMoveColor};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TAcadColorBox(HWND ParentWindow) : Acaddraw::TCustomAcadControl(
		ParentWindow) { }
	#pragma option pop
	
};


class DELPHICLASS TAcadColorDialog;
class PASCALIMPLEMENTATION TAcadColorDialog : public Dialogs::TCommonDialog 
{
	typedef Dialogs::TCommonDialog inherited;
	
private:
	int FColorNo;
	Classes::TNotifyEvent FOnHelpCall;
	
protected:
	void __fastcall OnShowEvent(System::TObject* Sender);
	void __fastcall OnCloseEvent(System::TObject* Sender);
	void __fastcall OnHelpEvent(System::TObject* Sender);
	void __fastcall SetColorNo(int Value);
	
public:
	__fastcall virtual TAcadColorDialog(Classes::TComponent* AOwner);
	__fastcall virtual ~TAcadColorDialog(void);
	virtual bool __fastcall Execute(void);
	bool __fastcall SetColor(const AnsiString Str);
	AnsiString __fastcall GetColor(void);
	
__published:
	__property int ColorNo = {read=FColorNo, write=SetColorNo, default=0};
	__property Classes::TNotifyEvent OnHelp = {read=FOnHelpCall, write=FOnHelpCall};
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Acadclr */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadclr;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadClr
