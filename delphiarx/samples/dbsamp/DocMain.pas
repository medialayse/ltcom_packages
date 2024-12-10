unit DocMain;

//[VER1.20]
// ******************************************************
//     DelphiARX  The unit to operate par document unit
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
	Windows, Messages, SysUtils, Classes, DArxH, DArxReac, AcApCLib,
{$IFDEF DARXCOMS}
{$IFDEF VER130}
	ComObj,
{$ELSE}
	Variants,
{$ENDIF}
	ACAD_TLB, DArxCom,
{$ENDIF}
	DArxObj, DArxAds, DArxEnts;

type
	////////////////////////////////////////////////////////////////////////////////
	//  TDArxCallbackParam  (NOTE) DO NOT change this name.
	//  NOTE: コールバックを使う場合、darxDocManager.Callbackの引数に以下のレコードポインタを渡してください。
	//        OnCallbackFuncメソッドのpParam引数はPDArxCallbackParamでキャストしてください。
	//
	PDArxCallbackParam = ^TDArxCallbackParam;
	TDArxCallbackParam = record
		docData: TAcApDocument;
		// TODO: Add the data which is necessary for the callback.

	end;

	////////////////////////////////////////////////////////////////////////////////
	//  TDArxDocManager  (NOTE) DO NOT change this name.
	//  NOTE: ドキュメント単位に、データと動作を処理するクラス
	//        １つのドキュメントごとにオブジェクトが自動的に構築されます。
	//
{$IFDEF DARXCOMS}
	TDArxDocManager = class(TDArxComManager)
{$ELSE}
	TDArxDocManager = class(TDArxDocumentReactor)
{$ENDIF}
	private
		{ Your private original variable and method }
		// TODO: あなたの処理に合わせて、メソッドや変数を追加してください。


//{{DARX_ARXMETHODS
		procedure ArxCmdDBSHOW;
//}}DARX_ARXMETHODS
//{{DARX_LISPMETHODS
//}}DARX_LISPMETHODS
	public
		procedure OnArxCommand(const CmdIndex: Integer); override;
		procedure OnLispCommand(const CmdIndex: Integer; var ResCode: Integer); override;
		procedure OnCallCommand(const CmdIndex: Integer; var ResCode: Integer); override;
		procedure OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer); override;

		procedure OnCreated; override;
		procedure OnToBeDestroyed; override;

		procedure OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); override;
		procedure OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString); override;
		procedure OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); override;
		procedure OnBecameCurrent; override;
		procedure OnToBeActivated; override;
		procedure OnToBeDeactivated; override;
		procedure OnActivated; override;
	end;

implementation

uses
	DArxLib, DArxApi,
{$IFDEF DARXFORM}
	Forms, DArxForm, DArxCtrl,
//{{DARX_ARXFORMUNIT
	MlesForm,  // ArxForm1 Modeless Form Only
	// ShowArxForm1(ArxForm1);   // TODO: Move to the function which displays a ArxForm1.
//}}DARX_ARXFORMUNIT
{$ENDIF}
{$IFDEF DARXDEBUG}
	AdsDebug,
{$ENDIF}
	DArxEnty;

{ TDArxDocManager }

procedure TDArxDocManager.OnArxCommand(const CmdIndex: Integer);
begin
//{{DARX_ARXCMD
	case CmdIndex of
		ARXCMD_DBSHOW: ArxCmdDBSHOW;
	end;
//}}DARX_ARXCMD
end;

procedure TDArxDocManager.OnLispCommand(const CmdIndex: Integer; var ResCode: Integer);
begin
//{{DARX_LISPCMD
//}}DARX_LISPCMD
end;


procedure TDArxDocManager.OnCallCommand(const CmdIndex: Integer; var ResCode: Integer);
// TODO: adds your original code.
begin

end;

procedure TDArxDocManager.OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer);
// TODO: もし、コールバックを使う時はParamの注釈を取り除いてください
// var
//	Param: TDArxCallbackParam;
begin
	if pParam = nil then exit;
//	Param := PDArxCallbackParam(pParam)^;
// TODO: adds your original callback code.

end;

procedure TDArxDocManager.OnCreated;
// TODO: add your Document object initialization code.
begin

end;

procedure TDArxDocManager.OnToBeDestroyed;
// TODO: clean up Document object.
begin

end;


procedure TDArxDocManager.OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnBecameCurrent;
begin

end;

procedure TDArxDocManager.OnToBeActivated;
begin

end;

procedure TDArxDocManager.OnToBeDeactivated;
begin

end;

procedure TDArxDocManager.OnActivated;
begin

end;


////////////////////////////////////////////////////////////////////////////////
//{{COMMAND_METHODS

procedure TDArxDocManager.ArxCmdDBSHOW;
begin
	ShowArxForm1(ArxForm1);   // TODO: Move to the function which displays a ArxForm1.
end;

//}}COMMAND_METHODS
////////////////////////////////////////////////////////////////////////////////
// TODO:


end.
