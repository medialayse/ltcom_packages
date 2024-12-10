// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcDwgDlg.pas' rev: 5.00

#ifndef AcDwgDlgHPP
#define AcDwgDlgHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcadDwgV.hpp>	// Pascal unit
#include <Dialogs.hpp>	// Pascal unit
#include <Controls.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acdwgdlg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TOpenDwgDialog;
class PASCALIMPLEMENTATION TOpenDwgDialog : public Dialogs::TOpenDialog 
{
	typedef Dialogs::TOpenDialog inherited;
	
private:
	Acaddwgv::TAcadDwgView* FAcadDwgView;
	bool FDwgOnly;
	void __fastcall ViewOnClick(System::TObject* Sender);
	
protected:
	DYNAMIC void __fastcall DoClose(void);
	DYNAMIC void __fastcall DoSelectionChange(void);
	DYNAMIC void __fastcall DoShow(void);
	
public:
	__fastcall virtual TOpenDwgDialog(Classes::TComponent* AOwner);
	__fastcall virtual ~TOpenDwgDialog(void);
	virtual bool __fastcall Execute(void);
	
__published:
	__property bool DwgOnly = {read=FDwgOnly, write=FDwgOnly, default=0};
};


class DELPHICLASS TSaveDwgDialog;
class PASCALIMPLEMENTATION TSaveDwgDialog : public TOpenDwgDialog 
{
	typedef TOpenDwgDialog inherited;
	
public:
	virtual bool __fastcall Execute(void);
public:
	#pragma option push -w-inl
	/* TOpenDwgDialog.Create */ inline __fastcall virtual TSaveDwgDialog(Classes::TComponent* AOwner) : 
		TOpenDwgDialog(AOwner) { }
	#pragma option pop
	#pragma option push -w-inl
	/* TOpenDwgDialog.Destroy */ inline __fastcall virtual ~TSaveDwgDialog(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
#define FILTERJPNONLY "DWGÌ§²Ù (*.DWG)|*.DWG|‚·‚×‚Ä‚ÌÌ§²Ù (*.*)|*.*"
#define FILTERJPNALL "DWGÌ§²Ù (*.DWG)|*.DWG|ËÞ¯ÄÏ¯ÌßÌ§²Ù (*.BMP)|*.BMP|WMFÌ§²Ù ("\
	"*.WMF)|*.WMF|‚·‚×‚Ä‚ÌÌ§²Ù (*.*)|*.*"
#define FILTERENGONLY "DWG files (*.DWG)|*.DWG|ALL files (*.*)|*.*"
#define FILTERENGALL "DWG files (*.DWG)|*.DWG|BMP files (*.BMP)|*.BMP|WMF files "\
	"(*.WMF)|*.WMF|ALL files (*.*)|*.*"

}	/* namespace Acdwgdlg */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acdwgdlg;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcDwgDlg
