unit DArxEnts;

// ******************************************************
//          DelphiARX2002 Entmake Assistant Object
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
  Windows, Messages, SysUtils, Classes, DArxH, DArxAds;

type
  TDArxTableMake = class;
  TDArxEntMake = class;

  TDxfTextMirror = set of (tmMirrorInX, tmMirrorInY);

  TDArxTableMake = class(TDCustomEntMake)
  private
    FTableFlags: Smallint;
  public
    constructor Create; override;
    destructor Destroy; override;
    // -------------------------------------------------------------------------
    // TABLES
    function MakeTable: Boolean;
    function AddAPPID(AppName: AnsiString): Boolean;
    function AddDIMSTYLE(DimName: AnsiString): Boolean;
    function AddLAYER(LayerName, LineName: AnsiString; Color: Smallint = 7; LineWeight: Smallint = lwDEFAULT; Lock: Boolean = False; Freeze: Boolean = False; ViewFreeze: Boolean = False): Boolean;
    function AddLTYPE(LineName, Explain: AnsiString; DashMax: Smallint; RoundLen, DashLen: Double; TypeFlags: Smallint = 0; ShCode: Smallint = 0): Boolean; overload;
    function AddLTYPE(LinParam: TLTypeParam; StyleObj: AnsiString = ''; ShCode: Smallint = 0): Boolean; overload;
    function AddSTYLE(TextName, FontName, DFontName: AnsiString; Height: Double = 0; Shape: Boolean = False; VertWrt: Boolean = False; WidthFactor: Double = 1; Angle: Double = 0; Mirror: TDxfTextMirror = []): Boolean;
    function AddUCS(UcsName: AnsiString; BasePos, directX, directY: Tads_point): Boolean;
    function AddVIEW(ViewName: AnsiString; PaperSpace: Boolean = False): Boolean;
    function AddVPORT(VportName: AnsiString; lbCorner, rtCorner: Tads_point): Boolean;

    property TableFlags: Smallint read FTableFlags write FTableFlags;                     // Default=0
  end;

  TDxfTextJustify = (tjLeft, tjCenter, tjRight, tjAlign, tjMiddle, tjFit, tjTL, tjTC, tjTR, tjML, tjMC, tjMR, tjBL, tjBC, tjBR);
  TDxfMTextAlignment = (maLeft, maRight, maTop, maBottom);
  TDxfMTextRowSpaceStyle = (mrMinim, mrFix);
  TDxfLeaderPathType = (lptStraight, lptSpline);
  TDxfLeaderHooklineWayFlag = (lhwReverse, lhwSame);
  TDxfLeaderTad = (ltCenter, ltOver, ltOut, ltJis);

  TDArxEntMake = class(TDCustomEntMake)
  private
    // VERTEX LIST
    FVertexItems: TDVertexItems;
    // TEST PROPERTES
    FTextStyle: AnsiString;
    FTextWidthFactor: Double;
    FTextOblique: Double;
    FTextJustify: TDxfTextJustify;
    FTextMirror: TDxfTextMirror;
    // ATTRIB PROPERTES
    FAttStyle: AnsiString;
    FAttWidthFactor: Double;
    FAttOblique: Double;
    FAttJustify: TDxfTextJustify;
    FAttMirror: TDxfTextMirror;
    // DIMSTYLE
    FDimStyle: AnsiString;
    // LEADER PROPERTES
    FLeaderLeaderFlag: Boolean;
    FLeaderLeaderPathType: TDxfLeaderPathType;
    FLeaderHooklineWayFlag: TDxfLeaderHooklineWayFlag;
    FLeaderHooklineFlag: Boolean;
    FLeaderTad: TDxfLeaderTad;
    // MTEXT PROPERTES
    FMTextAlignment: TDxfMTextAlignment;
    FMTextRowSpaceStyle: TDxfMTextRowSpaceStyle;
    FMTextRowSpaceMeasure: Double;
    // IMAGE PROPERTES
    FImageLight: Integer;
    FImageContrast: Integer;
    FImageScumble: Integer;
    // INSERT PROPERTES
    FColCount: Smallint;
    FColWidth: Double;
    FRowCount: Smallint;
    FRowWidth: Double;
  protected
    procedure ResetVertexItem(ReCreate: Boolean);
    procedure SetStrContinue(const StrData: AnsiString);  // 改行で区切られた文字列をグループ１で分ける
    procedure SetStr255Data(const StrData: AnsiString);   // 255文字以上ならグループ３で分ける
    procedure SetMTextData(const StrData: AnsiString);
    procedure SetAttDefOptions(AttRotation: Double; alignmentPoint: Tads_point; Prompt, Tag: AnsiString; AttFlag: Smallint);
    procedure SetAttRibOptions(AttRotation: Double; alignmentPoint: Tads_point; Tag: AnsiString; AttFlag: Smallint);
    procedure SetLeaderOptions(LeaderMake: Smallint);
    function SetLeaderAddOptions(LeaderHandle: Tads_name): Boolean;
    function SetlbInsert(LastHandle: Tads_Name; BlockName: AnsiString; position, Scale: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean;    procedure SetTextOptions(TextRotation: Double; alignmentPoint: Tads_point);
    procedure SetMTextOptions(Str: AnsiString; alignmentPoint: Tads_point);
    function MakeLWPolyline(VertexCount: Integer; DefWidth: Double; Closed: Boolean; Pattern: Boolean): Boolean;
    function Make2DPolyline(Closed: Boolean; Pattern: Boolean; Options: Smallint): Boolean;
    function Make3DPolyline(Closed: Boolean; Pattern: Boolean; Options: Smallint): Boolean;
    function AddResVertex(Poly3D: Boolean): Boolean;
  public
    constructor Create; override;
    destructor Destroy; override;
    // -------------------------------------------------------------------------
    // BLOCK *******************************************************************
    function MakeBlock(BlockName: AnsiString; Flags: Smallint = 0): Boolean; overload;
    function MakeBlock(BlockName: AnsiString; InsertPt: Tads_point; Flags: Smallint = 0): Boolean; overload;
    function EndBlock: AnsiString;  // return to BlockName
    // GROUP *******************************************************************
    procedure MakeGroup;
    function EndGroup(GroupName, Explain: AnsiString; NonName: Boolean = False; NonSelect: Boolean = False): Boolean;
    // VERTEX ITEMS ************************************************************
    procedure MakeVertex;
    procedure FreeVertex;
    function AddVertex(Point: Tads_point; Bulge: Double = 0; StartWidth: Double = 0; EndWidth: Double = 0): Integer;
    // *************************************************************************
    function E3DFace(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point; HideFlags: Smallint = 0): Boolean;
    function E3DSolid(const ACISData: AnsiString): Boolean;
    function Arc(Center: Tads_point; Radius, startAngle, endAngle: Double): Boolean;
    function AttDef(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0; Prompt: AnsiString = ''; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean; overload;
    function AttDef(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0; Prompt: AnsiString = ''; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean; overload;
    function AttRib(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean; overload;
    function AttRib(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean; overload;
    function Body(ACISData: AnsiString): Boolean;
    function Circle(Center: Tads_point; Radius: Double): Boolean;
    //// DIMENSION
    function Ellipse(Center, unitNormal, majorAxis: Tads_point; radiusRatio, startAngle, endAngle: Double): Boolean; overload;
    function Ellipse(Center, unitNormal, majorAxis: Tads_point; radiusRatio: Double): Boolean; overload;
    function Ellipse(Center, majorAxis: Tads_point; radiusRatio, startAngle, endAngle: Double): Boolean; overload;
    function Ellipse(Center, majorAxis: Tads_point; radiusRatio: Double): Boolean; overload;
    //// HATCH
    function ImageAttach(ImageName, FileName: AnsiString; Vertex: Tads_point; Scale: Double = 1; Angle: Double = 0): Boolean;
    function Insert(BlockName: AnsiString; position: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean; overload;
    function Insert(BlockName: AnsiString; position, Scale: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean; overload;
    function Leader(Vertex1, Vertex2: Tads_point): Boolean; overload;
    function Leader(Vertex1, Vertex2, Vertex3: Tads_point): Boolean; overload;
    function Leader(VertexArray: array of Tads_point): Boolean; overload;
    function LeaderMText(Vertex1, Vertex2: Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean; overload;
    function LeaderMText(Vertex1, Vertex2, Vertex3: Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean; overload;
    function LeaderMText(VertexArray: array of Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean; overload;
    function LeaderTolerance(Vertex1, Vertex2: Tads_point; Str: AnsiString): Boolean; overload;
    function LeaderTolerance(Vertex1, Vertex2, Vertex3: Tads_point; Str: AnsiString): Boolean; overload;
    function LeaderTolerance(VertexArray: array of Tads_point; Str: AnsiString): Boolean; overload;
    function LeaderBlock(Vertex1, Vertex2: Tads_point; BlockName: AnsiString): Boolean; overload;           // DXFに余分なSEQENDが挿入される
    function LeaderBlock(Vertex1, Vertex2, Vertex3: Tads_point; BlockName: AnsiString): Boolean; overload;  // DXFに余分なSEQENDが挿入される
    function LeaderBlock(VertexArray: array of Tads_point; BlockName: AnsiString): Boolean; overload;       // DXFに余分なSEQENDが挿入される
    function Line(startPos, endPos: Tads_point): Boolean; overload;
    function Line(startPos: Tads_point; nextPos: array of Tads_point): Boolean; overload;
    // MLINE
//    function MLine(VertexArray: array of Tads_point; Closed: Boolean = False; Adjust: Smallint = 0): Boolean;
    function Rectang(Corner1, Corner2: Tads_point; Angle: Double = 0; Width: Double = 0; Pattern: Boolean = False): Boolean;
    function Polygon(Center: Tads_point; PolyCount: Integer; Radius: Double; Outside: Boolean = False; Angle: Double = 0; Width: Double = 0; Pattern: Boolean = False): Boolean;
    function MText(position: Tads_point; Str: AnsiString; Height: Double = 0; RectWidth: Double = 0): Boolean; overload;
    function MText(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; RectWidth: Double = 0): Boolean; overload;
    // OLEFRAME
    // OLE2FRAME
    function Point(position: Tads_point; userAngle: Double = 0): Boolean;
    function LWPolyLine(Closed: Boolean; Pattern: Boolean = False): Boolean; overload;
    function LWPolyLine(Points: array of Tads_point; Closed: Boolean; Width: Double = 0; Pattern: Boolean = False): Boolean; overload;
    function M2DPolyline(Closed: Boolean; Pattern: Boolean = False; Options: Smallint = 0): Boolean; overload;
    function M2DPolyline(Points: array of Tads_point; Closed: Boolean; Width: Double = 0; Pattern: Boolean = False; Options: Smallint = 0): Boolean; overload;
    function M3DPolyLine(Closed: Boolean; Pattern: Boolean = False; Options: Smallint = 0): Boolean; overload;
    function M3DPolyLine(Points: array of Tads_point; Closed: Boolean; Width: Double = 0 ; Pattern: Boolean = False; Options: Smallint = 0): Boolean; overload;
    function Ray(basePoint, unitVector: Tads_point): Boolean;
    function Region(ACISData: AnsiString): Boolean;
    function SeqEnd: Boolean;
    // SHAPE
    function Solid(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point): Boolean;
    // SPLINE
//    function Spline(VertexArray: array of Tads_point; Closed: Boolean);

    function Text(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0): Boolean; overload;
    function Text(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0): Boolean; overload;
    function Tolerance(DimName, Str: AnsiString; Location: Tads_point): Boolean; overload;
    function Tolerance(DimName, Str: AnsiString; Location, Orientation: Tads_point): Boolean; overload;
    function Fcf(DimName, Str: AnsiString; Location: Tads_point): Boolean; overload;               // = Tolerance
    function Fcf(DimName, Str: AnsiString; Location, Orientation: Tads_point): Boolean; overload;  // = Tolerance
    function Trace(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point): Boolean;
    // VERTEX
    // VIEWPORT
//    function ViewPort(position: Tads_point; Width, Height: Double): Boolean;
    function XLine(basePoint, unitVector: Tads_point): Boolean;
    // -------------------------------------------------------------------------
    // VERTEX PROPERTES
    property VertexItems: TDVertexItems read FVertexItems;
    // TEXT PROPERTES
    property TextStyle: AnsiString read FTextStyle write FTextStyle;                      // Default='' (Non Setting)
    property TextWidthFactor: Double read FTextWidthFactor write FTextWidthFactor;        // Default=1.0 (Non Setting)
    property TextOblique: Double read FTextOblique write FTextOblique;                    // Default=0.0 (Non Setting)
    property TextJustify: TDxfTextJustify read FTextJustify write FTextJustify;           // Default=tjLeft (Non Setting)
    property TextMirror: TDxfTextMirror read FTextMirror write FTextMirror;               // Default=[] (Non Setting)
    // ATTRIB PROPERTES
    property AttStyle: AnsiString read FAttStyle write FAttStyle;                         // Default='' (Non Setting)
    property AttWidthFactor: Double read FAttWidthFactor write FAttWidthFactor;           // Default=1.0 (Non Setting)
    property AttOblique: Double read FAttOblique write FAttOblique;                       // Default=0.0 (Non Setting)
    property AttJustify: TDxfTextJustify read FAttJustify write FAttJustify;              // Default=tjLeft (Non Setting)
    property AttMirror: TDxfTextMirror read FAttMirror write FAttMirror;                  // Default=[] (Non Setting)
    // DIMSTYLE PROPERTES
    property DimStyle: AnsiString read FDimStyle write FDimStyle;
    // LEADER PROPERTES
    property LeaderLeaderFlag: Boolean read FLeaderLeaderFlag write FLeaderLeaderFlag;
    property LeaderLeaderPathType: TDxfLeaderPathType read FLeaderLeaderPathType write FLeaderLeaderPathType;
    property LeaderHooklineWayFlag: TDxfLeaderHooklineWayFlag read FLeaderHooklineWayFlag write FLeaderHooklineWayFlag;
    property LeaderHooklineFlag: Boolean read FLeaderHooklineFlag write FLeaderHooklineFlag;
    property LeaderTad: TDxfLeaderTad read FLeaderTad write FLeaderTad;
    // MTEXT PROPERTES
    property MTextAlignment: TDxfMTextAlignment read FMTextAlignment write FMTextAlignment;
    property MTextRowSpaceStyle: TDxfMTextRowSpaceStyle read FMTextRowSpaceStyle write FMTextRowSpaceStyle;
    property MTextRowSpaceMeasure: Double read FMTextRowSpaceMeasure write FMTextRowSpaceMeasure;
    // IMAGE PROPERTES
    property ImageLight: Integer read FImageLight write FImageLight;
    property ImageContrast: Integer read FImageContrast write FImageContrast;
    property ImageScumble: Integer read FImageScumble write FImageScumble;
    // INSERT PROPERTES
    property ColCount: Smallint read FColCount write FColCount default 1;                 // Default=1 (Non Setting)
    property ColWidth: Double read FColWidth write FColWidth;                             // Default=0.0 (Non Setting)
    property RowCount: Smallint read FRowCount write FRowCount default 1;                 // Default=1 (Non Setting)
    property RowWidth: Double read FRowWidth write FRowWidth;                             // Default=0.0 (Non Setting)
  end;

implementation

uses
{$IFDEF DARXDEBUG}
  AdsDebug,
{$ENDIF}
  DArxLib, AextCLib, DArxApi;

{ TDArxTableMake }

constructor TDArxTableMake.Create;
begin
  inherited Create;
  FTableFlags := 0;
end;

destructor TDArxTableMake.Destroy;
begin
  inherited Destroy;
end;

function TDArxTableMake.MakeTable: Boolean;
begin
  Result := StartEntMakeX;
end;

function TDArxTableMake.AddAPPID(AppName: AnsiString): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'APPID');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbRegAppTableRecord');
  Item.Add(2, AppName);
  Item.Add(70, FTableFlags);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddDIMSTYLE(DimName: AnsiString): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'DIMSTYLE');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbDimStyleTableRecord');
  Item.Add(2, DimName);
  Item.Add(70, FTableFlags);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddLAYER(LayerName, LineName: AnsiString; Color: Smallint = 7; LineWeight: Smallint = lwDEFAULT; Lock: Boolean = False; Freeze: Boolean = False; ViewFreeze: Boolean = False): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'LAYER');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbLayerTableRecord');
  Item.Add(2, LayerName);
  nFg := FTableFlags;
  if Lock then nFg := nFg or 4;
  if ViewFreeze then nFg := nFg or 2;
  if Freeze then nFg := nFg or 1;
  Item.Add(70, nFg);
  if (LineWeight <> lwBYLAYER)and(LineWeight <> lwBYBLOCK) then Item.Add(370, LineWeight);
  if (Color >= 0)and(256 >= Color) then Item.Add(62, Color) else Item.Add(62, -1);
  if LineName = '' then Item.Add(6, 'CONTINUOUS') else Item.Add(6, LineName);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddLTYPE(LineName, Explain: AnsiString; DashMax: Smallint; RoundLen, DashLen: Double; TypeFlags: Smallint = 0; ShCode: Smallint = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'LTYPE');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbLinetypeTableRecord');
  Item.Add(2, LineName);
  Item.Add(70, FTableFlags);
  Item.Add(3, Explain);
  Item.Add(72, 65);
  Item.Add(73, DashMax);
  Item.Add(40, RoundLen);
  if (DashMax > 0) then Item.Add(49, DashLen);
  Item.Add(74, TypeFlags);
  if TypeFlags > 0 then Item.Add(75, ShCode);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddLTYPE(LinParam: TLTypeParam; StyleObj: AnsiString = ''; ShCode: Smallint = 0): Boolean;
// *ACAD_ISO14W100,ISO dash triple-dot __ . . . __ . . . __ . . . _
// A,12,-3,0,-3,0,-3,0,-3
// *GAS_LINE,Gas line ----GAS----GAS----GAS----GAS----GAS----GAS--
// A,.5,-.2,["GAS",STANDARD,S=.1,R=0.0,X=-0.1,Y=-.05],-.25
// *ZIGZAG,Zig zag /\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/\/
// A,.0001,-.2,[ZIG,ltypeshp.shx,x=-.2,s=.2],-.4,[ZIG,ltypeshp.shx,r=180,x=.2,s=.2],-.2
  function GetPrToken(var Prm: AnsiString): AnsiString;
  var
    nLen: Integer;
  begin
    if Prm = '' then begin
      Result := '';
    end else if (Prm[1] = '[') then begin
      nLen := AnsiPos(']', Prm);
      if nLen > 0 then begin
        Result := Copy(Prm, 1, nLen);
        Prm := Trim(Copy(Prm, nLen + 1, Maxint));
        if (Prm <> '')and(Prm[1] = ',') then Prm := Trim(Copy(Prm, 2, Maxint));
      end else begin
        Result := Copy(Prm, 1, Maxint);
        Prm := '';
      end;
    end else begin
      nLen := AnsiPos(',', Prm);
      if nLen > 0 then begin
        Result := Copy(Prm, 1, nLen - 1);
        Prm := Trim(Copy(Prm, nLen + 1, Maxint));
      end else begin
        Result := Copy(Prm, 1, Maxint);
        Prm := '';
      end;
    end;
  end;
var
  rSr: Boolean;
  nMode, nFg, nMax: Integer;
  sPrm, sDat, sFlg, sDot: AnsiString;
  lpDashMax, lpRoundLen: PResbuf;
  dTotle, dLen: Double;
begin
  sPrm := Trim(LinParam.Params);
  Result := (LinParam.Name <> '')and(sPrm <> '');
  if NOT Result then exit;
  Item.Clear;
  Item.Add(0, 'LTYPE');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbLinetypeTableRecord');
  Item.Add(2, LinParam.Name);
  Item.Add(70, FTableFlags);
  Item.Add(3, Trim(LinParam.Desc));
  nMode := 0;
  nMax := 0;
  dTotle := 0;
  lpDashMax := nil;
  lpRoundLen := nil;
  rSr := False;
  while (rSr)or(sPrm <> '') do begin
    if (nMode = 0) then begin
      sDat := GetPrToken(sPrm);
      if sDat = '' then break;
      Item.Add(72, Byte(sDat[1]));
      lpDashMax := Item.Add(73, 0);   // DashMax
      lpRoundLen := Item.Add(40, 0);  // RoundLen
      nMode := 1;
    end else begin
      if NOT rSr then sDat := GetPrToken(sPrm);
      rSr := False;
      if sDat = '' then break;
      dLen := StrToFloatDef(sDat, 0);
      dTotle := dTotle + Abs(dLen);
      Item.Add(49, dLen);
      Inc(nMax);
      sDat := GetPrToken(sPrm);
      if (sDat = '')or(sDat[1] <> '[') then begin
        Item.Add(74, 0);
        rSr := True;
      end else begin
        sDat := Trim(Copy(sDat, 2, Length(sDat) - 2));
        nFg := 0;
        sDot := '';
        while (sDat <> '') do begin
          sFlg := GetPrToken(sDat);
          case nFg of
          0: if (sFlg <> '') then begin
              if sFlg[1] = '"' then begin
                Item.Add(74, 2);
                Item.Add(75, 0);
                Item.Add(340, StyleObj);
                sDot := Copy(sFlg, 2, Length(sFlg) - 2);
              end else begin
                Item.Add(74, 4);
                Item.Add(75, ShCode);
                Item.Add(340, StyleObj);
              end;
             end;
          1: ; // ltypeshp.shx
          else
            begin
              sFlg := AnsiLowerCase(Trim(sFlg));
              if sFlg <> '' then begin
                if sFlg[1] = 's' then
                  Item.Add(46, StrToFloatDef(Copy(sFlg,3, Maxint), 0))
                else if sFlg[1] = 'r' then
                  Item.Add(50, StrToFloatDef(Copy(sFlg,3, Maxint), 0))
                else if sFlg[1] = 'x' then
                  Item.Add(44, StrToFloatDef(Copy(sFlg,3, Maxint), 0))
                else if sFlg[1] = 'y' then
                  Item.Add(45, StrToFloatDef(Copy(sFlg,3, Maxint), 0));
              end;
            end;
          end;
          Inc(nFg);
        end;
        if sDot <> '' then Item.Add(9, sDot);
      end;
    end;
  end;
  if (lpDashMax <> nil)and(nMax > 0) then lpDashMax^.resval.rint := nMax;
  if (lpRoundLen <> nil)and(dTotle > 0) then lpRoundLen^.resval.rreal := dTotle;
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddSTYLE(TextName, FontName, DFontName: AnsiString; Height: Double = 0; Shape: Boolean = False; VertWrt: Boolean = False; WidthFactor: Double = 1; Angle: Double = 0; Mirror: TDxfTextMirror = []): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'STYLE');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbTextStyleTableRecord');
  Item.Add(2, TextName);
  nFg := FTableFlags;
  if Shape then nFg := nFg or 1;
  if VertWrt then nFg := nFg or 4;
  Item.Add(70, nFg);
  Item.Add(40, Height);
  Item.Add(41, WidthFactor);
  Item.Add(50, Angle);
  if tmMirrorInX in Mirror then nFg := 2 else nFg := 0;
  if tmMirrorInY in Mirror then nFg := nFg + 4;
  Item.Add(71, nFg);
  Item.Add(3, FontName);
  Item.Add(4, DFontName);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddUCS(UcsName: AnsiString; BasePos, directX, directY: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'UCS');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbUCSTableRecord');
  Item.Add(2, UcsName);
  Item.Add(70, FTableFlags);
  Item.Add(10, BasePos);
  Item.Add(11, directX);
  Item.Add(12, directY);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddVIEW(ViewName: AnsiString; PaperSpace: Boolean = False): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'VIEW');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbViewTableRecord');
  Item.Add(2, ViewName);
  nFg := FTableFlags;
  if PaperSpace then nFg := nFg or 1;
  Item.Add(70, nFg);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

function TDArxTableMake.AddVPORT(VportName: AnsiString; lbCorner, rtCorner: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'VPORT');
  Item.Add(100, 'AcDbSymbolTableRecord');
  Item.Add(100, 'AcDbViewportTableRecord');
  Item.Add(2, VportName);
  Item.Add(70, FTableFlags);
  Item.Add(10, lbCorner);
  Item.Add(11, rtCorner);
  Result := (Item.Count > 0)and(NOT Item.Error);
end;

{ TDArxEntMake }

constructor TDArxEntMake.Create;
begin
  inherited Create;
  FVertexItems := nil;

  FTextStyle := '';
  FTextWidthFactor := 1.0;
  FTextOblique := 0.0;
  FTextJustify := tjLeft;
  FTextMirror := [];
  FAttStyle := '';
  FAttWidthFactor := 1.0;
  FAttOblique := 0.0;
  FAttJustify := tjLeft;
  FAttMirror := [];
  FDimStyle := '';
  FLeaderLeaderFlag := True;
  FLeaderLeaderPathType := lptStraight;
  FLeaderHooklineWayFlag := lhwReverse;
  FLeaderHooklineFlag := False;
  FLeaderTad := ltCenter;
  FMTextAlignment := maLeft;
  FMTextRowSpaceStyle := mrMinim;
  FMTextRowSpaceMeasure := 1.0;
  FImageLight := 50;
  FImageContrast := 50;
  FImageScumble := 0;

  FColCount := 1;
  FColWidth := 0.0;
  FRowCount := 1;
  FRowWidth := 0.0;
end;

destructor TDArxEntMake.Destroy;
begin
  ResetVertexItem(False);
  inherited Destroy;
end;

procedure TDArxEntMake.ResetVertexItem(ReCreate: Boolean);
begin
  if ReCreate then begin
    if FVertexItems <> nil then FVertexItems.Clear else FVertexItems := TDVertexItems.Create;
  end else begin
    if FVertexItems <> nil then FVertexItems.Free;
    FVertexItems := nil;
  end;
end;

// 改行で区切られた文字列をグループ１で分ける
procedure TDArxEntMake.SetStrContinue(const StrData: AnsiString);
var
  nLen: Integer;
  sStr, sLine: AnsiString;
begin
  sStr := AdjustLineBreaks(StrData);
  repeat
    nLen := AnsiPos(#13#10, sStr);
    if nLen > 0 then begin
      sLine := Copy(sStr, 1, nLen - 1);
      sStr := Copy(sStr, nLen + 2, Maxint);
      if sLine <> '' then SetStr255Data(sLine);
    end else begin
      if sStr <> '' then SetStr255Data(sStr);
    end;
  until (0 >= nLen);
end;

// 255文字以上ならグループ３で分ける
procedure TDArxEntMake.SetStr255Data(const StrData: AnsiString);
var
  nCount, nLen: Integer;
  sSize: AnsiString;
begin
  nCount := 1;
  nLen := Length(StrData);
  sSize := StrData;
  While (nLen > 0) do begin
    if nLen > 255 then begin
      if (Item.Add(nCount, Copy(sSize, 1, 255)) = nil) then break;
      sSize := Copy(sSize, 256, Maxint);
      Dec(nLen, 255);
    end else begin
      Item.Add(nCount, sSize);
      nLen := 0;
    end;
    nCount := 3;
  end;
end;

procedure TDArxEntMake.SetMTextData(const StrData: AnsiString);
var
  nLen: Integer;
  sSize: AnsiString;
begin
  nLen := Length(StrData);
  if 250 >= nLen then begin
    Item.Add(1, StrData);
  end else begin
    sSize := StrData;
    While (nLen > 0) do begin
      if nLen > 250 then begin
        if (Item.Add(3, Copy(sSize, 1, 250)) = nil) then break;
        sSize := Copy(sSize, 251, Maxint);
        Dec(nLen, 250);
      end else begin
        Item.Add(1, sSize);
        nLen := 0;
      end;
    end;
  end;
end;

procedure TDArxEntMake.SetAttDefOptions(AttRotation: Double; alignmentPoint: Tads_point; Prompt, Tag: AnsiString; AttFlag: Smallint);
var
  nX, nY: Smallint;
begin
  Item.Add(100, 'AcDbAttributeDefinition');
  if AttRotation <> 0 then Item.Add(50, AttRotation);
  if FAttWidthFactor <> 1.0 then Item.Add(41, FAttWidthFactor);
  if FAttOblique <> 1.0 then Item.Add(51, FAttOblique);
  if FAttStyle <> '' then Item.Add(7, FAttStyle);
  if tmMirrorInX in FAttMirror then nX := 2 else nX := 0;
  if tmMirrorInY in FAttMirror then nX := nX + 4;
  if nX > 0 then Item.Add(71, nX);
  nX := 0;
  nY := 0;
  case FAttJustify of
  tjCenter: nX := 1;
   tjRight: nX := 2;
   tjAlign: nX := 3;
  tjMiddle: nX := 4;
     tjFit: nX := 5;
      tjTL: begin nX := 0; nY := 3; end;
      tjTC: begin nX := 1; nY := 3; end;
      tjTR: begin nX := 2; nY := 3; end;
      tjML: begin nX := 0; nY := 2; end;
      tjMC: begin nX := 1; nY := 2; end;
      tjMR: begin nX := 2; nY := 2; end;
      tjBL: begin nX := 0; nY := 1; end;
      tjBC: begin nX := 1; nY := 1; end;
      tjBR: begin nX := 2; nY := 1; end;
  end;
  if nX > 0 then Item.Add(72, nX);
  if (nX > 0)or(nY > 0) then Item.Add(11, alignmentPoint);
  Item.Add(100, 'AcDbAttributeDefinition');
  Item.Add(3, Copy(Prompt, 1, 255));
  Item.Add(2, Copy(Tag, 1, 255));
  Item.Add(70, AttFlag);
  if nY > 0 then Item.Add(74, nX);
end;

procedure TDArxEntMake.SetAttRibOptions(AttRotation: Double; alignmentPoint: Tads_point; Tag: AnsiString; AttFlag: Smallint);
var
  nX, nY: Smallint;
begin
  Item.Add(100, 'AcDbAttribute');
  Item.Add(2, Copy(Tag, 1, 255));
  Item.Add(70, AttFlag);
  if AttRotation <> 0 then Item.Add(50, AttRotation);
  if FAttWidthFactor <> 1.0 then Item.Add(41, FAttWidthFactor);
  if FAttOblique <> 1.0 then Item.Add(51, FAttOblique);
  if FAttStyle <> '' then Item.Add(7, FAttStyle);
  if tmMirrorInX in FAttMirror then nX := 2 else nX := 0;
  if tmMirrorInY in FAttMirror then nX := nX + 4;
  if nX > 0 then Item.Add(71, nX);
  nX := 0;
  nY := 0;
  case FAttJustify of
  tjCenter: nX := 1;
   tjRight: nX := 2;
   tjAlign: nX := 3;
  tjMiddle: nX := 4;
     tjFit: nX := 5;
      tjTL: begin nX := 0; nY := 3; end;
      tjTC: begin nX := 1; nY := 3; end;
      tjTR: begin nX := 2; nY := 3; end;
      tjML: begin nX := 0; nY := 2; end;
      tjMC: begin nX := 1; nY := 2; end;
      tjMR: begin nX := 2; nY := 2; end;
      tjBL: begin nX := 0; nY := 1; end;
      tjBC: begin nX := 1; nY := 1; end;
      tjBR: begin nX := 2; nY := 1; end;
  end;
  if nX > 0 then Item.Add(72, nX);
  if (nX > 0)or(nY > 0) then Item.Add(11, alignmentPoint);
  if nY > 0 then Item.Add(74, nX);
end;

procedure TDArxEntMake.SetLeaderOptions(LeaderMake: Smallint);
begin
  if FLeaderLeaderFlag then Item.Add(71, 1) else Item.Add(71, 0);
  case FLeaderLeaderPathType of
  lptStraight : Item.Add(72, 0);
  lptSpline : Item.Add(72, 1);
  end;
  Item.Add(73, LeaderMake);
  case FLeaderHooklineWayFlag of
  lhwReverse: Item.Add(74, 0);
  lhwSame: Item.Add(74, 1);
  end;
  if FLeaderHooklineFlag then Item.Add(75, 1) else Item.Add(75, 0);
end;

function TDArxEntMake.SetLeaderAddOptions(LeaderHandle: Tads_name): Boolean;
var
  LeaderEnt: TDEntNameItem;
  tad: Smallint;
begin
  LeaderEnt := TDEntNameItem.Create;
  LeaderEnt.copy(LeaderHandle);
  LeaderEnt.EntGetResbuf;
  LeaderEnt.Item.Add(340, LastName);
  LeaderEnt.Item.Add(1001, 'ACAD');
  LeaderEnt.Item.Add(1000, 'DSTYLE');
  LeaderEnt.Item.Add(1002, '{');
  LeaderEnt.Item.Add(1070, 77);
  Case FLeaderTad of
  ltCenter: tad := 0;
    ltOver: tad := 1;
     ltOut: tad := 2;
     ltJis: tad := 3;
  else
    tad := 0;
  end;
  LeaderEnt.Item.Add(1070, tad);
  LeaderEnt.Item.Add(1002, '}');
  Result := (LeaderEnt.Item.EntMod = RTNORM);
  LeaderEnt.Free;
  if NOT Result then exit;
(*
  LeaderEnt := TDEntNameItem.Create;
  LeaderEnt.copy(LastHandle);
  LeaderEnt.EntGetResbuf;

  AdsDebug.darx_DebugResBuf('', LeaderEnt.Item.Resbuf);

  LeaderEnt.Item.Insert(2, 102, '{ACAD_REACTORS');
  LeaderEnt.Item.Insert(3, 330, LeaderHandle);
  LeaderEnt.Item.Insert(4, 102, '}');
  Result := (LeaderEnt.Item.EntMod = RTNORM);
  LeaderEnt.Free;
*)
end;

procedure TDArxEntMake.SetTextOptions(TextRotation: Double; alignmentPoint: Tads_point);
var
  nX, nY: Smallint;
begin
  if TextRotation <> 0 then Item.Add(50, TextRotation);
  if FTextWidthFactor <> 1.0 then Item.Add(41, FTextWidthFactor);
  if FTextOblique <> 1.0 then Item.Add(51, FTextOblique);
  if FTextStyle <> '' then Item.Add(7, FTextStyle);
  if tmMirrorInX in FTextMirror then nX := 2 else nX := 0;
  if tmMirrorInY in FTextMirror then nX := nX + 4;
  if nX > 0 then Item.Add(71, nX);
  nX := 0;
  nY := 0;
  case FTextJustify of
  tjCenter: nX := 1;
   tjRight: nX := 2;
   tjAlign: nX := 3;
  tjMiddle: nX := 4;
     tjFit: nX := 5;
      tjTL: begin nX := 0; nY := 3; end;
      tjTC: begin nX := 1; nY := 3; end;
      tjTR: begin nX := 2; nY := 3; end;
      tjML: begin nX := 0; nY := 2; end;
      tjMC: begin nX := 1; nY := 2; end;
      tjMR: begin nX := 2; nY := 2; end;
      tjBL: begin nX := 0; nY := 1; end;
      tjBC: begin nX := 1; nY := 1; end;
      tjBR: begin nX := 2; nY := 1; end;
  end;
  if nX > 0 then Item.Add(72, nX);
  if (nX > 0)or(nY > 0) then Item.Add(11, alignmentPoint);
  Item.Add(100, 'AcDbText');
  if nY > 0 then Item.Add(73, nX);
end;

procedure TDArxEntMake.SetMTextOptions(Str: AnsiString; alignmentPoint: Tads_point);
var
  nX, nY, Style: Smallint;
  Measure: Double;
begin
  case FTextJustify of
    tjLeft: nX := 1;
  tjCenter: nX := 2;
   tjRight: nX := 3;
   tjAlign: nX := 1;
  tjMiddle: nX := 5;
     tjFit: nX := 1;
      tjTL: nX := 1;
      tjTC: nX := 2;
      tjTR: nX := 3;
      tjML: nX := 4;
      tjMC: nX := 5;
      tjMR: nX := 6;
      tjBL: nX := 7;
      tjBC: nX := 8;
      tjBR: nX := 9;
  else
    nX := 1;
  end;
  case FMTextAlignment of
    maLeft: nY := 1;
   maRight: nY := 2;
     maTop: nY := 3;
  maBottom: nY := 4;
  else
    nY := 1;
  end;
  case FMTextRowSpaceStyle of
  mrMinim: Style := 1;
    mrFix: Style := 2;
  else
    Style := 1;
  end;
  if (0.25 <= FMTextRowSpaceMeasure)and(FMTextRowSpaceMeasure <= 4.0) then begin
    Measure := FMTextRowSpaceMeasure;
  end else begin
    Measure := 1.0;
    FMTextRowSpaceMeasure := 1.0;
  end;
  Item.Add(71, nX);
  Item.Add(72, nY);
  SetMTextData(Str);
  if FTextStyle <> '' then Item.Add(7, FTextStyle);
  Item.Add(73, Style);
  Item.Add(44, Measure);
  if (NOT acdbPointNil(alignmentPoint)) then Item.Add(11, alignmentPoint);
end;

function TDArxEntMake.SetlbInsert(LastHandle: Tads_Name; BlockName: AnsiString; position, Scale: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'INSERT');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastHandle);
  Item.Add(102, '}');
  Item.Add(100, 'AcDbBlockReference');
  SetCommonProperty;
  if SeqFlags then Item.Add(66, 1);
  Item.Add(2, BlockName);
  Item.Add(10, position);
  if Scale[0] <> 1.0 then Item.Add(41, Scale[0]);
  if Scale[1] <> 1.0 then Item.Add(42, Scale[1]);
  if Scale[2] <> 1.0 then Item.Add(43, Scale[2]);
  if Angle <> 0 then Item.Add(50, Angle);
  if FColCount > 1 then Item.Add(70, FColCount);
  if FRowCount > 1 then Item.Add(71, FRowCount);
  if (FColCount > 1)and(FColWidth <> 0) then Item.Add(44, FColWidth);
  if (FRowCount > 1)and(FRowWidth <> 0) then Item.Add(45, FRowWidth);
  Result := StartEntMakeX;
end;

function TDArxEntMake.MakeBlock(BlockName: AnsiString; Flags: Smallint = 0): Boolean;
begin
  Result := MakeBlock(BlockName, ads_point(0, 0, 0), Flags);
end;

function TDArxEntMake.MakeBlock(BlockName: AnsiString; InsertPt: Tads_point; Flags: Smallint = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'BLOCK');
  Item.Add(100, 'AcDbEntity');
  if (Layer <> '') then Item.Add(8, Layer);
  Item.Add(100, 'AcDbBlockBegin');
  Item.Add(2, BlockName);
  Item.Add(70, Flags);
  Item.Add(10, InsertPt);
  Result := StartEntMakeX;
end;

function TDArxEntMake.EndBlock: AnsiString;
begin
  Item.Clear;
  Item.Add(0, 'ENDBLK');
  Result := StartEntMakeXKeyword;
end;

procedure TDArxEntMake.MakeGroup;
begin
  EntBuffer := True;
end;

function TDArxEntMake.EndGroup(GroupName, Explain: AnsiString; NonName: Boolean = False; NonSelect: Boolean = False): Boolean;
var
  nMax, ni: Integer;
  objName: Tads_name;
  grpDec, nxRb: Presbuf;
begin
  Result := False;
  nMax := EntCount - 1;
  if (nMax >= 0)and(extern_acdbNamedObjDict(@objName) = RTNORM) then begin
    grpDec := extern_acdbDictSearch(@objName, 'ACAD_GROUP', 0);
    nxRb := grpDec;
    while (nxRb <> nil)and(nxRb^.restype <> 5) do nxRb := nxRb^.rbnext;
    if (nxRb <> nil)and(nxRb^.restype = 5) then begin
      Item.Clear;
      Item.Add(0, 'GROUP');
      Item.Add(102, '{ACAD_REACTORS');
      Item.Add(330, nxRb^.resval.rLName);
      Item.Add(102, '}');
      Item.Add(100, 'AcDbGroup');
      Item.Add(300, Explain);
      if NonName then Item.Add(70, 1) else Item.Add(70, 0);
      if NonSelect then Item.Add(71, 0) else Item.Add(71, 1);
      for ni := 0 to nMax do Item.Add(340, EntList[ni]);
      EntBuffer := False;
      Result := StartEntMakeX;
      if Result then Result := (extern_acdbDictAdd(@objName, PChar(GroupName), @LastName) = RTNORM);
    end;
    if grpDec <> nil then extern_acutRelRb(grpDec);
  end;
  EntBuffer := False;
end;

procedure TDArxEntMake.MakeVertex;
begin
  ResetVertexItem(True);
end;

procedure TDArxEntMake.FreeVertex;
begin
  ResetVertexItem(False);
end;

function TDArxEntMake.AddVertex(Point: Tads_point; Bulge: Double = 0; StartWidth: Double = 0; EndWidth: Double = 0): Integer;
begin
  if FVertexItems = nil then FVertexItems := TDVertexItems.Create;
  Result := FVertexItems.Add(Point, Bulge, StartWidth, EndWidth);
end;

function TDArxEntMake.E3DFace(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point; HideFlags: Smallint = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, '3DFACE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFace');
  Item.Add(10, Vertex1);
  Item.Add(11, Vertex2);
  Item.Add(12, Vertex3);
  Item.Add(13, Vertex4);
  if (HideFlags <> 0) then Item.Add(70, HideFlags);
  Result := StartEntMakeX;
end;

function TDArxEntMake.E3DSolid(const ACISData: AnsiString): Boolean;
begin
  Item.Clear;
  Item.Add(0, '3DSOLID');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbModelerGeometry');
  Item.Add(70, ModelerVersion);
  SetStrContinue(ACISData);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Arc(Center: Tads_point; Radius, StartAngle, EndAngle: Double): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'ARC');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbCircle');
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, Center);
  Item.Add(40, Radius);
  Item.Add(100, 'AcDbArc');
  Item.Add(50, StartAngle);
  Item.Add(51, EndAngle);
  Result := StartEntMakeX;
end;

function TDArxEntMake.AttDef(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0; Prompt: AnsiString = ''; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean;
begin
  Result := AttDef(position, Str, position, Height, Rotation, Prompt, Tag, AttFlag);
end;

function TDArxEntMake.AttDef(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0; Prompt: AnsiString = ''; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'ATTDEF');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbText');
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, position);
  Item.Add(40, Height);
  Item.Add(1, Copy(Str, 1, 255));
  SetAttDefOptions(Rotation, alignmentPoint, Prompt, Tag, AttFlag);
  Result := StartEntMakeX;
end;

function TDArxEntMake.AttRib(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean;
begin
  Result := AttRib(position, Str, position, Height, Rotation, Tag, AttFlag);
end;

function TDArxEntMake.AttRib(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0; Tag: AnsiString = ''; AttFlag: Smallint = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'ATTRIB');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbText');
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, position);
  Item.Add(40, Height);
  Item.Add(1, Copy(Str, 1, 255));
  SetAttRibOptions(Rotation, alignmentPoint, Tag, AttFlag);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Body(ACISData: AnsiString): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'BODY');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbModelerGeometry');
  Item.Add(70, ModelerVersion);
  SetStrContinue(ACISData);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Circle(Center: Tads_point; Radius: Double): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'CIRCLE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbCircle');
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, Center);
  Item.Add(40, Radius);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Ellipse(Center, unitNormal, majorAxis: Tads_point; radiusRatio, startAngle, endAngle: Double): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'ELLIPSE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbEllipse');
  Item.Add(10, Center);
  Item.Add(11, majorAxis);
  Item.Add(210, unitNormal);
  Item.Add(40, radiusRatio);
  Item.Add(41, startAngle);
  Item.Add(42, endAngle);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Ellipse(Center, unitNormal, majorAxis: Tads_point; radiusRatio: Double): Boolean;
begin
  Result := Ellipse(Center, unitNormal, majorAxis, radiusRatio, 0.0, 6.28318530717958647692);
end;

function TDArxEntMake.Ellipse(Center, majorAxis: Tads_point; radiusRatio, startAngle, endAngle: Double): Boolean;
begin
  Result := Ellipse(Center, ads_point(0.0, 0.0, 1.0), majorAxis, radiusRatio, startAngle, endAngle);
end;

function TDArxEntMake.Ellipse(Center, majorAxis: Tads_point; radiusRatio: Double): Boolean;
begin
  Result := Ellipse(Center, ads_point(0.0, 0.0, 1.0), majorAxis, radiusRatio, 0.0, 6.28318530717958647692);
end;

function TDArxEntMake.ImageAttach(ImageName, FileName: AnsiString; Vertex: Tads_point; Scale: Double = 1; Angle: Double = 0): Boolean;
  function orgDegToRad(Degrees: Double): Double;
  begin
    Result := Degrees * Pi / 180;
  end;
  function LoadAcismuiArx: Boolean;
  const
    ACISMUIARX = 'acismui.arx';
  begin
    Result := darxIsLoadedArx(ACISMUIARX);
    if NOT Result then Result := (extern_acedArxLoad(ACISMUIARX) = RTNORM);
  end;
  function GetRelativePath(const imgFile: AnsiString): AnsiString;
  var
    dwgPath: AnsiString;
  begin
    acedGetVar('DWGPREFIX', dwgPath);
    if dwgPath <> '' then Result := ExtractRelativePath(dwgPath, imgFile) else Result := imgFile;
  end;
var
  dictEname, imgdictEname, imgdefReactEname, imgdefEname, imgEntEname: Tads_name;
  imgdictList, lpNextList: Presbuf;
  relativeFileName, imgname: AnsiString;
  nFind: Integer;
  bFlag: Boolean;
  imgWidth, imgHeight, pi90: Double;
  imgPix, imgAcad, UVector, VVector, imgSize, ClipVer: Tads_point;
  EntListItem: TDEntNameItem;
begin
  Result := False;
  relativeFileName := GetRelativePath(FileName);
  // 仮イメージ名取得
  if ImageName <> '' then
    imgname := ImageName
  else
    imgname := AnsiUpperCase(ChangeFileExt(ExtractFileName(FileName), ''));
  acdbNamedObjDict(dictEname);
  bFlag := False;
  imgdictList := acdbDictSearch(dictEname, 'ACAD_IMAGE_DICT', 0);
  if imgdictList = nil then begin
    LoadAcismuiArx;
    Item.Add(0, 'DICTIONARY');
    Item.Add(102, '{ACAD_REACTORS');
    Item.Add(102, '}');
    Item.Add(330, dictEname);
    Item.Add(100, 'AcDbDictionary');
    Item.Add(280, 0);
    if NOT StartEntMakeX then exit;
    imgdictEname := LastName;

    EntListItem := TDEntNameItem.Create;
    EntListItem.copy(dictEname);
    EntListItem.EntGetResbuf;
    EntListItem.Item.Add(3, 'ACAD_IMAGE_DICT');
    EntListItem.Item.Add(350, imgdictEname);
    if EntListItem.Item.EntMod <> RTNORM then begin
      EntListItem.Free;
      exit;
    end;
    EntListItem.Free;
  end else begin
    imgdictEname := imgdictList^.resVal.rlName;
    lpNextList := imgdictList;
    repeat
      if (lpNextList^.restype = 3)and(AnsiCompareText(imgname, extern_darxPString(lpNextList^.resVal.rstring)) = 0) then begin
        bFlag := (lpNextList^.rbnext <> nil)and(lpNextList^.rbnext^.restype = 350);
        if bFlag then imgdefEname := lpNextList^.rbnext^.resVal.rlName;
        break;
      end;
      lpNextList := lpNextList^.rbnext;
    until (lpNextList = nil);
  end;
  Item.Clear;
  Item.Add(0, 'IMAGEDEF_REACTOR');
  Item.Add(100, 'AcDbRasterImageDefReactor');
  Item.Add(90, 2);
  if NOT StartEntMakeX then exit;
  imgdefReactEname := LastName;

  if NOT bFlag then begin
    Item.Clear;
    Item.Add(0, 'IMAGEDEF');
    Item.Add(102, '{ACAD_REACTORS');
    Item.Add(330, imgdefReactEname);
    Item.Add(102, '}');
    Item.Add(100, 'AcDbRasterImageDef');
    Item.Add(90, 0);
    Item.Add(1, relativeFileName);
    Item.Add(280, 1);
    Item.Add(281, 0);
    if NOT StartEntMakeX then exit;
    imgdefEname := LastName;
    acdbdictadd(imgdictEname, imgname, imgdefEname);
  end;

  EntListItem := TDEntNameItem.Create;
  EntListItem.copy(imgdefEname);
  EntListItem.EntGetResbuf;
  imgPix := EntListItem.Item.resVal[EntListItem.Item.FindType(10)].rpoint;
  imgAcad := EntListItem.Item.resVal[EntListItem.Item.FindType(11)].rpoint;
  imgWidth := imgAcad[0] * imgPix[0] * Scale;
  imgHeight := imgAcad[1] * imgPix[1] * Scale;
  pi90 := pi / 2;
  if bFlag then begin
    EntListItem.Item.Insert(EntListItem.Item.FindType(330) + 1, 330, imgdefReactEname);
    EntListItem.Item.EntMod;
  end;
  EntListItem.Free;

// image作成
  Item.Clear;
  Item.Add(0, 'IMAGE');
  SetCommonPropEntity;
  Item.Add(67, 0);
  Item.Add(100, 'AcDbRasterImage');
  Item.Add(90, 0);
  Item.Add(10, Vertex);
  UVector[0] := (cos(orgDegToRad(Angle)) * imgWidth) / imgPix[0];
  UVector[1] := (sin(orgDegToRad(Angle)) * imgWidth) / imgPix[0];
  UVector[2] := 0;
  Item.Add(11, UVector);
  VVector[0] := (cos(orgDegToRad(Angle) + pi90) * imgHeight) / imgPix[1];
  VVector[1] := (sin(orgDegToRad(Angle) + pi90) * imgHeight) / imgPix[1];
  VVector[2] := 0;
  Item.Add(12, VVector);
  Item.Add(13, imgPix);
  Item.Add(340, imgdefEname);
  Item.Add(70, 7);
  Item.Add(280, 0);
  Item.Add(281, FImageLight);
  Item.Add(282, FImageContrast);
  Item.Add(283, FImageScumble);
  Item.Add(360, imgdefReactEname);
  Item.Add(71, 1);
  Item.Add(91, 2);
  imgSize[0] := -0.5;
  imgSize[1] := -0.5;
  Item.Add(14, imgSize);
  ClipVer[0] := imgPix[0] - 0.5;
  ClipVer[1] := imgPix[1] - 0.5;
  Item.Add(14, ClipVer);
  if NOT StartEntMakeX then exit;

  imgEntEname := LastName;
  EntListItem := TDEntNameItem.Create;
  EntListItem.copy(imgdefReactEName);
  EntListItem.EntGetResbuf;
  nFind := EntListItem.Item.FindType(330);
  EntListItem.Item.SetLName(nFind, imgEntEname);
  nFind := EntListItem.Item.FindType(330, nFind + 1);
  EntListItem.Item.SetLName(nFind, imgEntEname);
  Result := (EntListItem.Item.EntMod = RTNORM);
  EntListItem.Free;
end;

function TDArxEntMake.Insert(BlockName: AnsiString; position: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean;
begin
  Result := Insert(BlockName, position, ads_point(1, 1, 1), Angle, SeqFlags);
end;

function TDArxEntMake.Insert(BlockName: AnsiString; position, Scale: Tads_point; Angle: Double = 0; SeqFlags: Boolean = False): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'INSERT');
  Item.Add(100, 'AcDbBlockReference');
  SetCommonProperty;
  if SeqFlags then Item.Add(66, 1);
  Item.Add(2, BlockName);
  Item.Add(10, position);
  if Scale[0] <> 1.0 then Item.Add(41, Scale[0]);
  if Scale[1] <> 1.0 then Item.Add(42, Scale[1]);
  if Scale[2] <> 1.0 then Item.Add(43, Scale[2]);
  if Angle <> 0 then Item.Add(50, Angle);
  if FColCount > 1 then Item.Add(70, FColCount);
  if FRowCount > 1 then Item.Add(71, FRowCount);
  if (FColCount > 1)and(FColWidth <> 0) then Item.Add(44, FColWidth);
  if (FRowCount > 1)and(FRowWidth <> 0) then Item.Add(45, FRowWidth);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Leader(Vertex1, Vertex2: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(3);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 2);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Leader(Vertex1, Vertex2, Vertex3: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(3);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 3);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Item.Add(10, Vertex3);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Leader(VertexArray: array of Tads_point): Boolean;
var
  MaxArray, VtxNum, ni: Integer;
begin
  Result := False;
  MaxArray := High(VertexArray);
  if MaxArray <= 1 then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(3);
  Item.Add(40, 0);
  Item.Add(41, 0);
  VtxNum := MaxArray + 1;
  Item.Add(76, VtxNum);
  for ni := 0 to MaxArray do begin
    Item.Add(10, VertexArray[ni]);
  end;
  Result := StartEntMakeX;
end;

function TDArxEntMake.LeaderMText(Vertex1, Vertex2: Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean;
var
  LeaderHandle: Tads_name;
  position: Tads_point;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(0);
  Item.Add(40, Height);
  Item.Add(41, Width);
  if Str = '' then Item.Add(76, 2) else Item.Add(76, 3);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// マルチテキスト作成
  Item.Clear;
  Item.Add(0, 'MTEXT');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbMText');
  Item.Add(10, Vertex2);
  Item.Add(40, Height);
  Item.Add(41, Width);
  position[0] := 0;
  position[1] := 0;
  position[2] := 0;
  SetMTextOptions(Str, position);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderMText(Vertex1, Vertex2, Vertex3: Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean;
var
  LeaderHandle: Tads_name;
  position: Tads_point;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(0);
  Item.Add(40, Height);
  Item.Add(41, Width);
  if Str = '' then Item.Add(76, 3) else Item.Add(76, 4);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Item.Add(10, Vertex3);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// マルチテキスト作成
  Item.Clear;
  Item.Add(0, 'MTEXT');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbMText');
  Item.Add(10, Vertex3);
  Item.Add(40, Height);
  Item.Add(41, Width);
  position[0] := 0;
  position[1] := 0;
  position[2] := 0;
  SetMTextOptions(Str, position);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderMText(VertexArray: array of Tads_point; Str: AnsiString; Height: Double = 0; Width: Double = 0): Boolean;
var
  LeaderHandle: Tads_name;
  position: Tads_point;
  VtxNum, ni, MaxArray: Integer;
begin
  Result := False;
  MaxArray := High(VertexArray);
  if MaxArray <= 1 then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(0);
  Item.Add(40, Height);
  Item.Add(41, Width);
  if Str = '' then VtxNum := MaxArray + 1 else VtxNum := MaxArray + 2;
  Item.Add(76, VtxNum);
  for ni := 0 to High(VertexArray) do begin
    Item.Add(10, VertexArray[ni]);
  end;
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// マルチテキスト作成
  Item.Clear;
  Item.Add(0, 'MTEXT');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbMText');
  Item.Add(10, VertexArray[MaxArray]);
  Item.Add(40, Height);
  Item.Add(41, Width);
  position[0] := 0;
  position[1] := 0;
  position[2] := 0;
  SetMTextOptions(Str, position);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderTolerance(Vertex1, Vertex2: Tads_point; Str: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(1);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 2);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// 幾何公差作成
  Item.Clear;
  Item.Add(0, 'TOLERANCE');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFcf');
  Item.Add(3, 'STANDARD');
  Item.Add(10, Vertex2);
  Item.Add(1, Str);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderTolerance(Vertex1, Vertex2, Vertex3: Tads_point; Str: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
begin
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(1);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 3);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Item.Add(10, Vertex3);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// 幾何公差作成
  Item.Clear;
  Item.Add(0, 'TOLERANCE');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFcf');
  Item.Add(3, 'STANDARD');
  Item.Add(10, Vertex3);
  Item.Add(1, Str);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderTolerance(VertexArray: array of Tads_point; Str: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
  VtxNum, ni, MaxArray: Integer;
begin
  Result := False;
  MaxArray := High(VertexArray);
  if MaxArray <= 1 then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(1);
  Item.Add(40, 0);
  Item.Add(41, 0);
  VtxNum := MaxArray + 1;
  Item.Add(76, VtxNum);
  for ni := 0 to MaxArray do begin
    Item.Add(10, VertexArray[ni]);
  end;
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// 幾何公差作成
  Item.Clear;
  Item.Add(0, 'TOLERANCE');
  Item.Add(102, '{ACAD_REACTORS');
  Item.Add(330, LastName);
  Item.Add(102, '}');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFcf');
  Item.Add(3, 'STANDARD');
  Item.Add(10, VertexArray[MaxArray]);
  Item.Add(1, Str);
  Result := StartEntMakeX;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderBlock(Vertex1, Vertex2: Tads_point; BlockName: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
begin
  Result := False;
  if BlockName = '' then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(2);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 2);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// ブロック挿入
// DXFに余分なSEQENDが挿入される
  Result := SetlbInsert(LastName, BlockName, Vertex2, ads_point(1, 1, 1), 0, True);
  Seqend;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderBlock(Vertex1, Vertex2, Vertex3: Tads_point; BlockName: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
begin
  Result := False;
  if BlockName = '' then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(2);
  Item.Add(40, 0);
  Item.Add(41, 0);
  Item.Add(76, 3);
  Item.Add(10, Vertex1);
  Item.Add(10, Vertex2);
  Item.Add(10, Vertex3);
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// ブロック挿入
  Result := SetlbInsert(LastName, BlockName, Vertex3, ads_point(1, 1, 1), 0, True);
  Seqend;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.LeaderBlock(VertexArray: array of Tads_point; BlockName: AnsiString): Boolean;
var
  LeaderHandle: Tads_name;
  VtxNum, ni, MaxArray: Integer;
begin
  Result := False;
  if BlockName = '' then exit;
  MaxArray := High(VertexArray);
  if MaxArray <= 1 then exit;
  Item.Clear;
  Item.Add(0, 'LEADER');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbLeader');
  if FDimStyle <> '' then Item.Add(3, FDimStyle);
  SetLeaderOptions(2);
  Item.Add(40, 0);
  Item.Add(41, 0);
  VtxNum := MaxArray + 1;
  Item.Add(76, VtxNum);
  for ni := 0 to MaxArray do begin
    Item.Add(10, VertexArray[ni]);
  end;
  Result := StartEntMakeX;
  if NOT Result then exit;
  LeaderHandle := LastName;
// ブロック挿入
  Result := SetlbInsert(LastName, BlockName, VertexArray[MaxArray], ads_point(1, 1, 1), 0, True);
  Seqend;
  if NOT Result then exit;
  Result := SetLeaderAddOptions(LeaderHandle);
end;

function TDArxEntMake.Line(startPos, endPos: Tads_point): Boolean;
begin
  Item.Clear;
  //Item.Add(0, 'LINE');
  Item.Add(0, 'LINE');
  Item.Add(100, 'AcDbLine');
  SetCommonProperty;
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, startPos);
  Item.Add(11, endPos);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Line(startPos: Tads_point; nextPos: array of Tads_point): Boolean;
var
  nMax, ni, nj: Integer;
  sPos: Tads_point;
begin
  Result := False;
  sPos := startPos;
  nMax := High(nextPos);
  nj := 0;
  for ni := 0 to nMax do begin
    Result := Line(sPos, nextPos[nj]);
    if NOT Result then break;
    sPos := nextPos[nj];
    Inc(nj);
  end;
end;
{
function TDArxEntMake.MLine(VertexArray: array of Tads_point; Closed: Boolean = False; Adjust: Smallint = 0): Boolean;
var
  nMax, ni, nj: Integer;

begin
  Result := False;
  nMax := High(VertexArray);
  Item.Clear;
  Item.Add(0, 'MLINE');
  Item.Add(100, 'AcDbPolyline');
  SetCommonProp;
  Item.Add(2, 'STANDARD');




end;
}
function TDArxEntMake.Rectang(Corner1, Corner2: Tads_point; Angle: Double = 0; Width: Double = 0; Pattern: Boolean = False): Boolean;
var
  dLen: Double;
  pt: array[0..3]of Tads_point;
begin
  dLen := Abs(extern_acutDistance(@Corner1, @Corner2));
  extern_acutPolar(@Corner1, Angle, dLen, @pt[0]);
  extern_acutPolar(@Corner2, Angle + (PI / 2), dLen, @pt[2]);
  extern_acdbInters(@Corner1, @pt[0], @Corner2, @pt[2], 0, @pt[1]);
  extern_acutPolar(@Corner1, Angle + (PI * 6 / 4), dLen, @pt[0]);
  extern_acutPolar(@Corner2, Angle + PI, dLen, @pt[2]);
  extern_acdbInters(@Corner1, @pt[0], @Corner2, @pt[2], 0, @pt[3]);
  pt[0] := Corner1;
  pt[2] := Corner2;
  Result := LWPolyLine(pt, True, Width, Pattern);
end;

function TDArxEntMake.Polygon(Center: Tads_point; PolyCount: Integer; Radius: Double; Outside: Boolean = False; Angle: Double = 0; Width: Double = 0; Pattern: Boolean = False): Boolean;
var
  dLen, dAng: Double;
  pt1, pt2, pt3, pt4: Tads_point;
  nMax, ni: Integer;
begin
  Result := False;
  if (3 > PolyCount)or(PolyCount > 1024) then exit;
  if Outside then dLen := Radius else begin
    dAng := PI / PolyCount;
    extern_acutPolar(@Center, dAng, Radius, @pt1);
    extern_acutPolar(@pt1, dAng - (PI / 2), Radius, @pt2);
    extern_acutPolar(@Center, 0, Radius, @pt3);
    extern_acdbInters(@Center, @pt3, @pt1, @pt2, 0, @pt4);
    dLen := Abs(extern_acutDistance(@Center, @pt4));
  end;
  if NOT MakeLWPolyline(PolyCount, Width, True, Pattern) then exit;
  dAng := PI * 2 / PolyCount;
  nMax := PolyCount - 1;
  for ni := 0 to nMax do begin
    extern_acutPolar(@Center, dAng * ni + Angle, dLen, @pt1);
    Item.Add(10, pt1);
  end;
  Result := StartEntMakeX;
end;

function TDArxEntMake.MakeLWPolyline(VertexCount: Integer; DefWidth: Double; Closed: Boolean; Pattern: Boolean): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'LWPOLYLINE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbPolyline');
  Item.Add(90, VertexCount);
  if Closed then nFg := 1 else nFg := 0;
  if Pattern then nFg := nFg + 128;
  Item.Add(70, nFg);
  if (DefWidth <> 0) then Item.Add(43, DefWidth);
  if (Altitude <> 0) then Item.Add(38, Altitude);
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Result := (NOT Item.Error);
end;

function TDArxEntMake.Make2DPolyline(Closed: Boolean; Pattern: Boolean; Options: Smallint): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'POLYLINE');
  Item.Add(100, 'AcDb2dPolyline');
  SetCommonProperty;
  Item.Add(66, 1);
  if (Altitude <> 0) then Item.Add(10, ads_point(0, 0, Altitude));
  if (Thickness <> 0) then Item.Add(39, Thickness);
  if Closed then nFg := 1 else nFg := 0;
  if Pattern then nFg := nFg + 128;
  nFg := (Options and $00FF) and nFG;
  Item.Add(70, nFg);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Make3DPolyline(Closed: Boolean; Pattern: Boolean; Options: Smallint): Boolean;
var
  nFg: Smallint;
begin
  Item.Clear;
  Item.Add(0, 'POLYLINE');
  Item.Add(100, 'AcDb3dPolyline');
  SetCommonProperty;
  Item.Add(66, 1);
  if (Altitude <> 0) then Item.Add(10, ads_point(0, 0, Altitude));
  if (Thickness <> 0) then Item.Add(39, Thickness);
  nFg := 8;
  if Closed then nFg := nFG + 1;
  if Pattern then nFg := nFg + 128;
  nFg := (Options and $00FF) and nFG;
  Item.Add(70, nFg);
  Result := StartEntMakeX;
end;

function TDArxEntMake.AddResVertex(Poly3D: Boolean): Boolean;
var
  nMax, ni, nVerFlag: Integer;
  Vertex: Tads_vertex;
begin
  Result := False;
  if (FVertexItems = nil)or(2 > FVertexItems.Count) then exit;
  nMax := FVertexItems.Count - 1;
  for ni := 0 to nMax do begin
    Vertex := FVertexItems.Vertex[ni];
    Item.Clear;
    Item.Add(0, 'VERTEX');
    Item.Add(100, 'AcDbVertex');
    SetCommonProperty;
    if Poly3D then Item.Add(100, 'AcDb3dPolylineVertex') else Item.Add(100, 'AcDb2dVertex');
    Item.Add(10, Vertex.Point);
    if Vertex.StartWidth <> 0 then Item.Add(40, Vertex.StartWidth);
    if Vertex.EndWidth <> 0 then Item.Add(41, Vertex.EndWidth);
    if Vertex.Bulge <> 0 then Item.Add(42, Vertex.Bulge);
    if Poly3D then begin
      nVerFlag := Vertex.Flags + 32;
      Item.Add(70, nVerFlag);
    end else begin
      if Vertex.Flags <> 0 then Item.Add(70, Vertex.Flags);
    end;
    if ((Vertex.Flags and 1) <> 0) then Item.Add(50, Vertex.Curve);
    if ((Vertex.Flags and 128) <> 0) then begin
      Item.Add(71, Vertex.VIndex[0]);
      Item.Add(72, Vertex.VIndex[1]);
      Item.Add(73, Vertex.VIndex[2]);
      Item.Add(73, Vertex.VIndex[3]);
    end;
    Result := StartEntMakeX;
    if NOT Result then break;
  end;
end;

function TDArxEntMake.MText(position: Tads_point; Str: AnsiString; Height: Double = 0; RectWidth: Double = 0): Boolean;
var
  posi: Tads_point;
begin
  posi[0] := 0;
  posi[1] := 0;
  posi[2] := 0;
  Result := MText(position, Str, posi, Height, RectWidth);
end;

function TDArxEntMake.MText(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; RectWidth: Double = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'MTEXT');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbMText');
  Item.Add(10, position);
  Item.Add(40, Height);
  Item.Add(41, RectWidth);
  SetMTextOptions(Str, alignmentPoint);
  Result := StartEntMakeX;
end;


function TDArxEntMake.Point(position: Tads_point; userAngle: Double = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'POINT');
  Item.Add(100, 'AcDbPoint');
  SetCommonProperty;
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, position);
  if (userAngle <> 0) then Item.Add(50, userAngle);
  Result := StartEntMakeX;
end;

function TDArxEntMake.LWPolyLine(Closed: Boolean; Pattern: Boolean = False): Boolean;
var
  nMax, ni: Integer;
  Vertex: Tads_vertex;
begin
  Result := False;
  nMax := FVertexItems.Count - 1;
  if (FVertexItems = nil)or(1 > nMax) then exit;
  if NOT MakeLWPolyline(nMax + 1, 0, Closed, Pattern) then exit;
  for ni := 0 to nMax do begin
    Vertex := FVertexItems.Vertex[ni];
    Item.Add(10, Vertex.Point);
    if Vertex.StartWidth <> 0 then Item.Add(40, Vertex.StartWidth);
    if Vertex.EndWidth <> 0 then Item.Add(41, Vertex.EndWidth);
    if Vertex.Bulge <> 0 then Item.Add(42, Vertex.Bulge);
  end;
  Result := StartEntMakeX;
  AddResVertex(False);
end;

function TDArxEntMake.LWPolyLine(Points: array of Tads_point; Closed: Boolean; Width: Double = 0; Pattern: Boolean = False): Boolean;
var
  nMax, ni: Integer;
begin
  Result := False;
  nMax := High(Points);
  if (1 > nMax) then exit;
  if NOT MakeLWPolyline(nMax, Width, Closed, Pattern) then exit;
  for ni := 0 to nMax do begin
    Item.Add(10, Points[ni]);
  end;
  Result := StartEntMakeX;
end;

function TDArxEntMake.M2DPolyline(Closed: Boolean; Pattern: Boolean = False; Options: Smallint = 0): Boolean;
begin
  Result := False;
  if (FVertexItems = nil)or(2 > FVertexItems.Count) then exit;
  if NOT Make2DPolyline(Closed, Pattern, Options) then exit;
  if NOT AddResVertex(False) then exit;
  Result := Seqend;
end;

function TDArxEntMake.M2DPolyline(Points: array of Tads_point; Closed: Boolean; Width: Double = 0; Pattern: Boolean = False; Options: Smallint = 0): Boolean;
var
  rChk: Boolean;
  nMax, ni: Integer;
begin
  Result := False;
  nMax := High(Points);
  if (1 > nMax) then exit;
  if (NOT Make2DPolyline(Closed, Pattern, Options)) then exit;
  rChk := False;
  for ni := 0 to nMax do begin
    Item.Clear;
    Item.Add(0, 'VERTEX');
    Item.Add(100, 'AcDbVertex');
    SetCommonProperty;
    Item.Add(100, 'AcDb2dVertex');
    Item.Add(10, Points[ni]);
    if Width <> 0 then begin
      Item.Add(40, Width);
      Item.Add(41, Width);
    end;
    rChk := StartEntMakeX;
    if NOT rChk then break;
  end;
  if NOT rChk then exit;
  Result := Seqend;
end;

function TDArxEntMake.M3DPolyLine(Closed: Boolean; Pattern: Boolean = False; Options: Smallint = 0): Boolean;
begin
  Result := False;
  if (FVertexItems = nil)or(2 > FVertexItems.Count) then exit;
  if NOT Make3DPolyline(Closed, Pattern, Options) then exit;
  if NOT AddResVertex(True) then exit;
  Result := Seqend;
end;

function TDArxEntMake.M3DPolyLine(Points: array of Tads_point; Closed: Boolean; Width: Double = 0 ; Pattern: Boolean = False; Options: Smallint = 0): Boolean;
var
  rChk: Boolean;
  nMax, ni: Integer;
begin
  Result := False;
  nMax := High(Points);
  if (1 > nMax) then exit;
  if (NOT Make3DPolyline(Closed, Pattern, Options)) then exit;
  rChk := False;
  for ni := 0 to nMax do begin
    Item.Clear;
    Item.Add(0, 'VERTEX');
    Item.Add(100, 'AcDbVertex');
    SetCommonProperty;
    Item.Add(100, 'AcDb3dPolyLineVertex');
    Item.Add(10, Points[ni]);
    if Width <> 0 then begin
      Item.Add(40, Width);
      Item.Add(41, Width);
    end;
    Item.Add(70, 32);
    rChk := StartEntMakeX;
    if NOT rChk then break;
  end;
  if NOT rChk then exit;
  Result := Seqend;
end;

function TDArxEntMake.Ray(basePoint, unitVector: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'RAY');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbRay');
  Item.Add(10, basePoint);
  Item.Add(11, unitVector);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Region(ACISData: AnsiString): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'REGION');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbModelerGeometry');
  Item.Add(70, ModelerVersion);
  SetStrContinue(ACISData);
  Result := StartEntMakeX;
end;

function TDArxEntMake.SeqEnd: Boolean;
begin
  Result := False;
  Item.Clear;
  Item.Add(0, 'SEQEND');
  SetCommonProperty;
  if NOT StartEntMake then exit;
  Result := SetEntLast;
end;

function TDArxEntMake.Solid(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'SOLID');
  Item.Add(100, 'AcDbTrace');
  SetCommonProperty;
  Item.Add(10, Vertex1);
  Item.Add(11, Vertex2);
  Item.Add(12, Vertex3);
  Item.Add(13, Vertex4);
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Result := StartEntMakeX;
end;
{
function TDArxEntMake.Spline(VertexArray: array of Tads_point; Closed: Boolean);
var
  pt: Tads_point;
  ni, nLoop, MaxVer, spFlag: Integer;

begin
  Result := False;
  MaxVer := High(Vertex);
  if MaxVer < 1 then exit;

  Item.Clear;
  Item.Add(0, 'SPLINE');
  Item.Add(100, 'AcDbSpline');
  SetCommonProp;
  pt[0] := 0;
  pt[1] := 0;
  pt[2] := 1;
  Item.Add(210, pt);
  spFlag := 8;
  if Closed then Inc(spFlag);
  Item.Add(70, spFlag);
  Item.Add(71, 3);
  if Closed then Item.Add(74, MaxVer + 1) else Item.Add(74, MaxVer);
  Item.Add(42, 0.0000001);
  Item.Add(43, 0.0000001);
  Item.Add(44, 0.0000000001);
  if Closed then nLoop := MaxVer - 1 else nLoop := MaxVer;
  for ni := 0 to nLoop do begin
    Item.Add(11, VertexArray[ni]);
  end;


end;
}
function TDArxEntMake.Text(position: Tads_point; Str: AnsiString; Height: Double = 0; Rotation: Double = 0): Boolean;
begin
  Result := Text(position, Str, position, Height, Rotation);
end;

function TDArxEntMake.Text(position: Tads_point; Str: AnsiString; alignmentPoint: Tads_point; Height: Double = 0; Rotation: Double = 0): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'TEXT');
  Item.Add(100, 'AcDbText');
  SetCommonProperty;
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Item.Add(10, position);
  Item.Add(40, Height);
  Item.Add(1, Copy(Str, 1, 255));
  SetTextOptions(Rotation, alignmentPoint);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Tolerance(DimName, Str: AnsiString; Location: Tads_point): Boolean;
begin
  Result := Fcf(DimName, Str, Location);
end;

function TDArxEntMake.Tolerance(DimName, Str: AnsiString; Location, Orientation: Tads_point): Boolean;
begin
  Result := Fcf(DimName, Str, Location, Orientation);
end;

function TDArxEntMake.Fcf(DimName, Str: AnsiString; Location: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'TOLERANCE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFcf');
  Item.Add(3, DimName);
  Item.Add(10, Location);
  Item.Add(1, Str);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Fcf(DimName, Str: AnsiString; Location, Orientation: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'TOLERANCE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbFcf');
  Item.Add(3, DimName);
  Item.Add(10, Location);
  Item.Add(1, Str);
  Item.Add(11, Orientation);
  Result := StartEntMakeX;
end;

function TDArxEntMake.Trace(Vertex1, Vertex2, Vertex3, Vertex4: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'TRACE');
  Item.Add(100, 'AcDbTrace');
  SetCommonProperty;
  Item.Add(10, Vertex1);
  Item.Add(11, Vertex2);
  Item.Add(12, Vertex3);
  Item.Add(13, Vertex4);
  if (Thickness <> 0) then Item.Add(39, Thickness);
  Result := StartEntMakeX;
end;
{
function TDArxEntMake.ViewPort(position: Tads_point; Width, Height: Double): Boolean;
var
  pt: Tads_point;
begin
  Item.Clear;
  Item.Add(0, 'VIEWPORT');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbViewport');
  Item.Add(10, position);
  Item.Add(40, Width);
  Item.Add(41, Height);
Item.Add(68, 2);
//Item.Add(69, 3);
pt[0] := 210.0;
pt[1] := 148.5;
Item.Add(12, pt);
pt[0] := 0.0;
pt[1] := 0.0;
Item.Add(13, pt);
pt[0] := 10.0;
pt[1] := 10.0;
Item.Add(14, pt);
pt[0] := 10.0;
pt[1] := 10.0;
Item.Add(15, pt);
pt[0] := 0.0;
pt[1] := 0.0;
pt[2] := 1.0;
Item.Add(16, pt);
pt[0] := 0.0;
pt[1] := 0.0;
pt[2] := 0.0;
Item.Add(17, pt);
Item.Add(42, 50.0);
Item.Add(43, 0.0);
Item.Add(44, 0.0);
Item.Add(45, 423.8371175511319);
Item.Add(50, 0.0);
Item.Add(51, 0.0);
Item.Add(72, 100);
Item.Add(90, 32864);
Item.Add(1, '');
Item.Add(281, 0);
Item.Add(71, 1);
Item.Add(74, 0);
Item.Add(110, 0.0);
Item.Add(120, 0.0);
Item.Add(130, 0.0);
Item.Add(111, 1.0);
Item.Add(121, 0.0);
Item.Add(131, 0.0);
Item.Add(112, 0.0);
Item.Add(122, 1.0);
Item.Add(132, 0.0);
Item.Add(79, 0);
Item.Add(146, 0.0);
  Result := StartEntMakeX;
end;
}
function TDArxEntMake.XLine(basePoint, unitVector: Tads_point): Boolean;
begin
  Item.Clear;
  Item.Add(0, 'XLINE');
  SetCommonPropEntity;
  Item.Add(100, 'AcDbXline');
  Item.Add(10, basePoint);
  Item.Add(11, unitVector);
  Result := StartEntMakeX;
end;

end.
