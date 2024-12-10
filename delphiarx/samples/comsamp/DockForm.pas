unit DockForm;

interface

{$O+}	//---------------------------------------------------------------
{$A+}	// TArxDockForm は、DelphiARX専用のフォームです。
{$W-}	// できる限り TArxDockForm を使ってフォームを作成してください。
{$U+}	// フォームをモーダルダイアログで使う場合は、OpenArxDockForm1()関数の引数を追加してください。
{$V+}	// フォームをモードレスで使う場合は、ShowArxDockForm1()関数を呼び出してください。
{$B-}	// Wizard は、ShowArxDockForm1()関数をコメントにして MsgMain.pas と DocMain.pas の Uses節に追加しています。
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
{$IFDEF VER130}
	ComObj,
{$ELSE}
	Variants,
{$ENDIF}
	DArxH, DArxCtrl, ArxRunEx, DArxObj, DArxAds, DArxEnts, StdCtrls, ComCtrls;

type
	TArxDockForm1 = class(TArxDockForm)
		ArxDockBar: TDArxDockBar;
    PageControl1: TPageControl;
    TabSheet1: TTabSheet;
    TabSheet2: TTabSheet;
    ListBox1: TListBox;
    Button1: TButton;
    Button2: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
	private
		{ Your private method }

	public
		{ Your public method }

	end;

var
	ArxDockForm1: TArxDockForm1 = nil;   // Modeless Form Only

// Show Modeless Form Function
procedure ShowArxDockForm1(var ArxForm: TArxDockForm1);
// Close Modeless Form Function
procedure CloseArxDockForm1(var ArxForm: TArxDockForm1);

implementation

{$R *.DFM}

uses
	DArxLib, DArxForm, DArxApi, DArxDoc, ACAD_TLB, DArxCom;

////////////////////////////////////////////////////////////////////////////////

procedure ShowArxDockForm1(var ArxForm: TArxDockForm1);
begin
	try
		if (ArxForm = nil) then ArxForm := TArxDockForm1.Create(Application);
		ArxForm.ShowTool;
	except
		ArxForm := nil;
	end;
end;

procedure CloseArxDockForm1(var ArxForm: TArxDockForm1);
begin
	if (ArxForm = nil) then exit;
	try
		ArxForm.Close;
		ArxForm.Free;
	finally
		ArxForm := nil;
	end;
end;

////////////////////////////////////////////////////////////////////////////////

procedure TArxDockForm1.Button1Click(Sender: TObject);
begin
  ListBox1.Clear;
end;

procedure TArxDockForm1.Button2Click(Sender: TObject);
	function GetPoint(const Utility: IAcadUtility; const NextPos: Boolean; var Point: TAds_Point): Boolean;
  var
	  pt: OleVariant;
  begin
  	try
      if NextPos then begin
	      pt := Utility.GetPoint(Var3DPoint(Point), 'Check points');
      end else begin
	      pt := Utility.GetPoint(EmptyParam, 'Check points');   // EmptyParam = system unit.
      end;
      Point := Ads3DPoint(pt);
      Result := True;
    except
      Result := False;
    end;
	end;
var
	AcadObj: TDArxComApplication;
  rNext: Boolean;
  pta, ptb: TAds_Point;
begin
	acDocManager.lockDocument(acDocManager.curDocument);
  try
		AcadObj := TDArxComApplication.Create;
    try
      darx_DocFocus;
    	rNext := False;
      while (GetPoint(AcadObj.Utility, rNext, ptb)) do begin
        PageControl1.ActivePage := TabSheet2;
	      ListBox1.Items.Add(FloatToStr(ptb[x]) + ',' + FloatToStr(ptb[y]) + ',' + FloatToStr(ptb[z]));
        if rNext then AcadObj.ModelSpace.AddLine(Var3DPoint(pta), Var3DPoint(ptb));
        pta := ptb;
	    	rNext := True;
      end;
    finally
      AcadObj.Free;
    end;
  finally
		acDocManager.unlockDocument(acDocManager.curDocument);
  end;
end;

end.
