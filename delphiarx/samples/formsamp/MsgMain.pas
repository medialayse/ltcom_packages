unit MsgMain;

//[VER1.20]
// ******************************************************
//     DelphiARX  AutoCAD Entry Messages unit
//
//     DelphiARX2002-D5 AppWizard
// ******************************************************

{$IFNDEF VER130}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
{$IFNDEF VER140}
{$WARN UNSAFE_TYPE OFF}
{$WARN UNSAFE_CODE OFF}
{$WARN UNSAFE_CAST OFF}
{$ENDIF}
{$ENDIF}

interface

uses
	Windows, Messages, SysUtils, Classes, DArxH, DArxObj, DArxAds, DArxEnts;

// NOTE: DO NOT edit the following lines.
procedure InitApplication;
procedure UnloadApplication;
//{{DARX_MSG
//}}DARX_MSG
//{{DARX_APPCMD
//}}DARX_APPCMD

implementation

uses
	DArxLib, DArxApi,
{$IFDEF DARXFORM}
	Forms, DArxForm, DArxCtrl,
//{{DARX_ARXFORMUNIT
	Unit1,  // ArxForm1 Modal Dialog
	// OpenArxForm1({TODO: Your Data});   // TODO: Move to the function which displays a ArxForm1.
	Unit2,  // ArxForm2 Modeless Form Only
	// ShowArxForm2(ArxForm2);   // TODO: Move to the function which displays a ArxForm2.
//}}DARX_ARXFORMUNIT
{$ENDIF}
{$IFDEF DARXDEBUG}
	AdsDebug,
{$ENDIF}
	DArxEnty;

//[INITIALIZATION]**************************************************************

procedure InitApplication;
begin
	// TODO: add your initialization functions
	acutPrintf(#13#10'smpformsamp.arx ... FORM1, FORM2'#13#10);
	ShowArxForm2(ArxDockForm2);   // TODO: Move to the function which displays a ArxForm2.
end;

procedure UnloadApplication;
begin
	// TODO: add your initialization functions

//{{DARX_ARXFORMDESTROY
	CloseArxForm2(ArxDockForm2);   // Modeless Form Only
//}}DARX_ARXFORMDESTROY
end;

//[ENTRYMESSAGE]****************************************************************

// Entry point message handler function


//[APPLICATION]****************************************************************

// Application context commands function

end.
