unit MlesForm;

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
	DArxH, DArxCtrl, ArxRunEx, DArxObj, DArxAds, DArxEnts, Db, DBTables,
  Grids, DBGrids;

type
	TArxForm1 = class(TArxForm)
    DataSource1: TDataSource;
    DBGrid1: TDBGrid;
    Table1: TTable;
	private
		{ Your private method }

	public
		{ Your public method }

	end;

var
	ArxForm1: TArxForm1 = nil;   // Modeless Form Only

// Show Modeless Form Function
procedure ShowArxForm1(var ArxForm: TArxForm1);
// Close Modeless Form Function
procedure CloseArxForm1(var ArxForm: TArxForm1);

implementation

{$R *.DFM}

uses
	DArxLib, DArxForm, DArxApi, DArxDoc;

////////////////////////////////////////////////////////////////////////////////

procedure ShowArxForm1(var ArxForm: TArxForm1);
begin
	try
		if (ArxForm = nil) then ArxForm := TArxForm1.Create(Application);
		ArxForm.ShowTool;
	except
		ArxForm := nil;
	end;
end;

procedure CloseArxForm1(var ArxForm: TArxForm1);
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

end.
