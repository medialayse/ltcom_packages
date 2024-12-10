unit DArxForm;

// ******************************************************
//      DelphiARX2002 TApplication Control Library
//
//     Copyright(C)2008 medialayse corporation.
//     2008-05-15  SOFTWARE DESIGN ATELIER SITE
// ******************************************************

interface

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
{$DEFINE DARXFORM}

{$O+}
{$A+}
{$W-}
{$U+}
{$V+}
{$B-}
{$X+}
{$T-}
{$P+}
{$H+}
{$J-}

uses
  Windows, SysUtils, Forms, DArxH;

// ************************************************* DelphiARX Utility Function.

// [ENG] It displays a shape at the center of AutoCAD. ( writing to the OnShow event )
//       [Argument] CenForm =  the TForm derivation class of the configuration of the specification with central display to the center of AutoCAD It specifies (Self).
// [JPN] �w��̃t�H�[����AutoCAD�̒����֕\��(OnShow�C�x���g�ɖ��L)
//       [����] CenForm = �����\������TForm�h���N���X (Self)���w�肷��
procedure darx_FormCenter(CenForm: TForm);

// [ENG] Returns the main window of AutoCAD a focus.
// [JPN] AutoCAD�̃��C���E�B���h�E�Ƀt�H�[�J�X��߂��܂�
procedure darx_AcadFocus;

// [ENG] It returns the top document of AutoCAD a focus.
// [JPN] AutoCAD�̃g�b�v�h�L�������g�Ƀt�H�[�J�X��߂��܂�
procedure darx_DocFocus;

// [ENG] Inspects whether or not the Form of the specification exists without presenting an error.
// [JPN] �w��̃t�H�[�������݂��Ă��邩�A�G���[���o�����Ɍ�������
function darx_FormAssigned(const Form: TForm): Boolean;

// [ENG] It closes a mho dull DIALOG in case of ARX ending.
// [JPN] �`�q�w�I�����Ƀ��[�_���_�C�A���O�����
procedure darx_CloseModalDialog;

var
  ArxModalDialog: TForm = nil;

implementation

uses
  Controls, Messages, DArxLib, ArxRunEx, AextCLib;

procedure darx_FormCenter(CenForm: TForm);
// �w��̃t�H�[����AutoCAD�̒����֕\�����܂�
var
  lpRC: TRECT;
begin
  if (NOT Assigned(CenForm))or(NOT GetWindowRect(adsw_hwndAcad, lpRC)) then exit;
  lpRC.Left := (lpRC.Right - lpRC.Left - CenForm.Width) div 2 + lpRC.Left;
  lpRC.Top := (lpRC.Bottom - lpRC.Top - CenForm.Height) div 2 + lpRC.Top;
  if ((lpRC.Left + CenForm.Width) > Screen.Width) then lpRC.Left := Screen.Width - CenForm.Width;
  if ((lpRC.Top + CenForm.Height) > Screen.Height) then lpRC.Top := Screen.Height - CenForm.Height;
  if (0 > lpRC.Left) then lpRC.Left := 0;
  if (0 > lpRC.Top) then lpRC.Top := 0;
  CenForm.SetBounds(lpRC.Left, lpRC.Top, CenForm.Width, CenForm.Height);
end;

procedure darx_AcadFocus;
// AutoCAD�Ƀt�H�[�J�X��߂��܂�
begin
  Application.ProcessMessages;
  Windows.SetForegroundWindow(extern_adsw_acadMainWnd);
  extern_darxAcadUpDate;
  Application.ProcessMessages;
end;

procedure darx_DocFocus;
// AutoCAD�̃g�b�v�h�L�������g�Ƀt�H�[�J�X��߂��܂�
var
  hCwnd: HWND;
begin
  hCwnd := extern_adsw_acadDocWnd;
  if hCwnd = 0 then exit;
  Application.ProcessMessages;
  Windows.SetFocus(hCwnd);
  extern_darxAcadUpDate;
  Application.ProcessMessages;
end;

function darx_FormAssigned(const Form: TForm): Boolean;
// �w��̃t�H�[�������蓖�Ă��Ă��邩��������
begin
  try
    Result := (Assigned(Form))and(Form.HandleAllocated);
  except
    Result := False;
  end;
end;

// [JPN] �`�q�w�I�����Ƀ��[�_���_�C�A���O�����
procedure darx_CloseModalDialog;
begin
  if ArxModalDialog = nil then exit;
  try
    ArxModalDialog.ModalResult := mrCancel;
    if Windows.IsWindow(ArxModalDialog.Handle) then SendMessage(ArxModalDialog.Handle, WM_CLOSE, 0, 0);
    while (ArxModalDialog <> nil) do Application.ProcessMessages;
  except
    ArxModalDialog := nil;
  end;
end;

end.
