library smpdropsamp;

//[DELPHIARX2000]
//[2002-D5]

//[VER1.20]
//#########################################################################################################################
//
//                        *************** DelphiARX の条件定義($DEFINE)について ***************
//
//  DARXFORM  ... ウィンドウ(Formsユニット)を使う時に必ず定義する。(DelphiARXがApplication変数を自動的に設定します)
//  DARXCOMS  ... AutoCADのCOMオブジェクトを使う時に必ず定義する。(COMオブジェクトはレギュラー版のみ使えます)
//  DARXDEBUG ... デバッグモードでテストする場合、定義してください。(リリースする際は定義を外してください)
//
//                        ***************   完成したプログラムの配布について    ***************
//
//  DelphiARX2002 が作成するプログラムファイルは、smpdropsamp.drx です。
//  あなたが作成したsmpdropsamp.drx とランタイムファイルsmpdropsamp.arx を一緒に配布してください。
//  AutoCADにロードする時は、smpdropsamp.arx ファイルを指定してください。
//
//                        ***************       プロジェクトの構成について      ***************
//
//  DelphiARX2002のプロジェクトは、以下のように構成しています。
//
//  DelphiARX2002ライブラリ内のファイル
//  [DArx**]file ... DelphiARX2002のライブラリの中で、あなたが直接利用するライブラリです。
//  [Drx***]file ... DelphiARX2002の内部で利用しているファイルです。
//  [**CLib]file ... DelphiARX2002の内部で利用しているObjectARX互換クラス定義ファイルです。
//
//  プロジェクトフォルダ内のファイル
//  DArxEnty.pas ... acrxEntryPoint関数やコマンド登録を含むファイルです。このファイルを直接編集しないでください。
//  MsgMain.pas  ... acrxEntryPoint関数で受け取ったメッセージを処理するファイルです。このファイルを編集してください。
//  DocMain.pas  ... MDIAwareをサポートし、ドキュメント毎に管理を行なうクラスの定義ファイルです。このクラスを編集してください。
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
