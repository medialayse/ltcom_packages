//---------------------------------------------------------------------------

#include <vcl.h>
#pragma hdrstop
USERES("AcadTool.res");
USEPACKAGE("vcl50.bpi");
USEPACKAGE("vclx50.bpi");
USEPACKAGE("dsnide50.bpi");
USEUNIT("AcTolReg.pas");
USEUNIT("AcadFunc");
USEUNIT("AcadVInf");
USEUNIT("AcadUnit");
USEUNIT("AcadDraw");
USEUNIT("AcadClr");
USEUNIT("AcadPlot");
USEUNIT("AcadCtrl");
USEUNIT("AcadDwgV");
USEUNIT("AcClrDlg");
USEUNIT("AcDwgDlg");
USEUNIT("AcThread");
//---------------------------------------------------------------------------
#pragma package(smart_init)
//---------------------------------------------------------------------------

//   Package source.
//---------------------------------------------------------------------------

#pragma argsused
int WINAPI DllEntryPoint(HINSTANCE hinst, unsigned long reason, void*)
{
	return 1;
}
//---------------------------------------------------------------------------
