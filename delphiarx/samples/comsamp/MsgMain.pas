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
	DockForm,  // ArxDockForm1 Modeless Form Only
	// ShowArxDockForm1(ArxDockForm1);   // TODO: Move to the function which displays a ArxDockForm1.
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
	acutPrintf(#13#10'smpcomsamp.arx ... COMCIRCLE, COMMENU, COMLEADER, COMPOS'#13#10);
end;

procedure UnloadApplication;
begin
	// TODO: add your initialization functions

//{{DARX_ARXFORMDESTROY
	CloseArxDockForm1(ArxDockForm1);   // Modeless Form Only
//}}DARX_ARXFORMDESTROY
end;

//[ENTRYMESSAGE]****************************************************************

// Entry point message handler function


//[APPLICATION]****************************************************************

// Application context commands function

end.
