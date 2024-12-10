unit DArxAds;

// ******************************************************
//          DelphiARX2002 ADSRx Assistant Object
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
  Windows, Messages, SysUtils, Classes, DArxList, DArxH;

const
  // Lineweight Propertes Value
  lwBYLAYER = -1;
  lwBYBLOCK = -2;
  lwDEFAULT = -3;

type
  TDReadResbuf = class;
  TDResbufItem = class;
  TDEntNameItem = class;
  TDArxTblList = class;
  TDVertexItems = class;
  TDCustomEntMake = class;

  TDCustomResbuf = class(TObject)
  private
    function GetrbType(const rb: PResbuf; var Value: Smallint): Boolean;
    function GetrbInteger(const rb: PResbuf; var Value: Integer): Boolean;
    function GetrbReal(const rb: PResbuf; var Value: Tads_real): Boolean;
    function GetrbPoint(const rb: PResbuf; var Value: Tads_point): Boolean;
    function GetrbInt(const rb: PResbuf; var Value: SmallInt): Boolean;
    function GetrbString(const rb: PResbuf; var Value: AnsiString): Boolean;
    function GetrbLName(const rb: PResbuf; var Value: Tads_name): Boolean;
    function GetrbLong(const rb: PResbuf; var Value: Longint): Boolean;
    function GetrbBinary(const rb: PResbuf; var Value: Tads_binary): Boolean;
    function GetrbHandle(const rb: PResbuf; var Value: Tads_Handles): Boolean;
    function GetrbBool(const rb: PResbuf; var Value: Boolean): Boolean;
  protected
    FFirstResbuf: PResbuf;
    FLastResbuf: PResbuf;
    FLastPrev: PResbuf;
    FcurResbuf: PResbuf;
    FCount: Integer;
    function GetResBufs(Index: Integer): PResbuf;
    procedure FreeResbuf; virtual;
    function IsIndex(Index: Integer; LastInsert: Boolean = False): Boolean;
    function GetIndexOfPrev(Index: Integer; var PrevResbuf: PResbuf): PResbuf;
    procedure SetLastPrvBuf;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function IsResbuf: Boolean;
    function ReCount: Integer;                  // リザルトバッファの再カウント
    procedure Cast(Source: PResbuf);virtual;    // リザルトバッファのポインタをそのままコピー
    procedure Erase; virtual;                   // メモリを解放しないでクリア
    function FirstCurrent: PResbuf;             // 始めのリザルトバッファを curResbuf にする
    function NextCurrent: PResbuf;              // curResbuf の次のリザルトバッファを curResbuf にする
    function FindType(ResType: Integer; StartIndex: Integer = 0): Integer;

    function curRTypes: TResbufTypes;
    function curType(var Value: Smallint): Boolean;
    function curInteger(var Value: Integer): Boolean;
    function curReal(var Value: Tads_real): Boolean;
    function curPoint(var Value: Tads_point): Boolean;
    function curInt(var Value: SmallInt): Boolean;
    function curString(var Value: AnsiString): Boolean;
    function curLName(var Value: Tads_name): Boolean;
    function curLong(var Value: Longint): Boolean;
    function curBinary(var Value: Tads_binary): Boolean;
    function curHandle(var Value: Tads_Handles): Boolean;
    function curBool(var Value: Boolean): Boolean;

    function GetRTypes(Index: Integer): TResbufTypes;
    function GetType(Index: Integer; var Value: Smallint): Boolean;
    function GetInteger(Index: Integer; var Value: Integer): Boolean;
    function GetReal(Index: Integer; var Value: Tads_real): Boolean;
    function GetPoint(Index: Integer; var Value: Tads_point): Boolean;
    function GetInt(Index: Integer; var Value: SmallInt): Boolean;
    function GetString(Index: Integer; var Value: AnsiString): Boolean;
    function GetLName(Index: Integer; var Value: Tads_name): Boolean;
    function GetLong(Index: Integer; var Value: Longint): Boolean;
    function GetBinary(Index: Integer; var Value: Tads_binary): Boolean;
    function GetHandle(Index: Integer; var Value: Tads_Handles): Boolean;
    function GetBool(Index: Integer; var Value: Boolean): Boolean;

    property Resbuf: PResbuf read FFirstResbuf;
    property LastResbuf: PResbuf read FLastResbuf;
    property curResbuf: PResbuf read FcurResbuf;
    property Count: Integer read FCount;

    property Resbufs[Index: Integer]: PResbuf read GetResBufs;
    property Types[Index: Integer]: TResbufTypes read GetRTypes;
  end;

  TDReadResbuf = class(TDCustomResbuf)
  private
    function GetresType(Index: Integer): SmallInt;
    function GetresVal(Index: Integer): Tads_u_val;
  public
    property resType[Index: Integer]: SmallInt read GetresType;
    property resVal[Index: Integer]: Tads_u_val read GetresVal;
  end;

  TDResbufItem = class(TDCustomResbuf)
  private
    FAppName: AnsiString;
    FError: Boolean;
    FErrType: Integer;
    function GetresType(Index: Integer): SmallInt;
    procedure SetresType(Index: Integer; Value: SmallInt);
    function GetresVal(Index: Integer): Tads_u_val;
    procedure SetresVal(Index: Integer; Value: Tads_u_val);
    procedure SetAppName(const Value: AnsiString);
  protected
    procedure FreeResbuf; override;
    function AddNewResbuf(Newbuf: PResbuf; resType: Integer): Boolean;
    function InsertNewResbuf(Index: Integer; Newbuf: PResbuf; resType: Integer): Boolean;
    procedure RemoveLastNull;
  public
    procedure Assign(Source: TDCustomResbuf); virtual;
    procedure Copy(Source: PResbuf); virtual;     // 別メモリを割り当てて、内容をコピー
    procedure Cast(Source: PResbuf); override;    // リザルトバッファのポインタをそのままコピー
    function IsLastNull: Boolean;
    procedure Clear; virtual;                     // メモリを解放してクリア
    procedure Erase; override;                    // メモリを解放しないでクリア
    procedure Delete(Index: Integer);

    function Add(ResType: Integer): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Tads_u_Val): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Longint): PResbuf; overload;
    function Add(ResType: Integer; ResValue: AnsiString): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Tads_Real): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Tads_Point): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Tads_Name): PResbuf; overload;
    function Add(ResType: Integer; ResValue: Tads_Binary): PResbuf; overload;
    function Add(ResValue: PResbuf): PResbuf; overload;

    function Insert(Index: Integer; ResType: Integer): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Tads_u_Val): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Longint): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: AnsiString): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Tads_Real): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Tads_Point): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Tads_Name): PResbuf; overload;
    function Insert(Index: Integer; ResType: Integer; ResValue: Tads_Binary): PResbuf; overload;
    function Insert(Index: Integer; ResValue: PResbuf): PResbuf; overload;

    function SetType(Index: Integer; Value: Smallint): Boolean;
    function SetReal(Index: Integer; Value: Tads_real): Boolean;
    function SetPoint(Index: Integer; Value: Tads_point): Boolean;
    function SetInt(Index: Integer; Value: SmallInt): Boolean;
    function SetString(Index: Integer; Value: AnsiString): Boolean;
    function SetLName(Index: Integer; Value: Tads_name): Boolean;
    function SetLong(Index: Integer; Value: Longint): Boolean;
    function SetBinary(Index: Integer; Value: Tads_binary): Boolean;
    function SetHandle(Index: Integer; Value: Tads_Handles): Boolean;

    function FindEntName: Tads_name;
    function EntGet(const entname: Tads_name): Boolean;
    function EntGetXdata(const entname: Tads_name; const AppList: AnsiString = ''): Boolean;
    function EntMake: Integer;
    function EntMakeX(var entres: Tads_Name): Integer;
    function EntMod: Integer;
    function SendCmd: Boolean;

    property AppName: AnsiString read FAppName write SetAppName;
    property resType[Index: Integer]: SmallInt read GetresType write SetresType;
    property resVal[Index: Integer]: Tads_u_val read GetresVal write SetresVal;
    property Error: Boolean read FError;
    property ErrType: Integer read FErrType;
  end;

  TDEntNameItem = class(TObject)
  private
    FAppName: AnsiString;
    FItem: TDResbufItem;
    FeName: Tads_name;
    procedure SetAppName(const Value: AnsiString);
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function IsEName: Boolean;
    procedure Assign(Source: TDEntNameItem); virtual;
    procedure Copy(Source: Tads_name);

    procedure Clear;

    function EntLast(const entGetRb: Boolean = False; const AppList: AnsiString = ''): Boolean;
    function GetTableName(TblName, SymName: AnsiString; const entGetRb: Boolean = False; const AppList: AnsiString = ''): Boolean;
    function NamedObjDict(const DictSearch: AnsiString = ''; const entGetRb: Boolean = False): Boolean;

    function EntGetResbuf: Boolean;
    function EntGetXResbuf(const AppList: AnsiString = ''): Boolean;

    property AppName: AnsiString read FAppName write SetAppName;
    property eName: Tads_name read FeName;
    property Item: TDResbufItem read FItem write FItem;
  end;

  TDEntNameItems = class(TPersistent)
  private
    FItems: TDStrObjNodeList;
    function GetName(Index: Integer): AnsiString;
    function GetItems(Index: Integer): TDEntNameItem;
    function GetEntName(Index: Integer): Tads_name;
    function GetResbuf(Index: Integer): TDResbufItem;
  public
    constructor Create; virtual;
    destructor Destroy; override;

    function Add(Name: AnsiString; EntNameItem: TDEntNameItem): Integer; overload;
    function Add(Name: AnsiString; EntName: Tads_name): Integer; overload;
    procedure Clear(EraseRebuf: Boolean = False);
    function Count: Integer;
    procedure Delete(Index: Integer; EraseRebuf: Boolean = False);
    procedure Exchange(Index1, Index2: Integer);
    function Find(Name: Ansistring; var Index: Integer): Boolean;
    function IndexOf(Name: Ansistring): Integer;
    procedure Insert(Index: Integer; Name: Ansistring; EntName: Tads_name);
    procedure Sort;
    procedure Move(CurIndex, NewIndex: Integer);

    function EntGetResbuf(Index: Integer): Boolean;
    function EntGetXResbuf(Index: Integer; const AppList: AnsiString = ''): Boolean;

    property Names[Index: Integer]: AnsiString read GetName;
    property Items[Index: Integer]: TDEntNameItem read GetItems;
    property EntName[Index: Integer]: Tads_name read GetEntName;
    property Resbuf[Index: Integer]: TDResbufItem read GetResbuf;
  end;

  TDArxTblList = class(TObject)
  private
    FAppId: TDEntNameItems;
    FBlock: TDEntNameItems;
    FDimStyle: TDEntNameItems;
    FLType: TDEntNameItems;
    FLayer: TDEntNameItems;
    FStyle: TDEntNameItems;
    FUCS: TDEntNameItems;
    FView: TDEntNameItems;
    FVPort: TDEntNameItems;
    FGroup: TDEntNameItems;
    FLayout: TDEntNameItems;
    FMLineStyle: TDEntNameItems;
    FPlotSettings: TDEntNameItems;
    FPlotStyleName: TDEntNameItems;
  protected
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure GetTablesList(TblType: AnsiString; var List: TDEntNameItems);
    function GetObjectsList(ObjName: AnsiString; var List: TDEntNameItems): Integer;

    function GetAppId: Integer;
    function GetBlock: Integer;
    function GetDimStyle: Integer;
    function GetLtype: Integer;
    function GetLayer: Integer;
    function GetStyle: Integer;
    function GetUCS: Integer;
    function GetView: Integer;
    function GetVPort: Integer;
    function GetGroup: Integer;
    function GetLayout: Integer;
    function GetMLineStyle: Integer;
    function GetPlotSettings: Integer;
    function GetPlotStyleName: Integer;

    property AppId: TDEntNameItems read FAppId;
    property Block: TDEntNameItems read FBlock;
    property DimStyle: TDEntNameItems read FDimStyle;
    property LType: TDEntNameItems read FLType;
    property Layer: TDEntNameItems read FLayer;
    property Style: TDEntNameItems read FStyle;
    property UCS: TDEntNameItems read FUCS;
    property View: TDEntNameItems read FView;
    property VPort: TDEntNameItems read FVPort;
    property Group: TDEntNameItems read FGroup;
    property Layout: TDEntNameItems read FLayout;
    property MLineStyle: TDEntNameItems read FMLineStyle;
    property PlotSettings: TDEntNameItems read FPlotSettings;
    property PlotStyleName: TDEntNameItems read FPlotStyleName;
  end;

  Pads_vertex = ^Tads_vertex;
  Tads_vertex = record
    Point: Tads_point;
    Bulge: Double;
    StartWidth: Double;
    EndWidth: Double;
    Flags: Smallint;
    Curve: Double;
    VIndex: array[0..3]of Smallint;
  end;

  TDVertexItems = class(TObject)
  private
    FItems: TDItemNodeList;
    FConstant: Boolean;
    FConstantWidth: Double;
    FFlags: Smallint;
    FCurve: Double;
    FVIndex: array[0..3]of Smallint;
    procedure ResetVertex(var Value: Tads_vertex);
    function GetVertex(Index: Integer): Tads_vertex;
    procedure SetVertex(Index: Integer; Value: Tads_vertex);
    function GetVIndex(Index: Integer): Smallint;
    procedure SetVIndex(Index: Integer; Value: Smallint);
  public
    constructor Create; virtual;
    destructor Destroy; override;
    procedure Clear;
    function Count: Integer;
    function Add(Point: Tads_point; Bulge: Double = 0; StartWidth: Double = 0; EndWidth: Double = 0): Integer;
    procedure Delete(Index: Integer);

    property Vertex[Index: Integer]: Tads_vertex read GetVertex write SetVertex;
    property Constant: Boolean read FConstant;
    property ConstantWidth: Double read FConstantWidth;
    property Flags: Smallint read FFlags write FFlags default 0;
    property Curve: Double read FCurve write FCurve;
    property VIndex[Index: Integer]: Smallint read GetVIndex write SetVIndex;
  end;

  TDxfDrawSpace = (dsNone, dsModel, dsPaper);

  TDCustomEntMake = class(TObject)
  private
    FItem: TDResbufItem;
    FEntList: TDItemNodeList;
    FEntBuffer: Boolean;
    FLastName: Tads_name;
    FEntMakeError: Integer;
    // COMMON PROPETES
    FDrawSpace: TDxfDrawSpace;      // (67)空間
    FLayer: AnsiString;             // (8)画層名
    FLType: AnsiString;             // (6)線種名
    FLayout: AnsiString;            // (410)レイアウト名
    FColor: Smallint;               // (62)色
    FLineweight: Smallint;          // 線幅
    FLtScale: Double;               // (48)線種尺度
    FDirection: Tads_point;         // (210)突出方向
    FVisible: Boolean;              // (60)可視性
    // SPECIAL PROPERTES
    FAltitude: Double;              // (38)高度
    FThickness: Double;             // (39)厚さ
    FModelerVersion: Smallint;      // (70)モデラーバージョン
    function GetEntList(Index: Integer): Tads_name;
    procedure SetEntList(Index: Integer; EntName: Tads_name);
    procedure SetEntBuffer(Value: Boolean);
    procedure SetColor(const Value: Smallint);
    procedure SetLineweight(const Value: Smallint);
  protected
    function SetEntLast: Boolean;
    procedure SetCommonProperty;
    procedure SetCommonPropEntity;
  public
    constructor Create; virtual;
    destructor Destroy; override;
    function EntCount: Integer;
    function AddEntName(EntName: Tads_name): Integer;
    function StartEntMake: Boolean;
    function StartEntMakeX: Boolean;
    function StartEntMakeXKeyword: AnsiString;
    procedure EntClear;
    // -------------------------------------------------------------------------
    property Item: TDResbufItem read FItem write FItem;
    property EntList[Index: Integer]: Tads_name read GetEntList write SetEntList;
    property EntBuffer: Boolean read FEntBuffer write SetEntBuffer;
    property LastName: Tads_name read FLastName;
    property EntMakeError: Integer read FEntMakeError;
    // COMMON PROPETES
    property DrawSpace: TDxfDrawSpace read FDrawSpace write FDrawSpace default dsNone;    // Default=dsNone(Non Setting)
    property Layer: AnsiString read FLayer write FLayer;                                  // Default=''(Non Setting)
    property LType: AnsiString read FLType write FLType;                                  // Default=''(Non Setting)
    property Layout: AnsiString read FLayout write FLayout;                               // Default=''(Non Setting)
    property Color: Smallint read FColor write SetColor default -1;                       // Default=-1(Non Setting), (0 to 256)
    property Lineweight: Smallint read FLineweight write SetLineweight default -1;        // Default=-1(Non Setting)
    property LtScale: Double read FLtScale write FLtScale;                                // Default=1.0
    property Direction: Tads_point read FDirection write FDirection;                      // Default=(0, 0, 1)
    property Visible: Boolean read FVisible write FVisible default True;                  // True=0, False=1
    // SPECIAL PROPERTES
    property Altitude: Double read FAltitude write FAltitude;                             // Default=0.0
    property Thickness: Double read FThickness write FThickness;                          // Default=0.0
    property ModelerVersion: Smallint read FModelerVersion write FModelerVersion;         // Default=1
  end;

// 文字列をDouble型データに変換する。エラー時は、Defaultの値が返る
function StrToFloatDef(const S: AnsiString; const Default: Double): Double;

implementation

uses
{$IFDEF DARXDEBUG}
  AdsDebug,
{$ENDIF}
  DArxLib, AextCLib;

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

{ TDCustomResbuf }

constructor TDCustomResbuf.Create;
begin
  inherited Create;
  Erase;
end;

destructor TDCustomResbuf.Destroy;
begin
  FreeResbuf;
  inherited Destroy;
end;

function TDCustomResbuf.IsResbuf: Boolean;
begin
  Result := (FFirstResbuf <> nil);
end;

function TDCustomResbuf.ReCount: Integer;
begin
  SetLastPrvBuf;
  Result := FCount;
end;

procedure TDCustomResbuf.Cast(Source: PResbuf);
begin
  FreeResbuf;
  FFirstResbuf := Source;
  FirstCurrent;
  SetLastPrvBuf;
end;

procedure TDCustomResbuf.Erase;
begin
  FFirstResbuf := nil;
  FLastResbuf := nil;
  FLastPrev := nil;
  FcurResbuf := nil;
  FCount := 0;
end;

function TDCustomResbuf.FirstCurrent: PResbuf;
begin
  FcurResbuf := FFirstResbuf;
  Result := FcurResbuf;
end;

function TDCustomResbuf.NextCurrent: PResbuf;
begin
  if FcurResbuf <> nil then FcurResbuf := FcurResbuf^.rbnext;
  Result := FcurResbuf;
end;

function TDCustomResbuf.FindType(ResType: Integer; StartIndex: Integer = 0): Integer;
var
  ni: Integer;
  pNext: PResbuf;
begin
  Result := -1;
  if (StartIndex >= FCount)or(FFirstResbuf = nil) then exit;
  pNext := FFirstResbuf;
  ni := 0;
  While (pNext <> nil) do begin
    if (ni >= StartIndex)and(pNext^.restype = ResType) then begin
      Result := ni;
      break;
    end;
    pNext := pNext^.rbnext;
    Inc(ni);
  end;
end;

function TDCustomResbuf.curRTypes: TResbufTypes;
begin
  if FcurResbuf = nil then Result := ruERROR else Result := extern_darxGetResType(FcurResbuf^.restype);
end;

function TDCustomResbuf.curType(var Value: Smallint): Boolean;
begin
  Result := GetrbType(FcurResbuf, Value);
end;

function TDCustomResbuf.curInteger(var Value: Integer): Boolean;
begin
  Result := GetrbInteger(FcurResbuf, Value);
end;

function TDCustomResbuf.curReal(var Value: Tads_real): Boolean;
begin
  Result := GetrbReal(FcurResbuf, Value);
end;

function TDCustomResbuf.curPoint(var Value: Tads_point): Boolean;
begin
  Result := GetrbPoint(FcurResbuf, Value);
end;

function TDCustomResbuf.curInt(var Value: SmallInt): Boolean;
begin
  Result := GetrbInt(FcurResbuf, Value);
end;

function TDCustomResbuf.curString(var Value: AnsiString): Boolean;
begin
  Result := GetrbString(FcurResbuf, Value);
end;

function TDCustomResbuf.curLName(var Value: Tads_name): Boolean;
begin
  Result := GetrbLName(FcurResbuf, Value);
end;

function TDCustomResbuf.curLong(var Value: Longint): Boolean;
begin
  Result := GetrbLong(FcurResbuf, Value);
end;

function TDCustomResbuf.curBinary(var Value: Tads_binary): Boolean;
begin
  Result := GetrbBinary(FcurResbuf, Value);
end;

function TDCustomResbuf.curHandle(var Value: Tads_Handles): Boolean;
begin
  Result := GetrbHandle(FcurResbuf, Value);
end;

function TDCustomResbuf.curBool(var Value: Boolean): Boolean;
begin
  Result := GetrbBool(FcurResbuf, Value);
end;

function TDCustomResbuf.GetRTypes(Index: Integer): TResbufTypes;
var
  Rb: PResbuf;
begin
  Rb := GetResBufs(Index);
  if Rb = nil then Result := ruERROR else Result := extern_darxGetResType(Rb^.restype);
end;

function TDCustomResbuf.GetType(Index: Integer; var Value: Smallint): Boolean;
begin
  Result := GetrbType(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetInteger(Index: Integer; var Value: Integer): Boolean;
begin
  Result := GetrbInteger(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetReal(Index: Integer; var Value: Tads_real): Boolean;
begin
  Result := GetrbReal(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetPoint(Index: Integer; var Value: Tads_point): Boolean;
begin
  Result := GetrbPoint(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetInt(Index: Integer; var Value: SmallInt): Boolean;
begin
  Result := GetrbInt(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetString(Index: Integer; var Value: AnsiString): Boolean;
begin
  Result := GetrbString(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetLName(Index: Integer; var Value: Tads_name): Boolean;
begin
  Result := GetrbLName(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetLong(Index: Integer; var Value: Longint): Boolean;
begin
  Result := GetrbLong(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetBinary(Index: Integer; var Value: Tads_binary): Boolean;
begin
  Result := GetrbBinary(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetHandle(Index: Integer; var Value: Tads_Handles): Boolean;
begin
  Result := GetrbHandle(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetBool(Index: Integer; var Value: Boolean): Boolean;
begin
  Result := GetrbBool(GetResBufs(Index), Value);
end;

function TDCustomResbuf.GetrbType(const rb: PResbuf; var Value: Smallint): Boolean;
begin
  Result := (rb <> nil);
  if Result then Value := rb^.restype else Value := RTERROR;
end;

function TDCustomResbuf.GetrbInteger(const rb: PResbuf; var Value: Integer): Boolean;
var
  rTypes: TResbufTypes;
begin
  Result := False;
  if (rb = nil) then exit;
  rTypes := extern_darxGetResType(rb^.restype);
  Result := True;
  case rTypes of
  ruSHORT: Value := rb^.resval.rint;
   ruLONG: Value := rb^.resval.rlong;
  else
    Result := False;
  end;
end;

function TDCustomResbuf.GetrbReal(const rb: PResbuf; var Value: Tads_real): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruREAL);
  if Result then Value := rb^.resval.rreal;
end;

function TDCustomResbuf.GetrbPoint(const rb: PResbuf; var Value: Tads_point): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruPOINT);
  if Result then Value := rb^.resval.rpoint;
end;

function TDCustomResbuf.GetrbInt(const rb: PResbuf; var Value: SmallInt): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruSHORT);
  if Result then Value := rb^.resval.rint;
end;

function TDCustomResbuf.GetrbString(const rb: PResbuf; var Value: AnsiString): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruSTRING);
  if Result then Value := extern_darxPString(rb^.resval.rstring);
end;

function TDCustomResbuf.GetrbLName(const rb: PResbuf; var Value: Tads_name): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruLNAME);
  if Result then Value := rb^.resval.rlName;
end;

function TDCustomResbuf.GetrbLong(const rb: PResbuf; var Value: Longint): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruLONG);
  if Result then Value := rb^.resval.rlong;
end;

function TDCustomResbuf.GetrbBinary(const rb: PResbuf; var Value: Tads_binary): Boolean;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruBINARY);
  if Result then Value := rb^.resval.rbinary
end;

function TDCustomResbuf.GetrbHandle(const rb: PResbuf; var Value: Tads_Handles): Boolean;
var
  ni: Integer;
begin
  Result := (rb <> nil)and(extern_darxGetResType(rb^.restype) = ruHANDLE);
  if Result then for ni := 0 to HANDLE_SIZE do Value[ni] := rb^.resval.iHandle[ni];
end;

function TDCustomResbuf.GetrbBool(const rb: PResbuf; var Value: Boolean): Boolean;
begin
  Result := (rb <> nil);
  if Result then Value := (rb^.restype <> RTNIL);
end;

function TDCustomResbuf.GetResBufs(Index: Integer): PResbuf;
var
  ni: Integer;
begin
  Result := FFirstResbuf;
  for ni := 1 to Index do if (Result <> nil) then Result := Result^.rbnext else break;
end;

procedure TDCustomResbuf.FreeResbuf;
begin
  Erase;
end;

function TDCustomResbuf.IsIndex(Index: Integer; LastInsert: Boolean = False): Boolean;
begin
  Result := (FFirstResbuf <> nil)and(Index >= 0)and((FCount > Index)or((LastInsert)and(FCount = Index)));
end;

function TDCustomResbuf.GetIndexOfPrev(Index: Integer; var PrevResbuf: PResbuf): PResbuf;
var
  ni: Integer;
begin
  PrevResbuf := nil;
  if IsIndex(Index) then begin
    Result := FFirstResbuf;
    for ni := 1 to Index do begin
      PrevResbuf := Result;
      if (Result <> nil) then Result := PrevResbuf^.rbnext else break;
    end;
  end else begin
    Result := nil;
  end;
end;

procedure TDCustomResbuf.SetLastPrvBuf;
begin
  FCount := 0;
  FLastPrev := nil;
  FLastResbuf := FFirstResbuf;
  While (FLastResbuf <> nil) do begin
    Inc(FCount);
    if FLastResbuf^.rbnext = nil then break;
    FLastPrev := FLastResbuf;
    FLastResbuf := FLastPrev^.rbnext;
  end;
end;

{ TDReadResbuf }

function TDReadResbuf.GetresType(Index: Integer): SmallInt;
begin
  GetType(Index, Result);
end;

function TDReadResbuf.GetresVal(Index: Integer): Tads_u_val;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  if pSel = nil then begin
    Result.rlong := 0;
  end else begin
    Result := pSel^.resval;
  end;
end;

{ TDResbufItem }

procedure TDResbufItem.Assign(Source: TDCustomResbuf);
begin
  if NOT (Source is TDCustomResbuf) then exit;
  Copy(Source.Resbuf);
end;

procedure TDResbufItem.Copy(Source: PResbuf);
var
  pNext: PResbuf;
  ruVal: TResbufTypes;
begin
  Clear;
  pNext := Source;
  While (pNext <> nil) do begin
    ruVal := extern_darxGetResType(pNext^.restype);
    case ruVal of
      ruREAL: Add(pNext^.restype, pNext^.resval.rreal);
     ruPOINT: Add(pNext^.restype, pNext^.resval.rpoint);
     ruSHORT: Add(pNext^.restype, pNext^.resval.rint);
      ruLONG: Add(pNext^.restype, pNext^.resval.rlong);
    ruSTRING: Add(pNext^.restype, pNext^.resval.rstring);
     ruLNAME: Add(pNext^.restype, pNext^.resval.rlname);
    ruBINARY: Add(pNext^.restype, pNext^.resval.rbinary);
      ruNONE: Add(pNext^.restype);
    end;
    pNext := pNext^.rbnext;
  end;
  FindEntName;
end;

procedure TDResbufItem.Cast(Source: PResbuf);
begin
  inherited cast(Source);
  FindEntName;
end;

function TDResbufItem.IsLastNull: Boolean;
begin
  Result := (FLastResbuf <> nil)and((FLastResbuf^.restype = RTNONE)or(FLastResbuf^.restype = 0));
end;

procedure TDResbufItem.Clear;
begin
  if FFirstResbuf <> nil then extern_acutRelRb(FFirstResbuf);
  Erase;
end;

procedure TDResbufItem.Erase;
begin
  inherited Erase;
  FError := False;
  FErrType := 0;
end;

procedure TDResbufItem.Delete(Index: Integer);
var
  pDel, pPrv: PResbuf;
begin
  pDel := GetIndexOfPrev(Index, pPrv);
  if pDel = nil then exit;
  if pPrv <> nil then begin
    pPrv^.rbnext := pDel^.rbnext;
  end else if FFirstResbuf = pDel then begin
    FFirstResbuf := pDel^.rbnext;
  end;
  pDel^.rbnext := nil;
  if FLastResbuf = pDel then SetLastPrvBuf;
  if FcurResbuf = pDel then FcurResbuf := nil;
  extern_acutRelRb(pDel);
  Dec(FCount);
end;

function TDResbufItem.Add(ResType: Integer): PResbuf;
var
  ruVal: TResbufTypes;
begin
  Result := nil;
  if FError then exit;
  ruVal := extern_darxGetResType(ResType);
  if (ruVal = ruNONE) then Result := extern_acutNewRb(ResType);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Tads_u_Val): PResbuf;
begin
  Result := extern_acutNewRb(ResType);
  if Result = nil then exit;
  Result^.resval := ResValue;
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Longint): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbInt(ResType, ResValue);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: AnsiString): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbStr(ResType, PChar(ResValue));
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Tads_Real): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbReal(ResType, ResValue);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Tads_Point): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbPos(ResType, ResValue);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Tads_Name): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbName(ResType, ResValue);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResType: Integer; ResValue: Tads_Binary): PResbuf;
begin
  if FError then Result := nil else Result := extern_darxNewRbBin(ResType, ResValue);
  AddNewResbuf(Result, ResType);
end;

function TDResbufItem.Add(ResValue: PResbuf): PResbuf;
begin
  Result := nil;
  if (ResValue = nil)or(FError) then exit;
  if NOT AddNewResbuf(ResValue, RTRESBUF) then exit;
  SetLastPrvBuf;
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer): PResbuf;
var
  ruVal: TResbufTypes;
begin
  Result := nil;
  if (FError)or(NOT IsIndex(Index, True)) then exit;
  ruVal := extern_darxGetResType(ResType);
  if (ruVal = ruNONE) then Result := extern_acutNewRb(ResType);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Tads_u_Val): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_acutNewRb(ResType);
  if Result = nil then exit;
  Result^.resval := ResValue;
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Longint): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbInt(ResType, ResValue);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: AnsiString): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbStr(ResType, PChar(ResValue));
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Tads_Real): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbReal(ResType, ResValue);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Tads_Point): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbPos(ResType, ResValue);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Tads_Name): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbName(ResType, ResValue);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResType: Integer; ResValue: Tads_Binary): PResbuf;
begin
  if (FError)or(NOT IsIndex(Index, True)) then Result := nil else Result := extern_darxNewRbBin(ResType, ResValue);
  InsertNewResbuf(Index, Result, ResType);
end;

function TDResbufItem.Insert(Index: Integer; ResValue: PResbuf): PResbuf;
var
  pLast, pRes: PResbuf;
begin
  Result := nil;
  if (ResValue = nil)or(FError)or(NOT IsIndex(Index, True)) then exit;
  pLast := ResValue;
  While (pLast^.rbnext <> nil) do pLast := pLast^.rbnext;
  pRes := ResValue^.rbnext;
  if NOT InsertNewResbuf(Index, ResValue, RTRESBUF) then exit;
  if pRes <> nil then begin
    pLast^.rbnext := ResValue^.rbnext;
    ResValue^.rbnext := pRes;
  end;
  SetLastPrvBuf;
end;

function TDResbufItem.SetType(Index: Integer; Value: Smallint): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil);
  if NOT Result then exit;
  if (extern_darxGetResType(pSel^.restype) <> extern_darxGetResType(Value)) then extern_darxFreeResval(pSel);
  pSel^.restype := Value;
end;

function TDResbufItem.SetReal(Index: Integer; Value: Tads_real): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruREAL);
  if Result then pSel^.resval.rreal := Value;
end;

function TDResbufItem.SetPoint(Index: Integer; Value: Tads_point): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruPOINT);
  if Result then pSel^.resval.rpoint := Value;
end;

function TDResbufItem.SetInt(Index: Integer; Value: SmallInt): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruSHORT);
  if Result then pSel^.resval.rint := Value;
end;

function TDResbufItem.SetString(Index: Integer; Value: AnsiString): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruSTRING);
  if Result then pSel^.resval.rstring := extern_darxRenewString(pSel^.resval.rstring, Value);
end;

function TDResbufItem.SetLName(Index: Integer; Value: Tads_name): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruLNAME);
  if Result then pSel^.resval.rlName := Value;
end;

function TDResbufItem.SetLong(Index: Integer; Value: Longint): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruLONG);
  if Result then pSel^.resval.rlong := Value;
end;

function TDResbufItem.SetBinary(Index: Integer; Value: Tads_binary): Boolean;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruBINARY);
  if Result then pSel^.resval.rbinary := Value;
end;

function TDResbufItem.SetHandle(Index: Integer; Value: Tads_Handles): Boolean;
var
  pSel: PResbuf;
  ni: Integer;
begin
  pSel := GetResBufs(Index);
  Result := (pSel <> nil)and(extern_darxGetResType(pSel^.restype) = ruHANDLE);
  if Result then for ni := 0 to HANDLE_SIZE do pSel^.resval.iHandle[ni] := Value[ni];
end;

function TDResbufItem.FindEntName: Tads_name;
begin
  if (FFirstResbuf <> nil)and(FFirstResbuf^.restype = -1) then Result := FFirstResbuf^.resval.rlName else acdbNameClear(Result);
end;

function TDResbufItem.EntGet(const entname: Tads_name): Boolean;
var
  pEnt: PResbuf;
begin
  Clear;
  pEnt := extern_acdbEntGet(@entname);
  Result := (pEnt <> nil);
  if Result then Cast(pEnt);
end;

function TDResbufItem.EntGetXdata(const entname: Tads_name; const AppList: AnsiString = ''): Boolean;
var
  pEnt, pApps, pNext, pNew: PResbuf;
  nLen: Integer;
  sBuf, sName: AnsiString;
begin
  Clear;
  if (AppList <> '') then sBuf := AppList else sBuf := FAppName;
  if sBuf = '' then begin
    pApps := extern_darxNewRbStr(RTSTR, '*');
  end else begin
    pApps := nil;
    pNext := nil;
    repeat
      nLen := AnsiPos(';', sBuf);
      if nLen > 0 then begin
        sName := System.Copy(sBuf, 1, nLen - 1);
        sBuf := System.Copy(sBuf, nLen + 1, Maxint);
      end else begin
        sName := sBuf;
      end;
      if sName = '' then pNew := nil else pNew := extern_darxNewRbStr(RTSTR, PChar(sName));
      if pNew <> nil then begin
        if pApps = nil then pApps := pNew else if pNext <> nil then pNext^.rbnext := pNew;
        pNext := pNew;
      end;
    until (0 >= nLen);
  end;
  try
    pEnt := extern_acdbEntGetX(@entname, pApps);
    Result := (pEnt <> nil);
    if Result then Cast(pEnt);
  finally
    extern_acutRelRb(pApps);
  end;
end;

function TDResbufItem.EntMake: Integer;
begin
  Result := RTERROR;
  if (0 >= FCount)or(FFirstResbuf = nil)or(FError) then exit;
  Result := extern_acdbEntMake(FFirstResbuf);
end;

function TDResbufItem.EntMakeX(var entres: Tads_Name): Integer;
begin
  Result := RTERROR;
  if (0 >= FCount)or(FFirstResbuf = nil)or(FError) then exit;
  Result := extern_acdbEntMakeX(FFirstResbuf, @entres);
end;

function TDResbufItem.EntMod: Integer;
begin
  Result := RTERROR;
  if (0 >= FCount)or(FFirstResbuf = nil)or(FError) then exit;
  Result := extern_acdbEntMod(FFirstResbuf);
end;

function TDResbufItem.SendCmd: Boolean;
begin
  Result := False;
  if (0 >= FCount)or(FFirstResbuf = nil)or(FError) then exit;
  RemoveLastNull;
  Result := (extern_acedCmd(FFirstResbuf) = RTNORM);
end;

function TDResbufItem.GetresType(Index: Integer): SmallInt;
begin
  GetType(Index, Result);
end;

procedure TDResbufItem.SetresType(Index: Integer; Value: SmallInt);
begin
  SetType(Index, Value);
end;

function TDResbufItem.GetresVal(Index: Integer): Tads_u_val;
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  if pSel = nil then begin
    Result.rlong := 0;
  end else begin
    Result := pSel^.resval;
  end;
end;

procedure TDResbufItem.SetresVal(Index: Integer; Value: Tads_u_val);
var
  pSel: PResbuf;
begin
  pSel := GetResBufs(Index);
  if pSel <> nil then pSel^.resval := Value;
end;

procedure TDResbufItem.FreeResbuf;
begin
  Clear;
end;

function TDResbufItem.AddNewResbuf(Newbuf: PResbuf; resType: Integer): Boolean;
begin
  if Newbuf = nil then begin
    if NOT FError then FErrType := resType;
    FError := True;
  end else begin
    if FFirstResbuf = nil then FFirstResbuf := Newbuf else if FLastResbuf <> nil then FLastResbuf^.rbnext := Newbuf;
    FLastPrev := FLastResbuf;
    FLastResbuf := Newbuf;
    Inc(FCount);
  end;
  Result := (NOT FError);
end;

function TDResbufItem.InsertNewResbuf(Index: Integer; Newbuf: PResbuf; resType: Integer): Boolean;
var
  pRes: PResbuf;
begin
  if Newbuf = nil then begin
    if NOT FError then FErrType := resType;
    FError := True;
  end else begin
    if (GetIndexOfPrev(Index, pRes) = nil)or(pRes = nil) then pRes := FLastResbuf;
    if pRes = FFirstResbuf then FFirstResbuf := Newbuf;
    if pRes = FLastResbuf then begin
      FLastPrev := pRes;
      FLastResbuf := Newbuf;
    end else if pRes^.rbnext = FLastResbuf then begin
      FLastPrev := Newbuf;
    end;
    Newbuf^.rbnext := pRes^.rbnext;
    pRes^.rbnext := Newbuf;
    Inc(FCount);
  end;
  Result := (NOT FError);
end;

procedure TDResbufItem.RemoveLastNull;
var
  rDel: Boolean;
  lpPrev: PResbuf;
begin
  rDel := False;
  FCount := 0;
  lpPrev := nil;
  FLastResbuf := FFirstResbuf;
  while (FLastResbuf <> nil) do begin
    Inc(FCount);
    if FLastResbuf^.rbnext = nil then begin
      if (FLastResbuf^.restype = RTNONE)or(FLastResbuf^.restype = 0) then begin
        Dec(FCount);
        extern_acutRelRb(FLastResbuf);
        if lpPrev <> nil then begin
          lpPrev^.rbnext := nil;
          FLastResbuf := lpPrev;
          rDel := True;
        end else begin
          FFirstResbuf := nil;
          FLastResbuf := nil;
        end;
      end;
      break;
    end else begin
      lpPrev := FLastResbuf;
      FLastResbuf := lpPrev^.rbnext;
    end;
  end;
  if rDel then RemoveLastNull;
end;

procedure TDResbufItem.SetAppName(const Value: AnsiString);
var
  lpTmp: Presbuf;
begin
  FAppName := Value;
  if FAppName = '' then exit;
  lpTmp := extern_acdbTblSearch('APPID', PChar(FAppName), 0);
  if lpTmp = nil then begin
    if extern_acdbRegApp(PChar(FAppName)) <> RTNORM then FAppName := '';
  end else begin
    extern_acutRelRb(lpTmp);
  end;
end;

{ TDEntNameItem }

constructor TDEntNameItem.Create;
begin
  inherited Create;
  FAppName := '';
  acdbNameClear(FeName);
  FItem := TDResbufItem.Create;
end;

destructor TDEntNameItem.Destroy;
begin
  FItem.Clear;
  FItem.Free;
  inherited Destroy;
end;

function TDEntNameItem.IsEName: Boolean;
begin
  Result := (NOT acdbNameNil(FeName));
end;

procedure TDEntNameItem.Assign(Source: TDEntNameItem);
begin
  if NOT (Source is TDEntNameItem) then exit;
  Copy(Source.eName);
  FItem.Copy(Source.Item.Resbuf);
end;

procedure TDEntNameItem.Copy(Source: Tads_name);
begin
  Clear;
  FeName := Source;
end;

procedure TDEntNameItem.Clear;
begin
  acdbNameClear(FeName);
  FItem.clear;
end;

function TDEntNameItem.EntLast(const entGetRb: Boolean = False; const AppList: AnsiString = ''): Boolean;
var
  nameres: Tads_Name;
begin
  Clear;
  Result := (extern_acdbEntLast(@nameres) = RTNORM);
  if NOT Result then exit;
  FeName := nameres;
  if entGetRb then EntGetXResbuf(AppList);
end;

function TDEntNameItem.GetTableName(TblName, SymName: AnsiString; const entGetRb: Boolean = False; const AppList: AnsiString = ''): Boolean;
var
  nameres: Tads_Name;
begin
  Clear;
  Result := (extern_acdbTblObjName(PChar(TblName), PChar(SymName), @nameres) = RTNORM);
  if NOT Result then exit;
  FeName := nameres;
  if entGetRb then EntGetXResbuf(AppList);
end;

function TDEntNameItem.NamedObjDict(const DictSearch: AnsiString = ''; const entGetRb: Boolean = False): Boolean;
var
  nameres: Tads_Name;
  pEnt: PResbuf;
begin
  Clear;
  Result := (extern_acdbNamedObjDict(@nameres) = RTNORM);
  if NOT Result then exit;
  FeName := nameres;
  pEnt := nil;
  if DictSearch <> '' then begin
    pEnt := extern_acdbDictSearch(@nameres, PChar(DictSearch), 0);
  end else if entGetRb then begin
    pEnt := extern_acdbEntGet(@nameres);
  end;
  if pEnt <> nil then FItem.Cast(pEnt);
end;

function TDEntNameItem.EntGetResbuf: Boolean;
var
  pEnt: PResbuf;
begin
  FItem.Clear;
  pEnt := extern_acdbEntGet(@FeName);
  Result := (pEnt <> nil);
  if NOT Result then exit;
  FItem.Cast(pEnt);
end;

function TDEntNameItem.EntGetXResbuf(const AppList: AnsiString = ''): Boolean;
var
  pEnt, pApps, pNext, pNew: PResbuf;
  nLen: Integer;
  sBuf, sName: AnsiString;
begin
  FItem.Clear;
  if (AppList <> '') then sBuf := AppList else sBuf := FAppName;
  if sBuf = '' then begin
    pApps := extern_darxNewRbStr(RTSTR, '*');
  end else begin
    pApps := nil;
    pNext := nil;
    repeat
      nLen := AnsiPos(';', sBuf);
      if nLen > 0 then begin
        sName := System.Copy(sBuf, 1, nLen - 1);
        sBuf := System.Copy(sBuf, nLen + 1, Maxint);
      end else begin
        sName := sBuf;
      end;
      if sName = '' then pNew := nil else pNew := extern_darxNewRbStr(RTSTR, PChar(sName));
      if pNew <> nil then begin
        if pApps = nil then pApps := pNew else if pNext <> nil then pNext^.rbnext := pNew;
        pNext := pNew;
      end;
    until (0 >= nLen);
  end;
  try
    pEnt := extern_acdbEntGetX(@FeName, pApps);
    Result := (pEnt <> nil);
    if Result then FItem.Cast(pEnt);
  finally
    extern_acutRelRb(pApps);
  end;
end;

procedure TDEntNameItem.SetAppName(const Value: AnsiString);
var
  lpTmp: Presbuf;
begin
  FAppName := Value;
  if FAppName = '' then exit;
  lpTmp := extern_acdbTblSearch('APPID', PChar(FAppName), 0);
  if lpTmp = nil then begin
    if extern_acdbRegApp(PChar(FAppName)) <> RTNORM then FAppName := '';
  end else begin
    extern_acutRelRb(lpTmp);
  end;
end;

{ TDEntNameItems }

constructor TDEntNameItems.Create;
begin
  inherited Create;
  FItems := TDStrObjNodeList.Create;
end;

destructor TDEntNameItems.Destroy;
begin
  Clear(False);
  FItems.Free;
  inherited Destroy;
end;

function TDEntNameItems.Add(Name: AnsiString; EntNameItem: TDEntNameItem): Integer;
begin
  Result := -1;
  if (Name = '')or(EntNameItem = nil) then exit;
  Result := FItems.AddObject(Name, EntNameItem);
end;

function TDEntNameItems.Add(Name: AnsiString; EntName: Tads_name): Integer;
var
  NewObj: TDEntNameItem;
begin
  Result := -1;
  if (Name = '')or((EntName[0] = 0)and(EntName[1] = 0)) then exit;
  NewObj := TDEntNameItem.Create;
  NewObj.Copy(EntName);
  Result := FItems.AddObject(Name, NewObj);
end;

procedure TDEntNameItems.Clear(EraseRebuf: Boolean = False);
var
  nMax, ni: Integer;
begin
  nMax := FItems.Count - 1;
  for ni := 0 to nMax do begin
    if (FItems.Objects[ni] <> nil) then begin
      if (EraseRebuf) then begin
        if (TDEntNameItem(FItems.Objects[ni]).Item <> nil) then TDEntNameItem(FItems.Objects[ni]).Item.Erase;
      end;
      TDEntNameItem(FItems.Objects[ni]).Free;
    end;
    FItems.Objects[ni] := nil;
  end;
  FItems.Clear;
end;

function TDEntNameItems.Count: Integer;
begin
  Result := FItems.Count;
end;

procedure TDEntNameItems.Delete(Index: Integer; EraseRebuf: Boolean = False);
begin
  if (0 > Index)or(Index >= FItems.Count) then exit;
  if (FItems.Objects[Index] <> nil) then begin
    if (EraseRebuf) then begin
      if (TDEntNameItem(FItems.Objects[Index]).Item <> nil) then TDEntNameItem(FItems.Objects[Index]).Item.Erase;
    end;
    TDEntNameItem(FItems.Objects[Index]).Free;
  end;
  FItems.Objects[Index] := nil;
  FItems.Delete(Index);
end;

procedure TDEntNameItems.Exchange(Index1, Index2: Integer);
begin
  FItems.Exchange(Index1, Index2);
end;

function TDEntNameItems.Find(Name: Ansistring; var Index: Integer): Boolean;
begin
  Index := FItems.IndexOf(Name);
  Result := (Index >= 0);
end;

function TDEntNameItems.IndexOf(Name: Ansistring): Integer;
begin
  Result := FItems.IndexOf(Name);
end;

procedure TDEntNameItems.Insert(Index: Integer; Name: Ansistring; EntName: Tads_name);
var
  NewObj: Pads_name;
begin
  if (EntName[0] <> 0)or(EntName[1] <> 0) then begin
    NewObj := extern_acad_malloc(SizeOf(Tads_name));
    //GetMem(NewObj, SizeOf(Tads_name));
    if NewObj <> nil then NewObj^ := EntName;
  end else begin
    NewObj := nil;
  end;
  FItems.InsertObject(Index, Name, Pointer(NewObj));
end;

procedure TDEntNameItems.Sort;
begin
  FItems.Sort;
end;

procedure TDEntNameItems.Move(CurIndex, NewIndex: Integer);
begin
  FItems.Move(CurIndex, NewIndex);
end;

function TDEntNameItems.EntGetResbuf(Index: Integer): Boolean;
begin
  Result := TDEntNameItem(FItems.Objects[Index]).EntGetResbuf;
end;

function TDEntNameItems.EntGetXResbuf(Index: Integer; const AppList: AnsiString = ''): Boolean;
begin
  Result := TDEntNameItem(FItems.Objects[Index]).EntGetXResbuf(AppList);
end;

function TDEntNameItems.GetName(Index: Integer): AnsiString;
begin
  if (0 > Index)or(Index >= FItems.Count) then begin
    Result := '';
  end else begin
    Result := FItems.Strings[Index];
  end;
end;

function TDEntNameItems.GetItems(Index: Integer): TDEntNameItem;
begin
  if (0 > Index)or(Index >= FItems.Count) then begin
    Result := nil
  end else begin
    Result := TDEntNameItem(FItems.Objects[Index]);
  end;
end;

function TDEntNameItems.GetEntName(Index: Integer): Tads_name;
begin
  if (0 > Index)or(Index >= FItems.Count) then begin
    Result[0] := 0;
    Result[1] := 0;
  end else begin
    Result := TDEntNameItem(FItems.Objects[Index]).eName;
  end;
end;

function TDEntNameItems.GetResbuf(Index: Integer): TDResbufItem;
begin
  if (0 > Index)or(Index >= FItems.Count) then begin
    Result := nil
  end else begin
    if TDEntNameItem(FItems.Objects[Index]).Item.Resbuf = nil then TDEntNameItem(FItems.Objects[Index]).EntGetResbuf;
    Result := TDEntNameItem(FItems.Objects[Index]).Item;
  end;
end;

{ TDArxTblList }

constructor TDArxTblList.Create;
begin
  inherited Create;
  FAppId := nil;
  FBlock := nil;
  FDimStyle := nil;
  FLType := nil;
  FLayer := nil;
  FStyle := nil;
  FUCS := nil;
  FView := nil;
  FGroup := nil;
  FLayout := nil;
  FMLineStyle := nil;
  FPlotSettings := nil;
  FPlotStyleName := nil;
end;

destructor TDArxTblList.Destroy;
begin
  if FAppId <> nil then FAppId.Free;
  if FBlock <> nil then FBlock.Free;
  if FDimStyle <> nil then FDimStyle.Free;
  if FLType <> nil then FLType.Free;
  if FLayer <> nil then FLayer.Free;
  if FStyle <> nil then FStyle.Free;
  if FUCS <> nil then FUCS.Free;
  if FView <> nil then FView.Free;
  if FVPort <> nil then FVPort.Free;
  if FGroup <> nil then FLayer.Free;
  if FLayout <> nil then  FStyle.Free;
  if FMLineStyle <> nil then FUCS.Free;
  if FPlotSettings <> nil then FView.Free;
  if FPlotStyleName <> nil then FVPort.Free;
  inherited Destroy;
end;

procedure TDArxTblList.GetTablesList(TblType: AnsiString; var List: TDEntNameItems);
var
  TblRb, NextRb: PResbuf;
  bufName: Tads_name;
begin
  List.Clear;
  TblRb := extern_acdbTblNext(PChar(TblType), 1);
  while (TblRb <> nil) do begin
    NextRb := TblRb;
    Repeat
      if NextRb^.restype = 2 then begin
        extern_acdbTblObjName(PChar(TblType), NextRb^.resval.rstring, @bufName);
        List.Add(extern_darxPString(NextRb^.resval.rstring), bufName);
        break;
      end;
      NextRb := NextRb^.rbnext;
    Until (NextRb = nil);
    extern_acutRelrb(TblRb);
    TblRb := extern_acdbTblNext(PChar(TblType), 0);
  end;
end;

function TDArxTblList.GetObjectsList(ObjName: AnsiString; var List: TDEntNameItems): Integer;
var
  BaseDict: Tads_name;
  DictRb, NextRb: PResbuf;
  sName: AnsiString;
begin
  Result := 0;
  List.Clear;
  extern_acdbNamedObjDict(@BaseDict);
  DictRb := extern_acdbDictSearch(@BaseDict, PChar(ObjName), 0);
  if (DictRb = nil) then exit;
  NextRb := DictRb;
  while (NextRb <> nil) do begin
    if (NextRb^.restype = 3) then begin
      sName := extern_darxPString(NextRb^.resval.rstring);
    end else if (sName <> '')and(NextRb^.restype = 350) then begin
      List.Add(sName, NextRb^.resval.rlName);
      Inc(Result);
      sName := '';
    end else begin
      sName := '';
    end;
    NextRb := NextRb^.rbnext;
  end;
  extern_acutRelrb(DictRb);
end;

function TDArxTblList.GetAppId: Integer;
begin
  if FAppId = nil then FAppId := TDEntNameItems.Create;
  GetTablesList('APPID', FAppId);
  Result := FAppId.Count;
end;

function TDArxTblList.GetBlock: Integer;
begin
  if FBlock = nil then FBlock := TDEntNameItems.Create;
  GetTablesList('BLOCK', FBlock);
  Result := FBlock.Count;
end;

function TDArxTblList.GetDimStyle: Integer;
begin
  if FDimStyle = nil then FDimStyle := TDEntNameItems.Create;
  GetTablesList('DIMSTYLE', FDimStyle);
  Result := FDimStyle.Count;
end;

function TDArxTblList.GetLtype: Integer;
begin
  if FLType = nil then FLType := TDEntNameItems.Create;
  GetTablesList('LTYPE', FLType);
  Result := FLType.Count;
end;

function TDArxTblList.GetLayer: Integer;
begin
  if FLayer = nil then FLayer := TDEntNameItems.Create;
  GetTablesList('LAYER', FLayer);
  Result := FLayer.Count;
end;

function TDArxTblList.GetStyle: Integer;
begin
  if FStyle = nil then FStyle := TDEntNameItems.Create;
  GetTablesList('STYLE', FStyle);
  Result := FStyle.Count;
end;

function TDArxTblList.GetUCS: Integer;
begin
  if FUCS = nil then FUCS := TDEntNameItems.Create;
  GetTablesList('UCS', FUCS);
  Result := FUCS.Count;
end;

function TDArxTblList.GetView: Integer;
begin
  if FView = nil then FView := TDEntNameItems.Create;
  GetTablesList('VIEW', FView);
  Result := FView.Count;
end;

function TDArxTblList.GetVPort: Integer;
begin
  if FVPort = nil then FVPort := TDEntNameItems.Create;
  GetTablesList('VPORT', FVPort);
  Result := FVPort.Count;
end;

function TDArxTblList.GetGroup: Integer;
begin
  if FGroup = nil then FGroup := TDEntNameItems.Create;
  Result := GetObjectsList('ACAD_GROUP', FGroup);
end;

function TDArxTblList.GetLayout: Integer;
begin
  if FLayout = nil then FLayout := TDEntNameItems.Create;
  Result := GetObjectsList('ACAD_LAYOUT', FLayout);
end;

function TDArxTblList.GetMLineStyle: Integer;
begin
  if FMLineStyle = nil then FMLineStyle := TDEntNameItems.Create;
  Result := GetObjectsList('ACAD_MLINESTYLE', FMLineStyle);
end;

function TDArxTblList.GetPlotSettings: Integer;
begin
  if FPlotSettings = nil then FPlotSettings := TDEntNameItems.Create;
  Result := GetObjectsList('ACAD_PLOTSETTINGS', FPlotSettings);
end;

function TDArxTblList.GetPlotStyleName: Integer;
begin
  if FPlotStyleName = nil then FPlotStyleName := TDEntNameItems.Create;
  Result := GetObjectsList('ACAD_PLOTSTYLE', FPlotStyleName);
end;

{ TDVertexItems }

constructor TDVertexItems.Create;
var
  ni: Integer;
begin
  inherited Create;
  FItems := TDItemNodeList.Create;
  FConstant := False;
  FConstantWidth := 0.0;
  FFlags := 0;
  FCurve := 0;
  for ni := 0 to 3 do FVIndex[ni] := 0;
end;

destructor TDVertexItems.Destroy;
begin
  Clear;
  FItems.Free;
  inherited Destroy;
end;

procedure TDVertexItems.Clear;
var
  nMax, ni: Integer;
begin
  nMax := FITems.Count - 1;
  for ni := 0 to nMax do if FItems.Items[ni] <> nil then extern_acad_free(Pads_vertex(FItems.Items[ni])); // FreeMem
  FItems.Clear;
  FConstant := False;
  FConstantWidth := 0.0;
end;

function TDVertexItems.Count: Integer;
begin
  Result := FITems.Count;
end;

function TDVertexItems.Add(Point: Tads_point; Bulge: Double = 0; StartWidth: Double = 0; EndWidth: Double = 0): Integer;
var
  NewObj: Pads_vertex;
  ni: Integer;
begin
  Result := -1;
  NewObj := extern_acad_malloc(SizeOf(Tads_vertex));
  //GetMem(NewObj, SizeOf(Tads_vertex));
  if NewObj = nil then exit;
  NewObj^.Point := Point;
  NewObj^.Bulge := Bulge;
  NewObj^.StartWidth := StartWidth;
  NewObj^.EndWidth := EndWidth;
  NewObj^.Flags := FFlags;
  NewObj^.Curve := FCurve;
  for ni := 0 to 3 do NewObj^.VIndex[ni] := FVIndex[ni];
  Result := FItems.Add(NewObj);
  if Result >= 0 then begin
    if Result = 0 then begin
      FConstant := (StartWidth = EndWidth);
    end else begin
      FConstant := (StartWidth = EndWidth)and(EndWidth = FConstantWidth);
    end;
    FConstantWidth := EndWidth;
  end else begin
    extern_acad_free(NewObj);
    //FreeMem(NewObj);
  end;
end;

procedure TDVertexItems.Delete(Index: Integer);
begin
  if (0 > Index)or(Index >= FItems.Count) then exit;
  if FItems.Items[Index] <> nil then extern_acad_free(Pads_vertex(FItems.Items[Index]));  // FreeMem
  FItems.Delete(Index);
end;

procedure TDVertexItems.ResetVertex(var Value: Tads_vertex);
var
  ni: Integer;
begin
  acdbPointClear(Value.Point);
  Value.Bulge := 0;
  Value.StartWidth := 0;
  Value.EndWidth := 0;
  Value.Flags := 0;
  Value.Curve := 0;
  for ni := 0 to 3 do Value.VIndex[ni] := 0;
end;

function TDVertexItems.GetVertex(Index: Integer): Tads_vertex;
begin
  if (0 > Index)or(Index >= FItems.Count) then begin
    ResetVertex(Result);
  end else begin
    Result := Pads_vertex(FItems.Items[Index])^;
  end;
end;

procedure TDVertexItems.SetVertex(Index: Integer; Value: Tads_vertex);
begin
  if (0 > Index)or(Index >= FItems.Count) then exit;
  Pads_vertex(FItems.Items[Index])^ := Value;
end;

function TDVertexItems.GetVIndex(Index: Integer): Smallint;
begin
  if (0 > Index)or(Index > 3) then Result := 0 else Result := FVIndex[Index];
end;

procedure TDVertexItems.SetVIndex(Index: Integer; Value: Smallint);
begin
  if (0 > Index)or(Index > 3) then exit;
  FVIndex[Index] := Value;
end;

{ TDCustomEntMake }

constructor TDCustomEntMake.Create;
begin
  inherited Create;
  FItem := TDResbufItem.Create;
  FEntList := TDItemNodeList.Create;
  FEntMakeError := 0;
  FEntBuffer := False;
  FDrawSpace := dsNone;
  FLayer := '';
  FLType := '';
  FColor := -1;
  FLayout := '';
  FLineweight := lwBYLAYER;
  FLtScale := 1.0;
  FDirection[0] := 0.0;
  FDirection[1] := 0.0;
  FDirection[2] := 1.0;
  FVisible := True;
  FAltitude := 0.0;
  FThickness := 0.0;
  FModelerVersion := 1;
end;

destructor TDCustomEntMake.Destroy;
begin
  FEntList.Free;
  FItem.Free;
  inherited Destroy;
end;

function TDCustomEntMake.EntCount: Integer;
begin
  Result := FEntList.Count;
end;

function TDCustomEntMake.AddEntName(EntName: Tads_name): Integer;
var
  pEnt: Pads_name;
begin
  Result := -1;
  if NOT FEntBuffer then exit;
  pEnt := extern_acad_malloc(SizeOf(Tads_name));
  //GetMem(pEnt, SizeOf(Tads_name));
  if pEnt = nil then exit;
  pEnt^[0] := EntName[0];
  pEnt^[1] := EntName[1];
  Result := FEntList.Add(pEnt);
  if 0 > Result then extern_acad_free(pEnt);  // FreeMem
end;

procedure TDCustomEntMake.EntClear;
var
  nMax, ni: Integer;
begin
  nMax := FEntList.Count - 1;
  for ni := 0 to nMax do if (FEntList.Items[ni] <> nil) then extern_acad_free(FEntList.Items[ni]);  // FreeMem
  FEntList.Clear;
  FEntMakeError := 0;
end;

function TDCustomEntMake.GetEntList(Index: Integer): Tads_name;
begin
  if (0 > Index)or(Index >= FEntList.Count)or(FEntList.Items[Index] = nil) then begin
    Result[0] := 0;
    Result[1] := 0;
  end else begin
    Result := Pads_name(FEntList.Items[Index])^;
  end;
end;

procedure TDCustomEntMake.SetEntList(Index: Integer; EntName: Tads_name);
begin
  if (0 > Index)or(Index >= FEntList.Count)or(FEntList.Items[Index] = nil) then exit;
  Pads_name(FEntList.Items[Index])^ := EntName;
end;

procedure TDCustomEntMake.SetEntBuffer(Value: Boolean);
begin
  EntClear;
  FEntBuffer := Value;
end;

procedure TDCustomEntMake.SetColor(const Value: Smallint);
begin
  if (Value >= 0)and(256 >= Value) then FColor := Value else FColor := -1;
end;

procedure TDCustomEntMake.SetLineweight(const Value: Smallint);
begin
  if (Value >= lwDEFAULT) then FLineweight := Value;
end;

function TDCustomEntMake.StartEntMake: Boolean;
begin
{$IFDEF DARXDEBUG}
  AdsDebug.darx_DebugResBuf('TDCustomEntMake.StartEntMake', FItem.Resbuf);
{$ENDIF}
  FEntMakeError := FItem.EntMake;
  Result := (FEntMakeError = RTNORM);
  if NOT Result then exit;
  FItem.Clear;
end;

function TDCustomEntMake.StartEntMakeX: Boolean;
begin
{$IFDEF DARXDEBUG}
  AdsDebug.darx_DebugResBuf('TDCustomEntMake.StartEntMakeX', FItem.Resbuf);
{$ENDIF}
  FEntMakeError := FItem.EntMakeX(FLastName);
  Result := (FEntMakeError = RTNORM);
  if NOT Result then exit;
  AddEntName(FLastName);
  FItem.Clear;
end;

function TDCustomEntMake.StartEntMakeXKeyword: AnsiString;
var
  pBuf: array[0..RESULTLENMAX]of Char;
begin
  Result := '';
{$IFDEF DARXDEBUG}
  AdsDebug.darx_DebugResBuf('TDCustomEntMake.StartEntMakeXKeyword', FItem.Resbuf);
{$ENDIF}
  FEntMakeError := FItem.EntMakeX(FLastName);
  if (FEntMakeError <> RTKWORD) then exit;
  AddEntName(FLastName);
  FItem.Clear;
  pBuf[0] := #0;
  if (extern_acedGetInput(PChar(@pBuf[0])) = RTNORM) then Result := extern_darxPString(PChar(@pBuf[0]));
end;

function TDCustomEntMake.SetEntLast: Boolean;
begin
  FEntMakeError := extern_acdbEntLast(@FLastName);
  Result := (FEntMakeError = RTNORM);
  if NOT Result then exit;
  AddEntName(FLastName);
end;

procedure TDCustomEntMake.SetCommonProperty;
begin
  case FDrawSpace of
  dsModel: FItem.Add(67, 0);
  dsPaper: FItem.Add(67, 1);
  end;
  if (FLayer <> '') then FItem.Add(8, FLayer);
  if (FLType <> '') then FItem.Add(6, FLType);
  if (FLayout <> '') then FItem.Add(410, FLayout);
  if (FColor >= 0) then FItem.Add(62, FColor);
  if (FLineweight <> lwBYLAYER) then FItem.Add(370, FLineweight);
  if (FLtScale <> 1) then FItem.Add(48, FLtScale);
  if (FDirection[0] <> 0)or(FDirection[1] <> 0)or(FDirection[2] <> 1) then FItem.Add(210, FDirection);
  if (NOT FVisible) then FItem.Add(60, 1);
end;

procedure TDCustomEntMake.SetCommonPropEntity;
begin
  Item.Add(100, 'AcDbEntity');
  SetCommonProperty;
end;

end.
