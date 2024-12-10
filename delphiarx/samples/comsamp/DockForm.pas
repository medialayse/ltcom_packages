unit DockForm;

interface

{$O+}	//---------------------------------------------------------------
{$A+}	// TArxDockForm �́ADelphiARX��p�̃t�H�[���ł��B
{$W-}	// �ł������ TArxDockForm ���g���ăt�H�[�����쐬���Ă��������B
{$U+}	// �t�H�[�������[�_���_�C�A���O�Ŏg���ꍇ�́AOpenArxDockForm1()�֐��̈�����ǉ����Ă��������B
{$V+}	// �t�H�[�������[�h���X�Ŏg���ꍇ�́AShowArxDockForm1()�֐����Ăяo���Ă��������B
{$B-}	// Wizard �́AShowArxDockForm1()�֐����R�����g�ɂ��� MsgMain.pas �� DocMain.pas �� Uses�߂ɒǉ����Ă��܂��B
{$X+}	// ���̊֐������s�ł���悤�ɁA�E�B���h�E�\������֐��̒��Ɉړ����Ă��������B
{$T-}	// TDArxDockBar �� TDArxToolBar �R���|�[�l���g�� TArxDockForm �����ɓ\��t���Ďg�����Ƃ��ł��܂��B
{$P+}	// TDArxDockBar �� TDArxToolBar �R���|�[�l���g�͓����ɓ\��t���ł��܂���B
{$H+}	// �h�b�L���O�o�[��c�[���o�[�́ABorderStyle�AFormStyle�APosition�AWindowStyle�̃v���p�e�B��ݒ肵�Ȃ��ł��������B
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
