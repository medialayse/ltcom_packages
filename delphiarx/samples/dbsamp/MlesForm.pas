unit MlesForm;

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
