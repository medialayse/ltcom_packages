// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadDraw.pas' rev: 5.00

#ifndef AcadDrawHPP
#define AcadDrawHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Menus.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acaddraw
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TCustomAcadControl;
class PASCALIMPLEMENTATION TCustomAcadControl : public Controls::TWinControl 
{
	typedef Controls::TWinControl inherited;
	
private:
	Classes::TNotifyEvent FOnResize;
	Controls::TCanResizeEvent FOnCanResize;
	
protected:
	DYNAMIC void __fastcall Resize(void);
	virtual bool __fastcall CanResize(int &NewWidth, int &NewHeight);
	
__published:
	__property Anchors ;
	__property Hint ;
	__property ShowHint ;
	__property ParentShowHint ;
	__property Visible ;
	__property Left ;
	__property Top ;
	__property Width ;
	__property Height ;
	__property PopupMenu ;
	__property OnClick ;
	__property OnDblClick ;
	__property OnDragDrop ;
	__property OnDragOver ;
	__property OnEndDrag ;
	__property OnEnter ;
	__property OnExit ;
	__property OnMouseDown ;
	__property OnMouseMove ;
	__property OnMouseUp ;
	__property Classes::TNotifyEvent OnResize = {read=FOnResize, write=FOnResize};
	__property Controls::TCanResizeEvent OnCanResize = {read=FOnCanResize, write=FOnCanResize};
public:
	#pragma option push -w-inl
	/* TWinControl.Create */ inline __fastcall virtual TCustomAcadControl(Classes::TComponent* AOwner) : 
		Controls::TWinControl(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TCustomAcadControl(HWND ParentWindow) : Controls::TWinControl(
		ParentWindow) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TWinControl.Destroy */ inline __fastcall virtual ~TCustomAcadControl(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE char *DWGDIALOGNAME;
#define ACADDWGVIEW "AcadDwgView"
extern PACKAGE bool __fastcall IsDwgOpenProcess(const AnsiString FileName);
extern PACKAGE unsigned __fastcall GetDwgVersion(const AnsiString FileName, bool &Opened);
extern PACKAGE AnsiString __fastcall GetDwgToStr(const unsigned DwgVer);
extern PACKAGE bool __fastcall GetDwgBitmap(const AnsiString FileName, const Graphics::TBitmap* Bitmap
	, const bool Black, unsigned &VerNo, bool &Opened);
extern PACKAGE bool __fastcall IsDesktop256Color(void);
extern PACKAGE Graphics::TColor __fastcall GetAcadIndexColor(const int ColorIndex);
extern PACKAGE Graphics::TColor __fastcall GetAcadIndexColor256(const int ColorIndex);
extern PACKAGE int __fastcall GetAcad256Index(const int ColorIndex);
extern PACKAGE Graphics::TBitmap* __fastcall CreateAcadBitmap(void);
extern PACKAGE AnsiString __fastcall GetAcadColorString(const int ColorIndex);
extern PACKAGE int __fastcall GetAcadStringColor(const AnsiString Str);

}	/* namespace Acaddraw */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acaddraw;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadDraw
