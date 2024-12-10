// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcTolReg.pas' rev: 5.00

#ifndef AcTolRegHPP
#define AcTolRegHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <AcClrDlg.hpp>	// Pascal unit
#include <AcDwgDlg.hpp>	// Pascal unit
#include <AcadClr.hpp>	// Pascal unit
#include <AcadDwgV.hpp>	// Pascal unit
#include <AcadCtrl.hpp>	// Pascal unit
#include <AcadPlot.hpp>	// Pascal unit
#include <AcadDraw.hpp>	// Pascal unit
#include <AcadUnit.hpp>	// Pascal unit
#include <AcadVInf.hpp>	// Pascal unit
#include <AcadFunc.hpp>	// Pascal unit
#include <DsgnIntf.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Actolreg
{
//-- type declarations -------------------------------------------------------
class DELPHICLASS TDwgFileProperty;
class PASCALIMPLEMENTATION TDwgFileProperty : public Dsgnintf::TStringProperty 
{
	typedef Dsgnintf::TStringProperty inherited;
	
public:
	virtual void __fastcall Edit(void);
	virtual Dsgnintf::TPropertyAttributes __fastcall GetAttributes(void);
protected:
	#pragma option push -w-inl
	/* TPropertyEditor.Create */ inline __fastcall virtual TDwgFileProperty(const Dsgnintf::_di_IFormDesigner 
		ADesigner, int APropCount) : Dsgnintf::TStringProperty(ADesigner, APropCount) { }
	#pragma option pop
	
public:
	#pragma option push -w-inl
	/* TPropertyEditor.Destroy */ inline __fastcall virtual ~TDwgFileProperty(void) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------
extern PACKAGE void __fastcall Register(void);

}	/* namespace Actolreg */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Actolreg;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcTolReg
