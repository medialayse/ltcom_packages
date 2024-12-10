unit DocMain;

//[VER1.20]
// ******************************************************
//     DelphiARX  The unit to operate par document unit
//
//     DelphiARX2002-D5 AppWizard
// ******************************************************

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

interface

uses
	Windows, Messages, SysUtils, Classes, DArxH, DArxReac, AcApCLib,
{$IFDEF DARXCOMS}
{$IFDEF VER130}
	ComObj,
{$ELSE}
	Variants,
{$ENDIF}
	ACAD_TLB, DArxCom,
{$ENDIF}
	DArxObj, DArxAds, DArxEnts;

type
	////////////////////////////////////////////////////////////////////////////////
	//  TDArxCallbackParam  (NOTE) DO NOT change this name.
	//  NOTE: コールバックを使う場合、darxDocManager.Callbackの引数に以下のレコードポインタを渡してください。
	//        OnCallbackFuncメソッドのpParam引数はPDArxCallbackParamでキャストしてください。
	//
	PDArxCallbackParam = ^TDArxCallbackParam;
	TDArxCallbackParam = record
		docData: TAcApDocument;
		// TODO: Add the data which is necessary for the callback.

	end;

	////////////////////////////////////////////////////////////////////////////////
	//  TDArxDocManager  (NOTE) DO NOT change this name.
	//  NOTE: ドキュメント単位に、データと動作を処理するクラス
	//        １つのドキュメントごとにオブジェクトが自動的に構築されます。
	//
{$IFDEF DARXCOMS}
	TDArxDocManager = class(TDArxComManager)
{$ELSE}
	TDArxDocManager = class(TDArxDocumentReactor)
{$ENDIF}
	private
		{ Your private original variable and method }
		// TODO: あなたの処理に合わせて、メソッドや変数を追加してください。
    // ENTS コマンドの変数保持
    FEntsNameBuff: String;
    // CHARACTER コマンドの変数保持
    FCharacterStr: String;
    // CIRCLES コマンドの変数保持
    FCirclesNum: Integer;

//{{DARX_ARXMETHODS
		procedure ArxCmdENTS;
		procedure ArxCmdBIKE;
		procedure ArxCmdBOXS;
		procedure ArxCmdNUT;
		procedure ArxCmdSTAR;
		procedure ArxCmdCHAR;
		procedure ArxCmdLAY;
		procedure ArxCmdMLTYPE;
//}}DARX_ARXMETHODS
//{{DARX_LISPMETHODS
		procedure LispCmdCIRCLES(var ResCode: Integer);
//}}DARX_LISPMETHODS
	public
		procedure OnArxCommand(const CmdIndex: Integer); override;
		procedure OnLispCommand(const CmdIndex: Integer; var ResCode: Integer); override;
		procedure OnCallCommand(const CmdIndex: Integer; var ResCode: Integer); override;
		procedure OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer); override;

		procedure OnCreated; override;
		procedure OnToBeDestroyed; override;

		procedure OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); override;
		procedure OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString); override;
		procedure OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString); override;
		procedure OnBecameCurrent; override;
		procedure OnToBeActivated; override;
		procedure OnToBeDeactivated; override;
		procedure OnActivated; override;
	end;

implementation

uses
	DArxLib, DArxApi,
{$IFDEF DARXFORM}
	Forms, DArxForm, DArxCtrl,
//{{DARX_ARXFORMUNIT
//}}DARX_ARXFORMUNIT
{$ENDIF}
{$IFDEF DARXDEBUG}
	AdsDebug,
{$ENDIF}
	DArxEnty, DArxGeo, EntsUnit;

{ TDArxDocManager }

procedure TDArxDocManager.OnArxCommand(const CmdIndex: Integer);
begin
//{{DARX_ARXCMD
	case CmdIndex of
		ARXCMD_ENTS: ArxCmdENTS;
		ARXCMD_BIKE: ArxCmdBIKE;
		ARXCMD_BOXS: ArxCmdBOXS;
		ARXCMD_NUT: ArxCmdNUT;
		ARXCMD_STAR: ArxCmdSTAR;
		ARXCMD_CHAR: ArxCmdCHAR;
		ARXCMD_LAY: ArxCmdLAY;
		ARXCMD_MLTYPE: ArxCmdMLTYPE;
	end;
//}}DARX_ARXCMD
end;

procedure TDArxDocManager.OnLispCommand(const CmdIndex: Integer; var ResCode: Integer);
begin
//{{DARX_LISPCMD
	case CmdIndex of
		LISPCMD_CIRCLES: LispCmdCIRCLES(ResCode);
	end;
//}}DARX_LISPCMD
end;


procedure TDArxDocManager.OnCallCommand(const CmdIndex: Integer; var ResCode: Integer);
// TODO: adds your original code.
begin

end;

procedure TDArxDocManager.OnCallbackFunc(const CallbackNo: Integer; const pParam: Pointer);
// TODO: もし、コールバックを使う時はParamの注釈を取り除いてください
// var
//	Param: TDArxCallbackParam;
begin
	if pParam = nil then exit;
//	Param := PDArxCallbackParam(pParam)^;
// TODO: adds your original callback code.

end;

procedure TDArxDocManager.OnCreated;
// TODO: add your Document object initialization code.
begin
	FEntsNameBuff := '';
end;

procedure TDArxDocManager.OnToBeDestroyed;
// TODO: clean up Document object.
begin

end;


procedure TDArxDocManager.OnLockModeWillChange(myCurrentMode: TAcAp_DocLockMode; myNewMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnLockModeChangeVetoed(const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnLockModeChanged(myPreviousMode: TAcAp_DocLockMode; myCurrentMode: TAcAp_DocLockMode; currentMode: TAcAp_DocLockMode; const pGlobalCmdName: AnsiString);
begin

end;

procedure TDArxDocManager.OnBecameCurrent;
begin

end;

procedure TDArxDocManager.OnToBeActivated;
begin

end;

procedure TDArxDocManager.OnToBeDeactivated;
begin

end;

procedure TDArxDocManager.OnActivated;
begin

end;


////////////////////////////////////////////////////////////////////////////////
//{{COMMAND_METHODS

procedure TDArxDocManager.ArxCmdENTS;
var
	sCap, sEnt: String;
begin
	repeat
  	sCap := #13#10'Makes Entities (?=All Names)';
    if FEntsNameBuff <> '' then sCap := sCap + ' <' + FEntsNameBuff + '>';
	  if acedGetString(True,  sCap + ': ', sEnt) <> RTNORM then break;
    if (sEnt <> '') then FEntsNameBuff := AnsiUpperCase(Trim(sEnt));
	until (MakesEntities(FEntsNameBuff));
end;

procedure TDArxDocManager.ArxCmdBIKE;
// BIKE
// It makes a group entitiy.                              //[JPN] グループエンティティを作成
var
  pt1, pt2, pt3: Tads_point;
  EntObj: TDArxEntMake;
  Angle, Len: Real;
begin
  if acedGetPoint(nil, #13 + 'First Point: ', pt1) <> RTNORM then exit;
  if acedGetPoint(pt1, #13 + 'Second Point: ', pt2) <> RTNORM then exit;
  // The building of an entity making class.              //[JPN] エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  try
    // The making procedure of the group.                   //[JPN] グループの作成手続き
    EntObj.MakeGroup;
    // It makes an entity.                                  //[JPN] エンティティを作成
    EntObj.Circle(pt1, 20);
    EntObj.Circle(pt2, 20);
    EntObj.Line(pt1, pt2);
    Angle := RadToDeg(acutAngle(pt1, pt2));                 // DArxGeo.RadToDeg
    Len := acutDistance(pt1, pt2);
    acutPolar(pt1, DegToRad(Angle + 60), Len * 0.8, pt3);   // DArxGeo.DegToRad
    EntObj.Line(pt1, pt3);
    acutPolar(pt1, DegToRad(Angle + 60), Len * 0.5, pt3);
    EntObj.Line(pt2, pt3);
    // The execution of the grouping. (not name)            //[JPN]グループ化の実行(名前なし)
    EntObj.EndGroup('*', 'BIKE', True);
  finally
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  EntObj.Free;
  end;
end;

procedure TDArxDocManager.ArxCmdBOXS;
// BOX
var
  ni: Integer;
  dAng: Double;
  pt1, pt2: Tads_point;
  EntObj: TDArxEntMake;
begin
  // Gets a coordinate.                                   //[JPN]座標を取得
  if acedGetPoint(nil, #13 + 'Left&Top Corner: ', pt1) <> RTNORM then exit;
  // Gets a coordinate.                                   //[JPN]座標を取得
  if acedGetCorner(pt1, #13 + 'Right&Bottom Corner: ', pt2) <> RTNORM then exit;
  // The building of an entity making class.              //[JPN] エンティティ作図クラスの構築
  dAng := 0;
  EntObj := TDArxEntMake.Create;
  try
	  for ni := 0 to 44 do begin
    	EntObj.Rectang(pt1, pt2, dAng);
  	  dAng := dAng + (PI / 45);
	  end;
  finally
	  EntObj.Free;
  end;
end;

procedure TDArxDocManager.ArxCmdNUT;
// NUT
// It makes a block entity.                               //[JPN]ブロックエンティティを作成
var
  pt: Tads_point;
  pt0, pt1, pt2, pt3, pt4, pt5, pt6, pt7, pt8, pt9, pt10, pt11: Tads_point;
  NameObj: TDEntNameItem;
  EntObj: TDArxEntMake;
  BlockName: String;
begin
  // Gets a coordinate.                                   //[JPN]座標を取得
  if acedGetPoint(nil, #13 + 'Center Point: ', pt) <> RTNORM then exit;
  // The building of an entity making class.              //[JPN] エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  // The building of an entity name making class.         //[JPN] エンティティ名クラスの構築
  NameObj := TDEntNameItem.Create;
  try
    if NOT NameObj.GetTableName('BLOCK', 'PaintBlock') then begin
      // The making procedure in the block with the name.     //[JPN]名前付きブロックの作成手続き
      EntObj.MakeBlock('PaintBlock');
      // It makes an entity.                                  //[JPN] エンティティを作成
      EntObj.Circle(ads_point(0, 0, 0), 20);
      EntObj.Circle(ads_point(0, 0, 25), 20);
      acutPolar(ads_point(0, 0, 0), DegToRad(0), 50, pt0);
      acutPolar(ads_point(0, 0, 0), DegToRad(60), 50, pt1);
      acutPolar(ads_point(0, 0, 0), DegToRad(120), 50, pt2);
      acutPolar(ads_point(0, 0, 0), DegToRad(180), 50, pt3);
      acutPolar(ads_point(0, 0, 0), DegToRad(240), 50, pt4);
      acutPolar(ads_point(0, 0, 0), DegToRad(300), 50, pt5);
      EntObj.Line(pt0, [pt1, pt2, pt3, pt4, pt5, pt0]);
      acutPolar(ads_point(0, 0, 25), DegToRad(0), 50, pt6);
      acutPolar(ads_point(0, 0, 25), DegToRad(60), 50, pt7);
      acutPolar(ads_point(0, 0, 25), DegToRad(120), 50, pt8);
      acutPolar(ads_point(0, 0, 25), DegToRad(180), 50, pt9);
      acutPolar(ads_point(0, 0, 25), DegToRad(240), 50, pt10);
      acutPolar(ads_point(0, 0, 25), DegToRad(300), 50, pt11);
      EntObj.Line(pt6, [pt7, pt8, pt9, pt10, pt11, pt6]);
      EntObj.Line(pt0, pt6);
      EntObj.Line(pt1, pt7);
      EntObj.Line(pt2, pt8);
      EntObj.Line(pt3, pt9);
      EntObj.Line(pt4, pt10);
      EntObj.Line(pt5, pt11);
      // It makes a block and it gets a block name.           //[JPN]ブロックを作成し、ブロック名を得る
      BlockName := EntObj.EndBlock;
    end else begin
      BlockName := 'PaintBlock';
    end;
	  // The insertion of the block.                          //[JPN]ブロックの挿入
  	EntObj.Insert(BlockName, pt);
  finally
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  NameObj.Free;
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  EntObj.Free;
  end;
end;

procedure TDArxDocManager.ArxCmdSTAR;
// STAR
// It makes an ordinary entity.                           //[JPN]普通のエンティティを作成
var
  pt1, pt2, pt3, pt4: Tads_point;
  EntObj: TDArxEntMake;
  Len, Angle: Real;
begin
  if acedGetPoint(nil, #13 + 'First Point: ', pt1) <> RTNORM then exit;
  if acedGetPoint(pt1, #13 + 'Second Point: ', pt2) <> RTNORM then exit;
  // The building of an entity making class.              //[JPN] エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  try
    Angle := acutAngle(pt1, pt2);
    Len := acutDistance(pt1, pt2);
    EntObj.Arc(pt1, Len / 2, Angle + DegToRad(270), Angle + DegToRad(360));
    EntObj.Arc(pt2, Len / 2, Angle + DegToRad(180), Angle + DegToRad(270));
    acutPolar(pt1, Angle + DegToRad(270), Len, pt3);
    EntObj.Arc(pt3, Len / 2, Angle + DegToRad(0), Angle + DegToRad(90));
    acutPolar(pt3, Angle, Len, pt4);
    EntObj.Arc(pt4, Len / 2, Angle + DegToRad(90), Angle + DegToRad(180));
  finally
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  EntObj.Free;
  end;
end;

procedure TDArxDocManager.ArxCmdCHAR;
// CHAR
// It inserts a character string.                         //[JPN]文字を挿入
var
  pt0: TAds_point;
  EntObj: TDArxEntMake;
  Str: String;
begin
  Str := '';
  if acedGetString(False, 'String[' + FCharacterStr + ']: ', Str) <> RTNORM then exit;
  if Str <> '' then FCharacterStr := Str;
  if acedGetPoint(nil, #13 + 'Center Point: ', pt0) <> RTNORM then exit;
  // The building of an entity making class.              //[JPN]エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  try
  	// It specifies a center.                               //[JPN]中心を指定
	  EntObj.TextJustify := tjCenter;
  	// The entering of a character string.                  //[JPN]文字列の記入
	  EntObj.Text(pt0, FCharacterStr, 6);
  finally
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  EntObj.Free;
  end;
end;

procedure TDArxDocManager.ArxCmdLAY;
// LAY
// The table entity example.                              //[JPN]テーブルエンティティ例
	function CheckLy1Ly2: Boolean;
	var
  	rChk1, rChk2: Boolean;
  	NameObj: TDEntNameItem;
	  TblObj: TDArxTableMake;
  begin
    NameObj := TDEntNameItem.Create;
    // The building of a table entity class.                //[JPN]テーブルエンティティクラスの構築
    TblObj := TDArxTableMake.Create;
    try
	  	rChk1 := NameObj.GetTableName('LAYER', 'Ly1');
      if NOT rChk1 then begin
        // It makes picture layer Ly1.                          //[JPN]画層Ly1を作成
        TblObj.AddLAYER('Ly1', '', 4);
        rChk1 := TblObj.MakeTable;
      end;
      rChk2 := NameObj.GetTableName('LAYER', 'Ly2');
      if NOT rChk2 then begin
        // It makes picture layer Ly2.                          //[JPN]画層Ly2を作成
        TblObj.AddLAYER('Ly2', '', 3);
        rChk2 := TblObj.MakeTable;
      end;
    	Result := (rChk1)and(rChk2);
    finally
    	// The release of the object.                           //[JPN]オブジェクトの解放
  	  TblObj.Free;
	    NameObj.Free;
    end;
	end;
var
  EntObj: TDArxEntMake;
begin
  if NOT CheckLy1Ly2 then exit;
  // NOTE: As for the table entity class, it begins actual making at the MakeTable method.
  //[JPN]テーブルエンティティクラスは、実際の作成をMakeTableメソッドで開始します。
  // The building of an entity making class.              //[JPN]エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  try
    EntObj.Layer := '0';
    // The way of making a light weight polyline. (No1)               //[JPN]ライトウェイトポリラインの作成方法１
    EntObj.MakeVertex;
    EntObj.AddVertex(ads_point(100, 130, 0), 0, 5, 3);
    EntObj.AddVertex(ads_point(120, 140, 0), 0, 3, 1);
    EntObj.AddVertex(ads_point(140, 130, 0), 0, 1, 5);
    EntObj.LWPolyline(True);
    // The way of making a light weight polyline. (No2)               //[JPN]ライトウェイトポリラインの作成方法２
    EntObj.LWPolyline([ads_point(100, 10 ,0), ads_point(120, 20, 0), ads_point(140, 10, 0)], False);
    // It changes a picture layer and it makes a square.    //[JPN]画層を変えて四角形を作成
    EntObj.Layer := 'Ly1';
    EntObj.Rectang(ads_point(100, 70, 0), ads_point(140, 30, 0));
    // It changes a picture layer and it makes a polygon.   //[JPN]画層を変えてポリゴンを作成
    EntObj.Layer := 'Ly2';
    EntObj.Polygon(ads_point(120, 100, 0), 6, 20, False, PI / 2);
  finally
    // The release of the object.                           //[JPN]オブジェクトの解放
    EntObj.Free;
    // The change of the picture layer.                     //[JPN]画層の変更
    acedSetVar('CLAYER', 'Ly2');
  end;
end;

procedure TDArxDocManager.ArxCmdMLTYPE;
// MLTYPE
// The make linetype example.                              //[JPN]線種作成例
var
	nChk: Integer;
	NameObj: TDEntNameItem;
	TblObj: TDArxTableMake;
  Param: TLTypeParam;
begin
	nChk := 1;
	NameObj := TDEntNameItem.Create;
  try
    if NameObj.GetTableName('LTYPE', 'ACAD_ISO15W100X') then exit;
		nChk := 0;
    TblObj := TDArxTableMake.Create;
    try
      Param.Name := 'ACAD_ISO15W100X';
      Param.Desc := 'ISO double-dash triple-dot __ __ . . . __ __ . .';
      Param.Params := 'A,12,-3,12,-3,0,-3,0,-3,0,-3';
      TblObj.AddLTYPE(Param);
      if TblObj.MakeTable then nChk := 2;
    finally
      TblObj.Free;
    end;
  finally
    NameObj.Free;
    case nChk of
    1: acutPrintf(#13#10'A linetype is already made.');
    2: acutPrintf(#13#10'Succeeded in the making of a linetype.');
    else acutPrintf(#13#10'Failed in the making of a linetype.');
  	end;
  end;
end;

procedure TDArxDocManager.LispCmdCIRCLES(var ResCode: Integer);
// CIRCLES  (C:CIRCLES [num] [pt]) ... (C:CIRCLES 3 '(10 20 0))
var
  rOK: Boolean;
  pt0: Tads_point;
  EntObj: TDArxEntMake;
  BlockName: String;
  num, rCode, ni: Integer;
begin
	// lispArgs ... Use lispArgs object instead of the acedGetArgs function.
  if lispArgs.curInteger(num) then begin // 1st Args is RTINT or RTLONG
    lispArgs.NextCurrent;
    rOK := ((num > 0)and(10 > num));
  end else begin
	  rOK := False;
	end;
  if NOT rOK then begin
	  repeat
  	  num := FCirclesNum;
    	rCode := acedGetInt(#13 + 'Number(0<x<10)[' + IntToStr(FCirclesNum) + ']: ', num);
	    if (rCode <> RTNORM)and(rCode <> RTNONE) then break;
  	  if (rCode = RTNONE) then num := FCirclesNum;
    	rOK := (rCode = RTNONE)or((num > 0)and(10 > num));
	    if (rCode = RTNORM)and(NOT rOK) then acedPrompt(#13 + 'ERROR! Limit over.' + #13);    // エラーメッセージの表示
  	until (rOK);
	  if NOT rOK then exit;
  end;
  FCirclesNum := num;
  // The building of an entity making class.              //[JPN] エンティティ作図クラスの構築
  EntObj := TDArxEntMake.Create;
  try
	  EntObj.MakeBlock('Dora', ads_point(-50, 0, 0));
	  EntObj.Circle(ads_point(0, 0, 0), 50);
  	EntObj.Circle(ads_point(0, -10, 0), 40);
	  EntObj.Circle(ads_point(-10, 5, 0), 10);
  	EntObj.Circle(ads_point(10, 5, 0), 10);
	  BlockName := EntObj.EndBlock;
		if NOT lispArgs.curPoint(pt0) then begin
		  if acedGetPoint(nil, #13 + 'Center Point: ', pt0) <> RTNORM then exit;
  	end;
	 	for ni := 0 to num - 1 do begin
  	 	EntObj.Insert(BlockName, ads_point(pt0[0] + 100 * ni, pt0[1], pt0[2]));
	  end;
	  lispArgs.RetBool(True);
  finally
  	// The release of the object.                           //[JPN]オブジェクトの解放
	  EntObj.Free;
  end;
end;

//}}COMMAND_METHODS
////////////////////////////////////////////////////////////////////////////////
// TODO:


end.
