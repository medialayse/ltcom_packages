// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcClrDlg.pas' rev: 5.00

#ifndef AcClrDlgHPP
#define AcClrDlgHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcadDraw.hpp>	// Pascal unit
#include <ExtCtrls.hpp>	// Pascal unit
#include <StdCtrls.hpp>	// Pascal unit
#include <AcadClr.hpp>	// Pascal unit
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

namespace Acclrdlg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TAcClrDialog;
class PASCALIMPLEMENTATION TAcClrDialog : public Forms::TForm 
{
	typedef Forms::TForm inherited;
	
__published:
	Stdctrls::TEdit* edtCOLOR;
	Stdctrls::TButton* btnOK;
	Stdctrls::TButton* btnCANCEL;
	Stdctrls::TButton* btnHELP;
	Stdctrls::TStaticText* StaticText1;
	Stdctrls::TGroupBox* GroupBox1;
	Stdctrls::TGroupBox* GroupBox2;
	Stdctrls::TGroupBox* GroupBox3;
	Stdctrls::TGroupBox* GroupBox4;
	Stdctrls::TButton* btnBYLAYER;
	Stdctrls::TButton* btnBYBLOCK;
	Extctrls::TPaintBox* AcColorBox;
	Stdctrls::TLabel* lblCOLOR;
	Acadclr::TAcadColorBox* AccStdBox;
	Acadclr::TAcadColorBox* AccGrayBox;
	Acadclr::TAcadColorBox* AccRainbow;
	void __fastcall FormCreate(System::TObject* Sender);
	void __fastcall FormDestroy(System::TObject* Sender);
	void __fastcall btnBYCOLORClick(System::TObject* Sender);
	void __fastcall AcColorBoxMoveColor(System::TObject* Sender, int ColorNo, AnsiString ColorStr);
	void __fastcall AcColorBoxPaint(System::TObject* Sender);
	void __fastcall AccStdBoxChangeColor(System::TObject* Sender);
	void __fastcall edtCOLORExit(System::TObject* Sender);
	void __fastcall btnOKClick(System::TObject* Sender);
	void __fastcall btnCANCELClick(System::TObject* Sender);
	void __fastcall btnHELPClick(System::TObject* Sender);
	void __fastcall FormPaint(System::TObject* Sender);
	
private:
	Graphics::TBitmap* FImageBmp;
	bool FFirstShow;
	Classes::TNotifyEvent FOnHelpCall;
	Classes::TNotifyEvent FOnShow;
	Classes::TNotifyEvent FOnClose;
	void __fastcall InitControlBounds(void);
	
public:
	int ColorIndex;
	
__published:
	__property Classes::TNotifyEvent OnHelpCall = {read=FOnHelpCall, write=FOnHelpCall};
	__property Classes::TNotifyEvent OnShow = {read=FOnShow, write=FOnShow};
	__property Classes::TNotifyEvent OnClose = {read=FOnClose, write=FOnClose};
public:
	#pragma option push -w-inl
	/* TCustomForm.Create */ inline __fastcall virtual TAcClrDialog(Classes::TComponent* AOwner) : Forms::TForm(
		AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.CreateNew */ inline __fastcall virtual TAcClrDialog(Classes::TComponent* AOwner, int 
		Dummy) : Forms::TForm(AOwner, Dummy) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TCustomForm.Destroy */ inline __fastcall virtual ~TAcClrDialog(void) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TAcClrDialog(HWND ParentWindow) : Forms::TForm(ParentWindow
		) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Acclrdlg */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acclrdlg;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcClrDlg
