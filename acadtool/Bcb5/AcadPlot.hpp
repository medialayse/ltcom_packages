// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadPlot.pas' rev: 5.00

#ifndef AcadPlotHPP
#define AcadPlotHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acadplot
{
//-- type declarations -------------------------------------------------------
//-- var, const, procedure ---------------------------------------------------
extern PACKAGE bool __fastcall SetDefaultPrinter(const int PrinterIndex);
extern PACKAGE bool __fastcall SetDefaultPrinterSize(const int PrinterIndex, short PaperSize, short 
	Orientation);
extern PACKAGE int __fastcall GetPrintersList(const Classes::TStrings* PrtList);

}	/* namespace Acadplot */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acadplot;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadPlot
