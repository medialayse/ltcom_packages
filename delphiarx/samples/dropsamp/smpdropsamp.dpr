library smpdropsamp;

//[DELPHIARX2000]
//[2002-D5]

//[VER1.20]
//#########################################################################################################################
//
//                        *************** DelphiARX �̏�����`($DEFINE)�ɂ��� ***************
//
//  DARXFORM  ... �E�B���h�E(Forms���j�b�g)���g�����ɕK����`����B(DelphiARX��Application�ϐ��������I�ɐݒ肵�܂�)
//  DARXCOMS  ... AutoCAD��COM�I�u�W�F�N�g���g�����ɕK����`����B(COM�I�u�W�F�N�g�̓��M�����[�ł̂ݎg���܂�)
//  DARXDEBUG ... �f�o�b�O���[�h�Ńe�X�g����ꍇ�A��`���Ă��������B(�����[�X����ۂ͒�`���O���Ă�������)
//
//                        ***************   ���������v���O�����̔z�z�ɂ���    ***************
//
//  DelphiARX2002 ���쐬����v���O�����t�@�C���́Asmpdropsamp.drx �ł��B
//  ���Ȃ����쐬����smpdropsamp.drx �ƃ����^�C���t�@�C��smpdropsamp.arx ���ꏏ�ɔz�z���Ă��������B
//  AutoCAD�Ƀ��[�h���鎞�́Asmpdropsamp.arx �t�@�C�����w�肵�Ă��������B
//
//                        ***************       �v���W�F�N�g�̍\���ɂ���      ***************
//
//  DelphiARX2002�̃v���W�F�N�g�́A�ȉ��̂悤�ɍ\�����Ă��܂��B
//
//  DelphiARX2002���C�u�������̃t�@�C��
//  [DArx**]file ... DelphiARX2002�̃��C�u�����̒��ŁA���Ȃ������ڗ��p���郉�C�u�����ł��B
//  [Drx***]file ... DelphiARX2002�̓����ŗ��p���Ă���t�@�C���ł��B
//  [**CLib]file ... DelphiARX2002�̓����ŗ��p���Ă���ObjectARX�݊��N���X��`�t�@�C���ł��B
//
//  �v���W�F�N�g�t�H���_���̃t�@�C��
//  DArxEnty.pas ... acrxEntryPoint�֐���R�}���h�o�^���܂ރt�@�C���ł��B���̃t�@�C���𒼐ڕҏW���Ȃ��ł��������B
//  MsgMain.pas  ... acrxEntryPoint�֐��Ŏ󂯎�������b�Z�[�W����������t�@�C���ł��B���̃t�@�C����ҏW���Ă��������B
//  DocMain.pas  ... MDIAware���T�|�[�g���A�h�L�������g���ɊǗ����s�Ȃ��N���X�̒�`�t�@�C���ł��B���̃N���X��ҏW���Ă��������B
//
//#########################################################################################################################

uses
  SysUtils,
  Classes,
  DArxLib,
  DArxEnty in 'DArxEnty.pas',
  DocMain in 'DocMain.pas',
  MsgMain in 'MsgMain.pas',
  DArxH,
  DropUnit in 'DropUnit.pas';

{$E drx}

begin
end.
