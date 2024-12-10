unit Unit1;

interface

{$O+}	//---------------------------------------------------------------
{$A+}	// TArxForm �́ADelphiARX��p�̃t�H�[���ł��B
{$W-}	// �ł������ TArxForm ���g���ăt�H�[�����쐬���Ă��������B
{$U+}	// �t�H�[�������[�_���_�C�A���O�Ŏg���ꍇ�́AOpenArxForm1()�֐��̈�����ǉ����Ă��������B
{$V+}	// �t�H�[�������[�h���X�Ŏg���ꍇ�́AShowArxForm1()�֐����Ăяo���Ă��������B
{$B-}	// Wizard �́AShowArxForm1()�֐����R�����g�ɂ��� MsgMain.pas �� DocMain.pas �� Uses�߂ɒǉ����Ă��܂��B
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
 
