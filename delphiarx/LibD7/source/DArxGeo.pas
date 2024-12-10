unit DArxGeo;

// ******************************************************
//         DelphiARX2002 Geomtroy Functions
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
  Windows, SysUtils, DArxH;

var
  PerDiff: Double = 0.0001;       // 座標を比較する際の許容差 Permission Difference

// *************************************************************** 基本演算関数

// Standard版用 - ArcTan(Y/X) を計算し、象限の角度を返す
function ArcTan2(Y, X: Extended): Extended;
// Standard版用 - XのArcCos(逆余弦)を返す。Xは-1～1の範囲で指定すること。戻り値は0～πのラジアンとなる。
function ArcCos(X: Extended): Extended;
// Double型から整数値を取得する(変換エラー時は、Defaultの値が返る)
function TruncDef(const Value: Double; const Default: Integer): Integer;
// 文字列をDouble型データに変換する。エラー時は、Defaultの値が返る
function StrToFloatDef(const S: AnsiString; const Default: Double): Double;

// 言語系の精度が高すぎて、AutoCADの精度との誤差をなくすための処理
function PrecRevise(const Value: Double): Double;
// 実数値を指定少数点ケタ数で丸めます
function RoundPrecis(const Value: Double; const Precision: Integer): Double;
// PerDiff定数の許容範囲で２つの実数値を比較し、等しければTrueとする
function AsPermit(const Value1, Value2: Double): Boolean;
// PerDiff定数の許容範囲で２つの座標値を比較し、等しければTrueとする
function AsPermitPos(const Pos1, Pos2: Tads_point): Boolean;

// *************************************************************** 基本変換関数

// ラジアン単位の角度を度数に変換します
function RadToDeg(const Radians: Double): Double;
// 度数の角度をラジアンに変換します。360 度はラジアンで 2πに相当します
function DegToRad(const Degrees: Double): Double;
// 元の角度を示すAngle値を度数(DegMode=True)なら0～360まで、ラジアン(DegMode=False)なら0～2PIの正値に変更する
function GetSrcAngle(const Angle: Double; const DegMode: Boolean): Double;
// 端点とベクトル値から、擬似２点座標を出す
function VectorToPoint(const LastPos, Vector: Tads_point; const Ray: Boolean; var Pos1, Pos2: Tads_point): Boolean;

// *************************************************************** 基本相対変換関数

// BasePtを基準座標として、Pt座標の相対座標を得る
function GetRelPoint(const BasePt, Pt: Tads_point): Tads_point;
// BaseAngleを基準角度として、Angle(角度:DegMode=True/ラジアン:DegMode=False)の相対角度を得る(Angle:＋=反時計回り/－=時計回り)
function GetRelAngle(const BaseAngle, Angle: Double; const DegMode: Boolean): Double;

// *************************************************************** AutoLISP演算関数

// Int1 と Int2 の最大公約数を得る
function Gcd(const Int1, Int2: Integer): Integer;
// べき乗計算 Base^Powerを実行する
function Expt(const Base, Power: Double): Double;
// ビット方式の論理演算関数
function Boole(const Func: Cardinal; const Int1, Int2: Integer): Integer;

// *************************************************************** ジオメトリック基本座標演算関数

// 水平幅(W)と垂直幅(H)から傾斜の長さ(Dist)を得る
function GetWidthDist(const Width, Height: Double): Double;

// ------------------------------- ラジアン角度用関数
// 一辺の水平幅(Width)とラジアン角度(Angle)から垂直幅(Height)を得る
function GetWidthAHeight(const Width, Angle: Double): Double;
// 傾斜の長さ(Dist)とラジアン角度(Angle)から水平幅(Width)を得る
function GetDistAWidth(const Dist, Angle: Double): Double;
// 傾斜の長さ(Dist)とラジアン角度(Angle)から垂直幅(Height)を得る
function GetDistAHeight(const Dist, Angle: Double): Double;
// 水平幅(Width)と垂直幅(Height)から傾斜角度(Angle)をラジアンで得る
function GetWidthAngle(const Width, Height: Double): Double;

// ------------------------------- 角度数用関数
// 一辺の水平幅(Width)と角度(DegAngle)から垂直幅(Height)を得る
function GetWidthDegHeight(const Width, DegAngle: Double): Double;
// 傾斜の長さ(Dist)と角度(DegAngle)から水平幅(Width)を得る
function GetDistDegWidth(const Dist, DegAngle: Double): Double;
// 傾斜の長さ(Dist)と角度(DegAngle)から垂直幅(X)を得る
function GetDistDegHeight(const Dist, DegAngle: Double): Double;
// 水平幅(Width)と垂直幅(Height)から傾斜角度(DegAngle)を度数で得る
function GetWidthDegAngle(const Width, Height: Double): Double;

// *************************************************************** ジオメトリック関数

// ２次元の基準点(PosA)から２点目(PosB)までの距離(Dist)を得る
function GetDistance(const PosA, PosB: Tads_point): Double;
// ３次元の基準点(PosA)から２点目(PosB)までの３次元の距離(Dist)を得る
function GetDistance3D(const PosA, PosB: Tads_point): Double;

// 基準点(PosA)から２点目(PosB)までを分割数(Division)で割った時の、基準点からSteps(0=基準位置)目の座標を得る
function GetDivide(const PosA, PosB: Tads_point; const Division, Steps: Double): Tads_point;
// 基準点(PosA)から２点目(PosB)までを間隔(Interval)で割った時の、基準点からSteps(0=基準位置)目の座標を得る
function GetMeasure(const PosA, PosB: Tads_point; const Interval, Steps: Double): Tads_point;

// ２つの直線(PosA1 - PosA2),(PosB1 - PosB2) の交わる位置(GetPos)を得る. 交わらない場合False
function GetInters(const PosA1, PosA2, PosB1, posB2: Tads_point; var GetPos: Tads_point; var onSeg: Boolean): Boolean;
// ２つの円(PosA,RadiusA),(PosB,RadiusB)の交わる位置(GetPos1,GetPos2)を得る. 交わる数を返す(交らない場合0)
function GetCircles(const PosA, PosB: Tads_point; const RadiusA, RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;
// 線分(PosA1-PosA2)と円(PosB,RadiusB)の交わる位置(GetPos1,GetPos2)を得る. 交わる数を返す(交らない場合0)
function GetCirInters(const PosA1, PosA2, PosB: Tads_point; const RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;

// ------------------------------- ラジアン角度用関数
// ２次元の基準点(PosA)から２点目(PosB)までの角度(Angle)をラジアンで得る
function GetAngle(const PosA, PosB: Tads_point): Double;
// ２次元の基準点(PosA)から傾斜長さ(Dist)とラジアン角度(Angle)に位置する２点目の位置を得る
function GetPolar(const PosA: Tads_point; const Dist, Angle: Double): Tads_point;
// ２次元の基準点(PosA)から水平(Width)と垂直(Height)方向の座標をラジアン角度(Angle)を考慮して位置を得る
function GetPolarXY(const PosA: Tads_point; const Width, Height, Angle: Double): Tads_point;
// ２つの点で示す線上を方向を示す１点方向に垂直な角度を得る
function GetRightAngle(const PosA, PosB, PosDir: Tads_point; var RightAngle: Double): Boolean;

// ------------------------------- 角度数用関数
// ２次元の基準点(PosA)から２点目(PosB)までの角度(Angle)を度数で得る
function GetDegAngle(const PosA, PosB: Tads_point): Double;
// ２次元の基準点(PosA)から傾斜長さ(Dist)と角度(DegAngle)に位置する２点目の位置を得る
function GetDegPolar(const PosA: Tads_point; const Dist, DegAngle: Double): Tads_point;
// ２次元の基準点(PosA)から水平(Width)と垂直(Height)方向の座標を角度(DegAngle)を考慮して位置を得る
function GetDegPolarXY(const PosA: Tads_point; const Width, Height, DegAngle: Double): Tads_point;
// ２つの点で示す線上を方向を示す１点方向に垂直な角度を得る
function GetRightDegAngle(const PosA, PosB, PosDir: Tads_point; var DegRightAngle: Double): Boolean;

// *************************************************************** 重心/周長/求積 演算関数

// 円弧の半径と中心座標を出す
function PolyArcCenter(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point; var Radius: Double): Boolean;
// ３角形の重心を出す
function TriangleBalance(const Pos1, Pos2, Pos3: Tads_point): Tads_point;
// 欠円の重心を出す
function PolyArcBalance(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point): Boolean;
// ３角形を示す３点の内側の面積を出す
function TriangleArea(const Pos1, Pos2, Pos3: Tads_point): Double;
// 円弧の面積と長さを出す
function PolyArcArea(const Pos1, Pos2: Tads_point; const Bulge: Double; var Area, Dist: Double): Boolean;
// 円の面積と周辺長を出す
function CircleArea(const Radius: Double; var Area, Dist: Double): Boolean;

implementation

// *************************************************************** 基本演算関数

function ArcTan2(Y, X: Extended): Extended;
// Standard版用 - ArcTan(Y/X) を計算し、象限の角度を返す
asm
  FLD Y
  FLD X
  FPATAN
  FWAIT
end;

function ArcCos(X: Extended): Extended;
// Standard版用 - XのArcCos(逆余弦)を返す。Xは-1～1の範囲で指定すること。戻り値は0～πのラジアンとなる。
begin
  Result := ArcTan2(Sqrt(1 - X * X), X);
end;

function TruncDef(const Value: Double; const Default: Integer): Integer;
// Double型から整数値を取得する(変換エラー時は、Defaultの値が返る)
var
  dBuf: Double;
begin
  try
    dBuf := Int(Value);
    try
      Result := Trunc(dBuf);
    except
      Result := Default;
    end;
  except
    Result := Default;
  end;
end;

function StrToFloatDef(const S: AnsiString; const Default: Double): Double;
// 文字列をDouble型データに変換する。エラー時は、Defaultの値が返る
var
  dBuf: Extended;
  sChk: AnsiString;
begin
  sChk := Trim(S);
  if TextToFloat(PChar(sChk), dBuf, fvExtended) then begin
    Result := dBuf;
  end else begin
    Result := Default;
  end;
end;

function PrecRevise(const Value: Double): Double;
// 言語系の精度が高すぎて、AutoCADの精度との誤差をなくすための処理
var
  nLen: Integer;
  Str: AnsiString;
begin
  Str := AnsiUpperCase(FloatToStr(Value));
  nLen := Pos('.', Str);
  if (Pos('E', Str) > 0)or(0 >= nLen) then begin
    Result := Value;
  end else begin
    Result := StrToFloat(Copy(Str, 1, nLen + 8));
  end;
end;

function RoundPrecis(const Value: Double; const Precision: Integer): Double;
// 数値を指定少数点ケタ数で丸めます
var
  nLen: Integer;
  dBuf: Extended;
  sBuf: AnsiString;
begin
  Result := Value;
  if ((Precision >= 0)and(16 >= Precision)) then begin
    sBuf := FloatToStr(Value);
    if 0 >= Pos('E', AnsiUpperCase(sBuf)) then begin
      nLen := Pos('.', sBuf);
      if nLen > 0 then begin
        dBuf := StrToFloat('0.' + Copy('0000000000000000', 1, Precision) + '5');
        Result := StrToFloat(Copy(sBuf, 1, nLen + Precision + 1));
        if Result >= 0 then Result := Result + dBuf else Result := Result - dBuf;
        sBuf := FloatToStr(Result);
        nLen := Pos('.', sBuf);
        if nLen > 0 then Result := StrToFloat(Copy(sBuf, 1, nLen + Precision) + '0') else Result := StrToFloat(sBuf);
      end;
    end;
  end;
end;

function AsPermit(const Value1, Value2: Double): Boolean;
// PerDiff定数の許容範囲で２つの実数値を比較し、等しければTrueとする
begin
  Result := ((Value1 >= (Value2 - PerDiff))and((Value2 + PerDiff) >= Value1));
end;

function AsPermitPos(const Pos1, Pos2: Tads_point): Boolean;
// PerDiff定数の許容範囲で２つの座標値を比較し、等しければTrueとする
begin
  Result := (AsPermit(Pos1[0], Pos2[0]))and(AsPermit(Pos1[1], Pos2[1]))and(AsPermit(Pos1[2], Pos2[2]));
end;

// *************************************************************** 基本変換関数

function RadToDeg(const Radians: Double): Double;
// ラジアン単位の角度を度数に変換します
begin
  Result := RoundPrecis(PrecRevise(Radians * 180 / PI), 8);
end;

function DegToRad(const Degrees: Double): Double;
// 度数の角度をラジアンに変換します。360 度はラジアンで 2πに相当します
begin
  Result := PrecRevise(Degrees * PI / 180);
end;

function GetSrcAngle(const Angle: Double; const DegMode: Boolean): Double;
// 元の角度を示す Angle値をDegModeに従い、度数(DegMode=True)なら0～360まで、ラジアン(DegMode=False)なら0～2PIの正値に変更する
begin
  Result := Angle;
  if DegMode then begin
    While (0 > Result) do Result := 360 + Result;
    While (Result > 360) do Result := Result - 360;
  end else begin
    While (0 > Result) do Result := PI * 2 + Result;
    While (Result > (PI * 2)) do Result := Result - PI * 2;
  end;
end;

function VectorToPoint(const LastPos, Vector: Tads_point; const Ray: Boolean; var Pos1, Pos2: Tads_point): Boolean;
// 端点とベクトル値から、擬似２点座標を出す
var
  Ang: Double;
  cPos: Tads_point;
begin
  Result := False;
  Pos1[0] := LastPos[0];
  Pos1[1] := LastPos[1];
  Pos1[2] := LastPos[2];
  Pos2[0] := LastPos[0];
  Pos2[1] := LastPos[1];
  Pos2[2] := LastPos[2];
  if (Vector[0] <> 0)or(Vector[1] <> 0)or(Vector[2] <> 0) then begin
    if (Vector[0] >= -1)and(1 >= Vector[0])and(Vector[1] >= -1)and(1 >= Vector[1])and(Vector[2] >= -1)and(1 >= Vector[2]) then begin
      cPos[0] := LastPos[0] + Vector[0] * 1000;
      cPos[1] := LastPos[1] + Vector[1] * 1000;
      cPos[2] := LastPos[2] + Vector[2] * 1000;
      Ang := GetDegAngle(LastPos, cPos);
      // 2147483647   >> 1E+16
      if NOT Ray then Pos1 := GetDegPolar(LastPos, -2000000000, Ang);
      Pos2 := GetDegPolar(LastPos, 2000000000, Ang);
      if Vector[0] = 0 then begin
        Pos1[0] := LastPos[0];
        Pos2[0] := LastPos[0];
      end else if Vector[1] = 0 then begin
        Pos1[1] := LastPos[1];
        Pos2[1] := LastPos[1];
      end;
      Result := True;
    end;
  end;
end;

// *************************************************************** 基本相対変換関数

function GetRelPoint(const BasePt, Pt: Tads_point): Tads_point;
// BasePtを基準座標として、Pt座標の相対座標を得る
begin
  Result[0] := Pt[0] - BasePt[0];
  Result[1] := Pt[1] - BasePt[1];
  Result[2] := Pt[2] - BasePt[2];
end;

function GetRelAngle(const BaseAngle, Angle: Double; const DegMode: Boolean): Double;
// BaseAngleを基準角度として、Angle(角度:DegMode=True/ラジアン:DegMode=False)の相対角度を得る(Angle:＋=反時計回り/－=時計回り)
var
  sAng, Ang, rAng: Double;
begin
  if BaseAngle = Angle then begin
    Result := 0;
  end else begin
    sAng := GetSrcAngle(BaseAngle, DegMode);
    Ang := GetSrcAngle(Angle, DegMode);
    if DegMode then begin
      if 180 > sAng then begin
        rAng := sAng + 180;
        if rAng = Ang then begin
          Result := 180;
        end else if (rAng > Ang) then begin
          Result := Ang - sAng;
        end else begin
          Result := (Ang - 360) - sAng;
        end;
      end else begin
        rAng := sAng - 180;
        if rAng = Ang then begin
          Result := 180;
        end else if (Ang > rAng) then begin
          Result := Ang - sAng;
        end else begin
          Result := (Ang + 360) - sAng;
        end;
      end;
    end else begin
      if PI > sAng then begin
        rAng := sAng + PI;
        if rAng = Ang then begin
          Result := PI;
        end else if (rAng > Ang) then begin
          Result := Ang - sAng;
        end else begin
          Result := (Ang - (PI * 2)) - sAng;
        end;
      end else begin
        rAng := sAng - PI;
        if rAng = Ang then begin
          Result := PI;
        end else if (Ang > rAng) then begin
          Result := Ang - sAng;
        end else begin
          Result := (Ang + (PI * 2)) - sAng;
        end;
      end;
    end;
  end;
end;

// *************************************************************** AutoLISP演算関数

function Gcd(const Int1, Int2: Integer): Integer;
// Int1 と Int2 の最大公約数を得る
var
  d1, d2: Double;
begin
  if ((Int1 > 0)and(Int2 > 0)) then begin
    if Int1 = Int2 then begin
      Result := Int1;
    end else begin
      if Int1 > Int2 then Result := Int2 else Result := Int1;
      While (Result > 1) do begin
        d1 := Int1 / Result;
        d2 := Int2 / Result;
        if ((TruncDef(d1, 0) = d1)and(TruncDef(d2, 0) = d2)) then break else Dec(Result);
      end;
    end;
  end else begin
    Result := 0;
  end;
end;

function Expt(const Base, Power: Double): Double;
// べき乗計算 Base^Powerを実行する
begin
  Result := Exp(Power * Ln(Base));
end;

function Boole(const Func: Cardinal; const Int1, Int2: Integer): Integer;
// ビット方式の論理演算関数
begin
  case Func of
    1: Result := (Int1 and Int2);
    2: Result := ((NOT Int2) and Int1);
    3: Result := (Int1 and Int2) or ((NOT Int2) and Int1);
    4: Result := ((NOT Int1) and Int2);
    5: Result := (Int1 and Int2) or ((NOT Int1) and Int2);
    6: Result := (Int1 xor Int2);
    7: Result := (Int1 or Int2);
    8: Result := ((NOT Int1) and (NOT Int2));
    9: Result := (Int1 and Int2) or ((NOT Int1) and (NOT Int2));
   10: Result := ((NOT Int2) and Int1) or ((NOT Int1) and (NOT Int2));
   11: Result := (Int1 and Int2) or ((NOT Int2) and Int1) or ((NOT Int1) and (NOT Int2));
   12: Result := ((NOT Int1) and Int2) or ((NOT Int1) and (NOT Int2));
   13: Result := (Int1 and Int2) or ((NOT Int1) and Int2) or ((NOT Int1) and (NOT Int2));
   14: Result := ((NOT Int2) and Int1) or ((NOT Int1) and Int2) or ((NOT Int1) and (NOT Int2));
   15: Result := (Int1 and Int2) or ((NOT Int2) and Int1) or ((NOT Int1) and Int2) or ((NOT Int1) and (NOT Int2));
  else
    Result := 0;
  end;
end;

// *************************************************************** ジオメトリック基本座標演算関数

function GetWidthAHeight(const Width, Angle: Double): Double;
// 一辺の水平幅(Width)とラジアン角度(Angle)から垂直幅(Height)を得る
var
  dBuf: Double;
begin
  dBuf := GetSrcAngle(Angle, False);
  if (dBuf > 0)and((PI / 2) > dBuf) then begin
    Result := (Sin(Angle) / Cos(Angle)) * Width;
  end else begin
    Result := 0;
  end;
end;

function GetWidthDegHeight(const Width, DegAngle: Double): Double;
// 一辺の水平幅(Width)と角度(DegAngle)から垂直幅(Height)を得る
var
  dBuf: Double;
begin
  dBuf := GetSrcAngle(DegAngle, True);
  if (dBuf > 0)and(90 > dBuf) then begin
    Result := GetWidthAHeight(Width, DegToRad(dBuf));
  end else begin
    Result := 0;
  end;
end;

function GetDistAWidth(const Dist, Angle: Double): Double;
// 傾斜の長さ(Dist)とラジアン角度(Angle)から水平幅(Width)を得る
begin
  Result := PrecRevise(Cos(Angle) * Dist);
end;

function GetDistAHeight(const Dist, Angle: Double): Double;
// 傾斜の長さ(Dist)とラジアン角度(Angle)から垂直幅(Height)を得る
begin
  Result := PrecRevise(Sin(Angle) * Dist);
end;

function GetDistDegWidth(const Dist, DegAngle: Double): Double;
// 傾斜の長さ(Dist)と角度(DegAngle)から水平幅(Width)を得る
var
  AngBuf: Double;
begin
  AngBuf := GetSrcAngle(DegAngle, True);
  if (AngBuf = 90)or(AngBuf = 270) then begin
    Result := 0;
  end else if (AngBuf = 0) then begin
    Result := Dist;
  end else if (AngBuf = 180) then begin
    Result := -1 * Dist;
  end else begin
    Result := PrecRevise(Cos(AngBuf * PI / 180) * Dist);
  end;
end;

function GetDistDegHeight(const Dist, DegAngle: Double): Double;
// 傾斜の長さ(Dist)と角度(DegAngle)から垂直幅(X)を得る
var
  AngBuf: Double;
begin
  AngBuf := GetSrcAngle(DegAngle, True);
  if (AngBuf = 0)or(AngBuf = 180) then begin
    Result := 0;
  end else if (AngBuf = 90) then begin
    Result := Dist;
  end else if (AngBuf = 270) then begin
    Result := -1 * Dist;
  end else begin
    Result := PrecRevise(Sin(AngBuf * PI / 180) * Dist);
  end;
end;

function GetWidthDist(const Width, Height: Double): Double;
// 水平幅(Width)と垂直幅(Height)から傾斜の長さを得る
begin
  Result := PrecRevise(Sqrt(Width * Width + Height * Height));
end;

function GetWidthAngle(const Width, Height: Double): Double;
// 水平幅(Width)と垂直幅(Height)から傾斜角度(Angle)をラジアンで得る
begin
  if Width = 0 then begin
    if Height = 0 then begin
      Result := 0;
    end else if Height > 0 then begin
      Result := PI / 2;
    end else begin
      Result := PI / 2 + PI;
    end;
  end else if Height = 0 then begin
    if Width > 0 then begin
      Result := 0;
    end else begin
      Result := PI;
    end;
  end else begin
    Result := PrecRevise(ArcTan(Abs(Height) / Abs(Width)));
    if (Height > 0)and(0 > Width) then begin
      Result := PI - Result;
    end else if (0 > Height)and(Width > 0) then begin
      Result := (PI * 2) - Result;
    end else if (0 > Height)and(0 > Width) then begin
      Result := PI + Result;
    end;
  end;
end;

function GetWidthDegAngle(const Width, Height: Double): Double;
// 水平幅(Width)と垂直幅(Height)から傾斜角度(DegAngle)を度数で得る
begin
  if Width = 0 then begin
    if Height = 0 then begin
      Result := 0;
    end else if Height > 0 then begin
      Result := 90;
    end else begin
      Result := 270;
    end;
  end else if Height = 0 then begin
    if Width > 0 then begin
      Result := 0;
    end else begin
      Result := 180;
    end;
  end else begin
    Result := PrecRevise(ArcTan(Abs(Height) / Abs(Width)));
    if (Height > 0)and(0 > Width) then begin
      Result := PI - Result;
    end else if (0 > Height)and(Width > 0) then begin
      Result := (PI * 2) - Result;
    end else if (0 > Height)and(0 > Width) then begin
      Result := PI + Result;
    end;
    Result := RoundPrecis(Result * 180 / PI, 8);
  end;
end;

// *************************************************************** ジオメトリック関数

function GetDistance(const PosA, PosB: Tads_point):  Double;
// ２次元の基準点(PosA)から２点目(PosB)までの距離(Dist)を得る
begin
  Result := GetWidthDist((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetDistance3D(const PosA, PosB: Tads_point):  Double;
// ３次元の基準点(PosA)から２点目(PosB)までの３次元の距離(Dist)を得る
var
  buf: Double;
begin
  buf := GetWidthDist((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
  Result := GetWidthDist(buf, (PosB[2] - PosA[2]));
end;

function GetAngle(const PosA, PosB: Tads_point): Double;
// ２次元の基準点(PosA)から２点目(PosB)までの角度(Angle)をラジアンで得る
begin
  Result := GetWidthAngle((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetDegAngle(const PosA, PosB: Tads_point): Double;
// ２次元の基準点(PosA)から２点目(PosB)までの角度(Angle)を度数で得る
begin
  Result := GetWidthDegAngle((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetPolar(const PosA: Tads_point; const Dist, Angle: Double): Tads_point;
// ２次元の基準点(PosA)から傾斜長さ(Dist)とラジアン角度(Angle)に位置する２点目の位置を得る
begin
  Result[0] := GetDistAWidth(Dist, Angle) + PosA[0];
  Result[1] := GetDistAHeight(Dist, Angle) + PosA[1];
  Result[2] := 0;
end;

function GetDegPolar(const PosA: Tads_point; const Dist, DegAngle: Double): Tads_point;
// ２次元の基準点(PosA)から傾斜長さ(Dist)と角度(DegAngle)に位置する２点目の位置を得る
begin
  Result[0] := GetDistDegWidth(Dist, DegAngle) + PosA[0];
  Result[1] := GetDistDegHeight(Dist, DegAngle) + PosA[1];
  Result[2] := 0;
end;

function GetPolarXY(const PosA: Tads_point; const Width, Height, Angle: Double): Tads_point;
// ２次元の基準点(PosA)から水平(Width)と垂直(Height)方向の座標をラジアン角度(Angle)を考慮して位置を得る
var
  Dist, BaseA: Double;
begin
  Dist := GetWidthDist(Width, Height);    // 傾斜角度を得る
  BaseA := GetWidthAngle(Width, Height);  // 元の傾斜角度(RAD)
  Result[0] := GetDistAWidth(Dist, BaseA + Angle) + PosA[0];
  Result[1] := GetDistAHeight(Dist, BaseA + Angle) + PosA[1];
  Result[2] := 0;
end;

function GetDegPolarXY(const PosA: Tads_point; const Width, Height, DegAngle: Double): Tads_point;
// ２次元の基準点(PosA)から水平(Width)と垂直(Height)方向の座標を角度(DegAngle)を考慮して位置を得る
var
  Dist, BaseA: Double;
begin
  Dist := GetWidthDist(Width, Height);    // 傾斜角度を得る
  BaseA := GetWidthDegAngle(Width, Height); // 元の傾斜角度(RAD)
  Result[0] := GetDistDegWidth(Dist, BaseA + DegAngle) + PosA[0];
  Result[1] := GetDistDegHeight(Dist, BaseA + DegAngle) + PosA[1];
  Result[2] := 0;
end;

function PrvGetA(const Pos1, Pos2: Tads_point; var GetA: Double): Boolean;
begin
  if Pos1[0] = Pos2[0] then begin
    Result := False;
    GetA := 0;
  end else begin
    Result := True;
    GetA := (Pos1[1] - Pos2[1]) / (Pos1[0] - Pos2[0]);
  end;
end;

function PrvGetB(const Pos1, Pos2: Tads_point; var GetB: Double): Boolean;
begin
  if Pos1[0] = Pos2[0] then begin
    Result := False;
    GetB := 0;
  end else begin
    Result := True;
    GetB := Pos1[1] - ((Pos1[0] * (Pos1[1] - Pos2[1])) / (Pos1[0] - Pos2[0]));
  end;
end;

function GetInters(const PosA1, PosA2, PosB1, posB2: Tads_point; var GetPos: Tads_point; var onSeg: Boolean): Boolean;
// ２つの直線(PosA1 - PosA2),(PosB1 - PosB2) の交わる位置(GetPos)を得る. 交わらない場合False
var
  A1, A2, B1, B2: Double;
begin
  Result := True;
  onSeg := False;
  if ((PosA1[0] = PosA2[0])and(PosB1[0] = PosB2[0])) then begin
    Result := False;
  end else if (PosA1[0] = PosA2[0]) then begin
    GetPos[0] := PosA1[0];
    if ((PrvGetA(PosB1, PosB2, A2))and(PrvGetB(PosB1, PosB2, B2))) then begin
      GetPos[1] := A2 * GetPos[0] + B2;
    end else begin
      Result := False;
    end;
  end else if (PosB1[0] = PosB2[0]) then begin
    GetPos[0] := PosB1[0];
    if ((PrvGetA(PosA1, PosA2, A1))and(PrvGetB(PosA1, PosA2, B1))) then begin
      GetPos[1] := A1 * GetPos[0] + B1;
    end else begin
      Result := False;
    end;
  end else if ((PrvGetA(PosA1, PosA2, A1))and(PrvGetB(PosA1, PosA2, B1))and(PrvGetA(PosB1, PosB2, A2))and(PrvGetB(PosB1, PosB2, B2))) then begin
    if A1 = A2 then begin
      Result := False;
    end else begin
      GetPos[0] := (B2 - B1) / (A1 - A2);
      GetPos[1] := ((A1 * (B2 - B1)) + (B1 * (A1 - A2))) / (A1 - A2);
    end;
  end else begin
    Result := False;
  end;
  if Result then begin
    if PosA1[0] < PosA2[0] then begin
      A1 := PosA1[0];
      A2 := PosA2[0];
    end else begin
      A2 := PosA1[0];
      A1 := PosA2[0];
    end;
    if PosB1[0] < PosB2[0] then begin
      B1 := PosB1[0];
      B2 := PosB2[0];
    end else begin
      B2 := PosB1[0];
      B1 := PosB2[0];
    end;
    if ((A1 >= GetPos[0])and(GetPos[0] >= A2)and(B1 >= GetPos[0])and(GetPos[0] >= B2)) then begin
      if PosA1[1] < PosA2[1] then begin
        A1 := PosA1[1];
        A2 := PosA2[1];
      end else begin
        A2 := PosA1[1];
        A1 := PosA2[1];
      end;
      if PosB1[1] < PosB2[1] then begin
        B1 := PosB1[1];
        B2 := PosB2[1];
      end else begin
        B2 := PosB1[1];
        B1 := PosB2[1];
      end;
      onSeg := ((A1 >= GetPos[1])and(GetPos[1] >= A2)and(B1 >= GetPos[1])and(GetPos[1] >= B2));
    end;
  end else begin
    GetPos[0] := 0;
    GetPos[1] := 0;
  end;
  GetPos[2] := 0;
end;

function GetCircles(const PosA, PosB: Tads_point; const RadiusA, RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;
// ２つの円(PosA,RadiusA),(PosB,RadiusB)の交わる位置(GetPos1,GetPos2)を得る. 交わる数を返す(交らない場合0)
var
  Dist, cDist, Angle, sAngle: Double;
begin
  Result := 0;
  Dist := Abs(GetDistance(PosA, PosB));
  cDist := Abs(RadiusA) + Abs(RadiusB);
  if AsPermit(Dist, cDist) then begin
    Result := 1;
    GetPos1 := GetPolar(PosA, Abs(RadiusA), GetAngle(PosA, PosB));
  end else if (cDist > Dist) then begin
    Result := 2;
    Angle := GetAngle(PosA, PosB);
    sAngle := PrecRevise(ArcCos((Abs(RadiusA) * Abs(RadiusA) + Dist * Dist - Abs(RadiusB) * Abs(RadiusB)) / (2 * Abs(RadiusA) * Dist)));
    GetPos1 := GetPolar(PosA, Abs(RadiusA), GetSrcAngle(Angle - sAngle, False));
    GetPos2 := GetPolar(PosA, Abs(RadiusA), GetSrcAngle(Angle + sAngle, False));
    if AsPermitPos(GetPos1, GetPos2) then Result := 1;
  end;
end;

function GetCirInters(const PosA1, PosA2, PosB: Tads_point; const RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;
// 線分(PosA1-PosA2)と円(PosB,RadiusB)の交わる位置(GetPos1,GetPos2)を得る. 交わる数を返す(交らない場合0)
var
  rSeg: Boolean;
  Angle, rAngle, rDist, Dist, nLen: Double;
  PosX: Tads_point;
begin
  Result := 0;
  Angle := GetAngle(PosA1, PosA2);
  rAngle := Angle + (PI / 2);
  if GetInters(PosA1, PosA2, PosB, GetPolar(PosB, Abs(RadiusB), rAngle), PosX, rSeg) then begin
    rDist := Abs(RadiusB);
    Dist := GetDistance(PosB, PosX);
    if AsPermit(Dist, rDist) then begin
      Result := 1;
      GetPos1 := GetPolar(PosB, rDist, GetAngle(PosB, PosX));
    end else if rDist > Dist then begin
      Result := 2;
      nLen := PrecRevise(Sqrt((rDist - Dist) * ((2 * rDist) - (rDist - Dist))));
      GetPos1 := GetPolar(PosA1, GetDistance(PosA1, PosX) - nLen, Angle);
      GetPos2 := GetPolar(PosA1, GetDistance(PosA1, PosX) + nLen, Angle);
      if nLen = 0 then Result := 1;
    end;
  end;
end;

function GetDivide(const PosA, PosB: Tads_point; const Division, Steps: Double): Tads_point;
// 基準点(PosA)から２点目(PosB)までを分割数(Division)で割った時の、基準点からSteps(0=基準位置)目の座標を得る
begin
  if ((Division = 0)or(Steps = 0)) then begin
    Result[0] := PosA[0];
    Result[1] := PosA[1];
    Result[2] := PosA[2];
  end else if (Division = Steps) then begin
    Result[0] := PosB[0];
    Result[1] := PosB[1];
    Result[2] := PosB[2];
  end else if (Abs(Division) = Abs(Steps)) then begin
    Result[0] := -PosB[0];
    Result[1] := -PosB[1];
    Result[2] := -PosB[2];
  end else begin
    Result[0] := ((PosB[0] - PosA[0]) / Division) * Steps + PosA[0];
    Result[1] := ((PosB[1] - PosA[1]) / Division) * Steps + PosA[1];
    Result[2] := ((PosB[2] - PosA[2]) / Division) * Steps + PosA[2];
  end;
end;

function GetMeasure(const PosA, PosB: Tads_point; const Interval, Steps: Double): Tads_point;
// 基準点(PosA)から２点目(PosB)までを間隔(Interval)で割った時の、基準点からSteps(0=基準位置)目の座標を得る
var
  AngXY, AngXYZ, Dist: Double;
begin
  if ((Interval = 0)or(Steps = 0)) then begin
    Result[0] := PosA[0];
    Result[1] := PosA[1];
    Result[2] := PosA[2];
  end else begin
    AngXY := GetWidthAngle(Abs(PosB[0] - PosA[0]), Abs(PosB[1] - PosA[1]));
    AngXYZ := GetWidthAngle(AngXY, Abs(PosB[2] - PosA[2]));
    Dist := Interval * Steps;
    if PosB[0] >= PosA[0] then Result[0] := GetDistAWidth(Dist, AngXY) + PosA[0] else Result[0] := PosA[0] - GetDistAWidth(Dist, AngXY);
    if PosB[1] >= PosA[1] then Result[1] := GetDistAHeight(Dist, AngXY) + PosA[1] else Result[1] := PosA[1] - GetDistAHeight(Dist, AngXY);
    if PosB[2] >= PosA[2] then Result[2] := GetDistAHeight(Dist, AngXYZ) + PosA[2] else Result[2] := PosA[2] - GetDistAHeight(Dist, AngXYZ);
  end;
end;

function GetRightAngle(const PosA, PosB, PosDir: Tads_point; var RightAngle: Double): Boolean;
// ２つの点で示す線上を方向を示す１点方向に垂直な角度を得る
var
  BasAng1, BasAng2, DirAng: Double;
begin
  Result := False;
  RightAngle := 0;
  BasAng1 := GetSrcAngle(GetAngle(PosA, PosB), False);
  While (BasAng1 >= PI) do BasAng1 := BasAng1 - PI;
  BasAng2 := BasAng1 + PI;
  DirAng := GetSrcAngle(GetAngle(PosA, PosDir), False);
  if (BasAng1 <> DirAng)and(BasAng2 <> DirAng) then begin
    if (BasAng1 > DirAng)or(DirAng > BasAng2) then begin
      RightAngle := GetSrcAngle(BasAng1 - (PI / 2), False);
    end else begin
      RightAngle := GetSrcAngle(BasAng1 + (PI / 2), False);
    end;
    Result := True;
  end;
end;

function GetRightDegAngle(const PosA, PosB, PosDir: Tads_point; var DegRightAngle: Double): Boolean;
// ２つの点で示す線上を方向を示す１点方向に垂直な角度を得る
var
  BasAng1, BasAng2, DirAng: Double;
begin
  Result := False;
  DegRightAngle := 0;
  BasAng1 := GetSrcAngle(GetDegAngle(PosA, PosB), True);
  While (BasAng1 >= 180) do BasAng1 := BasAng1 - 180;
  BasAng2 := BasAng1 + 180;
  DirAng := GetSrcAngle(GetDegAngle(PosA, PosDir), True);
  if (BasAng1 <> DirAng)and(BasAng2 <> DirAng) then begin
    if (BasAng1 > DirAng)or(DirAng > BasAng2) then begin
      DegRightAngle := GetSrcAngle(BasAng1 - 90, True);
    end else begin
      DegRightAngle := GetSrcAngle(BasAng1 + 90, True);
    end;
    Result := True;
  end;
end;

// *************************************************************** 重心/周長/求積 演算関数

function PolyArcCenter(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point; var Radius: Double): Boolean;
// 円弧の半径と中心座標を出す
var
  Angle, CenLen, RAngle, H, Rev: Double;
begin
  Result := False;
  Radius := 0;
  CenPos[0] := 0;
  CenPos[1] := 0;
  CenPos[2] := 0;
  Angle := ArcTan(Abs(Bulge)) * 4;                    // 円弧角度
  CenLen := GetDistance(Pos1, Pos2);                  // ２点間の距離
  if (Angle <> 0)and(CenLen <> 0)and(Bulge <> 0) then begin
    Radius := (CenLen / Sin(Angle / 2)) / 2;          // 半径
    H := (4 * Radius * Radius) - (CenLen * CenLen);   // ルートの中
    try
      try
        H := Radius - (Sqrt(H) / 2);                    // 円弧の高さ
      except
        H := 0;
      end;
    finally
      if (Bulge >= 0) then begin
        // ふくらみ正で、反時計回り
        if (PI >= Angle) then Rev := 90 else Rev := -90;
      end else begin
        if (PI >= Angle) then Rev := -90 else Rev := 90;
      end;
      RAngle := GetSrcAngle(GetDegAngle(Pos1, Pos2) + Rev, True); // ２点間に垂直な角度
      CenPos := GetDegPolar(GetDivide(Pos1, Pos2, 2, 1), Radius - H, RAngle);
      Result := True;
    end;
  end;
end;

function TriangleBalance(const Pos1, Pos2, Pos3: Tads_point): Tads_point;
// ３角形の重心を出す
var
  rSeg: Boolean;
  PosA, PosB, PosC: Tads_point;
begin
  Result[0] := 0;
  Result[1] := 0;
  Result[2] := 0;
  if GetInters(Pos1, GetDivide(Pos2, Pos3, 2, 1), Pos2, GetDivide(Pos3, Pos1, 2, 1), PosA, rSeg) then begin
    if GetInters(Pos2, GetDivide(Pos1, Pos3, 2, 1), Pos3, GetDivide(Pos1, Pos2, 2, 1), PosB, rSeg) then begin
      if GetInters(Pos3, GetDivide(Pos2, Pos1, 2, 1), Pos1, GetDivide(Pos3, Pos2, 2, 1), PosC, rSeg) then begin
        if ((PosA[0] = PosB[0])and(PosB[0] = PosC[0])and(PosA[1] = PosB[1])and(PosB[1] = PosC[1])) then begin
          Result[0] := PosA[0];
          Result[1] := PosA[1];
        end else begin
          Result[0] := (PosA[0] + PosB[0] + PosC[0]) / 3;
          Result[1] := (PosA[1] + PosB[1] + PosC[1]) / 3;
        end;
      end;
    end;
  end;
end;

function PolyArcBalance(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point): Boolean;
// 欠円の重心を出す
var
  Angle, DblAngle, Radius, CenAng, H, Rev: Double;
begin
  Result := False;
  if PolyArcCenter(Pos1, Pos2, Bulge, CenPos, Radius) then begin
    Angle := ArcTan(Abs(Bulge)) * 2;  // * 4 で円弧角度
    DblAngle := ArcTan(Abs(Bulge)) * 4; // 円弧角度
    if (Angle <> 0)and(Radius <> 0)and(Bulge <> 0) then begin
      H := 0;
      try
        try                                 // H=中心から
          H := (4 / 3) * ((Radius * (Sin(Angle)) * (Sin(Angle)) * (Sin(Angle))) / (DblAngle - Sin(DblAngle)));  // 中心からの高さ
        except
          H := 0;
        end;
      finally
        if (Bulge >= 0) then begin
          // ふくらみ正で、反時計回り
          {if (PI >= DblAngle) then} Rev := -90 {else Rev := 90};
        end else begin
          {if (PI >= DblAngle) then} Rev := 90 {else Rev := -90};
        end;
        CenAng := GetSrcAngle(GetDegAngle(Pos1, Pos2) + Rev, True); // ２点間に垂直な角度
        CenPos := GetDegPolar(CenPos, H, CenAng);
        Result := True;
      end;
    end;
  end;
end;

function TriangleArea(const Pos1, Pos2, Pos3: Tads_point): Double;
// ３角形を示す３点の内側の面積を出す
var
  Angle: Double;
begin
  Angle := Abs(GetAngle(Pos1, Pos2) - GetAngle(Pos1, Pos3));
  if Angle <> 0 then begin
    Result := Abs(GetDistance(Pos1, Pos2) * GetDistance(Pos1, Pos3) * Sin(Angle)) / 2;
  end else begin
    Result := 0;
  end;
end;

function PolyArcArea(const Pos1, Pos2: Tads_point; const Bulge: Double; var Area, Dist: Double): Boolean;
// 円弧の面積を出す
var
  rChk: Boolean;
  Angle, CenLen, Radius, H: Double;
begin
  Result := False;
  Area := 0;
  Dist := 0;
  Angle := ArcTan(Abs(Bulge)) * 4;                    // 円弧角度
  CenLen := GetDistance(Pos1, Pos2);                  // ２点間の距離
  if (Angle <> 0)and(CenLen <> 0)and(Bulge <> 0) then begin
    rChk := (Angle > PI);
    if rChk then Angle := (2 * PI) - Angle;
    Radius := CenLen / Sin(Angle / 2) / 2;            // 半径
    Dist := Angle * Radius;                           // 弧の長さ (Angle*(2*PI*Radius))/(2*PI)
    H := (4 * Radius * Radius) - (CenLen * CenLen);   // ルートの中
    try
      try
        H := Radius - (Sqrt(H) / 2);                    // 円弧の高さ
      except
        H := 0;
      end;
    finally
      Area := ((Radius * Dist) - ((Radius - H) * CenLen)) / 2;  // 面積
      if rChk then begin
        Area := (Radius * Radius * PI) - Area;
        Dist := (2 * Radius * PI) - Dist;
      end;
    end;
  end;
end;

function CircleArea(const Radius: Double; var Area, Dist: Double): Boolean;
// 円の面積と周辺長を出す
begin
  Area := Radius * Radius * PI;
  Dist := 2 * Radius * PI;
  Result := (Area <> 0);
end;

end.
