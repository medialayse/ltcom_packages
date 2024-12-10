unit AcTolReg;

// --------------------------------------------------------------------
//    AutoCAD Customize Tool Components
//                  for Borland Delphi5/Delphi6/Delphi7
//                  for Borland C++Builder5
//
//        Version 1.91
//                                             Programming by GONTA
//
//    http://www.artlex.net/gonta/jpn/     E-MAIL: gonta@artlex.net
//
//    Supported AutoCAD Version.
//              AutoCAD LT95/LT97/LT2000/LT2000i/LT2002/LT2004
//              AutoCAD R13/R14/2000/2000i/2002/2004
// --------------------------------------------------------------------

{$IFNDEF VER120}
{$IFNDEF VER130}
{$WARN UNIT_PLATFORM OFF}
{$WARN SYMBOL_PLATFORM OFF}
{$WARN SYMBOL_DEPRECATED OFF}
{$ENDIF}
{$ENDIF}

// VER90  = Delphi2.0
// VER100 = Delphi3.1
// VER120 = Delphi4.0
// VER130 = Delphi5.0/C++Builder5.0
// VER140 = Delphi6.0
// VER150 = Delphi7.0

interface

uses
	Windows, Classes, SysUtils,
{$IFDEF VER120}
  DsgnIntf,											// Delphi4
{$ELSE}
{$IFDEF VER130}
  DsgnIntf,											// Delphi5/C++Builder5
{$ELSE}
	DesignIntf, DesignEditors,		// Delphi6
{$ENDIF}
{$ENDIF}
  AcadFunc, AcadVInf, AcadUnit, AcadDraw, AcadPlot,
  AcadCtrl, AcadDwgV, AcadClr, AcDwgDlg, AcClrDlg;

// ------------------------------------------------------- Property Editor Class

type
	TDwgFileProperty = class(TStringProperty)
  public
    procedure Edit; override;
    function GetAttributes: TPropertyAttributes; override;
  end;

procedure Register;

implementation

uses
	Dialogs, AcThread;

{$R *.RES}

procedure Register;
// パッケージをDelphiに登録
begin
	RegisterPropertyEditor(TypeInfo(TDwgFileName), TAcadDwgView, '', TDwgFileProperty);
  RegisterComponents('ACADTOOL', [
    TAcadControl,
    TAcadDwgView, TOpenDwgDialog, TSaveDwgDialog,
		TAcadColorBox, TAcadColorDialog
  ]);
end;

// *****************************************************************************

procedure TDwgFileProperty.Edit;
var
	DwgDialog: TOpenDwgDialog;
begin
	DwgDialog := TOpenDwgDialog.Create(nil);	//Application);
  DwgDialog.DwgOnly := False;
	if IsJapanese then
  	DwgDialog.Filter := FILTERJPNALL
  else
	  DwgDialog.Filter := FILTERENGALL;
  DwgDialog.FileName := GetValue;
//  DwgDialog.Filter := SMPOpenFilter;
  DwgDialog.Options := DwgDialog.Options + [ofPathMustExist, ofFileMustExist];
  try
    if DwgDialog.Execute then SetValue(DwgDialog.FileName);
  finally
    DwgDialog.Free;
  end;
end;

function TDwgFileProperty.GetAttributes: TPropertyAttributes;
begin
  Result := [paDialog, paRevertable];
end;

end.
