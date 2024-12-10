unit Unit2;

interface

{$O+}	//---------------------------------------------------------------
{$A+}	// TArxForm �́ADelphiARX��p�̃t�H�[���ł��B
{$W-}	// �ł������ TArxForm ���g���ăt�H�[�����쐬���Ă��������B
{$U+}	// �t�H�[�������[�_���_�C�A���O�Ŏg���ꍇ�́AOpenArxForm2()�֐��̈�����ǉ����Ă��������B
{$V+}	// �t�H�[�������[�h���X�Ŏg���ꍇ�́AShowArxForm2()�֐����Ăяo���Ă��������B
{$B-}	// Wizard �́AShowArxForm2()�֐����R�����g�ɂ��� MsgMain.pas �� DocMain.pas �� Uses�߂ɒǉ����Ă��܂��B
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
  TArxDockForm2 = class(TArxDockForm)
    ArxDockBar: TDArxDockBar;
    Button1: TButton;
    Button2: TButton;
    Button3: TButton;
    Button4: TButton;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure Button3Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
	private
		{ Your private method }

	public
		{ Your public method }

	end;

var
  ArxDockForm2: TArxDockForm2 = nil;   // Modeless Form Only

// Show Modeless Form Function
procedure ShowArxForm2(var ArxForm: TArxDockForm2);
// Close Modeless Form Function
procedure CloseArxForm2(var ArxForm: TArxDockForm2);

implementation

{$R *.DFM}

uses
	DArxLib, DArxForm, DArxApi, DArxDoc;

////////////////////////////////////////////////////////////////////////////////

procedure ShowArxForm2(var ArxForm: TArxDockForm2);
begin
  if (ArxForm = nil) then
    ArxForm := TArxDockForm2.Create(Application)
  else
    ArxForm.ShowTool;
end;

procedure CloseArxForm2(var ArxForm: TArxDockForm2);
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

procedure TArxDockForm2.Button1Click(Sender: TObject);
begin
	if acDocManager.curDocument = nil then exit;
	darx_DocFocus;
  acedPostCommand(#3 + 'FORM2CMD' + #13);
end;

procedure TArxDockForm2.Button2Click(Sender: TObject);
var
  pt: Tads_point;
  ResObj: TDResbufItem;
begin
	if acDocManager.curDocument = nil then exit;
  Button2.Enabled := False;
  // acedCommand style (ERROR!)
  if darxIsJapanese then
    darxMessageBox('�R�}���h���[�v�ȊO����AcedCommand�����s�ł��܂���B', 'Form2 - INSIDE CALL', 0)
  else
    darxMessageBox('AcedCommand can not be executed from the thing except the command loop.', 'Form2 - INSIDE CALL', 0);
	darx_DocFocus;
  // When changing a document, it be possible to write and lock.
  // [JPN]�h�L�������g��ύX����Ƃ��́A�������݉\�Ń��b�N���邱��
  acDocManager.lockDocument(acDocManager.curDocument);
  try
    if acedGetPoint(nil, #13#10'Command Point?: ', pt) <> RTNORM then exit;
    acutPrintf(#13#10);
    ResObj := TDResbufItem.Create;
    try
      ResObj.Add(RTSTR, 'CIRCLE');
      ResObj.Add(RTPOINT, pt);
      ResObj.Add(RTREAL, 100);
      ResObj.SendCmd;
    finally
      ResObj.Free;
    end;
  finally
    // If doing a lock, cancel.
    // ���b�N��������A�������s������
    acDocManager.unlockDocument(acDocManager.curDocument);
    Button2.Enabled := True;
  end;
end;

procedure TArxDockForm2.Button3Click(Sender: TObject);
var
  pt: Tads_point;
  EntObj: TDArxEntMake;
begin
	if acDocManager.curDocument = nil then exit;
	darx_DocFocus;
	Button3.Enabled := False;
  // When changing a document, it be possible to write and lock.
  // [JPN]�h�L�������g��ύX����Ƃ��́A�������݉\�Ń��b�N���邱��
  acDocManager.lockDocument(acDocManager.curDocument);
  try
    if acedGetPoint(nil, #13#10'Entmake Point?: ', pt) <> RTNORM then exit;
    acutPrintf(#13#10);
    EntObj := TDArxEntMake.Create;
    try
      EntObj.Circle(pt, 100.0);
      EntObj.Polygon(pt, 6, 100.0);
    finally
      EntObj.Free;
    end;
  finally
    // If doing a lock, cancel.
    // ���b�N��������A�������s������
    acDocManager.unlockDocument(acDocManager.curDocument);
		Button3.Enabled := True;
  end;
end;

procedure TArxDockForm2.Button4Click(Sender: TObject);
begin
	if acDocManager.curDocument = nil then exit;
	darx_DocFocus;
  acDocManager.sendStringToExecute(acDocManager.curDocument, #3 + 'FORM2CMD' + #13, True, False, False);
end;

end.
 
