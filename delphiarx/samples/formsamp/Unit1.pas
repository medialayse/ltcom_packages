unit Unit1;

interface

{$O+}	//---------------------------------------------------------------
{$A+}	// TArxForm は、DelphiARX専用のフォームです。
{$W-}	// できる限り TArxForm を使ってフォームを作成してください。
{$U+}	// フォームをモーダルダイアログで使う場合は、OpenArxForm1()関数の引数を追加してください。
{$V+}	// フォームをモードレスで使う場合は、ShowArxForm1()関数を呼び出してください。
{$B-}	// Wizard は、ShowArxForm1()関数をコメントにして MsgMain.pas と DocMain.pas の Uses節に追加しています。
{$X+}	// この関数が実行できるように、ウィンドウ表示する関数の中に移動してください。
{$T-}	// TDArxDockBar や TDArxToolBar コンポーネントは TArxDockForm だけに貼り付けて使うことができます。
{$P+}	// TDArxDockBar と TDArxToolBar コンポーネントは同時に貼り付けできません。
{$H+}	// ドッキングバーやツールバーは、BorderStyle、FormStyle、Position、WindowStyleのプロパティを設定しないでください。
{$J-}	//---------------------------------------------------------------
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

uses
	Windows, Messages, SysUtils, Classes, Graphics, Controls, Forms, Dialogs,
	DArxH, DArxCtrl, ArxRunEx, DArxObj, DArxAds, DArxEnts, StdCtrls;

type
  TArxForm1Rec = record
    CirRAD: Double;
    HexLen: Double;
  end;

	TArxForm1 = class(TArxForm)
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Edit1: TEdit;
    Edit2: TEdit;
    btnOK: TButton;
    btnCANCEL: TButton;
    procedure FormCreate(Sender: TObject);
    procedure EditKeyPress(Sender: TObject; var Key: Char);
    procedure btnOKClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
	private
		{ Your private method }

	public
		{ Your public method }
    FParam: TArxForm1Rec;

	end;

// Show Modal Dialog Function
function OpenArxForm1(var AParam: TArxForm1Rec{TODO: Your Data}): Boolean;

implementation

{$R *.DFM}

uses
	DArxLib, DArxForm, DArxApi, DArxDoc;

////////////////////////////////////////////////////////////////////////////////

function OpenArxForm1(var AParam: TArxForm1Rec{TODO: Your Data}): Boolean;
var
	ArxForm: TArxForm1;
begin
	ArxForm := TArxForm1.Create(Application);
	try
		// TODO: Your Data -> ArxForm
    ArxForm.FParam := AParam;
		Result := (ArxForm.ShowModal = idOK);
		if NOT Result then exit;
		// TODO: ArxForm -> Your Data
    AParam := ArxForm.FParam;
	finally
		ArxForm.Free;
	end;
end;

////////////////////////////////////////////////////////////////////////////////

function ChkFloatToStr(Str: AnsiString; var Value: Double): Boolean;
var
  eVal: Extended;
begin
  if Str = '' then begin
    Value := 0;
    Result := True;
    exit;
  end;
  try
    Result := TextToFloat(PChar(Str), eVal, fvExtended);
    if NOT Result then exit;
    Value := eVal;
  except
    Result := False;
  end;
end;

procedure TArxForm1.FormCreate(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
end;

procedure TArxForm1.EditKeyPress(Sender: TObject; var Key: Char);
begin
  if Key <> #13 then exit;
  Key := #0;
  if Edit1 = Sender then begin
    Edit2.SetFocus;
  end else if Edit2 = Sender then begin
    btnOK.SetFocus;
  end;
end;

procedure TArxForm1.btnOKClick(Sender: TObject);
begin
  if NOT ChkFloatToStr(Trim(Edit1.Text), FParam.CirRAD) then begin
    beep;
    Edit1.SetFocus;
    exit;
  end;
  if NOT ChkFloatToStr(Trim(Edit2.Text), FParam.HexLen) then begin
    beep;
    Edit2.SetFocus;
    exit;
  end;
  ModalResult := mrOK;
end;

procedure TArxForm1.FormShow(Sender: TObject);
begin
  if FParam.CirRAD <> 0 then Edit1.Text := FloatToStr(FParam.CirRAD);
  if FParam.HexLen <> 0 then Edit2.Text := FloatToStr(FParam.HexLen);
end;

end.
 
