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
  PerDiff: Double = 0.0001;       // ���W���r����ۂ̋��e�� Permission Difference

// *************************************************************** ��{���Z�֐�

// Standard�ŗp - ArcTan(Y/X) ���v�Z���A�ی��̊p�x��Ԃ�
function ArcTan2(Y, X: Extended): Extended;
// Standard�ŗp - X��ArcCos(�t�]��)��Ԃ��BX��-1�`1�͈̔͂Ŏw�肷�邱�ƁB�߂�l��0�`�΂̃��W�A���ƂȂ�B
function ArcCos(X: Extended): Extended;
// Double�^���琮���l���擾����(�ϊ��G���[���́ADefault�̒l���Ԃ�)
function TruncDef(const Value: Double; const Default: Integer): Integer;
// �������Double�^�f�[�^�ɕϊ�����B�G���[���́ADefault�̒l���Ԃ�
function StrToFloatDef(const S: AnsiString; const Default: Double): Double;

// ����n�̐��x���������āAAutoCAD�̐��x�Ƃ̌덷���Ȃ������߂̏���
function PrecRevise(const Value: Double): Double;
// �����l���w�菭���_�P�^���Ŋۂ߂܂�
function RoundPrecis(const Value: Double; const Precision: Integer): Double;
// PerDiff�萔�̋��e�͈͂łQ�̎����l���r���A���������True�Ƃ���
function AsPermit(const Value1, Value2: Double): Boolean;
// PerDiff�萔�̋��e�͈͂łQ�̍��W�l���r���A���������True�Ƃ���
function AsPermitPos(const Pos1, Pos2: Tads_point): Boolean;

// *************************************************************** ��{�ϊ��֐�

// ���W�A���P�ʂ̊p�x��x���ɕϊ����܂�
function RadToDeg(const Radians: Double): Double;
// �x���̊p�x�����W�A���ɕϊ����܂��B360 �x�̓��W�A���� 2�΂ɑ������܂�
function DegToRad(const Degrees: Double): Double;
// ���̊p�x������Angle�l��x��(DegMode=True)�Ȃ�0�`360�܂ŁA���W�A��(DegMode=False)�Ȃ�0�`2PI�̐��l�ɕύX����
function GetSrcAngle(const Angle: Double; const DegMode: Boolean): Double;
// �[�_�ƃx�N�g���l����A�[���Q�_���W���o��
function VectorToPoint(const LastPos, Vector: Tads_point; const Ray: Boolean; var Pos1, Pos2: Tads_point): Boolean;

// *************************************************************** ��{���Εϊ��֐�

// BasePt������W�Ƃ��āAPt���W�̑��΍��W�𓾂�
function GetRelPoint(const BasePt, Pt: Tads_point): Tads_point;
// BaseAngle����p�x�Ƃ��āAAngle(�p�x:DegMode=True/���W�A��:DegMode=False)�̑��Ίp�x�𓾂�(Angle:�{=�����v���/�|=���v���)
function GetRelAngle(const BaseAngle, Angle: Double; const DegMode: Boolean): Double;

// *************************************************************** AutoLISP���Z�֐�

// Int1 �� Int2 �̍ő���񐔂𓾂�
function Gcd(const Int1, Int2: Integer): Integer;
// �ׂ���v�Z Base^Power�����s����
function Expt(const Base, Power: Double): Double;
// �r�b�g�����̘_�����Z�֐�
function Boole(const Func: Cardinal; const Int1, Int2: Integer): Integer;

// *************************************************************** �W�I���g���b�N��{���W���Z�֐�

// ������(W)�Ɛ�����(H)����X�΂̒���(Dist)�𓾂�
function GetWidthDist(const Width, Height: Double): Double;

// ------------------------------- ���W�A���p�x�p�֐�
// ��ӂ̐�����(Width)�ƃ��W�A���p�x(Angle)���琂����(Height)�𓾂�
function GetWidthAHeight(const Width, Angle: Double): Double;
// �X�΂̒���(Dist)�ƃ��W�A���p�x(Angle)���琅����(Width)�𓾂�
function GetDistAWidth(const Dist, Angle: Double): Double;
// �X�΂̒���(Dist)�ƃ��W�A���p�x(Angle)���琂����(Height)�𓾂�
function GetDistAHeight(const Dist, Angle: Double): Double;
// ������(Width)�Ɛ�����(Height)����X�Ίp�x(Angle)�����W�A���œ���
function GetWidthAngle(const Width, Height: Double): Double;

// ------------------------------- �p�x���p�֐�
// ��ӂ̐�����(Width)�Ɗp�x(DegAngle)���琂����(Height)�𓾂�
function GetWidthDegHeight(const Width, DegAngle: Double): Double;
// �X�΂̒���(Dist)�Ɗp�x(DegAngle)���琅����(Width)�𓾂�
function GetDistDegWidth(const Dist, DegAngle: Double): Double;
// �X�΂̒���(Dist)�Ɗp�x(DegAngle)���琂����(X)�𓾂�
function GetDistDegHeight(const Dist, DegAngle: Double): Double;
// ������(Width)�Ɛ�����(Height)����X�Ίp�x(DegAngle)��x���œ���
function GetWidthDegAngle(const Width, Height: Double): Double;

// *************************************************************** �W�I���g���b�N�֐�

// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̋���(Dist)�𓾂�
function GetDistance(const PosA, PosB: Tads_point): Double;
// �R�����̊�_(PosA)����Q�_��(PosB)�܂ł̂R�����̋���(Dist)�𓾂�
function GetDistance3D(const PosA, PosB: Tads_point): Double;

// ��_(PosA)����Q�_��(PosB)�܂ł𕪊���(Division)�Ŋ��������́A��_����Steps(0=��ʒu)�ڂ̍��W�𓾂�
function GetDivide(const PosA, PosB: Tads_point; const Division, Steps: Double): Tads_point;
// ��_(PosA)����Q�_��(PosB)�܂ł��Ԋu(Interval)�Ŋ��������́A��_����Steps(0=��ʒu)�ڂ̍��W�𓾂�
function GetMeasure(const PosA, PosB: Tads_point; const Interval, Steps: Double): Tads_point;

// �Q�̒���(PosA1 - PosA2),(PosB1 - PosB2) �̌����ʒu(GetPos)�𓾂�. �����Ȃ��ꍇFalse
function GetInters(const PosA1, PosA2, PosB1, posB2: Tads_point; var GetPos: Tads_point; var onSeg: Boolean): Boolean;
// �Q�̉~(PosA,RadiusA),(PosB,RadiusB)�̌����ʒu(GetPos1,GetPos2)�𓾂�. ����鐔��Ԃ�(����Ȃ��ꍇ0)
function GetCircles(const PosA, PosB: Tads_point; const RadiusA, RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;
// ����(PosA1-PosA2)�Ɖ~(PosB,RadiusB)�̌����ʒu(GetPos1,GetPos2)�𓾂�. ����鐔��Ԃ�(����Ȃ��ꍇ0)
function GetCirInters(const PosA1, PosA2, PosB: Tads_point; const RadiusB: Double; var GetPos1, GetPos2: Tads_point): Integer;

// ------------------------------- ���W�A���p�x�p�֐�
// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̊p�x(Angle)�����W�A���œ���
function GetAngle(const PosA, PosB: Tads_point): Double;
// �Q�����̊�_(PosA)����X�Β���(Dist)�ƃ��W�A���p�x(Angle)�Ɉʒu����Q�_�ڂ̈ʒu�𓾂�
function GetPolar(const PosA: Tads_point; const Dist, Angle: Double): Tads_point;
// �Q�����̊�_(PosA)���琅��(Width)�Ɛ���(Height)�����̍��W�����W�A���p�x(Angle)���l�����Ĉʒu�𓾂�
function GetPolarXY(const PosA: Tads_point; const Width, Height, Angle: Double): Tads_point;
// �Q�̓_�Ŏ������������������P�_�����ɐ����Ȋp�x�𓾂�
function GetRightAngle(const PosA, PosB, PosDir: Tads_point; var RightAngle: Double): Boolean;

// ------------------------------- �p�x���p�֐�
// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̊p�x(Angle)��x���œ���
function GetDegAngle(const PosA, PosB: Tads_point): Double;
// �Q�����̊�_(PosA)����X�Β���(Dist)�Ɗp�x(DegAngle)�Ɉʒu����Q�_�ڂ̈ʒu�𓾂�
function GetDegPolar(const PosA: Tads_point; const Dist, DegAngle: Double): Tads_point;
// �Q�����̊�_(PosA)���琅��(Width)�Ɛ���(Height)�����̍��W���p�x(DegAngle)���l�����Ĉʒu�𓾂�
function GetDegPolarXY(const PosA: Tads_point; const Width, Height, DegAngle: Double): Tads_point;
// �Q�̓_�Ŏ������������������P�_�����ɐ����Ȋp�x�𓾂�
function GetRightDegAngle(const PosA, PosB, PosDir: Tads_point; var DegRightAngle: Double): Boolean;

// *************************************************************** �d�S/����/���� ���Z�֐�

// �~�ʂ̔��a�ƒ��S���W���o��
function PolyArcCenter(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point; var Radius: Double): Boolean;
// �R�p�`�̏d�S���o��
function TriangleBalance(const Pos1, Pos2, Pos3: Tads_point): Tads_point;
// ���~�̏d�S���o��
function PolyArcBalance(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point): Boolean;
// �R�p�`�������R�_�̓����̖ʐς��o��
function TriangleArea(const Pos1, Pos2, Pos3: Tads_point): Double;
// �~�ʂ̖ʐςƒ������o��
function PolyArcArea(const Pos1, Pos2: Tads_point; const Bulge: Double; var Area, Dist: Double): Boolean;
// �~�̖ʐςƎ��Ӓ����o��
function CircleArea(const Radius: Double; var Area, Dist: Double): Boolean;

implementation

// *************************************************************** ��{���Z�֐�

function ArcTan2(Y, X: Extended): Extended;
// Standard�ŗp - ArcTan(Y/X) ���v�Z���A�ی��̊p�x��Ԃ�
asm
  FLD Y
  FLD X
  FPATAN
  FWAIT
end;

function ArcCos(X: Extended): Extended;
// Standard�ŗp - X��ArcCos(�t�]��)��Ԃ��BX��-1�`1�͈̔͂Ŏw�肷�邱�ƁB�߂�l��0�`�΂̃��W�A���ƂȂ�B
begin
  Result := ArcTan2(Sqrt(1 - X * X), X);
end;

function TruncDef(const Value: Double; const Default: Integer): Integer;
// Double�^���琮���l���擾����(�ϊ��G���[���́ADefault�̒l���Ԃ�)
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
// �������Double�^�f�[�^�ɕϊ�����B�G���[���́ADefault�̒l���Ԃ�
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
// ����n�̐��x���������āAAutoCAD�̐��x�Ƃ̌덷���Ȃ������߂̏���
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
// ���l���w�菭���_�P�^���Ŋۂ߂܂�
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
// PerDiff�萔�̋��e�͈͂łQ�̎����l���r���A���������True�Ƃ���
begin
  Result := ((Value1 >= (Value2 - PerDiff))and((Value2 + PerDiff) >= Value1));
end;

function AsPermitPos(const Pos1, Pos2: Tads_point): Boolean;
// PerDiff�萔�̋��e�͈͂łQ�̍��W�l���r���A���������True�Ƃ���
begin
  Result := (AsPermit(Pos1[0], Pos2[0]))and(AsPermit(Pos1[1], Pos2[1]))and(AsPermit(Pos1[2], Pos2[2]));
end;

// *************************************************************** ��{�ϊ��֐�

function RadToDeg(const Radians: Double): Double;
// ���W�A���P�ʂ̊p�x��x���ɕϊ����܂�
begin
  Result := RoundPrecis(PrecRevise(Radians * 180 / PI), 8);
end;

function DegToRad(const Degrees: Double): Double;
// �x���̊p�x�����W�A���ɕϊ����܂��B360 �x�̓��W�A���� 2�΂ɑ������܂�
begin
  Result := PrecRevise(Degrees * PI / 180);
end;

function GetSrcAngle(const Angle: Double; const DegMode: Boolean): Double;
// ���̊p�x������ Angle�l��DegMode�ɏ]���A�x��(DegMode=True)�Ȃ�0�`360�܂ŁA���W�A��(DegMode=False)�Ȃ�0�`2PI�̐��l�ɕύX����
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
// �[�_�ƃx�N�g���l����A�[���Q�_���W���o��
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

// *************************************************************** ��{���Εϊ��֐�

function GetRelPoint(const BasePt, Pt: Tads_point): Tads_point;
// BasePt������W�Ƃ��āAPt���W�̑��΍��W�𓾂�
begin
  Result[0] := Pt[0] - BasePt[0];
  Result[1] := Pt[1] - BasePt[1];
  Result[2] := Pt[2] - BasePt[2];
end;

function GetRelAngle(const BaseAngle, Angle: Double; const DegMode: Boolean): Double;
// BaseAngle����p�x�Ƃ��āAAngle(�p�x:DegMode=True/���W�A��:DegMode=False)�̑��Ίp�x�𓾂�(Angle:�{=�����v���/�|=���v���)
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

// *************************************************************** AutoLISP���Z�֐�

function Gcd(const Int1, Int2: Integer): Integer;
// Int1 �� Int2 �̍ő���񐔂𓾂�
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
// �ׂ���v�Z Base^Power�����s����
begin
  Result := Exp(Power * Ln(Base));
end;

function Boole(const Func: Cardinal; const Int1, Int2: Integer): Integer;
// �r�b�g�����̘_�����Z�֐�
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

// *************************************************************** �W�I���g���b�N��{���W���Z�֐�

function GetWidthAHeight(const Width, Angle: Double): Double;
// ��ӂ̐�����(Width)�ƃ��W�A���p�x(Angle)���琂����(Height)�𓾂�
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
// ��ӂ̐�����(Width)�Ɗp�x(DegAngle)���琂����(Height)�𓾂�
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
// �X�΂̒���(Dist)�ƃ��W�A���p�x(Angle)���琅����(Width)�𓾂�
begin
  Result := PrecRevise(Cos(Angle) * Dist);
end;

function GetDistAHeight(const Dist, Angle: Double): Double;
// �X�΂̒���(Dist)�ƃ��W�A���p�x(Angle)���琂����(Height)�𓾂�
begin
  Result := PrecRevise(Sin(Angle) * Dist);
end;

function GetDistDegWidth(const Dist, DegAngle: Double): Double;
// �X�΂̒���(Dist)�Ɗp�x(DegAngle)���琅����(Width)�𓾂�
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
// �X�΂̒���(Dist)�Ɗp�x(DegAngle)���琂����(X)�𓾂�
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
// ������(Width)�Ɛ�����(Height)����X�΂̒����𓾂�
begin
  Result := PrecRevise(Sqrt(Width * Width + Height * Height));
end;

function GetWidthAngle(const Width, Height: Double): Double;
// ������(Width)�Ɛ�����(Height)����X�Ίp�x(Angle)�����W�A���œ���
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
// ������(Width)�Ɛ�����(Height)����X�Ίp�x(DegAngle)��x���œ���
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

// *************************************************************** �W�I���g���b�N�֐�

function GetDistance(const PosA, PosB: Tads_point):  Double;
// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̋���(Dist)�𓾂�
begin
  Result := GetWidthDist((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetDistance3D(const PosA, PosB: Tads_point):  Double;
// �R�����̊�_(PosA)����Q�_��(PosB)�܂ł̂R�����̋���(Dist)�𓾂�
var
  buf: Double;
begin
  buf := GetWidthDist((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
  Result := GetWidthDist(buf, (PosB[2] - PosA[2]));
end;

function GetAngle(const PosA, PosB: Tads_point): Double;
// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̊p�x(Angle)�����W�A���œ���
begin
  Result := GetWidthAngle((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetDegAngle(const PosA, PosB: Tads_point): Double;
// �Q�����̊�_(PosA)����Q�_��(PosB)�܂ł̊p�x(Angle)��x���œ���
begin
  Result := GetWidthDegAngle((PosB[0] - PosA[0]), (PosB[1] - PosA[1]));
end;

function GetPolar(const PosA: Tads_point; const Dist, Angle: Double): Tads_point;
// �Q�����̊�_(PosA)����X�Β���(Dist)�ƃ��W�A���p�x(Angle)�Ɉʒu����Q�_�ڂ̈ʒu�𓾂�
begin
  Result[0] := GetDistAWidth(Dist, Angle) + PosA[0];
  Result[1] := GetDistAHeight(Dist, Angle) + PosA[1];
  Result[2] := 0;
end;

function GetDegPolar(const PosA: Tads_point; const Dist, DegAngle: Double): Tads_point;
// �Q�����̊�_(PosA)����X�Β���(Dist)�Ɗp�x(DegAngle)�Ɉʒu����Q�_�ڂ̈ʒu�𓾂�
begin
  Result[0] := GetDistDegWidth(Dist, DegAngle) + PosA[0];
  Result[1] := GetDistDegHeight(Dist, DegAngle) + PosA[1];
  Result[2] := 0;
end;

function GetPolarXY(const PosA: Tads_point; const Width, Height, Angle: Double): Tads_point;
// �Q�����̊�_(PosA)���琅��(Width)�Ɛ���(Height)�����̍��W�����W�A���p�x(Angle)���l�����Ĉʒu�𓾂�
var
  Dist, BaseA: Double;
begin
  Dist := GetWidthDist(Width, Height);    // �X�Ίp�x�𓾂�
  BaseA := GetWidthAngle(Width, Height);  // ���̌X�Ίp�x(RAD)
  Result[0] := GetDistAWidth(Dist, BaseA + Angle) + PosA[0];
  Result[1] := GetDistAHeight(Dist, BaseA + Angle) + PosA[1];
  Result[2] := 0;
end;

function GetDegPolarXY(const PosA: Tads_point; const Width, Height, DegAngle: Double): Tads_point;
// �Q�����̊�_(PosA)���琅��(Width)�Ɛ���(Height)�����̍��W���p�x(DegAngle)���l�����Ĉʒu�𓾂�
var
  Dist, BaseA: Double;
begin
  Dist := GetWidthDist(Width, Height);    // �X�Ίp�x�𓾂�
  BaseA := GetWidthDegAngle(Width, Height); // ���̌X�Ίp�x(RAD)
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
// �Q�̒���(PosA1 - PosA2),(PosB1 - PosB2) �̌����ʒu(GetPos)�𓾂�. �����Ȃ��ꍇFalse
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
// �Q�̉~(PosA,RadiusA),(PosB,RadiusB)�̌����ʒu(GetPos1,GetPos2)�𓾂�. ����鐔��Ԃ�(����Ȃ��ꍇ0)
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
// ����(PosA1-PosA2)�Ɖ~(PosB,RadiusB)�̌����ʒu(GetPos1,GetPos2)�𓾂�. ����鐔��Ԃ�(����Ȃ��ꍇ0)
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
// ��_(PosA)����Q�_��(PosB)�܂ł𕪊���(Division)�Ŋ��������́A��_����Steps(0=��ʒu)�ڂ̍��W�𓾂�
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
// ��_(PosA)����Q�_��(PosB)�܂ł��Ԋu(Interval)�Ŋ��������́A��_����Steps(0=��ʒu)�ڂ̍��W�𓾂�
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
// �Q�̓_�Ŏ������������������P�_�����ɐ����Ȋp�x�𓾂�
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
// �Q�̓_�Ŏ������������������P�_�����ɐ����Ȋp�x�𓾂�
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

// *************************************************************** �d�S/����/���� ���Z�֐�

function PolyArcCenter(const Pos1, Pos2: Tads_point; const Bulge: Double; var CenPos: Tads_point; var Radius: Double): Boolean;
// �~�ʂ̔��a�ƒ��S���W���o��
var
  Angle, CenLen, RAngle, H, Rev: Double;
begin
  Result := False;
  Radius := 0;
  CenPos[0] := 0;
  CenPos[1] := 0;
  CenPos[2] := 0;
  Angle := ArcTan(Abs(Bulge)) * 4;                    // �~�ʊp�x
  CenLen := GetDistance(Pos1, Pos2);                  // �Q�_�Ԃ̋���
  if (Angle <> 0)and(CenLen <> 0)and(Bulge <> 0) then begin
    Radius := (CenLen / Sin(Angle / 2)) / 2;          // ���a
    H := (4 * Radius * Radius) - (CenLen * CenLen);   // ���[�g�̒�
    try
      try
        H := Radius - (Sqrt(H) / 2);                    // �~�ʂ̍���
      except
        H := 0;
      end;
    finally
      if (Bulge >= 0) then begin
        // �ӂ���ݐ��ŁA�����v���
        if (PI >= Angle) then Rev := 90 else Rev := -90;
      end else begin
        if (PI >= Angle) then Rev := -90 else Rev := 90;
      end;
      RAngle := GetSrcAngle(GetDegAngle(Pos1, Pos2) + Rev, True); // �Q�_�Ԃɐ����Ȋp�x
      CenPos := GetDegPolar(GetDivide(Pos1, Pos2, 2, 1), Radius - H, RAngle);
      Result := True;
    end;
  end;
end;

function TriangleBalance(const Pos1, Pos2, Pos3: Tads_point): Tads_point;
// �R�p�`�̏d�S���o��
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
// ���~�̏d�S���o��
var
  Angle, DblAngle, Radius, CenAng, H, Rev: Double;
begin
  Result := False;
  if PolyArcCenter(Pos1, Pos2, Bulge, CenPos, Radius) then begin
    Angle := ArcTan(Abs(Bulge)) * 2;  // * 4 �ŉ~�ʊp�x
    DblAngle := ArcTan(Abs(Bulge)) * 4; // �~�ʊp�x
    if (Angle <> 0)and(Radius <> 0)and(Bulge <> 0) then begin
      H := 0;
      try
        try                                 // H=���S����
          H := (4 / 3) * ((Radius * (Sin(Angle)) * (Sin(Angle)) * (Sin(Angle))) / (DblAngle - Sin(DblAngle)));  // ���S����̍���
        except
          H := 0;
        end;
      finally
        if (Bulge >= 0) then begin
          // �ӂ���ݐ��ŁA�����v���
          {if (PI >= DblAngle) then} Rev := -90 {else Rev := 90};
        end else begin
          {if (PI >= DblAngle) then} Rev := 90 {else Rev := -90};
        end;
        CenAng := GetSrcAngle(GetDegAngle(Pos1, Pos2) + Rev, True); // �Q�_�Ԃɐ����Ȋp�x
        CenPos := GetDegPolar(CenPos, H, CenAng);
        Result := True;
      end;
    end;
  end;
end;

function TriangleArea(const Pos1, Pos2, Pos3: Tads_point): Double;
// �R�p�`�������R�_�̓����̖ʐς��o��
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
// �~�ʂ̖ʐς��o��
var
  rChk: Boolean;
  Angle, CenLen, Radius, H: Double;
begin
  Result := False;
  Area := 0;
  Dist := 0;
  Angle := ArcTan(Abs(Bulge)) * 4;                    // �~�ʊp�x
  CenLen := GetDistance(Pos1, Pos2);                  // �Q�_�Ԃ̋���
  if (Angle <> 0)and(CenLen <> 0)and(Bulge <> 0) then begin
    rChk := (Angle > PI);
    if rChk then Angle := (2 * PI) - Angle;
    Radius := CenLen / Sin(Angle / 2) / 2;            // ���a
    Dist := Angle * Radius;                           // �ʂ̒��� (Angle*(2*PI*Radius))/(2*PI)
    H := (4 * Radius * Radius) - (CenLen * CenLen);   // ���[�g�̒�
    try
      try
        H := Radius - (Sqrt(H) / 2);                    // �~�ʂ̍���
      except
        H := 0;
      end;
    finally
      Area := ((Radius * Dist) - ((Radius - H) * CenLen)) / 2;  // �ʐ�
      if rChk then begin
        Area := (Radius * Radius * PI) - Area;
        Dist := (2 * Radius * PI) - Dist;
      end;
    end;
  end;
end;

function CircleArea(const Radius: Double; var Area, Dist: Double): Boolean;
// �~�̖ʐςƎ��Ӓ����o��
begin
  Area := Radius * Radius * PI;
  Dist := 2 * Radius * PI;
  Result := (Area <> 0);
end;

end.
