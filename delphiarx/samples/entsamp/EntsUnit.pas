unit EntsUnit;

interface

uses
	Windows, SysUtils;

function MakesEntities(const MakesEntName: String): Boolean;

implementation

uses
	DArxH, DArxAds, DArxEnts, DArxApi;

////////////////////////////////////////////////////////////////////////////////

// �R�c�t�F�C�X�쐬��
function Samp3DFace: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  HideFlags: Smallint;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Vertex1 := ads_point(100.0, 100.0,   0.0);                // (10)�P�Ԗڂ̒��_
  Vertex2 := ads_point(150.0, 100.0,   0.0);                // (11)�Q�Ԗڂ̒��_
  Vertex3 := ads_point(200.0, 200.0, 100.0);                // (12)�R�Ԗڂ̒��_
  Vertex4 := ads_point(100.0, 200.0,  50.0);                // (13)�S�Ԗڂ̒��_
  HideFlags := 0;                                           // (70)��\���G�b�W�t���O
	Result := SampEntMake.E3DFace(Vertex1, Vertex2, Vertex3, Vertex4, HideFlags);
  SampEntMake.Free;
end;

// �R�c�\���b�h�쐬��
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
           // (1)ACIS�`���̃��f��������
	Result := SampEntMake.E3DSolid(sACIS);
  SampEntMake.Free;
end;

// �~�ʍ쐬��
function SampArc: Boolean;
var
  Center: Tads_point;
  Radius, startAngle, endAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center     := ads_point(100.0, 100.0, 0.0);  							// (10)���S
  Radius     := 50.0;                          							// (40)���a
  startAngle := 0.0;                           							// (50)�J�n�p�x
  endAngle   := PI;                          								// (51)�I���p�x
	Result := SampEntMake.Arc(Center, Radius, startAngle, endAngle);
  SampEntMake.Free;
end;

// ������`�쐬��
function SampAttDef: Boolean;
var
  position: Tads_point;
  Str, Prompt, Tag: String;
  Height, Rotation: Double;
  AttFlag: Smallint;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  position := ads_point(100.0, 100.0, 0.0);                 // (10)��P�ʒu���킹�_
  Str      := 'Samp';                                       // (1)������
  Height   := 6.0;                                          // (40)�����̍���
  Rotation := 0.0;                                          // (50)�����̉�]�p�x
  Prompt   := 'SampPrompt';                                 // (3)�v�����v�g������
  Tag      := 'SampAttDef';                                 // (2)�������̕�����
  AttFlag  := 0;                                            // (70)�����t���O
  SampEntMake.AttJustify := tjAlign;                        // (72)���������̕����ʒu���킹�^�C�v
  Result := SampEntMake.AttDef(position, Str, Height, Rotation, Prompt, Tag, AttFlag);
  SampEntMake.Free;
end;

// �����쐬��
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
    // �����u���b�N���쐬���A������`���܂߂�
    BlockName := 'AttRibBlock';                          			// (2)�u���b�N��
    InsertPt := ads_point(0.0, 0.0, 0.0);                     // (10)�}����_
    Flags := 0;                                               // (70)�u���b�N�^�C�v�t���O
    // �u���b�N�̍쐬�J�n
    SampEntMake.MakeBlock(BlockName, InsertPt, Flags);
    position       := ads_point(100.0, 100.0, 0.0);           // (10)��P�ʒu���킹�_
    Str            := 'Block string';                         // (1)������
    Height         := 6.0;                                    // (40)�����̍���
    Rotation       := 0.0;                                    // (50)�����̉�]�p�x
    Prompt         := 'SampPrompt';                           // (3)�v�����v�g������
    Tag            := 'SampleTag';                            // (2)�������̕�����
    AttFlag        := 0;                                      // (70)�����t���O
    Result := SampEntMake.AttDef(position, Str, Height, Rotation, Prompt, Tag, AttFlag);
    if NOT Result then exit;
    // �u���b�N���쐬���A�쐬���ꂽ�u���b�N����Ԃ�
    BlockName := SampEntMake.EndBlock;                        // (2)�u���b�N��
		// �u���b�N�̑}������
    position  := ads_point(100.0, 100.0, 0.0);                // (10)�}���_
    Angle     := 0.0;                                         // (50)��]�p�x
    SeqFlags  := True;                                        // (66)�ό㑱�����t���O
    Result := SampEntMake.Insert(BlockName, position, Angle, SeqFlags);
    if NOT Result then exit;
    position       := ads_point(100.0, 100.0, 0.0);           // (10)��P�ʒu���킹�_
    Str            := 'SampleSampleSample';                   // (1)������
    alignmentPoint := ads_point(200.0, 200.0, 0.0);           // (11)��Q�ʒu���킹�_
    Height         := 0.0;                                    // (40)�����̍���
    Rotation       := 0.0;                                    // (50)�����̉�]�p�x
    Tag            := 'tag';                                  // (2)��������(������)
    AttFlag        := 0;                                      // (70)�����t���O
    SampEntMake.AttJustify := tjAlign;                        // (72)���������̕����ʒu���킹�^�C�v
    Result := SampEntMake.AttRib(position, Str, alignmentPoint, Height, Rotation, Tag, AttFlag);
    if NOT Result then exit;
    // �u���b�N�}�����SEQEND��t��
    Result := SampEntMake.SeqEnd;
  finally
	  SampEntMake.Free;
  end;
end;

// �{�f�B�쐬��
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
           // (1)ACIS�`���̃��f��������
	Result := SampEntMake.Body(sACIS);
  SampEntMake.Free;
end;

// �~�쐬��
function SampCircle: Boolean;
var
  Center: Tads_point;
  Radius: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center := ads_point(140.0, 100.0, 0.0);  									// (10)���S
  Radius := 50.0;                          									// (40)���a
	Result := SampEntMake.Circle(Center, Radius);
  SampEntMake.Free;
end;

// �ȉ~�쐬��
function SampEllipse: Boolean;
var
  Center, majorAxis: Tads_point;
  radiusRatio, startAngle, endAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  Center      := ads_point(100.0, 100.0, 0.0);              // (10)���S�_
  majorAxis   := ads_point( 50.0,  50.0, 0.0);              // (11)���S�ɑ΂��鑊�Έʒu
  radiusRatio := 0.5;                                       // (40)�厲�ɑ΂��镛���̔�
  startAngle  := 0.0;                                       // (41)�J�n�p�x
  endAngle    := PI * 2;                                    // (42)�I���p�x
	Result := SampEntMake.Ellipse(Center, majorAxis, radiusRatio, startAngle, endAngle);
  SampEntMake.Free;
end;

// �C���[�W�A�^�b�`�쐬��
function SampImage: Boolean;
var
  FileName: String;
	Vertex: Tads_point;
  Scale, Angle: Double;
	SampEntMake: TDArxEntMake;
begin
	Result := False;
  if acedGetFileDialog('Select Images', '', '', 0, FileName) <> RTNORM then exit; // �t�@�C����
  SampEntMake := TDArxEntMake.Create;
  Vertex := ads_point(100.0, 100.0, 0.0);                   // �}���_
  Scale := 100.0;                                           // �ړx
  Angle := 20.0;                                            // �p�x
  SampEntMake.ImageLight    := 80;                          // ���邳�̒l
  SampEntMake.ImageContrast := 70;                          // �R���g���X�g�̒l
  SampEntMake.ImageScumble  := 40;                          // �t�F�[�h�l
  Result := SampEntMake.ImageAttach('', FileName, Vertex, Scale, Angle);
  SampEntMake.Free;
end;

////////////////////////////////////////////////////////////////////////////////

// �u���b�N�}����
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
    BlockName := 'W';                                         // �u���b�N��
    Flags     := 0;                                           // �u���b�N�^�C�v�t���O
    if not SampEntMake.MakeBlock(BlockName, Flags) then exit;
    stPos := ads_point(50.0, 200.0, 0.0);
    nextPos[0] := ads_point(100.0,  50.0, 0.0);
    nextPos[1] := ads_point(150.0, 200.0, 0.0);
    nextPos[2] := ads_point(200.0,  50.0, 0.0);
    nextPos[3] := ads_point(250.0, 200.0, 0.0);
    if not SampEntMake.Line(stPos, nextPos) then exit;
    // BLOCK�̏I��
    BlockName := SampEntMake.EndBlock;                        // �u���b�N��
    position  := ads_point(50.0, 50.0, 0.0);                  // �}���_
    Angle     := 0.0;                                         // ��]�p�x
    SeqFlags  := False;                                       // �ό㑱�����t���O
    Result := SampEntMake.Insert(BlockName, position, Angle, SeqFlags);
  finally
    SampEntMake.Free;
  end;
end;

// ���o���쐬��
function SampLeader: Boolean;
var
  Vertex1, Vertex2: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point(100.0, 100.0, 0.0);                  // ���_�̍��W
    Vertex2 := ads_point(200.0, 200.0, 0.0);                  // ���_�̍��W
	  Result := SampEntMake.Leader(Vertex1, Vertex2);
  finally
    SampEntMake.Free;
  end;
end;

// �����쐬��
function SampLine: Boolean;
var
  startPos, endPos: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    startPos := ads_point(100.0, 100.0, 0.0);  								// �n�_
    endPos   := ads_point(200.0, 200.0, 0.0);  								// �I�_
	  Result := SampEntMake.Line(startPos, endPos);
  finally
    SampEntMake.Free;
  end;
end;

// ���C�g�E�F�C�g�|�����C���쐬��
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
    Point      := ads_point(110.0, 110.0, 0.0);               // ���_
    Bulge      := 0.0;                                        // �ӂ����
    StartWidth := 5.0;                                        // �J�n��
    EndWidth   := 3.0;                                        // �I����
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
    Closed  := True;                                          // �|�����C���t���O
    Pattern := False;                                         // �|�����C���t���O
	  Result := SampEntMake.LWPolyLine(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// �}���`���C���쐬��
//function SampMLine: Boolean;

// �}���`�e�L�X�g�쐬��
function SampMText: Boolean;
var
  position: Tads_point;
  Str: String;
  Height, RectWidth: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position  := ads_point(100.0, 100.0, 0.0);								// �}���_
    Str       := 'SAMPLE\Psample';                            // �e�L�X�g������
    Height    := 50.0;                                        // �K���̕�������
    RectWidth := 300.0;                                       // �Q�Ƌ�`�̕�
	  Result := SampEntMake.MText(position, Str, Height, RectWidth);
  finally
    SampEntMake.Free;
  end;
end;

// OLE�t���[���쐬��
//function SampOLEFrame: Boolean;

// �_�쐬��
function SampPoint: Boolean;
var
  position: Tads_point;
  userAngle: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position  := ads_point(100.0, 100.0, 0.0);                // �_�̈ʒu
    userAngle := 0.0;                                         // �_����}�����Ƃ��ɗL���������AUCS �� X ���̊p�x
	  Result := SampEntMake.Point(position, userAngle);
  finally
    SampEntMake.Free;
  end;
end;

// �Q�c�|�����C���쐬��
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
    Point      := ads_point(100.0, 100.0, 0.0);               // ���_
    Bulge      := 0.0;                                        // �ӂ����
    StartWidth := 5.0;                                        // �J�n��
    EndWidth   := 3.0;                                        // �I����
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
    Closed  := True;                                          // �|�����C���t���O
    Pattern := False;                                         // �|�����C���t���O
	  Result := SampEntMake.M2DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// �R�c�|�����C���쐬��
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
    Point      := ads_point(100.0, 100.0, 10.0);               	// ���_
    Bulge      := 0.0;                      	                  // �ӂ����
    StartWidth := 5.0;                        	                // �J�n��
    EndWidth   := 3.0;                          	              // �I����
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
    Closed  := True;                                          // �|�����C���t���O
    Pattern := False;                                         // �|�����C���t���O
	  Result := SampEntMake.M3DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// ���ː��쐬��
function SampRay: Boolean;
var
  basePoint, unitVector: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    basePoint  := ads_point(100.0, 100.0, 0.0);               // �n�_
    unitVector := ads_point(  0.7,   0.7, 0.0);               // �P�ʕ����x�N�g��
    Result := SampEntMake.Ray(basePoint, unitVector);
  finally
    SampEntMake.Free;
  end;
end;

// ���[�W�����쐬��
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
          // (1)ACIS�`���̃��f��������
	  Result := SampEntMake.Region(sACIS);
  finally
    SampEntMake.Free;
  end;
end;

// �V�F�C�v�쐬��
//function SampShape: Boolean;

// 2D�h��ׂ��쐬��
function SampSolid: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point(100.0,  50.0, 0.0);                  // �P�Ԗڂ̃R�[�i�[
    Vertex2 := ads_point(150.0,  50.0, 0.0);                  // �Q�Ԗڂ̃R�[�i�[
    Vertex3 := ads_point( 50.0, 100.0, 0.0);                  // �R�Ԗڂ̃R�[�i�[
    Vertex4 := ads_point(200.0, 100.0, 0.0);                  // �S�Ԗڂ̃R�[�i�[
	  Result := SampEntMake.Solid(Vertex1, Vertex2, Vertex3, Vertex4);
  finally
    SampEntMake.Free;
  end;
end;

// �X�v���C���쐬��
//function SampSpline: Boolean;

// �����쐬��
function SampText: Boolean;
var
  position: Tads_point;
  Str: String;
  Height, Rotation: Double;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    position := ads_point(50.0, 50.0, 0.0);  									// ��P�ʒu���킹�_
    Str      := 'SAMPLE';                    									// ������
    Height   := 50.0;                        									// �����̍���
    Rotation := 1.57;                        									// �����̉�]�p�x
	  Result := SampEntMake.Text(position, Str, Height, Rotation);
  finally
    SampEntMake.Free;
  end;
end;

// �􉽌����쐬��
function SampTolerance: Boolean;
var
  DimName, Str: String;
  Location: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    DimName  := 'Tolerance';                                  // ���@�X�^�C����
    Str      := 'ToleranceSample';                            // ������
    Location := ads_point(100.0, 100.0, 0.0);                 // �}���_
	  Result := SampEntMake.Tolerance(DimName, Str, Location);
  finally
    SampEntMake.Free;
  end;
end;

// �����쐬��
function SampTrace: Boolean;
var
  Vertex1, Vertex2, Vertex3, Vertex4: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    Vertex1 := ads_point( 50.0,  50.0, 0.0);                  // �P�Ԗڂ̃R�[�i�[
    Vertex2 := ads_point(200.0,  50.0, 0.0);                  // �Q�Ԗڂ̃R�[�i�[
    Vertex3 := ads_point(100.0, 100.0, 0.0);                  // �R�Ԗڂ̃R�[�i�[
    Vertex4 := ads_point(150.0, 100.0, 0.0);                  // �S�Ԗڂ̃R�[�i�[
	  Result := SampEntMake.Trace(Vertex1, Vertex2, Vertex3, Vertex4);
  finally
    SampEntMake.Free;
  end;
end;

// ���_�쐬��
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
    Point      := ads_point(100.0, 100.0, 0.0);               // ���_
    Bulge      := 0.0;                                        // �ӂ����
    StartWidth := 1.0;                                        // �J�n��
    EndWidth   := 5.0;                                        // �I����
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Point      := ads_point(200.0, 200.0, 0.0);               // ���_
    Bulge      := 0.0;                                        // �ӂ����
    StartWidth := 5.0;                                        // �J�n��
    EndWidth   := 1.0;                                        // �I����
    SampEntMake.AddVertex(Point, Bulge, StartWidth, EndWidth);
    Closed  := True;                                          // �|�����C���t���O
    Pattern := False;                                         // �|�����C���t���O
    Result := SampEntMake.M3DPolyline(Closed, Pattern);
  finally
    SampEntMake.Free;
  end;
end;

// �r���[�|�[�g�쐬��
//function SampViewPort: Boolean;

// �\�z���쐬��
function SampXLine: Boolean;
var
  basePoint, unitVector: Tads_point;
  SampEntMake: TDArxEntMake;
begin
  SampEntMake := TDArxEntMake.Create;
  try
    basePoint  := ads_point(100.0, 100.0, 0.0);               // ��_
    unitVector := ads_point(  1.0,   0.0, 0.0);               // �P�ʕ����x�N�g��
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



