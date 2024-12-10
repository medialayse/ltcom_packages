unit EntsUnit;

interface

uses
	Windows, SysUtils;

function MakesEntities(const MakesEntName: String): Boolean;

implementation

uses
	DArxH, DArxAds, DArxEnts, DArxApi;

////////////////////////////////////////////////////////////////////////////////

// ３Ｄフェイス作成例
function Samp3DFace: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  HideFlags: Smallint;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Vertex1 := ads_point(100.0, 100.0,   0.0);                // (10)１番目の頂点
  Vertex2 := ads_point(150.0, 100.0,   0.0);                // (11)２番目の頂点
  Vertex3 := ads_point(200.0, 200.0, 100.0);                // (12)３番目の頂点
  Vertex4 := ads_point(100.0, 200.0,  50.0);                // (13)４番目の頂点
  HideFlags := 0;                                           // (70)非表示エッジフラグ
	Result := SampEntMake.E3DFace(Vertex1, Vertex2, Vertex3, Vertex4, HideFlags);
  SampEntMake.Free;
end;

// ３Ｄソリッド作成例
function Samp3DSolid: Boolean;
var
	sACIS: String;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  sACIS := 'koo mj n o          '#13#10'h J1410(1 nl ^\VL kqoqm QK mk R01 [:< nn nhenoelm mooo '#13#10
					 + 'rn fqfffffffffffffffj:rooh n:rono '#13#10'=0;& {rn {n {rn {rn |'#13#10
					 + '3*2/ {rn {rn {m {o |'#13#10',7:33 {rn {rn {rn {l {rn {n |'#13#10
					 + '9><: {rn {k {j {m {rn {i 90-(>-; ,6183: |'#13#10'9><: {rn {h {g {m {rn {f 90-(>-; ,6183: |'#13#10
					 + '300/ {rn {no {nn {l |'#13#10'<01:r,*-9><: {rn jo jo jo o o n ko o o n V V o n ko 90-(>-; V V V V |'#13#10
					 + '9><: {rn {rn {nm {m {rn {nl 90-(>-; ,6183: |'#13#10'300/ {rn {rn {nk {k |'#13#10
					 + '/3>1:r,*-9><: {rn jo jo o o o rn rn o o 90-(>-;@) V V V V |'#13#10'300/ {rn {rn {nj {l |'#13#10
					 + '<0:;8: {rn {nn {nn {nk {ni -:):-,:; {j {rn |'#13#10'300/ {rn {rn {nh {h |'#13#10
					 + '/3>1:r,*-9><: {rn jo jo noo o o n n o o 90-(>-;@) V V V V |'#13#10
					 + '<0:;8: {rn {nk {nk {nn {ni 90-(>-; {g {rn |'#13#10'<0:;8: {rn {nj {nj {nh {ng -:):-,:; {no {rn |'#13#10
					 + ':;8: {rn {nf {nf {nk {mo 90-(>-; |'#13#10'<0:;8: {rn {nh {nh {nj {ng 90-(>-; {nm {rn |'#13#10
					 + ':;8: {rn {mn {mn {nh {mm 90-(>-; |'#13#10'):-+:'#39' {rn {ni {ml |'#13#10
					 + ':336/,:r<*-): {rn jo jo o o o rn ko o o n V V |'#13#10'):-+:'#39' {rn {ng {mk |'#13#10
					 + ':336/,:r<*-): {rn jo jo noo o o n ko o o n V V |'#13#10'/061+ {rn fo jo o |'#13#10'/061+ {rn fo jo noo |';
           // (1)ACIS形式のモデラ文字列
	Result := SampEntMake.E3DSolid(sACIS);
  SampEntMake.Free;
end;

// 円弧作成例
function SampArc: Boolean;
var
  Center: Tads_point;
  Radius, startAngle, endAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center     := ads_point(100.0, 100.0, 0.0);  							// (10)中心
  Radius     := 50.0;                          							// (40)半径
  startAngle := 0.0;                           							// (50)開始角度
  endAngle   := PI;                          								// (51)終了角度
	Result := SampEntMake.Arc(Center, Radius, startAngle, endAngle);
  SampEntMake.Free;
end;

// 属性定義作成例
function SampAttDef: Boolean;
var
  position: Tads_point;
  Str, Prompt, Tag: String;
  Height, Rotation: Double;
  AttFlag: Smallint;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  position := ads_point(100.0, 100.0, 0.0);                 // (10)第１位置合わせ点
  Str      := 'Samp';                                       // (1)文字列
  Height   := 6.0;                                          // (40)文字の高さ
  Rotation := 0.0;                                          // (50)文字の回転角度
  Prompt   := 'SampPrompt';                                 // (3)プロンプト文字列
  Tag      := 'SampAttDef';                                 // (2)属性名称文字列
  AttFlag  := 0;                                            // (70)属性フラグ
  SampEntMake.AttJustify := tjAlign;                        // (72)水平方向の文字位置合わせタイプ
  Result := SampEntMake.AttDef(position, Str, Height, Rotation, Prompt, Tag, AttFlag);
  SampEntMake.Free;
end;

// 属性作成例
function SampAttRib: Boolean;
var
  BlockName: String;
  InsertPt: Tads_point;
  Flags: Smallint;
  position, alignmentPoint: Tads_point;
  Str, Prompt, Tag: String;
  Height, Rotation: Double;
  AttFlag: Smallint;
  Angle: Double;
  SeqFlags: Boolean;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    // 内部ブロックを作成し、属性定義を含める
    BlockName := 'AttRibBlock';                          			// (2)ブロック名
    InsertPt := ads_point(0.0, 0.0, 0.0);                     // (10)挿入基点
    Flags := 0;                                               // (70)ブロックタイプフラグ
    // ブロックの作成開始
    SampEntMake.MakeBlock(BlockName, InsertPt, Flags);
    position       := ads_point(100.0, 100.0, 0.0);           // (10)第１位置合わせ点
    Str            := 'Block string';                         // (1)文字列
    Height         := 6.0;                                    // (40)文字の高さ
    Rotation       := 0.0;                                    // (50)文字の回転角度
    Prompt         := 'SampPrompt';                           // (3)プロンプト文字列
    Tag            := 'SampleTag';                            // (2)属性名称文字列
    AttFlag        := 0;                                      // (70)属性フラグ
    Result := SampEntMake.AttDef(position, Str, Height, Rotation, Prompt, Tag, AttFlag);
    if NOT Result then exit;
    // ブロックを作成し、作成されたブロック名を返す
    BlockName := SampEntMake.EndBlock;                        // (2)ブロック名
		// ブロックの挿入処理
    position  := ads_point(100.0, 100.0, 0.0);                // (10)挿入点
    Angle     := 0.0;                                         // (50)回転角度
    SeqFlags  := True;                                        // (66)可変後続属性フラグ
    Result := SampEntMake.Insert(BlockName, position, Angle, SeqFlags);
    if NOT Result then exit;
    position       := ads_point(100.0, 100.0, 0.0);           // (10)第１位置合わせ点
    Str            := 'SampleSampleSample';                   // (1)文字列
    alignmentPoint := ads_point(200.0, 200.0, 0.0);           // (11)第２位置合わせ点
    Height         := 0.0;                                    // (40)文字の高さ
    Rotation       := 0.0;                                    // (50)文字の回転角度
    Tag            := 'tag';                                  // (2)属性名称(文字列)
    AttFlag        := 0;                                      // (70)属性フラグ
    SampEntMake.AttJustify := tjAlign;                        // (72)水平方向の文字位置合わせタイプ
    Result := SampEntMake.AttRib(position, Str, alignmentPoint, Height, Rotation, Tag, AttFlag);
    if NOT Result then exit;
    // ブロック挿入後のSEQENDを付加
    Result := SampEntMake.SeqEnd;
  finally
	  SampEntMake.Free;
  end;
end;

// ボディ作成例
function SampBody: Boolean;
var
	sACIS: String;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  sACIS := 'koo mj n o          '#13#10'h J1410(1 nl ^\VL kqoqm QK mk R01 [:< nn nhenoelm mooo '#13#10
					 + 'rn fqfffffffffffffffj:rooh n:rono '#13#10'=0;& {rn {n {rn {rn |'#13#10
					 + '3*2/ {rn {rn {m {o |'#13#10',7:33 {rn {rn {rn {l {rn {n |'#13#10
					 + '9><: {rn {k {j {m {rn {i 90-(>-; ,6183: |'#13#10'9><: {rn {h {g {m {rn {f 90-(>-; ,6183: |'#13#10
					 + '300/ {rn {no {nn {l |'#13#10'<01:r,*-9><: {rn jo jo jo o o n ko o o n V V o n ko 90-(>-; V V V V |'#13#10
					 + '9><: {rn {rn {nm {m {rn {nl 90-(>-; ,6183: |'#13#10'300/ {rn {rn {nk {k |'#13#10
					 + '/3>1:r,*-9><: {rn jo jo o o o rn rn o o 90-(>-;@) V V V V |'#13#10'300/ {rn {rn {nj {l |'#13#10
					 + '<0:;8: {rn {nn {nn {nk {ni -:):-,:; {j {rn |'#13#10'300/ {rn {rn {nh {h |'#13#10
					 + '/3>1:r,*-9><: {rn jo jo noo o o n n o o 90-(>-;@) V V V V |'#13#10
					 + '<0:;8: {rn {nk {nk {nn {ni 90-(>-; {g {rn |'#13#10'<0:;8: {rn {nj {nj {nh {ng -:):-,:; {no {rn |'#13#10
					 + ':;8: {rn {nf {nf {nk {mo 90-(>-; |'#13#10'<0:;8: {rn {nh {nh {nj {ng 90-(>-; {nm {rn |'#13#10
					 + ':;8: {rn {mn {mn {nh {mm 90-(>-; |'#13#10'):-+:'#39' {rn {ni {ml |'#13#10
					 + ':336/,:r<*-): {rn jo jo o o o rn ko o o n V V |'#13#10'):-+:'#39' {rn {ng {mk |'#13#10
					 + ':336/,:r<*-): {rn jo jo noo o o n ko o o n V V |'#13#10'/061+ {rn fo jo o |'#13#10'/061+ {rn fo jo noo |';
           // (1)ACIS形式のモデラ文字列
	Result := SampEntMake.Body(sACIS);
  SampEntMake.Free;
end;

// 円作成例
function SampCircle: Boolean;
var
  Center: Tads_point;
  Radius: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center := ads_point(140.0, 100.0, 0.0);  									// (10)中心
  Radius := 50.0;                          									// (40)半径
	Result := SampEntMake.Circle(Center, Radius);
  SampEntMake.Free;
end;

// 楕円作成例
function SampEllipse: Boolean;
var
  Center, majorAxis: Tads_point;
  radiusRatio, startAngle, endAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center      := ads_point(100.0, 100.0, 0.0);              // (10)中心点
  majorAxis   := ads_point( 50.0,  50.0, 0.0);              // (11)中心に対する相対位置
  radiusRatio := 0.5;                                       // (40)主軸に対する副軸の比
  startAngle  := 0.0;                                       // (41)開始角度
  endAngle    := PI * 2;                                    // (42)終了角度
	Result := SampEntMake.Ellipse(Center, majorAxis, radiusRatio, startAngle, endAngle);
  SampEntMake.Free;
end;

// イメージアタッチ作成例
function SampImage: Boolean;
var
  FileName: String;
	Vertex: Tads_point;
  Scale, Angle: Double;
	SampEntMake: TDArxEntMake;
begin
	Result := False;
  if acedGetFileDialog('Select Images', '', '', 0, FileName) <> RTNORM then exit; // ファイル名
  SampEntMake := TDArxEntMake.Create;
  Vertex := ads_point(100.0, 100.0, 0.0);                   // 挿入点
  Scale := 100.0;                                           // 尺度
  Angle := 20.0;                                            // 角度
  SampEntMake.ImageLight    := 80;                          // 明るさの値
  SampEntMake.ImageContrast := 70;                          // コントラストの値
  SampEntMake.ImageScumble  := 40;                          // フェード値
  Result := SampEntMake.ImageAttach('', FileName, Vertex, Scale, Angle);
  SampEntMake.Free;
end;

////////////////////////////////////////////////////////////////////////////////

// ブロック挿入例
function SampInsert: Boolean;
var
  BlockName: String;
  Flags: Smallint;
	stPos: Tads_point;
  nextPos: array[0..3] of Tads_point;
  position: Tads_point;
  Angle: Double;
  SeqFlags: Boolean;
  SampEntMake: TDArxEntMake;
begin
  Result := False;
  SampEntMake := TDArxEntMake.Create;
  try
    BlockName := 'W';                                         // ブロック名
    Flags     := 0;                                           // ブロックタイプフラグ
    if not SampEntMake.MakeBlock(BlockName, Flags) then exit;
    stPos := ads_point(50.0, 200.0, 0.0);
    nextPos[0] := ads_point(100.0,  50.0, 0.0);
    nextPos[1] := ads_point(150.0, 200.0, 0.0);
    nextPos[2] := ads_point(200.0,  50.0, 0.0);
    nextPos[3] := ads_point(250.0, 200.0, 0.0);
    if not SampEntMake.Line(stPos, nextPos) then exit;
    // BLOCKの終了
    BlockName := SampEntMake.EndBlock;                        // ブロック名
    position  := ads_point(50.0, 50.0, 0.0);                  // 挿入点
    Angle     := 0.0;                                         // 回転角度
    SeqFlags  := False;                                       // 可変後続属性フラグ
    Result := SampEntMake.Insert(BlockName, position, Angle, SeqFlags);
  finally
    SampEntMake.Free;
  end;
end;

// 引出線作成例
function SampLeader: Boolean;
var
  Vertex1, Vertex2: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point(100.0, 100.0, 0.0);                  // 頂点の座標
    Vertex2 := ads_point(200.0, 200.0, 0.0);                  // 頂点の座標
	  Result := SampEntMake.Leader(Vertex1, Vertex2);
  finally
    SampEntMake.Free;
  end;
end;

// 線分作成例
function SampLine: Boolean;
var
  startPos, endPos: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    startPos := ads_point(100.0, 100.0, 0.0);  								// 始点
    endPos   := ads_point(200.0, 200.0, 0.0);  								// 終点
	  Result := SampEntMake.Line(startPos, endPos);
  finally
    SampEntMake.Free;
  end;
end;

// ライトウェイトポリライン作成例
function SampLWPolyLine: Boolean;
var
  Point: Tads_point;
  Bulge, StartWidth, EndWidth: Double;
  Closed, Pattern: Boolean;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    SampEntMake.MakeVertex;
    Point      := ads_point(110.0, 110.0, 0.0);               // 頂点
    Bulge      := 0.0;                                        // ふくらみ
    StartWidth := 5.0;                                        // 開始幅
    EndWidth   := 3.0;                                        // 終了幅
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(160.0, 160.0, 0.0);
    Bulge      := 0.0;
    StartWidth := 3.0;
    EndWidth   := 1.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(210.0, 110.0, 0.0);
    Bulge      := 0.0;
    StartWidth := 1.0;
    EndWidth   := 5.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Closed  := True;                                          // ポリラインフラグ
    Pattern := False;                                         // ポリラインフラグ
	  Result := SampEntMake.LWPolyLine(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// マルチライン作成例
//function SampMLine: Boolean;

// マルチテキスト作成例
function SampMText: Boolean;
var
  position: Tads_point;
  Str: String;
  Height, RectWidth: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position  := ads_point(100.0, 100.0, 0.0);								// 挿入点
    Str       := 'SAMPLE\Psample';                            // テキスト文字列
    Height    := 50.0;                                        // 規準の文字高さ
    RectWidth := 300.0;                                       // 参照矩形の幅
	  Result := SampEntMake.MText(position, Str, Height, RectWidth);
  finally
    SampEntMake.Free;
  end;
end;

// OLEフレーム作成例
//function SampOLEFrame: Boolean;

// 点作成例
function SampPoint: Boolean;
var
  position: Tads_point;
  userAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position  := ads_point(100.0, 100.0, 0.0);                // 点の位置
    userAngle := 0.0;                                         // 点を作図したときに有効だった、UCS の X 軸の角度
	  Result := SampEntMake.Point(position, userAngle);
  finally
    SampEntMake.Free;
  end;
end;

// ２Ｄポリライン作成例
function Samp2DPolyline: Boolean;
var
  Point: Tads_point;
  Bulge, StartWidth, EndWidth: Double;
  Closed, Pattern: Boolean;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    SampEntMake.MakeVertex;
    Point      := ads_point(100.0, 100.0, 0.0);               // 頂点
    Bulge      := 0.0;                                        // ふくらみ
    StartWidth := 5.0;                                        // 開始幅
    EndWidth   := 3.0;                                        // 終了幅
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(150.0, 150.0, 0.0);
    Bulge      := 0.0;
    StartWidth := 3.0;
    EndWidth   := 1.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(200.0, 100.0, 0.0);
    Bulge      := 0.0;
    StartWidth := 1.0;
    EndWidth   := 5.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Closed  := True;                                          // ポリラインフラグ
    Pattern := False;                                         // ポリラインフラグ
	  Result := SampEntMake.M2DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// ３Ｄポリライン作成例
function Samp3DPolyline: Boolean;
var
  Point: Tads_point;
  Bulge, StartWidth, EndWidth: Double;
  Closed, Pattern: Boolean;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    SampEntMake.MakeVertex;
    Point      := ads_point(100.0, 100.0, 10.0);               	// 頂点
    Bulge      := 0.0;                      	                  // ふくらみ
    StartWidth := 5.0;                        	                // 開始幅
    EndWidth   := 3.0;                          	              // 終了幅
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(150.0, 150.0, -20.0);
    Bulge      := 0.0;
    StartWidth := 3.0;
    EndWidth   := 1.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(200.0, 100.0, 40.0);
    Bulge      := 0.0;
    StartWidth := 1.0;
    EndWidth   := 5.0;
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Closed  := True;                                          // ポリラインフラグ
    Pattern := False;                                         // ポリラインフラグ
	  Result := SampEntMake.M3DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// 放射線作成例
function SampRay: Boolean;
var
  basePoint, unitVector: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    basePoint  := ads_point(100.0, 100.0, 0.0);               // 始点
    unitVector := ads_point(  0.7,   0.7, 0.0);               // 単位方向ベクトル
    Result := SampEntMake.Ray(basePoint, unitVector);
  finally
    SampEntMake.Free;
  end;
end;

// リージョン作成例
function SampRegion: Boolean;
var
  sACIS: String;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    sACIS := 'koo mn n o          '#13#10'h J1410(1 nl ^ \VL kqoqm QK mk R01 U>1 og nhengelf moon '#13#10
					+ 'rn fqfffffffffffffffj:rooh n:rono '#13#10'=0;& {rn {n {rn {rn |'#13#10'3*2/ {rn {rn {m {o |'#13#10
					+ ',7:33 {rn {rn {rn {l {rn {n |'#13#10'9><: {rn {rn {k {m {rn {j 90-(>-; ;0*=3: 0*+ |'#13#10
					+ '300/ {rn {rn {i {l |'#13#10
					+ '/3>1:r,*-9><: {rn mghqmmmihinlhkojmk nikqljgnmliihilggf o o o n n o o 90-(>-;@) V V V V |'#13#10
					+ '<0:;8: {rn {h {g {rn {f -:):-,:; {k {rn |'#13#10'<0:;8: {rn {g {i {rn {no -:):-,:; {k {rn |'#13#10
					+ '<0:;8: {rn {i {h {rn {nn -:):-,:; {k {rn |'#13#10
					+ ':;8: {rn {nm {nl {i {nk 90-(>-; |'#13#10':;8: {rn {nj {nm {h {ni 90-(>-; |'#13#10
					+ ':;8: {rn {nl {nj {g {nh 90-(>-; |'#13#10
					+ '):-+:'#39' {rn {f {ng |'#13#10'):-+:'#39' {rn {f {nf |'#13#10
					+ ',+->687+r<*-): {rn mhjqmolofmfjoklkmn nklqoimfmgfjfoghlk o roqjgnikjilnhgllmggk oqgnlkkmmgffngmokkk o V V |'#13#10
					+ '):-+:'#39' {rn {nn {mo |'#13#10
					+ ',+->687+r<*-): {rn lknqghhhiojfohgkij nikqnlnjhfmgjgkmfm o roqfjljmhmkniffjjmoj roqlonloignfmihohgh o V V |'#13#10
					+ ',+->687+r<*-): {rn mkkqjghnhkghoffifl ngjqghfgimhjhfgikm o oqfhjfnkoigfihlmnif roqmngnjjmgghoggjfln o V V |'#13#10
					+ '/061+ {rn mhjqmolofmfjoklkmn nklqoimfmgfjfoghlk o |'#13#10
					+ '/061+ {rn mkkqjghnhkghoffifl ngjqghfgimhjhfgikm o |'#13#10
					+ '/061+ {rn lknqghhhiojfohgkij nikqnlnjhfmgjgkmfm o |';
          // (1)ACIS形式のモデラ文字列
	  Result := SampEntMake.Region(sACIS);
  finally
    SampEntMake.Free;
  end;
end;

// シェイプ作成例
//function SampShape: Boolean;

// 2D塗り潰し作成例
function SampSolid: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point(100.0,  50.0, 0.0);                  // １番目のコーナー
    Vertex2 := ads_point(150.0,  50.0, 0.0);                  // ２番目のコーナー
    Vertex3 := ads_point( 50.0, 100.0, 0.0);                  // ３番目のコーナー
    Vertex4 := ads_point(200.0, 100.0, 0.0);                  // ４番目のコーナー
	  Result := SampEntMake.Solid(Vertex1, Vertex2, Vertex3, Vertex4);
  finally
    SampEntMake.Free;
  end;
end;

// スプライン作成例
//function SampSpline: Boolean;

// 文字作成例
function SampText: Boolean;
var
  position: Tads_point;
  Str: String;
  Height, Rotation: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position := ads_point(50.0, 50.0, 0.0);  									// 第１位置合わせ点
    Str      := 'SAMPLE';                    									// 文字列
    Height   := 50.0;                        									// 文字の高さ
    Rotation := 1.57;                        									// 文字の回転角度
	  Result := SampEntMake.Text(position, Str, Height, Rotation);
  finally
    SampEntMake.Free;
  end;
end;

// 幾何公差作成例
function SampTolerance: Boolean;
var
  DimName, Str: String;
  Location: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    DimName  := 'Tolerance';                                  // 寸法スタイル名
    Str      := 'ToleranceSample';                            // 文字列
    Location := ads_point(100.0, 100.0, 0.0);                 // 挿入点
	  Result := SampEntMake.Tolerance(DimName, Str, Location);
  finally
    SampEntMake.Free;
  end;
end;

// 太線作成例
function SampTrace: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point( 50.0,  50.0, 0.0);                  // １番目のコーナー
    Vertex2 := ads_point(200.0,  50.0, 0.0);                  // ２番目のコーナー
    Vertex3 := ads_point(100.0, 100.0, 0.0);                  // ３番目のコーナー
    Vertex4 := ads_point(150.0, 100.0, 0.0);                  // ４番目のコーナー
	  Result := SampEntMake.Trace(Vertex1, Vertex2, Vertex3, Vertex4);
  finally
    SampEntMake.Free;
  end;
end;

// 頂点作成例
function SampVertex: Boolean;
var
  Point: Tads_point;
  Bulge, StartWidth, EndWidth: Double;
  Closed, Pattern: Boolean;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    SampEntMake.MakeVertex;
    Point      := ads_point(100.0, 100.0, 0.0);               // 頂点
    Bulge      := 0.0;                                        // ふくらみ
    StartWidth := 1.0;                                        // 開始幅
    EndWidth   := 5.0;                                        // 終了幅
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(200.0, 200.0, 0.0);               // 頂点
    Bulge      := 0.0;                                        // ふくらみ
    StartWidth := 5.0;                                        // 開始幅
    EndWidth   := 1.0;                                        // 終了幅
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Closed  := True;                                          // ポリラインフラグ
    Pattern := False;                                         // ポリラインフラグ
    Result := SampEntMake.M3DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// ビューポート作成例
//function SampViewPort: Boolean;

// 構築線作成例
function SampXLine: Boolean;
var
  basePoint, unitVector: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    basePoint  := ads_point(100.0, 100.0, 0.0);               // 基点
    unitVector := ads_point(  1.0,   0.0, 0.0);               // 単位方向ベクトル
	  Result := SampEntMake.XLine(basePoint, unitVector);
  finally
    SampEntMake.Free;
  end;
end;

////////////////////////////////////////////////////////////////////////////////

const
	ENTSAMPNAMES: array[0..31]of String = (
  	'3DFACE', '3DSOLID', 'ARC', 'ATTDEF', 'ATTRIB', 'BODY', 'CIRCLE',
    'DIMENSION', 'ELLIPSE', 'HATCH', 'IMAGE', 'INSERT', 'LEADER',
    'LINE', 'LWPOLYLINE', 'MLINE', 'MTEXT', 'OLEFRAME', 'POINT',
    '2DPOLYLINE', '3DPOLYLINE', 'RAY', 'REGION', 'SHAPE', 'SOLID', 'SPLINE',
    'TEXT', 'TOLERANCE', 'TRACE', 'VERTEX', 'VIEWPORT', 'XLINE'
	);

function MakesEntities(const MakesEntName: String): Boolean;
var
	nMax, ni, nEnt: Integer;
  sBuf: String;
  rRet: Boolean;
begin
	if MakesEntName = '?' then begin
    Result := False;
  	nEnt := 0;
    sBuf := '';
    nMax := High(ENTSAMPNAMES);
    for ni := 0 to nMax do begin
    	Inc(nEnt);
      sBuf := sBuf + '  ' + ENTSAMPNAMES[ni];
      if nEnt > 5 then begin
				acutPrintf(#13#10 + sBuf);
        sBuf := '';
        nEnt := 0;
      end;
    end;
    if sBuf = '' then exit;
		acutPrintf(#13#10 + sBuf);
  end else begin
    nEnt := -1;
    nMax := High(ENTSAMPNAMES);
    for ni := 0 to nMax do begin
      if AnsiCompareText(MakesEntName, ENTSAMPNAMES[ni]) = 0 then begin
        nEnt := ni;
        break;
      end;
    end;
    Result := (nEnt >= 0);
    if NOT Result then exit;
    rRet := False;
    case nEnt of
    0: rRet := Samp3DFace;
    1: rRet := Samp3DSolid;
    2: rRet := SampArc;
    3: rRet := SampAttDef;
    4: rRet := SampAttRib;
    5: rRet := SampBody;
    6: rRet := SampCircle;
    // DIMENSION
    8: rRet := SampEllipse;
    // HATCH
    10: rRet := SampImage;
    11: rRet := SampInsert;
    12: rRet := SampLeader;
    13: rRet := SampLine;
    14: rRet := SampLWPolyLine;
    // MLINE
    16: rRet := SampMText;
    // OLEFRAME
    18: rRet := SampPoint;
    19: rRet := Samp2DPolyline;
    20: rRet := Samp3DPolyline;
    21: rRet := SampRay;
    22: rRet := SampRegion;
    // SHAPE
    24: rRet := SampSolid;
    // SPLINE
    26: rRet := SampText;
    27: rRet := SampTolerance;
    28: rRet := SampTrace;
    29: rRet := SampVertex;
    // VIEWPORT
    31: rRet := SampXLine;
    end;
    if NOT rRet then beep;
  end;
end;

end.



