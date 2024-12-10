unit ACAD_TLB;

// ************************************************************************ //
//  警告
// ------
// このファイルで定義されている型宣言はタイプライブラリから読み出した       //
// 値を元に作成されています。タイプライブラリエディタで作業中に [ソー       //
// スコードの更新] ボタンを押したときや，ほかのタイプライブラリが直接       //
// または間接にこのタイプライブラリを参照している場合に，このファイル       //
// はタイプライブラリの値を元に再生成されます。                             //
// この場合，このファイル自身に対する変更は失われてしまいます。             //
// ************************************************************************ //

// Delphi5 コンポーネントラッパー未作成
// PASTLWTR : $Revision:   1.88.1.0.1.0  $

{$TYPEDADDRESS OFF} // 型付き @ 演算子の指定を外す必要があります。

interface

uses Windows, ActiveX, Classes, Graphics, OleServer, OleCtrls, StdVCL;

// *********************************************************************//
// タイプライブラリ中の GUID の定義。以下の規則が使われます。
//   Type Libraries     : LIBID_xxxx
//   CoClasses          : CLASS_xxxx
//   DISPInterfaces     : DIID_xxxx
//   Non-DISP interfaces: IID_xxxx
// *********************************************************************//
const
  // タイプライブラリのメジャー/マイナーバージョン番号
  AutoCADMajorVersion = 1;
  AutoCADMinorVersion = 1;

  LIBID_AutoCAD: TGUID = '{C094C1E2-57C6-11D2-85E3-080009A0C626}';

  IID_IAcadObject: TGUID = '{5B57EEA0-CA9A-11D1-B60F-0060B087E235}';
  IID_IAcadDatabase: TGUID = '{B9A2B985-2805-11D2-B678-0060B087E235}';
  IID_IAcadBlock: TGUID = '{5E932588-FFE7-11D1-B649-0060B087E235}';
  IID_IAcadModelSpace: TGUID = '{A1617E94-FB21-11D1-A2C8-080009DC639A}';
  IID_IAcadEntity: TGUID = '{5B57EEA2-CA9A-11D1-B60F-0060B087E235}';
  IID_IAcadHyperlinks: TGUID = '{B2547D92-056E-11D2-B651-0060B087E235}';
  IID_IAcadHyperlink: TGUID = '{B2547D94-CA93-11D1-B60F-0060B087E235}';
  IID_IAcad3DFace: TGUID = '{2928D496-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPolygonMesh: TGUID = '{2928D4C3-CA93-11D1-B60F-0060B087E235}';
  IID_IAcad3DPolyline: TGUID = '{2928D498-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadArc: TGUID = '{2928D49C-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadAttribute: TGUID = '{2928D49E-CA93-11D1-B60F-0060B087E235}';
  IID_IAcad3DSolid: TGUID = '{2928D49A-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadRegion: TGUID = '{2928D4C7-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadCircle: TGUID = '{2928D4A4-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimension: TGUID = '{4BE847C2-F032-11D1-BD1C-0080C82058CD}';
  IID_IAcadDimAligned: TGUID = '{2928D4A6-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimAngular: TGUID = '{2928D4A8-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimDiametric: TGUID = '{2928D4AA-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimRotated: TGUID = '{2928D4B0-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimOrdinate: TGUID = '{2928D4AC-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDimRadial: TGUID = '{2928D4AE-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadEllipse: TGUID = '{2928D4B2-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadLeader: TGUID = '{2928D4B6-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadMText: TGUID = '{2928D4BC-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPoint: TGUID = '{2928D4BE-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadLWPolyline: TGUID = '{2928D4B8-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPolyline: TGUID = '{2928D4C0-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadRay: TGUID = '{2928D4C5-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadShape: TGUID = '{2928D4C9-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadSolid: TGUID = '{2928D4CB-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadSpline: TGUID = '{2928D4CD-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadText: TGUID = '{2928D4CF-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadTolerance: TGUID = '{2928D4D1-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadTrace: TGUID = '{2928D4D3-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadXline: TGUID = '{2928D4D5-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadBlockReference: TGUID = '{2928D4A2-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadHatch: TGUID = '{2928D4B4-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadRasterImage: TGUID = '{8ACF1DD2-FBCA-11D1-A2C8-080009DC639A}';
  IID_IAcadLine: TGUID = '{2928D4BA-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPlotConfiguration: TGUID = '{3B6921F8-1DE6-11D2-B66E-0060B087E235}';
  IID_IAcadLayout: TGUID = '{B2547D8E-056E-11D2-B651-0060B087E235}';
  IID_IAcadMInsertBlock: TGUID = '{2928D4DB-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPolyfaceMesh: TGUID = '{2928D4E2-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadMLine: TGUID = '{2928D4E4-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDim3PointAngular: TGUID = '{2928D4E0-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadExternalReference: TGUID = '{2928D4E6-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadPaperSpace: TGUID = '{A1617E96-FB21-11D1-A2C8-080009DC639A}';
  IID_IAcadPViewport: TGUID = '{2928D4D9-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadBlocks: TGUID = '{A1617E98-FB21-11D1-A2C8-080009DC639A}';
  IID_IAcadGroups: TGUID = '{B49978B8-F971-11D1-A2C8-080009DC639A}';
  IID_IAcadGroup: TGUID = '{B49978B6-F971-11D1-A2C8-080009DC639A}';
  IID_IAcadDimStyles: TGUID = '{A4D59238-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadDimStyle: TGUID = '{2928D482-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadLayers: TGUID = '{C9CFC0FD-DACF-11D1-A2C2-080009DC639A}';
  IID_IAcadLayer: TGUID = '{2928D484-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadLineTypes: TGUID = '{A4D5923C-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadLineType: TGUID = '{2928D487-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadDictionaries: TGUID = '{A4D5923A-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadDictionary: TGUID = '{F8DD32D0-F7DF-11D1-A2C8-080009DC639A}';
  IID_IAcadXRecord: TGUID = '{2928D4DD-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadRegisteredApplications: TGUID = '{A4D59242-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadRegisteredApplication: TGUID = '{2928D48A-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadTextStyles: TGUID = '{A4D5923E-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadTextStyle: TGUID = '{2928D48C-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadUCSs: TGUID = '{A4D59240-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadUCS: TGUID = '{2928D48E-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadViews: TGUID = '{A4D59244-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadView: TGUID = '{2928D490-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadViewports: TGUID = '{A4D59246-F4D6-11D1-A2C8-080009DC639A}';
  IID_IAcadViewport: TGUID = '{2928D492-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadLayouts: TGUID = '{B2547D8F-056E-11D2-B651-0060B087E235}';
  IID_IAcadPlotConfigurations: TGUID = '{3B6921F9-1DE6-11D2-B66E-0060B087E235}';
  IID_IAcadDatabasePreferences: TGUID = '{B9A2B984-2805-11D2-B678-0060B087E235}';
  CLASS_AcadHyperlink: TGUID = '{B2547D95-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadObjectEvents: TGUID = '{67F4AC32-C9DC-11D1-B60F-0060B087E235}';
  CLASS_AcadObject: TGUID = '{5B57EEA1-CA9A-11D1-B60F-0060B087E235}';
  CLASS_AcadXRecord: TGUID = '{2928D4DE-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimStyle: TGUID = '{2928D483-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadLayer: TGUID = '{2928D485-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadLineType: TGUID = '{2928D488-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadRegisteredApplication: TGUID = '{2928D48B-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadTextStyle: TGUID = '{2928D48D-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadUCS: TGUID = '{2928D48F-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadView: TGUID = '{2928D491-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadViewport: TGUID = '{2928D493-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadGroup: TGUID = '{B49978B7-F971-11D1-A2C8-080009DC639A}';
  CLASS_AcadPlotConfiguration: TGUID = '{B8B1B2F1-1DE7-11D2-B66E-0060B087E235}';
  CLASS_AcadLayout: TGUID = '{B2547D90-056E-11D2-B651-0060B087E235}';
  IID_IAcadIdPair: TGUID = '{0D069D6C-7C0B-11D2-B6DD-0060B087E235}';
  CLASS_AcadIdPair: TGUID = '{0D069D6D-7C0B-11D2-B6DD-0060B087E235}';
  CLASS_AcadHyperlinks: TGUID = '{B2547D93-056E-11D2-B651-0060B087E235}';
  CLASS_AcadDictionary: TGUID = '{F8DD32D1-F7DF-11D1-A2C8-080009DC639A}';
  CLASS_AcadLayers: TGUID = '{C9CFC0FE-DACF-11D1-A2C2-080009DC639A}';
  CLASS_AcadDimStyles: TGUID = '{A4D59239-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadDictionaries: TGUID = '{A4D5923B-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadLineTypes: TGUID = '{A4D5923D-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadTextStyles: TGUID = '{A4D5923F-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadUCSs: TGUID = '{A4D59241-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadRegisteredApplications: TGUID = '{A4D59243-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadViews: TGUID = '{A4D59245-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadViewports: TGUID = '{A4D59247-F4D6-11D1-A2C8-080009DC639A}';
  CLASS_AcadGroups: TGUID = '{B49978B9-F971-11D1-A2C8-080009DC639A}';
  CLASS_AcadBlocks: TGUID = '{A1617E99-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadLayouts: TGUID = '{B2547D91-056E-11D2-B651-0060B087E235}';
  CLASS_AcadPlotConfigurations: TGUID = '{B8B1B2F2-1DE7-11D2-B66E-0060B087E235}';
  CLASS_AcadEntity: TGUID = '{5B57EEA3-CA9A-11D1-B60F-0060B087E235}';
  CLASS_AcadRasterImage: TGUID = '{8ACF1DD3-FBCA-11D1-A2C8-080009DC639A}';
  CLASS_Acad3DFace: TGUID = '{2928D497-CA93-11D1-B60F-0060B087E235}';
  CLASS_Acad3DPolyline: TGUID = '{2928D499-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadRegion: TGUID = '{2928D4C8-CA93-11D1-B60F-0060B087E235}';
  CLASS_Acad3DSolid: TGUID = '{2928D49B-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadArc: TGUID = '{2928D49D-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadAttribute: TGUID = '{2928D49F-CA93-11D1-B60F-0060B087E235}';
  IID_IAcadAttributeReference: TGUID = '{2928D4A0-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadAttributeReference: TGUID = '{2928D4A1-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadBlockReference: TGUID = '{2928D4A3-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadCircle: TGUID = '{2928D4A5-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadEllipse: TGUID = '{2928D4B3-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadHatch: TGUID = '{2928D4B5-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadLeader: TGUID = '{2928D4B7-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadLWPolyline: TGUID = '{2928D4B9-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadLine: TGUID = '{2928D4BB-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadMText: TGUID = '{2928D4BD-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadPoint: TGUID = '{2928D4BF-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadPolyline: TGUID = '{2928D4C1-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadPolygonMesh: TGUID = '{2928D4C4-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadRay: TGUID = '{2928D4C6-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadShape: TGUID = '{2928D4CA-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadSolid: TGUID = '{2928D4CC-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadSpline: TGUID = '{2928D4CE-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadText: TGUID = '{2928D4D0-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadTolerance: TGUID = '{2928D4D2-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadTrace: TGUID = '{2928D4D4-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadXline: TGUID = '{2928D4D6-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadPViewport: TGUID = '{2928D4DA-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadMInsertBlock: TGUID = '{2928D4DC-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadPolyfaceMesh: TGUID = '{2928D4E3-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadMLine: TGUID = '{2928D4E5-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadExternalReference: TGUID = '{2928D4E7-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimension: TGUID = '{4BE847C3-F032-11D1-BD1C-0080C82058CD}';
  CLASS_AcadDimAligned: TGUID = '{2928D4A7-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimAngular: TGUID = '{2928D4A9-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimDiametric: TGUID = '{2928D4AB-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimOrdinate: TGUID = '{2928D4AD-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimRadial: TGUID = '{2928D4AF-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDimRotated: TGUID = '{2928D4B1-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadDim3PointAngular: TGUID = '{2928D4E1-CA93-11D1-B60F-0060B087E235}';
  CLASS_AcadBlock: TGUID = '{A1617E9B-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadModelSpace: TGUID = '{A1617E95-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadPaperSpace: TGUID = '{A1617E97-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadDatabasePreferences: TGUID = '{C6A0FF24-2814-11D2-B678-0060B087E235}';
  CLASS_AcadDatabase: TGUID = '{C6A0FF25-2814-11D2-B678-0060B087E235}';
  DIID__DAcadApplicationEvents: TGUID = '{2974A76E-A19B-11D1-A2B0-080009DC639A}';
  IID_IAcadDocument: TGUID = '{8E75D912-3D21-11D2-85C4-080009A0C626}';
  IID_IAcadPlot: TGUID = '{4DC6D7A0-B8BA-11CF-A85E-0800091B9B14}';
  IID_IAcadApplication: TGUID = '{8E75D910-3D21-11D2-85C4-080009A0C626}';
  IID_IAcadPreferences: TGUID = '{24B8A4E0-432A-11D0-A893-0800091B9B14}';
  IID_IAcadPreferencesFiles: TGUID = '{83304A58-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesDisplay: TGUID = '{83304A59-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesOpenSave: TGUID = '{83304A5A-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesOutput: TGUID = '{83304A5E-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesSystem: TGUID = '{83304A60-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesUser: TGUID = '{83304A5B-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesDrafting: TGUID = '{83304A5D-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesSelection: TGUID = '{83304A5F-428E-11D2-B694-0060B087E235}';
  IID_IAcadPreferencesProfiles: TGUID = '{83304A5C-428E-11D2-B694-0060B087E235}';
  IID_IAcadMenuGroups: TGUID = '{61BA8C50-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadMenuGroup: TGUID = '{61BA8C52-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadPopupMenus: TGUID = '{61BA8C54-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadPopupMenu: TGUID = '{61BA8C56-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadPopupMenuItem: TGUID = '{61BA8C58-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadToolbars: TGUID = '{61BA8C5A-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadToolbar: TGUID = '{61BA8C5C-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadToolbarItem: TGUID = '{61BA8C5E-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadMenuBar: TGUID = '{61BA8C60-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadDocuments: TGUID = '{EC02A736-AE43-11D1-A2E5-0060B06B2D46}';
  IID_IAcadState: TGUID = '{E258A652-AA84-11D2-B6FB-0060B087E235}';
  IID_IAcadSelectionSets: TGUID = '{A1617E90-FB21-11D1-A2C8-080009DC639A}';
  IID_IAcadSelectionSet: TGUID = '{A1617E92-FB21-11D1-A2C8-080009DC639A}';
  IID_IAcadUtility: TGUID = '{E4F81D8A-6D4A-11CF-93FB-0800099EB3B7}';
  CLASS_AcadState: TGUID = '{E258A653-AA84-11D2-B6FB-0060B087E235}';
  CLASS_AcadApplication: TGUID = '{8E75D911-3D21-11D2-85C4-080009A0C626}';
  CLASS_AcadSelectionSet: TGUID = '{A1617E93-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadSelectionSets: TGUID = '{A1617E91-FB21-11D1-A2C8-080009DC639A}';
  CLASS_AcadPlot: TGUID = '{DE2FF4AC-E66F-11D0-A28B-080009DC639A}';
  CLASS_AcadPreferences: TGUID = '{DE2FF4AD-E66F-11D0-A28B-080009DC639A}';
  CLASS_AcadPreferencesDrafting: TGUID = '{C2872FB6-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesDisplay: TGUID = '{C2872FB7-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesFiles: TGUID = '{C2872FB8-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesOpenSave: TGUID = '{C2872FB9-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesOutput: TGUID = '{C2872FBA-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesProfiles: TGUID = '{C2872FBB-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesSelection: TGUID = '{C2872FBC-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesSystem: TGUID = '{C2872FBD-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadPreferencesUser: TGUID = '{C2872FBE-7F2C-11D2-B6DF-0060B087E235}';
  CLASS_AcadMenuGroups: TGUID = '{61BA8C51-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadMenuGroup: TGUID = '{61BA8C53-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadMenuBar: TGUID = '{61BA8C61-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadPopupMenus: TGUID = '{61BA8C55-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadPopupMenu: TGUID = '{61BA8C57-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadPopupMenuItem: TGUID = '{61BA8C59-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadUtility: TGUID = '{781F841E-6566-11CF-93F1-0800099EB3B7}';
  DIID__DAcadDocumentEvents: TGUID = '{976858E1-0B7B-11D0-89DF-00805FC2FBBA}';
  CLASS_AcadDocument: TGUID = '{8E75D913-3D21-11D2-85C4-080009A0C626}';
  CLASS_AcadDocuments: TGUID = '{EC02A737-AE43-11D1-A2E5-0060B06B2D46}';
  CLASS_AcadToolbars: TGUID = '{61BA8C5B-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadToolbar: TGUID = '{61BA8C5D-59F2-11D1-A2FB-080009A0C626}';
  CLASS_AcadToolbarItem: TGUID = '{61BA8C5F-59F2-11D1-A2FB-080009A0C626}';
  IID_IAcadLayerStateManager: TGUID = '{A6F7919D-D29C-11D3-8D11-00108302FDA5}';
  CLASS_AcadLayerStateManager: TGUID = '{A6F7919E-D29C-11D3-8D11-00108302FDA5}';

// *********************************************************************//
// Declaration of Enumerations defined in Type Library
// *********************************************************************//
// enum AcBoolean のための定数
type
  AcBoolean = TOleEnum;
const
  acFalse = $00000000;
  acTrue = $00000001;

// enum AcOnOff のための定数
type
  AcOnOff = TOleEnum;
const
  acOff = $00000000;
  acOn = $00000001;

// enum AcEntityName のための定数
type
  AcEntityName = TOleEnum;
const
  ac3dFace = $00000001;
  ac3dPolyline = $00000002;
  ac3dSolid = $00000003;
  acArc = $00000004;
  acAttribute = $00000005;
  acAttributeReference = $00000006;
  acBlockReference = $00000007;
  acCircle = $00000008;
  acDimAligned = $00000009;
  acDimAngular = $0000000A;
  acDimDiametric = $0000000C;
  acDimOrdinate = $0000000D;
  acDimRadial = $0000000E;
  acDimRotated = $0000000F;
  acEllipse = $00000010;
  acHatch = $00000011;
  acLeader = $00000012;
  acLine = $00000013;
  acMtext = $00000015;
  acPoint = $00000016;
  acPolyline = $00000017;
  acPolylineLight = $00000018;
  acPolymesh = $00000019;
  acRaster = $0000001A;
  acRay = $0000001B;
  acRegion = $0000001C;
  acShape = $0000001D;
  acSolid = $0000001E;
  acSpline = $0000001F;
  acText = $00000020;
  acTolerance = $00000021;
  acTrace = $00000022;
  acPViewport = $00000023;
  acXline = $00000024;
  acGroup = $00000025;
  acMInsertBlock = $00000026;
  acPolyfaceMesh = $00000027;
  acMLine = $00000028;
  acDim3PointAngular = $00000029;
  acExternalReference = $0000002A;

// enum AcActiveSpace のための定数
type
  AcActiveSpace = TOleEnum;
const
  acPaperSpace = $00000000;
  acModelSpace = $00000001;

// enum AcKeyboardAccelerator のための定数
type
  AcKeyboardAccelerator = TOleEnum;
const
  acPreferenceClassic = $00000000;
  acPreferenceCustom = $00000001;

// enum AcPlotOrientation のための定数
type
  AcPlotOrientation = TOleEnum;
const
  acPlotOrientationPortrait = $00000000;
  acPlotOrientationLandscape = $00000001;

// enum AcColor のための定数
type
  AcColor = TOleEnum;
const
  acByBlock = $00000000;
  acRed = $00000001;
  acYellow = $00000002;
  acGreen = $00000003;
  acCyan = $00000004;
  acBlue = $00000005;
  acMagenta = $00000006;
  acWhite = $00000007;
  acByLayer = $00000100;

// enum AcAttachmentPoint のための定数
type
  AcAttachmentPoint = TOleEnum;
const
  acAttachmentPointTopLeft = $00000001;
  acAttachmentPointTopCenter = $00000002;
  acAttachmentPointTopRight = $00000003;
  acAttachmentPointMiddleLeft = $00000004;
  acAttachmentPointMiddleCenter = $00000005;
  acAttachmentPointMiddleRight = $00000006;
  acAttachmentPointBottomLeft = $00000007;
  acAttachmentPointBottomCenter = $00000008;
  acAttachmentPointBottomRight = $00000009;

// enum AcDrawingDirection のための定数
type
  AcDrawingDirection = TOleEnum;
const
  acLeftToRight = $00000001;
  acRightToLeft = $00000002;
  acTopToBottom = $00000003;
  acBottomToTop = $00000004;
  acByStyle = $00000005;

// enum AcLeaderType のための定数
type
  AcLeaderType = TOleEnum;
const
  acLineNoArrow = $00000000;
  acSplineNoArrow = $00000001;
  acLineWithArrow = $00000002;
  acSplineWithArrow = $00000003;

// enum AcAttributeMode のための定数
type
  AcAttributeMode = TOleEnum;
const
  acAttributeModeNormal = $00000000;
  acAttributeModeInvisible = $00000001;
  acAttributeModeConstant = $00000002;
  acAttributeModeVerify = $00000004;
  acAttributeModePreset = $00000008;

// enum AcHorizontalAlignment のための定数
type
  AcHorizontalAlignment = TOleEnum;
const
  acHorizontalAlignmentLeft = $00000000;
  acHorizontalAlignmentCenter = $00000001;
  acHorizontalAlignmentRight = $00000002;
  acHorizontalAlignmentAligned = $00000003;
  acHorizontalAlignmentMiddle = $00000004;
  acHorizontalAlignmentFit = $00000005;

// enum AcVerticalAlignment のための定数
type
  AcVerticalAlignment = TOleEnum;
const
  acVerticalAlignmentBaseline = $00000000;
  acVerticalAlignmentBottom = $00000001;
  acVerticalAlignmentMiddle = $00000002;
  acVerticalAlignmentTop = $00000003;

// enum AcTextGenerationFlag のための定数
type
  AcTextGenerationFlag = TOleEnum;
const
  acTextFlagBackward = $00000002;
  acTextFlagUpsideDown = $00000004;

// enum AcSelect のための定数
type
  AcSelect = TOleEnum;
const
  acSelectionSetWindow = $00000000;
  acSelectionSetCrossing = $00000001;
  acSelectionSetFence = $00000002;
  acSelectionSetPrevious = $00000003;
  acSelectionSetLast = $00000004;
  acSelectionSetAll = $00000005;
  acSelectionSetWindowPolygon = $00000006;
  acSelectionSetCrossingPolygon = $00000007;

// enum AcPatternType のための定数
type
  AcPatternType = TOleEnum;
const
  acHatchPatternTypeUserDefined = $00000000;
  acHatchPatternTypePreDefined = $00000001;
  acHatchPatternTypeCustomDefined = $00000002;

// enum AcLoopType のための定数
type
  AcLoopType = TOleEnum;
const
  acHatchLoopTypeDefault = $00000000;
  acHatchLoopTypeExternal = $00000001;
  acHatchLoopTypePolyline = $00000002;
  acHatchLoopTypeDerived = $00000004;
  acHatchLoopTypeTextbox = $00000008;

// enum AcHatchStyle のための定数
type
  AcHatchStyle = TOleEnum;
const
  acHatchStyleNormal = $00000000;
  acHatchStyleOuter = $00000001;
  acHatchStyleIgnore = $00000002;

// enum AcPolylineType のための定数
type
  AcPolylineType = TOleEnum;
const
  acSimplePoly = $00000000;
  acFitCurvePoly = $00000001;
  acQuadSplinePoly = $00000002;
  acCubicSplinePoly = $00000003;

// enum Ac3DPolylineType のための定数
type
  Ac3DPolylineType = TOleEnum;
const
  acSimple3DPoly = $00000000;
  acQuadSpline3DPoly = $00000001;
  acCubicSpline3DPoly = $00000002;

// enum AcViewportSplitType のための定数
type
  AcViewportSplitType = TOleEnum;
const
  acViewport2Horizontal = $00000000;
  acViewport2Vertical = $00000001;
  acViewport3Left = $00000002;
  acViewport3Right = $00000003;
  acViewport3Horizontal = $00000004;
  acViewport3Vertical = $00000005;
  acViewport3Above = $00000006;
  acViewport3Below = $00000007;
  acViewport4 = $00000008;

// enum AcRegenType のための定数
type
  AcRegenType = TOleEnum;
const
  acActiveViewport = $00000000;
  acAllViewports = $00000001;

// enum AcBooleanType のための定数
type
  AcBooleanType = TOleEnum;
const
  acUnion = $00000000;
  acIntersection = $00000001;
  acSubtraction = $00000002;

// enum AcExtendOption のための定数
type
  AcExtendOption = TOleEnum;
const
  acExtendNone = $00000000;
  acExtendThisEntity = $00000001;
  acExtendOtherEntity = $00000002;
  acExtendBoth = $00000003;

// enum AcAngleUnits のための定数
type
  AcAngleUnits = TOleEnum;
const
  acDegrees = $00000000;
  acDegreeMinuteSeconds = $00000001;
  acGrads = $00000002;
  acRadians = $00000003;

// enum AcUnits のための定数
type
  AcUnits = TOleEnum;
const
  acDefaultUnits = $FFFFFFFF;
  acScientific = $00000001;
  acDecimal = $00000002;
  acEngineering = $00000003;
  acArchitectural = $00000004;
  acFractional = $00000005;

// enum AcCoordinateSystem のための定数
type
  AcCoordinateSystem = TOleEnum;
const
  acWorld = $00000000;
  acUCS = $00000001;
  acDisplayDCS = $00000002;
  acPaperSpaceDCS = $00000003;
  acOCS = $00000004;

// enum AcMeasurementUnits のための定数
type
  AcMeasurementUnits = TOleEnum;
const
  acEnglish = $00000000;
  acMetric = $00000001;

// enum AcXRefDemandLoad のための定数
type
  AcXRefDemandLoad = TOleEnum;
const
  acDemandLoadDisabled = $00000000;
  acDemandLoadEnabled = $00000001;
  acDemandLoadEnabledWithCopy = $00000002;

// enum AcPreviewMode のための定数
type
  AcPreviewMode = TOleEnum;
const
  acPartialPreview = $00000000;
  acFullPreview = $00000001;

// enum AcPolymeshType のための定数
type
  AcPolymeshType = TOleEnum;
const
  acSimpleMesh = $00000000;
  acQuadSurfaceMesh = $00000005;
  acCubicSurfaceMesh = $00000006;
  acBezierSurfaceMesh = $00000008;

// enum AcZoomScaleType のための定数
type
  AcZoomScaleType = TOleEnum;
const
  acZoomScaledAbsolute = $00000000;
  acZoomScaledRelative = $00000001;
  acZoomScaledRelativePSpace = $00000002;

// enum AcDragDisplayMode のための定数
type
  AcDragDisplayMode = TOleEnum;
const
  acDragDoNotDisplay = $00000000;
  acDragDisplayOnRequest = $00000001;
  acDragDisplayAutomatically = $00000002;

// enum AcARXDemandLoad のための定数
type
  AcARXDemandLoad = TOleEnum;
const
  acDemanLoadDisable = $00000000;
  acDemandLoadOnObjectDetect = $00000001;
  acDemandLoadCmdInvoke = $00000002;

// enum AcTextFontStyle のための定数
type
  AcTextFontStyle = TOleEnum;
const
  acFontRegular = $00000000;
  acFontItalic = $00000001;
  acFontBold = $00000002;
  acFontBoldItalic = $00000003;

// enum AcProxyImage のための定数
type
  AcProxyImage = TOleEnum;
const
  acProxyNotShow = $00000000;
  acProxyShow = $00000001;
  acProxyBoundingBox = $00000002;

// enum AcKeyboardPriority のための定数
type
  AcKeyboardPriority = TOleEnum;
const
  acKeyboardRunningObjSnap = $00000000;
  acKeyboardEntry = $00000001;
  acKeyboardEntryExceptScripts = $00000002;

// enum AcMenuGroupType のための定数
type
  AcMenuGroupType = TOleEnum;
const
  acBaseMenuGroup = $00000000;
  acPartialMenuGroup = $00000001;

// enum AcMenuFileType のための定数
type
  AcMenuFileType = TOleEnum;
const
  acMenuFileCompiled = $00000000;
  acMenuFileSource = $00000001;

// enum AcMenuItemType のための定数
type
  AcMenuItemType = TOleEnum;
const
  acMenuItem = $00000000;
  acMenuSeparator = $00000001;
  acMenuSubMenu = $00000002;

// enum AcToolbarItemType のための定数
type
  AcToolbarItemType = TOleEnum;
const
  acToolbarButton = $00000000;
  acToolbarSeparator = $00000001;
  acToolbarControl = $00000002;
  acToolbarFlyout = $00000003;

// enum AcToolbarDockStatus のための定数
type
  AcToolbarDockStatus = TOleEnum;
const
  acToolbarDockTop = $00000000;
  acToolbarDockBottom = $00000001;
  acToolbarDockLeft = $00000002;
  acToolbarDockRight = $00000003;
  acToolbarFloating = $00000004;

// enum AcLineWeight のための定数
type
  AcLineWeight = TOleEnum;
const
  acLnWt000 = $00000000;
  acLnWt005 = $00000005;
  acLnWt009 = $00000009;
  acLnWt013 = $0000000D;
  acLnWt015 = $0000000F;
  acLnWt018 = $00000012;
  acLnWt020 = $00000014;
  acLnWt025 = $00000019;
  acLnWt030 = $0000001E;
  acLnWt035 = $00000023;
  acLnWt040 = $00000028;
  acLnWt050 = $00000032;
  acLnWt053 = $00000035;
  acLnWt060 = $0000003C;
  acLnWt070 = $00000046;
  acLnWt080 = $00000050;
  acLnWt090 = $0000005A;
  acLnWt100 = $00000064;
  acLnWt106 = $0000006A;
  acLnWt120 = $00000078;
  acLnWt140 = $0000008C;
  acLnWt158 = $0000009E;
  acLnWt200 = $000000C8;
  acLnWt211 = $000000D3;
  acLnWtByLayer = $FFFFFFFF;
  acLnWtByBlock = $FFFFFFFE;
  acLnWtByLwDefault = $FFFFFFFD;

// enum AcWindowState のための定数
type
  AcWindowState = TOleEnum;
const
  acNorm = $00000001;
  acMin = $00000002;
  acMax = $00000003;

// enum AcPlotPaperUnits のための定数
type
  AcPlotPaperUnits = TOleEnum;
const
  acInches = $00000000;
  acMillimeters = $00000001;
  acPixels = $00000002;

// enum AcPlotRotation のための定数
type
  AcPlotRotation = TOleEnum;
const
  ac0degrees = $00000000;
  ac90degrees = $00000001;
  ac180degrees = $00000002;
  ac270degrees = $00000003;

// enum AcPlotType のための定数
type
  AcPlotType = TOleEnum;
const
  acDisplay = $00000000;
  acExtents = $00000001;
  acLimits = $00000002;
  acView = $00000003;
  acWindow = $00000004;
  acLayout = $00000005;

// enum AcPlotScale のための定数
type
  AcPlotScale = TOleEnum;
const
  acScaleToFit = $00000000;
  ac1_128in_1ft = $00000001;
  ac1_64in_1ft = $00000002;
  ac1_32in_1ft = $00000003;
  ac1_16in_1ft = $00000004;
  ac3_32in_1ft = $00000005;
  ac1_8in_1ft = $00000006;
  ac3_16in_1ft = $00000007;
  ac1_4in_1ft = $00000008;
  ac3_8in_1ft = $00000009;
  ac1_2in_1ft = $0000000A;
  ac3_4in_1ft = $0000000B;
  ac1in_1ft = $0000000C;
  ac3in_1ft = $0000000D;
  ac6in_1ft = $0000000E;
  ac1ft_1ft = $0000000F;
  ac1_1 = $00000010;
  ac1_2 = $00000011;
  ac1_4 = $00000012;
  ac1_8 = $00000013;
  ac1_10 = $00000014;
  ac1_16 = $00000015;
  ac1_20 = $00000016;
  ac1_30 = $00000017;
  ac1_40 = $00000018;
  ac1_50 = $00000019;
  ac1_100 = $0000001A;
  ac2_1 = $0000001B;
  ac4_1 = $0000001C;
  ac8_1 = $0000001D;
  ac10_1 = $0000001E;
  ac100_1 = $0000001F;

// enum AcAlignment のための定数
type
  AcAlignment = TOleEnum;
const
  acAlignmentLeft = $00000000;
  acAlignmentCenter = $00000001;
  acAlignmentRight = $00000002;
  acAlignmentAligned = $00000003;
  acAlignmentMiddle = $00000004;
  acAlignmentFit = $00000005;
  acAlignmentTopLeft = $00000006;
  acAlignmentTopCenter = $00000007;
  acAlignmentTopRight = $00000008;
  acAlignmentMiddleLeft = $00000009;
  acAlignmentMiddleCenter = $0000000A;
  acAlignmentMiddleRight = $0000000B;
  acAlignmentBottomLeft = $0000000C;
  acAlignmentBottomCenter = $0000000D;
  acAlignmentBottomRight = $0000000E;

// enum AcLineSpacingStyle のための定数
type
  AcLineSpacingStyle = TOleEnum;
const
  acLineSpacingStyleAtLeast = $00000001;
  acLineSpacingStyleExactly = $00000002;

// enum AcDimPrecision のための定数
type
  AcDimPrecision = TOleEnum;
const
  acDimPrecisionZero = $00000000;
  acDimPrecisionOne = $00000001;
  acDimPrecisionTwo = $00000002;
  acDimPrecisionThree = $00000003;
  acDimPrecisionFour = $00000004;
  acDimPrecisionFive = $00000005;
  acDimPrecisionSix = $00000006;
  acDimPrecisionSeven = $00000007;
  acDimPrecisionEight = $00000008;

// enum AcDimUnits のための定数
type
  AcDimUnits = TOleEnum;
const
  acDimScientific = $00000001;
  acDimDecimal = $00000002;
  acDimEngineering = $00000003;
  acDimArchitecturalStacked = $00000004;
  acDimFractionalStacked = $00000005;
  acDimArchitectural = $00000006;
  acDimFractional = $00000007;
  acDimWindowsDesktop = $00000008;

// enum AcDimLUnits のための定数
type
  AcDimLUnits = TOleEnum;
const
  acDimLScientific = $00000001;
  acDimLDecimal = $00000002;
  acDimLEngineering = $00000003;
  acDimLArchitectural = $00000004;
  acDimLFractional = $00000005;
  acDimLWindowsDesktop = $00000006;

// enum AcDimArrowheadType のための定数
type
  AcDimArrowheadType = TOleEnum;
const
  acArrowDefault = $00000000;
  acArrowClosedBlank = $00000001;
  acArrowClosed = $00000002;
  acArrowDot = $00000003;
  acArrowArchTick = $00000004;
  acArrowOblique = $00000005;
  acArrowOpen = $00000006;
  acArrowOrigin = $00000007;
  acArrowOrigin2 = $00000008;
  acArrowOpen90 = $00000009;
  acArrowOpen30 = $0000000A;
  acArrowDotSmall = $0000000B;
  acArrowDotBlank = $0000000C;
  acArrowSmall = $0000000D;
  acArrowBoxBlank = $0000000E;
  acArrowBoxFilled = $0000000F;
  acArrowDatumBlank = $00000010;
  acArrowDatumFilled = $00000011;
  acArrowIntegral = $00000012;
  acArrowNone = $00000013;
  acArrowUserDefined = $00000014;

// enum AcDimCenterType のための定数
type
  AcDimCenterType = TOleEnum;
const
  acCenterMark = $00000000;
  acCenterLine = $00000001;
  acCenterNone = $00000002;

// enum AcDimFit のための定数
type
  AcDimFit = TOleEnum;
const
  acTextAndArrows = $00000000;
  acArrowsOnly = $00000001;
  acTextOnly = $00000002;
  acBestFit = $00000003;

// enum AcDimFractionType のための定数
type
  AcDimFractionType = TOleEnum;
const
  acHorizontal = $00000000;
  acDiagonal = $00000001;
  acNotStacked = $00000002;

// enum AcDimHorizontalJustification のための定数
type
  AcDimHorizontalJustification = TOleEnum;
const
  acHorzCentered = $00000000;
  acFirstExtensionLine = $00000001;
  acSecondExtensionLine = $00000002;
  acOverFirstExtension = $00000003;
  acOverSecondExtension = $00000004;

// enum AcDimVerticalJustification のための定数
type
  AcDimVerticalJustification = TOleEnum;
const
  acVertCentered = $00000000;
  acAbove = $00000001;
  acOutside = $00000002;
  acJIS = $00000003;

// enum AcDimTextMovement のための定数
type
  AcDimTextMovement = TOleEnum;
const
  acDimLineWithText = $00000000;
  acMoveTextAddLeader = $00000001;
  acMoveTextNoLeader = $00000002;

// enum AcDimToleranceMethod のための定数
type
  AcDimToleranceMethod = TOleEnum;
const
  acTolNone = $00000000;
  acTolSymmetrical = $00000001;
  acTolDeviation = $00000002;
  acTolLimits = $00000003;
  acTolBasic = $00000004;

// enum AcDimToleranceJustify のための定数
type
  AcDimToleranceJustify = TOleEnum;
const
  acTolBottom = $00000000;
  acTolMiddle = $00000001;
  acTolTop = $00000002;

// enum AcViewportScale のための定数
type
  AcViewportScale = TOleEnum;
const
  acVpScaleToFit = $00000000;
  acVpCustomScale = $00000001;
  acVp1_1 = $00000002;
  acVp1_2 = $00000003;
  acVp1_4 = $00000004;
  acVp1_8 = $00000005;
  acVp1_10 = $00000006;
  acVp1_16 = $00000007;
  acVp1_20 = $00000008;
  acVp1_30 = $00000009;
  acVp1_40 = $0000000A;
  acVp1_50 = $0000000B;
  acVp1_100 = $0000000C;
  acVp2_1 = $0000000D;
  acVp4_1 = $0000000E;
  acVp8_1 = $0000000F;
  acVp10_1 = $00000010;
  acVp100_1 = $00000011;
  acVp1_128in_1ft = $00000012;
  acVp1_64in_1ft = $00000013;
  acVp1_32in_1ft = $00000014;
  acVp1_16in_1ft = $00000015;
  acVp3_32in_1ft = $00000016;
  acVp1_8in_1ft = $00000017;
  acVp3_16in_1ft = $00000018;
  acVp1_4in_1ft = $00000019;
  acVp3_8in_1ft = $0000001A;
  acVp1_2in_1ft = $0000001B;
  acVp3_4in_1ft = $0000001C;
  acVp1in_1ft = $0000001D;
  acVp3in_1ft = $0000001E;
  acVp6in_1ft = $0000001F;
  acVp1ft_1ft = $00000020;

// enum AcISOPenWidth のための定数
type
  AcISOPenWidth = TOleEnum;
const
  acPenWidth013 = $0000000D;
  acPenWidth018 = $00000012;
  acPenWidth025 = $00000019;
  acPenWidth035 = $00000023;
  acPenWidth050 = $00000032;
  acPenWidth070 = $00000046;
  acPenWidth100 = $00000064;
  acPenWidth140 = $0000008C;
  acPenWidth200 = $000000C8;
  acPenWidthUnk = $FFFFFFFF;

// enum AcSaveAsType のための定数
type
  AcSaveAsType = TOleEnum;
const
  acUnknown = $FFFFFFFF;
  acR12_dxf = $00000001;
  acR13_dwg = $00000004;
  acR13_dxf = $00000005;
  acR14_dwg = $00000008;
  acR14_dxf = $00000009;
  acR15_dwg = $0000000C;
  acR15_dxf = $0000000D;
  acR15_Template = $0000000E;
  acNative = $0000000C;

// enum AcPrinterSpoolAlert のための定数
type
  AcPrinterSpoolAlert = TOleEnum;
const
  acPrinterAlwaysAlert = $00000000;
  acPrinterAlertOnce = $00000001;
  acPrinterNeverAlertLogOnce = $00000002;
  acPrinterNeverAlert = $00000003;

// enum AcPlotPolicyForNewDwgs のための定数
type
  AcPlotPolicyForNewDwgs = TOleEnum;
const
  acPolicyNewDefault = $00000000;
  acPolicyNewLegacy = $00000001;

// enum AcPlotPolicyForLegacyDwgs のための定数
type
  AcPlotPolicyForLegacyDwgs = TOleEnum;
const
  acPolicyLegacyDefault = $00000000;
  acPolicyLegacyQuery = $00000001;
  acPolicyLegacyLegacy = $00000002;

// enum AcOleQuality のための定数
type
  AcOleQuality = TOleEnum;
const
  acOQLineArt = $00000000;
  acOQText = $00000001;
  acOQGraphics = $00000002;
  acOQPhoto = $00000003;
  acOQHighPhoto = $00000004;

// enum AcLoadPalette のための定数
type
  AcLoadPalette = TOleEnum;
const
  acPaletteByDrawing = $00000000;
  acPaletteBySession = $00000001;

// enum AcInsertUnits のための定数
type
  AcInsertUnits = TOleEnum;
const
  acInsertUnitsUnitless = $00000000;
  acInsertUnitsInches = $00000001;
  acInsertUnitsFeet = $00000002;
  acInsertUnitsMiles = $00000003;
  acInsertUnitsMillimeters = $00000004;
  acInsertUnitsCentimeters = $00000005;
  acInsertUnitsMeters = $00000006;
  acInsertUnitsKilometers = $00000007;
  acInsertUnitsMicroinches = $00000008;
  acInsertUnitsMils = $00000009;
  acInsertUnitsYards = $0000000A;
  acInsertUnitsAngstroms = $0000000B;
  acInsertUnitsNanometers = $0000000C;
  acInsertUnitsMicrons = $0000000D;
  acInsertUnitsDecimeters = $0000000E;
  acInsertUnitsDecameters = $0000000F;
  acInsertUnitsHectometers = $00000010;
  acInsertUnitsGigameters = $00000011;
  acInsertUnitsAstronomicalUnits = $00000012;
  acInsertUnitsLightYears = $00000013;
  acInsertUnitsParsecs = $00000014;

// enum AcAlignmentPointAcquisition のための定数
type
  AcAlignmentPointAcquisition = TOleEnum;
const
  acAlignPntAcquisitionAutomatic = $00000000;
  acAlignPntAcquisitionShiftToAcquire = $00000001;

// enum AcInsertUnitsAction のための定数
type
  AcInsertUnitsAction = TOleEnum;
const
  acInsertUnitsPrompt = $00000000;
  acInsertUnitsAutoAssign = $00000001;

// enum AcPlotPolicy のための定数
type
  AcPlotPolicy = TOleEnum;
const
  acPolicyNamed = $00000000;
  acPolicyLegacy = $00000001;

// enum AcDrawingAreaShortCutMenu のための定数
type
  AcDrawingAreaShortCutMenu = TOleEnum;
const
  acNoDrawingAreaShortCutMenu = $00000000;
  acUseDefaultDrawingAreaShortCutMenu = $00000001;

// enum AcDrawingAreaSCMDefault のための定数
type
  AcDrawingAreaSCMDefault = TOleEnum;
const
  acRepeatLastCommand = $00000000;
  acSCM = $00000001;

// enum AcDrawingAreaSCMEdit のための定数
type
  AcDrawingAreaSCMEdit = TOleEnum;
const
  acEdRepeatLastCommand = $00000000;
  acEdSCM = $00000001;

// enum AcDrawingAreaSCMCommand のための定数
type
  AcDrawingAreaSCMCommand = TOleEnum;
const
  acEnter = $00000000;
  acEnableSCMOptions = $00000001;
  acEnableSCM = $00000002;

// enum AcLayerStateMask のための定数
type
  AcLayerStateMask = TOleEnum;
const
  acLsNone = $00000000;
  acLsOn = $00000001;
  acLsFrozen = $00000002;
  acLsLocked = $00000004;
  acLsPlot = $00000008;
  acLsNewViewport = $00000010;
  acLsColor = $00000020;
  acLsLineType = $00000040;
  acLsLineWeight = $00000080;
  acLsPlotStyle = $00000100;
  acLsAll = $0000FFFF;

type

// *********************************************************************//
// タイプライブラリの型宣言のための forward 宣言
// *********************************************************************//
  IAcadObject = interface;
  IAcadObjectDisp = dispinterface;
  IAcadDatabase = interface;
  IAcadDatabaseDisp = dispinterface;
  IAcadBlock = interface;
  IAcadBlockDisp = dispinterface;
  IAcadModelSpace = interface;
  IAcadModelSpaceDisp = dispinterface;
  IAcadEntity = interface;
  IAcadEntityDisp = dispinterface;
  IAcadHyperlinks = interface;
  IAcadHyperlinksDisp = dispinterface;
  IAcadHyperlink = interface;
  IAcadHyperlinkDisp = dispinterface;
  IAcad3DFace = interface;
  IAcad3DFaceDisp = dispinterface;
  IAcadPolygonMesh = interface;
  IAcadPolygonMeshDisp = dispinterface;
  IAcad3DPolyline = interface;
  IAcad3DPolylineDisp = dispinterface;
  IAcadArc = interface;
  IAcadArcDisp = dispinterface;
  IAcadAttribute = interface;
  IAcadAttributeDisp = dispinterface;
  IAcad3DSolid = interface;
  IAcad3DSolidDisp = dispinterface;
  IAcadRegion = interface;
  IAcadRegionDisp = dispinterface;
  IAcadCircle = interface;
  IAcadCircleDisp = dispinterface;
  IAcadDimension = interface;
  IAcadDimensionDisp = dispinterface;
  IAcadDimAligned = interface;
  IAcadDimAlignedDisp = dispinterface;
  IAcadDimAngular = interface;
  IAcadDimAngularDisp = dispinterface;
  IAcadDimDiametric = interface;
  IAcadDimDiametricDisp = dispinterface;
  IAcadDimRotated = interface;
  IAcadDimRotatedDisp = dispinterface;
  IAcadDimOrdinate = interface;
  IAcadDimOrdinateDisp = dispinterface;
  IAcadDimRadial = interface;
  IAcadDimRadialDisp = dispinterface;
  IAcadEllipse = interface;
  IAcadEllipseDisp = dispinterface;
  IAcadLeader = interface;
  IAcadLeaderDisp = dispinterface;
  IAcadMText = interface;
  IAcadMTextDisp = dispinterface;
  IAcadPoint = interface;
  IAcadPointDisp = dispinterface;
  IAcadLWPolyline = interface;
  IAcadLWPolylineDisp = dispinterface;
  IAcadPolyline = interface;
  IAcadPolylineDisp = dispinterface;
  IAcadRay = interface;
  IAcadRayDisp = dispinterface;
  IAcadShape = interface;
  IAcadShapeDisp = dispinterface;
  IAcadSolid = interface;
  IAcadSolidDisp = dispinterface;
  IAcadSpline = interface;
  IAcadSplineDisp = dispinterface;
  IAcadText = interface;
  IAcadTextDisp = dispinterface;
  IAcadTolerance = interface;
  IAcadToleranceDisp = dispinterface;
  IAcadTrace = interface;
  IAcadTraceDisp = dispinterface;
  IAcadXline = interface;
  IAcadXlineDisp = dispinterface;
  IAcadBlockReference = interface;
  IAcadBlockReferenceDisp = dispinterface;
  IAcadHatch = interface;
  IAcadHatchDisp = dispinterface;
  IAcadRasterImage = interface;
  IAcadRasterImageDisp = dispinterface;
  IAcadLine = interface;
  IAcadLineDisp = dispinterface;
  IAcadPlotConfiguration = interface;
  IAcadPlotConfigurationDisp = dispinterface;
  IAcadLayout = interface;
  IAcadLayoutDisp = dispinterface;
  IAcadMInsertBlock = interface;
  IAcadMInsertBlockDisp = dispinterface;
  IAcadPolyfaceMesh = interface;
  IAcadPolyfaceMeshDisp = dispinterface;
  IAcadMLine = interface;
  IAcadMLineDisp = dispinterface;
  IAcadDim3PointAngular = interface;
  IAcadDim3PointAngularDisp = dispinterface;
  IAcadExternalReference = interface;
  IAcadExternalReferenceDisp = dispinterface;
  IAcadPaperSpace = interface;
  IAcadPaperSpaceDisp = dispinterface;
  IAcadPViewport = interface;
  IAcadPViewportDisp = dispinterface;
  IAcadBlocks = interface;
  IAcadBlocksDisp = dispinterface;
  IAcadGroups = interface;
  IAcadGroupsDisp = dispinterface;
  IAcadGroup = interface;
  IAcadGroupDisp = dispinterface;
  IAcadDimStyles = interface;
  IAcadDimStylesDisp = dispinterface;
  IAcadDimStyle = interface;
  IAcadDimStyleDisp = dispinterface;
  IAcadLayers = interface;
  IAcadLayersDisp = dispinterface;
  IAcadLayer = interface;
  IAcadLayerDisp = dispinterface;
  IAcadLineTypes = interface;
  IAcadLineTypesDisp = dispinterface;
  IAcadLineType = interface;
  IAcadLineTypeDisp = dispinterface;
  IAcadDictionaries = interface;
  IAcadDictionariesDisp = dispinterface;
  IAcadDictionary = interface;
  IAcadDictionaryDisp = dispinterface;
  IAcadXRecord = interface;
  IAcadXRecordDisp = dispinterface;
  IAcadRegisteredApplications = interface;
  IAcadRegisteredApplicationsDisp = dispinterface;
  IAcadRegisteredApplication = interface;
  IAcadRegisteredApplicationDisp = dispinterface;
  IAcadTextStyles = interface;
  IAcadTextStylesDisp = dispinterface;
  IAcadTextStyle = interface;
  IAcadTextStyleDisp = dispinterface;
  IAcadUCSs = interface;
  IAcadUCSsDisp = dispinterface;
  IAcadUCS = interface;
  IAcadUCSDisp = dispinterface;
  IAcadViews = interface;
  IAcadViewsDisp = dispinterface;
  IAcadView = interface;
  IAcadViewDisp = dispinterface;
  IAcadViewports = interface;
  IAcadViewportsDisp = dispinterface;
  IAcadViewport = interface;
  IAcadViewportDisp = dispinterface;
  IAcadLayouts = interface;
  IAcadLayoutsDisp = dispinterface;
  IAcadPlotConfigurations = interface;
  IAcadPlotConfigurationsDisp = dispinterface;
  IAcadDatabasePreferences = interface;
  IAcadDatabasePreferencesDisp = dispinterface;
  IAcadObjectEvents = interface;
  IAcadIdPair = interface;
  IAcadIdPairDisp = dispinterface;
  IAcadAttributeReference = interface;
  IAcadAttributeReferenceDisp = dispinterface;
  _DAcadApplicationEvents = dispinterface;
  IAcadDocument = interface;
  IAcadDocumentDisp = dispinterface;
  IAcadPlot = interface;
  IAcadPlotDisp = dispinterface;
  IAcadApplication = interface;
  IAcadApplicationDisp = dispinterface;
  IAcadPreferences = interface;
  IAcadPreferencesDisp = dispinterface;
  IAcadPreferencesFiles = interface;
  IAcadPreferencesFilesDisp = dispinterface;
  IAcadPreferencesDisplay = interface;
  IAcadPreferencesDisplayDisp = dispinterface;
  IAcadPreferencesOpenSave = interface;
  IAcadPreferencesOpenSaveDisp = dispinterface;
  IAcadPreferencesOutput = interface;
  IAcadPreferencesOutputDisp = dispinterface;
  IAcadPreferencesSystem = interface;
  IAcadPreferencesSystemDisp = dispinterface;
  IAcadPreferencesUser = interface;
  IAcadPreferencesUserDisp = dispinterface;
  IAcadPreferencesDrafting = interface;
  IAcadPreferencesDraftingDisp = dispinterface;
  IAcadPreferencesSelection = interface;
  IAcadPreferencesSelectionDisp = dispinterface;
  IAcadPreferencesProfiles = interface;
  IAcadPreferencesProfilesDisp = dispinterface;
  IAcadMenuGroups = interface;
  IAcadMenuGroupsDisp = dispinterface;
  IAcadMenuGroup = interface;
  IAcadMenuGroupDisp = dispinterface;
  IAcadPopupMenus = interface;
  IAcadPopupMenusDisp = dispinterface;
  IAcadPopupMenu = interface;
  IAcadPopupMenuDisp = dispinterface;
  IAcadPopupMenuItem = interface;
  IAcadPopupMenuItemDisp = dispinterface;
  IAcadToolbars = interface;
  IAcadToolbarsDisp = dispinterface;
  IAcadToolbar = interface;
  IAcadToolbarDisp = dispinterface;
  IAcadToolbarItem = interface;
  IAcadToolbarItemDisp = dispinterface;
  IAcadMenuBar = interface;
  IAcadMenuBarDisp = dispinterface;
  IAcadDocuments = interface;
  IAcadDocumentsDisp = dispinterface;
  IAcadState = interface;
  IAcadStateDisp = dispinterface;
  IAcadSelectionSets = interface;
  IAcadSelectionSetsDisp = dispinterface;
  IAcadSelectionSet = interface;
  IAcadSelectionSetDisp = dispinterface;
  IAcadUtility = interface;
  IAcadUtilityDisp = dispinterface;
  _DAcadDocumentEvents = dispinterface;
  IAcadLayerStateManager = interface;
  IAcadLayerStateManagerDisp = dispinterface;

// *********************************************************************//
// Declaration of CoClasses defined in Type Library
// (NOTE: Here we map each CoClass to its Default Interface)
// *********************************************************************//
  AcadHyperlink = IAcadHyperlink;
  AcadObject = IAcadObject;
  AcadXRecord = IAcadXRecord;
  AcadDimStyle = IAcadDimStyle;
  AcadLayer = IAcadLayer;
  AcadLineType = IAcadLineType;
  AcadRegisteredApplication = IAcadRegisteredApplication;
  AcadTextStyle = IAcadTextStyle;
  AcadUCS = IAcadUCS;
  AcadView = IAcadView;
  AcadViewport = IAcadViewport;
  AcadGroup = IAcadGroup;
  AcadPlotConfiguration = IAcadPlotConfiguration;
  AcadLayout = IAcadLayout;
  AcadIdPair = IAcadIdPair;
  AcadHyperlinks = IAcadHyperlinks;
  AcadDictionary = IAcadDictionary;
  AcadLayers = IAcadLayers;
  AcadDimStyles = IAcadDimStyles;
  AcadDictionaries = IAcadDictionaries;
  AcadLineTypes = IAcadLineTypes;
  AcadTextStyles = IAcadTextStyles;
  AcadUCSs = IAcadUCSs;
  AcadRegisteredApplications = IAcadRegisteredApplications;
  AcadViews = IAcadViews;
  AcadViewports = IAcadViewports;
  AcadGroups = IAcadGroups;
  AcadBlocks = IAcadBlocks;
  AcadLayouts = IAcadLayouts;
  AcadPlotConfigurations = IAcadPlotConfigurations;
  AcadEntity = IAcadEntity;
  AcadRasterImage = IAcadRasterImage;
  Acad3DFace = IAcad3DFace;
  Acad3DPolyline = IAcad3DPolyline;
  AcadRegion = IAcadRegion;
  Acad3DSolid = IAcad3DSolid;
  AcadArc = IAcadArc;
  AcadAttribute = IAcadAttribute;
  AcadAttributeReference = IAcadAttributeReference;
  AcadBlockReference = IAcadBlockReference;
  AcadCircle = IAcadCircle;
  AcadEllipse = IAcadEllipse;
  AcadHatch = IAcadHatch;
  AcadLeader = IAcadLeader;
  AcadLWPolyline = IAcadLWPolyline;
  AcadLine = IAcadLine;
  AcadMText = IAcadMText;
  AcadPoint = IAcadPoint;
  AcadPolyline = IAcadPolyline;
  AcadPolygonMesh = IAcadPolygonMesh;
  AcadRay = IAcadRay;
  AcadShape = IAcadShape;
  AcadSolid = IAcadSolid;
  AcadSpline = IAcadSpline;
  AcadText = IAcadText;
  AcadTolerance = IAcadTolerance;
  AcadTrace = IAcadTrace;
  AcadXline = IAcadXline;
  AcadPViewport = IAcadPViewport;
  AcadMInsertBlock = IAcadMInsertBlock;
  AcadPolyfaceMesh = IAcadPolyfaceMesh;
  AcadMLine = IAcadMLine;
  AcadExternalReference = IAcadExternalReference;
  AcadDimension = IAcadDimension;
  AcadDimAligned = IAcadDimAligned;
  AcadDimAngular = IAcadDimAngular;
  AcadDimDiametric = IAcadDimDiametric;
  AcadDimOrdinate = IAcadDimOrdinate;
  AcadDimRadial = IAcadDimRadial;
  AcadDimRotated = IAcadDimRotated;
  AcadDim3PointAngular = IAcadDim3PointAngular;
  AcadBlock = IAcadBlock;
  AcadModelSpace = IAcadModelSpace;
  AcadPaperSpace = IAcadPaperSpace;
  AcadDatabasePreferences = IAcadDatabasePreferences;
  AcadDatabase = IAcadDatabase;
  AcadState = IAcadState;
  AcadApplication = IAcadApplication;
  AcadSelectionSet = IAcadSelectionSet;
  AcadSelectionSets = IAcadSelectionSets;
  AcadPlot = IAcadPlot;
  AcadPreferences = IAcadPreferences;
  AcadPreferencesDrafting = IAcadPreferencesDrafting;
  AcadPreferencesDisplay = IAcadPreferencesDisplay;
  AcadPreferencesFiles = IAcadPreferencesFiles;
  AcadPreferencesOpenSave = IAcadPreferencesOpenSave;
  AcadPreferencesOutput = IAcadPreferencesOutput;
  AcadPreferencesProfiles = IAcadPreferencesProfiles;
  AcadPreferencesSelection = IAcadPreferencesSelection;
  AcadPreferencesSystem = IAcadPreferencesSystem;
  AcadPreferencesUser = IAcadPreferencesUser;
  AcadMenuGroups = IAcadMenuGroups;
  AcadMenuGroup = IAcadMenuGroup;
  AcadMenuBar = IAcadMenuBar;
  AcadPopupMenus = IAcadPopupMenus;
  AcadPopupMenu = IAcadPopupMenu;
  AcadPopupMenuItem = IAcadPopupMenuItem;
  AcadUtility = IAcadUtility;
  AcadDocument = IAcadDocument;
  AcadDocuments = IAcadDocuments;
  AcadToolbars = IAcadToolbars;
  AcadToolbar = IAcadToolbar;
  AcadToolbarItem = IAcadToolbarItem;
  AcadLayerStateManager = IAcadLayerStateManager;


// *********************************************************************//
// Declaration of structures, unions and aliases.
// *********************************************************************//
  PDouble1 = ^Double; {*}
  PWordBool1 = ^WordBool; {*}
  POleVariant1 = ^OleVariant; {*}

  ACAD_COLOR = AcColor;
  ACAD_LAYER = WideString;
  ACAD_LTYPE = WideString;
  ACAD_NULL = Integer;
  ACAD_DISTANCE = Double;
  ACAD_ANGLE = Double;
  ACAD_LWEIGHT = AcLineWeight;
  ACAD_NOUNITS = Double;
  ACAD_POINT = OleVariant;

// *********************************************************************//
// Interface: IAcadObject
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B57EEA0-CA9A-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadObject = interface(IDispatch)
    ['{5B57EEA0-CA9A-11D1-B60F-0060B087E235}']
    function  Get_Handle: WideString; safecall;
    function  Get_ObjectName: WideString; safecall;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); safecall;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); safecall;
    procedure Delete; safecall;
    function  Get_ObjectID: Integer; safecall;
    function  Get_Application: IDispatch; safecall;
    function  Get_Database: IAcadDatabase; safecall;
    function  Get_HasExtensionDictionary: WordBool; safecall;
    function  GetExtensionDictionary: IAcadDictionary; safecall;
    function  Get_OwnerID: Integer; safecall;
    function  Get_Document: IDispatch; safecall;
    procedure Erase; safecall;
    property Handle: WideString read Get_Handle;
    property ObjectName: WideString read Get_ObjectName;
    property ObjectID: Integer read Get_ObjectID;
    property Application: IDispatch read Get_Application;
    property Database: IAcadDatabase read Get_Database;
    property HasExtensionDictionary: WordBool read Get_HasExtensionDictionary;
    property OwnerID: Integer read Get_OwnerID;
    property Document: IDispatch read Get_Document;
  end;

// *********************************************************************//
// DispIntf:  IAcadObjectDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B57EEA0-CA9A-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadObjectDisp = dispinterface
    ['{5B57EEA0-CA9A-11D1-B60F-0060B087E235}']
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDatabase
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9A2B985-2805-11D2-B678-0060B087E235}
// *********************************************************************//
  IAcadDatabase = interface(IDispatch)
    ['{B9A2B985-2805-11D2-B678-0060B087E235}']
    function  Get_ModelSpace: IAcadModelSpace; safecall;
    function  Get_PaperSpace: IAcadPaperSpace; safecall;
    function  Get_Blocks: IAcadBlocks; safecall;
    function  CopyObjects(Objects: OleVariant; Owner: OleVariant; var IdPairs: OleVariant): OleVariant; safecall;
    function  Get_Groups: IAcadGroups; safecall;
    function  Get_DimStyles: IAcadDimStyles; safecall;
    function  Get_Layers: IAcadLayers; safecall;
    function  Get_Linetypes: IAcadLineTypes; safecall;
    function  Get_Dictionaries: IAcadDictionaries; safecall;
    function  Get_RegisteredApplications: IAcadRegisteredApplications; safecall;
    function  Get_TextStyles: IAcadTextStyles; safecall;
    function  Get_UserCoordinateSystems: IAcadUCSs; safecall;
    function  Get_Views: IAcadViews; safecall;
    function  Get_Viewports: IAcadViewports; safecall;
    function  Get_ElevationModelSpace: Double; safecall;
    procedure Set_ElevationModelSpace(Elevation: Double); safecall;
    function  Get_ElevationPaperSpace: Double; safecall;
    procedure Set_ElevationPaperSpace(Elevation: Double); safecall;
    function  Get_Limits: OleVariant; safecall;
    procedure Set_Limits(Limits: OleVariant); safecall;
    function  HandleToObject(const Handle: WideString): IDispatch; safecall;
    function  ObjectIdToObject(ObjectID: Integer): IDispatch; safecall;
    function  Get_Layouts: IAcadLayouts; safecall;
    function  Get_PlotConfigurations: IAcadPlotConfigurations; safecall;
    function  Get_Preferences: IAcadDatabasePreferences; safecall;
    property ModelSpace: IAcadModelSpace read Get_ModelSpace;
    property PaperSpace: IAcadPaperSpace read Get_PaperSpace;
    property Blocks: IAcadBlocks read Get_Blocks;
    property Groups: IAcadGroups read Get_Groups;
    property DimStyles: IAcadDimStyles read Get_DimStyles;
    property Layers: IAcadLayers read Get_Layers;
    property Linetypes: IAcadLineTypes read Get_Linetypes;
    property Dictionaries: IAcadDictionaries read Get_Dictionaries;
    property RegisteredApplications: IAcadRegisteredApplications read Get_RegisteredApplications;
    property TextStyles: IAcadTextStyles read Get_TextStyles;
    property UserCoordinateSystems: IAcadUCSs read Get_UserCoordinateSystems;
    property Views: IAcadViews read Get_Views;
    property Viewports: IAcadViewports read Get_Viewports;
    property ElevationModelSpace: Double read Get_ElevationModelSpace write Set_ElevationModelSpace;
    property ElevationPaperSpace: Double read Get_ElevationPaperSpace write Set_ElevationPaperSpace;
    property Limits: OleVariant read Get_Limits write Set_Limits;
    property Layouts: IAcadLayouts read Get_Layouts;
    property PlotConfigurations: IAcadPlotConfigurations read Get_PlotConfigurations;
    property Preferences: IAcadDatabasePreferences read Get_Preferences;
  end;

// *********************************************************************//
// DispIntf:  IAcadDatabaseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9A2B985-2805-11D2-B678-0060B087E235}
// *********************************************************************//
  IAcadDatabaseDisp = dispinterface
    ['{B9A2B985-2805-11D2-B678-0060B087E235}']
    property ModelSpace: IAcadModelSpace readonly dispid 1;
    property PaperSpace: IAcadPaperSpace readonly dispid 2;
    property Blocks: IAcadBlocks readonly dispid 3;
    function  CopyObjects(Objects: OleVariant; Owner: OleVariant; var IdPairs: OleVariant): OleVariant; dispid 4;
    property Groups: IAcadGroups readonly dispid 5;
    property DimStyles: IAcadDimStyles readonly dispid 6;
    property Layers: IAcadLayers readonly dispid 7;
    property Linetypes: IAcadLineTypes readonly dispid 8;
    property Dictionaries: IAcadDictionaries readonly dispid 9;
    property RegisteredApplications: IAcadRegisteredApplications readonly dispid 10;
    property TextStyles: IAcadTextStyles readonly dispid 11;
    property UserCoordinateSystems: IAcadUCSs readonly dispid 12;
    property Views: IAcadViews readonly dispid 13;
    property Viewports: IAcadViewports readonly dispid 14;
    property ElevationModelSpace: Double dispid 15;
    property ElevationPaperSpace: Double dispid 16;
    property Limits: OleVariant dispid 17;
    function  HandleToObject(const Handle: WideString): IDispatch; dispid 18;
    function  ObjectIdToObject(ObjectID: Integer): IDispatch; dispid 19;
    property Layouts: IAcadLayouts readonly dispid 20;
    property PlotConfigurations: IAcadPlotConfigurations readonly dispid 21;
    property Preferences: IAcadDatabasePreferences readonly dispid 22;
  end;

// *********************************************************************//
// Interface: IAcadBlock
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E932588-FFE7-11D1-B649-0060B087E235}
// *********************************************************************//
  IAcadBlock = interface(IAcadObject)
    ['{5E932588-FFE7-11D1-B649-0060B087E235}']
    function  Item(Index: OleVariant): IAcadEntity; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Origin: OleVariant; safecall;
    procedure Set_Origin(Origin: OleVariant); safecall;
    function  AddCustomObject(const ClassName: WideString): IDispatch; safecall;
    function  Add3DFace(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                        Point4: OleVariant): IAcad3DFace; safecall;
    function  Add3DMesh(M: SYSINT; N: SYSINT; PointsMatrix: OleVariant): IAcadPolygonMesh; safecall;
    function  Add3DPoly(PointsArray: OleVariant): IAcad3DPolyline; safecall;
    function  AddArc(Center: OleVariant; Radius: Double; StartAngle: Double; EndAngle: Double): IAcadArc; safecall;
    function  AddAttribute(Height: Double; Mode: AcAttributeMode; const Prompt: WideString;
                           InsertionPoint: OleVariant; const Tag: WideString;
                           const Value: WideString): IAcadAttribute; safecall;
    function  AddBox(Origin: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; safecall;
    function  AddCircle(Center: OleVariant; Radius: Double): IAcadCircle; safecall;
    function  AddCone(Center: OleVariant; BaseRadius: Double; Height: Double): IAcad3DSolid; safecall;
    function  AddCylinder(Center: OleVariant; Radius: Double; Height: Double): IAcad3DSolid; safecall;
    function  AddDimAligned(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            TextPosition: OleVariant): IAcadDimAligned; safecall;
    function  AddDimAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                            SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDimAngular; safecall;
    function  AddDimDiametric(ChordPoint: OleVariant; FarChordPoint: OleVariant;
                              LeaderLength: Double): IAcadDimDiametric; safecall;
    function  AddDimRotated(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            DimLineLocation: OleVariant; RotationAngle: Double): IAcadDimRotated; safecall;
    function  AddDimOrdinate(DefinitionPoint: OleVariant; LeaderEndPoint: OleVariant;
                             UseXAxis: SYSINT): IAcadDimOrdinate; safecall;
    function  AddDimRadial(Center: OleVariant; ChordPoint: OleVariant; LeaderLength: Double): IAcadDimRadial; safecall;
    function  AddEllipse(Center: OleVariant; MajorAxis: OleVariant; RadiusRatio: Double): IAcadEllipse; safecall;
    function  AddEllipticalCone(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                Height: Double): IAcad3DSolid; safecall;
    function  AddEllipticalCylinder(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                    Height: Double): IAcad3DSolid; safecall;
    function  AddExtrudedSolid(const Profile: IAcadRegion; Height: Double; TaperAngle: Double): IAcad3DSolid; safecall;
    function  AddExtrudedSolidAlongPath(const Profile: IAcadRegion; const Path: IDispatch): IAcad3DSolid; safecall;
    function  AddLeader(PointsArray: OleVariant; const Annotation: IAcadEntity; Type_: AcLeaderType): IAcadLeader; safecall;
    function  AddMText(InsertionPoint: OleVariant; Width: Double; const Text: WideString): IAcadMText; safecall;
    function  AddPoint(Point: OleVariant): IAcadPoint; safecall;
    function  AddLightWeightPolyline(VerticesList: OleVariant): IAcadLWPolyline; safecall;
    function  AddPolyline(VerticesList: OleVariant): IAcadPolyline; safecall;
    function  AddRay(Point1: OleVariant; Point2: OleVariant): IAcadRay; safecall;
    function  AddRegion(ObjectList: OleVariant): OleVariant; safecall;
    function  AddRevolvedSolid(const Profile: IAcadRegion; AxisPoint: OleVariant;
                               AxisDir: OleVariant; Angle: Double): IAcad3DSolid; safecall;
    function  AddShape(const Name: WideString; InsertionPoint: OleVariant; ScaleFactor: Double;
                       RotationAngle: Double): IAcadShape; safecall;
    function  AddSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                       Point4: OleVariant): IAcadSolid; safecall;
    function  AddSphere(Center: OleVariant; Radius: Double): IAcad3DSolid; safecall;
    function  AddSpline(PointsArray: OleVariant; StartTangent: OleVariant; EndTangent: OleVariant): IAcadSpline; safecall;
    function  AddText(const TextString: WideString; InsertionPoint: OleVariant; Height: Double): IAcadText; safecall;
    function  AddTolerance(const Text: WideString; InsertionPoint: OleVariant; Direction: OleVariant): IAcadTolerance; safecall;
    function  AddTorus(Center: OleVariant; TorusRadius: Double; TubeRadius: Double): IAcad3DSolid; safecall;
    function  AddTrace(PointsArray: OleVariant): IAcadTrace; safecall;
    function  AddWedge(Center: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; safecall;
    function  AddXline(Point1: OleVariant; Point2: OleVariant): IAcadXline; safecall;
    function  InsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                          Yscale: Double; Zscale: Double; Rotation: Double): IAcadBlockReference; safecall;
    function  AddHatch(PatternType: SYSINT; const PatternName: WideString; Associativity: WordBool): IAcadHatch; safecall;
    function  AddRaster(const imageFileName: WideString; InsertionPoint: OleVariant;
                        ScaleFactor: Double; RotationAngle: Double): IAcadRasterImage; safecall;
    function  AddLine(StartPoint: OleVariant; EndPoint: OleVariant): IAcadLine; safecall;
    function  Get_IsLayout: WordBool; safecall;
    function  Get_Layout: IAcadLayout; safecall;
    function  Get_IsXRef: WordBool; safecall;
    function  AddMInsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                              Yscale: Double; Zscale: Double; Rotation: Double; NumRows: Integer;
                              NumColumns: Integer; RowSpacing: Integer; ColumnSpacing: Integer): IAcadMInsertBlock; safecall;
    function  AddPolyfaceMesh(VertexList: OleVariant; FaceList: OleVariant): IAcadPolyfaceMesh; safecall;
    function  AddMLine(VertexList: OleVariant): IAcadMLine; safecall;
    function  AddDim3PointAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                                  SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDim3PointAngular; safecall;
    function  Get_XRefDatabase: IAcadDatabase; safecall;
    function  AttachExternalReference(const PathName: WideString; const Name: WideString;
                                      InsertionPoint: OleVariant; Xscale: Double; Yscale: Double;
                                      Zscale: Double; Rotation: Double; bOverlay: WordBool): IAcadExternalReference; safecall;
    procedure Unload; safecall;
    procedure Reload; safecall;
    procedure Bind(bPrefixName: WordBool); safecall;
    procedure Detach; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Name: WideString read Get_Name write Set_Name;
    property Origin: OleVariant read Get_Origin write Set_Origin;
    property IsLayout: WordBool read Get_IsLayout;
    property Layout: IAcadLayout read Get_Layout;
    property IsXRef: WordBool read Get_IsXRef;
    property XRefDatabase: IAcadDatabase read Get_XRefDatabase;
  end;

// *********************************************************************//
// DispIntf:  IAcadBlockDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5E932588-FFE7-11D1-B649-0060B087E235}
// *********************************************************************//
  IAcadBlockDisp = dispinterface
    ['{5E932588-FFE7-11D1-B649-0060B087E235}']
    function  Item(Index: OleVariant): IAcadEntity; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1536;
    property Name: WideString dispid 1537;
    property Origin: OleVariant dispid 1538;
    function  AddCustomObject(const ClassName: WideString): IDispatch; dispid 1539;
    function  Add3DFace(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                        Point4: OleVariant): IAcad3DFace; dispid 1540;
    function  Add3DMesh(M: SYSINT; N: SYSINT; PointsMatrix: OleVariant): IAcadPolygonMesh; dispid 1541;
    function  Add3DPoly(PointsArray: OleVariant): IAcad3DPolyline; dispid 1542;
    function  AddArc(Center: OleVariant; Radius: Double; StartAngle: Double; EndAngle: Double): IAcadArc; dispid 1543;
    function  AddAttribute(Height: Double; Mode: AcAttributeMode; const Prompt: WideString;
                           InsertionPoint: OleVariant; const Tag: WideString;
                           const Value: WideString): IAcadAttribute; dispid 1544;
    function  AddBox(Origin: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1545;
    function  AddCircle(Center: OleVariant; Radius: Double): IAcadCircle; dispid 1546;
    function  AddCone(Center: OleVariant; BaseRadius: Double; Height: Double): IAcad3DSolid; dispid 1547;
    function  AddCylinder(Center: OleVariant; Radius: Double; Height: Double): IAcad3DSolid; dispid 1548;
    function  AddDimAligned(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            TextPosition: OleVariant): IAcadDimAligned; dispid 1549;
    function  AddDimAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                            SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDimAngular; dispid 1550;
    function  AddDimDiametric(ChordPoint: OleVariant; FarChordPoint: OleVariant;
                              LeaderLength: Double): IAcadDimDiametric; dispid 1551;
    function  AddDimRotated(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            DimLineLocation: OleVariant; RotationAngle: Double): IAcadDimRotated; dispid 1552;
    function  AddDimOrdinate(DefinitionPoint: OleVariant; LeaderEndPoint: OleVariant;
                             UseXAxis: SYSINT): IAcadDimOrdinate; dispid 1553;
    function  AddDimRadial(Center: OleVariant; ChordPoint: OleVariant; LeaderLength: Double): IAcadDimRadial; dispid 1554;
    function  AddEllipse(Center: OleVariant; MajorAxis: OleVariant; RadiusRatio: Double): IAcadEllipse; dispid 1555;
    function  AddEllipticalCone(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                Height: Double): IAcad3DSolid; dispid 1556;
    function  AddEllipticalCylinder(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                    Height: Double): IAcad3DSolid; dispid 1557;
    function  AddExtrudedSolid(const Profile: IAcadRegion; Height: Double; TaperAngle: Double): IAcad3DSolid; dispid 1558;
    function  AddExtrudedSolidAlongPath(const Profile: IAcadRegion; const Path: IDispatch): IAcad3DSolid; dispid 1559;
    function  AddLeader(PointsArray: OleVariant; const Annotation: IAcadEntity; Type_: AcLeaderType): IAcadLeader; dispid 1560;
    function  AddMText(InsertionPoint: OleVariant; Width: Double; const Text: WideString): IAcadMText; dispid 1561;
    function  AddPoint(Point: OleVariant): IAcadPoint; dispid 1562;
    function  AddLightWeightPolyline(VerticesList: OleVariant): IAcadLWPolyline; dispid 1563;
    function  AddPolyline(VerticesList: OleVariant): IAcadPolyline; dispid 1564;
    function  AddRay(Point1: OleVariant; Point2: OleVariant): IAcadRay; dispid 1565;
    function  AddRegion(ObjectList: OleVariant): OleVariant; dispid 1566;
    function  AddRevolvedSolid(const Profile: IAcadRegion; AxisPoint: OleVariant;
                               AxisDir: OleVariant; Angle: Double): IAcad3DSolid; dispid 1567;
    function  AddShape(const Name: WideString; InsertionPoint: OleVariant; ScaleFactor: Double;
                       RotationAngle: Double): IAcadShape; dispid 1568;
    function  AddSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                       Point4: OleVariant): IAcadSolid; dispid 1569;
    function  AddSphere(Center: OleVariant; Radius: Double): IAcad3DSolid; dispid 1570;
    function  AddSpline(PointsArray: OleVariant; StartTangent: OleVariant; EndTangent: OleVariant): IAcadSpline; dispid 1571;
    function  AddText(const TextString: WideString; InsertionPoint: OleVariant; Height: Double): IAcadText; dispid 1572;
    function  AddTolerance(const Text: WideString; InsertionPoint: OleVariant; Direction: OleVariant): IAcadTolerance; dispid 1573;
    function  AddTorus(Center: OleVariant; TorusRadius: Double; TubeRadius: Double): IAcad3DSolid; dispid 1574;
    function  AddTrace(PointsArray: OleVariant): IAcadTrace; dispid 1575;
    function  AddWedge(Center: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1576;
    function  AddXline(Point1: OleVariant; Point2: OleVariant): IAcadXline; dispid 1577;
    function  InsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                          Yscale: Double; Zscale: Double; Rotation: Double): IAcadBlockReference; dispid 1578;
    function  AddHatch(PatternType: SYSINT; const PatternName: WideString; Associativity: WordBool): IAcadHatch; dispid 1579;
    function  AddRaster(const imageFileName: WideString; InsertionPoint: OleVariant;
                        ScaleFactor: Double; RotationAngle: Double): IAcadRasterImage; dispid 1580;
    function  AddLine(StartPoint: OleVariant; EndPoint: OleVariant): IAcadLine; dispid 1581;
    property IsLayout: WordBool readonly dispid 1582;
    property Layout: IAcadLayout readonly dispid 1583;
    property IsXRef: WordBool readonly dispid 1584;
    function  AddMInsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                              Yscale: Double; Zscale: Double; Rotation: Double; NumRows: Integer;
                              NumColumns: Integer; RowSpacing: Integer; ColumnSpacing: Integer): IAcadMInsertBlock; dispid 1585;
    function  AddPolyfaceMesh(VertexList: OleVariant; FaceList: OleVariant): IAcadPolyfaceMesh; dispid 1586;
    function  AddMLine(VertexList: OleVariant): IAcadMLine; dispid 1587;
    function  AddDim3PointAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                                  SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDim3PointAngular; dispid 1588;
    property XRefDatabase: IAcadDatabase readonly dispid 1589;
    function  AttachExternalReference(const PathName: WideString; const Name: WideString;
                                      InsertionPoint: OleVariant; Xscale: Double; Yscale: Double;
                                      Zscale: Double; Rotation: Double; bOverlay: WordBool): IAcadExternalReference; dispid 1590;
    procedure Unload; dispid 1591;
    procedure Reload; dispid 1592;
    procedure Bind(bPrefixName: WordBool); dispid 1593;
    procedure Detach; dispid 1594;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadModelSpace
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E94-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadModelSpace = interface(IAcadBlock)
    ['{A1617E94-FB21-11D1-A2C8-080009DC639A}']
  end;

// *********************************************************************//
// DispIntf:  IAcadModelSpaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E94-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadModelSpaceDisp = dispinterface
    ['{A1617E94-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadEntity; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1536;
    property Name: WideString dispid 1537;
    property Origin: OleVariant dispid 1538;
    function  AddCustomObject(const ClassName: WideString): IDispatch; dispid 1539;
    function  Add3DFace(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                        Point4: OleVariant): IAcad3DFace; dispid 1540;
    function  Add3DMesh(M: SYSINT; N: SYSINT; PointsMatrix: OleVariant): IAcadPolygonMesh; dispid 1541;
    function  Add3DPoly(PointsArray: OleVariant): IAcad3DPolyline; dispid 1542;
    function  AddArc(Center: OleVariant; Radius: Double; StartAngle: Double; EndAngle: Double): IAcadArc; dispid 1543;
    function  AddAttribute(Height: Double; Mode: AcAttributeMode; const Prompt: WideString;
                           InsertionPoint: OleVariant; const Tag: WideString;
                           const Value: WideString): IAcadAttribute; dispid 1544;
    function  AddBox(Origin: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1545;
    function  AddCircle(Center: OleVariant; Radius: Double): IAcadCircle; dispid 1546;
    function  AddCone(Center: OleVariant; BaseRadius: Double; Height: Double): IAcad3DSolid; dispid 1547;
    function  AddCylinder(Center: OleVariant; Radius: Double; Height: Double): IAcad3DSolid; dispid 1548;
    function  AddDimAligned(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            TextPosition: OleVariant): IAcadDimAligned; dispid 1549;
    function  AddDimAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                            SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDimAngular; dispid 1550;
    function  AddDimDiametric(ChordPoint: OleVariant; FarChordPoint: OleVariant;
                              LeaderLength: Double): IAcadDimDiametric; dispid 1551;
    function  AddDimRotated(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            DimLineLocation: OleVariant; RotationAngle: Double): IAcadDimRotated; dispid 1552;
    function  AddDimOrdinate(DefinitionPoint: OleVariant; LeaderEndPoint: OleVariant;
                             UseXAxis: SYSINT): IAcadDimOrdinate; dispid 1553;
    function  AddDimRadial(Center: OleVariant; ChordPoint: OleVariant; LeaderLength: Double): IAcadDimRadial; dispid 1554;
    function  AddEllipse(Center: OleVariant; MajorAxis: OleVariant; RadiusRatio: Double): IAcadEllipse; dispid 1555;
    function  AddEllipticalCone(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                Height: Double): IAcad3DSolid; dispid 1556;
    function  AddEllipticalCylinder(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                    Height: Double): IAcad3DSolid; dispid 1557;
    function  AddExtrudedSolid(const Profile: IAcadRegion; Height: Double; TaperAngle: Double): IAcad3DSolid; dispid 1558;
    function  AddExtrudedSolidAlongPath(const Profile: IAcadRegion; const Path: IDispatch): IAcad3DSolid; dispid 1559;
    function  AddLeader(PointsArray: OleVariant; const Annotation: IAcadEntity; Type_: AcLeaderType): IAcadLeader; dispid 1560;
    function  AddMText(InsertionPoint: OleVariant; Width: Double; const Text: WideString): IAcadMText; dispid 1561;
    function  AddPoint(Point: OleVariant): IAcadPoint; dispid 1562;
    function  AddLightWeightPolyline(VerticesList: OleVariant): IAcadLWPolyline; dispid 1563;
    function  AddPolyline(VerticesList: OleVariant): IAcadPolyline; dispid 1564;
    function  AddRay(Point1: OleVariant; Point2: OleVariant): IAcadRay; dispid 1565;
    function  AddRegion(ObjectList: OleVariant): OleVariant; dispid 1566;
    function  AddRevolvedSolid(const Profile: IAcadRegion; AxisPoint: OleVariant;
                               AxisDir: OleVariant; Angle: Double): IAcad3DSolid; dispid 1567;
    function  AddShape(const Name: WideString; InsertionPoint: OleVariant; ScaleFactor: Double;
                       RotationAngle: Double): IAcadShape; dispid 1568;
    function  AddSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                       Point4: OleVariant): IAcadSolid; dispid 1569;
    function  AddSphere(Center: OleVariant; Radius: Double): IAcad3DSolid; dispid 1570;
    function  AddSpline(PointsArray: OleVariant; StartTangent: OleVariant; EndTangent: OleVariant): IAcadSpline; dispid 1571;
    function  AddText(const TextString: WideString; InsertionPoint: OleVariant; Height: Double): IAcadText; dispid 1572;
    function  AddTolerance(const Text: WideString; InsertionPoint: OleVariant; Direction: OleVariant): IAcadTolerance; dispid 1573;
    function  AddTorus(Center: OleVariant; TorusRadius: Double; TubeRadius: Double): IAcad3DSolid; dispid 1574;
    function  AddTrace(PointsArray: OleVariant): IAcadTrace; dispid 1575;
    function  AddWedge(Center: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1576;
    function  AddXline(Point1: OleVariant; Point2: OleVariant): IAcadXline; dispid 1577;
    function  InsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                          Yscale: Double; Zscale: Double; Rotation: Double): IAcadBlockReference; dispid 1578;
    function  AddHatch(PatternType: SYSINT; const PatternName: WideString; Associativity: WordBool): IAcadHatch; dispid 1579;
    function  AddRaster(const imageFileName: WideString; InsertionPoint: OleVariant;
                        ScaleFactor: Double; RotationAngle: Double): IAcadRasterImage; dispid 1580;
    function  AddLine(StartPoint: OleVariant; EndPoint: OleVariant): IAcadLine; dispid 1581;
    property IsLayout: WordBool readonly dispid 1582;
    property Layout: IAcadLayout readonly dispid 1583;
    property IsXRef: WordBool readonly dispid 1584;
    function  AddMInsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                              Yscale: Double; Zscale: Double; Rotation: Double; NumRows: Integer;
                              NumColumns: Integer; RowSpacing: Integer; ColumnSpacing: Integer): IAcadMInsertBlock; dispid 1585;
    function  AddPolyfaceMesh(VertexList: OleVariant; FaceList: OleVariant): IAcadPolyfaceMesh; dispid 1586;
    function  AddMLine(VertexList: OleVariant): IAcadMLine; dispid 1587;
    function  AddDim3PointAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                                  SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDim3PointAngular; dispid 1588;
    property XRefDatabase: IAcadDatabase readonly dispid 1589;
    function  AttachExternalReference(const PathName: WideString; const Name: WideString;
                                      InsertionPoint: OleVariant; Xscale: Double; Yscale: Double;
                                      Zscale: Double; Rotation: Double; bOverlay: WordBool): IAcadExternalReference; dispid 1590;
    procedure Unload; dispid 1591;
    procedure Reload; dispid 1592;
    procedure Bind(bPrefixName: WordBool); dispid 1593;
    procedure Detach; dispid 1594;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadEntity
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B57EEA2-CA9A-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadEntity = interface(IAcadObject)
    ['{5B57EEA2-CA9A-11D1-B60F-0060B087E235}']
    function  Get_Color: ACAD_COLOR; safecall;
    procedure Set_Color(Color: ACAD_COLOR); safecall;
    function  Get_Layer: WideString; safecall;
    procedure Set_Layer(const Layer: WideString); safecall;
    function  Get_Linetype: WideString; safecall;
    procedure Set_Linetype(const Linetype: WideString); safecall;
    function  Get_LinetypeScale: ACAD_NOUNITS; safecall;
    procedure Set_LinetypeScale(ltScale: ACAD_NOUNITS); safecall;
    function  Get_Visible: WordBool; safecall;
    procedure Set_Visible(bVisible: WordBool); safecall;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; safecall;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; safecall;
    procedure Highlight(HighlightFlag: WordBool); safecall;
    function  Copy: IDispatch; safecall;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); safecall;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); safecall;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); safecall;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; safecall;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; safecall;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); safecall;
    procedure TransformBy(TransformationMatrix: OleVariant); safecall;
    procedure Update; safecall;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); safecall;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; safecall;
    function  Get_PlotStyleName: WideString; safecall;
    procedure Set_PlotStyleName(const plotStyle: WideString); safecall;
    function  Get_Lineweight: ACAD_LWEIGHT; safecall;
    procedure Set_Lineweight(Lineweight: ACAD_LWEIGHT); safecall;
    function  Get_Hyperlinks: IAcadHyperlinks; safecall;
    function  Get_EntityName: WideString; safecall;
    function  Get_EntityType: Integer; safecall;
    property Color: ACAD_COLOR read Get_Color write Set_Color;
    property Layer: WideString read Get_Layer write Set_Layer;
    property Linetype: WideString read Get_Linetype write Set_Linetype;
    property LinetypeScale: ACAD_NOUNITS read Get_LinetypeScale write Set_LinetypeScale;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property PlotStyleName: WideString read Get_PlotStyleName write Set_PlotStyleName;
    property Lineweight: ACAD_LWEIGHT read Get_Lineweight write Set_Lineweight;
    property Hyperlinks: IAcadHyperlinks read Get_Hyperlinks;
    property EntityName: WideString read Get_EntityName;
    property EntityType: Integer read Get_EntityType;
  end;

// *********************************************************************//
// DispIntf:  IAcadEntityDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {5B57EEA2-CA9A-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadEntityDisp = dispinterface
    ['{5B57EEA2-CA9A-11D1-B60F-0060B087E235}']
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadHyperlinks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D92-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadHyperlinks = interface(IDispatch)
    ['{B2547D92-056E-11D2-B651-0060B087E235}']
    function  Item(Index: Integer): IAcadHyperlink; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Application: IDispatch; safecall;
    function  Add(const Name: WideString; Description: OleVariant; NamedLocation: OleVariant): IAcadHyperlink; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Application: IDispatch read Get_Application;
  end;

// *********************************************************************//
// DispIntf:  IAcadHyperlinksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D92-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadHyperlinksDisp = dispinterface
    ['{B2547D92-056E-11D2-B651-0060B087E235}']
    function  Item(Index: Integer): IAcadHyperlink; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    property Application: IDispatch readonly dispid 2;
    function  Add(const Name: WideString; Description: OleVariant; NamedLocation: OleVariant): IAcadHyperlink; dispid 3;
  end;

// *********************************************************************//
// Interface: IAcadHyperlink
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D94-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadHyperlink = interface(IDispatch)
    ['{B2547D94-CA93-11D1-B60F-0060B087E235}']
    procedure Set_URL(const URLPath: WideString); safecall;
    function  Get_URL: WideString; safecall;
    procedure Set_URLDescription(const Description: WideString); safecall;
    function  Get_URLDescription: WideString; safecall;
    function  Get_Application: IDispatch; safecall;
    procedure Delete; safecall;
    procedure Set_URLNamedLocation(const Location: WideString); safecall;
    function  Get_URLNamedLocation: WideString; safecall;
    property URL: WideString read Get_URL write Set_URL;
    property URLDescription: WideString read Get_URLDescription write Set_URLDescription;
    property Application: IDispatch read Get_Application;
    property URLNamedLocation: WideString read Get_URLNamedLocation write Set_URLNamedLocation;
  end;

// *********************************************************************//
// DispIntf:  IAcadHyperlinkDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D94-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadHyperlinkDisp = dispinterface
    ['{B2547D94-CA93-11D1-B60F-0060B087E235}']
    property URL: WideString dispid 1;
    property URLDescription: WideString dispid 2;
    property Application: IDispatch readonly dispid 3;
    procedure Delete; dispid 4;
    property URLNamedLocation: WideString dispid 5;
  end;

// *********************************************************************//
// Interface: IAcad3DFace
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D496-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DFace = interface(IAcadEntity)
    ['{2928D496-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(corners: OleVariant); safecall;
    function  Get_VisibilityEdge1: WordBool; safecall;
    procedure Set_VisibilityEdge1(visibility: WordBool); safecall;
    function  Get_VisibilityEdge2: WordBool; safecall;
    procedure Set_VisibilityEdge2(visibility: WordBool); safecall;
    function  Get_VisibilityEdge3: WordBool; safecall;
    procedure Set_VisibilityEdge3(visibility: WordBool); safecall;
    function  Get_VisibilityEdge4: WordBool; safecall;
    procedure Set_VisibilityEdge4(visibility: WordBool); safecall;
    function  GetInvisibleEdge(Index: SYSINT): WordBool; safecall;
    procedure SetInvisibleEdge(Index: SYSINT; State: WordBool); safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property VisibilityEdge1: WordBool read Get_VisibilityEdge1 write Set_VisibilityEdge1;
    property VisibilityEdge2: WordBool read Get_VisibilityEdge2 write Set_VisibilityEdge2;
    property VisibilityEdge3: WordBool read Get_VisibilityEdge3 write Set_VisibilityEdge3;
    property VisibilityEdge4: WordBool read Get_VisibilityEdge4 write Set_VisibilityEdge4;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
  end;

// *********************************************************************//
// DispIntf:  IAcad3DFaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D496-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DFaceDisp = dispinterface
    ['{2928D496-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property VisibilityEdge1: WordBool dispid 2;
    property VisibilityEdge2: WordBool dispid 3;
    property VisibilityEdge3: WordBool dispid 4;
    property VisibilityEdge4: WordBool dispid 5;
    function  GetInvisibleEdge(Index: SYSINT): WordBool; dispid 6;
    procedure SetInvisibleEdge(Index: SYSINT; State: WordBool); dispid 7;
    property Coordinate[Index: SYSINT]: OleVariant dispid 8;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPolygonMesh
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C3-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolygonMesh = interface(IAcadEntity)
    ['{2928D4C3-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    function  Get_MClose: WordBool; safecall;
    procedure Set_MClose(bClose: WordBool); safecall;
    function  Get_NClose: WordBool; safecall;
    procedure Set_NClose(bClose: WordBool); safecall;
    function  Get_MDensity: Integer; safecall;
    procedure Set_MDensity(density: Integer); safecall;
    function  Get_NDensity: Integer; safecall;
    procedure Set_NDensity(density: Integer); safecall;
    function  Get_MVertexCount: Integer; safecall;
    function  Get_NVertexCount: Integer; safecall;
    function  Get_Type_: AcPolymeshType; safecall;
    procedure Set_Type_(Type_: AcPolymeshType); safecall;
    procedure AppendVertex(vertex: OleVariant); safecall;
    function  Explode: OleVariant; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property MClose: WordBool read Get_MClose write Set_MClose;
    property NClose: WordBool read Get_NClose write Set_NClose;
    property MDensity: Integer read Get_MDensity write Set_MDensity;
    property NDensity: Integer read Get_NDensity write Set_NDensity;
    property MVertexCount: Integer read Get_MVertexCount;
    property NVertexCount: Integer read Get_NVertexCount;
    property Type_: AcPolymeshType read Get_Type_ write Set_Type_;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
  end;

// *********************************************************************//
// DispIntf:  IAcadPolygonMeshDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C3-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolygonMeshDisp = dispinterface
    ['{2928D4C3-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property MClose: WordBool dispid 2;
    property NClose: WordBool dispid 3;
    property MDensity: Integer dispid 4;
    property NDensity: Integer dispid 5;
    property MVertexCount: Integer readonly dispid 6;
    property NVertexCount: Integer readonly dispid 7;
    property Type_: AcPolymeshType dispid 8;
    procedure AppendVertex(vertex: OleVariant); dispid 9;
    function  Explode: OleVariant; dispid 10;
    property Coordinate[Index: SYSINT]: OleVariant dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcad3DPolyline
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D498-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DPolyline = interface(IAcadEntity)
    ['{2928D498-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    procedure AppendVertex(vertex: OleVariant); safecall;
    function  Explode: OleVariant; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    function  Get_Type_: Ac3DPolylineType; safecall;
    procedure Set_Type_(Type_: Ac3DPolylineType); safecall;
    function  Get_Closed: WordBool; safecall;
    procedure Set_Closed(fClose: WordBool); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
    property Type_: Ac3DPolylineType read Get_Type_ write Set_Type_;
    property Closed: WordBool read Get_Closed write Set_Closed;
  end;

// *********************************************************************//
// DispIntf:  IAcad3DPolylineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D498-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DPolylineDisp = dispinterface
    ['{2928D498-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    procedure AppendVertex(vertex: OleVariant); dispid 2;
    function  Explode: OleVariant; dispid 3;
    property Coordinate[Index: SYSINT]: OleVariant dispid 4;
    property Type_: Ac3DPolylineType dispid 5;
    property Closed: WordBool dispid 6;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadArc
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49C-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadArc = interface(IAcadEntity)
    ['{2928D49C-CA93-11D1-B60F-0060B087E235}']
    function  Get_StartPoint: OleVariant; safecall;
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(CenterPoint: OleVariant); safecall;
    function  Get_EndPoint: OleVariant; safecall;
    function  Get_Radius: Double; safecall;
    procedure Set_Radius(Radius: Double); safecall;
    function  Get_StartAngle: ACAD_ANGLE; safecall;
    procedure Set_StartAngle(Angle: ACAD_ANGLE); safecall;
    function  Get_EndAngle: ACAD_ANGLE; safecall;
    procedure Set_EndAngle(Angle: ACAD_ANGLE); safecall;
    function  Get_TotalAngle: ACAD_ANGLE; safecall;
    function  Get_ArcLength: ACAD_DISTANCE; safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    function  Get_Area: Double; safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    property StartPoint: OleVariant read Get_StartPoint;
    property Center: OleVariant read Get_Center write Set_Center;
    property EndPoint: OleVariant read Get_EndPoint;
    property Radius: Double read Get_Radius write Set_Radius;
    property StartAngle: ACAD_ANGLE read Get_StartAngle write Set_StartAngle;
    property EndAngle: ACAD_ANGLE read Get_EndAngle write Set_EndAngle;
    property TotalAngle: ACAD_ANGLE read Get_TotalAngle;
    property ArcLength: ACAD_DISTANCE read Get_ArcLength;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property Area: Double read Get_Area;
    property Normal: OleVariant read Get_Normal write Set_Normal;
  end;

// *********************************************************************//
// DispIntf:  IAcadArcDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49C-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadArcDisp = dispinterface
    ['{2928D49C-CA93-11D1-B60F-0060B087E235}']
    property StartPoint: OleVariant readonly dispid 1;
    property Center: OleVariant dispid 2;
    property EndPoint: OleVariant readonly dispid 3;
    property Radius: Double dispid 4;
    property StartAngle: ACAD_ANGLE dispid 5;
    property EndAngle: ACAD_ANGLE dispid 6;
    property TotalAngle: ACAD_ANGLE readonly dispid 7;
    property ArcLength: ACAD_DISTANCE readonly dispid 8;
    property Thickness: Double dispid 9;
    function  Offset(Distance: Double): OleVariant; dispid 10;
    property Area: Double readonly dispid 11;
    property Normal: OleVariant dispid 12;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadAttribute
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49E-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadAttribute = interface(IAcadEntity)
    ['{2928D49E-CA93-11D1-B60F-0060B087E235}']
    function  Get_FieldLength: Integer; safecall;
    procedure Set_FieldLength(fieldLen: Integer); safecall;
    function  Get_TagString: WideString; safecall;
    procedure Set_TagString(const Tag: WideString); safecall;
    function  Get_PromptString: WideString; safecall;
    procedure Set_PromptString(const bstrPrompt: WideString); safecall;
    function  Get_TextString: WideString; safecall;
    procedure Set_TextString(const bstrText: WideString); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const Name: WideString); safecall;
    function  Get_Alignment: AcAlignment; safecall;
    procedure Set_Alignment(align: AcAlignment); safecall;
    function  Get_HorizontalAlignment: AcHorizontalAlignment; safecall;
    procedure Set_HorizontalAlignment(horizAlign: AcHorizontalAlignment); safecall;
    function  Get_VerticalAlignment: AcVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(vertiAlign: AcVerticalAlignment); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(scalFactor: ACAD_NOUNITS); safecall;
    function  Get_ObliqueAngle: ACAD_ANGLE; safecall;
    procedure Set_ObliqueAngle(obliAngle: ACAD_ANGLE); safecall;
    function  Get_TextAlignmentPoint: OleVariant; safecall;
    procedure Set_TextAlignmentPoint(alignPoint: OleVariant); safecall;
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_TextGenerationFlag: Integer; safecall;
    procedure Set_TextGenerationFlag(textGenFlag: Integer); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Get_Mode: Integer; safecall;
    procedure Set_Mode(Mode: Integer); safecall;
    function  Get_UpsideDown: WordBool; safecall;
    procedure Set_UpsideDown(bUpsideDown: WordBool); safecall;
    function  Get_Backward: WordBool; safecall;
    procedure Set_Backward(bBackward: WordBool); safecall;
    function  Get_Invisible: WordBool; safecall;
    procedure Set_Invisible(bInvisible: WordBool); safecall;
    function  Get_Constant: WordBool; safecall;
    procedure Set_Constant(bConstant: WordBool); safecall;
    function  Get_Verify: WordBool; safecall;
    procedure Set_Verify(bVerify: WordBool); safecall;
    function  Get_Preset: WordBool; safecall;
    procedure Set_Preset(bPreset: WordBool); safecall;
    property FieldLength: Integer read Get_FieldLength write Set_FieldLength;
    property TagString: WideString read Get_TagString write Set_TagString;
    property PromptString: WideString read Get_PromptString write Set_PromptString;
    property TextString: WideString read Get_TextString write Set_TextString;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property Alignment: AcAlignment read Get_Alignment write Set_Alignment;
    property HorizontalAlignment: AcHorizontalAlignment read Get_HorizontalAlignment write Set_HorizontalAlignment;
    property VerticalAlignment: AcVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property Height: Double read Get_Height write Set_Height;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property ObliqueAngle: ACAD_ANGLE read Get_ObliqueAngle write Set_ObliqueAngle;
    property TextAlignmentPoint: OleVariant read Get_TextAlignmentPoint write Set_TextAlignmentPoint;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property TextGenerationFlag: Integer read Get_TextGenerationFlag write Set_TextGenerationFlag;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property Mode: Integer read Get_Mode write Set_Mode;
    property UpsideDown: WordBool read Get_UpsideDown write Set_UpsideDown;
    property Backward: WordBool read Get_Backward write Set_Backward;
    property Invisible: WordBool read Get_Invisible write Set_Invisible;
    property Constant: WordBool read Get_Constant write Set_Constant;
    property Verify: WordBool read Get_Verify write Set_Verify;
    property Preset: WordBool read Get_Preset write Set_Preset;
  end;

// *********************************************************************//
// DispIntf:  IAcadAttributeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49E-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadAttributeDisp = dispinterface
    ['{2928D49E-CA93-11D1-B60F-0060B087E235}']
    property FieldLength: Integer dispid 1;
    property TagString: WideString dispid 2;
    property PromptString: WideString dispid 3;
    property TextString: WideString dispid 4;
    property StyleName: WideString dispid 5;
    property Alignment: AcAlignment dispid 6;
    property HorizontalAlignment: AcHorizontalAlignment dispid 7;
    property VerticalAlignment: AcVerticalAlignment dispid 8;
    property Height: Double dispid 9;
    property Rotation: ACAD_ANGLE dispid 10;
    property ScaleFactor: ACAD_NOUNITS dispid 11;
    property ObliqueAngle: ACAD_ANGLE dispid 12;
    property TextAlignmentPoint: OleVariant dispid 13;
    property InsertionPoint: OleVariant dispid 14;
    property Normal: OleVariant dispid 15;
    property TextGenerationFlag: Integer dispid 16;
    property Thickness: Double dispid 17;
    property Mode: Integer dispid 18;
    property UpsideDown: WordBool dispid 19;
    property Backward: WordBool dispid 20;
    property Invisible: WordBool dispid 21;
    property Constant: WordBool dispid 22;
    property Verify: WordBool dispid 23;
    property Preset: WordBool dispid 24;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcad3DSolid
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49A-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DSolid = interface(IAcadEntity)
    ['{2928D49A-CA93-11D1-B60F-0060B087E235}']
    function  Get_Centroid: OleVariant; safecall;
    function  Get_MomentOfInertia: OleVariant; safecall;
    function  Get_PrincipalDirections: OleVariant; safecall;
    function  Get_PrincipalMoments: OleVariant; safecall;
    function  Get_ProductOfInertia: OleVariant; safecall;
    function  Get_RadiiOfGyration: OleVariant; safecall;
    function  Get_Volume: Double; safecall;
    procedure Boolean(Operation: AcBooleanType; const SolidObject: IAcad3DSolid); safecall;
    function  CheckInterference(const Object_: IAcad3DSolid; CreateInterferenceSolid: WordBool): IAcad3DSolid; safecall;
    function  SectionSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IAcadRegion; safecall;
    function  SliceSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                         Negative: WordBool): IAcad3DSolid; safecall;
    property Centroid: OleVariant read Get_Centroid;
    property MomentOfInertia: OleVariant read Get_MomentOfInertia;
    property PrincipalDirections: OleVariant read Get_PrincipalDirections;
    property PrincipalMoments: OleVariant read Get_PrincipalMoments;
    property ProductOfInertia: OleVariant read Get_ProductOfInertia;
    property RadiiOfGyration: OleVariant read Get_RadiiOfGyration;
    property Volume: Double read Get_Volume;
  end;

// *********************************************************************//
// DispIntf:  IAcad3DSolidDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D49A-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcad3DSolidDisp = dispinterface
    ['{2928D49A-CA93-11D1-B60F-0060B087E235}']
    property Centroid: OleVariant readonly dispid 1;
    property MomentOfInertia: OleVariant readonly dispid 2;
    property PrincipalDirections: OleVariant readonly dispid 3;
    property PrincipalMoments: OleVariant readonly dispid 4;
    property ProductOfInertia: OleVariant readonly dispid 5;
    property RadiiOfGyration: OleVariant readonly dispid 6;
    property Volume: Double readonly dispid 7;
    procedure Boolean(Operation: AcBooleanType; const SolidObject: IAcad3DSolid); dispid 8;
    function  CheckInterference(const Object_: IAcad3DSolid; CreateInterferenceSolid: WordBool): IAcad3DSolid; dispid 9;
    function  SectionSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IAcadRegion; dispid 10;
    function  SliceSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                         Negative: WordBool): IAcad3DSolid; dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadRegion
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C7-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRegion = interface(IAcadEntity)
    ['{2928D4C7-CA93-11D1-B60F-0060B087E235}']
    function  Get_Area: Double; safecall;
    function  Get_Centroid: OleVariant; safecall;
    function  Get_MomentOfInertia: OleVariant; safecall;
    function  Get_Normal: OleVariant; safecall;
    function  Get_Perimeter: Double; safecall;
    function  Get_PrincipalDirections: OleVariant; safecall;
    function  Get_PrincipalMoments: OleVariant; safecall;
    function  Get_ProductOfInertia: Double; safecall;
    function  Get_RadiiOfGyration: OleVariant; safecall;
    procedure Boolean(Operation: AcBooleanType; const Object_: IAcadRegion); safecall;
    function  Explode: OleVariant; safecall;
    property Area: Double read Get_Area;
    property Centroid: OleVariant read Get_Centroid;
    property MomentOfInertia: OleVariant read Get_MomentOfInertia;
    property Normal: OleVariant read Get_Normal;
    property Perimeter: Double read Get_Perimeter;
    property PrincipalDirections: OleVariant read Get_PrincipalDirections;
    property PrincipalMoments: OleVariant read Get_PrincipalMoments;
    property ProductOfInertia: Double read Get_ProductOfInertia;
    property RadiiOfGyration: OleVariant read Get_RadiiOfGyration;
  end;

// *********************************************************************//
// DispIntf:  IAcadRegionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C7-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRegionDisp = dispinterface
    ['{2928D4C7-CA93-11D1-B60F-0060B087E235}']
    property Area: Double readonly dispid 1;
    property Centroid: OleVariant readonly dispid 2;
    property MomentOfInertia: OleVariant readonly dispid 3;
    property Normal: OleVariant readonly dispid 4;
    property Perimeter: Double readonly dispid 5;
    property PrincipalDirections: OleVariant readonly dispid 6;
    property PrincipalMoments: OleVariant readonly dispid 7;
    property ProductOfInertia: Double readonly dispid 8;
    property RadiiOfGyration: OleVariant readonly dispid 9;
    procedure Boolean(Operation: AcBooleanType; const Object_: IAcadRegion); dispid 10;
    function  Explode: OleVariant; dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadCircle
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadCircle = interface(IAcadEntity)
    ['{2928D4A4-CA93-11D1-B60F-0060B087E235}']
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(CenterPoint: OleVariant); safecall;
    function  Get_Radius: Double; safecall;
    procedure Set_Radius(Radius: Double); safecall;
    function  Get_Diameter: Double; safecall;
    procedure Set_Diameter(Diameter: Double); safecall;
    function  Get_Circumference: Double; safecall;
    procedure Set_Circumference(Circumference: Double); safecall;
    function  Get_Area: Double; safecall;
    procedure Set_Area(Area: Double); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    property Center: OleVariant read Get_Center write Set_Center;
    property Radius: Double read Get_Radius write Set_Radius;
    property Diameter: Double read Get_Diameter write Set_Diameter;
    property Circumference: Double read Get_Circumference write Set_Circumference;
    property Area: Double read Get_Area write Set_Area;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
  end;

// *********************************************************************//
// DispIntf:  IAcadCircleDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadCircleDisp = dispinterface
    ['{2928D4A4-CA93-11D1-B60F-0060B087E235}']
    property Center: OleVariant dispid 1;
    property Radius: Double dispid 2;
    property Diameter: Double dispid 3;
    property Circumference: Double dispid 4;
    property Area: Double dispid 5;
    property Normal: OleVariant dispid 6;
    property Thickness: Double dispid 7;
    function  Offset(Distance: Double): OleVariant; dispid 8;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimension
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4BE847C2-F032-11D1-BD1C-0080C82058CD}
// *********************************************************************//
  IAcadDimension = interface(IAcadEntity)
    ['{4BE847C2-F032-11D1-BD1C-0080C82058CD}']
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_TextPosition: OleVariant; safecall;
    procedure Set_TextPosition(textPos: OleVariant); safecall;
    function  Get_TextRotation: ACAD_ANGLE; safecall;
    procedure Set_TextRotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_TextOverride: WideString; safecall;
    procedure Set_TextOverride(const bstrText: WideString); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const bstrName: WideString); safecall;
    function  Get_TextColor: ACAD_COLOR; safecall;
    procedure Set_TextColor(Color: ACAD_COLOR); safecall;
    function  Get_DecimalSeparator: WideString; safecall;
    procedure Set_DecimalSeparator(const character: WideString); safecall;
    function  Get_TextGap: Double; safecall;
    procedure Set_TextGap(Offset: Double); safecall;
    function  Get_TextPrefix: WideString; safecall;
    procedure Set_TextPrefix(const prefix: WideString); safecall;
    function  Get_TextSuffix: WideString; safecall;
    procedure Set_TextSuffix(const suffix: WideString); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(factor: ACAD_NOUNITS); safecall;
    function  Get_VerticalTextPosition: AcDimVerticalJustification; safecall;
    procedure Set_VerticalTextPosition(Type_: AcDimVerticalJustification); safecall;
    function  Get_TolerancePrecision: AcDimPrecision; safecall;
    procedure Set_TolerancePrecision(precision: AcDimPrecision); safecall;
    function  Get_ToleranceHeightScale: ACAD_NOUNITS; safecall;
    procedure Set_ToleranceHeightScale(scale: ACAD_NOUNITS); safecall;
    function  Get_ToleranceLowerLimit: Double; safecall;
    procedure Set_ToleranceLowerLimit(lower: Double); safecall;
    function  Get_TextMovement: AcDimTextMovement; safecall;
    procedure Set_TextMovement(Move: AcDimTextMovement); safecall;
    function  Get_ToleranceDisplay: AcDimToleranceMethod; safecall;
    procedure Set_ToleranceDisplay(method: AcDimToleranceMethod); safecall;
    function  Get_ToleranceJustification: AcDimToleranceJustify; safecall;
    procedure Set_ToleranceJustification(method: AcDimToleranceJustify); safecall;
    function  Get_ToleranceUpperLimit: Double; safecall;
    procedure Set_ToleranceUpperLimit(upper: Double); safecall;
    function  Get_TextStyle: WideString; safecall;
    procedure Set_TextStyle(const style: WideString); safecall;
    function  Get_TextHeight: Double; safecall;
    procedure Set_TextHeight(Height: Double); safecall;
    function  Get_SuppressLeadingZeros: WordBool; safecall;
    procedure Set_SuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_SuppressTrailingZeros: WordBool; safecall;
    procedure Set_SuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_ToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_ToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property TextPosition: OleVariant read Get_TextPosition write Set_TextPosition;
    property TextRotation: ACAD_ANGLE read Get_TextRotation write Set_TextRotation;
    property TextOverride: WideString read Get_TextOverride write Set_TextOverride;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property TextColor: ACAD_COLOR read Get_TextColor write Set_TextColor;
    property DecimalSeparator: WideString read Get_DecimalSeparator write Set_DecimalSeparator;
    property TextGap: Double read Get_TextGap write Set_TextGap;
    property TextPrefix: WideString read Get_TextPrefix write Set_TextPrefix;
    property TextSuffix: WideString read Get_TextSuffix write Set_TextSuffix;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property VerticalTextPosition: AcDimVerticalJustification read Get_VerticalTextPosition write Set_VerticalTextPosition;
    property TolerancePrecision: AcDimPrecision read Get_TolerancePrecision write Set_TolerancePrecision;
    property ToleranceHeightScale: ACAD_NOUNITS read Get_ToleranceHeightScale write Set_ToleranceHeightScale;
    property ToleranceLowerLimit: Double read Get_ToleranceLowerLimit write Set_ToleranceLowerLimit;
    property TextMovement: AcDimTextMovement read Get_TextMovement write Set_TextMovement;
    property ToleranceDisplay: AcDimToleranceMethod read Get_ToleranceDisplay write Set_ToleranceDisplay;
    property ToleranceJustification: AcDimToleranceJustify read Get_ToleranceJustification write Set_ToleranceJustification;
    property ToleranceUpperLimit: Double read Get_ToleranceUpperLimit write Set_ToleranceUpperLimit;
    property TextStyle: WideString read Get_TextStyle write Set_TextStyle;
    property TextHeight: Double read Get_TextHeight write Set_TextHeight;
    property SuppressLeadingZeros: WordBool read Get_SuppressLeadingZeros write Set_SuppressLeadingZeros;
    property SuppressTrailingZeros: WordBool read Get_SuppressTrailingZeros write Set_SuppressTrailingZeros;
    property ToleranceSuppressLeadingZeros: WordBool read Get_ToleranceSuppressLeadingZeros write Set_ToleranceSuppressLeadingZeros;
    property ToleranceSuppressTrailingZeros: WordBool read Get_ToleranceSuppressTrailingZeros write Set_ToleranceSuppressTrailingZeros;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimensionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4BE847C2-F032-11D1-BD1C-0080C82058CD}
// *********************************************************************//
  IAcadDimensionDisp = dispinterface
    ['{4BE847C2-F032-11D1-BD1C-0080C82058CD}']
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimAligned
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimAligned = interface(IAcadDimension)
    ['{2928D4A6-CA93-11D1-B60F-0060B087E235}']
    function  Get_ExtLine1Point: OleVariant; safecall;
    procedure Set_ExtLine1Point(xLine1Point: OleVariant); safecall;
    function  Get_ExtLine2Point: OleVariant; safecall;
    procedure Set_ExtLine2Point(xLine2Point: OleVariant); safecall;
    function  Get_AltUnits: WordBool; safecall;
    procedure Set_AltUnits(bAlternate: WordBool); safecall;
    function  Get_AltUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_AltUnitsPrecision(precision: AcDimPrecision); safecall;
    function  Get_AltUnitsScale: ACAD_NOUNITS; safecall;
    procedure Set_AltUnitsScale(scale: ACAD_NOUNITS); safecall;
    function  Get_AltRoundDistance: Double; safecall;
    procedure Set_AltRoundDistance(Distance: Double); safecall;
    function  Get_AltTolerancePrecision: AcDimPrecision; safecall;
    procedure Set_AltTolerancePrecision(Distance: AcDimPrecision); safecall;
    function  Get_AltUnitsFormat: AcDimUnits; safecall;
    procedure Set_AltUnitsFormat(Units: AcDimUnits); safecall;
    function  Get_AltTextPrefix: WideString; safecall;
    procedure Set_AltTextPrefix(const prefix: WideString); safecall;
    function  Get_AltTextSuffix: WideString; safecall;
    procedure Set_AltTextSuffix(const suffix: WideString); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Color: ACAD_COLOR); safecall;
    function  Get_ExtensionLineColor: ACAD_COLOR; safecall;
    procedure Set_ExtensionLineColor(Color: ACAD_COLOR); safecall;
    function  Get_PrimaryUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_PrimaryUnitsPrecision(Prec: AcDimPrecision); safecall;
    function  Get_DimensionLineExtend: Double; safecall;
    procedure Set_DimensionLineExtend(extend: Double); safecall;
    function  Get_ExtensionLineExtend: Double; safecall;
    procedure Set_ExtensionLineExtend(extend: Double); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_FractionFormat: AcDimFractionType; safecall;
    procedure Set_FractionFormat(Type_: AcDimFractionType); safecall;
    function  Get_HorizontalTextPosition: AcDimHorizontalJustification; safecall;
    procedure Set_HorizontalTextPosition(Type_: AcDimHorizontalJustification); safecall;
    function  Get_LinearScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_LinearScaleFactor(Type_: ACAD_NOUNITS); safecall;
    function  Get_UnitsFormat: AcDimLUnits; safecall;
    procedure Set_UnitsFormat(format: AcDimLUnits); safecall;
    function  Get_ExtensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_ExtensionLineWeight(lweight: ACAD_LWEIGHT); safecall;
    function  Get_RoundDistance: Double; safecall;
    procedure Set_RoundDistance(Distance: Double); safecall;
    function  Get_DimLine1Suppress: WordBool; safecall;
    procedure Set_DimLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLine2Suppress: WordBool; safecall;
    procedure Set_DimLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine1Suppress: WordBool; safecall;
    procedure Set_ExtLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine2Suppress: WordBool; safecall;
    procedure Set_ExtLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLineInside: WordBool; safecall;
    procedure Set_DimLineInside(bInside: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_ExtensionLineOffset: Double; safecall;
    procedure Set_ExtensionLineOffset(Offset: Double); safecall;
    function  Get_AltSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroInches: WordBool; safecall;
    procedure Set_AltSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_SuppressZeroFeet: WordBool; safecall;
    procedure Set_SuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_SuppressZeroInches: WordBool; safecall;
    procedure Set_SuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Arrowhead1Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead1Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Arrowhead2Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead2Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: Double; safecall;
    function  Get_Arrowhead1Block: WideString; safecall;
    procedure Set_Arrowhead1Block(const BlockName: WideString); safecall;
    function  Get_Arrowhead2Block: WideString; safecall;
    procedure Set_Arrowhead2Block(const BlockName: WideString); safecall;
    property ExtLine1Point: OleVariant read Get_ExtLine1Point write Set_ExtLine1Point;
    property ExtLine2Point: OleVariant read Get_ExtLine2Point write Set_ExtLine2Point;
    property AltUnits: WordBool read Get_AltUnits write Set_AltUnits;
    property AltUnitsPrecision: AcDimPrecision read Get_AltUnitsPrecision write Set_AltUnitsPrecision;
    property AltUnitsScale: ACAD_NOUNITS read Get_AltUnitsScale write Set_AltUnitsScale;
    property AltRoundDistance: Double read Get_AltRoundDistance write Set_AltRoundDistance;
    property AltTolerancePrecision: AcDimPrecision read Get_AltTolerancePrecision write Set_AltTolerancePrecision;
    property AltUnitsFormat: AcDimUnits read Get_AltUnitsFormat write Set_AltUnitsFormat;
    property AltTextPrefix: WideString read Get_AltTextPrefix write Set_AltTextPrefix;
    property AltTextSuffix: WideString read Get_AltTextSuffix write Set_AltTextSuffix;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property ExtensionLineColor: ACAD_COLOR read Get_ExtensionLineColor write Set_ExtensionLineColor;
    property PrimaryUnitsPrecision: AcDimPrecision read Get_PrimaryUnitsPrecision write Set_PrimaryUnitsPrecision;
    property DimensionLineExtend: Double read Get_DimensionLineExtend write Set_DimensionLineExtend;
    property ExtensionLineExtend: Double read Get_ExtensionLineExtend write Set_ExtensionLineExtend;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property FractionFormat: AcDimFractionType read Get_FractionFormat write Set_FractionFormat;
    property HorizontalTextPosition: AcDimHorizontalJustification read Get_HorizontalTextPosition write Set_HorizontalTextPosition;
    property LinearScaleFactor: ACAD_NOUNITS read Get_LinearScaleFactor write Set_LinearScaleFactor;
    property UnitsFormat: AcDimLUnits read Get_UnitsFormat write Set_UnitsFormat;
    property ExtensionLineWeight: ACAD_LWEIGHT read Get_ExtensionLineWeight write Set_ExtensionLineWeight;
    property RoundDistance: Double read Get_RoundDistance write Set_RoundDistance;
    property DimLine1Suppress: WordBool read Get_DimLine1Suppress write Set_DimLine1Suppress;
    property DimLine2Suppress: WordBool read Get_DimLine2Suppress write Set_DimLine2Suppress;
    property ExtLine1Suppress: WordBool read Get_ExtLine1Suppress write Set_ExtLine1Suppress;
    property ExtLine2Suppress: WordBool read Get_ExtLine2Suppress write Set_ExtLine2Suppress;
    property DimLineInside: WordBool read Get_DimLineInside write Set_DimLineInside;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property ExtensionLineOffset: Double read Get_ExtensionLineOffset write Set_ExtensionLineOffset;
    property AltSuppressLeadingZeros: WordBool read Get_AltSuppressLeadingZeros write Set_AltSuppressLeadingZeros;
    property AltSuppressTrailingZeros: WordBool read Get_AltSuppressTrailingZeros write Set_AltSuppressTrailingZeros;
    property AltSuppressZeroFeet: WordBool read Get_AltSuppressZeroFeet write Set_AltSuppressZeroFeet;
    property AltSuppressZeroInches: WordBool read Get_AltSuppressZeroInches write Set_AltSuppressZeroInches;
    property AltToleranceSuppressLeadingZeros: WordBool read Get_AltToleranceSuppressLeadingZeros write Set_AltToleranceSuppressLeadingZeros;
    property AltToleranceSuppressTrailingZeros: WordBool read Get_AltToleranceSuppressTrailingZeros write Set_AltToleranceSuppressTrailingZeros;
    property AltToleranceSuppressZeroFeet: WordBool read Get_AltToleranceSuppressZeroFeet write Set_AltToleranceSuppressZeroFeet;
    property AltToleranceSuppressZeroInches: WordBool read Get_AltToleranceSuppressZeroInches write Set_AltToleranceSuppressZeroInches;
    property SuppressZeroFeet: WordBool read Get_SuppressZeroFeet write Set_SuppressZeroFeet;
    property SuppressZeroInches: WordBool read Get_SuppressZeroInches write Set_SuppressZeroInches;
    property ToleranceSuppressZeroFeet: WordBool read Get_ToleranceSuppressZeroFeet write Set_ToleranceSuppressZeroFeet;
    property ToleranceSuppressZeroInches: WordBool read Get_ToleranceSuppressZeroInches write Set_ToleranceSuppressZeroInches;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Arrowhead1Type: AcDimArrowheadType read Get_Arrowhead1Type write Set_Arrowhead1Type;
    property Arrowhead2Type: AcDimArrowheadType read Get_Arrowhead2Type write Set_Arrowhead2Type;
    property Measurement: Double read Get_Measurement;
    property Arrowhead1Block: WideString read Get_Arrowhead1Block write Set_Arrowhead1Block;
    property Arrowhead2Block: WideString read Get_Arrowhead2Block write Set_Arrowhead2Block;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimAlignedDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimAlignedDisp = dispinterface
    ['{2928D4A6-CA93-11D1-B60F-0060B087E235}']
    property ExtLine1Point: OleVariant dispid 1;
    property ExtLine2Point: OleVariant dispid 2;
    property AltUnits: WordBool dispid 3;
    property AltUnitsPrecision: AcDimPrecision dispid 4;
    property AltUnitsScale: ACAD_NOUNITS dispid 5;
    property AltRoundDistance: Double dispid 6;
    property AltTolerancePrecision: AcDimPrecision dispid 7;
    property AltUnitsFormat: AcDimUnits dispid 9;
    property AltTextPrefix: WideString dispid 11;
    property AltTextSuffix: WideString dispid 12;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property ExtensionLineColor: ACAD_COLOR dispid 14;
    property PrimaryUnitsPrecision: AcDimPrecision dispid 15;
    property DimensionLineExtend: Double dispid 16;
    property ExtensionLineExtend: Double dispid 17;
    property Fit: AcDimFit dispid 18;
    property FractionFormat: AcDimFractionType dispid 19;
    property HorizontalTextPosition: AcDimHorizontalJustification dispid 20;
    property LinearScaleFactor: ACAD_NOUNITS dispid 21;
    property UnitsFormat: AcDimLUnits dispid 22;
    property ExtensionLineWeight: ACAD_LWEIGHT dispid 23;
    property RoundDistance: Double dispid 24;
    property DimLine1Suppress: WordBool dispid 25;
    property DimLine2Suppress: WordBool dispid 26;
    property ExtLine1Suppress: WordBool dispid 27;
    property ExtLine2Suppress: WordBool dispid 28;
    property DimLineInside: WordBool dispid 29;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property ExtensionLineOffset: Double dispid 35;
    property AltSuppressLeadingZeros: WordBool dispid 48;
    property AltSuppressTrailingZeros: WordBool dispid 49;
    property AltSuppressZeroFeet: WordBool dispid 50;
    property AltSuppressZeroInches: WordBool dispid 51;
    property AltToleranceSuppressLeadingZeros: WordBool dispid 52;
    property AltToleranceSuppressTrailingZeros: WordBool dispid 53;
    property AltToleranceSuppressZeroFeet: WordBool dispid 54;
    property AltToleranceSuppressZeroInches: WordBool dispid 55;
    property SuppressZeroFeet: WordBool dispid 56;
    property SuppressZeroInches: WordBool dispid 57;
    property ToleranceSuppressZeroFeet: WordBool dispid 58;
    property ToleranceSuppressZeroInches: WordBool dispid 59;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property Arrowhead1Type: AcDimArrowheadType dispid 62;
    property Arrowhead2Type: AcDimArrowheadType dispid 63;
    property Measurement: Double readonly dispid 64;
    property Arrowhead1Block: WideString dispid 65;
    property Arrowhead2Block: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimAngular
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A8-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimAngular = interface(IAcadDimension)
    ['{2928D4A8-CA93-11D1-B60F-0060B087E235}']
    function  Get_ExtLine1StartPoint: OleVariant; safecall;
    procedure Set_ExtLine1StartPoint(xLine1Point: OleVariant); safecall;
    function  Get_ExtLine1EndPoint: OleVariant; safecall;
    procedure Set_ExtLine1EndPoint(xLine1Point: OleVariant); safecall;
    function  Get_ExtLine2StartPoint: OleVariant; safecall;
    procedure Set_ExtLine2StartPoint(xLine2Point: OleVariant); safecall;
    function  Get_ExtLine2EndPoint: OleVariant; safecall;
    procedure Set_ExtLine2EndPoint(xLine2Point: OleVariant); safecall;
    function  Get_AngleFormat: AcAngleUnits; safecall;
    procedure Set_AngleFormat(format: AcAngleUnits); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_ExtensionLineColor: ACAD_COLOR; safecall;
    procedure Set_ExtensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_ExtensionLineExtend: Double; safecall;
    procedure Set_ExtensionLineExtend(extend: Double); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_HorizontalTextPosition: AcDimHorizontalJustification; safecall;
    procedure Set_HorizontalTextPosition(Type_: AcDimHorizontalJustification); safecall;
    function  Get_ExtensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_ExtensionLineWeight(lweight: ACAD_LWEIGHT); safecall;
    function  Get_DimLine1Suppress: WordBool; safecall;
    procedure Set_DimLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLine2Suppress: WordBool; safecall;
    procedure Set_DimLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine1Suppress: WordBool; safecall;
    procedure Set_ExtLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine2Suppress: WordBool; safecall;
    procedure Set_ExtLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLineInside: WordBool; safecall;
    procedure Set_DimLineInside(bInside: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_TextPrecision: AcDimPrecision; safecall;
    procedure Set_TextPrecision(precision: AcDimPrecision); safecall;
    function  Get_ExtensionLineOffset: Double; safecall;
    procedure Set_ExtensionLineOffset(Offset: Double); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Arrowhead1Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead1Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Arrowhead2Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead2Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: ACAD_ANGLE; safecall;
    function  Get_Arrowhead1Block: WideString; safecall;
    procedure Set_Arrowhead1Block(const BlockName: WideString); safecall;
    function  Get_Arrowhead2Block: WideString; safecall;
    procedure Set_Arrowhead2Block(const BlockName: WideString); safecall;
    property ExtLine1StartPoint: OleVariant read Get_ExtLine1StartPoint write Set_ExtLine1StartPoint;
    property ExtLine1EndPoint: OleVariant read Get_ExtLine1EndPoint write Set_ExtLine1EndPoint;
    property ExtLine2StartPoint: OleVariant read Get_ExtLine2StartPoint write Set_ExtLine2StartPoint;
    property ExtLine2EndPoint: OleVariant read Get_ExtLine2EndPoint write Set_ExtLine2EndPoint;
    property AngleFormat: AcAngleUnits read Get_AngleFormat write Set_AngleFormat;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property ExtensionLineColor: ACAD_COLOR read Get_ExtensionLineColor write Set_ExtensionLineColor;
    property ExtensionLineExtend: Double read Get_ExtensionLineExtend write Set_ExtensionLineExtend;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property HorizontalTextPosition: AcDimHorizontalJustification read Get_HorizontalTextPosition write Set_HorizontalTextPosition;
    property ExtensionLineWeight: ACAD_LWEIGHT read Get_ExtensionLineWeight write Set_ExtensionLineWeight;
    property DimLine1Suppress: WordBool read Get_DimLine1Suppress write Set_DimLine1Suppress;
    property DimLine2Suppress: WordBool read Get_DimLine2Suppress write Set_DimLine2Suppress;
    property ExtLine1Suppress: WordBool read Get_ExtLine1Suppress write Set_ExtLine1Suppress;
    property ExtLine2Suppress: WordBool read Get_ExtLine2Suppress write Set_ExtLine2Suppress;
    property DimLineInside: WordBool read Get_DimLineInside write Set_DimLineInside;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property TextPrecision: AcDimPrecision read Get_TextPrecision write Set_TextPrecision;
    property ExtensionLineOffset: Double read Get_ExtensionLineOffset write Set_ExtensionLineOffset;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Arrowhead1Type: AcDimArrowheadType read Get_Arrowhead1Type write Set_Arrowhead1Type;
    property Arrowhead2Type: AcDimArrowheadType read Get_Arrowhead2Type write Set_Arrowhead2Type;
    property Measurement: ACAD_ANGLE read Get_Measurement;
    property Arrowhead1Block: WideString read Get_Arrowhead1Block write Set_Arrowhead1Block;
    property Arrowhead2Block: WideString read Get_Arrowhead2Block write Set_Arrowhead2Block;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimAngularDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A8-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimAngularDisp = dispinterface
    ['{2928D4A8-CA93-11D1-B60F-0060B087E235}']
    property ExtLine1StartPoint: OleVariant dispid 37;
    property ExtLine1EndPoint: OleVariant dispid 38;
    property ExtLine2StartPoint: OleVariant dispid 39;
    property ExtLine2EndPoint: OleVariant dispid 40;
    property AngleFormat: AcAngleUnits dispid 41;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property ExtensionLineColor: ACAD_COLOR dispid 14;
    property ExtensionLineExtend: Double dispid 17;
    property Fit: AcDimFit dispid 18;
    property HorizontalTextPosition: AcDimHorizontalJustification dispid 20;
    property ExtensionLineWeight: ACAD_LWEIGHT dispid 23;
    property DimLine1Suppress: WordBool dispid 25;
    property DimLine2Suppress: WordBool dispid 26;
    property ExtLine1Suppress: WordBool dispid 27;
    property ExtLine2Suppress: WordBool dispid 28;
    property DimLineInside: WordBool dispid 29;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property TextPrecision: AcDimPrecision dispid 36;
    property ExtensionLineOffset: Double dispid 35;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property Arrowhead1Type: AcDimArrowheadType dispid 62;
    property Arrowhead2Type: AcDimArrowheadType dispid 63;
    property Measurement: ACAD_ANGLE readonly dispid 64;
    property Arrowhead1Block: WideString dispid 65;
    property Arrowhead2Block: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimDiametric
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AA-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimDiametric = interface(IAcadDimension)
    ['{2928D4AA-CA93-11D1-B60F-0060B087E235}']
    procedure Set_LeaderLength(Param1: Double); safecall;
    function  Get_AltUnits: WordBool; safecall;
    procedure Set_AltUnits(bAlternate: WordBool); safecall;
    function  Get_AltUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_AltUnitsPrecision(precision: AcDimPrecision); safecall;
    function  Get_AltUnitsScale: ACAD_NOUNITS; safecall;
    procedure Set_AltUnitsScale(scale: ACAD_NOUNITS); safecall;
    function  Get_AltRoundDistance: Double; safecall;
    procedure Set_AltRoundDistance(Distance: Double); safecall;
    function  Get_AltTolerancePrecision: AcDimPrecision; safecall;
    procedure Set_AltTolerancePrecision(Distance: AcDimPrecision); safecall;
    function  Get_AltUnitsFormat: AcDimUnits; safecall;
    procedure Set_AltUnitsFormat(Units: AcDimUnits); safecall;
    function  Get_AltTextPrefix: WideString; safecall;
    procedure Set_AltTextPrefix(const prefix: WideString); safecall;
    function  Get_AltTextSuffix: WideString; safecall;
    procedure Set_AltTextSuffix(const prefix: WideString); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_PrimaryUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_PrimaryUnitsPrecision(Prec: AcDimPrecision); safecall;
    function  Get_FractionFormat: AcDimFractionType; safecall;
    procedure Set_FractionFormat(Type_: AcDimFractionType); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_LinearScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_LinearScaleFactor(Type_: ACAD_NOUNITS); safecall;
    function  Get_UnitsFormat: AcDimLUnits; safecall;
    procedure Set_UnitsFormat(format: AcDimLUnits); safecall;
    function  Get_RoundDistance: Double; safecall;
    procedure Set_RoundDistance(Distance: Double); safecall;
    function  Get_DimLine1Suppress: WordBool; safecall;
    procedure Set_DimLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLine2Suppress: WordBool; safecall;
    procedure Set_DimLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_CenterType: AcDimCenterType; safecall;
    procedure Set_CenterType(Type_: AcDimCenterType); safecall;
    function  Get_CenterMarkSize: Double; safecall;
    procedure Set_CenterMarkSize(Type_: Double); safecall;
    function  Get_AltSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroInches: WordBool; safecall;
    procedure Set_AltSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_SuppressZeroFeet: WordBool; safecall;
    procedure Set_SuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_SuppressZeroInches: WordBool; safecall;
    procedure Set_SuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Arrowhead1Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead1Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Arrowhead2Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead2Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: Double; safecall;
    function  Get_Arrowhead1Block: WideString; safecall;
    procedure Set_Arrowhead1Block(const BlockName: WideString); safecall;
    function  Get_Arrowhead2Block: WideString; safecall;
    procedure Set_Arrowhead2Block(const BlockName: WideString); safecall;
    property LeaderLength: Double write Set_LeaderLength;
    property AltUnits: WordBool read Get_AltUnits write Set_AltUnits;
    property AltUnitsPrecision: AcDimPrecision read Get_AltUnitsPrecision write Set_AltUnitsPrecision;
    property AltUnitsScale: ACAD_NOUNITS read Get_AltUnitsScale write Set_AltUnitsScale;
    property AltRoundDistance: Double read Get_AltRoundDistance write Set_AltRoundDistance;
    property AltTolerancePrecision: AcDimPrecision read Get_AltTolerancePrecision write Set_AltTolerancePrecision;
    property AltUnitsFormat: AcDimUnits read Get_AltUnitsFormat write Set_AltUnitsFormat;
    property AltTextPrefix: WideString read Get_AltTextPrefix write Set_AltTextPrefix;
    property AltTextSuffix: WideString read Get_AltTextSuffix write Set_AltTextSuffix;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property PrimaryUnitsPrecision: AcDimPrecision read Get_PrimaryUnitsPrecision write Set_PrimaryUnitsPrecision;
    property FractionFormat: AcDimFractionType read Get_FractionFormat write Set_FractionFormat;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property LinearScaleFactor: ACAD_NOUNITS read Get_LinearScaleFactor write Set_LinearScaleFactor;
    property UnitsFormat: AcDimLUnits read Get_UnitsFormat write Set_UnitsFormat;
    property RoundDistance: Double read Get_RoundDistance write Set_RoundDistance;
    property DimLine1Suppress: WordBool read Get_DimLine1Suppress write Set_DimLine1Suppress;
    property DimLine2Suppress: WordBool read Get_DimLine2Suppress write Set_DimLine2Suppress;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property CenterType: AcDimCenterType read Get_CenterType write Set_CenterType;
    property CenterMarkSize: Double read Get_CenterMarkSize write Set_CenterMarkSize;
    property AltSuppressLeadingZeros: WordBool read Get_AltSuppressLeadingZeros write Set_AltSuppressLeadingZeros;
    property AltSuppressTrailingZeros: WordBool read Get_AltSuppressTrailingZeros write Set_AltSuppressTrailingZeros;
    property AltSuppressZeroFeet: WordBool read Get_AltSuppressZeroFeet write Set_AltSuppressZeroFeet;
    property AltSuppressZeroInches: WordBool read Get_AltSuppressZeroInches write Set_AltSuppressZeroInches;
    property AltToleranceSuppressLeadingZeros: WordBool read Get_AltToleranceSuppressLeadingZeros write Set_AltToleranceSuppressLeadingZeros;
    property AltToleranceSuppressTrailingZeros: WordBool read Get_AltToleranceSuppressTrailingZeros write Set_AltToleranceSuppressTrailingZeros;
    property AltToleranceSuppressZeroFeet: WordBool read Get_AltToleranceSuppressZeroFeet write Set_AltToleranceSuppressZeroFeet;
    property AltToleranceSuppressZeroInches: WordBool read Get_AltToleranceSuppressZeroInches write Set_AltToleranceSuppressZeroInches;
    property SuppressZeroFeet: WordBool read Get_SuppressZeroFeet write Set_SuppressZeroFeet;
    property SuppressZeroInches: WordBool read Get_SuppressZeroInches write Set_SuppressZeroInches;
    property ToleranceSuppressZeroFeet: WordBool read Get_ToleranceSuppressZeroFeet write Set_ToleranceSuppressZeroFeet;
    property ToleranceSuppressZeroInches: WordBool read Get_ToleranceSuppressZeroInches write Set_ToleranceSuppressZeroInches;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Arrowhead1Type: AcDimArrowheadType read Get_Arrowhead1Type write Set_Arrowhead1Type;
    property Arrowhead2Type: AcDimArrowheadType read Get_Arrowhead2Type write Set_Arrowhead2Type;
    property Measurement: Double read Get_Measurement;
    property Arrowhead1Block: WideString read Get_Arrowhead1Block write Set_Arrowhead1Block;
    property Arrowhead2Block: WideString read Get_Arrowhead2Block write Set_Arrowhead2Block;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimDiametricDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AA-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimDiametricDisp = dispinterface
    ['{2928D4AA-CA93-11D1-B60F-0060B087E235}']
    property LeaderLength: Double writeonly dispid 42;
    property AltUnits: WordBool dispid 3;
    property AltUnitsPrecision: AcDimPrecision dispid 4;
    property AltUnitsScale: ACAD_NOUNITS dispid 5;
    property AltRoundDistance: Double dispid 6;
    property AltTolerancePrecision: AcDimPrecision dispid 7;
    property AltUnitsFormat: AcDimUnits dispid 9;
    property AltTextPrefix: WideString dispid 11;
    property AltTextSuffix: WideString dispid 12;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property PrimaryUnitsPrecision: AcDimPrecision dispid 15;
    property FractionFormat: AcDimFractionType dispid 19;
    property Fit: AcDimFit dispid 18;
    property LinearScaleFactor: ACAD_NOUNITS dispid 21;
    property UnitsFormat: AcDimLUnits dispid 22;
    property RoundDistance: Double dispid 24;
    property DimLine1Suppress: WordBool dispid 25;
    property DimLine2Suppress: WordBool dispid 26;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property CenterType: AcDimCenterType dispid 43;
    property CenterMarkSize: Double dispid 44;
    property AltSuppressLeadingZeros: WordBool dispid 48;
    property AltSuppressTrailingZeros: WordBool dispid 49;
    property AltSuppressZeroFeet: WordBool dispid 50;
    property AltSuppressZeroInches: WordBool dispid 51;
    property AltToleranceSuppressLeadingZeros: WordBool dispid 52;
    property AltToleranceSuppressTrailingZeros: WordBool dispid 53;
    property AltToleranceSuppressZeroFeet: WordBool dispid 54;
    property AltToleranceSuppressZeroInches: WordBool dispid 55;
    property SuppressZeroFeet: WordBool dispid 56;
    property SuppressZeroInches: WordBool dispid 57;
    property ToleranceSuppressZeroFeet: WordBool dispid 58;
    property ToleranceSuppressZeroInches: WordBool dispid 59;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property Arrowhead1Type: AcDimArrowheadType dispid 62;
    property Arrowhead2Type: AcDimArrowheadType dispid 63;
    property Measurement: Double readonly dispid 64;
    property Arrowhead1Block: WideString dispid 65;
    property Arrowhead2Block: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimRotated
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimRotated = interface(IAcadDimension)
    ['{2928D4B0-CA93-11D1-B60F-0060B087E235}']
    function  Get_AltUnits: WordBool; safecall;
    procedure Set_AltUnits(bAlternate: WordBool); safecall;
    function  Get_AltUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_AltUnitsPrecision(precision: AcDimPrecision); safecall;
    function  Get_AltUnitsScale: ACAD_NOUNITS; safecall;
    procedure Set_AltUnitsScale(scale: ACAD_NOUNITS); safecall;
    function  Get_AltRoundDistance: Double; safecall;
    procedure Set_AltRoundDistance(Distance: Double); safecall;
    function  Get_AltTolerancePrecision: AcDimPrecision; safecall;
    procedure Set_AltTolerancePrecision(Distance: AcDimPrecision); safecall;
    function  Get_AltUnitsFormat: AcDimUnits; safecall;
    procedure Set_AltUnitsFormat(Units: AcDimUnits); safecall;
    function  Get_AltTextPrefix: WideString; safecall;
    procedure Set_AltTextPrefix(const prefix: WideString); safecall;
    function  Get_AltTextSuffix: WideString; safecall;
    procedure Set_AltTextSuffix(const prefix: WideString); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_ExtensionLineColor: ACAD_COLOR; safecall;
    procedure Set_ExtensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_PrimaryUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_PrimaryUnitsPrecision(Prec: AcDimPrecision); safecall;
    function  Get_DimensionLineExtend: Double; safecall;
    procedure Set_DimensionLineExtend(extend: Double); safecall;
    function  Get_ExtensionLineExtend: Double; safecall;
    procedure Set_ExtensionLineExtend(extend: Double); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_FractionFormat: AcDimFractionType; safecall;
    procedure Set_FractionFormat(Type_: AcDimFractionType); safecall;
    function  Get_HorizontalTextPosition: AcDimHorizontalJustification; safecall;
    procedure Set_HorizontalTextPosition(Type_: AcDimHorizontalJustification); safecall;
    function  Get_LinearScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_LinearScaleFactor(Type_: ACAD_NOUNITS); safecall;
    function  Get_UnitsFormat: AcDimLUnits; safecall;
    procedure Set_UnitsFormat(format: AcDimLUnits); safecall;
    function  Get_ExtensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_ExtensionLineWeight(lweight: ACAD_LWEIGHT); safecall;
    function  Get_RoundDistance: Double; safecall;
    procedure Set_RoundDistance(Distance: Double); safecall;
    function  Get_DimLine1Suppress: WordBool; safecall;
    procedure Set_DimLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLine2Suppress: WordBool; safecall;
    procedure Set_DimLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine1Suppress: WordBool; safecall;
    procedure Set_ExtLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine2Suppress: WordBool; safecall;
    procedure Set_ExtLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLineInside: WordBool; safecall;
    procedure Set_DimLineInside(bInside: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_ExtensionLineOffset: Double; safecall;
    procedure Set_ExtensionLineOffset(Offset: Double); safecall;
    function  Get_AltSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroInches: WordBool; safecall;
    procedure Set_AltSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_SuppressZeroFeet: WordBool; safecall;
    procedure Set_SuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_SuppressZeroInches: WordBool; safecall;
    procedure Set_SuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Arrowhead1Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead1Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Arrowhead2Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead2Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: Double; safecall;
    function  Get_Arrowhead1Block: WideString; safecall;
    procedure Set_Arrowhead1Block(const BlockName: WideString); safecall;
    function  Get_Arrowhead2Block: WideString; safecall;
    procedure Set_Arrowhead2Block(const BlockName: WideString); safecall;
    property AltUnits: WordBool read Get_AltUnits write Set_AltUnits;
    property AltUnitsPrecision: AcDimPrecision read Get_AltUnitsPrecision write Set_AltUnitsPrecision;
    property AltUnitsScale: ACAD_NOUNITS read Get_AltUnitsScale write Set_AltUnitsScale;
    property AltRoundDistance: Double read Get_AltRoundDistance write Set_AltRoundDistance;
    property AltTolerancePrecision: AcDimPrecision read Get_AltTolerancePrecision write Set_AltTolerancePrecision;
    property AltUnitsFormat: AcDimUnits read Get_AltUnitsFormat write Set_AltUnitsFormat;
    property AltTextPrefix: WideString read Get_AltTextPrefix write Set_AltTextPrefix;
    property AltTextSuffix: WideString read Get_AltTextSuffix write Set_AltTextSuffix;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property ExtensionLineColor: ACAD_COLOR read Get_ExtensionLineColor write Set_ExtensionLineColor;
    property PrimaryUnitsPrecision: AcDimPrecision read Get_PrimaryUnitsPrecision write Set_PrimaryUnitsPrecision;
    property DimensionLineExtend: Double read Get_DimensionLineExtend write Set_DimensionLineExtend;
    property ExtensionLineExtend: Double read Get_ExtensionLineExtend write Set_ExtensionLineExtend;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property FractionFormat: AcDimFractionType read Get_FractionFormat write Set_FractionFormat;
    property HorizontalTextPosition: AcDimHorizontalJustification read Get_HorizontalTextPosition write Set_HorizontalTextPosition;
    property LinearScaleFactor: ACAD_NOUNITS read Get_LinearScaleFactor write Set_LinearScaleFactor;
    property UnitsFormat: AcDimLUnits read Get_UnitsFormat write Set_UnitsFormat;
    property ExtensionLineWeight: ACAD_LWEIGHT read Get_ExtensionLineWeight write Set_ExtensionLineWeight;
    property RoundDistance: Double read Get_RoundDistance write Set_RoundDistance;
    property DimLine1Suppress: WordBool read Get_DimLine1Suppress write Set_DimLine1Suppress;
    property DimLine2Suppress: WordBool read Get_DimLine2Suppress write Set_DimLine2Suppress;
    property ExtLine1Suppress: WordBool read Get_ExtLine1Suppress write Set_ExtLine1Suppress;
    property ExtLine2Suppress: WordBool read Get_ExtLine2Suppress write Set_ExtLine2Suppress;
    property DimLineInside: WordBool read Get_DimLineInside write Set_DimLineInside;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property ExtensionLineOffset: Double read Get_ExtensionLineOffset write Set_ExtensionLineOffset;
    property AltSuppressLeadingZeros: WordBool read Get_AltSuppressLeadingZeros write Set_AltSuppressLeadingZeros;
    property AltSuppressTrailingZeros: WordBool read Get_AltSuppressTrailingZeros write Set_AltSuppressTrailingZeros;
    property AltSuppressZeroFeet: WordBool read Get_AltSuppressZeroFeet write Set_AltSuppressZeroFeet;
    property AltSuppressZeroInches: WordBool read Get_AltSuppressZeroInches write Set_AltSuppressZeroInches;
    property AltToleranceSuppressLeadingZeros: WordBool read Get_AltToleranceSuppressLeadingZeros write Set_AltToleranceSuppressLeadingZeros;
    property AltToleranceSuppressTrailingZeros: WordBool read Get_AltToleranceSuppressTrailingZeros write Set_AltToleranceSuppressTrailingZeros;
    property AltToleranceSuppressZeroFeet: WordBool read Get_AltToleranceSuppressZeroFeet write Set_AltToleranceSuppressZeroFeet;
    property AltToleranceSuppressZeroInches: WordBool read Get_AltToleranceSuppressZeroInches write Set_AltToleranceSuppressZeroInches;
    property SuppressZeroFeet: WordBool read Get_SuppressZeroFeet write Set_SuppressZeroFeet;
    property SuppressZeroInches: WordBool read Get_SuppressZeroInches write Set_SuppressZeroInches;
    property ToleranceSuppressZeroFeet: WordBool read Get_ToleranceSuppressZeroFeet write Set_ToleranceSuppressZeroFeet;
    property ToleranceSuppressZeroInches: WordBool read Get_ToleranceSuppressZeroInches write Set_ToleranceSuppressZeroInches;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Arrowhead1Type: AcDimArrowheadType read Get_Arrowhead1Type write Set_Arrowhead1Type;
    property Arrowhead2Type: AcDimArrowheadType read Get_Arrowhead2Type write Set_Arrowhead2Type;
    property Measurement: Double read Get_Measurement;
    property Arrowhead1Block: WideString read Get_Arrowhead1Block write Set_Arrowhead1Block;
    property Arrowhead2Block: WideString read Get_Arrowhead2Block write Set_Arrowhead2Block;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimRotatedDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimRotatedDisp = dispinterface
    ['{2928D4B0-CA93-11D1-B60F-0060B087E235}']
    property AltUnits: WordBool dispid 3;
    property AltUnitsPrecision: AcDimPrecision dispid 4;
    property AltUnitsScale: ACAD_NOUNITS dispid 5;
    property AltRoundDistance: Double dispid 6;
    property AltTolerancePrecision: AcDimPrecision dispid 7;
    property AltUnitsFormat: AcDimUnits dispid 9;
    property AltTextPrefix: WideString dispid 11;
    property AltTextSuffix: WideString dispid 12;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property ExtensionLineColor: ACAD_COLOR dispid 14;
    property PrimaryUnitsPrecision: AcDimPrecision dispid 15;
    property DimensionLineExtend: Double dispid 16;
    property ExtensionLineExtend: Double dispid 17;
    property Fit: AcDimFit dispid 18;
    property FractionFormat: AcDimFractionType dispid 19;
    property HorizontalTextPosition: AcDimHorizontalJustification dispid 20;
    property LinearScaleFactor: ACAD_NOUNITS dispid 21;
    property UnitsFormat: AcDimLUnits dispid 22;
    property ExtensionLineWeight: ACAD_LWEIGHT dispid 23;
    property RoundDistance: Double dispid 24;
    property DimLine1Suppress: WordBool dispid 25;
    property DimLine2Suppress: WordBool dispid 26;
    property ExtLine1Suppress: WordBool dispid 27;
    property ExtLine2Suppress: WordBool dispid 28;
    property DimLineInside: WordBool dispid 29;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property ExtensionLineOffset: Double dispid 35;
    property AltSuppressLeadingZeros: WordBool dispid 48;
    property AltSuppressTrailingZeros: WordBool dispid 49;
    property AltSuppressZeroFeet: WordBool dispid 50;
    property AltSuppressZeroInches: WordBool dispid 51;
    property AltToleranceSuppressLeadingZeros: WordBool dispid 52;
    property AltToleranceSuppressTrailingZeros: WordBool dispid 53;
    property AltToleranceSuppressZeroFeet: WordBool dispid 54;
    property AltToleranceSuppressZeroInches: WordBool dispid 55;
    property SuppressZeroFeet: WordBool dispid 56;
    property SuppressZeroInches: WordBool dispid 57;
    property ToleranceSuppressZeroFeet: WordBool dispid 58;
    property ToleranceSuppressZeroInches: WordBool dispid 59;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property Arrowhead1Type: AcDimArrowheadType dispid 62;
    property Arrowhead2Type: AcDimArrowheadType dispid 63;
    property Measurement: Double readonly dispid 64;
    property Arrowhead1Block: WideString dispid 65;
    property Arrowhead2Block: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimOrdinate
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AC-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimOrdinate = interface(IAcadDimension)
    ['{2928D4AC-CA93-11D1-B60F-0060B087E235}']
    function  Get_AltUnits: WordBool; safecall;
    procedure Set_AltUnits(bAlternate: WordBool); safecall;
    function  Get_AltUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_AltUnitsPrecision(precision: AcDimPrecision); safecall;
    function  Get_AltUnitsScale: ACAD_NOUNITS; safecall;
    procedure Set_AltUnitsScale(scale: ACAD_NOUNITS); safecall;
    function  Get_AltRoundDistance: Double; safecall;
    procedure Set_AltRoundDistance(Distance: Double); safecall;
    function  Get_AltTolerancePrecision: AcDimPrecision; safecall;
    procedure Set_AltTolerancePrecision(Distance: AcDimPrecision); safecall;
    function  Get_AltUnitsFormat: AcDimUnits; safecall;
    procedure Set_AltUnitsFormat(Units: AcDimUnits); safecall;
    function  Get_AltTextPrefix: WideString; safecall;
    procedure Set_AltTextPrefix(const prefix: WideString); safecall;
    function  Get_AltTextSuffix: WideString; safecall;
    procedure Set_AltTextSuffix(const prefix: WideString); safecall;
    function  Get_ExtensionLineColor: ACAD_COLOR; safecall;
    procedure Set_ExtensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_PrimaryUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_PrimaryUnitsPrecision(Prec: AcDimPrecision); safecall;
    function  Get_FractionFormat: AcDimFractionType; safecall;
    procedure Set_FractionFormat(Type_: AcDimFractionType); safecall;
    function  Get_LinearScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_LinearScaleFactor(Type_: ACAD_NOUNITS); safecall;
    function  Get_UnitsFormat: AcDimLUnits; safecall;
    procedure Set_UnitsFormat(format: AcDimLUnits); safecall;
    function  Get_ExtensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_ExtensionLineWeight(lweight: ACAD_LWEIGHT); safecall;
    function  Get_RoundDistance: Double; safecall;
    procedure Set_RoundDistance(Distance: Double); safecall;
    function  Get_ExtensionLineOffset: Double; safecall;
    procedure Set_ExtensionLineOffset(Offset: Double); safecall;
    function  Get_AltSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroInches: WordBool; safecall;
    procedure Set_AltSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_SuppressZeroFeet: WordBool; safecall;
    procedure Set_SuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_SuppressZeroInches: WordBool; safecall;
    procedure Set_SuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Measurement: Double; safecall;
    property AltUnits: WordBool read Get_AltUnits write Set_AltUnits;
    property AltUnitsPrecision: AcDimPrecision read Get_AltUnitsPrecision write Set_AltUnitsPrecision;
    property AltUnitsScale: ACAD_NOUNITS read Get_AltUnitsScale write Set_AltUnitsScale;
    property AltRoundDistance: Double read Get_AltRoundDistance write Set_AltRoundDistance;
    property AltTolerancePrecision: AcDimPrecision read Get_AltTolerancePrecision write Set_AltTolerancePrecision;
    property AltUnitsFormat: AcDimUnits read Get_AltUnitsFormat write Set_AltUnitsFormat;
    property AltTextPrefix: WideString read Get_AltTextPrefix write Set_AltTextPrefix;
    property AltTextSuffix: WideString read Get_AltTextSuffix write Set_AltTextSuffix;
    property ExtensionLineColor: ACAD_COLOR read Get_ExtensionLineColor write Set_ExtensionLineColor;
    property PrimaryUnitsPrecision: AcDimPrecision read Get_PrimaryUnitsPrecision write Set_PrimaryUnitsPrecision;
    property FractionFormat: AcDimFractionType read Get_FractionFormat write Set_FractionFormat;
    property LinearScaleFactor: ACAD_NOUNITS read Get_LinearScaleFactor write Set_LinearScaleFactor;
    property UnitsFormat: AcDimLUnits read Get_UnitsFormat write Set_UnitsFormat;
    property ExtensionLineWeight: ACAD_LWEIGHT read Get_ExtensionLineWeight write Set_ExtensionLineWeight;
    property RoundDistance: Double read Get_RoundDistance write Set_RoundDistance;
    property ExtensionLineOffset: Double read Get_ExtensionLineOffset write Set_ExtensionLineOffset;
    property AltSuppressLeadingZeros: WordBool read Get_AltSuppressLeadingZeros write Set_AltSuppressLeadingZeros;
    property AltSuppressTrailingZeros: WordBool read Get_AltSuppressTrailingZeros write Set_AltSuppressTrailingZeros;
    property AltSuppressZeroFeet: WordBool read Get_AltSuppressZeroFeet write Set_AltSuppressZeroFeet;
    property AltSuppressZeroInches: WordBool read Get_AltSuppressZeroInches write Set_AltSuppressZeroInches;
    property AltToleranceSuppressLeadingZeros: WordBool read Get_AltToleranceSuppressLeadingZeros write Set_AltToleranceSuppressLeadingZeros;
    property AltToleranceSuppressTrailingZeros: WordBool read Get_AltToleranceSuppressTrailingZeros write Set_AltToleranceSuppressTrailingZeros;
    property AltToleranceSuppressZeroFeet: WordBool read Get_AltToleranceSuppressZeroFeet write Set_AltToleranceSuppressZeroFeet;
    property AltToleranceSuppressZeroInches: WordBool read Get_AltToleranceSuppressZeroInches write Set_AltToleranceSuppressZeroInches;
    property SuppressZeroFeet: WordBool read Get_SuppressZeroFeet write Set_SuppressZeroFeet;
    property SuppressZeroInches: WordBool read Get_SuppressZeroInches write Set_SuppressZeroInches;
    property ToleranceSuppressZeroFeet: WordBool read Get_ToleranceSuppressZeroFeet write Set_ToleranceSuppressZeroFeet;
    property ToleranceSuppressZeroInches: WordBool read Get_ToleranceSuppressZeroInches write Set_ToleranceSuppressZeroInches;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Measurement: Double read Get_Measurement;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimOrdinateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AC-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimOrdinateDisp = dispinterface
    ['{2928D4AC-CA93-11D1-B60F-0060B087E235}']
    property AltUnits: WordBool dispid 3;
    property AltUnitsPrecision: AcDimPrecision dispid 4;
    property AltUnitsScale: ACAD_NOUNITS dispid 5;
    property AltRoundDistance: Double dispid 6;
    property AltTolerancePrecision: AcDimPrecision dispid 7;
    property AltUnitsFormat: AcDimUnits dispid 9;
    property AltTextPrefix: WideString dispid 11;
    property AltTextSuffix: WideString dispid 12;
    property ExtensionLineColor: ACAD_COLOR dispid 14;
    property PrimaryUnitsPrecision: AcDimPrecision dispid 15;
    property FractionFormat: AcDimFractionType dispid 19;
    property LinearScaleFactor: ACAD_NOUNITS dispid 21;
    property UnitsFormat: AcDimLUnits dispid 22;
    property ExtensionLineWeight: ACAD_LWEIGHT dispid 23;
    property RoundDistance: Double dispid 24;
    property ExtensionLineOffset: Double dispid 35;
    property AltSuppressLeadingZeros: WordBool dispid 48;
    property AltSuppressTrailingZeros: WordBool dispid 49;
    property AltSuppressZeroFeet: WordBool dispid 50;
    property AltSuppressZeroInches: WordBool dispid 51;
    property AltToleranceSuppressLeadingZeros: WordBool dispid 52;
    property AltToleranceSuppressTrailingZeros: WordBool dispid 53;
    property AltToleranceSuppressZeroFeet: WordBool dispid 54;
    property AltToleranceSuppressZeroInches: WordBool dispid 55;
    property SuppressZeroFeet: WordBool dispid 56;
    property SuppressZeroInches: WordBool dispid 57;
    property ToleranceSuppressZeroFeet: WordBool dispid 58;
    property ToleranceSuppressZeroInches: WordBool dispid 59;
    property ArrowheadSize: Double dispid 61;
    property Measurement: Double readonly dispid 64;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimRadial
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AE-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimRadial = interface(IAcadDimension)
    ['{2928D4AE-CA93-11D1-B60F-0060B087E235}']
    procedure Set_LeaderLength(Param1: Double); safecall;
    function  Get_AltUnits: WordBool; safecall;
    procedure Set_AltUnits(bAlternate: WordBool); safecall;
    function  Get_AltUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_AltUnitsPrecision(precision: AcDimPrecision); safecall;
    function  Get_AltUnitsScale: ACAD_NOUNITS; safecall;
    procedure Set_AltUnitsScale(scale: ACAD_NOUNITS); safecall;
    function  Get_AltRoundDistance: Double; safecall;
    procedure Set_AltRoundDistance(Distance: Double); safecall;
    function  Get_AltTolerancePrecision: AcDimPrecision; safecall;
    procedure Set_AltTolerancePrecision(Distance: AcDimPrecision); safecall;
    function  Get_AltUnitsFormat: AcDimUnits; safecall;
    procedure Set_AltUnitsFormat(Units: AcDimUnits); safecall;
    function  Get_AltTextPrefix: WideString; safecall;
    procedure Set_AltTextPrefix(const prefix: WideString); safecall;
    function  Get_AltTextSuffix: WideString; safecall;
    procedure Set_AltTextSuffix(const prefix: WideString); safecall;
    function  Get_CenterType: AcDimCenterType; safecall;
    procedure Set_CenterType(Type_: AcDimCenterType); safecall;
    function  Get_CenterMarkSize: Double; safecall;
    procedure Set_CenterMarkSize(Type_: Double); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_PrimaryUnitsPrecision: AcDimPrecision; safecall;
    procedure Set_PrimaryUnitsPrecision(Prec: AcDimPrecision); safecall;
    function  Get_FractionFormat: AcDimFractionType; safecall;
    procedure Set_FractionFormat(Type_: AcDimFractionType); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_LinearScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_LinearScaleFactor(Type_: ACAD_NOUNITS); safecall;
    function  Get_UnitsFormat: AcDimLUnits; safecall;
    procedure Set_UnitsFormat(format: AcDimLUnits); safecall;
    function  Get_RoundDistance: Double; safecall;
    procedure Set_RoundDistance(Distance: Double); safecall;
    function  Get_DimLineSuppress: WordBool; safecall;
    procedure Set_DimLineSuppress(bSuppress: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_AltSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltSuppressZeroInches: WordBool; safecall;
    procedure Set_AltSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressLeadingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressLeadingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressTrailingZeros: WordBool; safecall;
    procedure Set_AltToleranceSuppressTrailingZeros(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_AltToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_AltToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_SuppressZeroFeet: WordBool; safecall;
    procedure Set_SuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_SuppressZeroInches: WordBool; safecall;
    procedure Set_SuppressZeroInches(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroFeet: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroFeet(bVal: WordBool); safecall;
    function  Get_ToleranceSuppressZeroInches: WordBool; safecall;
    procedure Set_ToleranceSuppressZeroInches(bVal: WordBool); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_ArrowheadType: AcDimArrowheadType; safecall;
    procedure Set_ArrowheadType(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: Double; safecall;
    function  Get_ArrowheadBlock: WideString; safecall;
    procedure Set_ArrowheadBlock(const BlockName: WideString); safecall;
    property LeaderLength: Double write Set_LeaderLength;
    property AltUnits: WordBool read Get_AltUnits write Set_AltUnits;
    property AltUnitsPrecision: AcDimPrecision read Get_AltUnitsPrecision write Set_AltUnitsPrecision;
    property AltUnitsScale: ACAD_NOUNITS read Get_AltUnitsScale write Set_AltUnitsScale;
    property AltRoundDistance: Double read Get_AltRoundDistance write Set_AltRoundDistance;
    property AltTolerancePrecision: AcDimPrecision read Get_AltTolerancePrecision write Set_AltTolerancePrecision;
    property AltUnitsFormat: AcDimUnits read Get_AltUnitsFormat write Set_AltUnitsFormat;
    property AltTextPrefix: WideString read Get_AltTextPrefix write Set_AltTextPrefix;
    property AltTextSuffix: WideString read Get_AltTextSuffix write Set_AltTextSuffix;
    property CenterType: AcDimCenterType read Get_CenterType write Set_CenterType;
    property CenterMarkSize: Double read Get_CenterMarkSize write Set_CenterMarkSize;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property PrimaryUnitsPrecision: AcDimPrecision read Get_PrimaryUnitsPrecision write Set_PrimaryUnitsPrecision;
    property FractionFormat: AcDimFractionType read Get_FractionFormat write Set_FractionFormat;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property LinearScaleFactor: ACAD_NOUNITS read Get_LinearScaleFactor write Set_LinearScaleFactor;
    property UnitsFormat: AcDimLUnits read Get_UnitsFormat write Set_UnitsFormat;
    property RoundDistance: Double read Get_RoundDistance write Set_RoundDistance;
    property DimLineSuppress: WordBool read Get_DimLineSuppress write Set_DimLineSuppress;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property AltSuppressLeadingZeros: WordBool read Get_AltSuppressLeadingZeros write Set_AltSuppressLeadingZeros;
    property AltSuppressTrailingZeros: WordBool read Get_AltSuppressTrailingZeros write Set_AltSuppressTrailingZeros;
    property AltSuppressZeroFeet: WordBool read Get_AltSuppressZeroFeet write Set_AltSuppressZeroFeet;
    property AltSuppressZeroInches: WordBool read Get_AltSuppressZeroInches write Set_AltSuppressZeroInches;
    property AltToleranceSuppressLeadingZeros: WordBool read Get_AltToleranceSuppressLeadingZeros write Set_AltToleranceSuppressLeadingZeros;
    property AltToleranceSuppressTrailingZeros: WordBool read Get_AltToleranceSuppressTrailingZeros write Set_AltToleranceSuppressTrailingZeros;
    property AltToleranceSuppressZeroFeet: WordBool read Get_AltToleranceSuppressZeroFeet write Set_AltToleranceSuppressZeroFeet;
    property AltToleranceSuppressZeroInches: WordBool read Get_AltToleranceSuppressZeroInches write Set_AltToleranceSuppressZeroInches;
    property SuppressZeroFeet: WordBool read Get_SuppressZeroFeet write Set_SuppressZeroFeet;
    property SuppressZeroInches: WordBool read Get_SuppressZeroInches write Set_SuppressZeroInches;
    property ToleranceSuppressZeroFeet: WordBool read Get_ToleranceSuppressZeroFeet write Set_ToleranceSuppressZeroFeet;
    property ToleranceSuppressZeroInches: WordBool read Get_ToleranceSuppressZeroInches write Set_ToleranceSuppressZeroInches;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property ArrowheadType: AcDimArrowheadType read Get_ArrowheadType write Set_ArrowheadType;
    property Measurement: Double read Get_Measurement;
    property ArrowheadBlock: WideString read Get_ArrowheadBlock write Set_ArrowheadBlock;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimRadialDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4AE-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimRadialDisp = dispinterface
    ['{2928D4AE-CA93-11D1-B60F-0060B087E235}']
    property LeaderLength: Double writeonly dispid 42;
    property AltUnits: WordBool dispid 3;
    property AltUnitsPrecision: AcDimPrecision dispid 4;
    property AltUnitsScale: ACAD_NOUNITS dispid 5;
    property AltRoundDistance: Double dispid 6;
    property AltTolerancePrecision: AcDimPrecision dispid 7;
    property AltUnitsFormat: AcDimUnits dispid 9;
    property AltTextPrefix: WideString dispid 11;
    property AltTextSuffix: WideString dispid 12;
    property CenterType: AcDimCenterType dispid 43;
    property CenterMarkSize: Double dispid 44;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property PrimaryUnitsPrecision: AcDimPrecision dispid 15;
    property FractionFormat: AcDimFractionType dispid 19;
    property Fit: AcDimFit dispid 18;
    property LinearScaleFactor: ACAD_NOUNITS dispid 21;
    property UnitsFormat: AcDimLUnits dispid 22;
    property RoundDistance: Double dispid 24;
    property DimLineSuppress: WordBool dispid 26;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property AltSuppressLeadingZeros: WordBool dispid 48;
    property AltSuppressTrailingZeros: WordBool dispid 49;
    property AltSuppressZeroFeet: WordBool dispid 50;
    property AltSuppressZeroInches: WordBool dispid 51;
    property AltToleranceSuppressLeadingZeros: WordBool dispid 52;
    property AltToleranceSuppressTrailingZeros: WordBool dispid 53;
    property AltToleranceSuppressZeroFeet: WordBool dispid 54;
    property AltToleranceSuppressZeroInches: WordBool dispid 55;
    property SuppressZeroFeet: WordBool dispid 56;
    property SuppressZeroInches: WordBool dispid 57;
    property ToleranceSuppressZeroFeet: WordBool dispid 58;
    property ToleranceSuppressZeroInches: WordBool dispid 59;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property ArrowheadType: AcDimArrowheadType dispid 63;
    property Measurement: Double readonly dispid 64;
    property ArrowheadBlock: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadEllipse
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadEllipse = interface(IAcadEntity)
    ['{2928D4B2-CA93-11D1-B60F-0060B087E235}']
    function  Get_StartPoint: OleVariant; safecall;
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(Center: OleVariant); safecall;
    function  Get_EndPoint: OleVariant; safecall;
    function  Get_MajorRadius: Double; safecall;
    procedure Set_MajorRadius(MajorRadius: Double); safecall;
    function  Get_MinorRadius: Double; safecall;
    procedure Set_MinorRadius(MinorRadius: Double); safecall;
    function  Get_RadiusRatio: Double; safecall;
    procedure Set_RadiusRatio(RadiusRatio: Double); safecall;
    function  Get_StartAngle: ACAD_ANGLE; safecall;
    procedure Set_StartAngle(StartAngle: ACAD_ANGLE); safecall;
    function  Get_EndAngle: ACAD_ANGLE; safecall;
    procedure Set_EndAngle(EndAngle: ACAD_ANGLE); safecall;
    function  Get_StartParameter: Double; safecall;
    procedure Set_StartParameter(StartParameter: Double); safecall;
    function  Get_EndParameter: Double; safecall;
    procedure Set_EndParameter(EndParameter: Double); safecall;
    function  Get_MajorAxis: OleVariant; safecall;
    procedure Set_MajorAxis(MajorAxis: OleVariant); safecall;
    function  Get_MinorAxis: OleVariant; safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Area: Double; safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    property StartPoint: OleVariant read Get_StartPoint;
    property Center: OleVariant read Get_Center write Set_Center;
    property EndPoint: OleVariant read Get_EndPoint;
    property MajorRadius: Double read Get_MajorRadius write Set_MajorRadius;
    property MinorRadius: Double read Get_MinorRadius write Set_MinorRadius;
    property RadiusRatio: Double read Get_RadiusRatio write Set_RadiusRatio;
    property StartAngle: ACAD_ANGLE read Get_StartAngle write Set_StartAngle;
    property EndAngle: ACAD_ANGLE read Get_EndAngle write Set_EndAngle;
    property StartParameter: Double read Get_StartParameter write Set_StartParameter;
    property EndParameter: Double read Get_EndParameter write Set_EndParameter;
    property MajorAxis: OleVariant read Get_MajorAxis write Set_MajorAxis;
    property MinorAxis: OleVariant read Get_MinorAxis;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Area: Double read Get_Area;
  end;

// *********************************************************************//
// DispIntf:  IAcadEllipseDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadEllipseDisp = dispinterface
    ['{2928D4B2-CA93-11D1-B60F-0060B087E235}']
    property StartPoint: OleVariant readonly dispid 1;
    property Center: OleVariant dispid 2;
    property EndPoint: OleVariant readonly dispid 3;
    property MajorRadius: Double dispid 4;
    property MinorRadius: Double dispid 5;
    property RadiusRatio: Double dispid 6;
    property StartAngle: ACAD_ANGLE dispid 7;
    property EndAngle: ACAD_ANGLE dispid 8;
    property StartParameter: Double dispid 9;
    property EndParameter: Double dispid 10;
    property MajorAxis: OleVariant dispid 11;
    property MinorAxis: OleVariant readonly dispid 12;
    property Normal: OleVariant dispid 13;
    property Area: Double readonly dispid 14;
    function  Offset(Distance: Double): OleVariant; dispid 15;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLeader
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLeader = interface(IAcadEntity)
    ['{2928D4B6-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const bstrName: WideString); safecall;
    function  Get_Type_: AcLeaderType; safecall;
    procedure Set_Type_(Type_: AcLeaderType); safecall;
    procedure Evaluate; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    function  Get_Annotation: IAcadEntity; safecall;
    procedure Set_Annotation(const pVal: IAcadEntity); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_ArrowheadType: AcDimArrowheadType; safecall;
    procedure Set_ArrowheadType(Type_: AcDimArrowheadType); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(factor: ACAD_NOUNITS); safecall;
    function  Get_VerticalTextPosition: AcDimVerticalJustification; safecall;
    procedure Set_VerticalTextPosition(Type_: AcDimVerticalJustification); safecall;
    function  Get_TextGap: Double; safecall;
    procedure Set_TextGap(Offset: Double); safecall;
    function  Get_ArrowheadBlock: WideString; safecall;
    procedure Set_ArrowheadBlock(const BlockName: WideString); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property Type_: AcLeaderType read Get_Type_ write Set_Type_;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
    property Annotation: IAcadEntity read Get_Annotation write Set_Annotation;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property ArrowheadType: AcDimArrowheadType read Get_ArrowheadType write Set_ArrowheadType;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property VerticalTextPosition: AcDimVerticalJustification read Get_VerticalTextPosition write Set_VerticalTextPosition;
    property TextGap: Double read Get_TextGap write Set_TextGap;
    property ArrowheadBlock: WideString read Get_ArrowheadBlock write Set_ArrowheadBlock;
  end;

// *********************************************************************//
// DispIntf:  IAcadLeaderDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLeaderDisp = dispinterface
    ['{2928D4B6-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 64;
    property Normal: OleVariant readonly dispid 1537;
    property StyleName: WideString dispid 1542;
    property Type_: AcLeaderType dispid 65;
    procedure Evaluate; dispid 66;
    property Coordinate[Index: SYSINT]: OleVariant dispid 67;
    property Annotation: IAcadEntity dispid 68;
    property ArrowheadSize: Double dispid 1543;
    property ArrowheadType: AcDimArrowheadType dispid 69;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 1550;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TextGap: Double dispid 1549;
    property ArrowheadBlock: WideString dispid 70;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadMText
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BC-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMText = interface(IAcadEntity)
    ['{2928D4BC-CA93-11D1-B60F-0060B087E235}']
    function  Get_TextString: WideString; safecall;
    procedure Set_TextString(const bstrText: WideString); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const bstrName: WideString); safecall;
    function  Get_AttachmentPoint: AcAttachmentPoint; safecall;
    procedure Set_AttachmentPoint(attPoint: AcAttachmentPoint); safecall;
    function  Get_DrawingDirection: AcDrawingDirection; safecall;
    procedure Set_DrawingDirection(drawDir: AcDrawingDirection); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Width(Width: Double); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_LineSpacingFactor: Double; safecall;
    procedure Set_LineSpacingFactor(factor: Double); safecall;
    function  Get_LineSpacingStyle: AcLineSpacingStyle; safecall;
    procedure Set_LineSpacingStyle(style: AcLineSpacingStyle); safecall;
    property TextString: WideString read Get_TextString write Set_TextString;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property AttachmentPoint: AcAttachmentPoint read Get_AttachmentPoint write Set_AttachmentPoint;
    property DrawingDirection: AcDrawingDirection read Get_DrawingDirection write Set_DrawingDirection;
    property Width: Double read Get_Width write Set_Width;
    property Height: Double read Get_Height write Set_Height;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property LineSpacingFactor: Double read Get_LineSpacingFactor write Set_LineSpacingFactor;
    property LineSpacingStyle: AcLineSpacingStyle read Get_LineSpacingStyle write Set_LineSpacingStyle;
  end;

// *********************************************************************//
// DispIntf:  IAcadMTextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BC-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMTextDisp = dispinterface
    ['{2928D4BC-CA93-11D1-B60F-0060B087E235}']
    property TextString: WideString dispid 1;
    property StyleName: WideString dispid 2;
    property AttachmentPoint: AcAttachmentPoint dispid 3;
    property DrawingDirection: AcDrawingDirection dispid 4;
    property Width: Double dispid 5;
    property Height: Double dispid 6;
    property Rotation: ACAD_ANGLE dispid 7;
    property InsertionPoint: OleVariant dispid 8;
    property Normal: OleVariant dispid 9;
    property LineSpacingFactor: Double dispid 10;
    property LineSpacingStyle: AcLineSpacingStyle dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPoint
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BE-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPoint = interface(IAcadEntity)
    ['{2928D4BE-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
  end;

// *********************************************************************//
// DispIntf:  IAcadPointDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BE-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPointDisp = dispinterface
    ['{2928D4BE-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Normal: OleVariant dispid 2;
    property Thickness: Double dispid 3;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLWPolyline
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B8-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLWPolyline = interface(IAcadEntity)
    ['{2928D4B8-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    procedure AddVertex(Index: SYSINT; vertex: OleVariant); safecall;
    function  Explode: OleVariant; safecall;
    function  GetBulge(Index: SYSINT): Double; safecall;
    procedure SetBulge(Index: SYSINT; bulge: Double); safecall;
    procedure GetWidth(Index: SYSINT; out StartWidth: Double; out EndWidth: Double); safecall;
    procedure SetWidth(Index: SYSINT; StartWidth: Double; EndWidth: Double); safecall;
    function  Get_ConstantWidth: Double; safecall;
    procedure Set_ConstantWidth(Width: Double); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    function  Get_Elevation: Double; safecall;
    procedure Set_Elevation(Elevation: Double); safecall;
    function  Get_Area: Double; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    function  Get_Closed: WordBool; safecall;
    procedure Set_Closed(fClose: WordBool); safecall;
    function  Get_LinetypeGeneration: WordBool; safecall;
    procedure Set_LinetypeGeneration(bLinetypeGen: WordBool); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property ConstantWidth: Double read Get_ConstantWidth write Set_ConstantWidth;
    property Elevation: Double read Get_Elevation write Set_Elevation;
    property Area: Double read Get_Area;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
    property Closed: WordBool read Get_Closed write Set_Closed;
    property LinetypeGeneration: WordBool read Get_LinetypeGeneration write Set_LinetypeGeneration;
  end;

// *********************************************************************//
// DispIntf:  IAcadLWPolylineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B8-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLWPolylineDisp = dispinterface
    ['{2928D4B8-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Normal: OleVariant dispid 2;
    property Thickness: Double dispid 3;
    procedure AddVertex(Index: SYSINT; vertex: OleVariant); dispid 4;
    function  Explode: OleVariant; dispid 5;
    function  GetBulge(Index: SYSINT): Double; dispid 6;
    procedure SetBulge(Index: SYSINT; bulge: Double); dispid 7;
    procedure GetWidth(Index: SYSINT; out StartWidth: Double; out EndWidth: Double); dispid 8;
    procedure SetWidth(Index: SYSINT; StartWidth: Double; EndWidth: Double); dispid 9;
    property ConstantWidth: Double dispid 10;
    function  Offset(Distance: Double): OleVariant; dispid 11;
    property Elevation: Double dispid 12;
    property Area: Double readonly dispid 13;
    property Coordinate[Index: SYSINT]: OleVariant dispid 14;
    property Closed: WordBool dispid 15;
    property LinetypeGeneration: WordBool dispid 16;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPolyline
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolyline = interface(IAcadEntity)
    ['{2928D4C0-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Coordinates: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    procedure AppendVertex(vertex: OleVariant); safecall;
    function  Explode: OleVariant; safecall;
    function  GetBulge(Index: SYSINT): Double; safecall;
    procedure SetBulge(Index: SYSINT; bulge: Double); safecall;
    procedure GetWidth(Index: SYSINT; out StartWidth: Double; var EndWidth: Double); safecall;
    procedure SetWidth(Index: SYSINT; StartWidth: Double; EndWidth: Double); safecall;
    function  Get_ConstantWidth: Double; safecall;
    procedure Set_ConstantWidth(Width: Double); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    function  Get_Elevation: Double; safecall;
    procedure Set_Elevation(Elevation: Double); safecall;
    function  Get_Type_: AcPolylineType; safecall;
    procedure Set_Type_(Type_: AcPolylineType); safecall;
    function  Get_Closed: WordBool; safecall;
    procedure Set_Closed(fClose: WordBool); safecall;
    function  Get_LinetypeGeneration: WordBool; safecall;
    procedure Set_LinetypeGeneration(bLinetypeGen: WordBool); safecall;
    function  Get_Area: Double; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property ConstantWidth: Double read Get_ConstantWidth write Set_ConstantWidth;
    property Elevation: Double read Get_Elevation write Set_Elevation;
    property Type_: AcPolylineType read Get_Type_ write Set_Type_;
    property Closed: WordBool read Get_Closed write Set_Closed;
    property LinetypeGeneration: WordBool read Get_LinetypeGeneration write Set_LinetypeGeneration;
    property Area: Double read Get_Area;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
  end;

// *********************************************************************//
// DispIntf:  IAcadPolylineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolylineDisp = dispinterface
    ['{2928D4C0-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Normal: OleVariant dispid 2;
    property Thickness: Double dispid 3;
    procedure AppendVertex(vertex: OleVariant); dispid 4;
    function  Explode: OleVariant; dispid 5;
    function  GetBulge(Index: SYSINT): Double; dispid 6;
    procedure SetBulge(Index: SYSINT; bulge: Double); dispid 7;
    procedure GetWidth(Index: SYSINT; out StartWidth: Double; var EndWidth: Double); dispid 8;
    procedure SetWidth(Index: SYSINT; StartWidth: Double; EndWidth: Double); dispid 9;
    property ConstantWidth: Double dispid 10;
    function  Offset(Distance: Double): OleVariant; dispid 11;
    property Elevation: Double dispid 12;
    property Type_: AcPolylineType dispid 13;
    property Closed: WordBool dispid 14;
    property LinetypeGeneration: WordBool dispid 15;
    property Area: Double readonly dispid 16;
    property Coordinate[Index: SYSINT]: OleVariant dispid 17;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadRay
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C5-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRay = interface(IAcadEntity)
    ['{2928D4C5-CA93-11D1-B60F-0060B087E235}']
    function  Get_BasePoint: OleVariant; safecall;
    procedure Set_BasePoint(BasePoint: OleVariant); safecall;
    function  Get_SecondPoint: OleVariant; safecall;
    procedure Set_SecondPoint(SecondPoint: OleVariant); safecall;
    function  Get_DirectionVector: OleVariant; safecall;
    procedure Set_DirectionVector(dirVector: OleVariant); safecall;
    property BasePoint: OleVariant read Get_BasePoint write Set_BasePoint;
    property SecondPoint: OleVariant read Get_SecondPoint write Set_SecondPoint;
    property DirectionVector: OleVariant read Get_DirectionVector write Set_DirectionVector;
  end;

// *********************************************************************//
// DispIntf:  IAcadRayDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C5-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRayDisp = dispinterface
    ['{2928D4C5-CA93-11D1-B60F-0060B087E235}']
    property BasePoint: OleVariant dispid 1;
    property SecondPoint: OleVariant dispid 2;
    property DirectionVector: OleVariant dispid 3;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadShape
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C9-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadShape = interface(IAcadEntity)
    ['{2928D4C9-CA93-11D1-B60F-0060B087E235}']
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(scalFactor: ACAD_NOUNITS); safecall;
    function  Get_ObliqueAngle: ACAD_ANGLE; safecall;
    procedure Set_ObliqueAngle(obliAngle: ACAD_ANGLE); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Name: WideString read Get_Name write Set_Name;
    property Height: Double read Get_Height write Set_Height;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property ObliqueAngle: ACAD_ANGLE read Get_ObliqueAngle write Set_ObliqueAngle;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
  end;

// *********************************************************************//
// DispIntf:  IAcadShapeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4C9-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadShapeDisp = dispinterface
    ['{2928D4C9-CA93-11D1-B60F-0060B087E235}']
    property InsertionPoint: OleVariant dispid 1;
    property Name: WideString dispid 2;
    property Height: Double dispid 3;
    property Rotation: ACAD_ANGLE dispid 4;
    property ScaleFactor: ACAD_NOUNITS dispid 5;
    property ObliqueAngle: ACAD_ANGLE dispid 6;
    property Normal: OleVariant dispid 7;
    property Thickness: Double dispid 8;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadSolid
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CB-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadSolid = interface(IAcadEntity)
    ['{2928D4CB-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(corners: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
  end;

// *********************************************************************//
// DispIntf:  IAcadSolidDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CB-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadSolidDisp = dispinterface
    ['{2928D4CB-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Normal: OleVariant dispid 2;
    property Thickness: Double dispid 3;
    property Coordinate[Index: SYSINT]: OleVariant dispid 4;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadSpline
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CD-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadSpline = interface(IAcadEntity)
    ['{2928D4CD-CA93-11D1-B60F-0060B087E235}']
    function  Get_NumberOfControlPoints: Integer; safecall;
    function  Get_ControlPoints: OleVariant; safecall;
    procedure Set_ControlPoints(controlPoint: OleVariant); safecall;
    function  Get_NumberOfFitPoints: Integer; safecall;
    function  Get_FitPoints: OleVariant; safecall;
    procedure Set_FitPoints(fitPoint: OleVariant); safecall;
    function  Get_Degree: Integer; safecall;
    function  Get_Closed: WordBool; safecall;
    function  Get_IsPlanar: WordBool; safecall;
    function  Get_IsRational: WordBool; safecall;
    function  Get_IsPeriodic: WordBool; safecall;
    function  Get_StartTangent: OleVariant; safecall;
    procedure Set_StartTangent(StartTangent: OleVariant); safecall;
    function  Get_EndTangent: OleVariant; safecall;
    procedure Set_EndTangent(EndTangent: OleVariant); safecall;
    function  Get_FitTolerance: Double; safecall;
    procedure Set_FitTolerance(fitTol: Double); safecall;
    function  Get_Area: Double; safecall;
    procedure SetControlPoint(Index: SYSINT; controlPoint: OleVariant); safecall;
    function  GetControlPoint(Index: SYSINT): OleVariant; safecall;
    procedure SetFitPoint(Index: SYSINT; fitPoint: OleVariant); safecall;
    function  GetFitPoint(Index: SYSINT): OleVariant; safecall;
    procedure SetWeight(Index: SYSINT; weight: Double); safecall;
    function  GetWeight(Index: SYSINT): Double; safecall;
    procedure AddFitPoint(Index: SYSINT; fitPoint: OleVariant); safecall;
    procedure DeleteFitPoint(Index: SYSINT); safecall;
    procedure ElevateOrder(Order: SYSINT); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    procedure PurgeFitData; safecall;
    procedure Reverse; safecall;
    function  Get_Knots: OleVariant; safecall;
    procedure Set_Knots(KnotValues: OleVariant); safecall;
    function  Get_Weights: OleVariant; safecall;
    procedure Set_Weights(WeightValues: OleVariant); safecall;
    property NumberOfControlPoints: Integer read Get_NumberOfControlPoints;
    property ControlPoints: OleVariant read Get_ControlPoints write Set_ControlPoints;
    property NumberOfFitPoints: Integer read Get_NumberOfFitPoints;
    property FitPoints: OleVariant read Get_FitPoints write Set_FitPoints;
    property Degree: Integer read Get_Degree;
    property Closed: WordBool read Get_Closed;
    property IsPlanar: WordBool read Get_IsPlanar;
    property IsRational: WordBool read Get_IsRational;
    property IsPeriodic: WordBool read Get_IsPeriodic;
    property StartTangent: OleVariant read Get_StartTangent write Set_StartTangent;
    property EndTangent: OleVariant read Get_EndTangent write Set_EndTangent;
    property FitTolerance: Double read Get_FitTolerance write Set_FitTolerance;
    property Area: Double read Get_Area;
    property Knots: OleVariant read Get_Knots write Set_Knots;
    property Weights: OleVariant read Get_Weights write Set_Weights;
  end;

// *********************************************************************//
// DispIntf:  IAcadSplineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CD-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadSplineDisp = dispinterface
    ['{2928D4CD-CA93-11D1-B60F-0060B087E235}']
    property NumberOfControlPoints: Integer readonly dispid 1;
    property ControlPoints: OleVariant dispid 2;
    property NumberOfFitPoints: Integer readonly dispid 3;
    property FitPoints: OleVariant dispid 4;
    property Degree: Integer readonly dispid 5;
    property Closed: WordBool readonly dispid 6;
    property IsPlanar: WordBool readonly dispid 7;
    property IsRational: WordBool readonly dispid 8;
    property IsPeriodic: WordBool readonly dispid 9;
    property StartTangent: OleVariant dispid 10;
    property EndTangent: OleVariant dispid 11;
    property FitTolerance: Double dispid 12;
    property Area: Double readonly dispid 13;
    procedure SetControlPoint(Index: SYSINT; controlPoint: OleVariant); dispid 14;
    function  GetControlPoint(Index: SYSINT): OleVariant; dispid 15;
    procedure SetFitPoint(Index: SYSINT; fitPoint: OleVariant); dispid 16;
    function  GetFitPoint(Index: SYSINT): OleVariant; dispid 17;
    procedure SetWeight(Index: SYSINT; weight: Double); dispid 18;
    function  GetWeight(Index: SYSINT): Double; dispid 19;
    procedure AddFitPoint(Index: SYSINT; fitPoint: OleVariant); dispid 20;
    procedure DeleteFitPoint(Index: SYSINT); dispid 21;
    procedure ElevateOrder(Order: SYSINT); dispid 22;
    function  Offset(Distance: Double): OleVariant; dispid 23;
    procedure PurgeFitData; dispid 24;
    procedure Reverse; dispid 25;
    property Knots: OleVariant dispid 26;
    property Weights: OleVariant dispid 27;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadText
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CF-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadText = interface(IAcadEntity)
    ['{2928D4CF-CA93-11D1-B60F-0060B087E235}']
    function  Get_TextString: WideString; safecall;
    procedure Set_TextString(const bstrText: WideString); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const bstrName: WideString); safecall;
    function  Get_Alignment: AcAlignment; safecall;
    procedure Set_Alignment(align: AcAlignment); safecall;
    function  Get_HorizontalAlignment: AcHorizontalAlignment; safecall;
    procedure Set_HorizontalAlignment(horizAlign: AcHorizontalAlignment); safecall;
    function  Get_VerticalAlignment: AcVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(vertiAlign: AcVerticalAlignment); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(scalFactor: ACAD_NOUNITS); safecall;
    function  Get_ObliqueAngle: ACAD_ANGLE; safecall;
    procedure Set_ObliqueAngle(obliAngle: ACAD_ANGLE); safecall;
    function  Get_TextAlignmentPoint: OleVariant; safecall;
    procedure Set_TextAlignmentPoint(alignPoint: OleVariant); safecall;
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_TextGenerationFlag: Integer; safecall;
    procedure Set_TextGenerationFlag(textGenFlag: Integer); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Get_UpsideDown: WordBool; safecall;
    procedure Set_UpsideDown(UpsideDown: WordBool); safecall;
    function  Get_Backward: WordBool; safecall;
    procedure Set_Backward(Backward: WordBool); safecall;
    property TextString: WideString read Get_TextString write Set_TextString;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property Alignment: AcAlignment read Get_Alignment write Set_Alignment;
    property HorizontalAlignment: AcHorizontalAlignment read Get_HorizontalAlignment write Set_HorizontalAlignment;
    property VerticalAlignment: AcVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property Height: Double read Get_Height write Set_Height;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property ObliqueAngle: ACAD_ANGLE read Get_ObliqueAngle write Set_ObliqueAngle;
    property TextAlignmentPoint: OleVariant read Get_TextAlignmentPoint write Set_TextAlignmentPoint;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property TextGenerationFlag: Integer read Get_TextGenerationFlag write Set_TextGenerationFlag;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property UpsideDown: WordBool read Get_UpsideDown write Set_UpsideDown;
    property Backward: WordBool read Get_Backward write Set_Backward;
  end;

// *********************************************************************//
// DispIntf:  IAcadTextDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4CF-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTextDisp = dispinterface
    ['{2928D4CF-CA93-11D1-B60F-0060B087E235}']
    property TextString: WideString dispid 1;
    property StyleName: WideString dispid 2;
    property Alignment: AcAlignment dispid 3;
    property HorizontalAlignment: AcHorizontalAlignment dispid 4;
    property VerticalAlignment: AcVerticalAlignment dispid 5;
    property Height: Double dispid 6;
    property Rotation: ACAD_ANGLE dispid 7;
    property ScaleFactor: ACAD_NOUNITS dispid 8;
    property ObliqueAngle: ACAD_ANGLE dispid 9;
    property TextAlignmentPoint: OleVariant dispid 10;
    property InsertionPoint: OleVariant dispid 11;
    property Normal: OleVariant dispid 12;
    property TextGenerationFlag: Integer dispid 13;
    property Thickness: Double dispid 14;
    property UpsideDown: WordBool dispid 15;
    property Backward: WordBool dispid 16;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadTolerance
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D1-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTolerance = interface(IAcadEntity)
    ['{2928D4D1-CA93-11D1-B60F-0060B087E235}']
    function  Get_DirectionVector: OleVariant; safecall;
    procedure Set_DirectionVector(dirVector: OleVariant); safecall;
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const bstrName: WideString); safecall;
    function  Get_TextColor: ACAD_COLOR; safecall;
    procedure Set_TextColor(Color: ACAD_COLOR); safecall;
    function  Get_TextString: WideString; safecall;
    procedure Set_TextString(const bstrText: WideString); safecall;
    function  Get_TextStyle: WideString; safecall;
    procedure Set_TextStyle(const style: WideString); safecall;
    function  Get_TextHeight: Double; safecall;
    procedure Set_TextHeight(Height: Double); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(factor: ACAD_NOUNITS); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    property DirectionVector: OleVariant read Get_DirectionVector write Set_DirectionVector;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property TextColor: ACAD_COLOR read Get_TextColor write Set_TextColor;
    property TextString: WideString read Get_TextString write Set_TextString;
    property TextStyle: WideString read Get_TextStyle write Set_TextStyle;
    property TextHeight: Double read Get_TextHeight write Set_TextHeight;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
  end;

// *********************************************************************//
// DispIntf:  IAcadToleranceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D1-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadToleranceDisp = dispinterface
    ['{2928D4D1-CA93-11D1-B60F-0060B087E235}']
    property DirectionVector: OleVariant dispid 80;
    property InsertionPoint: OleVariant dispid 81;
    property Normal: OleVariant dispid 82;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property TextString: WideString dispid 1541;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadTrace
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D3-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTrace = interface(IAcadEntity)
    ['{2928D4D3-CA93-11D1-B60F-0060B087E235}']
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(corners: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
  end;

// *********************************************************************//
// DispIntf:  IAcadTraceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D3-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTraceDisp = dispinterface
    ['{2928D4D3-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Normal: OleVariant dispid 2;
    property Thickness: Double dispid 3;
    property Coordinate[Index: SYSINT]: OleVariant dispid 4;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadXline
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D5-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadXline = interface(IAcadEntity)
    ['{2928D4D5-CA93-11D1-B60F-0060B087E235}']
    function  Get_BasePoint: OleVariant; safecall;
    procedure Set_BasePoint(BasePoint: OleVariant); safecall;
    function  Get_SecondPoint: OleVariant; safecall;
    procedure Set_SecondPoint(SecondPoint: OleVariant); safecall;
    function  Get_DirectionVector: OleVariant; safecall;
    procedure Set_DirectionVector(dirVector: OleVariant); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    property BasePoint: OleVariant read Get_BasePoint write Set_BasePoint;
    property SecondPoint: OleVariant read Get_SecondPoint write Set_SecondPoint;
    property DirectionVector: OleVariant read Get_DirectionVector write Set_DirectionVector;
  end;

// *********************************************************************//
// DispIntf:  IAcadXlineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D5-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadXlineDisp = dispinterface
    ['{2928D4D5-CA93-11D1-B60F-0060B087E235}']
    property BasePoint: OleVariant dispid 1;
    property SecondPoint: OleVariant dispid 2;
    property DirectionVector: OleVariant dispid 3;
    function  Offset(Distance: Double): OleVariant; dispid 4;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadBlockReference
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadBlockReference = interface(IAcadEntity)
    ['{2928D4A2-CA93-11D1-B60F-0060B087E235}']
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_XScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_XScaleFactor(ScaleFactor: ACAD_NOUNITS); safecall;
    function  Get_YScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_YScaleFactor(ScaleFactor: ACAD_NOUNITS); safecall;
    function  Get_ZScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ZScaleFactor(ScaleFactor: ACAD_NOUNITS); safecall;
    function  Explode: OleVariant; safecall;
    function  GetAttributes: OleVariant; safecall;
    function  GetConstantAttributes: OleVariant; safecall;
    function  Get_HasAttributes: WordBool; safecall;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Name: WideString read Get_Name write Set_Name;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property XScaleFactor: ACAD_NOUNITS read Get_XScaleFactor write Set_XScaleFactor;
    property YScaleFactor: ACAD_NOUNITS read Get_YScaleFactor write Set_YScaleFactor;
    property ZScaleFactor: ACAD_NOUNITS read Get_ZScaleFactor write Set_ZScaleFactor;
    property HasAttributes: WordBool read Get_HasAttributes;
  end;

// *********************************************************************//
// DispIntf:  IAcadBlockReferenceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadBlockReferenceDisp = dispinterface
    ['{2928D4A2-CA93-11D1-B60F-0060B087E235}']
    property InsertionPoint: OleVariant dispid 1;
    property Name: WideString dispid 2;
    property Normal: OleVariant dispid 3;
    property Rotation: ACAD_ANGLE dispid 4;
    property XScaleFactor: ACAD_NOUNITS dispid 5;
    property YScaleFactor: ACAD_NOUNITS dispid 6;
    property ZScaleFactor: ACAD_NOUNITS dispid 7;
    function  Explode: OleVariant; dispid 8;
    function  GetAttributes: OleVariant; dispid 9;
    function  GetConstantAttributes: OleVariant; dispid 10;
    property HasAttributes: WordBool readonly dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadHatch
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadHatch = interface(IAcadEntity)
    ['{2928D4B4-CA93-11D1-B60F-0060B087E235}']
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_NumberOfLoops: Integer; safecall;
    function  Get_PatternType: AcPatternType; safecall;
    function  Get_PatternName: WideString; safecall;
    function  Get_PatternAngle: ACAD_ANGLE; safecall;
    procedure Set_PatternAngle(PatternAngle: ACAD_ANGLE); safecall;
    function  Get_PatternScale: ACAD_NOUNITS; safecall;
    procedure Set_PatternScale(PatternScale: ACAD_NOUNITS); safecall;
    function  Get_PatternSpace: Double; safecall;
    procedure Set_PatternSpace(PatternSpace: Double); safecall;
    function  Get_ISOPenWidth: AcISOPenWidth; safecall;
    procedure Set_ISOPenWidth(penWidth: AcISOPenWidth); safecall;
    function  Get_PatternDouble: WordBool; safecall;
    procedure Set_PatternDouble(bDouble: WordBool); safecall;
    function  Get_Elevation: Double; safecall;
    procedure Set_Elevation(Elevation: Double); safecall;
    function  Get_AssociativeHatch: WordBool; safecall;
    procedure Set_AssociativeHatch(fAssoc: WordBool); safecall;
    function  Get_HatchStyle: AcHatchStyle; safecall;
    procedure Set_HatchStyle(HatchStyle: AcHatchStyle); safecall;
    procedure SetPattern(PatternType: SYSINT; const PatternName: WideString); safecall;
    procedure AppendOuterLoop(ObjectArray: OleVariant); safecall;
    procedure AppendInnerLoop(ObjectArray: OleVariant); safecall;
    procedure InsertLoopAt(Index: SYSINT; LoopType: AcLoopType; ObjectArray: OleVariant); safecall;
    procedure GetLoopAt(Index: SYSINT; out ObjectArray: OleVariant); safecall;
    procedure Evaluate; safecall;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property NumberOfLoops: Integer read Get_NumberOfLoops;
    property PatternType: AcPatternType read Get_PatternType;
    property PatternName: WideString read Get_PatternName;
    property PatternAngle: ACAD_ANGLE read Get_PatternAngle write Set_PatternAngle;
    property PatternScale: ACAD_NOUNITS read Get_PatternScale write Set_PatternScale;
    property PatternSpace: Double read Get_PatternSpace write Set_PatternSpace;
    property ISOPenWidth: AcISOPenWidth read Get_ISOPenWidth write Set_ISOPenWidth;
    property PatternDouble: WordBool read Get_PatternDouble write Set_PatternDouble;
    property Elevation: Double read Get_Elevation write Set_Elevation;
    property AssociativeHatch: WordBool read Get_AssociativeHatch write Set_AssociativeHatch;
    property HatchStyle: AcHatchStyle read Get_HatchStyle write Set_HatchStyle;
  end;

// *********************************************************************//
// DispIntf:  IAcadHatchDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4B4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadHatchDisp = dispinterface
    ['{2928D4B4-CA93-11D1-B60F-0060B087E235}']
    property Normal: OleVariant dispid 1;
    property NumberOfLoops: Integer readonly dispid 2;
    property PatternType: AcPatternType readonly dispid 3;
    property PatternName: WideString readonly dispid 4;
    property PatternAngle: ACAD_ANGLE dispid 5;
    property PatternScale: ACAD_NOUNITS dispid 6;
    property PatternSpace: Double dispid 7;
    property ISOPenWidth: AcISOPenWidth dispid 8;
    property PatternDouble: WordBool dispid 9;
    property Elevation: Double dispid 10;
    property AssociativeHatch: WordBool dispid 11;
    property HatchStyle: AcHatchStyle dispid 12;
    procedure SetPattern(PatternType: SYSINT; const PatternName: WideString); dispid 13;
    procedure AppendOuterLoop(ObjectArray: OleVariant); dispid 14;
    procedure AppendInnerLoop(ObjectArray: OleVariant); dispid 15;
    procedure InsertLoopAt(Index: SYSINT; LoopType: AcLoopType; ObjectArray: OleVariant); dispid 16;
    procedure GetLoopAt(Index: SYSINT; out ObjectArray: OleVariant); dispid 17;
    procedure Evaluate; dispid 18;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadRasterImage
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8ACF1DD2-FBCA-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadRasterImage = interface(IAcadEntity)
    ['{8ACF1DD2-FBCA-11D1-A2C8-080009DC639A}']
    function  Get_Brightness: Integer; safecall;
    procedure Set_Brightness(Brightness: Integer); safecall;
    function  Get_Contrast: Integer; safecall;
    procedure Set_Contrast(Contrast: Integer); safecall;
    function  Get_Fade: Integer; safecall;
    procedure Set_Fade(Fade: Integer); safecall;
    function  Get_Origin: OleVariant; safecall;
    procedure Set_Origin(Origin: OleVariant); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_ImageWidth: Double; safecall;
    procedure Set_ImageWidth(Width: Double); safecall;
    function  Get_ImageHeight: Double; safecall;
    procedure Set_ImageHeight(Height: Double); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const Name: WideString); safecall;
    procedure Set_ImageFile(const imageFileName: WideString); safecall;
    function  Get_ImageFile: WideString; safecall;
    function  Get_ImageVisibility: WordBool; safecall;
    procedure Set_ImageVisibility(fVisible: WordBool); safecall;
    function  Get_ClippingEnabled: WordBool; safecall;
    procedure Set_ClippingEnabled(kClip: WordBool); safecall;
    function  Get_Transparency: WordBool; safecall;
    procedure Set_Transparency(bTransp: WordBool); safecall;
    procedure ClipBoundary(boundry: OleVariant); safecall;
    function  Get_Height: Double; safecall;
    function  Get_Width: Double; safecall;
    function  Get_ShowRotation: WordBool; safecall;
    procedure Set_ShowRotation(bShow: WordBool); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(ScaleFactor: ACAD_NOUNITS); safecall;
    property Brightness: Integer read Get_Brightness write Set_Brightness;
    property Contrast: Integer read Get_Contrast write Set_Contrast;
    property Fade: Integer read Get_Fade write Set_Fade;
    property Origin: OleVariant read Get_Origin write Set_Origin;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property ImageWidth: Double read Get_ImageWidth write Set_ImageWidth;
    property ImageHeight: Double read Get_ImageHeight write Set_ImageHeight;
    property Name: WideString read Get_Name write Set_Name;
    property ImageFile: WideString read Get_ImageFile write Set_ImageFile;
    property ImageVisibility: WordBool read Get_ImageVisibility write Set_ImageVisibility;
    property ClippingEnabled: WordBool read Get_ClippingEnabled write Set_ClippingEnabled;
    property Transparency: WordBool read Get_Transparency write Set_Transparency;
    property Height: Double read Get_Height;
    property Width: Double read Get_Width;
    property ShowRotation: WordBool read Get_ShowRotation write Set_ShowRotation;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
  end;

// *********************************************************************//
// DispIntf:  IAcadRasterImageDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8ACF1DD2-FBCA-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadRasterImageDisp = dispinterface
    ['{8ACF1DD2-FBCA-11D1-A2C8-080009DC639A}']
    property Brightness: Integer dispid 1;
    property Contrast: Integer dispid 2;
    property Fade: Integer dispid 3;
    property Origin: OleVariant dispid 4;
    property Rotation: ACAD_ANGLE dispid 5;
    property ImageWidth: Double dispid 6;
    property ImageHeight: Double dispid 7;
    property Name: WideString dispid 8;
    property ImageFile: WideString dispid 9;
    property ImageVisibility: WordBool dispid 10;
    property ClippingEnabled: WordBool dispid 11;
    property Transparency: WordBool dispid 12;
    procedure ClipBoundary(boundry: OleVariant); dispid 13;
    property Height: Double readonly dispid 14;
    property Width: Double readonly dispid 15;
    property ShowRotation: WordBool dispid 16;
    property ScaleFactor: ACAD_NOUNITS dispid 17;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLine
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BA-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLine = interface(IAcadEntity)
    ['{2928D4BA-CA93-11D1-B60F-0060B087E235}']
    function  Get_StartPoint: OleVariant; safecall;
    procedure Set_StartPoint(StartPoint: OleVariant); safecall;
    function  Get_EndPoint: OleVariant; safecall;
    procedure Set_EndPoint(EndPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Offset(Distance: Double): OleVariant; safecall;
    function  Get_Delta: OleVariant; safecall;
    function  Get_Length: Double; safecall;
    function  Get_Angle: ACAD_ANGLE; safecall;
    property StartPoint: OleVariant read Get_StartPoint write Set_StartPoint;
    property EndPoint: OleVariant read Get_EndPoint write Set_EndPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property Delta: OleVariant read Get_Delta;
    property Length: Double read Get_Length;
    property Angle: ACAD_ANGLE read Get_Angle;
  end;

// *********************************************************************//
// DispIntf:  IAcadLineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4BA-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLineDisp = dispinterface
    ['{2928D4BA-CA93-11D1-B60F-0060B087E235}']
    property StartPoint: OleVariant dispid 1;
    property EndPoint: OleVariant dispid 2;
    property Normal: OleVariant dispid 3;
    property Thickness: Double dispid 4;
    function  Offset(Distance: Double): OleVariant; dispid 5;
    property Delta: OleVariant readonly dispid 6;
    property Length: Double readonly dispid 7;
    property Angle: ACAD_ANGLE readonly dispid 8;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPlotConfiguration
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3B6921F8-1DE6-11D2-B66E-0060B087E235}
// *********************************************************************//
  IAcadPlotConfiguration = interface(IAcadObject)
    ['{3B6921F8-1DE6-11D2-B66E-0060B087E235}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const pName: WideString); safecall;
    function  Get_ConfigName: WideString; safecall;
    procedure Set_ConfigName(const pName: WideString); safecall;
    function  Get_CanonicalMediaName: WideString; safecall;
    procedure Set_CanonicalMediaName(const pName: WideString); safecall;
    function  Get_PaperUnits: AcPlotPaperUnits; safecall;
    procedure Set_PaperUnits(pPaperUnits: AcPlotPaperUnits); safecall;
    function  Get_PlotViewportBorders: WordBool; safecall;
    procedure Set_PlotViewportBorders(pViewportBorders: WordBool); safecall;
    function  Get_ShowPlotStyles: WordBool; safecall;
    procedure Set_ShowPlotStyles(pStyles: WordBool); safecall;
    function  Get_PlotRotation: AcPlotRotation; safecall;
    procedure Set_PlotRotation(pRotation: AcPlotRotation); safecall;
    function  Get_CenterPlot: WordBool; safecall;
    procedure Set_CenterPlot(pCentered: WordBool); safecall;
    function  Get_PlotHidden: WordBool; safecall;
    procedure Set_PlotHidden(pHidden: WordBool); safecall;
    function  Get_PlotType: AcPlotType; safecall;
    procedure Set_PlotType(pType: AcPlotType); safecall;
    function  Get_ViewToPlot: WideString; safecall;
    procedure Set_ViewToPlot(const pName: WideString); safecall;
    function  Get_UseStandardScale: WordBool; safecall;
    procedure Set_UseStandardScale(pUseStdScale: WordBool); safecall;
    function  Get_StandardScale: AcPlotScale; safecall;
    procedure Set_StandardScale(pStdScale: AcPlotScale); safecall;
    procedure GetCustomScale(out Numerator: Double; out Denominator: Double); safecall;
    procedure SetCustomScale(Numerator: Double; Denominator: Double); safecall;
    function  Get_ScaleLineweights: WordBool; safecall;
    procedure Set_ScaleLineweights(pScale: WordBool); safecall;
    function  Get_PlotWithLineweights: WordBool; safecall;
    procedure Set_PlotWithLineweights(pPlot: WordBool); safecall;
    function  Get_PlotViewportsFirst: WordBool; safecall;
    procedure Set_PlotViewportsFirst(pViewportsFirst: WordBool); safecall;
    function  Get_StyleSheet: WideString; safecall;
    procedure Set_StyleSheet(const pName: WideString); safecall;
    procedure GetPaperMargins(out LowerLeft: OleVariant; out UpperRight: OleVariant); safecall;
    procedure GetPaperSize(out Width: Double; out Height: Double); safecall;
    function  Get_PlotOrigin: OleVariant; safecall;
    procedure Set_PlotOrigin(pOrigin: OleVariant); safecall;
    procedure GetWindowToPlot(out LowerLeft: OleVariant; out UpperRight: OleVariant); safecall;
    procedure SetWindowToPlot(LowerLeft: OleVariant; UpperRight: OleVariant); safecall;
    function  Get_PlotWithPlotStyles: WordBool; safecall;
    procedure Set_PlotWithPlotStyles(pStyles: WordBool); safecall;
    function  Get_ModelType: WordBool; safecall;
    procedure CopyFrom(const pPlotConfig: IAcadPlotConfiguration); safecall;
    function  GetCanonicalMediaNames: OleVariant; safecall;
    function  GetPlotDeviceNames: OleVariant; safecall;
    function  GetPlotStyleTableNames: OleVariant; safecall;
    procedure RefreshPlotDeviceInfo; safecall;
    function  GetLocaleMediaName(const Name: WideString): WideString; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property ConfigName: WideString read Get_ConfigName write Set_ConfigName;
    property CanonicalMediaName: WideString read Get_CanonicalMediaName write Set_CanonicalMediaName;
    property PaperUnits: AcPlotPaperUnits read Get_PaperUnits write Set_PaperUnits;
    property PlotViewportBorders: WordBool read Get_PlotViewportBorders write Set_PlotViewportBorders;
    property ShowPlotStyles: WordBool read Get_ShowPlotStyles write Set_ShowPlotStyles;
    property PlotRotation: AcPlotRotation read Get_PlotRotation write Set_PlotRotation;
    property CenterPlot: WordBool read Get_CenterPlot write Set_CenterPlot;
    property PlotHidden: WordBool read Get_PlotHidden write Set_PlotHidden;
    property PlotType: AcPlotType read Get_PlotType write Set_PlotType;
    property ViewToPlot: WideString read Get_ViewToPlot write Set_ViewToPlot;
    property UseStandardScale: WordBool read Get_UseStandardScale write Set_UseStandardScale;
    property StandardScale: AcPlotScale read Get_StandardScale write Set_StandardScale;
    property ScaleLineweights: WordBool read Get_ScaleLineweights write Set_ScaleLineweights;
    property PlotWithLineweights: WordBool read Get_PlotWithLineweights write Set_PlotWithLineweights;
    property PlotViewportsFirst: WordBool read Get_PlotViewportsFirst write Set_PlotViewportsFirst;
    property StyleSheet: WideString read Get_StyleSheet write Set_StyleSheet;
    property PlotOrigin: OleVariant read Get_PlotOrigin write Set_PlotOrigin;
    property PlotWithPlotStyles: WordBool read Get_PlotWithPlotStyles write Set_PlotWithPlotStyles;
    property ModelType: WordBool read Get_ModelType;
  end;

// *********************************************************************//
// DispIntf:  IAcadPlotConfigurationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3B6921F8-1DE6-11D2-B66E-0060B087E235}
// *********************************************************************//
  IAcadPlotConfigurationDisp = dispinterface
    ['{3B6921F8-1DE6-11D2-B66E-0060B087E235}']
    property Name: WideString dispid 1;
    property ConfigName: WideString dispid 3;
    property CanonicalMediaName: WideString dispid 6;
    property PaperUnits: AcPlotPaperUnits dispid 7;
    property PlotViewportBorders: WordBool dispid 8;
    property ShowPlotStyles: WordBool dispid 9;
    property PlotRotation: AcPlotRotation dispid 10;
    property CenterPlot: WordBool dispid 11;
    property PlotHidden: WordBool dispid 12;
    property PlotType: AcPlotType dispid 13;
    property ViewToPlot: WideString dispid 14;
    property UseStandardScale: WordBool dispid 15;
    property StandardScale: AcPlotScale dispid 16;
    procedure GetCustomScale(out Numerator: Double; out Denominator: Double); dispid 17;
    procedure SetCustomScale(Numerator: Double; Denominator: Double); dispid 18;
    property ScaleLineweights: WordBool dispid 20;
    property PlotWithLineweights: WordBool dispid 21;
    property PlotViewportsFirst: WordBool dispid 24;
    property StyleSheet: WideString dispid 25;
    procedure GetPaperMargins(out LowerLeft: OleVariant; out UpperRight: OleVariant); dispid 26;
    procedure GetPaperSize(out Width: Double; out Height: Double); dispid 28;
    property PlotOrigin: OleVariant dispid 30;
    procedure GetWindowToPlot(out LowerLeft: OleVariant; out UpperRight: OleVariant); dispid 31;
    procedure SetWindowToPlot(LowerLeft: OleVariant; UpperRight: OleVariant); dispid 32;
    property PlotWithPlotStyles: WordBool dispid 33;
    property ModelType: WordBool readonly dispid 34;
    procedure CopyFrom(const pPlotConfig: IAcadPlotConfiguration); dispid 35;
    function  GetCanonicalMediaNames: OleVariant; dispid 36;
    function  GetPlotDeviceNames: OleVariant; dispid 37;
    function  GetPlotStyleTableNames: OleVariant; dispid 38;
    procedure RefreshPlotDeviceInfo; dispid 39;
    function  GetLocaleMediaName(const Name: WideString): WideString; dispid 40;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLayout
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D8E-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadLayout = interface(IAcadPlotConfiguration)
    ['{B2547D8E-056E-11D2-B651-0060B087E235}']
    function  Get_Block: IAcadBlock; safecall;
    function  Get_TabOrder: Integer; safecall;
    procedure Set_TabOrder(pOrder: Integer); safecall;
    property Block: IAcadBlock read Get_Block;
    property TabOrder: Integer read Get_TabOrder write Set_TabOrder;
  end;

// *********************************************************************//
// DispIntf:  IAcadLayoutDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D8E-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadLayoutDisp = dispinterface
    ['{B2547D8E-056E-11D2-B651-0060B087E235}']
    property Block: IAcadBlock readonly dispid 48;
    property TabOrder: Integer dispid 49;
    property Name: WideString dispid 1;
    property ConfigName: WideString dispid 3;
    property CanonicalMediaName: WideString dispid 6;
    property PaperUnits: AcPlotPaperUnits dispid 7;
    property PlotViewportBorders: WordBool dispid 8;
    property ShowPlotStyles: WordBool dispid 9;
    property PlotRotation: AcPlotRotation dispid 10;
    property CenterPlot: WordBool dispid 11;
    property PlotHidden: WordBool dispid 12;
    property PlotType: AcPlotType dispid 13;
    property ViewToPlot: WideString dispid 14;
    property UseStandardScale: WordBool dispid 15;
    property StandardScale: AcPlotScale dispid 16;
    procedure GetCustomScale(out Numerator: Double; out Denominator: Double); dispid 17;
    procedure SetCustomScale(Numerator: Double; Denominator: Double); dispid 18;
    property ScaleLineweights: WordBool dispid 20;
    property PlotWithLineweights: WordBool dispid 21;
    property PlotViewportsFirst: WordBool dispid 24;
    property StyleSheet: WideString dispid 25;
    procedure GetPaperMargins(out LowerLeft: OleVariant; out UpperRight: OleVariant); dispid 26;
    procedure GetPaperSize(out Width: Double; out Height: Double); dispid 28;
    property PlotOrigin: OleVariant dispid 30;
    procedure GetWindowToPlot(out LowerLeft: OleVariant; out UpperRight: OleVariant); dispid 31;
    procedure SetWindowToPlot(LowerLeft: OleVariant; UpperRight: OleVariant); dispid 32;
    property PlotWithPlotStyles: WordBool dispid 33;
    property ModelType: WordBool readonly dispid 34;
    procedure CopyFrom(const pPlotConfig: IAcadPlotConfiguration); dispid 35;
    function  GetCanonicalMediaNames: OleVariant; dispid 36;
    function  GetPlotDeviceNames: OleVariant; dispid 37;
    function  GetPlotStyleTableNames: OleVariant; dispid 38;
    procedure RefreshPlotDeviceInfo; dispid 39;
    function  GetLocaleMediaName(const Name: WideString): WideString; dispid 40;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadMInsertBlock
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4DB-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMInsertBlock = interface(IAcadBlockReference)
    ['{2928D4DB-CA93-11D1-B60F-0060B087E235}']
    procedure Set_Columns(NumColumns: Integer); safecall;
    function  Get_Columns: Integer; safecall;
    procedure Set_ColumnSpacing(Spacing: Double); safecall;
    function  Get_ColumnSpacing: Double; safecall;
    procedure Set_Rows(NumRows: Integer); safecall;
    function  Get_Rows: Integer; safecall;
    procedure Set_RowSpacing(Spacing: Double); safecall;
    function  Get_RowSpacing: Double; safecall;
    property Columns: Integer read Get_Columns write Set_Columns;
    property ColumnSpacing: Double read Get_ColumnSpacing write Set_ColumnSpacing;
    property Rows: Integer read Get_Rows write Set_Rows;
    property RowSpacing: Double read Get_RowSpacing write Set_RowSpacing;
  end;

// *********************************************************************//
// DispIntf:  IAcadMInsertBlockDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4DB-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMInsertBlockDisp = dispinterface
    ['{2928D4DB-CA93-11D1-B60F-0060B087E235}']
    property Columns: Integer dispid 256;
    property ColumnSpacing: Double dispid 257;
    property Rows: Integer dispid 258;
    property RowSpacing: Double dispid 259;
    property InsertionPoint: OleVariant dispid 1;
    property Name: WideString dispid 2;
    property Normal: OleVariant dispid 3;
    property Rotation: ACAD_ANGLE dispid 4;
    property XScaleFactor: ACAD_NOUNITS dispid 5;
    property YScaleFactor: ACAD_NOUNITS dispid 6;
    property ZScaleFactor: ACAD_NOUNITS dispid 7;
    function  Explode: OleVariant; dispid 8;
    function  GetAttributes: OleVariant; dispid 9;
    function  GetConstantAttributes: OleVariant; dispid 10;
    property HasAttributes: WordBool readonly dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPolyfaceMesh
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolyfaceMesh = interface(IAcadEntity)
    ['{2928D4E2-CA93-11D1-B60F-0060B087E235}']
    procedure Set_Coordinates(Vertices: OleVariant); safecall;
    function  Get_Coordinates: OleVariant; safecall;
    function  Get_Coordinate(Index: SYSINT): OleVariant; safecall;
    procedure Set_Coordinate(Index: SYSINT; pVal: OleVariant); safecall;
    function  Get_NumberOfVertices: Integer; safecall;
    function  Get_NumberOfFaces: Integer; safecall;
    procedure Set_Faces(Param1: OleVariant); safecall;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
    property Coordinate[Index: SYSINT]: OleVariant read Get_Coordinate write Set_Coordinate;
    property NumberOfVertices: Integer read Get_NumberOfVertices;
    property NumberOfFaces: Integer read Get_NumberOfFaces;
    property Faces: OleVariant write Set_Faces;
  end;

// *********************************************************************//
// DispIntf:  IAcadPolyfaceMeshDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E2-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPolyfaceMeshDisp = dispinterface
    ['{2928D4E2-CA93-11D1-B60F-0060B087E235}']
    property Coordinates: OleVariant dispid 1;
    property Coordinate[Index: SYSINT]: OleVariant dispid 2;
    property NumberOfVertices: Integer readonly dispid 3;
    property NumberOfFaces: Integer readonly dispid 4;
    property Faces: OleVariant writeonly dispid 80;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadMLine
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMLine = interface(IAcadEntity)
    ['{2928D4E4-CA93-11D1-B60F-0060B087E235}']
    function  Get_StyleName: WideString; safecall;
    function  Get_Coordinates: OleVariant; safecall;
    procedure Set_Coordinates(Vertices: OleVariant); safecall;
    property StyleName: WideString read Get_StyleName;
    property Coordinates: OleVariant read Get_Coordinates write Set_Coordinates;
  end;

// *********************************************************************//
// DispIntf:  IAcadMLineDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E4-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadMLineDisp = dispinterface
    ['{2928D4E4-CA93-11D1-B60F-0060B087E235}']
    property StyleName: WideString readonly dispid 1;
    property Coordinates: OleVariant dispid 2;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDim3PointAngular
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDim3PointAngular = interface(IAcadDimension)
    ['{2928D4E0-CA93-11D1-B60F-0060B087E235}']
    function  Get_ExtLine1EndPoint: OleVariant; safecall;
    procedure Set_ExtLine1EndPoint(xLine1Point: OleVariant); safecall;
    function  Get_ExtLine2EndPoint: OleVariant; safecall;
    procedure Set_ExtLine2EndPoint(xLine2Point: OleVariant); safecall;
    function  Get_AngleVertex: OleVariant; safecall;
    procedure Set_AngleVertex(AngleVertex: OleVariant); safecall;
    function  Get_TextPrecision: AcDimPrecision; safecall;
    procedure Set_TextPrecision(AngleVertex: AcDimPrecision); safecall;
    function  Get_AngleFormat: AcAngleUnits; safecall;
    procedure Set_AngleFormat(format: AcAngleUnits); safecall;
    function  Get_DimensionLineColor: ACAD_COLOR; safecall;
    procedure Set_DimensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_ExtensionLineColor: ACAD_COLOR; safecall;
    procedure Set_ExtensionLineColor(Type_: ACAD_COLOR); safecall;
    function  Get_ExtensionLineExtend: Double; safecall;
    procedure Set_ExtensionLineExtend(extend: Double); safecall;
    function  Get_Fit: AcDimFit; safecall;
    procedure Set_Fit(fittype: AcDimFit); safecall;
    function  Get_HorizontalTextPosition: AcDimHorizontalJustification; safecall;
    procedure Set_HorizontalTextPosition(Type_: AcDimHorizontalJustification); safecall;
    function  Get_ExtensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_ExtensionLineWeight(lweight: ACAD_LWEIGHT); safecall;
    function  Get_DimLine1Suppress: WordBool; safecall;
    procedure Set_DimLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLine2Suppress: WordBool; safecall;
    procedure Set_DimLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine1Suppress: WordBool; safecall;
    procedure Set_ExtLine1Suppress(bSuppress: WordBool); safecall;
    function  Get_ExtLine2Suppress: WordBool; safecall;
    procedure Set_ExtLine2Suppress(bSuppress: WordBool); safecall;
    function  Get_DimLineInside: WordBool; safecall;
    procedure Set_DimLineInside(bInside: WordBool); safecall;
    function  Get_TextInsideAlign: WordBool; safecall;
    procedure Set_TextInsideAlign(bInside: WordBool); safecall;
    function  Get_TextInside: WordBool; safecall;
    procedure Set_TextInside(bInside: WordBool); safecall;
    function  Get_ForceLineInside: WordBool; safecall;
    procedure Set_ForceLineInside(bInside: WordBool); safecall;
    function  Get_TextOutsideAlign: WordBool; safecall;
    procedure Set_TextOutsideAlign(bInside: WordBool); safecall;
    function  Get_ExtensionLineOffset: Double; safecall;
    procedure Set_ExtensionLineOffset(Offset: Double); safecall;
    function  Get_DimensionLineWeight: ACAD_LWEIGHT; safecall;
    procedure Set_DimensionLineWeight(weight: ACAD_LWEIGHT); safecall;
    function  Get_ArrowheadSize: Double; safecall;
    procedure Set_ArrowheadSize(size: Double); safecall;
    function  Get_Arrowhead1Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead1Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Arrowhead2Type: AcDimArrowheadType; safecall;
    procedure Set_Arrowhead2Type(Type_: AcDimArrowheadType); safecall;
    function  Get_Measurement: ACAD_ANGLE; safecall;
    function  Get_Arrowhead1Block: WideString; safecall;
    procedure Set_Arrowhead1Block(const BlockName: WideString); safecall;
    function  Get_Arrowhead2Block: WideString; safecall;
    procedure Set_Arrowhead2Block(const BlockName: WideString); safecall;
    property ExtLine1EndPoint: OleVariant read Get_ExtLine1EndPoint write Set_ExtLine1EndPoint;
    property ExtLine2EndPoint: OleVariant read Get_ExtLine2EndPoint write Set_ExtLine2EndPoint;
    property AngleVertex: OleVariant read Get_AngleVertex write Set_AngleVertex;
    property TextPrecision: AcDimPrecision read Get_TextPrecision write Set_TextPrecision;
    property AngleFormat: AcAngleUnits read Get_AngleFormat write Set_AngleFormat;
    property DimensionLineColor: ACAD_COLOR read Get_DimensionLineColor write Set_DimensionLineColor;
    property ExtensionLineColor: ACAD_COLOR read Get_ExtensionLineColor write Set_ExtensionLineColor;
    property ExtensionLineExtend: Double read Get_ExtensionLineExtend write Set_ExtensionLineExtend;
    property Fit: AcDimFit read Get_Fit write Set_Fit;
    property HorizontalTextPosition: AcDimHorizontalJustification read Get_HorizontalTextPosition write Set_HorizontalTextPosition;
    property ExtensionLineWeight: ACAD_LWEIGHT read Get_ExtensionLineWeight write Set_ExtensionLineWeight;
    property DimLine1Suppress: WordBool read Get_DimLine1Suppress write Set_DimLine1Suppress;
    property DimLine2Suppress: WordBool read Get_DimLine2Suppress write Set_DimLine2Suppress;
    property ExtLine1Suppress: WordBool read Get_ExtLine1Suppress write Set_ExtLine1Suppress;
    property ExtLine2Suppress: WordBool read Get_ExtLine2Suppress write Set_ExtLine2Suppress;
    property DimLineInside: WordBool read Get_DimLineInside write Set_DimLineInside;
    property TextInsideAlign: WordBool read Get_TextInsideAlign write Set_TextInsideAlign;
    property TextInside: WordBool read Get_TextInside write Set_TextInside;
    property ForceLineInside: WordBool read Get_ForceLineInside write Set_ForceLineInside;
    property TextOutsideAlign: WordBool read Get_TextOutsideAlign write Set_TextOutsideAlign;
    property ExtensionLineOffset: Double read Get_ExtensionLineOffset write Set_ExtensionLineOffset;
    property DimensionLineWeight: ACAD_LWEIGHT read Get_DimensionLineWeight write Set_DimensionLineWeight;
    property ArrowheadSize: Double read Get_ArrowheadSize write Set_ArrowheadSize;
    property Arrowhead1Type: AcDimArrowheadType read Get_Arrowhead1Type write Set_Arrowhead1Type;
    property Arrowhead2Type: AcDimArrowheadType read Get_Arrowhead2Type write Set_Arrowhead2Type;
    property Measurement: ACAD_ANGLE read Get_Measurement;
    property Arrowhead1Block: WideString read Get_Arrowhead1Block write Set_Arrowhead1Block;
    property Arrowhead2Block: WideString read Get_Arrowhead2Block write Set_Arrowhead2Block;
  end;

// *********************************************************************//
// DispIntf:  IAcadDim3PointAngularDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDim3PointAngularDisp = dispinterface
    ['{2928D4E0-CA93-11D1-B60F-0060B087E235}']
    property ExtLine1EndPoint: OleVariant dispid 38;
    property ExtLine2EndPoint: OleVariant dispid 40;
    property AngleVertex: OleVariant dispid 45;
    property TextPrecision: AcDimPrecision dispid 36;
    property AngleFormat: AcAngleUnits dispid 41;
    property DimensionLineColor: ACAD_COLOR dispid 13;
    property ExtensionLineColor: ACAD_COLOR dispid 14;
    property ExtensionLineExtend: Double dispid 17;
    property Fit: AcDimFit dispid 18;
    property HorizontalTextPosition: AcDimHorizontalJustification dispid 20;
    property ExtensionLineWeight: ACAD_LWEIGHT dispid 23;
    property DimLine1Suppress: WordBool dispid 25;
    property DimLine2Suppress: WordBool dispid 26;
    property ExtLine1Suppress: WordBool dispid 27;
    property ExtLine2Suppress: WordBool dispid 28;
    property DimLineInside: WordBool dispid 29;
    property TextInsideAlign: WordBool dispid 30;
    property TextInside: WordBool dispid 31;
    property ForceLineInside: WordBool dispid 32;
    property TextOutsideAlign: WordBool dispid 33;
    property ExtensionLineOffset: Double dispid 35;
    property DimensionLineWeight: ACAD_LWEIGHT dispid 60;
    property ArrowheadSize: Double dispid 61;
    property Arrowhead1Type: AcDimArrowheadType dispid 62;
    property Arrowhead2Type: AcDimArrowheadType dispid 63;
    property Measurement: ACAD_ANGLE readonly dispid 64;
    property Arrowhead1Block: WideString dispid 65;
    property Arrowhead2Block: WideString dispid 66;
    property Normal: OleVariant dispid 1537;
    property Rotation: ACAD_ANGLE dispid 1538;
    property TextPosition: OleVariant dispid 1539;
    property TextRotation: ACAD_ANGLE dispid 1540;
    property TextOverride: WideString dispid 1541;
    property StyleName: WideString dispid 1542;
    property TextColor: ACAD_COLOR dispid 1546;
    property DecimalSeparator: WideString dispid 1548;
    property TextGap: Double dispid 1549;
    property TextPrefix: WideString dispid 1551;
    property TextSuffix: WideString dispid 1552;
    property ScaleFactor: ACAD_NOUNITS dispid 1553;
    property VerticalTextPosition: AcDimVerticalJustification dispid 1554;
    property TolerancePrecision: AcDimPrecision dispid 1555;
    property ToleranceHeightScale: ACAD_NOUNITS dispid 1556;
    property ToleranceLowerLimit: Double dispid 1557;
    property TextMovement: AcDimTextMovement dispid 1558;
    property ToleranceDisplay: AcDimToleranceMethod dispid 1559;
    property ToleranceJustification: AcDimToleranceJustify dispid 1560;
    property ToleranceUpperLimit: Double dispid 1561;
    property TextStyle: WideString dispid 1562;
    property TextHeight: Double dispid 1563;
    property SuppressLeadingZeros: WordBool dispid 1565;
    property SuppressTrailingZeros: WordBool dispid 1566;
    property ToleranceSuppressLeadingZeros: WordBool dispid 1569;
    property ToleranceSuppressTrailingZeros: WordBool dispid 1570;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadExternalReference
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadExternalReference = interface(IAcadBlockReference)
    ['{2928D4E6-CA93-11D1-B60F-0060B087E235}']
    function  Get_Path: WideString; safecall;
    procedure Set_Path(const bstrName: WideString); safecall;
    property Path: WideString read Get_Path write Set_Path;
  end;

// *********************************************************************//
// DispIntf:  IAcadExternalReferenceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4E6-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadExternalReferenceDisp = dispinterface
    ['{2928D4E6-CA93-11D1-B60F-0060B087E235}']
    property Path: WideString dispid 256;
    property InsertionPoint: OleVariant dispid 1;
    property Name: WideString dispid 2;
    property Normal: OleVariant dispid 3;
    property Rotation: ACAD_ANGLE dispid 4;
    property XScaleFactor: ACAD_NOUNITS dispid 5;
    property YScaleFactor: ACAD_NOUNITS dispid 6;
    property ZScaleFactor: ACAD_NOUNITS dispid 7;
    function  Explode: OleVariant; dispid 8;
    function  GetAttributes: OleVariant; dispid 9;
    function  GetConstantAttributes: OleVariant; dispid 10;
    property HasAttributes: WordBool readonly dispid 11;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPaperSpace
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E96-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadPaperSpace = interface(IAcadBlock)
    ['{A1617E96-FB21-11D1-A2C8-080009DC639A}']
    function  AddPViewport(Center: OleVariant; Width: Double; Height: Double): IAcadPViewport; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAcadPaperSpaceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E96-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadPaperSpaceDisp = dispinterface
    ['{A1617E96-FB21-11D1-A2C8-080009DC639A}']
    function  AddPViewport(Center: OleVariant; Width: Double; Height: Double): IAcadPViewport; dispid 1;
    function  Item(Index: OleVariant): IAcadEntity; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1536;
    property Name: WideString dispid 1537;
    property Origin: OleVariant dispid 1538;
    function  AddCustomObject(const ClassName: WideString): IDispatch; dispid 1539;
    function  Add3DFace(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                        Point4: OleVariant): IAcad3DFace; dispid 1540;
    function  Add3DMesh(M: SYSINT; N: SYSINT; PointsMatrix: OleVariant): IAcadPolygonMesh; dispid 1541;
    function  Add3DPoly(PointsArray: OleVariant): IAcad3DPolyline; dispid 1542;
    function  AddArc(Center: OleVariant; Radius: Double; StartAngle: Double; EndAngle: Double): IAcadArc; dispid 1543;
    function  AddAttribute(Height: Double; Mode: AcAttributeMode; const Prompt: WideString;
                           InsertionPoint: OleVariant; const Tag: WideString;
                           const Value: WideString): IAcadAttribute; dispid 1544;
    function  AddBox(Origin: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1545;
    function  AddCircle(Center: OleVariant; Radius: Double): IAcadCircle; dispid 1546;
    function  AddCone(Center: OleVariant; BaseRadius: Double; Height: Double): IAcad3DSolid; dispid 1547;
    function  AddCylinder(Center: OleVariant; Radius: Double; Height: Double): IAcad3DSolid; dispid 1548;
    function  AddDimAligned(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            TextPosition: OleVariant): IAcadDimAligned; dispid 1549;
    function  AddDimAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                            SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDimAngular; dispid 1550;
    function  AddDimDiametric(ChordPoint: OleVariant; FarChordPoint: OleVariant;
                              LeaderLength: Double): IAcadDimDiametric; dispid 1551;
    function  AddDimRotated(ExtLine1Point: OleVariant; ExtLine2Point: OleVariant;
                            DimLineLocation: OleVariant; RotationAngle: Double): IAcadDimRotated; dispid 1552;
    function  AddDimOrdinate(DefinitionPoint: OleVariant; LeaderEndPoint: OleVariant;
                             UseXAxis: SYSINT): IAcadDimOrdinate; dispid 1553;
    function  AddDimRadial(Center: OleVariant; ChordPoint: OleVariant; LeaderLength: Double): IAcadDimRadial; dispid 1554;
    function  AddEllipse(Center: OleVariant; MajorAxis: OleVariant; RadiusRatio: Double): IAcadEllipse; dispid 1555;
    function  AddEllipticalCone(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                Height: Double): IAcad3DSolid; dispid 1556;
    function  AddEllipticalCylinder(Center: OleVariant; MajorRadius: Double; MinorRadius: Double;
                                    Height: Double): IAcad3DSolid; dispid 1557;
    function  AddExtrudedSolid(const Profile: IAcadRegion; Height: Double; TaperAngle: Double): IAcad3DSolid; dispid 1558;
    function  AddExtrudedSolidAlongPath(const Profile: IAcadRegion; const Path: IDispatch): IAcad3DSolid; dispid 1559;
    function  AddLeader(PointsArray: OleVariant; const Annotation: IAcadEntity; Type_: AcLeaderType): IAcadLeader; dispid 1560;
    function  AddMText(InsertionPoint: OleVariant; Width: Double; const Text: WideString): IAcadMText; dispid 1561;
    function  AddPoint(Point: OleVariant): IAcadPoint; dispid 1562;
    function  AddLightWeightPolyline(VerticesList: OleVariant): IAcadLWPolyline; dispid 1563;
    function  AddPolyline(VerticesList: OleVariant): IAcadPolyline; dispid 1564;
    function  AddRay(Point1: OleVariant; Point2: OleVariant): IAcadRay; dispid 1565;
    function  AddRegion(ObjectList: OleVariant): OleVariant; dispid 1566;
    function  AddRevolvedSolid(const Profile: IAcadRegion; AxisPoint: OleVariant;
                               AxisDir: OleVariant; Angle: Double): IAcad3DSolid; dispid 1567;
    function  AddShape(const Name: WideString; InsertionPoint: OleVariant; ScaleFactor: Double;
                       RotationAngle: Double): IAcadShape; dispid 1568;
    function  AddSolid(Point1: OleVariant; Point2: OleVariant; point3: OleVariant;
                       Point4: OleVariant): IAcadSolid; dispid 1569;
    function  AddSphere(Center: OleVariant; Radius: Double): IAcad3DSolid; dispid 1570;
    function  AddSpline(PointsArray: OleVariant; StartTangent: OleVariant; EndTangent: OleVariant): IAcadSpline; dispid 1571;
    function  AddText(const TextString: WideString; InsertionPoint: OleVariant; Height: Double): IAcadText; dispid 1572;
    function  AddTolerance(const Text: WideString; InsertionPoint: OleVariant; Direction: OleVariant): IAcadTolerance; dispid 1573;
    function  AddTorus(Center: OleVariant; TorusRadius: Double; TubeRadius: Double): IAcad3DSolid; dispid 1574;
    function  AddTrace(PointsArray: OleVariant): IAcadTrace; dispid 1575;
    function  AddWedge(Center: OleVariant; Length: Double; Width: Double; Height: Double): IAcad3DSolid; dispid 1576;
    function  AddXline(Point1: OleVariant; Point2: OleVariant): IAcadXline; dispid 1577;
    function  InsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                          Yscale: Double; Zscale: Double; Rotation: Double): IAcadBlockReference; dispid 1578;
    function  AddHatch(PatternType: SYSINT; const PatternName: WideString; Associativity: WordBool): IAcadHatch; dispid 1579;
    function  AddRaster(const imageFileName: WideString; InsertionPoint: OleVariant;
                        ScaleFactor: Double; RotationAngle: Double): IAcadRasterImage; dispid 1580;
    function  AddLine(StartPoint: OleVariant; EndPoint: OleVariant): IAcadLine; dispid 1581;
    property IsLayout: WordBool readonly dispid 1582;
    property Layout: IAcadLayout readonly dispid 1583;
    property IsXRef: WordBool readonly dispid 1584;
    function  AddMInsertBlock(InsertionPoint: OleVariant; const Name: WideString; Xscale: Double;
                              Yscale: Double; Zscale: Double; Rotation: Double; NumRows: Integer;
                              NumColumns: Integer; RowSpacing: Integer; ColumnSpacing: Integer): IAcadMInsertBlock; dispid 1585;
    function  AddPolyfaceMesh(VertexList: OleVariant; FaceList: OleVariant): IAcadPolyfaceMesh; dispid 1586;
    function  AddMLine(VertexList: OleVariant): IAcadMLine; dispid 1587;
    function  AddDim3PointAngular(AngleVertex: OleVariant; FirstEndPoint: OleVariant;
                                  SecondEndPoint: OleVariant; TextPoint: OleVariant): IAcadDim3PointAngular; dispid 1588;
    property XRefDatabase: IAcadDatabase readonly dispid 1589;
    function  AttachExternalReference(const PathName: WideString; const Name: WideString;
                                      InsertionPoint: OleVariant; Xscale: Double; Yscale: Double;
                                      Zscale: Double; Rotation: Double; bOverlay: WordBool): IAcadExternalReference; dispid 1590;
    procedure Unload; dispid 1591;
    procedure Reload; dispid 1592;
    procedure Bind(bPrefixName: WordBool); dispid 1593;
    procedure Detach; dispid 1594;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPViewport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D9-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPViewport = interface(IAcadEntity)
    ['{2928D4D9-CA93-11D1-B60F-0060B087E235}']
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(CenterPoint: OleVariant); safecall;
    function  Get_Direction: OleVariant; safecall;
    procedure Set_Direction(dirVector: OleVariant); safecall;
    function  Get_GridOn: WordBool; safecall;
    procedure Set_GridOn(bGridOn: WordBool); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Width(Width: Double); safecall;
    function  Get_ViewportOn: WordBool; safecall;
    procedure Set_ViewportOn(bOn: WordBool); safecall;
    function  Get_Clipped: WordBool; safecall;
    function  Get_DisplayLocked: WordBool; safecall;
    procedure Set_DisplayLocked(bLocked: WordBool); safecall;
    function  Get_StandardScale: AcViewportScale; safecall;
    procedure Set_StandardScale(scale: AcViewportScale); safecall;
    function  Get_CustomScale: Double; safecall;
    procedure Set_CustomScale(scale: Double); safecall;
    function  Get_StyleSheet: WideString; safecall;
    procedure Set_StyleSheet(const pName: WideString); safecall;
    function  Get_UCSPerViewport: WordBool; safecall;
    procedure Set_UCSPerViewport(UCSSaved: WordBool); safecall;
    function  Get_SnapBasePoint: OleVariant; safecall;
    procedure Set_SnapBasePoint(lowLeft: OleVariant); safecall;
    function  Get_SnapOn: WordBool; safecall;
    procedure Set_SnapOn(bSnapOn: WordBool); safecall;
    function  Get_SnapRotationAngle: Double; safecall;
    procedure Set_SnapRotationAngle(Angle: Double); safecall;
    function  Get_UCSIconOn: WordBool; safecall;
    procedure Set_UCSIconOn(bIconOn: WordBool); safecall;
    function  Get_UCSIconAtOrigin: WordBool; safecall;
    procedure Set_UCSIconAtOrigin(bIconAtOrigin: WordBool); safecall;
    procedure GetGridSpacing(out XSpacing: Double; out YSpacing: Double); safecall;
    procedure SetGridSpacing(XSpacing: Double; YSpacing: Double); safecall;
    procedure GetSnapSpacing(out XSpacing: Double; out YSpacing: Double); safecall;
    procedure SetSnapSpacing(XSpacing: Double; YSpacing: Double); safecall;
    procedure Display(bStatus: WordBool); safecall;
    function  Get_TwistAngle: ACAD_ANGLE; safecall;
    procedure Set_TwistAngle(Angle: ACAD_ANGLE); safecall;
    function  Get_LensLength: Double; safecall;
    procedure Set_LensLength(Length: Double); safecall;
    function  Get_RemoveHiddenLines: WordBool; safecall;
    procedure Set_RemoveHiddenLines(bRemoval: WordBool); safecall;
    function  Get_Target: OleVariant; safecall;
    procedure Set_Target(targetPoint: OleVariant); safecall;
    function  Get_ArcSmoothness: Integer; safecall;
    procedure Set_ArcSmoothness(arcSmooth: Integer); safecall;
    property Center: OleVariant read Get_Center write Set_Center;
    property Direction: OleVariant read Get_Direction write Set_Direction;
    property GridOn: WordBool read Get_GridOn write Set_GridOn;
    property Height: Double read Get_Height write Set_Height;
    property Width: Double read Get_Width write Set_Width;
    property ViewportOn: WordBool read Get_ViewportOn write Set_ViewportOn;
    property Clipped: WordBool read Get_Clipped;
    property DisplayLocked: WordBool read Get_DisplayLocked write Set_DisplayLocked;
    property StandardScale: AcViewportScale read Get_StandardScale write Set_StandardScale;
    property CustomScale: Double read Get_CustomScale write Set_CustomScale;
    property StyleSheet: WideString read Get_StyleSheet write Set_StyleSheet;
    property UCSPerViewport: WordBool read Get_UCSPerViewport write Set_UCSPerViewport;
    property SnapBasePoint: OleVariant read Get_SnapBasePoint write Set_SnapBasePoint;
    property SnapOn: WordBool read Get_SnapOn write Set_SnapOn;
    property SnapRotationAngle: Double read Get_SnapRotationAngle write Set_SnapRotationAngle;
    property UCSIconOn: WordBool read Get_UCSIconOn write Set_UCSIconOn;
    property UCSIconAtOrigin: WordBool read Get_UCSIconAtOrigin write Set_UCSIconAtOrigin;
    property TwistAngle: ACAD_ANGLE read Get_TwistAngle write Set_TwistAngle;
    property LensLength: Double read Get_LensLength write Set_LensLength;
    property RemoveHiddenLines: WordBool read Get_RemoveHiddenLines write Set_RemoveHiddenLines;
    property Target: OleVariant read Get_Target write Set_Target;
    property ArcSmoothness: Integer read Get_ArcSmoothness write Set_ArcSmoothness;
  end;

// *********************************************************************//
// DispIntf:  IAcadPViewportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4D9-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadPViewportDisp = dispinterface
    ['{2928D4D9-CA93-11D1-B60F-0060B087E235}']
    property Center: OleVariant dispid 1;
    property Direction: OleVariant dispid 2;
    property GridOn: WordBool dispid 3;
    property Height: Double dispid 4;
    property Width: Double dispid 5;
    property ViewportOn: WordBool dispid 6;
    property Clipped: WordBool readonly dispid 7;
    property DisplayLocked: WordBool dispid 8;
    property StandardScale: AcViewportScale dispid 9;
    property CustomScale: Double dispid 10;
    property StyleSheet: WideString dispid 11;
    property UCSPerViewport: WordBool dispid 12;
    property SnapBasePoint: OleVariant dispid 13;
    property SnapOn: WordBool dispid 14;
    property SnapRotationAngle: Double dispid 15;
    property UCSIconOn: WordBool dispid 16;
    property UCSIconAtOrigin: WordBool dispid 17;
    procedure GetGridSpacing(out XSpacing: Double; out YSpacing: Double); dispid 18;
    procedure SetGridSpacing(XSpacing: Double; YSpacing: Double); dispid 19;
    procedure GetSnapSpacing(out XSpacing: Double; out YSpacing: Double); dispid 20;
    procedure SetSnapSpacing(XSpacing: Double; YSpacing: Double); dispid 21;
    procedure Display(bStatus: WordBool); dispid 22;
    property TwistAngle: ACAD_ANGLE dispid 23;
    property LensLength: Double dispid 24;
    property RemoveHiddenLines: WordBool dispid 25;
    property Target: OleVariant dispid 26;
    property ArcSmoothness: Integer dispid 27;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadBlocks
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E98-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadBlocks = interface(IAcadObject)
    ['{A1617E98-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadBlock; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(InsertionPoint: OleVariant; const Name: WideString): IAcadBlock; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadBlocksDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E98-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadBlocksDisp = dispinterface
    ['{A1617E98-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadBlock; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(InsertionPoint: OleVariant; const Name: WideString): IAcadBlock; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadGroups
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B49978B8-F971-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadGroups = interface(IAcadObject)
    ['{B49978B8-F971-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadGroup; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadGroup; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadGroupsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B49978B8-F971-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadGroupsDisp = dispinterface
    ['{B49978B8-F971-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadGroup; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadGroup; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadGroup
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B49978B6-F971-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadGroup = interface(IAcadObject)
    ['{B49978B6-F971-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadEntity; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    procedure Set_Color(Param1: AcColor); safecall;
    procedure Set_Layer(const Param1: WideString); safecall;
    procedure Set_Linetype(const Param1: WideString); safecall;
    procedure Set_LinetypeScale(Param1: ACAD_NOUNITS); safecall;
    procedure Set_Visible(Param1: WordBool); safecall;
    procedure Highlight(HighlightFlag: WordBool); safecall;
    procedure Set_PlotStyleName(const Param1: WideString); safecall;
    procedure Set_Lineweight(Param1: ACAD_LWEIGHT); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    procedure AppendItems(Objects: OleVariant); safecall;
    procedure RemoveItems(Objects: OleVariant); safecall;
    procedure Update; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Color: AcColor write Set_Color;
    property Layer: WideString write Set_Layer;
    property Linetype: WideString write Set_Linetype;
    property LinetypeScale: ACAD_NOUNITS write Set_LinetypeScale;
    property Visible: WordBool write Set_Visible;
    property PlotStyleName: WideString write Set_PlotStyleName;
    property Lineweight: ACAD_LWEIGHT write Set_Lineweight;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IAcadGroupDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B49978B6-F971-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadGroupDisp = dispinterface
    ['{B49978B6-F971-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadEntity; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    property Color: AcColor writeonly dispid 2;
    property Layer: WideString writeonly dispid 3;
    property Linetype: WideString writeonly dispid 4;
    property LinetypeScale: ACAD_NOUNITS writeonly dispid 5;
    property Visible: WordBool writeonly dispid 6;
    procedure Highlight(HighlightFlag: WordBool); dispid 7;
    property PlotStyleName: WideString writeonly dispid 8;
    property Lineweight: ACAD_LWEIGHT writeonly dispid 9;
    property Name: WideString dispid 10;
    procedure AppendItems(Objects: OleVariant); dispid 11;
    procedure RemoveItems(Objects: OleVariant); dispid 12;
    procedure Update; dispid 14;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimStyles
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59238-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDimStyles = interface(IAcadObject)
    ['{A4D59238-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadDimStyle; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadDimStyle; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimStylesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59238-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDimStylesDisp = dispinterface
    ['{A4D59238-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadDimStyle; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadDimStyle; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDimStyle
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D482-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimStyle = interface(IAcadObject)
    ['{2928D482-CA93-11D1-B60F-0060B087E235}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    procedure CopyFrom(const StyleSource: IDispatch); safecall;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IAcadDimStyleDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D482-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadDimStyleDisp = dispinterface
    ['{2928D482-CA93-11D1-B60F-0060B087E235}']
    property Name: WideString dispid 1;
    procedure CopyFrom(const StyleSource: IDispatch); dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLayers
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C9CFC0FD-DACF-11D1-A2C2-080009DC639A}
// *********************************************************************//
  IAcadLayers = interface(IAcadObject)
    ['{C9CFC0FD-DACF-11D1-A2C2-080009DC639A}']
    function  Item(Index: OleVariant): IAcadLayer; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadLayer; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadLayersDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {C9CFC0FD-DACF-11D1-A2C2-080009DC639A}
// *********************************************************************//
  IAcadLayersDisp = dispinterface
    ['{C9CFC0FD-DACF-11D1-A2C2-080009DC639A}']
    function  Item(Index: OleVariant): IAcadLayer; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadLayer; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLayer
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D484-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLayer = interface(IAcadObject)
    ['{2928D484-CA93-11D1-B60F-0060B087E235}']
    function  Get_Color: AcColor; safecall;
    procedure Set_Color(Color: AcColor); safecall;
    function  Get_Freeze: WordBool; safecall;
    procedure Set_Freeze(bFreeze: WordBool); safecall;
    function  Get_LayerOn: WordBool; safecall;
    procedure Set_LayerOn(bOn: WordBool); safecall;
    function  Get_Linetype: WideString; safecall;
    procedure Set_Linetype(const Linetype: WideString); safecall;
    function  Get_Lock: WordBool; safecall;
    procedure Set_Lock(Block: WordBool); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Plottable: WordBool; safecall;
    procedure Set_Plottable(bPlottable: WordBool); safecall;
    function  Get_ViewportDefault: WordBool; safecall;
    procedure Set_ViewportDefault(bDefault: WordBool); safecall;
    function  Get_PlotStyleName: WideString; safecall;
    procedure Set_PlotStyleName(const plotStyle: WideString); safecall;
    function  Get_Lineweight: ACAD_LWEIGHT; safecall;
    procedure Set_Lineweight(Lineweight: ACAD_LWEIGHT); safecall;
    property Color: AcColor read Get_Color write Set_Color;
    property Freeze: WordBool read Get_Freeze write Set_Freeze;
    property LayerOn: WordBool read Get_LayerOn write Set_LayerOn;
    property Linetype: WideString read Get_Linetype write Set_Linetype;
    property Lock: WordBool read Get_Lock write Set_Lock;
    property Name: WideString read Get_Name write Set_Name;
    property Plottable: WordBool read Get_Plottable write Set_Plottable;
    property ViewportDefault: WordBool read Get_ViewportDefault write Set_ViewportDefault;
    property PlotStyleName: WideString read Get_PlotStyleName write Set_PlotStyleName;
    property Lineweight: ACAD_LWEIGHT read Get_Lineweight write Set_Lineweight;
  end;

// *********************************************************************//
// DispIntf:  IAcadLayerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D484-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLayerDisp = dispinterface
    ['{2928D484-CA93-11D1-B60F-0060B087E235}']
    property Color: AcColor dispid 1;
    property Freeze: WordBool dispid 2;
    property LayerOn: WordBool dispid 3;
    property Linetype: WideString dispid 4;
    property Lock: WordBool dispid 5;
    property Name: WideString dispid 6;
    property Plottable: WordBool dispid 7;
    property ViewportDefault: WordBool dispid 8;
    property PlotStyleName: WideString dispid 9;
    property Lineweight: ACAD_LWEIGHT dispid 10;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLineTypes
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923C-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadLineTypes = interface(IAcadObject)
    ['{A4D5923C-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadLineType; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadLineType; safecall;
    procedure Load(const Name: WideString; const FileName: WideString); safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadLineTypesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923C-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadLineTypesDisp = dispinterface
    ['{A4D5923C-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadLineType; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadLineType; dispid 2;
    procedure Load(const Name: WideString; const FileName: WideString); dispid 3;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLineType
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D487-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLineType = interface(IAcadObject)
    ['{2928D487-CA93-11D1-B60F-0060B087E235}']
    function  Get_Description: WideString; safecall;
    procedure Set_Description(const bstrDes: WideString); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    property Description: WideString read Get_Description write Set_Description;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IAcadLineTypeDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D487-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadLineTypeDisp = dispinterface
    ['{2928D487-CA93-11D1-B60F-0060B087E235}']
    property Description: WideString dispid 1;
    property Name: WideString dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDictionaries
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923A-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDictionaries = interface(IAcadObject)
    ['{A4D5923A-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadObject; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadDictionary; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadDictionariesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923A-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDictionariesDisp = dispinterface
    ['{A4D5923A-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadObject; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadDictionary; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDictionary
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F8DD32D0-F7DF-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDictionary = interface(IAcadObject)
    ['{F8DD32D0-F7DF-11D1-A2C8-080009DC639A}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const pVal: WideString); safecall;
    function  AddObject(const Keyword: WideString; const ObjectName: WideString): IAcadObject; safecall;
    function  GetName(const Object_: IAcadObject): WideString; safecall;
    function  GetObject(const Name: WideString): IAcadObject; safecall;
    function  Remove(const Name: WideString): IAcadObject; safecall;
    procedure Rename(const OldName: WideString; const NewName: WideString); safecall;
    procedure Replace(const OldName: WideString; const pObj: IAcadObject); safecall;
    function  Item(Index: OleVariant): IAcadObject; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  AddXRecord(const Keyword: WideString): IAcadXRecord; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
  end;

// *********************************************************************//
// DispIntf:  IAcadDictionaryDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {F8DD32D0-F7DF-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadDictionaryDisp = dispinterface
    ['{F8DD32D0-F7DF-11D1-A2C8-080009DC639A}']
    property Name: WideString dispid 2;
    function  AddObject(const Keyword: WideString; const ObjectName: WideString): IAcadObject; dispid 3;
    function  GetName(const Object_: IAcadObject): WideString; dispid 4;
    function  GetObject(const Name: WideString): IAcadObject; dispid 5;
    function  Remove(const Name: WideString): IAcadObject; dispid 6;
    procedure Rename(const OldName: WideString; const NewName: WideString); dispid 7;
    procedure Replace(const OldName: WideString; const pObj: IAcadObject); dispid 8;
    function  Item(Index: OleVariant): IAcadObject; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1;
    function  AddXRecord(const Keyword: WideString): IAcadXRecord; dispid 9;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadXRecord
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4DD-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadXRecord = interface(IAcadObject)
    ['{2928D4DD-CA93-11D1-B60F-0060B087E235}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    procedure GetXRecordData(out XRecordDataType: OleVariant; out XRecordDataValue: OleVariant); safecall;
    procedure SetXRecordData(XRecordDataType: OleVariant; XRecordDataValue: OleVariant); safecall;
    function  Get_TranslateIDs: WordBool; safecall;
    procedure Set_TranslateIDs(xlateIds: WordBool); safecall;
    property Name: WideString read Get_Name write Set_Name;
    property TranslateIDs: WordBool read Get_TranslateIDs write Set_TranslateIDs;
  end;

// *********************************************************************//
// DispIntf:  IAcadXRecordDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4DD-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadXRecordDisp = dispinterface
    ['{2928D4DD-CA93-11D1-B60F-0060B087E235}']
    property Name: WideString dispid 1;
    procedure GetXRecordData(out XRecordDataType: OleVariant; out XRecordDataValue: OleVariant); dispid 2;
    procedure SetXRecordData(XRecordDataType: OleVariant; XRecordDataValue: OleVariant); dispid 3;
    property TranslateIDs: WordBool dispid 4;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadRegisteredApplications
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59242-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadRegisteredApplications = interface(IAcadObject)
    ['{A4D59242-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadRegisteredApplication; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadRegisteredApplication; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadRegisteredApplicationsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59242-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadRegisteredApplicationsDisp = dispinterface
    ['{A4D59242-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadRegisteredApplication; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadRegisteredApplication; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadRegisteredApplication
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48A-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRegisteredApplication = interface(IAcadObject)
    ['{2928D48A-CA93-11D1-B60F-0060B087E235}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IAcadRegisteredApplicationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48A-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadRegisteredApplicationDisp = dispinterface
    ['{2928D48A-CA93-11D1-B60F-0060B087E235}']
    property Name: WideString dispid 1;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadTextStyles
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923E-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadTextStyles = interface(IAcadObject)
    ['{A4D5923E-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadTextStyle; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadTextStyle; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadTextStylesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D5923E-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadTextStylesDisp = dispinterface
    ['{A4D5923E-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadTextStyle; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadTextStyle; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadTextStyle
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48C-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTextStyle = interface(IAcadObject)
    ['{2928D48C-CA93-11D1-B60F-0060B087E235}']
    function  Get_BigFontFile: WideString; safecall;
    procedure Set_BigFontFile(const fontFile: WideString); safecall;
    function  Get_fontFile: WideString; safecall;
    procedure Set_fontFile(const fontFile: WideString); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_LastHeight: Double; safecall;
    procedure Set_LastHeight(Height: Double); safecall;
    function  Get_Name: WideString; safecall;
    function  Get_ObliqueAngle: ACAD_ANGLE; safecall;
    procedure Set_ObliqueAngle(obliAngle: ACAD_ANGLE); safecall;
    function  Get_TextGenerationFlag: Integer; safecall;
    procedure Set_TextGenerationFlag(textGenFlag: Integer); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Width(Width: Double); safecall;
    procedure GetFont(out TypeFace: WideString; out Bold: WordBool; out Italic: WordBool;
                      out Charset: Integer; out PitchAndFamily: Integer); safecall;
    procedure SetFont(const TypeFace: WideString; Bold: WordBool; Italic: WordBool;
                      Charset: Integer; PitchAndFamily: Integer); safecall;
    property BigFontFile: WideString read Get_BigFontFile write Set_BigFontFile;
    property fontFile: WideString read Get_fontFile write Set_fontFile;
    property Height: Double read Get_Height write Set_Height;
    property LastHeight: Double read Get_LastHeight write Set_LastHeight;
    property Name: WideString read Get_Name;
    property ObliqueAngle: ACAD_ANGLE read Get_ObliqueAngle write Set_ObliqueAngle;
    property TextGenerationFlag: Integer read Get_TextGenerationFlag write Set_TextGenerationFlag;
    property Width: Double read Get_Width write Set_Width;
  end;

// *********************************************************************//
// DispIntf:  IAcadTextStyleDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48C-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadTextStyleDisp = dispinterface
    ['{2928D48C-CA93-11D1-B60F-0060B087E235}']
    property BigFontFile: WideString dispid 1;
    property fontFile: WideString dispid 2;
    property Height: Double dispid 3;
    property LastHeight: Double dispid 4;
    property Name: WideString readonly dispid 5;
    property ObliqueAngle: ACAD_ANGLE dispid 6;
    property TextGenerationFlag: Integer dispid 7;
    property Width: Double dispid 8;
    procedure GetFont(out TypeFace: WideString; out Bold: WordBool; out Italic: WordBool;
                      out Charset: Integer; out PitchAndFamily: Integer); dispid 9;
    procedure SetFont(const TypeFace: WideString; Bold: WordBool; Italic: WordBool;
                      Charset: Integer; PitchAndFamily: Integer); dispid 16;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadUCSs
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59240-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadUCSs = interface(IAcadObject)
    ['{A4D59240-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadUCS; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(Origin: OleVariant; XAxisPoint: OleVariant; YAxisPoint: OleVariant;
                  const Name: WideString): IAcadUCS; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadUCSsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59240-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadUCSsDisp = dispinterface
    ['{A4D59240-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadUCS; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(Origin: OleVariant; XAxisPoint: OleVariant; YAxisPoint: OleVariant;
                  const Name: WideString): IAcadUCS; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadUCS
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48E-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadUCS = interface(IAcadObject)
    ['{2928D48E-CA93-11D1-B60F-0060B087E235}']
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Origin: OleVariant; safecall;
    procedure Set_Origin(Origin: OleVariant); safecall;
    function  Get_XVector: OleVariant; safecall;
    procedure Set_XVector(XVector: OleVariant); safecall;
    function  Get_YVector: OleVariant; safecall;
    procedure Set_YVector(YVector: OleVariant); safecall;
    function  GetUCSMatrix: OleVariant; safecall;
    property Name: WideString read Get_Name write Set_Name;
    property Origin: OleVariant read Get_Origin write Set_Origin;
    property XVector: OleVariant read Get_XVector write Set_XVector;
    property YVector: OleVariant read Get_YVector write Set_YVector;
  end;

// *********************************************************************//
// DispIntf:  IAcadUCSDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D48E-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadUCSDisp = dispinterface
    ['{2928D48E-CA93-11D1-B60F-0060B087E235}']
    property Name: WideString dispid 1;
    property Origin: OleVariant dispid 2;
    property XVector: OleVariant dispid 3;
    property YVector: OleVariant dispid 4;
    function  GetUCSMatrix: OleVariant; dispid 5;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadViews
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59244-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadViews = interface(IAcadObject)
    ['{A4D59244-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadView; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadView; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadViewsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59244-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadViewsDisp = dispinterface
    ['{A4D59244-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadView; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadView; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadView
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D490-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadView = interface(IAcadObject)
    ['{2928D490-CA93-11D1-B60F-0060B087E235}']
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(Center: OleVariant); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Width(Width: Double); safecall;
    function  Get_Target: OleVariant; safecall;
    procedure Set_Target(targetPoint: OleVariant); safecall;
    function  Get_Direction: OleVariant; safecall;
    procedure Set_Direction(dirVec: OleVariant); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    property Center: OleVariant read Get_Center write Set_Center;
    property Height: Double read Get_Height write Set_Height;
    property Width: Double read Get_Width write Set_Width;
    property Target: OleVariant read Get_Target write Set_Target;
    property Direction: OleVariant read Get_Direction write Set_Direction;
    property Name: WideString read Get_Name write Set_Name;
  end;

// *********************************************************************//
// DispIntf:  IAcadViewDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D490-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadViewDisp = dispinterface
    ['{2928D490-CA93-11D1-B60F-0060B087E235}']
    property Center: OleVariant dispid 1;
    property Height: Double dispid 2;
    property Width: Double dispid 3;
    property Target: OleVariant dispid 4;
    property Direction: OleVariant dispid 5;
    property Name: WideString dispid 6;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadViewports
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59246-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadViewports = interface(IAcadObject)
    ['{A4D59246-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadViewport; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadViewport; safecall;
    procedure DeleteConfiguration(const Name: WideString); safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadViewportsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A4D59246-F4D6-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadViewportsDisp = dispinterface
    ['{A4D59246-F4D6-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadViewport; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadViewport; dispid 2;
    procedure DeleteConfiguration(const Name: WideString); dispid 3;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadViewport
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D492-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadViewport = interface(IAcadObject)
    ['{2928D492-CA93-11D1-B60F-0060B087E235}']
    function  Get_Center: OleVariant; safecall;
    procedure Set_Center(Center: OleVariant); safecall;
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_Width: Double; safecall;
    procedure Set_Width(Width: Double); safecall;
    function  Get_Target: OleVariant; safecall;
    procedure Set_Target(targetPoint: OleVariant); safecall;
    function  Get_Direction: OleVariant; safecall;
    procedure Set_Direction(dirVec: OleVariant); safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_GridOn: WordBool; safecall;
    procedure Set_GridOn(bGridOn: WordBool); safecall;
    function  Get_OrthoOn: WordBool; safecall;
    procedure Set_OrthoOn(bOrthoOn: WordBool); safecall;
    function  Get_SnapBasePoint: OleVariant; safecall;
    procedure Set_SnapBasePoint(lowLeft: OleVariant); safecall;
    function  Get_SnapOn: WordBool; safecall;
    procedure Set_SnapOn(bSnapOn: WordBool); safecall;
    function  Get_SnapRotationAngle: ACAD_ANGLE; safecall;
    procedure Set_SnapRotationAngle(Angle: ACAD_ANGLE); safecall;
    function  Get_UCSIconOn: WordBool; safecall;
    procedure Set_UCSIconOn(bIconOn: WordBool); safecall;
    function  Get_UCSIconAtOrigin: WordBool; safecall;
    procedure Set_UCSIconAtOrigin(bIconAtOrigin: WordBool); safecall;
    function  Get_LowerLeftCorner: OleVariant; safecall;
    function  Get_UpperRightCorner: OleVariant; safecall;
    procedure Split(NumWins: AcViewportSplitType); safecall;
    procedure GetGridSpacing(out XSpacing: Double; out YSpacing: Double); safecall;
    procedure SetGridSpacing(XSpacing: Double; YSpacing: Double); safecall;
    procedure GetSnapSpacing(out XSpacing: Double; out YSpacing: Double); safecall;
    procedure SetSnapSpacing(XSpacing: Double; YSpacing: Double); safecall;
    procedure SetView(const View: IAcadView); safecall;
    function  Get_ArcSmoothness: Integer; safecall;
    procedure Set_ArcSmoothness(arcSmooth: Integer); safecall;
    property Center: OleVariant read Get_Center write Set_Center;
    property Height: Double read Get_Height write Set_Height;
    property Width: Double read Get_Width write Set_Width;
    property Target: OleVariant read Get_Target write Set_Target;
    property Direction: OleVariant read Get_Direction write Set_Direction;
    property Name: WideString read Get_Name write Set_Name;
    property GridOn: WordBool read Get_GridOn write Set_GridOn;
    property OrthoOn: WordBool read Get_OrthoOn write Set_OrthoOn;
    property SnapBasePoint: OleVariant read Get_SnapBasePoint write Set_SnapBasePoint;
    property SnapOn: WordBool read Get_SnapOn write Set_SnapOn;
    property SnapRotationAngle: ACAD_ANGLE read Get_SnapRotationAngle write Set_SnapRotationAngle;
    property UCSIconOn: WordBool read Get_UCSIconOn write Set_UCSIconOn;
    property UCSIconAtOrigin: WordBool read Get_UCSIconAtOrigin write Set_UCSIconAtOrigin;
    property LowerLeftCorner: OleVariant read Get_LowerLeftCorner;
    property UpperRightCorner: OleVariant read Get_UpperRightCorner;
    property ArcSmoothness: Integer read Get_ArcSmoothness write Set_ArcSmoothness;
  end;

// *********************************************************************//
// DispIntf:  IAcadViewportDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D492-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadViewportDisp = dispinterface
    ['{2928D492-CA93-11D1-B60F-0060B087E235}']
    property Center: OleVariant dispid 1;
    property Height: Double dispid 2;
    property Width: Double dispid 3;
    property Target: OleVariant dispid 4;
    property Direction: OleVariant dispid 5;
    property Name: WideString dispid 6;
    property GridOn: WordBool dispid 7;
    property OrthoOn: WordBool dispid 8;
    property SnapBasePoint: OleVariant dispid 9;
    property SnapOn: WordBool dispid 10;
    property SnapRotationAngle: ACAD_ANGLE dispid 11;
    property UCSIconOn: WordBool dispid 13;
    property UCSIconAtOrigin: WordBool dispid 14;
    property LowerLeftCorner: OleVariant readonly dispid 15;
    property UpperRightCorner: OleVariant readonly dispid 16;
    procedure Split(NumWins: AcViewportSplitType); dispid 17;
    procedure GetGridSpacing(out XSpacing: Double; out YSpacing: Double); dispid 18;
    procedure SetGridSpacing(XSpacing: Double; YSpacing: Double); dispid 19;
    procedure GetSnapSpacing(out XSpacing: Double; out YSpacing: Double); dispid 20;
    procedure SetSnapSpacing(XSpacing: Double; YSpacing: Double); dispid 21;
    procedure SetView(const View: IAcadView); dispid 22;
    property ArcSmoothness: Integer dispid 23;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadLayouts
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D8F-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadLayouts = interface(IAcadObject)
    ['{B2547D8F-056E-11D2-B651-0060B087E235}']
    function  Item(Index: OleVariant): IAcadLayout; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString): IAcadLayout; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadLayoutsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B2547D8F-056E-11D2-B651-0060B087E235}
// *********************************************************************//
  IAcadLayoutsDisp = dispinterface
    ['{B2547D8F-056E-11D2-B651-0060B087E235}']
    function  Item(Index: OleVariant): IAcadLayout; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString): IAcadLayout; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadPlotConfigurations
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3B6921F9-1DE6-11D2-B66E-0060B087E235}
// *********************************************************************//
  IAcadPlotConfigurations = interface(IAcadObject)
    ['{3B6921F9-1DE6-11D2-B66E-0060B087E235}']
    function  Item(Index: OleVariant): IAcadPlotConfiguration; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Add(const Name: WideString; ModelType: OleVariant): IAcadPlotConfiguration; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
  end;

// *********************************************************************//
// DispIntf:  IAcadPlotConfigurationsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {3B6921F9-1DE6-11D2-B66E-0060B087E235}
// *********************************************************************//
  IAcadPlotConfigurationsDisp = dispinterface
    ['{3B6921F9-1DE6-11D2-B66E-0060B087E235}']
    function  Item(Index: OleVariant): IAcadPlotConfiguration; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    function  Add(const Name: WideString; ModelType: OleVariant): IAcadPlotConfiguration; dispid 2;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// Interface: IAcadDatabasePreferences
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9A2B984-2805-11D2-B678-0060B087E235}
// *********************************************************************//
  IAcadDatabasePreferences = interface(IDispatch)
    ['{B9A2B984-2805-11D2-B678-0060B087E235}']
    function  Get_Application: IDispatch; safecall;
    function  Get_SolidFill: WordBool; safecall;
    procedure Set_SolidFill(Fill: WordBool); safecall;
    function  Get_XRefEdit: WordBool; safecall;
    procedure Set_XRefEdit(Edit: WordBool); safecall;
    function  Get_XRefLayerVisibility: WordBool; safecall;
    procedure Set_XRefLayerVisibility(XRefLayerVis: WordBool); safecall;
    function  Get_OLELaunch: WordBool; safecall;
    procedure Set_OLELaunch(Launch: WordBool); safecall;
    function  Get_AllowLongSymbolNames: WordBool; safecall;
    procedure Set_AllowLongSymbolNames(LongNames: WordBool); safecall;
    function  Get_ObjectSortBySelection: WordBool; safecall;
    procedure Set_ObjectSortBySelection(Sort: WordBool); safecall;
    function  Get_ObjectSortBySnap: WordBool; safecall;
    procedure Set_ObjectSortBySnap(Sort: WordBool); safecall;
    function  Get_ObjectSortByRedraws: WordBool; safecall;
    procedure Set_ObjectSortByRedraws(Sort: WordBool); safecall;
    function  Get_ObjectSortByRegens: WordBool; safecall;
    procedure Set_ObjectSortByRegens(Sort: WordBool); safecall;
    function  Get_ObjectSortByPlotting: WordBool; safecall;
    procedure Set_ObjectSortByPlotting(Sort: WordBool); safecall;
    function  Get_ObjectSortByPSOutput: WordBool; safecall;
    procedure Set_ObjectSortByPSOutput(Sort: WordBool); safecall;
    procedure Set_ContourLinesPerSurface(Path: Integer); safecall;
    function  Get_ContourLinesPerSurface: Integer; safecall;
    procedure Set_DisplaySilhouette(Path: WordBool); safecall;
    function  Get_DisplaySilhouette: WordBool; safecall;
    procedure Set_MaxActiveViewports(Path: Integer); safecall;
    function  Get_MaxActiveViewports: Integer; safecall;
    procedure Set_RenderSmoothness(Path: Double); safecall;
    function  Get_RenderSmoothness: Double; safecall;
    procedure Set_SegmentPerPolyline(Path: Integer); safecall;
    function  Get_SegmentPerPolyline: Integer; safecall;
    procedure Set_TextFrameDisplay(Path: WordBool); safecall;
    function  Get_TextFrameDisplay: WordBool; safecall;
    procedure Set_Lineweight(Path: AcLineWeight); safecall;
    function  Get_Lineweight: AcLineWeight; safecall;
    procedure Set_LineWeightDisplay(Path: WordBool); safecall;
    function  Get_LineWeightDisplay: WordBool; safecall;
    property Application: IDispatch read Get_Application;
    property SolidFill: WordBool read Get_SolidFill write Set_SolidFill;
    property XRefEdit: WordBool read Get_XRefEdit write Set_XRefEdit;
    property XRefLayerVisibility: WordBool read Get_XRefLayerVisibility write Set_XRefLayerVisibility;
    property OLELaunch: WordBool read Get_OLELaunch write Set_OLELaunch;
    property AllowLongSymbolNames: WordBool read Get_AllowLongSymbolNames write Set_AllowLongSymbolNames;
    property ObjectSortBySelection: WordBool read Get_ObjectSortBySelection write Set_ObjectSortBySelection;
    property ObjectSortBySnap: WordBool read Get_ObjectSortBySnap write Set_ObjectSortBySnap;
    property ObjectSortByRedraws: WordBool read Get_ObjectSortByRedraws write Set_ObjectSortByRedraws;
    property ObjectSortByRegens: WordBool read Get_ObjectSortByRegens write Set_ObjectSortByRegens;
    property ObjectSortByPlotting: WordBool read Get_ObjectSortByPlotting write Set_ObjectSortByPlotting;
    property ObjectSortByPSOutput: WordBool read Get_ObjectSortByPSOutput write Set_ObjectSortByPSOutput;
    property ContourLinesPerSurface: Integer read Get_ContourLinesPerSurface write Set_ContourLinesPerSurface;
    property DisplaySilhouette: WordBool read Get_DisplaySilhouette write Set_DisplaySilhouette;
    property MaxActiveViewports: Integer read Get_MaxActiveViewports write Set_MaxActiveViewports;
    property RenderSmoothness: Double read Get_RenderSmoothness write Set_RenderSmoothness;
    property SegmentPerPolyline: Integer read Get_SegmentPerPolyline write Set_SegmentPerPolyline;
    property TextFrameDisplay: WordBool read Get_TextFrameDisplay write Set_TextFrameDisplay;
    property Lineweight: AcLineWeight read Get_Lineweight write Set_Lineweight;
    property LineWeightDisplay: WordBool read Get_LineWeightDisplay write Set_LineWeightDisplay;
  end;

// *********************************************************************//
// DispIntf:  IAcadDatabasePreferencesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {B9A2B984-2805-11D2-B678-0060B087E235}
// *********************************************************************//
  IAcadDatabasePreferencesDisp = dispinterface
    ['{B9A2B984-2805-11D2-B678-0060B087E235}']
    property Application: IDispatch readonly dispid 1;
    property SolidFill: WordBool dispid 2;
    property XRefEdit: WordBool dispid 4;
    property XRefLayerVisibility: WordBool dispid 5;
    property OLELaunch: WordBool dispid 8;
    property AllowLongSymbolNames: WordBool dispid 9;
    property ObjectSortBySelection: WordBool dispid 10;
    property ObjectSortBySnap: WordBool dispid 11;
    property ObjectSortByRedraws: WordBool dispid 12;
    property ObjectSortByRegens: WordBool dispid 13;
    property ObjectSortByPlotting: WordBool dispid 14;
    property ObjectSortByPSOutput: WordBool dispid 16;
    property ContourLinesPerSurface: Integer dispid 19;
    property DisplaySilhouette: WordBool dispid 21;
    property MaxActiveViewports: Integer dispid 22;
    property RenderSmoothness: Double dispid 23;
    property SegmentPerPolyline: Integer dispid 24;
    property TextFrameDisplay: WordBool dispid 25;
    property Lineweight: AcLineWeight dispid 26;
    property LineWeightDisplay: WordBool dispid 27;
  end;

// *********************************************************************//
// Interface: IAcadObjectEvents
// Flags:     (256) OleAutomation
// GUID:      {67F4AC32-C9DC-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadObjectEvents = interface(IUnknown)
    ['{67F4AC32-C9DC-11D1-B60F-0060B087E235}']
    function  Modified(const pObject: IAcadObject): HResult; stdcall;
  end;

// *********************************************************************//
// Interface: IAcadIdPair
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0D069D6C-7C0B-11D2-B6DD-0060B087E235}
// *********************************************************************//
  IAcadIdPair = interface(IDispatch)
    ['{0D069D6C-7C0B-11D2-B6DD-0060B087E235}']
    function  Get_IsCloned: WordBool; safecall;
    function  Get_IsOwnerXlated: WordBool; safecall;
    function  Get_IsPrimary: WordBool; safecall;
    function  Get_Key: Integer; safecall;
    function  Get_Value: Integer; safecall;
    function  Get_Application: IDispatch; safecall;
    property IsCloned: WordBool read Get_IsCloned;
    property IsOwnerXlated: WordBool read Get_IsOwnerXlated;
    property IsPrimary: WordBool read Get_IsPrimary;
    property Key: Integer read Get_Key;
    property Value: Integer read Get_Value;
    property Application: IDispatch read Get_Application;
  end;

// *********************************************************************//
// DispIntf:  IAcadIdPairDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {0D069D6C-7C0B-11D2-B6DD-0060B087E235}
// *********************************************************************//
  IAcadIdPairDisp = dispinterface
    ['{0D069D6C-7C0B-11D2-B6DD-0060B087E235}']
    property IsCloned: WordBool readonly dispid 1;
    property IsOwnerXlated: WordBool readonly dispid 2;
    property IsPrimary: WordBool readonly dispid 3;
    property Key: Integer readonly dispid 4;
    property Value: Integer readonly dispid 5;
    property Application: IDispatch readonly dispid 6;
  end;

// *********************************************************************//
// Interface: IAcadAttributeReference
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadAttributeReference = interface(IAcadEntity)
    ['{2928D4A0-CA93-11D1-B60F-0060B087E235}']
    function  Get_Height: Double; safecall;
    procedure Set_Height(Height: Double); safecall;
    function  Get_HorizontalAlignment: AcHorizontalAlignment; safecall;
    procedure Set_HorizontalAlignment(horizAlign: AcHorizontalAlignment); safecall;
    function  Get_InsertionPoint: OleVariant; safecall;
    procedure Set_InsertionPoint(insPoint: OleVariant); safecall;
    function  Get_Normal: OleVariant; safecall;
    procedure Set_Normal(Normal: OleVariant); safecall;
    function  Get_ObliqueAngle: ACAD_ANGLE; safecall;
    procedure Set_ObliqueAngle(obliAngle: ACAD_ANGLE); safecall;
    function  Get_Rotation: ACAD_ANGLE; safecall;
    procedure Set_Rotation(rotAngle: ACAD_ANGLE); safecall;
    function  Get_ScaleFactor: ACAD_NOUNITS; safecall;
    procedure Set_ScaleFactor(scalFactor: ACAD_NOUNITS); safecall;
    function  Get_StyleName: WideString; safecall;
    procedure Set_StyleName(const Name: WideString); safecall;
    function  Get_TagString: WideString; safecall;
    procedure Set_TagString(const bstrTag: WideString); safecall;
    function  Get_TextAlignmentPoint: OleVariant; safecall;
    procedure Set_TextAlignmentPoint(alignPoint: OleVariant); safecall;
    function  Get_TextGenerationFlag: Integer; safecall;
    procedure Set_TextGenerationFlag(textGenFlag: Integer); safecall;
    function  Get_TextString: WideString; safecall;
    procedure Set_TextString(const bstrText: WideString); safecall;
    function  Get_Thickness: Double; safecall;
    procedure Set_Thickness(Thickness: Double); safecall;
    function  Get_VerticalAlignment: AcVerticalAlignment; safecall;
    procedure Set_VerticalAlignment(vertiAlign: AcVerticalAlignment); safecall;
    function  Get_FieldLength: Integer; safecall;
    procedure Set_FieldLength(fieldLen: Integer); safecall;
    function  Get_Alignment: AcAlignment; safecall;
    procedure Set_Alignment(align: AcAlignment); safecall;
    function  Get_UpsideDown: WordBool; safecall;
    procedure Set_UpsideDown(bUpsideDown: WordBool); safecall;
    function  Get_Backward: WordBool; safecall;
    procedure Set_Backward(bBackward: WordBool); safecall;
    function  Get_Invisible: WordBool; safecall;
    procedure Set_Invisible(bInvisible: WordBool); safecall;
    function  Get_Constant: WordBool; safecall;
    property Height: Double read Get_Height write Set_Height;
    property HorizontalAlignment: AcHorizontalAlignment read Get_HorizontalAlignment write Set_HorizontalAlignment;
    property InsertionPoint: OleVariant read Get_InsertionPoint write Set_InsertionPoint;
    property Normal: OleVariant read Get_Normal write Set_Normal;
    property ObliqueAngle: ACAD_ANGLE read Get_ObliqueAngle write Set_ObliqueAngle;
    property Rotation: ACAD_ANGLE read Get_Rotation write Set_Rotation;
    property ScaleFactor: ACAD_NOUNITS read Get_ScaleFactor write Set_ScaleFactor;
    property StyleName: WideString read Get_StyleName write Set_StyleName;
    property TagString: WideString read Get_TagString write Set_TagString;
    property TextAlignmentPoint: OleVariant read Get_TextAlignmentPoint write Set_TextAlignmentPoint;
    property TextGenerationFlag: Integer read Get_TextGenerationFlag write Set_TextGenerationFlag;
    property TextString: WideString read Get_TextString write Set_TextString;
    property Thickness: Double read Get_Thickness write Set_Thickness;
    property VerticalAlignment: AcVerticalAlignment read Get_VerticalAlignment write Set_VerticalAlignment;
    property FieldLength: Integer read Get_FieldLength write Set_FieldLength;
    property Alignment: AcAlignment read Get_Alignment write Set_Alignment;
    property UpsideDown: WordBool read Get_UpsideDown write Set_UpsideDown;
    property Backward: WordBool read Get_Backward write Set_Backward;
    property Invisible: WordBool read Get_Invisible write Set_Invisible;
    property Constant: WordBool read Get_Constant;
  end;

// *********************************************************************//
// DispIntf:  IAcadAttributeReferenceDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {2928D4A0-CA93-11D1-B60F-0060B087E235}
// *********************************************************************//
  IAcadAttributeReferenceDisp = dispinterface
    ['{2928D4A0-CA93-11D1-B60F-0060B087E235}']
    property Height: Double dispid 1;
    property HorizontalAlignment: AcHorizontalAlignment dispid 2;
    property InsertionPoint: OleVariant dispid 3;
    property Normal: OleVariant dispid 4;
    property ObliqueAngle: ACAD_ANGLE dispid 5;
    property Rotation: ACAD_ANGLE dispid 6;
    property ScaleFactor: ACAD_NOUNITS dispid 7;
    property StyleName: WideString dispid 8;
    property TagString: WideString dispid 9;
    property TextAlignmentPoint: OleVariant dispid 10;
    property TextGenerationFlag: Integer dispid 11;
    property TextString: WideString dispid 12;
    property Thickness: Double dispid 13;
    property VerticalAlignment: AcVerticalAlignment dispid 14;
    property FieldLength: Integer dispid 15;
    property Alignment: AcAlignment dispid 16;
    property UpsideDown: WordBool dispid 17;
    property Backward: WordBool dispid 18;
    property Invisible: WordBool dispid 19;
    property Constant: WordBool readonly dispid 20;
    property Color: ACAD_COLOR dispid 1280;
    property Layer: WideString dispid 1281;
    property Linetype: WideString dispid 1282;
    property LinetypeScale: ACAD_NOUNITS dispid 1283;
    property Visible: WordBool dispid 1284;
    function  ArrayPolar(NumberOfObjects: SYSINT; AngleToFill: Double; CenterPoint: OleVariant): OleVariant; dispid 1285;
    function  ArrayRectangular(NumberOfRows: SYSINT; NumberOfColumns: SYSINT;
                               NumberOfLevels: SYSINT; DistBetweenRows: Double;
                               DistBetweenCols: Double; DistBetweenLevels: Double): OleVariant; dispid 1286;
    procedure Highlight(HighlightFlag: WordBool); dispid 1287;
    function  Copy: IDispatch; dispid 1288;
    procedure Move(FromPoint: OleVariant; ToPoint: OleVariant); dispid 1289;
    procedure Rotate(BasePoint: OleVariant; RotationAngle: Double); dispid 1290;
    procedure Rotate3D(Point1: OleVariant; Point2: OleVariant; RotationAngle: Double); dispid 1291;
    function  Mirror(Point1: OleVariant; Point2: OleVariant): IDispatch; dispid 1292;
    function  Mirror3D(Point1: OleVariant; Point2: OleVariant; point3: OleVariant): IDispatch; dispid 1293;
    procedure ScaleEntity(BasePoint: OleVariant; ScaleFactor: Double); dispid 1294;
    procedure TransformBy(TransformationMatrix: OleVariant); dispid 1295;
    procedure Update; dispid 1296;
    procedure GetBoundingBox(out MinPoint: OleVariant; out MaxPoint: OleVariant); dispid 1297;
    function  IntersectWith(const IntersectObject: IDispatch; option: AcExtendOption): OleVariant; dispid 1298;
    property PlotStyleName: WideString dispid 1299;
    property Lineweight: ACAD_LWEIGHT dispid 1300;
    property Hyperlinks: IAcadHyperlinks readonly dispid 1301;
    property EntityName: WideString readonly dispid 1397;
    property EntityType: Integer readonly dispid 1398;
    property Handle: WideString readonly dispid 1024;
    property ObjectName: WideString readonly dispid 1025;
    procedure GetXData(const AppName: WideString; out XDataType: OleVariant;
                       out XDataValue: OleVariant); dispid 1026;
    procedure SetXData(XDataType: OleVariant; XDataValue: OleVariant); dispid 1027;
    procedure Delete; dispid 1028;
    property ObjectID: Integer readonly dispid 1029;
    property Application: IDispatch readonly dispid 1030;
    property Database: IAcadDatabase readonly dispid 1031;
    property HasExtensionDictionary: WordBool readonly dispid 1032;
    function  GetExtensionDictionary: IAcadDictionary; dispid 1033;
    property OwnerID: Integer readonly dispid 1034;
    property Document: IDispatch readonly dispid 1035;
    procedure Erase; dispid 1141;
  end;

// *********************************************************************//
// DispIntf:  _DAcadApplicationEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {2974A76E-A19B-11D1-A2B0-080009DC639A}
// *********************************************************************//
  _DAcadApplicationEvents = dispinterface
    ['{2974A76E-A19B-11D1-A2B0-080009DC639A}']
    procedure SysVarChanged(const SysvarName: WideString; newVal: OleVariant); dispid 1;
    procedure NewDrawing; dispid 2;
    procedure AppActivate; dispid 3;
    procedure AppDeactivate; dispid 4;
    procedure WindowMovedOrResized(HWNDFrame: Integer; bMoved: WordBool); dispid 5;
    procedure BeginModal; dispid 6;
    procedure EndModal; dispid 7;
    procedure BeginQuit(var Cancel: WordBool); dispid 8;
    procedure BeginFileDrop(const FileName: WideString; var Cancel: WordBool); dispid 10;
    procedure ARXLoaded(const AppName: WideString); dispid 11;
    procedure ARXUnloaded(const AppName: WideString); dispid 12;
    procedure BeginPlot(const DrawingName: WideString); dispid 13;
    procedure EndPlot(const DrawingName: WideString); dispid 14;
    procedure BeginSave(const FileName: WideString); dispid 19;
    procedure EndSave(const FileName: WideString); dispid 20;
    procedure BeginOpen(var FileName: WideString); dispid 21;
    procedure EndOpen(const FileName: WideString); dispid 22;
    procedure BeginCommand(const CommandName: WideString); dispid 17;
    procedure EndCommand(const CommandName: WideString); dispid 18;
    procedure BeginLisp(const FirstLine: WideString); dispid 15;
    procedure EndLisp; dispid 16;
    procedure LispCancelled; dispid 24;
    procedure WindowChanged(WindowState: AcWindowState); dispid 25;
  end;

// *********************************************************************//
// Interface: IAcadDocument
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8E75D912-3D21-11D2-85C4-080009A0C626}
// *********************************************************************//
  IAcadDocument = interface(IAcadDatabase)
    ['{8E75D912-3D21-11D2-85C4-080009A0C626}']
    function  Get_Plot: IAcadPlot; safecall;
    function  Get_ActiveLayer: IAcadLayer; safecall;
    procedure Set_ActiveLayer(const pActLayer: IAcadLayer); safecall;
    function  Get_ActiveLinetype: IAcadLineType; safecall;
    procedure Set_ActiveLinetype(const pActLinetype: IAcadLineType); safecall;
    function  Get_ActiveDimStyle: IAcadDimStyle; safecall;
    procedure Set_ActiveDimStyle(const pActDimStyle: IAcadDimStyle); safecall;
    function  Get_ActiveTextStyle: IAcadTextStyle; safecall;
    procedure Set_ActiveTextStyle(const pActTextStyle: IAcadTextStyle); safecall;
    function  Get_ActiveUCS: IAcadUCS; safecall;
    procedure Set_ActiveUCS(const pActUCS: IAcadUCS); safecall;
    function  Get_ActiveViewport: IAcadViewport; safecall;
    procedure Set_ActiveViewport(const pActView: IAcadViewport); safecall;
    function  Get_ActivePViewport: IAcadPViewport; safecall;
    procedure Set_ActivePViewport(const pActView: IAcadPViewport); safecall;
    function  Get_ActiveSpace: AcActiveSpace; safecall;
    procedure Set_ActiveSpace(ActSpace: AcActiveSpace); safecall;
    function  Get_SelectionSets: IAcadSelectionSets; safecall;
    function  Get_ActiveSelectionSet: IAcadSelectionSet; safecall;
    function  Get_FullName: WideString; safecall;
    function  Get_Name: WideString; safecall;
    function  Get_Path: WideString; safecall;
    function  Get_ObjectSnapMode: WordBool; safecall;
    procedure Set_ObjectSnapMode(fSnapMode: WordBool); safecall;
    function  Get_ReadOnly: WordBool; safecall;
    function  Get_Saved: WordBool; safecall;
    function  Get_MSpace: WordBool; safecall;
    procedure Set_MSpace(Mode: WordBool); safecall;
    function  Get_Utility: IAcadUtility; safecall;
    function  Open(const FullName: WideString): IAcadDocument; safecall;
    procedure AuditInfo(FixErr: WordBool); safecall;
    function  Import(const FileName: WideString; InsertionPoint: OleVariant; ScaleFactor: Double): IDispatch; safecall;
    procedure Export(const FileName: WideString; const Extension: WideString;
                     const SelectionSet: IAcadSelectionSet); safecall;
    function  New(const TemplateFileName: WideString): IAcadDocument; safecall;
    procedure Save; safecall;
    procedure SaveAs(const FullFileName: WideString; SaveAsType: OleVariant); safecall;
    procedure Wblock(const FileName: WideString; const SelectionSet: IAcadSelectionSet); safecall;
    procedure PurgeAll; safecall;
    function  GetVariable(const Name: WideString): OleVariant; safecall;
    procedure SetVariable(const Name: WideString; Value: OleVariant); safecall;
    procedure LoadShapeFile(const FullName: WideString); safecall;
    procedure Regen(WhichViewports: AcRegenType); safecall;
    function  Get_PickfirstSelectionSet: IAcadSelectionSet; safecall;
    function  Get_Active: WordBool; safecall;
    procedure Activate; safecall;
    procedure Close(SaveChanges: OleVariant; FileName: OleVariant); safecall;
    procedure Set_WindowState(pWinState: AcWindowState); safecall;
    function  Get_WindowState: AcWindowState; safecall;
    procedure Set_Width(pWidth: SYSINT); safecall;
    function  Get_Width: SYSINT; safecall;
    procedure Set_Height(pHeight: SYSINT); safecall;
    function  Get_Height: SYSINT; safecall;
    procedure Set_ActiveLayout(const pLayout: IAcadLayout); safecall;
    function  Get_ActiveLayout: IAcadLayout; safecall;
    procedure SendCommand(const Command: WideString); safecall;
    function  Get_HWND: Integer; safecall;
    function  Get_WindowTitle: WideString; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Database: IAcadDatabase; safecall;
    procedure StartUndoMark; safecall;
    procedure EndUndoMark; safecall;
    property Plot: IAcadPlot read Get_Plot;
    property ActiveLayer: IAcadLayer read Get_ActiveLayer write Set_ActiveLayer;
    property ActiveLinetype: IAcadLineType read Get_ActiveLinetype write Set_ActiveLinetype;
    property ActiveDimStyle: IAcadDimStyle read Get_ActiveDimStyle write Set_ActiveDimStyle;
    property ActiveTextStyle: IAcadTextStyle read Get_ActiveTextStyle write Set_ActiveTextStyle;
    property ActiveUCS: IAcadUCS read Get_ActiveUCS write Set_ActiveUCS;
    property ActiveViewport: IAcadViewport read Get_ActiveViewport write Set_ActiveViewport;
    property ActivePViewport: IAcadPViewport read Get_ActivePViewport write Set_ActivePViewport;
    property ActiveSpace: AcActiveSpace read Get_ActiveSpace write Set_ActiveSpace;
    property SelectionSets: IAcadSelectionSets read Get_SelectionSets;
    property ActiveSelectionSet: IAcadSelectionSet read Get_ActiveSelectionSet;
    property FullName: WideString read Get_FullName;
    property Name: WideString read Get_Name;
    property Path: WideString read Get_Path;
    property ObjectSnapMode: WordBool read Get_ObjectSnapMode write Set_ObjectSnapMode;
    property ReadOnly: WordBool read Get_ReadOnly;
    property Saved: WordBool read Get_Saved;
    property MSpace: WordBool read Get_MSpace write Set_MSpace;
    property Utility: IAcadUtility read Get_Utility;
    property PickfirstSelectionSet: IAcadSelectionSet read Get_PickfirstSelectionSet;
    property Active: WordBool read Get_Active;
    property WindowState: AcWindowState read Get_WindowState write Set_WindowState;
    property Width: SYSINT read Get_Width write Set_Width;
    property Height: SYSINT read Get_Height write Set_Height;
    property ActiveLayout: IAcadLayout read Get_ActiveLayout write Set_ActiveLayout;
    property HWND: Integer read Get_HWND;
    property WindowTitle: WideString read Get_WindowTitle;
    property Application: IAcadApplication read Get_Application;
    property Database: IAcadDatabase read Get_Database;
  end;

// *********************************************************************//
// DispIntf:  IAcadDocumentDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8E75D912-3D21-11D2-85C4-080009A0C626}
// *********************************************************************//
  IAcadDocumentDisp = dispinterface
    ['{8E75D912-3D21-11D2-85C4-080009A0C626}']
    property Plot: IAcadPlot readonly dispid 23;
    property ActiveLayer: IAcadLayer dispid 24;
    property ActiveLinetype: IAcadLineType dispid 25;
    property ActiveDimStyle: IAcadDimStyle dispid 26;
    property ActiveTextStyle: IAcadTextStyle dispid 27;
    property ActiveUCS: IAcadUCS dispid 28;
    property ActiveViewport: IAcadViewport dispid 29;
    property ActivePViewport: IAcadPViewport dispid 30;
    property ActiveSpace: AcActiveSpace dispid 31;
    property SelectionSets: IAcadSelectionSets readonly dispid 32;
    property ActiveSelectionSet: IAcadSelectionSet readonly dispid 33;
    property FullName: WideString readonly dispid 34;
    property Name: WideString readonly dispid 35;
    property Path: WideString readonly dispid 36;
    property ObjectSnapMode: WordBool dispid 37;
    property ReadOnly: WordBool readonly dispid 38;
    property Saved: WordBool readonly dispid 39;
    property MSpace: WordBool dispid 40;
    property Utility: IAcadUtility readonly dispid 41;
    function  Open(const FullName: WideString): IAcadDocument; dispid 42;
    procedure AuditInfo(FixErr: WordBool); dispid 43;
    function  Import(const FileName: WideString; InsertionPoint: OleVariant; ScaleFactor: Double): IDispatch; dispid 44;
    procedure Export(const FileName: WideString; const Extension: WideString;
                     const SelectionSet: IAcadSelectionSet); dispid 45;
    function  New(const TemplateFileName: WideString): IAcadDocument; dispid 46;
    procedure Save; dispid 47;
    procedure SaveAs(const FullFileName: WideString; SaveAsType: OleVariant); dispid 48;
    procedure Wblock(const FileName: WideString; const SelectionSet: IAcadSelectionSet); dispid 49;
    procedure PurgeAll; dispid 50;
    function  GetVariable(const Name: WideString): OleVariant; dispid 51;
    procedure SetVariable(const Name: WideString; Value: OleVariant); dispid 52;
    procedure LoadShapeFile(const FullName: WideString); dispid 53;
    procedure Regen(WhichViewports: AcRegenType); dispid 54;
    property PickfirstSelectionSet: IAcadSelectionSet readonly dispid 55;
    property Active: WordBool readonly dispid 56;
    procedure Activate; dispid 57;
    procedure Close(SaveChanges: OleVariant; FileName: OleVariant); dispid 58;
    property WindowState: AcWindowState dispid 59;
    property Width: SYSINT dispid 60;
    property Height: SYSINT dispid 61;
    property ActiveLayout: IAcadLayout dispid 62;
    procedure SendCommand(const Command: WideString); dispid 63;
    property HWND: Integer readonly dispid 64;
    property WindowTitle: WideString readonly dispid 65;
    property Application: IAcadApplication readonly dispid 66;
    property Database: IAcadDatabase readonly dispid 67;
    procedure StartUndoMark; dispid 68;
    procedure EndUndoMark; dispid 69;
    property ModelSpace: IAcadModelSpace readonly dispid 1;
    property PaperSpace: IAcadPaperSpace readonly dispid 2;
    property Blocks: IAcadBlocks readonly dispid 3;
    function  CopyObjects(Objects: OleVariant; Owner: OleVariant; var IdPairs: OleVariant): OleVariant; dispid 4;
    property Groups: IAcadGroups readonly dispid 5;
    property DimStyles: IAcadDimStyles readonly dispid 6;
    property Layers: IAcadLayers readonly dispid 7;
    property Linetypes: IAcadLineTypes readonly dispid 8;
    property Dictionaries: IAcadDictionaries readonly dispid 9;
    property RegisteredApplications: IAcadRegisteredApplications readonly dispid 10;
    property TextStyles: IAcadTextStyles readonly dispid 11;
    property UserCoordinateSystems: IAcadUCSs readonly dispid 12;
    property Views: IAcadViews readonly dispid 13;
    property Viewports: IAcadViewports readonly dispid 14;
    property ElevationModelSpace: Double dispid 15;
    property ElevationPaperSpace: Double dispid 16;
    property Limits: OleVariant dispid 17;
    function  HandleToObject(const Handle: WideString): IDispatch; dispid 18;
    function  ObjectIdToObject(ObjectID: Integer): IDispatch; dispid 19;
    property Layouts: IAcadLayouts readonly dispid 20;
    property PlotConfigurations: IAcadPlotConfigurations readonly dispid 21;
    property Preferences: IAcadDatabasePreferences readonly dispid 22;
  end;

// *********************************************************************//
// Interface: IAcadPlot
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DC6D7A0-B8BA-11CF-A85E-0800091B9B14}
// *********************************************************************//
  IAcadPlot = interface(IDispatch)
    ['{4DC6D7A0-B8BA-11CF-A85E-0800091B9B14}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_QuietErrorMode: WordBool; safecall;
    procedure Set_QuietErrorMode(bErrorMode: WordBool); safecall;
    function  Get_NumberOfCopies: Integer; safecall;
    procedure Set_NumberOfCopies(numCopies: Integer); safecall;
    function  Get_BatchPlotProgress: WordBool; safecall;
    procedure Set_BatchPlotProgress(bProgressStatus: WordBool); safecall;
    procedure DisplayPlotPreview(Preview: AcPreviewMode); safecall;
    function  PlotToFile(const plotFile: WideString; plotConfig: OleVariant): WordBool; safecall;
    function  PlotToDevice(plotConfig: OleVariant): WordBool; safecall;
    procedure SetLayoutsToPlot(layoutList: OleVariant); safecall;
    procedure StartBatchMode(entryCount: Integer); safecall;
    property Application: IAcadApplication read Get_Application;
    property QuietErrorMode: WordBool read Get_QuietErrorMode;
    property NumberOfCopies: Integer read Get_NumberOfCopies;
    property BatchPlotProgress: WordBool read Get_BatchPlotProgress;
  end;

// *********************************************************************//
// DispIntf:  IAcadPlotDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {4DC6D7A0-B8BA-11CF-A85E-0800091B9B14}
// *********************************************************************//
  IAcadPlotDisp = dispinterface
    ['{4DC6D7A0-B8BA-11CF-A85E-0800091B9B14}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property QuietErrorMode: WordBool readonly dispid 1610743809;
    property NumberOfCopies: Integer readonly dispid 1610743811;
    property BatchPlotProgress: WordBool readonly dispid 1610743813;
    procedure DisplayPlotPreview(Preview: AcPreviewMode); dispid 1610743815;
    function  PlotToFile(const plotFile: WideString; plotConfig: OleVariant): WordBool; dispid 1610743816;
    function  PlotToDevice(plotConfig: OleVariant): WordBool; dispid 1610743817;
    procedure SetLayoutsToPlot(layoutList: OleVariant); dispid 1610743818;
    procedure StartBatchMode(entryCount: Integer); dispid 1610743819;
  end;

// *********************************************************************//
// Interface: IAcadApplication
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8E75D910-3D21-11D2-85C4-080009A0C626}
// *********************************************************************//
  IAcadApplication = interface(IDispatch)
    ['{8E75D910-3D21-11D2-85C4-080009A0C626}']
    function  Get_Visible: WordBool; safecall;
    procedure Set_Visible(Visible: WordBool); safecall;
    function  Get_Name: WideString; safecall;
    function  Get_Caption: WideString; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_ActiveDocument: IAcadDocument; safecall;
    procedure Set_ActiveDocument(const pActiveDoc: IAcadDocument); safecall;
    function  Get_FullName: WideString; safecall;
    function  Get_Height: SYSINT; safecall;
    procedure Set_Height(Height: SYSINT); safecall;
    function  Get_WindowLeft: SYSINT; safecall;
    procedure Set_WindowLeft(left: SYSINT); safecall;
    function  Get_Path: WideString; safecall;
    function  Get_LocaleId: Integer; safecall;
    function  Get_WindowTop: SYSINT; safecall;
    procedure Set_WindowTop(top: SYSINT); safecall;
    function  Get_Version: WideString; safecall;
    function  Get_Width: SYSINT; safecall;
    procedure Set_Width(Width: SYSINT); safecall;
    function  Get_Preferences: IAcadPreferences; safecall;
    function  Get_StatusId(const VportObj: IDispatch): WordBool; safecall;
    function  ListArx: OleVariant; safecall;
    procedure LoadArx(const Name: WideString); safecall;
    function  GetInterfaceObject(const ProgID: WideString): IDispatch; safecall;
    procedure UnloadArx(const Name: WideString); safecall;
    procedure Update; safecall;
    procedure Quit; safecall;
    procedure Zoom(Type_: SYSINT; var vParams: OleVariant); safecall;
    function  Get_VBE: IDispatch; safecall;
    function  Get_MenuGroups: IAcadMenuGroups; safecall;
    function  Get_MenuBar: IAcadMenuBar; safecall;
    procedure LoadDVB(const Name: WideString); safecall;
    procedure UnloadDVB(const Name: WideString); safecall;
    function  Get_Documents: IAcadDocuments; safecall;
    procedure Eval(const Expression: WideString); safecall;
    function  Get_WindowState: AcWindowState; safecall;
    procedure Set_WindowState(eWinState: AcWindowState); safecall;
    procedure RunMacro(const MacroPath: WideString); safecall;
    procedure ZoomExtents; safecall;
    procedure ZoomAll; safecall;
    procedure ZoomCenter(Center: OleVariant; Magnify: Double); safecall;
    procedure ZoomScaled(scale: Double; ScaleType: AcZoomScaleType); safecall;
    procedure ZoomWindow(LowerLeft: OleVariant; UpperRight: OleVariant); safecall;
    procedure ZoomPickWindow; safecall;
    function  GetAcadState: IAcadState; safecall;
    procedure ZoomPrevious; safecall;
    property Visible: WordBool read Get_Visible write Set_Visible;
    property Name: WideString read Get_Name;
    property Caption: WideString read Get_Caption;
    property Application: IAcadApplication read Get_Application;
    property ActiveDocument: IAcadDocument read Get_ActiveDocument write Set_ActiveDocument;
    property FullName: WideString read Get_FullName;
    property Height: SYSINT read Get_Height write Set_Height;
    property WindowLeft: SYSINT read Get_WindowLeft write Set_WindowLeft;
    property Path: WideString read Get_Path;
    property LocaleId: Integer read Get_LocaleId;
    property WindowTop: SYSINT read Get_WindowTop write Set_WindowTop;
    property Version: WideString read Get_Version;
    property Width: SYSINT read Get_Width write Set_Width;
    property Preferences: IAcadPreferences read Get_Preferences;
    property StatusId[const VportObj: IDispatch]: WordBool read Get_StatusId;
    property VBE: IDispatch read Get_VBE;
    property MenuGroups: IAcadMenuGroups read Get_MenuGroups;
    property MenuBar: IAcadMenuBar read Get_MenuBar;
    property Documents: IAcadDocuments read Get_Documents;
    property WindowState: AcWindowState read Get_WindowState write Set_WindowState;
  end;

// *********************************************************************//
// DispIntf:  IAcadApplicationDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {8E75D910-3D21-11D2-85C4-080009A0C626}
// *********************************************************************//
  IAcadApplicationDisp = dispinterface
    ['{8E75D910-3D21-11D2-85C4-080009A0C626}']
    property Visible: WordBool dispid 1;
    property Name: WideString readonly dispid 2;
    property Caption: WideString readonly dispid 3;
    property Application: IAcadApplication readonly dispid 4;
    property ActiveDocument: IAcadDocument dispid 5;
    property FullName: WideString readonly dispid 6;
    property Height: SYSINT dispid 7;
    property WindowLeft: SYSINT dispid 8;
    property Path: WideString readonly dispid 9;
    property LocaleId: Integer readonly dispid 10;
    property WindowTop: SYSINT dispid 11;
    property Version: WideString readonly dispid 12;
    property Width: SYSINT dispid 13;
    property Preferences: IAcadPreferences readonly dispid 14;
    property StatusId[const VportObj: IDispatch]: WordBool readonly dispid 17;
    function  ListArx: OleVariant; dispid 18;
    procedure LoadArx(const Name: WideString); dispid 19;
    function  GetInterfaceObject(const ProgID: WideString): IDispatch; dispid 20;
    procedure UnloadArx(const Name: WideString); dispid 23;
    procedure Update; dispid 24;
    procedure Quit; dispid 25;
    procedure Zoom(Type_: SYSINT; var vParams: OleVariant); dispid 26;
    property VBE: IDispatch readonly dispid 27;
    property MenuGroups: IAcadMenuGroups readonly dispid 28;
    property MenuBar: IAcadMenuBar readonly dispid 29;
    procedure LoadDVB(const Name: WideString); dispid 30;
    procedure UnloadDVB(const Name: WideString); dispid 31;
    property Documents: IAcadDocuments readonly dispid 32;
    procedure Eval(const Expression: WideString); dispid 33;
    property WindowState: AcWindowState dispid 34;
    procedure RunMacro(const MacroPath: WideString); dispid 35;
    procedure ZoomExtents; dispid 36;
    procedure ZoomAll; dispid 37;
    procedure ZoomCenter(Center: OleVariant; Magnify: Double); dispid 38;
    procedure ZoomScaled(scale: Double; ScaleType: AcZoomScaleType); dispid 39;
    procedure ZoomWindow(LowerLeft: OleVariant; UpperRight: OleVariant); dispid 40;
    procedure ZoomPickWindow; dispid 41;
    function  GetAcadState: IAcadState; dispid 42;
    procedure ZoomPrevious; dispid 43;
  end;

// *********************************************************************//
// Interface: IAcadPreferences
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {24B8A4E0-432A-11D0-A893-0800091B9B14}
// *********************************************************************//
  IAcadPreferences = interface(IDispatch)
    ['{24B8A4E0-432A-11D0-A893-0800091B9B14}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Files: IAcadPreferencesFiles; safecall;
    function  Get_Display: IAcadPreferencesDisplay; safecall;
    function  Get_OpenSave: IAcadPreferencesOpenSave; safecall;
    function  Get_Output: IAcadPreferencesOutput; safecall;
    function  Get_System_: IAcadPreferencesSystem; safecall;
    function  Get_User: IAcadPreferencesUser; safecall;
    function  Get_Drafting: IAcadPreferencesDrafting; safecall;
    function  Get_Selection: IAcadPreferencesSelection; safecall;
    function  Get_Profiles: IAcadPreferencesProfiles; safecall;
    property Application: IAcadApplication read Get_Application;
    property Files: IAcadPreferencesFiles read Get_Files;
    property Display: IAcadPreferencesDisplay read Get_Display;
    property OpenSave: IAcadPreferencesOpenSave read Get_OpenSave;
    property Output: IAcadPreferencesOutput read Get_Output;
    property System_: IAcadPreferencesSystem read Get_System_;
    property User: IAcadPreferencesUser read Get_User;
    property Drafting: IAcadPreferencesDrafting read Get_Drafting;
    property Selection: IAcadPreferencesSelection read Get_Selection;
    property Profiles: IAcadPreferencesProfiles read Get_Profiles;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {24B8A4E0-432A-11D0-A893-0800091B9B14}
// *********************************************************************//
  IAcadPreferencesDisp = dispinterface
    ['{24B8A4E0-432A-11D0-A893-0800091B9B14}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property Files: IAcadPreferencesFiles readonly dispid 1610743809;
    property Display: IAcadPreferencesDisplay readonly dispid 1610743810;
    property OpenSave: IAcadPreferencesOpenSave readonly dispid 1610743811;
    property Output: IAcadPreferencesOutput readonly dispid 1610743812;
    property System_: IAcadPreferencesSystem readonly dispid 1610743813;
    property User: IAcadPreferencesUser readonly dispid 1610743814;
    property Drafting: IAcadPreferencesDrafting readonly dispid 1610743815;
    property Selection: IAcadPreferencesSelection readonly dispid 1610743816;
    property Profiles: IAcadPreferencesProfiles readonly dispid 1610743817;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesFiles
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A58-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesFiles = interface(IDispatch)
    ['{83304A58-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_SupportPath(const orient: WideString); safecall;
    function  Get_SupportPath: WideString; safecall;
    procedure Set_DriversPath(const Path: WideString); safecall;
    function  Get_DriversPath: WideString; safecall;
    procedure Set_MenuFile(const Path: WideString); safecall;
    function  Get_MenuFile: WideString; safecall;
    procedure Set_HelpFilePath(const Path: WideString); safecall;
    function  Get_HelpFilePath: WideString; safecall;
    procedure Set_DefaultInternetURL(const Path: WideString); safecall;
    function  Get_DefaultInternetURL: WideString; safecall;
    function  Get_ConfigFile: WideString; safecall;
    function  Get_LicenseServer: WideString; safecall;
    procedure Set_TextEditor(const Path: WideString); safecall;
    function  Get_TextEditor: WideString; safecall;
    procedure Set_MainDictionary(const Path: WideString); safecall;
    function  Get_MainDictionary: WideString; safecall;
    procedure Set_CustomDictionary(const Path: WideString); safecall;
    function  Get_CustomDictionary: WideString; safecall;
    procedure Set_AltFontFile(const fontFile: WideString); safecall;
    function  Get_AltFontFile: WideString; safecall;
    procedure Set_FontFileMap(const Path: WideString); safecall;
    function  Get_FontFileMap: WideString; safecall;
    procedure Set_PrintFile(const Path: WideString); safecall;
    function  Get_PrintFile: WideString; safecall;
    procedure Set_PrintSpoolExecutable(const Path: WideString); safecall;
    function  Get_PrintSpoolExecutable: WideString; safecall;
    procedure Set_PostScriptPrologFile(const Path: WideString); safecall;
    function  Get_PostScriptPrologFile: WideString; safecall;
    procedure Set_PrintSpoolerPath(const Path: WideString); safecall;
    function  Get_PrintSpoolerPath: WideString; safecall;
    procedure Set_AutoSavePath(const AutoSavePath: WideString); safecall;
    function  Get_AutoSavePath: WideString; safecall;
    procedure Set_TemplateDwgPath(const Path: WideString); safecall;
    function  Get_TemplateDwgPath: WideString; safecall;
    procedure Set_LogFilePath(const Path: WideString); safecall;
    function  Get_LogFilePath: WideString; safecall;
    procedure Set_TempFilePath(const Path: WideString); safecall;
    function  Get_TempFilePath: WideString; safecall;
    procedure Set_TempXrefPath(const Path: WideString); safecall;
    function  Get_TempXrefPath: WideString; safecall;
    procedure Set_TextureMapPath(const Path: WideString); safecall;
    function  Get_TextureMapPath: WideString; safecall;
    procedure Set_AltTabletMenuFile(const MenuFile: WideString); safecall;
    function  Get_AltTabletMenuFile: WideString; safecall;
    procedure SetProjectFilePath(const ProjectName: WideString; const ProjectFilePath: WideString); safecall;
    function  GetProjectFilePath(const ProjectName: WideString): WideString; safecall;
    procedure Set_PrinterConfigPath(const Path: WideString); safecall;
    function  Get_PrinterConfigPath: WideString; safecall;
    procedure Set_PrinterDescPath(const Path: WideString); safecall;
    function  Get_PrinterDescPath: WideString; safecall;
    procedure Set_PrinterStyleSheetPath(const Path: WideString); safecall;
    function  Get_PrinterStyleSheetPath: WideString; safecall;
    procedure Set_WorkspacePath(const Path: WideString); safecall;
    function  Get_WorkspacePath: WideString; safecall;
    procedure Set_ObjectARXPath(const Path: WideString); safecall;
    function  Get_ObjectARXPath: WideString; safecall;
    property Application: IAcadApplication read Get_Application;
    property SupportPath: WideString read Get_SupportPath write Set_SupportPath;
    property DriversPath: WideString write Set_DriversPath;
    property MenuFile: WideString write Set_MenuFile;
    property HelpFilePath: WideString write Set_HelpFilePath;
    property DefaultInternetURL: WideString write Set_DefaultInternetURL;
    property ConfigFile: WideString read Get_ConfigFile;
    property LicenseServer: WideString read Get_LicenseServer;
    property TextEditor: WideString write Set_TextEditor;
    property MainDictionary: WideString write Set_MainDictionary;
    property CustomDictionary: WideString write Set_CustomDictionary;
    property AltFontFile: WideString write Set_AltFontFile;
    property FontFileMap: WideString write Set_FontFileMap;
    property PrintFile: WideString write Set_PrintFile;
    property PrintSpoolExecutable: WideString write Set_PrintSpoolExecutable;
    property PostScriptPrologFile: WideString write Set_PostScriptPrologFile;
    property PrintSpoolerPath: WideString write Set_PrintSpoolerPath;
    property AutoSavePath: WideString write Set_AutoSavePath;
    property TemplateDwgPath: WideString write Set_TemplateDwgPath;
    property LogFilePath: WideString write Set_LogFilePath;
    property TempFilePath: WideString write Set_TempFilePath;
    property TempXrefPath: WideString write Set_TempXrefPath;
    property TextureMapPath: WideString write Set_TextureMapPath;
    property AltTabletMenuFile: WideString write Set_AltTabletMenuFile;
    property PrinterConfigPath: WideString write Set_PrinterConfigPath;
    property PrinterDescPath: WideString write Set_PrinterDescPath;
    property PrinterStyleSheetPath: WideString write Set_PrinterStyleSheetPath;
    property WorkspacePath: WideString write Set_WorkspacePath;
    property ObjectARXPath: WideString write Set_ObjectARXPath;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesFilesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A58-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesFilesDisp = dispinterface
    ['{83304A58-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property SupportPath: WideString dispid 0;
    property DriversPath: WideString writeonly dispid 1610743811;
    property MenuFile: WideString writeonly dispid 1610743813;
    property HelpFilePath: WideString writeonly dispid 1610743815;
    property DefaultInternetURL: WideString writeonly dispid 1610743817;
    property ConfigFile: WideString readonly dispid 1610743819;
    property LicenseServer: WideString readonly dispid 1610743820;
    property TextEditor: WideString writeonly dispid 1610743821;
    property MainDictionary: WideString writeonly dispid 1610743823;
    property CustomDictionary: WideString writeonly dispid 1610743825;
    property AltFontFile: WideString writeonly dispid 1610743827;
    property FontFileMap: WideString writeonly dispid 1610743829;
    property PrintFile: WideString writeonly dispid 1610743831;
    property PrintSpoolExecutable: WideString writeonly dispid 1610743833;
    property PostScriptPrologFile: WideString writeonly dispid 1610743835;
    property PrintSpoolerPath: WideString writeonly dispid 1610743837;
    property AutoSavePath: WideString writeonly dispid 1610743839;
    property TemplateDwgPath: WideString writeonly dispid 1610743841;
    property LogFilePath: WideString writeonly dispid 1610743843;
    property TempFilePath: WideString writeonly dispid 1610743845;
    property TempXrefPath: WideString writeonly dispid 1610743847;
    property TextureMapPath: WideString writeonly dispid 1610743849;
    property AltTabletMenuFile: WideString writeonly dispid 1610743851;
    procedure SetProjectFilePath(const ProjectName: WideString; const ProjectFilePath: WideString); dispid 1610743853;
    function  GetProjectFilePath(const ProjectName: WideString): WideString; dispid 1610743854;
    property PrinterConfigPath: WideString writeonly dispid 1610743855;
    property PrinterDescPath: WideString writeonly dispid 1610743857;
    property PrinterStyleSheetPath: WideString writeonly dispid 1610743859;
    property WorkspacePath: WideString writeonly dispid 1610743861;
    property ObjectARXPath: WideString writeonly dispid 1610743863;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesDisplay
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A59-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesDisplay = interface(IDispatch)
    ['{83304A59-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_LayoutDisplayMargins(Path: WordBool); safecall;
    function  Get_LayoutDisplayMargins: WordBool; safecall;
    procedure Set_LayoutDisplayPaper(Path: WordBool); safecall;
    function  Get_LayoutDisplayPaper: WordBool; safecall;
    procedure Set_LayoutDisplayPaperShadow(Path: WordBool); safecall;
    function  Get_LayoutDisplayPaperShadow: WordBool; safecall;
    procedure Set_LayoutShowPlotSetup(Path: WordBool); safecall;
    function  Get_LayoutShowPlotSetup: WordBool; safecall;
    procedure Set_LayoutCreateViewport(Path: WordBool); safecall;
    function  Get_LayoutCreateViewport: WordBool; safecall;
    procedure Set_DisplayScrollBars(Path: WordBool); safecall;
    function  Get_DisplayScrollBars: WordBool; safecall;
    procedure Set_DisplayScreenMenu(Path: WordBool); safecall;
    function  Get_DisplayScreenMenu: WordBool; safecall;
    procedure Set_CursorSize(Path: SYSINT); safecall;
    function  Get_CursorSize: SYSINT; safecall;
    procedure Set_DockedVisibleLines(Path: SYSINT); safecall;
    function  Get_DockedVisibleLines: SYSINT; safecall;
    procedure Set_ShowRasterImage(Path: WordBool); safecall;
    function  Get_ShowRasterImage: WordBool; safecall;
    procedure Set_GraphicsWinModelBackgrndColor(Color: OLE_COLOR); safecall;
    function  Get_GraphicsWinModelBackgrndColor: OLE_COLOR; safecall;
    procedure Set_ModelCrosshairColor(crossHairColor: OLE_COLOR); safecall;
    function  Get_ModelCrosshairColor: OLE_COLOR; safecall;
    procedure Set_GraphicsWinLayoutBackgrndColor(Color: OLE_COLOR); safecall;
    function  Get_GraphicsWinLayoutBackgrndColor: OLE_COLOR; safecall;
    procedure Set_TextWinBackgrndColor(Path: OLE_COLOR); safecall;
    function  Get_TextWinBackgrndColor: OLE_COLOR; safecall;
    procedure Set_TextWinTextColor(Path: OLE_COLOR); safecall;
    function  Get_TextWinTextColor: OLE_COLOR; safecall;
    procedure Set_LayoutCrosshairColor(crossHairColor: OLE_COLOR); safecall;
    function  Get_LayoutCrosshairColor: OLE_COLOR; safecall;
    procedure Set_AutoTrackingVecColor(AutoTrackingVecColor: OLE_COLOR); safecall;
    function  Get_AutoTrackingVecColor: OLE_COLOR; safecall;
    procedure Set_TextFont(const Path: WideString); safecall;
    function  Get_TextFont: WideString; safecall;
    procedure Set_TextFontStyle(Path: AcTextFontStyle); safecall;
    function  Get_TextFontStyle: AcTextFontStyle; safecall;
    procedure Set_TextFontSize(Path: SYSINT); safecall;
    function  Get_TextFontSize: SYSINT; safecall;
    procedure Set_HistoryLines(Path: SYSINT); safecall;
    function  Get_HistoryLines: SYSINT; safecall;
    procedure Set_MaxAutoCADWindow(Path: WordBool); safecall;
    function  Get_MaxAutoCADWindow: WordBool; safecall;
    procedure Set_DisplayLayoutTabs(Path: WordBool); safecall;
    function  Get_DisplayLayoutTabs: WordBool; safecall;
    procedure Set_ImageFrameHighlight(Path: WordBool); safecall;
    function  Get_ImageFrameHighlight: WordBool; safecall;
    procedure Set_TrueColorImages(Path: WordBool); safecall;
    function  Get_TrueColorImages: WordBool; safecall;
    procedure Set_XRefFadeIntensity(Path: Integer); safecall;
    function  Get_XRefFadeIntensity: Integer; safecall;
    property Application: IAcadApplication read Get_Application;
    property LayoutDisplayMargins: WordBool write Set_LayoutDisplayMargins;
    property LayoutDisplayPaper: WordBool write Set_LayoutDisplayPaper;
    property LayoutDisplayPaperShadow: WordBool write Set_LayoutDisplayPaperShadow;
    property LayoutShowPlotSetup: WordBool write Set_LayoutShowPlotSetup;
    property LayoutCreateViewport: WordBool write Set_LayoutCreateViewport;
    property DisplayScrollBars: WordBool write Set_DisplayScrollBars;
    property DisplayScreenMenu: WordBool write Set_DisplayScreenMenu;
    property CursorSize: SYSINT write Set_CursorSize;
    property DockedVisibleLines: SYSINT write Set_DockedVisibleLines;
    property ShowRasterImage: WordBool write Set_ShowRasterImage;
    property GraphicsWinModelBackgrndColor: OLE_COLOR write Set_GraphicsWinModelBackgrndColor;
    property ModelCrosshairColor: OLE_COLOR write Set_ModelCrosshairColor;
    property GraphicsWinLayoutBackgrndColor: OLE_COLOR write Set_GraphicsWinLayoutBackgrndColor;
    property TextWinBackgrndColor: OLE_COLOR write Set_TextWinBackgrndColor;
    property TextWinTextColor: OLE_COLOR write Set_TextWinTextColor;
    property LayoutCrosshairColor: OLE_COLOR write Set_LayoutCrosshairColor;
    property AutoTrackingVecColor: OLE_COLOR write Set_AutoTrackingVecColor;
    property TextFont: WideString write Set_TextFont;
    property TextFontStyle: AcTextFontStyle write Set_TextFontStyle;
    property TextFontSize: SYSINT write Set_TextFontSize;
    property HistoryLines: SYSINT write Set_HistoryLines;
    property MaxAutoCADWindow: WordBool write Set_MaxAutoCADWindow;
    property DisplayLayoutTabs: WordBool write Set_DisplayLayoutTabs;
    property ImageFrameHighlight: WordBool write Set_ImageFrameHighlight;
    property TrueColorImages: WordBool write Set_TrueColorImages;
    property XRefFadeIntensity: Integer write Set_XRefFadeIntensity;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesDisplayDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A59-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesDisplayDisp = dispinterface
    ['{83304A59-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property LayoutDisplayMargins: WordBool writeonly dispid 1610743809;
    property LayoutDisplayPaper: WordBool writeonly dispid 1610743811;
    property LayoutDisplayPaperShadow: WordBool writeonly dispid 1610743813;
    property LayoutShowPlotSetup: WordBool writeonly dispid 1610743815;
    property LayoutCreateViewport: WordBool writeonly dispid 1610743817;
    property DisplayScrollBars: WordBool writeonly dispid 1610743819;
    property DisplayScreenMenu: WordBool writeonly dispid 1610743821;
    property CursorSize: SYSINT writeonly dispid 1610743823;
    property DockedVisibleLines: SYSINT writeonly dispid 1610743825;
    property ShowRasterImage: WordBool writeonly dispid 1610743827;
    property GraphicsWinModelBackgrndColor: OLE_COLOR writeonly dispid 1610743829;
    property ModelCrosshairColor: OLE_COLOR writeonly dispid 1610743831;
    property GraphicsWinLayoutBackgrndColor: OLE_COLOR writeonly dispid 1610743833;
    property TextWinBackgrndColor: OLE_COLOR writeonly dispid 1610743835;
    property TextWinTextColor: OLE_COLOR writeonly dispid 1610743837;
    property LayoutCrosshairColor: OLE_COLOR writeonly dispid 1610743839;
    property AutoTrackingVecColor: OLE_COLOR writeonly dispid 1610743841;
    property TextFont: WideString writeonly dispid 1610743843;
    property TextFontStyle: AcTextFontStyle writeonly dispid 1610743845;
    property TextFontSize: SYSINT writeonly dispid 1610743847;
    property HistoryLines: SYSINT writeonly dispid 1610743849;
    property MaxAutoCADWindow: WordBool writeonly dispid 1610743851;
    property DisplayLayoutTabs: WordBool writeonly dispid 1610743853;
    property ImageFrameHighlight: WordBool writeonly dispid 1610743855;
    property TrueColorImages: WordBool writeonly dispid 1610743857;
    property XRefFadeIntensity: Integer writeonly dispid 1610743859;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesOpenSave
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5A-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesOpenSave = interface(IDispatch)
    ['{83304A5A-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_SavePreviewThumbnail(Path: WordBool); safecall;
    function  Get_SavePreviewThumbnail: WordBool; safecall;
    procedure Set_IncrementalSavePercent(Path: SYSINT); safecall;
    function  Get_IncrementalSavePercent: SYSINT; safecall;
    procedure Set_AutoSaveInterval(Path: SYSINT); safecall;
    function  Get_AutoSaveInterval: SYSINT; safecall;
    procedure Set_CreateBackup(CreateBackup: WordBool); safecall;
    function  Get_CreateBackup: WordBool; safecall;
    procedure Set_FullCRCValidation(Path: WordBool); safecall;
    function  Get_FullCRCValidation: WordBool; safecall;
    procedure Set_LogFileOn(Path: WordBool); safecall;
    function  Get_LogFileOn: WordBool; safecall;
    procedure Set_TempFileExtension(const Path: WideString); safecall;
    function  Get_TempFileExtension: WideString; safecall;
    procedure Set_XrefDemandLoad(Path: AcXRefDemandLoad); safecall;
    function  Get_XrefDemandLoad: AcXRefDemandLoad; safecall;
    procedure Set_DemandLoadARXApp(Path: AcARXDemandLoad); safecall;
    function  Get_DemandLoadARXApp: AcARXDemandLoad; safecall;
    procedure Set_ProxyImage(Path: AcProxyImage); safecall;
    function  Get_ProxyImage: AcProxyImage; safecall;
    procedure Set_ShowProxyDialogBox(Path: WordBool); safecall;
    function  Get_ShowProxyDialogBox: WordBool; safecall;
    procedure Set_AutoAudit(bAudit: WordBool); safecall;
    function  Get_AutoAudit: WordBool; safecall;
    procedure Set_SaveAsType(Path: AcSaveAsType); safecall;
    function  Get_SaveAsType: AcSaveAsType; safecall;
    function  Get_MRUNumber: Integer; safecall;
    property Application: IAcadApplication read Get_Application;
    property SavePreviewThumbnail: WordBool write Set_SavePreviewThumbnail;
    property IncrementalSavePercent: SYSINT write Set_IncrementalSavePercent;
    property AutoSaveInterval: SYSINT write Set_AutoSaveInterval;
    property CreateBackup: WordBool write Set_CreateBackup;
    property FullCRCValidation: WordBool write Set_FullCRCValidation;
    property LogFileOn: WordBool write Set_LogFileOn;
    property TempFileExtension: WideString write Set_TempFileExtension;
    property XrefDemandLoad: AcXRefDemandLoad write Set_XrefDemandLoad;
    property DemandLoadARXApp: AcARXDemandLoad write Set_DemandLoadARXApp;
    property ProxyImage: AcProxyImage write Set_ProxyImage;
    property ShowProxyDialogBox: WordBool write Set_ShowProxyDialogBox;
    property AutoAudit: WordBool write Set_AutoAudit;
    property SaveAsType: AcSaveAsType write Set_SaveAsType;
    property MRUNumber: Integer read Get_MRUNumber;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesOpenSaveDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5A-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesOpenSaveDisp = dispinterface
    ['{83304A5A-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property SavePreviewThumbnail: WordBool writeonly dispid 1610743809;
    property IncrementalSavePercent: SYSINT writeonly dispid 1610743811;
    property AutoSaveInterval: SYSINT writeonly dispid 1610743813;
    property CreateBackup: WordBool writeonly dispid 1610743815;
    property FullCRCValidation: WordBool writeonly dispid 1610743817;
    property LogFileOn: WordBool writeonly dispid 1610743819;
    property TempFileExtension: WideString writeonly dispid 1610743821;
    property XrefDemandLoad: AcXRefDemandLoad writeonly dispid 1610743823;
    property DemandLoadARXApp: AcARXDemandLoad writeonly dispid 1610743825;
    property ProxyImage: AcProxyImage writeonly dispid 1610743827;
    property ShowProxyDialogBox: WordBool writeonly dispid 1610743829;
    property AutoAudit: WordBool writeonly dispid 1610743831;
    property SaveAsType: AcSaveAsType writeonly dispid 1610743833;
    property MRUNumber: Integer readonly dispid 1610743835;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesOutput
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5E-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesOutput = interface(IDispatch)
    ['{83304A5E-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_DefaultOutputDevice(const Path: WideString); safecall;
    function  Get_DefaultOutputDevice: WideString; safecall;
    procedure Set_PrinterSpoolAlert(Path: AcPrinterSpoolAlert); safecall;
    function  Get_PrinterSpoolAlert: AcPrinterSpoolAlert; safecall;
    procedure Set_PrinterPaperSizeAlert(Path: WordBool); safecall;
    function  Get_PrinterPaperSizeAlert: WordBool; safecall;
    procedure Set_PlotLegacy(Path: WordBool); safecall;
    function  Get_PlotLegacy: WordBool; safecall;
    procedure Set_OLEQuality(Path: AcOleQuality); safecall;
    function  Get_OLEQuality: AcOleQuality; safecall;
    procedure Set_UseLastPlotSettings(Path: WordBool); safecall;
    function  Get_UseLastPlotSettings: WordBool; safecall;
    procedure Set_PlotPolicy(Path: AcPlotPolicy); safecall;
    function  Get_PlotPolicy: AcPlotPolicy; safecall;
    procedure Set_DefaultPlotStyleTable(const Path: WideString); safecall;
    function  Get_DefaultPlotStyleTable: WideString; safecall;
    procedure Set_DefaultPlotStyleForObjects(const Path: WideString); safecall;
    function  Get_DefaultPlotStyleForObjects: WideString; safecall;
    procedure Set_DefaultPlotStyleForLayer(const Path: WideString); safecall;
    function  Get_DefaultPlotStyleForLayer: WideString; safecall;
    property Application: IAcadApplication read Get_Application;
    property DefaultOutputDevice: WideString write Set_DefaultOutputDevice;
    property PrinterSpoolAlert: AcPrinterSpoolAlert write Set_PrinterSpoolAlert;
    property PrinterPaperSizeAlert: WordBool write Set_PrinterPaperSizeAlert;
    property PlotLegacy: WordBool write Set_PlotLegacy;
    property OLEQuality: AcOleQuality write Set_OLEQuality;
    property UseLastPlotSettings: WordBool write Set_UseLastPlotSettings;
    property PlotPolicy: AcPlotPolicy write Set_PlotPolicy;
    property DefaultPlotStyleTable: WideString write Set_DefaultPlotStyleTable;
    property DefaultPlotStyleForObjects: WideString write Set_DefaultPlotStyleForObjects;
    property DefaultPlotStyleForLayer: WideString write Set_DefaultPlotStyleForLayer;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesOutputDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5E-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesOutputDisp = dispinterface
    ['{83304A5E-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property DefaultOutputDevice: WideString writeonly dispid 1610743809;
    property PrinterSpoolAlert: AcPrinterSpoolAlert writeonly dispid 1610743811;
    property PrinterPaperSizeAlert: WordBool writeonly dispid 1610743813;
    property PlotLegacy: WordBool writeonly dispid 1610743815;
    property OLEQuality: AcOleQuality writeonly dispid 1610743817;
    property UseLastPlotSettings: WordBool writeonly dispid 1610743819;
    property PlotPolicy: AcPlotPolicy writeonly dispid 1610743821;
    property DefaultPlotStyleTable: WideString writeonly dispid 1610743823;
    property DefaultPlotStyleForObjects: WideString writeonly dispid 1610743825;
    property DefaultPlotStyleForLayer: WideString writeonly dispid 1610743827;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesSystem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A60-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesSystem = interface(IDispatch)
    ['{83304A60-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_SingleDocumentMode(Path: WordBool); safecall;
    function  Get_SingleDocumentMode: WordBool; safecall;
    procedure Set_DisplayOLEScale(Path: WordBool); safecall;
    function  Get_DisplayOLEScale: WordBool; safecall;
    procedure Set_StoreSQLIndex(Path: WordBool); safecall;
    function  Get_StoreSQLIndex: WordBool; safecall;
    procedure Set_TablesReadOnly(Path: WordBool); safecall;
    function  Get_TablesReadOnly: WordBool; safecall;
    procedure Set_EnableStartupDialog(Path: WordBool); safecall;
    function  Get_EnableStartupDialog: WordBool; safecall;
    procedure Set_BeepOnError(BeepOnError: WordBool); safecall;
    function  Get_BeepOnError: WordBool; safecall;
    procedure Set_ShowWarningMessages(Path: WordBool); safecall;
    function  Get_ShowWarningMessages: WordBool; safecall;
    procedure Set_LoadAcadLspInAllDocuments(pALID: WordBool); safecall;
    function  Get_LoadAcadLspInAllDocuments: WordBool; safecall;
    property Application: IAcadApplication read Get_Application;
    property SingleDocumentMode: WordBool write Set_SingleDocumentMode;
    property DisplayOLEScale: WordBool write Set_DisplayOLEScale;
    property StoreSQLIndex: WordBool write Set_StoreSQLIndex;
    property TablesReadOnly: WordBool write Set_TablesReadOnly;
    property EnableStartupDialog: WordBool write Set_EnableStartupDialog;
    property BeepOnError: WordBool write Set_BeepOnError;
    property ShowWarningMessages: WordBool write Set_ShowWarningMessages;
    property LoadAcadLspInAllDocuments: WordBool write Set_LoadAcadLspInAllDocuments;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesSystemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A60-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesSystemDisp = dispinterface
    ['{83304A60-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property SingleDocumentMode: WordBool writeonly dispid 1610743809;
    property DisplayOLEScale: WordBool writeonly dispid 1610743811;
    property StoreSQLIndex: WordBool writeonly dispid 1610743813;
    property TablesReadOnly: WordBool writeonly dispid 1610743815;
    property EnableStartupDialog: WordBool writeonly dispid 1610743817;
    property BeepOnError: WordBool writeonly dispid 1610743819;
    property ShowWarningMessages: WordBool writeonly dispid 1610743821;
    property LoadAcadLspInAllDocuments: WordBool writeonly dispid 1610743823;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesUser
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5B-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesUser = interface(IDispatch)
    ['{83304A5B-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_KeyboardAccelerator(Path: AcKeyboardAccelerator); safecall;
    function  Get_KeyboardAccelerator: AcKeyboardAccelerator; safecall;
    procedure Set_KeyboardPriority(Path: AcKeyboardPriority); safecall;
    function  Get_KeyboardPriority: AcKeyboardPriority; safecall;
    procedure Set_HyperlinkDisplayCursor(Path: WordBool); safecall;
    function  Get_HyperlinkDisplayCursor: WordBool; safecall;
    procedure Set_HyperlinkDisplayTooltip(Path: WordBool); safecall;
    function  Get_HyperlinkDisplayTooltip: WordBool; safecall;
    procedure Set_ADCInsertUnitsDefaultSource(pIU: AcInsertUnits); safecall;
    function  Get_ADCInsertUnitsDefaultSource: AcInsertUnits; safecall;
    procedure Set_ADCInsertUnitsDefaultTarget(pSUunits: AcInsertUnits); safecall;
    function  Get_ADCInsertUnitsDefaultTarget: AcInsertUnits; safecall;
    procedure Set_ShortCutMenuDisplay(pSCM: WordBool); safecall;
    function  Get_ShortCutMenuDisplay: WordBool; safecall;
    procedure Set_SCMDefaultMode(pSCM: AcDrawingAreaSCMDefault); safecall;
    function  Get_SCMDefaultMode: AcDrawingAreaSCMDefault; safecall;
    procedure Set_SCMEditMode(pSCM: AcDrawingAreaSCMEdit); safecall;
    function  Get_SCMEditMode: AcDrawingAreaSCMEdit; safecall;
    procedure Set_SCMCommandMode(pSCM: AcDrawingAreaSCMCommand); safecall;
    function  Get_SCMCommandMode: AcDrawingAreaSCMCommand; safecall;
    property Application: IAcadApplication read Get_Application;
    property KeyboardAccelerator: AcKeyboardAccelerator write Set_KeyboardAccelerator;
    property KeyboardPriority: AcKeyboardPriority write Set_KeyboardPriority;
    property HyperlinkDisplayCursor: WordBool write Set_HyperlinkDisplayCursor;
    property HyperlinkDisplayTooltip: WordBool write Set_HyperlinkDisplayTooltip;
    property ADCInsertUnitsDefaultSource: AcInsertUnits write Set_ADCInsertUnitsDefaultSource;
    property ADCInsertUnitsDefaultTarget: AcInsertUnits write Set_ADCInsertUnitsDefaultTarget;
    property ShortCutMenuDisplay: WordBool write Set_ShortCutMenuDisplay;
    property SCMDefaultMode: AcDrawingAreaSCMDefault write Set_SCMDefaultMode;
    property SCMEditMode: AcDrawingAreaSCMEdit write Set_SCMEditMode;
    property SCMCommandMode: AcDrawingAreaSCMCommand write Set_SCMCommandMode;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesUserDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5B-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesUserDisp = dispinterface
    ['{83304A5B-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property KeyboardAccelerator: AcKeyboardAccelerator writeonly dispid 1610743809;
    property KeyboardPriority: AcKeyboardPriority writeonly dispid 1610743811;
    property HyperlinkDisplayCursor: WordBool writeonly dispid 1610743813;
    property HyperlinkDisplayTooltip: WordBool writeonly dispid 1610743815;
    property ADCInsertUnitsDefaultSource: AcInsertUnits writeonly dispid 1610743817;
    property ADCInsertUnitsDefaultTarget: AcInsertUnits writeonly dispid 1610743819;
    property ShortCutMenuDisplay: WordBool writeonly dispid 1610743821;
    property SCMDefaultMode: AcDrawingAreaSCMDefault writeonly dispid 1610743823;
    property SCMEditMode: AcDrawingAreaSCMEdit writeonly dispid 1610743825;
    property SCMCommandMode: AcDrawingAreaSCMCommand writeonly dispid 1610743827;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesDrafting
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5D-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesDrafting = interface(IDispatch)
    ['{83304A5D-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_AutoSnapMarker(Path: WordBool); safecall;
    function  Get_AutoSnapMarker: WordBool; safecall;
    procedure Set_AutoSnapMagnet(Path: WordBool); safecall;
    function  Get_AutoSnapMagnet: WordBool; safecall;
    procedure Set_AutoSnapTooltip(Path: WordBool); safecall;
    function  Get_AutoSnapTooltip: WordBool; safecall;
    procedure Set_AutoSnapAperture(Path: WordBool); safecall;
    function  Get_AutoSnapAperture: WordBool; safecall;
    procedure Set_AutoSnapApertureSize(Path: Integer); safecall;
    function  Get_AutoSnapApertureSize: Integer; safecall;
    procedure Set_AutoSnapMarkerColor(Path: AcColor); safecall;
    function  Get_AutoSnapMarkerColor: AcColor; safecall;
    procedure Set_AutoSnapMarkerSize(Path: Integer); safecall;
    function  Get_AutoSnapMarkerSize: Integer; safecall;
    procedure Set_PolarTrackingVector(Path: WordBool); safecall;
    function  Get_PolarTrackingVector: WordBool; safecall;
    procedure Set_FullScreenTrackingVector(Path: WordBool); safecall;
    function  Get_FullScreenTrackingVector: WordBool; safecall;
    procedure Set_AutoTrackTooltip(Path: WordBool); safecall;
    function  Get_AutoTrackTooltip: WordBool; safecall;
    procedure Set_AlignmentPointAcquisition(Path: AcAlignmentPointAcquisition); safecall;
    function  Get_AlignmentPointAcquisition: AcAlignmentPointAcquisition; safecall;
    property Application: IAcadApplication read Get_Application;
    property AutoSnapMarker: WordBool write Set_AutoSnapMarker;
    property AutoSnapMagnet: WordBool write Set_AutoSnapMagnet;
    property AutoSnapTooltip: WordBool write Set_AutoSnapTooltip;
    property AutoSnapAperture: WordBool write Set_AutoSnapAperture;
    property AutoSnapApertureSize: Integer write Set_AutoSnapApertureSize;
    property AutoSnapMarkerColor: AcColor write Set_AutoSnapMarkerColor;
    property AutoSnapMarkerSize: Integer write Set_AutoSnapMarkerSize;
    property PolarTrackingVector: WordBool write Set_PolarTrackingVector;
    property FullScreenTrackingVector: WordBool write Set_FullScreenTrackingVector;
    property AutoTrackTooltip: WordBool write Set_AutoTrackTooltip;
    property AlignmentPointAcquisition: AcAlignmentPointAcquisition write Set_AlignmentPointAcquisition;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesDraftingDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5D-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesDraftingDisp = dispinterface
    ['{83304A5D-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property AutoSnapMarker: WordBool writeonly dispid 1610743809;
    property AutoSnapMagnet: WordBool writeonly dispid 1610743811;
    property AutoSnapTooltip: WordBool writeonly dispid 1610743813;
    property AutoSnapAperture: WordBool writeonly dispid 1610743815;
    property AutoSnapApertureSize: Integer writeonly dispid 1610743817;
    property AutoSnapMarkerColor: AcColor writeonly dispid 1610743819;
    property AutoSnapMarkerSize: Integer writeonly dispid 1610743821;
    property PolarTrackingVector: WordBool writeonly dispid 1610743823;
    property FullScreenTrackingVector: WordBool writeonly dispid 1610743825;
    property AutoTrackTooltip: WordBool writeonly dispid 1610743827;
    property AlignmentPointAcquisition: AcAlignmentPointAcquisition writeonly dispid 1610743829;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesSelection
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5F-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesSelection = interface(IDispatch)
    ['{83304A5F-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_PickFirst(Path: WordBool); safecall;
    function  Get_PickFirst: WordBool; safecall;
    procedure Set_PickAdd(Path: WordBool); safecall;
    function  Get_PickAdd: WordBool; safecall;
    procedure Set_PickDrag(Path: WordBool); safecall;
    function  Get_PickDrag: WordBool; safecall;
    procedure Set_PickAuto(Path: WordBool); safecall;
    function  Get_PickAuto: WordBool; safecall;
    procedure Set_PickBoxSize(Path: Integer); safecall;
    function  Get_PickBoxSize: Integer; safecall;
    procedure Set_DisplayGrips(Path: WordBool); safecall;
    function  Get_DisplayGrips: WordBool; safecall;
    procedure Set_DisplayGripsWithinBlocks(Path: WordBool); safecall;
    function  Get_DisplayGripsWithinBlocks: WordBool; safecall;
    procedure Set_GripColorSelected(Path: AcColor); safecall;
    function  Get_GripColorSelected: AcColor; safecall;
    procedure Set_GripColorUnselected(Path: AcColor); safecall;
    function  Get_GripColorUnselected: AcColor; safecall;
    procedure Set_GripSize(Path: Integer); safecall;
    function  Get_GripSize: Integer; safecall;
    procedure Set_PickGroup(pick: WordBool); safecall;
    function  Get_PickGroup: WordBool; safecall;
    property Application: IAcadApplication read Get_Application;
    property PickFirst: WordBool write Set_PickFirst;
    property PickAdd: WordBool write Set_PickAdd;
    property PickDrag: WordBool write Set_PickDrag;
    property PickAuto: WordBool write Set_PickAuto;
    property PickBoxSize: Integer write Set_PickBoxSize;
    property DisplayGrips: WordBool write Set_DisplayGrips;
    property DisplayGripsWithinBlocks: WordBool write Set_DisplayGripsWithinBlocks;
    property GripColorSelected: AcColor write Set_GripColorSelected;
    property GripColorUnselected: AcColor write Set_GripColorUnselected;
    property GripSize: Integer write Set_GripSize;
    property PickGroup: WordBool write Set_PickGroup;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesSelectionDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5F-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesSelectionDisp = dispinterface
    ['{83304A5F-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property PickFirst: WordBool writeonly dispid 1610743809;
    property PickAdd: WordBool writeonly dispid 1610743811;
    property PickDrag: WordBool writeonly dispid 1610743813;
    property PickAuto: WordBool writeonly dispid 1610743815;
    property PickBoxSize: Integer writeonly dispid 1610743817;
    property DisplayGrips: WordBool writeonly dispid 1610743819;
    property DisplayGripsWithinBlocks: WordBool writeonly dispid 1610743821;
    property GripColorSelected: AcColor writeonly dispid 1610743823;
    property GripColorUnselected: AcColor writeonly dispid 1610743825;
    property GripSize: Integer writeonly dispid 1610743827;
    property PickGroup: WordBool writeonly dispid 1610743829;
  end;

// *********************************************************************//
// Interface: IAcadPreferencesProfiles
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5C-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesProfiles = interface(IDispatch)
    ['{83304A5C-428E-11D2-B694-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    procedure Set_ActiveProfile(const Path: WideString); safecall;
    function  Get_ActiveProfile: WideString; safecall;
    procedure ImportProfile(const ProfileName: WideString; const RegFile: WideString;
                            IncludePathInfo: WordBool); safecall;
    procedure ExportProfile(const ProfileName: WideString; const RegFile: WideString); safecall;
    procedure DeleteProfile(const ProfileName: WideString); safecall;
    procedure ResetProfile(const Profile: WideString); safecall;
    procedure RenameProfile(const origProfileName: WideString; const newProfileName: WideString); safecall;
    procedure CopyProfile(const oldProfileName: WideString; const newProfileName: WideString); safecall;
    procedure GetAllProfileNames(out pNames: OleVariant); safecall;
    property Application: IAcadApplication read Get_Application;
    property ActiveProfile: WideString write Set_ActiveProfile;
  end;

// *********************************************************************//
// DispIntf:  IAcadPreferencesProfilesDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {83304A5C-428E-11D2-B694-0060B087E235}
// *********************************************************************//
  IAcadPreferencesProfilesDisp = dispinterface
    ['{83304A5C-428E-11D2-B694-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property ActiveProfile: WideString writeonly dispid 1610743809;
    procedure ImportProfile(const ProfileName: WideString; const RegFile: WideString;
                            IncludePathInfo: WordBool); dispid 1610743811;
    procedure ExportProfile(const ProfileName: WideString; const RegFile: WideString); dispid 1610743812;
    procedure DeleteProfile(const ProfileName: WideString); dispid 1610743813;
    procedure ResetProfile(const Profile: WideString); dispid 1610743814;
    procedure RenameProfile(const origProfileName: WideString; const newProfileName: WideString); dispid 1610743815;
    procedure CopyProfile(const oldProfileName: WideString; const newProfileName: WideString); dispid 1610743816;
    procedure GetAllProfileNames(out pNames: OleVariant); dispid 1610743817;
  end;

// *********************************************************************//
// Interface: IAcadMenuGroups
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C50-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuGroups = interface(IDispatch)
    ['{61BA8C50-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadMenuGroup; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadApplication; safecall;
    function  Load(const MenuFileName: WideString; BaseMenu: OleVariant): IAcadMenuGroup; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadApplication read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IAcadMenuGroupsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C50-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuGroupsDisp = dispinterface
    ['{61BA8C50-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadMenuGroup; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IAcadApplication readonly dispid 1610743812;
    function  Load(const MenuFileName: WideString; BaseMenu: OleVariant): IAcadMenuGroup; dispid 1610743813;
  end;

// *********************************************************************//
// Interface: IAcadMenuGroup
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C52-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuGroup = interface(IDispatch)
    ['{61BA8C52-59F2-11D1-A2FB-080009A0C626}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadMenuGroups; safecall;
    function  Get_Name: WideString; safecall;
    function  Get_Type_: AcMenuGroupType; safecall;
    function  Get_MenuFileName: WideString; safecall;
    function  Get_Menus: IAcadPopupMenus; safecall;
    function  Get_Toolbars: IAcadToolbars; safecall;
    procedure Unload; safecall;
    procedure Save(MenuFileType: AcMenuFileType); safecall;
    procedure SaveAs(const MenuFileName: WideString; MenuFileType: AcMenuFileType); safecall;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadMenuGroups read Get_Parent;
    property Name: WideString read Get_Name;
    property Type_: AcMenuGroupType read Get_Type_;
    property MenuFileName: WideString read Get_MenuFileName;
    property Menus: IAcadPopupMenus read Get_Menus;
    property Toolbars: IAcadToolbars read Get_Toolbars;
  end;

// *********************************************************************//
// DispIntf:  IAcadMenuGroupDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C52-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuGroupDisp = dispinterface
    ['{61BA8C52-59F2-11D1-A2FB-080009A0C626}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property Parent: IAcadMenuGroups readonly dispid 1610743809;
    property Name: WideString readonly dispid 1610743810;
    property Type_: AcMenuGroupType readonly dispid 1610743811;
    property MenuFileName: WideString readonly dispid 1610743812;
    property Menus: IAcadPopupMenus readonly dispid 1610743813;
    property Toolbars: IAcadToolbars readonly dispid 1610743814;
    procedure Unload; dispid 1610743815;
    procedure Save(MenuFileType: AcMenuFileType); dispid 1610743816;
    procedure SaveAs(const MenuFileName: WideString; MenuFileType: AcMenuFileType); dispid 1610743817;
  end;

// *********************************************************************//
// Interface: IAcadPopupMenus
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C54-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenus = interface(IDispatch)
    ['{61BA8C54-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenu; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadMenuGroup; safecall;
    function  Add(const MenuName: WideString): IAcadPopupMenu; safecall;
    procedure InsertMenuInMenuBar(const MenuName: WideString; Index: OleVariant); safecall;
    procedure RemoveMenuFromMenuBar(Index: OleVariant); safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadMenuGroup read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IAcadPopupMenusDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C54-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenusDisp = dispinterface
    ['{61BA8C54-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenu; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IAcadMenuGroup readonly dispid 1610743812;
    function  Add(const MenuName: WideString): IAcadPopupMenu; dispid 1610743813;
    procedure InsertMenuInMenuBar(const MenuName: WideString; Index: OleVariant); dispid 1610743814;
    procedure RemoveMenuFromMenuBar(Index: OleVariant); dispid 1610743815;
  end;

// *********************************************************************//
// Interface: IAcadPopupMenu
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C56-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenu = interface(IDispatch)
    ['{61BA8C56-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenuItem; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IDispatch; safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_NameNoMnemonic: WideString; safecall;
    function  Get_ShortcutMenu: WordBool; safecall;
    function  Get_OnMenuBar: WordBool; safecall;
    function  AddMenuItem(Index: OleVariant; const Label_: WideString; const Macro: WideString): IAcadPopupMenuItem; safecall;
    function  AddSubMenu(Index: OleVariant; const Label_: WideString): IAcadPopupMenu; safecall;
    function  AddSeparator(Index: OleVariant): IAcadPopupMenuItem; safecall;
    procedure InsertInMenuBar(Index: OleVariant); safecall;
    procedure RemoveFromMenuBar; safecall;
    function  Get_TagString: WideString; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property NameNoMnemonic: WideString read Get_NameNoMnemonic;
    property ShortcutMenu: WordBool read Get_ShortcutMenu;
    property OnMenuBar: WordBool read Get_OnMenuBar;
    property TagString: WideString read Get_TagString;
  end;

// *********************************************************************//
// DispIntf:  IAcadPopupMenuDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C56-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenuDisp = dispinterface
    ['{61BA8C56-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenuItem; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IDispatch readonly dispid 1610743812;
    property Name: WideString readonly dispid 1610743813;
    property NameNoMnemonic: WideString readonly dispid 1610743815;
    property ShortcutMenu: WordBool readonly dispid 1610743816;
    property OnMenuBar: WordBool readonly dispid 1610743817;
    function  AddMenuItem(Index: OleVariant; const Label_: WideString; const Macro: WideString): IAcadPopupMenuItem; dispid 1610743818;
    function  AddSubMenu(Index: OleVariant; const Label_: WideString): IAcadPopupMenu; dispid 1610743819;
    function  AddSeparator(Index: OleVariant): IAcadPopupMenuItem; dispid 1610743820;
    procedure InsertInMenuBar(Index: OleVariant); dispid 1610743821;
    procedure RemoveFromMenuBar; dispid 1610743822;
    property TagString: WideString readonly dispid 1610743823;
  end;

// *********************************************************************//
// Interface: IAcadPopupMenuItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C58-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenuItem = interface(IDispatch)
    ['{61BA8C58-59F2-11D1-A2FB-080009A0C626}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadPopupMenu; safecall;
    function  Get_Label_: WideString; safecall;
    procedure Set_Label_(const bstrLabel: WideString); safecall;
    function  Get_TagString: WideString; safecall;
    procedure Set_TagString(const bstrTag: WideString); safecall;
    function  Get_Enable: WordBool; safecall;
    procedure Set_Enable(bFlag: WordBool); safecall;
    function  Get_Check: WordBool; safecall;
    procedure Set_Check(bFlag: WordBool); safecall;
    function  Get_Type_: AcMenuItemType; safecall;
    function  Get_SubMenu: IAcadPopupMenu; safecall;
    function  Get_Macro: WideString; safecall;
    procedure Set_Macro(const bstrMacro: WideString); safecall;
    function  Get_Index: SYSINT; safecall;
    function  Get_Caption: WideString; safecall;
    function  Get_HelpString: WideString; safecall;
    procedure Set_HelpString(const bstrHelp: WideString); safecall;
    procedure Delete; safecall;
    function  Get_EndSubMenuLevel: SYSINT; safecall;
    procedure Set_EndSubMenuLevel(Level: SYSINT); safecall;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadPopupMenu read Get_Parent;
    property Label_: WideString read Get_Label_;
    property TagString: WideString read Get_TagString;
    property Enable: WordBool read Get_Enable;
    property Check: WordBool read Get_Check;
    property Type_: AcMenuItemType read Get_Type_;
    property SubMenu: IAcadPopupMenu read Get_SubMenu;
    property Macro: WideString read Get_Macro;
    property Index: SYSINT read Get_Index;
    property Caption: WideString read Get_Caption;
    property HelpString: WideString read Get_HelpString;
    property EndSubMenuLevel: SYSINT read Get_EndSubMenuLevel;
  end;

// *********************************************************************//
// DispIntf:  IAcadPopupMenuItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C58-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadPopupMenuItemDisp = dispinterface
    ['{61BA8C58-59F2-11D1-A2FB-080009A0C626}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property Parent: IAcadPopupMenu readonly dispid 1610743809;
    property Label_: WideString readonly dispid 1610743810;
    property TagString: WideString readonly dispid 1610743812;
    property Enable: WordBool readonly dispid 1610743814;
    property Check: WordBool readonly dispid 1610743816;
    property Type_: AcMenuItemType readonly dispid 1610743818;
    property SubMenu: IAcadPopupMenu readonly dispid 1610743819;
    property Macro: WideString readonly dispid 1610743820;
    property Index: SYSINT readonly dispid 1610743822;
    property Caption: WideString readonly dispid 1610743823;
    property HelpString: WideString readonly dispid 1610743824;
    procedure Delete; dispid 1610743826;
    property EndSubMenuLevel: SYSINT readonly dispid 1610743827;
  end;

// *********************************************************************//
// Interface: IAcadToolbars
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5A-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbars = interface(IDispatch)
    ['{61BA8C5A-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadToolbar; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadMenuGroup; safecall;
    function  Get_LargeButtons: WordBool; safecall;
    procedure Set_LargeButtons(bFlag: WordBool); safecall;
    function  Add(const ToolbarName: WideString): IAcadToolbar; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadMenuGroup read Get_Parent;
    property LargeButtons: WordBool read Get_LargeButtons;
  end;

// *********************************************************************//
// DispIntf:  IAcadToolbarsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5A-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbarsDisp = dispinterface
    ['{61BA8C5A-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadToolbar; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IAcadMenuGroup readonly dispid 1610743812;
    property LargeButtons: WordBool readonly dispid 1610743813;
    function  Add(const ToolbarName: WideString): IAcadToolbar; dispid 1610743815;
  end;

// *********************************************************************//
// Interface: IAcadToolbar
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5C-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbar = interface(IDispatch)
    ['{61BA8C5C-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadToolbarItem; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IDispatch; safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_Visible: WordBool; safecall;
    procedure Set_Visible(bFlag: WordBool); safecall;
    function  Get_DockStatus: AcToolbarDockStatus; safecall;
    function  Get_LargeButtons: WordBool; safecall;
    function  Get_left: SYSINT; safecall;
    procedure Set_left(nLeft: SYSINT); safecall;
    function  Get_top: SYSINT; safecall;
    procedure Set_top(nTop: SYSINT); safecall;
    function  Get_Width: SYSINT; safecall;
    function  Get_Height: SYSINT; safecall;
    function  Get_FloatingRows: SYSINT; safecall;
    procedure Set_FloatingRows(nRows: SYSINT); safecall;
    function  Get_HelpString: WideString; safecall;
    procedure Set_HelpString(const bstrHelp: WideString); safecall;
    function  AddToolbarButton(Index: OleVariant; const Name: WideString;
                               const HelpString: WideString; const Macro: WideString;
                               FlyoutButton: OleVariant): IAcadToolbarItem; safecall;
    function  AddSeparator(Index: OleVariant): IAcadToolbarItem; safecall;
    procedure Dock(Side: AcToolbarDockStatus); safecall;
    procedure Float(top: SYSINT; left: SYSINT; NumberFloatRows: SYSINT); safecall;
    procedure Delete; safecall;
    function  Get_TagString: WideString; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IDispatch read Get_Parent;
    property Name: WideString read Get_Name;
    property Visible: WordBool read Get_Visible;
    property DockStatus: AcToolbarDockStatus read Get_DockStatus;
    property LargeButtons: WordBool read Get_LargeButtons;
    property left: SYSINT read Get_left;
    property top: SYSINT read Get_top;
    property Width: SYSINT read Get_Width;
    property Height: SYSINT read Get_Height;
    property FloatingRows: SYSINT read Get_FloatingRows;
    property HelpString: WideString read Get_HelpString;
    property TagString: WideString read Get_TagString;
  end;

// *********************************************************************//
// DispIntf:  IAcadToolbarDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5C-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbarDisp = dispinterface
    ['{61BA8C5C-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadToolbarItem; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IDispatch readonly dispid 1610743812;
    property Name: WideString readonly dispid 1610743813;
    property Visible: WordBool readonly dispid 1610743815;
    property DockStatus: AcToolbarDockStatus readonly dispid 1610743817;
    property LargeButtons: WordBool readonly dispid 1610743818;
    property left: SYSINT readonly dispid 1610743819;
    property top: SYSINT readonly dispid 1610743821;
    property Width: SYSINT readonly dispid 1610743823;
    property Height: SYSINT readonly dispid 1610743824;
    property FloatingRows: SYSINT readonly dispid 1610743825;
    property HelpString: WideString readonly dispid 1610743827;
    function  AddToolbarButton(Index: OleVariant; const Name: WideString;
                               const HelpString: WideString; const Macro: WideString;
                               FlyoutButton: OleVariant): IAcadToolbarItem; dispid 1610743829;
    function  AddSeparator(Index: OleVariant): IAcadToolbarItem; dispid 1610743830;
    procedure Dock(Side: AcToolbarDockStatus); dispid 1610743831;
    procedure Float(top: SYSINT; left: SYSINT; NumberFloatRows: SYSINT); dispid 1610743832;
    procedure Delete; dispid 1610743833;
    property TagString: WideString readonly dispid 1610743834;
  end;

// *********************************************************************//
// Interface: IAcadToolbarItem
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5E-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbarItem = interface(IDispatch)
    ['{61BA8C5E-59F2-11D1-A2FB-080009A0C626}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadToolbar; safecall;
    function  Get_Name: WideString; safecall;
    procedure Set_Name(const bstrName: WideString); safecall;
    function  Get_TagString: WideString; safecall;
    procedure Set_TagString(const bstrTag: WideString); safecall;
    function  Get_Type_: AcToolbarItemType; safecall;
    function  Get_Flyout: IAcadToolbar; safecall;
    function  Get_Macro: WideString; safecall;
    procedure Set_Macro(const bstrMacro: WideString); safecall;
    function  Get_Index: SYSINT; safecall;
    function  Get_HelpString: WideString; safecall;
    procedure Set_HelpString(const bstrHelp: WideString); safecall;
    procedure GetBitmaps(out SmallIconName: WideString; out LargeIconName: WideString); safecall;
    procedure SetBitmaps(const SmallIconName: WideString; const LargeIconName: WideString); safecall;
    procedure AttachToolbarToFlyout(const MenuGroupName: WideString; const ToolbarName: WideString); safecall;
    procedure Delete; safecall;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadToolbar read Get_Parent;
    property Name: WideString read Get_Name;
    property TagString: WideString read Get_TagString;
    property Type_: AcToolbarItemType read Get_Type_;
    property Flyout: IAcadToolbar read Get_Flyout;
    property Macro: WideString read Get_Macro;
    property Index: SYSINT read Get_Index;
    property HelpString: WideString read Get_HelpString;
  end;

// *********************************************************************//
// DispIntf:  IAcadToolbarItemDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C5E-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadToolbarItemDisp = dispinterface
    ['{61BA8C5E-59F2-11D1-A2FB-080009A0C626}']
    property Application: IAcadApplication readonly dispid 1610743808;
    property Parent: IAcadToolbar readonly dispid 1610743809;
    property Name: WideString readonly dispid 1610743810;
    property TagString: WideString readonly dispid 1610743812;
    property Type_: AcToolbarItemType readonly dispid 1610743814;
    property Flyout: IAcadToolbar readonly dispid 1610743815;
    property Macro: WideString readonly dispid 1610743816;
    property Index: SYSINT readonly dispid 1610743818;
    property HelpString: WideString readonly dispid 1610743819;
    procedure GetBitmaps(out SmallIconName: WideString; out LargeIconName: WideString); dispid 1610743821;
    procedure SetBitmaps(const SmallIconName: WideString; const LargeIconName: WideString); dispid 1610743822;
    procedure AttachToolbarToFlyout(const MenuGroupName: WideString; const ToolbarName: WideString); dispid 1610743823;
    procedure Delete; dispid 1610743824;
  end;

// *********************************************************************//
// Interface: IAcadMenuBar
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C60-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuBar = interface(IDispatch)
    ['{61BA8C60-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenu; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Get_Parent: IAcadApplication; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
    property Parent: IAcadApplication read Get_Parent;
  end;

// *********************************************************************//
// DispIntf:  IAcadMenuBarDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {61BA8C60-59F2-11D1-A2FB-080009A0C626}
// *********************************************************************//
  IAcadMenuBarDisp = dispinterface
    ['{61BA8C60-59F2-11D1-A2FB-080009A0C626}']
    function  Item(Index: OleVariant): IAcadPopupMenu; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    property Parent: IAcadApplication readonly dispid 1610743812;
  end;

// *********************************************************************//
// Interface: IAcadDocuments
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EC02A736-AE43-11D1-A2E5-0060B06B2D46}
// *********************************************************************//
  IAcadDocuments = interface(IDispatch)
    ['{EC02A736-AE43-11D1-A2E5-0060B06B2D46}']
    function  Item(Index: OleVariant): IAcadDocument; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Count: Integer; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Add(TemplateName: OleVariant): IAcadDocument; safecall;
    function  Open(const Name: WideString; ReadOnly: OleVariant): IAcadDocument; safecall;
    procedure Close; safecall;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Count: Integer read Get_Count;
    property Application: IAcadApplication read Get_Application;
  end;

// *********************************************************************//
// DispIntf:  IAcadDocumentsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {EC02A736-AE43-11D1-A2E5-0060B06B2D46}
// *********************************************************************//
  IAcadDocumentsDisp = dispinterface
    ['{EC02A736-AE43-11D1-A2E5-0060B06B2D46}']
    function  Item(Index: OleVariant): IAcadDocument; dispid 0;
    property _NewEnum: IUnknown readonly dispid -4;
    property Count: Integer readonly dispid 1610743810;
    property Application: IAcadApplication readonly dispid 1610743811;
    function  Add(TemplateName: OleVariant): IAcadDocument; dispid 1610743812;
    function  Open(const Name: WideString; ReadOnly: OleVariant): IAcadDocument; dispid 1610743813;
    procedure Close; dispid 1610743814;
  end;

// *********************************************************************//
// Interface: IAcadState
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E258A652-AA84-11D2-B6FB-0060B087E235}
// *********************************************************************//
  IAcadState = interface(IDispatch)
    ['{E258A652-AA84-11D2-B6FB-0060B087E235}']
    function  Get_Application: IAcadApplication; safecall;
    function  Get_IsQuiescent: WordBool; safecall;
    property Application: IAcadApplication read Get_Application;
    property IsQuiescent: WordBool read Get_IsQuiescent;
  end;

// *********************************************************************//
// DispIntf:  IAcadStateDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E258A652-AA84-11D2-B6FB-0060B087E235}
// *********************************************************************//
  IAcadStateDisp = dispinterface
    ['{E258A652-AA84-11D2-B6FB-0060B087E235}']
    property Application: IAcadApplication readonly dispid 1;
    property IsQuiescent: WordBool readonly dispid 2;
  end;

// *********************************************************************//
// Interface: IAcadSelectionSets
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E90-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadSelectionSets = interface(IDispatch)
    ['{A1617E90-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadSelectionSet; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Application: IAcadApplication; safecall;
    function  Add(const Name: WideString): IAcadSelectionSet; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Application: IAcadApplication read Get_Application;
  end;

// *********************************************************************//
// DispIntf:  IAcadSelectionSetsDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E90-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadSelectionSetsDisp = dispinterface
    ['{A1617E90-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadSelectionSet; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    property Application: IAcadApplication readonly dispid 1610743811;
    function  Add(const Name: WideString): IAcadSelectionSet; dispid 2;
  end;

// *********************************************************************//
// Interface: IAcadSelectionSet
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E92-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadSelectionSet = interface(IDispatch)
    ['{A1617E92-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadEntity; safecall;
    function  Get_Count: Integer; safecall;
    function  Get__NewEnum: IUnknown; safecall;
    function  Get_Name: WideString; safecall;
    procedure Highlight(bFlag: WordBool); safecall;
    procedure Erase; safecall;
    procedure Update; safecall;
    function  Get_Application: IAcadApplication; safecall;
    procedure AddItems(pSelSet: OleVariant); safecall;
    procedure RemoveItems(Objects: OleVariant); safecall;
    procedure Clear; safecall;
    procedure Select(Mode: AcSelect; Point1: OleVariant; Point2: OleVariant;
                     FilterType: OleVariant; FilterData: OleVariant); safecall;
    procedure SelectAtPoint(Point: OleVariant; FilterType: OleVariant; FilterData: OleVariant); safecall;
    procedure SelectByPolygon(Mode: AcSelect; PointsList: OleVariant; FilterType: OleVariant;
                              FilterData: OleVariant); safecall;
    procedure SelectOnScreen(FilterType: OleVariant; FilterData: OleVariant); safecall;
    procedure Delete; safecall;
    property Count: Integer read Get_Count;
    property _NewEnum: IUnknown read Get__NewEnum;
    property Name: WideString read Get_Name;
    property Application: IAcadApplication read Get_Application;
  end;

// *********************************************************************//
// DispIntf:  IAcadSelectionSetDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A1617E92-FB21-11D1-A2C8-080009DC639A}
// *********************************************************************//
  IAcadSelectionSetDisp = dispinterface
    ['{A1617E92-FB21-11D1-A2C8-080009DC639A}']
    function  Item(Index: OleVariant): IAcadEntity; dispid 0;
    property Count: Integer readonly dispid 1;
    property _NewEnum: IUnknown readonly dispid -4;
    property Name: WideString readonly dispid 2;
    procedure Highlight(bFlag: WordBool); dispid 3;
    procedure Erase; dispid 4;
    procedure Update; dispid 5;
    property Application: IAcadApplication readonly dispid 6;
    procedure AddItems(pSelSet: OleVariant); dispid 7;
    procedure RemoveItems(Objects: OleVariant); dispid 8;
    procedure Clear; dispid 9;
    procedure Select(Mode: AcSelect; Point1: OleVariant; Point2: OleVariant;
                     FilterType: OleVariant; FilterData: OleVariant); dispid 10;
    procedure SelectAtPoint(Point: OleVariant; FilterType: OleVariant; FilterData: OleVariant); dispid 11;
    procedure SelectByPolygon(Mode: AcSelect; PointsList: OleVariant; FilterType: OleVariant;
                              FilterData: OleVariant); dispid 12;
    procedure SelectOnScreen(FilterType: OleVariant; FilterData: OleVariant); dispid 13;
    procedure Delete; dispid 14;
  end;

// *********************************************************************//
// Interface: IAcadUtility
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F81D8A-6D4A-11CF-93FB-0800099EB3B7}
// *********************************************************************//
  IAcadUtility = interface(IDispatch)
    ['{E4F81D8A-6D4A-11CF-93FB-0800099EB3B7}']
    function  AngleToReal(const Angle: WideString; Unit_: AcAngleUnits): Double; safecall;
    function  AngleToString(Angle: Double; Unit_: AcAngleUnits; precision: SYSINT): WideString; safecall;
    function  DistanceToReal(const Distance: WideString; Unit_: AcUnits): Double; safecall;
    function  RealToString(Value: Double; Unit_: AcUnits; precision: SYSINT): WideString; safecall;
    function  TranslateCoordinates(Point: OleVariant; FromCoordSystem: AcCoordinateSystem;
                                   ToCoordSystem: AcCoordinateSystem; Displacement: SYSINT;
                                   OCSNormal: OleVariant): OleVariant; safecall;
    procedure InitializeUserInput(Bits: SYSINT; KeyWordList: OleVariant); safecall;
    function  GetInteger(Prompt: OleVariant): SYSINT; safecall;
    function  GetReal(Prompt: OleVariant): Double; safecall;
    function  GetInput: WideString; safecall;
    function  GetKeyword(Prompt: OleVariant): WideString; safecall;
    function  GetString(HasSpaces: SYSINT; Prompt: OleVariant): WideString; safecall;
    function  GetAngle(Point: OleVariant; Prompt: OleVariant): Double; safecall;
    function  AngleFromXAxis(StartPoint: OleVariant; EndPoint: OleVariant): Double; safecall;
    function  GetCorner(Point: OleVariant; Prompt: OleVariant): OleVariant; safecall;
    function  GetDistance(Point: OleVariant; Prompt: OleVariant): Double; safecall;
    function  GetOrientation(Point: OleVariant; Prompt: OleVariant): Double; safecall;
    function  GetPoint(Point: OleVariant; Prompt: OleVariant): OleVariant; safecall;
    function  PolarPoint(Point: OleVariant; Angle: Double; Distance: Double): OleVariant; safecall;
    procedure CreateTypedArray(out varArr: OleVariant; Type_: SYSINT; inArgs: PSafeArray); safecall;
    procedure GetEntity(out Object_: IDispatch; out PickedPoint: OleVariant; Prompt: OleVariant); safecall;
    procedure Prompt(const Message: WideString); safecall;
    procedure GetSubEntity(out Object_: IDispatch; out PickedPoint: OleVariant;
                           out transMatrix: OleVariant; out ContextData: OleVariant;
                           Prompt: OleVariant); safecall;
    function  IsURL(const URL: WideString): WordBool; safecall;
    procedure GetRemoteFile(const URL: WideString; out LocalFile: WideString; IgnoreCache: WordBool); safecall;
    procedure PutRemoteFile(const URL: WideString; const LocalFile: WideString); safecall;
    function  IsRemoteFile(const LocalFile: WideString; out URL: WideString): WordBool; safecall;
    function  LaunchBrowserDialog(out SelectedURL: WideString; const DialogTitle: WideString;
                                  const OpenButtonCaption: WideString;
                                  const StartPageURL: WideString;
                                  const RegistryRootKey: WideString;
                                  OpenButtonAlwaysEnabled: WordBool): WordBool; safecall;
  end;

// *********************************************************************//
// DispIntf:  IAcadUtilityDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {E4F81D8A-6D4A-11CF-93FB-0800099EB3B7}
// *********************************************************************//
  IAcadUtilityDisp = dispinterface
    ['{E4F81D8A-6D4A-11CF-93FB-0800099EB3B7}']
    function  AngleToReal(const Angle: WideString; Unit_: AcAngleUnits): Double; dispid 1610743808;
    function  AngleToString(Angle: Double; Unit_: AcAngleUnits; precision: SYSINT): WideString; dispid 1610743809;
    function  DistanceToReal(const Distance: WideString; Unit_: AcUnits): Double; dispid 1610743810;
    function  RealToString(Value: Double; Unit_: AcUnits; precision: SYSINT): WideString; dispid 1610743811;
    function  TranslateCoordinates(Point: OleVariant; FromCoordSystem: AcCoordinateSystem;
                                   ToCoordSystem: AcCoordinateSystem; Displacement: SYSINT;
                                   OCSNormal: OleVariant): OleVariant; dispid 1610743812;
    procedure InitializeUserInput(Bits: SYSINT; KeyWordList: OleVariant); dispid 1610743813;
    function  GetInteger(Prompt: OleVariant): SYSINT; dispid 1610743814;
    function  GetReal(Prompt: OleVariant): Double; dispid 1610743815;
    function  GetInput: WideString; dispid 1610743816;
    function  GetKeyword(Prompt: OleVariant): WideString; dispid 1610743817;
    function  GetString(HasSpaces: SYSINT; Prompt: OleVariant): WideString; dispid 1610743818;
    function  GetAngle(Point: OleVariant; Prompt: OleVariant): Double; dispid 1610743819;
    function  AngleFromXAxis(StartPoint: OleVariant; EndPoint: OleVariant): Double; dispid 1610743820;
    function  GetCorner(Point: OleVariant; Prompt: OleVariant): OleVariant; dispid 1610743821;
    function  GetDistance(Point: OleVariant; Prompt: OleVariant): Double; dispid 1610743822;
    function  GetOrientation(Point: OleVariant; Prompt: OleVariant): Double; dispid 1610743823;
    function  GetPoint(Point: OleVariant; Prompt: OleVariant): OleVariant; dispid 1610743824;
    function  PolarPoint(Point: OleVariant; Angle: Double; Distance: Double): OleVariant; dispid 1610743825;
    procedure CreateTypedArray(out varArr: OleVariant; Type_: SYSINT;
                               inArgs: {??PSafeArray} OleVariant); dispid 1610743826;
    procedure GetEntity(out Object_: IDispatch; out PickedPoint: OleVariant; Prompt: OleVariant); dispid 1610743827;
    procedure Prompt(const Message: WideString); dispid 1610743828;
    procedure GetSubEntity(out Object_: IDispatch; out PickedPoint: OleVariant;
                           out transMatrix: OleVariant; out ContextData: OleVariant;
                           Prompt: OleVariant); dispid 1610743829;
    function  IsURL(const URL: WideString): WordBool; dispid 1610743830;
    procedure GetRemoteFile(const URL: WideString; out LocalFile: WideString; IgnoreCache: WordBool); dispid 1610743831;
    procedure PutRemoteFile(const URL: WideString; const LocalFile: WideString); dispid 1610743832;
    function  IsRemoteFile(const LocalFile: WideString; out URL: WideString): WordBool; dispid 1610743833;
    function  LaunchBrowserDialog(out SelectedURL: WideString; const DialogTitle: WideString;
                                  const OpenButtonCaption: WideString;
                                  const StartPageURL: WideString;
                                  const RegistryRootKey: WideString;
                                  OpenButtonAlwaysEnabled: WordBool): WordBool; dispid 1610743834;
  end;

// *********************************************************************//
// DispIntf:  _DAcadDocumentEvents
// Flags:     (4112) Hidden Dispatchable
// GUID:      {976858E1-0B7B-11D0-89DF-00805FC2FBBA}
// *********************************************************************//
  _DAcadDocumentEvents = dispinterface
    ['{976858E1-0B7B-11D0-89DF-00805FC2FBBA}']
    procedure BeginSave(const FileName: WideString); dispid 1;
    procedure EndSave(const FileName: WideString); dispid 2;
    procedure BeginCommand(const CommandName: WideString); dispid 6;
    procedure EndCommand(const CommandName: WideString); dispid 7;
    procedure BeginLisp(const FirstLine: WideString); dispid 8;
    procedure EndLisp; dispid 9;
    procedure LispCancelled; dispid 10;
    procedure SelectionChanged; dispid 11;
    procedure Activate; dispid 12;
    procedure Deactivate; dispid 13;
    procedure BeginRightClick(PickPoint: OleVariant); dispid 14;
    procedure BeginShortcutMenuDefault(out ShortcutMenu: IAcadPopupMenu); dispid 15;
    procedure BeginShortcutMenuEdit(out ShortcutMenu: IAcadPopupMenu;
                                    out SelectionSet: IAcadSelectionSet); dispid 16;
    procedure BeginShortcutMenuCommand(out ShortcutMenu: IAcadPopupMenu; const Command: WideString); dispid 17;
    procedure BeginShortcutMenuGrip(out ShortcutMenu: IAcadPopupMenu); dispid 18;
    procedure BeginShortcutMenuOsnap(out ShortcutMenu: IAcadPopupMenu); dispid 19;
    procedure EndShortcutMenu(out ShortcutMenu: IAcadPopupMenu); dispid 30;
    procedure BeginDoubleClick(PickPoint: OleVariant); dispid 20;
    procedure ObjectAdded(const Object_: IDispatch); dispid 21;
    procedure ObjectErased(ObjectID: Integer); dispid 22;
    procedure ObjectModified(const Object_: IDispatch); dispid 23;
    procedure BeginPlot(const DrawingName: WideString); dispid 24;
    procedure EndPlot(const DrawingName: WideString); dispid 25;
    procedure WindowMovedOrResized(HWNDFrame: Integer; bMoved: WordBool); dispid 29;
    procedure LayoutSwitched(const LayoutName: WideString); dispid 31;
    procedure WindowChanged(WindowState: AcWindowState); dispid 32;
    procedure BeginClose; dispid 33;
  end;

// *********************************************************************//
// Interface: IAcadLayerStateManager
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A6F7919D-D29C-11D3-8D11-00108302FDA5}
// *********************************************************************//
  IAcadLayerStateManager = interface(IDispatch)
    ['{A6F7919D-D29C-11D3-8D11-00108302FDA5}']
    procedure SetDatabase(const iHostDb: IAcadDatabase); safecall;
    procedure Set_Mask(const bsName: WideString; eMask: AcLayerStateMask); safecall;
    function  Get_Mask(const bsName: WideString): AcLayerStateMask; safecall;
    procedure Save(const bsName: WideString; eMask: AcLayerStateMask); safecall;
    procedure Restore(const bsName: WideString); safecall;
    procedure Delete(const bsName: WideString); safecall;
    procedure Rename(const bsName: WideString; const bsNewName: WideString); safecall;
    procedure Import(const bsFilename: WideString); safecall;
    procedure Export(const bsName: WideString; const bsFilename: WideString); safecall;
    property Mask[const bsName: WideString]: AcLayerStateMask write Set_Mask;
  end;

// *********************************************************************//
// DispIntf:  IAcadLayerStateManagerDisp
// Flags:     (4416) Dual OleAutomation Dispatchable
// GUID:      {A6F7919D-D29C-11D3-8D11-00108302FDA5}
// *********************************************************************//
  IAcadLayerStateManagerDisp = dispinterface
    ['{A6F7919D-D29C-11D3-8D11-00108302FDA5}']
    procedure SetDatabase(const iHostDb: IAcadDatabase); dispid 1610743808;
    property Mask[const bsName: WideString]: AcLayerStateMask writeonly dispid 1610743809;
    procedure Save(const bsName: WideString; eMask: AcLayerStateMask); dispid 1610743811;
    procedure Restore(const bsName: WideString); dispid 1610743812;
    procedure Delete(const bsName: WideString); dispid 1610743813;
    procedure Rename(const bsName: WideString; const bsNewName: WideString); dispid 1610743814;
    procedure Import(const bsFilename: WideString); dispid 1610743815;
    procedure Export(const bsName: WideString; const bsFilename: WideString); dispid 1610743816;
  end;

// *********************************************************************//
// The Class CoAcadHyperlink provides a Create and CreateRemote method to
// create instances of the default interface IAcadHyperlink exposed by
// the CoClass AcadHyperlink. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadHyperlink = class
    class function Create: IAcadHyperlink;
    class function CreateRemote(const MachineName: string): IAcadHyperlink;
  end;

// *********************************************************************//
// The Class CoAcadObject provides a Create and CreateRemote method to
// create instances of the default interface IAcadObject exposed by
// the CoClass AcadObject. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadObject = class
    class function Create: IAcadObject;
    class function CreateRemote(const MachineName: string): IAcadObject;
  end;

// *********************************************************************//
// The Class CoAcadXRecord provides a Create and CreateRemote method to
// create instances of the default interface IAcadXRecord exposed by
// the CoClass AcadXRecord. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadXRecord = class
    class function Create: IAcadXRecord;
    class function CreateRemote(const MachineName: string): IAcadXRecord;
  end;

// *********************************************************************//
// The Class CoAcadDimStyle provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimStyle exposed by
// the CoClass AcadDimStyle. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimStyle = class
    class function Create: IAcadDimStyle;
    class function CreateRemote(const MachineName: string): IAcadDimStyle;
  end;

// *********************************************************************//
// The Class CoAcadLayer provides a Create and CreateRemote method to
// create instances of the default interface IAcadLayer exposed by
// the CoClass AcadLayer. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLayer = class
    class function Create: IAcadLayer;
    class function CreateRemote(const MachineName: string): IAcadLayer;
  end;

// *********************************************************************//
// The Class CoAcadLineType provides a Create and CreateRemote method to
// create instances of the default interface IAcadLineType exposed by
// the CoClass AcadLineType. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLineType = class
    class function Create: IAcadLineType;
    class function CreateRemote(const MachineName: string): IAcadLineType;
  end;

// *********************************************************************//
// The Class CoAcadRegisteredApplication provides a Create and CreateRemote method to
// create instances of the default interface IAcadRegisteredApplication exposed by
// the CoClass AcadRegisteredApplication. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadRegisteredApplication = class
    class function Create: IAcadRegisteredApplication;
    class function CreateRemote(const MachineName: string): IAcadRegisteredApplication;
  end;

// *********************************************************************//
// The Class CoAcadTextStyle provides a Create and CreateRemote method to
// create instances of the default interface IAcadTextStyle exposed by
// the CoClass AcadTextStyle. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadTextStyle = class
    class function Create: IAcadTextStyle;
    class function CreateRemote(const MachineName: string): IAcadTextStyle;
  end;

// *********************************************************************//
// The Class CoAcadUCS provides a Create and CreateRemote method to
// create instances of the default interface IAcadUCS exposed by
// the CoClass AcadUCS. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadUCS = class
    class function Create: IAcadUCS;
    class function CreateRemote(const MachineName: string): IAcadUCS;
  end;

// *********************************************************************//
// The Class CoAcadView provides a Create and CreateRemote method to
// create instances of the default interface IAcadView exposed by
// the CoClass AcadView. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadView = class
    class function Create: IAcadView;
    class function CreateRemote(const MachineName: string): IAcadView;
  end;

// *********************************************************************//
// The Class CoAcadViewport provides a Create and CreateRemote method to
// create instances of the default interface IAcadViewport exposed by
// the CoClass AcadViewport. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadViewport = class
    class function Create: IAcadViewport;
    class function CreateRemote(const MachineName: string): IAcadViewport;
  end;

// *********************************************************************//
// The Class CoAcadGroup provides a Create and CreateRemote method to
// create instances of the default interface IAcadGroup exposed by
// the CoClass AcadGroup. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadGroup = class
    class function Create: IAcadGroup;
    class function CreateRemote(const MachineName: string): IAcadGroup;
  end;

// *********************************************************************//
// The Class CoAcadPlotConfiguration provides a Create and CreateRemote method to
// create instances of the default interface IAcadPlotConfiguration exposed by
// the CoClass AcadPlotConfiguration. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPlotConfiguration = class
    class function Create: IAcadPlotConfiguration;
    class function CreateRemote(const MachineName: string): IAcadPlotConfiguration;
  end;

// *********************************************************************//
// The Class CoAcadLayout provides a Create and CreateRemote method to
// create instances of the default interface IAcadLayout exposed by
// the CoClass AcadLayout. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLayout = class
    class function Create: IAcadLayout;
    class function CreateRemote(const MachineName: string): IAcadLayout;
  end;

// *********************************************************************//
// The Class CoAcadIdPair provides a Create and CreateRemote method to
// create instances of the default interface IAcadIdPair exposed by
// the CoClass AcadIdPair. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadIdPair = class
    class function Create: IAcadIdPair;
    class function CreateRemote(const MachineName: string): IAcadIdPair;
  end;

// *********************************************************************//
// The Class CoAcadHyperlinks provides a Create and CreateRemote method to
// create instances of the default interface IAcadHyperlinks exposed by
// the CoClass AcadHyperlinks. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadHyperlinks = class
    class function Create: IAcadHyperlinks;
    class function CreateRemote(const MachineName: string): IAcadHyperlinks;
  end;

// *********************************************************************//
// The Class CoAcadDictionary provides a Create and CreateRemote method to
// create instances of the default interface IAcadDictionary exposed by
// the CoClass AcadDictionary. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDictionary = class
    class function Create: IAcadDictionary;
    class function CreateRemote(const MachineName: string): IAcadDictionary;
  end;

// *********************************************************************//
// The Class CoAcadLayers provides a Create and CreateRemote method to
// create instances of the default interface IAcadLayers exposed by
// the CoClass AcadLayers. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLayers = class
    class function Create: IAcadLayers;
    class function CreateRemote(const MachineName: string): IAcadLayers;
  end;

// *********************************************************************//
// The Class CoAcadDimStyles provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimStyles exposed by
// the CoClass AcadDimStyles. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimStyles = class
    class function Create: IAcadDimStyles;
    class function CreateRemote(const MachineName: string): IAcadDimStyles;
  end;

// *********************************************************************//
// The Class CoAcadDictionaries provides a Create and CreateRemote method to
// create instances of the default interface IAcadDictionaries exposed by
// the CoClass AcadDictionaries. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDictionaries = class
    class function Create: IAcadDictionaries;
    class function CreateRemote(const MachineName: string): IAcadDictionaries;
  end;

// *********************************************************************//
// The Class CoAcadLineTypes provides a Create and CreateRemote method to
// create instances of the default interface IAcadLineTypes exposed by
// the CoClass AcadLineTypes. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLineTypes = class
    class function Create: IAcadLineTypes;
    class function CreateRemote(const MachineName: string): IAcadLineTypes;
  end;

// *********************************************************************//
// The Class CoAcadTextStyles provides a Create and CreateRemote method to
// create instances of the default interface IAcadTextStyles exposed by
// the CoClass AcadTextStyles. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadTextStyles = class
    class function Create: IAcadTextStyles;
    class function CreateRemote(const MachineName: string): IAcadTextStyles;
  end;

// *********************************************************************//
// The Class CoAcadUCSs provides a Create and CreateRemote method to
// create instances of the default interface IAcadUCSs exposed by
// the CoClass AcadUCSs. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadUCSs = class
    class function Create: IAcadUCSs;
    class function CreateRemote(const MachineName: string): IAcadUCSs;
  end;

// *********************************************************************//
// The Class CoAcadRegisteredApplications provides a Create and CreateRemote method to
// create instances of the default interface IAcadRegisteredApplications exposed by
// the CoClass AcadRegisteredApplications. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadRegisteredApplications = class
    class function Create: IAcadRegisteredApplications;
    class function CreateRemote(const MachineName: string): IAcadRegisteredApplications;
  end;

// *********************************************************************//
// The Class CoAcadViews provides a Create and CreateRemote method to
// create instances of the default interface IAcadViews exposed by
// the CoClass AcadViews. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadViews = class
    class function Create: IAcadViews;
    class function CreateRemote(const MachineName: string): IAcadViews;
  end;

// *********************************************************************//
// The Class CoAcadViewports provides a Create and CreateRemote method to
// create instances of the default interface IAcadViewports exposed by
// the CoClass AcadViewports. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadViewports = class
    class function Create: IAcadViewports;
    class function CreateRemote(const MachineName: string): IAcadViewports;
  end;

// *********************************************************************//
// The Class CoAcadGroups provides a Create and CreateRemote method to
// create instances of the default interface IAcadGroups exposed by
// the CoClass AcadGroups. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadGroups = class
    class function Create: IAcadGroups;
    class function CreateRemote(const MachineName: string): IAcadGroups;
  end;

// *********************************************************************//
// The Class CoAcadBlocks provides a Create and CreateRemote method to
// create instances of the default interface IAcadBlocks exposed by
// the CoClass AcadBlocks. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadBlocks = class
    class function Create: IAcadBlocks;
    class function CreateRemote(const MachineName: string): IAcadBlocks;
  end;

// *********************************************************************//
// The Class CoAcadLayouts provides a Create and CreateRemote method to
// create instances of the default interface IAcadLayouts exposed by
// the CoClass AcadLayouts. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLayouts = class
    class function Create: IAcadLayouts;
    class function CreateRemote(const MachineName: string): IAcadLayouts;
  end;

// *********************************************************************//
// The Class CoAcadPlotConfigurations provides a Create and CreateRemote method to
// create instances of the default interface IAcadPlotConfigurations exposed by
// the CoClass AcadPlotConfigurations. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPlotConfigurations = class
    class function Create: IAcadPlotConfigurations;
    class function CreateRemote(const MachineName: string): IAcadPlotConfigurations;
  end;

// *********************************************************************//
// The Class CoAcadEntity provides a Create and CreateRemote method to
// create instances of the default interface IAcadEntity exposed by
// the CoClass AcadEntity. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadEntity = class
    class function Create: IAcadEntity;
    class function CreateRemote(const MachineName: string): IAcadEntity;
  end;

// *********************************************************************//
// The Class CoAcadRasterImage provides a Create and CreateRemote method to
// create instances of the default interface IAcadRasterImage exposed by
// the CoClass AcadRasterImage. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadRasterImage = class
    class function Create: IAcadRasterImage;
    class function CreateRemote(const MachineName: string): IAcadRasterImage;
  end;

// *********************************************************************//
// The Class CoAcad3DFace provides a Create and CreateRemote method to
// create instances of the default interface IAcad3DFace exposed by
// the CoClass Acad3DFace. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcad3DFace = class
    class function Create: IAcad3DFace;
    class function CreateRemote(const MachineName: string): IAcad3DFace;
  end;

// *********************************************************************//
// The Class CoAcad3DPolyline provides a Create and CreateRemote method to
// create instances of the default interface IAcad3DPolyline exposed by
// the CoClass Acad3DPolyline. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcad3DPolyline = class
    class function Create: IAcad3DPolyline;
    class function CreateRemote(const MachineName: string): IAcad3DPolyline;
  end;

// *********************************************************************//
// The Class CoAcadRegion provides a Create and CreateRemote method to
// create instances of the default interface IAcadRegion exposed by
// the CoClass AcadRegion. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadRegion = class
    class function Create: IAcadRegion;
    class function CreateRemote(const MachineName: string): IAcadRegion;
  end;

// *********************************************************************//
// The Class CoAcad3DSolid provides a Create and CreateRemote method to
// create instances of the default interface IAcad3DSolid exposed by
// the CoClass Acad3DSolid. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcad3DSolid = class
    class function Create: IAcad3DSolid;
    class function CreateRemote(const MachineName: string): IAcad3DSolid;
  end;

// *********************************************************************//
// The Class CoAcadArc provides a Create and CreateRemote method to
// create instances of the default interface IAcadArc exposed by
// the CoClass AcadArc. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadArc = class
    class function Create: IAcadArc;
    class function CreateRemote(const MachineName: string): IAcadArc;
  end;

// *********************************************************************//
// The Class CoAcadAttribute provides a Create and CreateRemote method to
// create instances of the default interface IAcadAttribute exposed by
// the CoClass AcadAttribute. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadAttribute = class
    class function Create: IAcadAttribute;
    class function CreateRemote(const MachineName: string): IAcadAttribute;
  end;

// *********************************************************************//
// The Class CoAcadAttributeReference provides a Create and CreateRemote method to
// create instances of the default interface IAcadAttributeReference exposed by
// the CoClass AcadAttributeReference. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadAttributeReference = class
    class function Create: IAcadAttributeReference;
    class function CreateRemote(const MachineName: string): IAcadAttributeReference;
  end;

// *********************************************************************//
// The Class CoAcadBlockReference provides a Create and CreateRemote method to
// create instances of the default interface IAcadBlockReference exposed by
// the CoClass AcadBlockReference. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadBlockReference = class
    class function Create: IAcadBlockReference;
    class function CreateRemote(const MachineName: string): IAcadBlockReference;
  end;

// *********************************************************************//
// The Class CoAcadCircle provides a Create and CreateRemote method to
// create instances of the default interface IAcadCircle exposed by
// the CoClass AcadCircle. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadCircle = class
    class function Create: IAcadCircle;
    class function CreateRemote(const MachineName: string): IAcadCircle;
  end;

// *********************************************************************//
// The Class CoAcadEllipse provides a Create and CreateRemote method to
// create instances of the default interface IAcadEllipse exposed by
// the CoClass AcadEllipse. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadEllipse = class
    class function Create: IAcadEllipse;
    class function CreateRemote(const MachineName: string): IAcadEllipse;
  end;

// *********************************************************************//
// The Class CoAcadHatch provides a Create and CreateRemote method to
// create instances of the default interface IAcadHatch exposed by
// the CoClass AcadHatch. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadHatch = class
    class function Create: IAcadHatch;
    class function CreateRemote(const MachineName: string): IAcadHatch;
  end;

// *********************************************************************//
// The Class CoAcadLeader provides a Create and CreateRemote method to
// create instances of the default interface IAcadLeader exposed by
// the CoClass AcadLeader. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLeader = class
    class function Create: IAcadLeader;
    class function CreateRemote(const MachineName: string): IAcadLeader;
  end;

// *********************************************************************//
// The Class CoAcadLWPolyline provides a Create and CreateRemote method to
// create instances of the default interface IAcadLWPolyline exposed by
// the CoClass AcadLWPolyline. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLWPolyline = class
    class function Create: IAcadLWPolyline;
    class function CreateRemote(const MachineName: string): IAcadLWPolyline;
  end;

// *********************************************************************//
// The Class CoAcadLine provides a Create and CreateRemote method to
// create instances of the default interface IAcadLine exposed by
// the CoClass AcadLine. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLine = class
    class function Create: IAcadLine;
    class function CreateRemote(const MachineName: string): IAcadLine;
  end;

// *********************************************************************//
// The Class CoAcadMText provides a Create and CreateRemote method to
// create instances of the default interface IAcadMText exposed by
// the CoClass AcadMText. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMText = class
    class function Create: IAcadMText;
    class function CreateRemote(const MachineName: string): IAcadMText;
  end;

// *********************************************************************//
// The Class CoAcadPoint provides a Create and CreateRemote method to
// create instances of the default interface IAcadPoint exposed by
// the CoClass AcadPoint. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPoint = class
    class function Create: IAcadPoint;
    class function CreateRemote(const MachineName: string): IAcadPoint;
  end;

// *********************************************************************//
// The Class CoAcadPolyline provides a Create and CreateRemote method to
// create instances of the default interface IAcadPolyline exposed by
// the CoClass AcadPolyline. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPolyline = class
    class function Create: IAcadPolyline;
    class function CreateRemote(const MachineName: string): IAcadPolyline;
  end;

// *********************************************************************//
// The Class CoAcadPolygonMesh provides a Create and CreateRemote method to
// create instances of the default interface IAcadPolygonMesh exposed by
// the CoClass AcadPolygonMesh. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPolygonMesh = class
    class function Create: IAcadPolygonMesh;
    class function CreateRemote(const MachineName: string): IAcadPolygonMesh;
  end;

// *********************************************************************//
// The Class CoAcadRay provides a Create and CreateRemote method to
// create instances of the default interface IAcadRay exposed by
// the CoClass AcadRay. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadRay = class
    class function Create: IAcadRay;
    class function CreateRemote(const MachineName: string): IAcadRay;
  end;

// *********************************************************************//
// The Class CoAcadShape provides a Create and CreateRemote method to
// create instances of the default interface IAcadShape exposed by
// the CoClass AcadShape. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadShape = class
    class function Create: IAcadShape;
    class function CreateRemote(const MachineName: string): IAcadShape;
  end;

// *********************************************************************//
// The Class CoAcadSolid provides a Create and CreateRemote method to
// create instances of the default interface IAcadSolid exposed by
// the CoClass AcadSolid. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadSolid = class
    class function Create: IAcadSolid;
    class function CreateRemote(const MachineName: string): IAcadSolid;
  end;

// *********************************************************************//
// The Class CoAcadSpline provides a Create and CreateRemote method to
// create instances of the default interface IAcadSpline exposed by
// the CoClass AcadSpline. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadSpline = class
    class function Create: IAcadSpline;
    class function CreateRemote(const MachineName: string): IAcadSpline;
  end;

// *********************************************************************//
// The Class CoAcadText provides a Create and CreateRemote method to
// create instances of the default interface IAcadText exposed by
// the CoClass AcadText. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadText = class
    class function Create: IAcadText;
    class function CreateRemote(const MachineName: string): IAcadText;
  end;

// *********************************************************************//
// The Class CoAcadTolerance provides a Create and CreateRemote method to
// create instances of the default interface IAcadTolerance exposed by
// the CoClass AcadTolerance. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadTolerance = class
    class function Create: IAcadTolerance;
    class function CreateRemote(const MachineName: string): IAcadTolerance;
  end;

// *********************************************************************//
// The Class CoAcadTrace provides a Create and CreateRemote method to
// create instances of the default interface IAcadTrace exposed by
// the CoClass AcadTrace. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadTrace = class
    class function Create: IAcadTrace;
    class function CreateRemote(const MachineName: string): IAcadTrace;
  end;

// *********************************************************************//
// The Class CoAcadXline provides a Create and CreateRemote method to
// create instances of the default interface IAcadXline exposed by
// the CoClass AcadXline. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadXline = class
    class function Create: IAcadXline;
    class function CreateRemote(const MachineName: string): IAcadXline;
  end;

// *********************************************************************//
// The Class CoAcadPViewport provides a Create and CreateRemote method to
// create instances of the default interface IAcadPViewport exposed by
// the CoClass AcadPViewport. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPViewport = class
    class function Create: IAcadPViewport;
    class function CreateRemote(const MachineName: string): IAcadPViewport;
  end;

// *********************************************************************//
// The Class CoAcadMInsertBlock provides a Create and CreateRemote method to
// create instances of the default interface IAcadMInsertBlock exposed by
// the CoClass AcadMInsertBlock. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMInsertBlock = class
    class function Create: IAcadMInsertBlock;
    class function CreateRemote(const MachineName: string): IAcadMInsertBlock;
  end;

// *********************************************************************//
// The Class CoAcadPolyfaceMesh provides a Create and CreateRemote method to
// create instances of the default interface IAcadPolyfaceMesh exposed by
// the CoClass AcadPolyfaceMesh. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPolyfaceMesh = class
    class function Create: IAcadPolyfaceMesh;
    class function CreateRemote(const MachineName: string): IAcadPolyfaceMesh;
  end;

// *********************************************************************//
// The Class CoAcadMLine provides a Create and CreateRemote method to
// create instances of the default interface IAcadMLine exposed by
// the CoClass AcadMLine. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMLine = class
    class function Create: IAcadMLine;
    class function CreateRemote(const MachineName: string): IAcadMLine;
  end;

// *********************************************************************//
// The Class CoAcadExternalReference provides a Create and CreateRemote method to
// create instances of the default interface IAcadExternalReference exposed by
// the CoClass AcadExternalReference. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadExternalReference = class
    class function Create: IAcadExternalReference;
    class function CreateRemote(const MachineName: string): IAcadExternalReference;
  end;

// *********************************************************************//
// The Class CoAcadDimension provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimension exposed by
// the CoClass AcadDimension. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimension = class
    class function Create: IAcadDimension;
    class function CreateRemote(const MachineName: string): IAcadDimension;
  end;

// *********************************************************************//
// The Class CoAcadDimAligned provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimAligned exposed by
// the CoClass AcadDimAligned. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimAligned = class
    class function Create: IAcadDimAligned;
    class function CreateRemote(const MachineName: string): IAcadDimAligned;
  end;

// *********************************************************************//
// The Class CoAcadDimAngular provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimAngular exposed by
// the CoClass AcadDimAngular. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimAngular = class
    class function Create: IAcadDimAngular;
    class function CreateRemote(const MachineName: string): IAcadDimAngular;
  end;

// *********************************************************************//
// The Class CoAcadDimDiametric provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimDiametric exposed by
// the CoClass AcadDimDiametric. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimDiametric = class
    class function Create: IAcadDimDiametric;
    class function CreateRemote(const MachineName: string): IAcadDimDiametric;
  end;

// *********************************************************************//
// The Class CoAcadDimOrdinate provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimOrdinate exposed by
// the CoClass AcadDimOrdinate. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimOrdinate = class
    class function Create: IAcadDimOrdinate;
    class function CreateRemote(const MachineName: string): IAcadDimOrdinate;
  end;

// *********************************************************************//
// The Class CoAcadDimRadial provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimRadial exposed by
// the CoClass AcadDimRadial. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimRadial = class
    class function Create: IAcadDimRadial;
    class function CreateRemote(const MachineName: string): IAcadDimRadial;
  end;

// *********************************************************************//
// The Class CoAcadDimRotated provides a Create and CreateRemote method to
// create instances of the default interface IAcadDimRotated exposed by
// the CoClass AcadDimRotated. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDimRotated = class
    class function Create: IAcadDimRotated;
    class function CreateRemote(const MachineName: string): IAcadDimRotated;
  end;

// *********************************************************************//
// The Class CoAcadDim3PointAngular provides a Create and CreateRemote method to
// create instances of the default interface IAcadDim3PointAngular exposed by
// the CoClass AcadDim3PointAngular. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDim3PointAngular = class
    class function Create: IAcadDim3PointAngular;
    class function CreateRemote(const MachineName: string): IAcadDim3PointAngular;
  end;

// *********************************************************************//
// The Class CoAcadBlock provides a Create and CreateRemote method to
// create instances of the default interface IAcadBlock exposed by
// the CoClass AcadBlock. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadBlock = class
    class function Create: IAcadBlock;
    class function CreateRemote(const MachineName: string): IAcadBlock;
  end;

// *********************************************************************//
// The Class CoAcadModelSpace provides a Create and CreateRemote method to
// create instances of the default interface IAcadModelSpace exposed by
// the CoClass AcadModelSpace. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadModelSpace = class
    class function Create: IAcadModelSpace;
    class function CreateRemote(const MachineName: string): IAcadModelSpace;
  end;

// *********************************************************************//
// The Class CoAcadPaperSpace provides a Create and CreateRemote method to
// create instances of the default interface IAcadPaperSpace exposed by
// the CoClass AcadPaperSpace. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPaperSpace = class
    class function Create: IAcadPaperSpace;
    class function CreateRemote(const MachineName: string): IAcadPaperSpace;
  end;

// *********************************************************************//
// The Class CoAcadDatabasePreferences provides a Create and CreateRemote method to
// create instances of the default interface IAcadDatabasePreferences exposed by
// the CoClass AcadDatabasePreferences. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDatabasePreferences = class
    class function Create: IAcadDatabasePreferences;
    class function CreateRemote(const MachineName: string): IAcadDatabasePreferences;
  end;

// *********************************************************************//
// The Class CoAcadDatabase provides a Create and CreateRemote method to
// create instances of the default interface IAcadDatabase exposed by
// the CoClass AcadDatabase. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDatabase = class
    class function Create: IAcadDatabase;
    class function CreateRemote(const MachineName: string): IAcadDatabase;
  end;

// *********************************************************************//
// The Class CoAcadState provides a Create and CreateRemote method to
// create instances of the default interface IAcadState exposed by
// the CoClass AcadState. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadState = class
    class function Create: IAcadState;
    class function CreateRemote(const MachineName: string): IAcadState;
  end;

// *********************************************************************//
// The Class CoAcadApplication provides a Create and CreateRemote method to
// create instances of the default interface IAcadApplication exposed by
// the CoClass AcadApplication. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadApplication = class
    class function Create: IAcadApplication;
    class function CreateRemote(const MachineName: string): IAcadApplication;
  end;

// *********************************************************************//
// The Class CoAcadSelectionSet provides a Create and CreateRemote method to
// create instances of the default interface IAcadSelectionSet exposed by
// the CoClass AcadSelectionSet. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadSelectionSet = class
    class function Create: IAcadSelectionSet;
    class function CreateRemote(const MachineName: string): IAcadSelectionSet;
  end;

// *********************************************************************//
// The Class CoAcadSelectionSets provides a Create and CreateRemote method to
// create instances of the default interface IAcadSelectionSets exposed by
// the CoClass AcadSelectionSets. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadSelectionSets = class
    class function Create: IAcadSelectionSets;
    class function CreateRemote(const MachineName: string): IAcadSelectionSets;
  end;

// *********************************************************************//
// The Class CoAcadPlot provides a Create and CreateRemote method to
// create instances of the default interface IAcadPlot exposed by
// the CoClass AcadPlot. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPlot = class
    class function Create: IAcadPlot;
    class function CreateRemote(const MachineName: string): IAcadPlot;
  end;

// *********************************************************************//
// The Class CoAcadPreferences provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferences exposed by
// the CoClass AcadPreferences. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferences = class
    class function Create: IAcadPreferences;
    class function CreateRemote(const MachineName: string): IAcadPreferences;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesDrafting provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesDrafting exposed by
// the CoClass AcadPreferencesDrafting. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesDrafting = class
    class function Create: IAcadPreferencesDrafting;
    class function CreateRemote(const MachineName: string): IAcadPreferencesDrafting;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesDisplay provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesDisplay exposed by
// the CoClass AcadPreferencesDisplay. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesDisplay = class
    class function Create: IAcadPreferencesDisplay;
    class function CreateRemote(const MachineName: string): IAcadPreferencesDisplay;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesFiles provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesFiles exposed by
// the CoClass AcadPreferencesFiles. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesFiles = class
    class function Create: IAcadPreferencesFiles;
    class function CreateRemote(const MachineName: string): IAcadPreferencesFiles;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesOpenSave provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesOpenSave exposed by
// the CoClass AcadPreferencesOpenSave. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesOpenSave = class
    class function Create: IAcadPreferencesOpenSave;
    class function CreateRemote(const MachineName: string): IAcadPreferencesOpenSave;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesOutput provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesOutput exposed by
// the CoClass AcadPreferencesOutput. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesOutput = class
    class function Create: IAcadPreferencesOutput;
    class function CreateRemote(const MachineName: string): IAcadPreferencesOutput;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesProfiles provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesProfiles exposed by
// the CoClass AcadPreferencesProfiles. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesProfiles = class
    class function Create: IAcadPreferencesProfiles;
    class function CreateRemote(const MachineName: string): IAcadPreferencesProfiles;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesSelection provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesSelection exposed by
// the CoClass AcadPreferencesSelection. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesSelection = class
    class function Create: IAcadPreferencesSelection;
    class function CreateRemote(const MachineName: string): IAcadPreferencesSelection;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesSystem provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesSystem exposed by
// the CoClass AcadPreferencesSystem. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesSystem = class
    class function Create: IAcadPreferencesSystem;
    class function CreateRemote(const MachineName: string): IAcadPreferencesSystem;
  end;

// *********************************************************************//
// The Class CoAcadPreferencesUser provides a Create and CreateRemote method to
// create instances of the default interface IAcadPreferencesUser exposed by
// the CoClass AcadPreferencesUser. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPreferencesUser = class
    class function Create: IAcadPreferencesUser;
    class function CreateRemote(const MachineName: string): IAcadPreferencesUser;
  end;

// *********************************************************************//
// The Class CoAcadMenuGroups provides a Create and CreateRemote method to
// create instances of the default interface IAcadMenuGroups exposed by
// the CoClass AcadMenuGroups. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMenuGroups = class
    class function Create: IAcadMenuGroups;
    class function CreateRemote(const MachineName: string): IAcadMenuGroups;
  end;

// *********************************************************************//
// The Class CoAcadMenuGroup provides a Create and CreateRemote method to
// create instances of the default interface IAcadMenuGroup exposed by
// the CoClass AcadMenuGroup. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMenuGroup = class
    class function Create: IAcadMenuGroup;
    class function CreateRemote(const MachineName: string): IAcadMenuGroup;
  end;

// *********************************************************************//
// The Class CoAcadMenuBar provides a Create and CreateRemote method to
// create instances of the default interface IAcadMenuBar exposed by
// the CoClass AcadMenuBar. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadMenuBar = class
    class function Create: IAcadMenuBar;
    class function CreateRemote(const MachineName: string): IAcadMenuBar;
  end;

// *********************************************************************//
// The Class CoAcadPopupMenus provides a Create and CreateRemote method to
// create instances of the default interface IAcadPopupMenus exposed by
// the CoClass AcadPopupMenus. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPopupMenus = class
    class function Create: IAcadPopupMenus;
    class function CreateRemote(const MachineName: string): IAcadPopupMenus;
  end;

// *********************************************************************//
// The Class CoAcadPopupMenu provides a Create and CreateRemote method to
// create instances of the default interface IAcadPopupMenu exposed by
// the CoClass AcadPopupMenu. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPopupMenu = class
    class function Create: IAcadPopupMenu;
    class function CreateRemote(const MachineName: string): IAcadPopupMenu;
  end;

// *********************************************************************//
// The Class CoAcadPopupMenuItem provides a Create and CreateRemote method to
// create instances of the default interface IAcadPopupMenuItem exposed by
// the CoClass AcadPopupMenuItem. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadPopupMenuItem = class
    class function Create: IAcadPopupMenuItem;
    class function CreateRemote(const MachineName: string): IAcadPopupMenuItem;
  end;

// *********************************************************************//
// The Class CoAcadUtility provides a Create and CreateRemote method to
// create instances of the default interface IAcadUtility exposed by
// the CoClass AcadUtility. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadUtility = class
    class function Create: IAcadUtility;
    class function CreateRemote(const MachineName: string): IAcadUtility;
  end;

// *********************************************************************//
// The Class CoAcadDocument provides a Create and CreateRemote method to
// create instances of the default interface IAcadDocument exposed by
// the CoClass AcadDocument. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDocument = class
    class function Create: IAcadDocument;
    class function CreateRemote(const MachineName: string): IAcadDocument;
  end;

// *********************************************************************//
// The Class CoAcadDocuments provides a Create and CreateRemote method to
// create instances of the default interface IAcadDocuments exposed by
// the CoClass AcadDocuments. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadDocuments = class
    class function Create: IAcadDocuments;
    class function CreateRemote(const MachineName: string): IAcadDocuments;
  end;

// *********************************************************************//
// The Class CoAcadToolbars provides a Create and CreateRemote method to
// create instances of the default interface IAcadToolbars exposed by
// the CoClass AcadToolbars. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadToolbars = class
    class function Create: IAcadToolbars;
    class function CreateRemote(const MachineName: string): IAcadToolbars;
  end;

// *********************************************************************//
// The Class CoAcadToolbar provides a Create and CreateRemote method to
// create instances of the default interface IAcadToolbar exposed by
// the CoClass AcadToolbar. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadToolbar = class
    class function Create: IAcadToolbar;
    class function CreateRemote(const MachineName: string): IAcadToolbar;
  end;

// *********************************************************************//
// The Class CoAcadToolbarItem provides a Create and CreateRemote method to
// create instances of the default interface IAcadToolbarItem exposed by
// the CoClass AcadToolbarItem. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadToolbarItem = class
    class function Create: IAcadToolbarItem;
    class function CreateRemote(const MachineName: string): IAcadToolbarItem;
  end;

// *********************************************************************//
// The Class CoAcadLayerStateManager provides a Create and CreateRemote method to
// create instances of the default interface IAcadLayerStateManager exposed by
// the CoClass AcadLayerStateManager. The functions are intended to be used by
// clients wishing to automate the CoClass objects exposed by the
// server of this typelibrary.
// *********************************************************************//
  CoAcadLayerStateManager = class
    class function Create: IAcadLayerStateManager;
    class function CreateRemote(const MachineName: string): IAcadLayerStateManager;
  end;

implementation

uses ComObj;

class function CoAcadHyperlink.Create: IAcadHyperlink;
begin
  Result := CreateComObject(CLASS_AcadHyperlink) as IAcadHyperlink;
end;

class function CoAcadHyperlink.CreateRemote(const MachineName: string): IAcadHyperlink;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadHyperlink) as IAcadHyperlink;
end;

class function CoAcadObject.Create: IAcadObject;
begin
  Result := CreateComObject(CLASS_AcadObject) as IAcadObject;
end;

class function CoAcadObject.CreateRemote(const MachineName: string): IAcadObject;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadObject) as IAcadObject;
end;

class function CoAcadXRecord.Create: IAcadXRecord;
begin
  Result := CreateComObject(CLASS_AcadXRecord) as IAcadXRecord;
end;

class function CoAcadXRecord.CreateRemote(const MachineName: string): IAcadXRecord;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadXRecord) as IAcadXRecord;
end;

class function CoAcadDimStyle.Create: IAcadDimStyle;
begin
  Result := CreateComObject(CLASS_AcadDimStyle) as IAcadDimStyle;
end;

class function CoAcadDimStyle.CreateRemote(const MachineName: string): IAcadDimStyle;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimStyle) as IAcadDimStyle;
end;

class function CoAcadLayer.Create: IAcadLayer;
begin
  Result := CreateComObject(CLASS_AcadLayer) as IAcadLayer;
end;

class function CoAcadLayer.CreateRemote(const MachineName: string): IAcadLayer;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLayer) as IAcadLayer;
end;

class function CoAcadLineType.Create: IAcadLineType;
begin
  Result := CreateComObject(CLASS_AcadLineType) as IAcadLineType;
end;

class function CoAcadLineType.CreateRemote(const MachineName: string): IAcadLineType;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLineType) as IAcadLineType;
end;

class function CoAcadRegisteredApplication.Create: IAcadRegisteredApplication;
begin
  Result := CreateComObject(CLASS_AcadRegisteredApplication) as IAcadRegisteredApplication;
end;

class function CoAcadRegisteredApplication.CreateRemote(const MachineName: string): IAcadRegisteredApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadRegisteredApplication) as IAcadRegisteredApplication;
end;

class function CoAcadTextStyle.Create: IAcadTextStyle;
begin
  Result := CreateComObject(CLASS_AcadTextStyle) as IAcadTextStyle;
end;

class function CoAcadTextStyle.CreateRemote(const MachineName: string): IAcadTextStyle;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadTextStyle) as IAcadTextStyle;
end;

class function CoAcadUCS.Create: IAcadUCS;
begin
  Result := CreateComObject(CLASS_AcadUCS) as IAcadUCS;
end;

class function CoAcadUCS.CreateRemote(const MachineName: string): IAcadUCS;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadUCS) as IAcadUCS;
end;

class function CoAcadView.Create: IAcadView;
begin
  Result := CreateComObject(CLASS_AcadView) as IAcadView;
end;

class function CoAcadView.CreateRemote(const MachineName: string): IAcadView;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadView) as IAcadView;
end;

class function CoAcadViewport.Create: IAcadViewport;
begin
  Result := CreateComObject(CLASS_AcadViewport) as IAcadViewport;
end;

class function CoAcadViewport.CreateRemote(const MachineName: string): IAcadViewport;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadViewport) as IAcadViewport;
end;

class function CoAcadGroup.Create: IAcadGroup;
begin
  Result := CreateComObject(CLASS_AcadGroup) as IAcadGroup;
end;

class function CoAcadGroup.CreateRemote(const MachineName: string): IAcadGroup;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadGroup) as IAcadGroup;
end;

class function CoAcadPlotConfiguration.Create: IAcadPlotConfiguration;
begin
  Result := CreateComObject(CLASS_AcadPlotConfiguration) as IAcadPlotConfiguration;
end;

class function CoAcadPlotConfiguration.CreateRemote(const MachineName: string): IAcadPlotConfiguration;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPlotConfiguration) as IAcadPlotConfiguration;
end;

class function CoAcadLayout.Create: IAcadLayout;
begin
  Result := CreateComObject(CLASS_AcadLayout) as IAcadLayout;
end;

class function CoAcadLayout.CreateRemote(const MachineName: string): IAcadLayout;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLayout) as IAcadLayout;
end;

class function CoAcadIdPair.Create: IAcadIdPair;
begin
  Result := CreateComObject(CLASS_AcadIdPair) as IAcadIdPair;
end;

class function CoAcadIdPair.CreateRemote(const MachineName: string): IAcadIdPair;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadIdPair) as IAcadIdPair;
end;

class function CoAcadHyperlinks.Create: IAcadHyperlinks;
begin
  Result := CreateComObject(CLASS_AcadHyperlinks) as IAcadHyperlinks;
end;

class function CoAcadHyperlinks.CreateRemote(const MachineName: string): IAcadHyperlinks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadHyperlinks) as IAcadHyperlinks;
end;

class function CoAcadDictionary.Create: IAcadDictionary;
begin
  Result := CreateComObject(CLASS_AcadDictionary) as IAcadDictionary;
end;

class function CoAcadDictionary.CreateRemote(const MachineName: string): IAcadDictionary;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDictionary) as IAcadDictionary;
end;

class function CoAcadLayers.Create: IAcadLayers;
begin
  Result := CreateComObject(CLASS_AcadLayers) as IAcadLayers;
end;

class function CoAcadLayers.CreateRemote(const MachineName: string): IAcadLayers;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLayers) as IAcadLayers;
end;

class function CoAcadDimStyles.Create: IAcadDimStyles;
begin
  Result := CreateComObject(CLASS_AcadDimStyles) as IAcadDimStyles;
end;

class function CoAcadDimStyles.CreateRemote(const MachineName: string): IAcadDimStyles;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimStyles) as IAcadDimStyles;
end;

class function CoAcadDictionaries.Create: IAcadDictionaries;
begin
  Result := CreateComObject(CLASS_AcadDictionaries) as IAcadDictionaries;
end;

class function CoAcadDictionaries.CreateRemote(const MachineName: string): IAcadDictionaries;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDictionaries) as IAcadDictionaries;
end;

class function CoAcadLineTypes.Create: IAcadLineTypes;
begin
  Result := CreateComObject(CLASS_AcadLineTypes) as IAcadLineTypes;
end;

class function CoAcadLineTypes.CreateRemote(const MachineName: string): IAcadLineTypes;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLineTypes) as IAcadLineTypes;
end;

class function CoAcadTextStyles.Create: IAcadTextStyles;
begin
  Result := CreateComObject(CLASS_AcadTextStyles) as IAcadTextStyles;
end;

class function CoAcadTextStyles.CreateRemote(const MachineName: string): IAcadTextStyles;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadTextStyles) as IAcadTextStyles;
end;

class function CoAcadUCSs.Create: IAcadUCSs;
begin
  Result := CreateComObject(CLASS_AcadUCSs) as IAcadUCSs;
end;

class function CoAcadUCSs.CreateRemote(const MachineName: string): IAcadUCSs;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadUCSs) as IAcadUCSs;
end;

class function CoAcadRegisteredApplications.Create: IAcadRegisteredApplications;
begin
  Result := CreateComObject(CLASS_AcadRegisteredApplications) as IAcadRegisteredApplications;
end;

class function CoAcadRegisteredApplications.CreateRemote(const MachineName: string): IAcadRegisteredApplications;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadRegisteredApplications) as IAcadRegisteredApplications;
end;

class function CoAcadViews.Create: IAcadViews;
begin
  Result := CreateComObject(CLASS_AcadViews) as IAcadViews;
end;

class function CoAcadViews.CreateRemote(const MachineName: string): IAcadViews;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadViews) as IAcadViews;
end;

class function CoAcadViewports.Create: IAcadViewports;
begin
  Result := CreateComObject(CLASS_AcadViewports) as IAcadViewports;
end;

class function CoAcadViewports.CreateRemote(const MachineName: string): IAcadViewports;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadViewports) as IAcadViewports;
end;

class function CoAcadGroups.Create: IAcadGroups;
begin
  Result := CreateComObject(CLASS_AcadGroups) as IAcadGroups;
end;

class function CoAcadGroups.CreateRemote(const MachineName: string): IAcadGroups;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadGroups) as IAcadGroups;
end;

class function CoAcadBlocks.Create: IAcadBlocks;
begin
  Result := CreateComObject(CLASS_AcadBlocks) as IAcadBlocks;
end;

class function CoAcadBlocks.CreateRemote(const MachineName: string): IAcadBlocks;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadBlocks) as IAcadBlocks;
end;

class function CoAcadLayouts.Create: IAcadLayouts;
begin
  Result := CreateComObject(CLASS_AcadLayouts) as IAcadLayouts;
end;

class function CoAcadLayouts.CreateRemote(const MachineName: string): IAcadLayouts;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLayouts) as IAcadLayouts;
end;

class function CoAcadPlotConfigurations.Create: IAcadPlotConfigurations;
begin
  Result := CreateComObject(CLASS_AcadPlotConfigurations) as IAcadPlotConfigurations;
end;

class function CoAcadPlotConfigurations.CreateRemote(const MachineName: string): IAcadPlotConfigurations;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPlotConfigurations) as IAcadPlotConfigurations;
end;

class function CoAcadEntity.Create: IAcadEntity;
begin
  Result := CreateComObject(CLASS_AcadEntity) as IAcadEntity;
end;

class function CoAcadEntity.CreateRemote(const MachineName: string): IAcadEntity;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadEntity) as IAcadEntity;
end;

class function CoAcadRasterImage.Create: IAcadRasterImage;
begin
  Result := CreateComObject(CLASS_AcadRasterImage) as IAcadRasterImage;
end;

class function CoAcadRasterImage.CreateRemote(const MachineName: string): IAcadRasterImage;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadRasterImage) as IAcadRasterImage;
end;

class function CoAcad3DFace.Create: IAcad3DFace;
begin
  Result := CreateComObject(CLASS_Acad3DFace) as IAcad3DFace;
end;

class function CoAcad3DFace.CreateRemote(const MachineName: string): IAcad3DFace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Acad3DFace) as IAcad3DFace;
end;

class function CoAcad3DPolyline.Create: IAcad3DPolyline;
begin
  Result := CreateComObject(CLASS_Acad3DPolyline) as IAcad3DPolyline;
end;

class function CoAcad3DPolyline.CreateRemote(const MachineName: string): IAcad3DPolyline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Acad3DPolyline) as IAcad3DPolyline;
end;

class function CoAcadRegion.Create: IAcadRegion;
begin
  Result := CreateComObject(CLASS_AcadRegion) as IAcadRegion;
end;

class function CoAcadRegion.CreateRemote(const MachineName: string): IAcadRegion;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadRegion) as IAcadRegion;
end;

class function CoAcad3DSolid.Create: IAcad3DSolid;
begin
  Result := CreateComObject(CLASS_Acad3DSolid) as IAcad3DSolid;
end;

class function CoAcad3DSolid.CreateRemote(const MachineName: string): IAcad3DSolid;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_Acad3DSolid) as IAcad3DSolid;
end;

class function CoAcadArc.Create: IAcadArc;
begin
  Result := CreateComObject(CLASS_AcadArc) as IAcadArc;
end;

class function CoAcadArc.CreateRemote(const MachineName: string): IAcadArc;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadArc) as IAcadArc;
end;

class function CoAcadAttribute.Create: IAcadAttribute;
begin
  Result := CreateComObject(CLASS_AcadAttribute) as IAcadAttribute;
end;

class function CoAcadAttribute.CreateRemote(const MachineName: string): IAcadAttribute;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadAttribute) as IAcadAttribute;
end;

class function CoAcadAttributeReference.Create: IAcadAttributeReference;
begin
  Result := CreateComObject(CLASS_AcadAttributeReference) as IAcadAttributeReference;
end;

class function CoAcadAttributeReference.CreateRemote(const MachineName: string): IAcadAttributeReference;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadAttributeReference) as IAcadAttributeReference;
end;

class function CoAcadBlockReference.Create: IAcadBlockReference;
begin
  Result := CreateComObject(CLASS_AcadBlockReference) as IAcadBlockReference;
end;

class function CoAcadBlockReference.CreateRemote(const MachineName: string): IAcadBlockReference;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadBlockReference) as IAcadBlockReference;
end;

class function CoAcadCircle.Create: IAcadCircle;
begin
  Result := CreateComObject(CLASS_AcadCircle) as IAcadCircle;
end;

class function CoAcadCircle.CreateRemote(const MachineName: string): IAcadCircle;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadCircle) as IAcadCircle;
end;

class function CoAcadEllipse.Create: IAcadEllipse;
begin
  Result := CreateComObject(CLASS_AcadEllipse) as IAcadEllipse;
end;

class function CoAcadEllipse.CreateRemote(const MachineName: string): IAcadEllipse;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadEllipse) as IAcadEllipse;
end;

class function CoAcadHatch.Create: IAcadHatch;
begin
  Result := CreateComObject(CLASS_AcadHatch) as IAcadHatch;
end;

class function CoAcadHatch.CreateRemote(const MachineName: string): IAcadHatch;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadHatch) as IAcadHatch;
end;

class function CoAcadLeader.Create: IAcadLeader;
begin
  Result := CreateComObject(CLASS_AcadLeader) as IAcadLeader;
end;

class function CoAcadLeader.CreateRemote(const MachineName: string): IAcadLeader;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLeader) as IAcadLeader;
end;

class function CoAcadLWPolyline.Create: IAcadLWPolyline;
begin
  Result := CreateComObject(CLASS_AcadLWPolyline) as IAcadLWPolyline;
end;

class function CoAcadLWPolyline.CreateRemote(const MachineName: string): IAcadLWPolyline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLWPolyline) as IAcadLWPolyline;
end;

class function CoAcadLine.Create: IAcadLine;
begin
  Result := CreateComObject(CLASS_AcadLine) as IAcadLine;
end;

class function CoAcadLine.CreateRemote(const MachineName: string): IAcadLine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLine) as IAcadLine;
end;

class function CoAcadMText.Create: IAcadMText;
begin
  Result := CreateComObject(CLASS_AcadMText) as IAcadMText;
end;

class function CoAcadMText.CreateRemote(const MachineName: string): IAcadMText;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMText) as IAcadMText;
end;

class function CoAcadPoint.Create: IAcadPoint;
begin
  Result := CreateComObject(CLASS_AcadPoint) as IAcadPoint;
end;

class function CoAcadPoint.CreateRemote(const MachineName: string): IAcadPoint;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPoint) as IAcadPoint;
end;

class function CoAcadPolyline.Create: IAcadPolyline;
begin
  Result := CreateComObject(CLASS_AcadPolyline) as IAcadPolyline;
end;

class function CoAcadPolyline.CreateRemote(const MachineName: string): IAcadPolyline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPolyline) as IAcadPolyline;
end;

class function CoAcadPolygonMesh.Create: IAcadPolygonMesh;
begin
  Result := CreateComObject(CLASS_AcadPolygonMesh) as IAcadPolygonMesh;
end;

class function CoAcadPolygonMesh.CreateRemote(const MachineName: string): IAcadPolygonMesh;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPolygonMesh) as IAcadPolygonMesh;
end;

class function CoAcadRay.Create: IAcadRay;
begin
  Result := CreateComObject(CLASS_AcadRay) as IAcadRay;
end;

class function CoAcadRay.CreateRemote(const MachineName: string): IAcadRay;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadRay) as IAcadRay;
end;

class function CoAcadShape.Create: IAcadShape;
begin
  Result := CreateComObject(CLASS_AcadShape) as IAcadShape;
end;

class function CoAcadShape.CreateRemote(const MachineName: string): IAcadShape;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadShape) as IAcadShape;
end;

class function CoAcadSolid.Create: IAcadSolid;
begin
  Result := CreateComObject(CLASS_AcadSolid) as IAcadSolid;
end;

class function CoAcadSolid.CreateRemote(const MachineName: string): IAcadSolid;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadSolid) as IAcadSolid;
end;

class function CoAcadSpline.Create: IAcadSpline;
begin
  Result := CreateComObject(CLASS_AcadSpline) as IAcadSpline;
end;

class function CoAcadSpline.CreateRemote(const MachineName: string): IAcadSpline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadSpline) as IAcadSpline;
end;

class function CoAcadText.Create: IAcadText;
begin
  Result := CreateComObject(CLASS_AcadText) as IAcadText;
end;

class function CoAcadText.CreateRemote(const MachineName: string): IAcadText;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadText) as IAcadText;
end;

class function CoAcadTolerance.Create: IAcadTolerance;
begin
  Result := CreateComObject(CLASS_AcadTolerance) as IAcadTolerance;
end;

class function CoAcadTolerance.CreateRemote(const MachineName: string): IAcadTolerance;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadTolerance) as IAcadTolerance;
end;

class function CoAcadTrace.Create: IAcadTrace;
begin
  Result := CreateComObject(CLASS_AcadTrace) as IAcadTrace;
end;

class function CoAcadTrace.CreateRemote(const MachineName: string): IAcadTrace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadTrace) as IAcadTrace;
end;

class function CoAcadXline.Create: IAcadXline;
begin
  Result := CreateComObject(CLASS_AcadXline) as IAcadXline;
end;

class function CoAcadXline.CreateRemote(const MachineName: string): IAcadXline;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadXline) as IAcadXline;
end;

class function CoAcadPViewport.Create: IAcadPViewport;
begin
  Result := CreateComObject(CLASS_AcadPViewport) as IAcadPViewport;
end;

class function CoAcadPViewport.CreateRemote(const MachineName: string): IAcadPViewport;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPViewport) as IAcadPViewport;
end;

class function CoAcadMInsertBlock.Create: IAcadMInsertBlock;
begin
  Result := CreateComObject(CLASS_AcadMInsertBlock) as IAcadMInsertBlock;
end;

class function CoAcadMInsertBlock.CreateRemote(const MachineName: string): IAcadMInsertBlock;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMInsertBlock) as IAcadMInsertBlock;
end;

class function CoAcadPolyfaceMesh.Create: IAcadPolyfaceMesh;
begin
  Result := CreateComObject(CLASS_AcadPolyfaceMesh) as IAcadPolyfaceMesh;
end;

class function CoAcadPolyfaceMesh.CreateRemote(const MachineName: string): IAcadPolyfaceMesh;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPolyfaceMesh) as IAcadPolyfaceMesh;
end;

class function CoAcadMLine.Create: IAcadMLine;
begin
  Result := CreateComObject(CLASS_AcadMLine) as IAcadMLine;
end;

class function CoAcadMLine.CreateRemote(const MachineName: string): IAcadMLine;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMLine) as IAcadMLine;
end;

class function CoAcadExternalReference.Create: IAcadExternalReference;
begin
  Result := CreateComObject(CLASS_AcadExternalReference) as IAcadExternalReference;
end;

class function CoAcadExternalReference.CreateRemote(const MachineName: string): IAcadExternalReference;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadExternalReference) as IAcadExternalReference;
end;

class function CoAcadDimension.Create: IAcadDimension;
begin
  Result := CreateComObject(CLASS_AcadDimension) as IAcadDimension;
end;

class function CoAcadDimension.CreateRemote(const MachineName: string): IAcadDimension;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimension) as IAcadDimension;
end;

class function CoAcadDimAligned.Create: IAcadDimAligned;
begin
  Result := CreateComObject(CLASS_AcadDimAligned) as IAcadDimAligned;
end;

class function CoAcadDimAligned.CreateRemote(const MachineName: string): IAcadDimAligned;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimAligned) as IAcadDimAligned;
end;

class function CoAcadDimAngular.Create: IAcadDimAngular;
begin
  Result := CreateComObject(CLASS_AcadDimAngular) as IAcadDimAngular;
end;

class function CoAcadDimAngular.CreateRemote(const MachineName: string): IAcadDimAngular;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimAngular) as IAcadDimAngular;
end;

class function CoAcadDimDiametric.Create: IAcadDimDiametric;
begin
  Result := CreateComObject(CLASS_AcadDimDiametric) as IAcadDimDiametric;
end;

class function CoAcadDimDiametric.CreateRemote(const MachineName: string): IAcadDimDiametric;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimDiametric) as IAcadDimDiametric;
end;

class function CoAcadDimOrdinate.Create: IAcadDimOrdinate;
begin
  Result := CreateComObject(CLASS_AcadDimOrdinate) as IAcadDimOrdinate;
end;

class function CoAcadDimOrdinate.CreateRemote(const MachineName: string): IAcadDimOrdinate;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimOrdinate) as IAcadDimOrdinate;
end;

class function CoAcadDimRadial.Create: IAcadDimRadial;
begin
  Result := CreateComObject(CLASS_AcadDimRadial) as IAcadDimRadial;
end;

class function CoAcadDimRadial.CreateRemote(const MachineName: string): IAcadDimRadial;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimRadial) as IAcadDimRadial;
end;

class function CoAcadDimRotated.Create: IAcadDimRotated;
begin
  Result := CreateComObject(CLASS_AcadDimRotated) as IAcadDimRotated;
end;

class function CoAcadDimRotated.CreateRemote(const MachineName: string): IAcadDimRotated;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDimRotated) as IAcadDimRotated;
end;

class function CoAcadDim3PointAngular.Create: IAcadDim3PointAngular;
begin
  Result := CreateComObject(CLASS_AcadDim3PointAngular) as IAcadDim3PointAngular;
end;

class function CoAcadDim3PointAngular.CreateRemote(const MachineName: string): IAcadDim3PointAngular;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDim3PointAngular) as IAcadDim3PointAngular;
end;

class function CoAcadBlock.Create: IAcadBlock;
begin
  Result := CreateComObject(CLASS_AcadBlock) as IAcadBlock;
end;

class function CoAcadBlock.CreateRemote(const MachineName: string): IAcadBlock;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadBlock) as IAcadBlock;
end;

class function CoAcadModelSpace.Create: IAcadModelSpace;
begin
  Result := CreateComObject(CLASS_AcadModelSpace) as IAcadModelSpace;
end;

class function CoAcadModelSpace.CreateRemote(const MachineName: string): IAcadModelSpace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadModelSpace) as IAcadModelSpace;
end;

class function CoAcadPaperSpace.Create: IAcadPaperSpace;
begin
  Result := CreateComObject(CLASS_AcadPaperSpace) as IAcadPaperSpace;
end;

class function CoAcadPaperSpace.CreateRemote(const MachineName: string): IAcadPaperSpace;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPaperSpace) as IAcadPaperSpace;
end;

class function CoAcadDatabasePreferences.Create: IAcadDatabasePreferences;
begin
  Result := CreateComObject(CLASS_AcadDatabasePreferences) as IAcadDatabasePreferences;
end;

class function CoAcadDatabasePreferences.CreateRemote(const MachineName: string): IAcadDatabasePreferences;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDatabasePreferences) as IAcadDatabasePreferences;
end;

class function CoAcadDatabase.Create: IAcadDatabase;
begin
  Result := CreateComObject(CLASS_AcadDatabase) as IAcadDatabase;
end;

class function CoAcadDatabase.CreateRemote(const MachineName: string): IAcadDatabase;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDatabase) as IAcadDatabase;
end;

class function CoAcadState.Create: IAcadState;
begin
  Result := CreateComObject(CLASS_AcadState) as IAcadState;
end;

class function CoAcadState.CreateRemote(const MachineName: string): IAcadState;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadState) as IAcadState;
end;

class function CoAcadApplication.Create: IAcadApplication;
begin
  Result := CreateComObject(CLASS_AcadApplication) as IAcadApplication;
end;

class function CoAcadApplication.CreateRemote(const MachineName: string): IAcadApplication;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadApplication) as IAcadApplication;
end;

class function CoAcadSelectionSet.Create: IAcadSelectionSet;
begin
  Result := CreateComObject(CLASS_AcadSelectionSet) as IAcadSelectionSet;
end;

class function CoAcadSelectionSet.CreateRemote(const MachineName: string): IAcadSelectionSet;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadSelectionSet) as IAcadSelectionSet;
end;

class function CoAcadSelectionSets.Create: IAcadSelectionSets;
begin
  Result := CreateComObject(CLASS_AcadSelectionSets) as IAcadSelectionSets;
end;

class function CoAcadSelectionSets.CreateRemote(const MachineName: string): IAcadSelectionSets;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadSelectionSets) as IAcadSelectionSets;
end;

class function CoAcadPlot.Create: IAcadPlot;
begin
  Result := CreateComObject(CLASS_AcadPlot) as IAcadPlot;
end;

class function CoAcadPlot.CreateRemote(const MachineName: string): IAcadPlot;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPlot) as IAcadPlot;
end;

class function CoAcadPreferences.Create: IAcadPreferences;
begin
  Result := CreateComObject(CLASS_AcadPreferences) as IAcadPreferences;
end;

class function CoAcadPreferences.CreateRemote(const MachineName: string): IAcadPreferences;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferences) as IAcadPreferences;
end;

class function CoAcadPreferencesDrafting.Create: IAcadPreferencesDrafting;
begin
  Result := CreateComObject(CLASS_AcadPreferencesDrafting) as IAcadPreferencesDrafting;
end;

class function CoAcadPreferencesDrafting.CreateRemote(const MachineName: string): IAcadPreferencesDrafting;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesDrafting) as IAcadPreferencesDrafting;
end;

class function CoAcadPreferencesDisplay.Create: IAcadPreferencesDisplay;
begin
  Result := CreateComObject(CLASS_AcadPreferencesDisplay) as IAcadPreferencesDisplay;
end;

class function CoAcadPreferencesDisplay.CreateRemote(const MachineName: string): IAcadPreferencesDisplay;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesDisplay) as IAcadPreferencesDisplay;
end;

class function CoAcadPreferencesFiles.Create: IAcadPreferencesFiles;
begin
  Result := CreateComObject(CLASS_AcadPreferencesFiles) as IAcadPreferencesFiles;
end;

class function CoAcadPreferencesFiles.CreateRemote(const MachineName: string): IAcadPreferencesFiles;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesFiles) as IAcadPreferencesFiles;
end;

class function CoAcadPreferencesOpenSave.Create: IAcadPreferencesOpenSave;
begin
  Result := CreateComObject(CLASS_AcadPreferencesOpenSave) as IAcadPreferencesOpenSave;
end;

class function CoAcadPreferencesOpenSave.CreateRemote(const MachineName: string): IAcadPreferencesOpenSave;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesOpenSave) as IAcadPreferencesOpenSave;
end;

class function CoAcadPreferencesOutput.Create: IAcadPreferencesOutput;
begin
  Result := CreateComObject(CLASS_AcadPreferencesOutput) as IAcadPreferencesOutput;
end;

class function CoAcadPreferencesOutput.CreateRemote(const MachineName: string): IAcadPreferencesOutput;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesOutput) as IAcadPreferencesOutput;
end;

class function CoAcadPreferencesProfiles.Create: IAcadPreferencesProfiles;
begin
  Result := CreateComObject(CLASS_AcadPreferencesProfiles) as IAcadPreferencesProfiles;
end;

class function CoAcadPreferencesProfiles.CreateRemote(const MachineName: string): IAcadPreferencesProfiles;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesProfiles) as IAcadPreferencesProfiles;
end;

class function CoAcadPreferencesSelection.Create: IAcadPreferencesSelection;
begin
  Result := CreateComObject(CLASS_AcadPreferencesSelection) as IAcadPreferencesSelection;
end;

class function CoAcadPreferencesSelection.CreateRemote(const MachineName: string): IAcadPreferencesSelection;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesSelection) as IAcadPreferencesSelection;
end;

class function CoAcadPreferencesSystem.Create: IAcadPreferencesSystem;
begin
  Result := CreateComObject(CLASS_AcadPreferencesSystem) as IAcadPreferencesSystem;
end;

class function CoAcadPreferencesSystem.CreateRemote(const MachineName: string): IAcadPreferencesSystem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesSystem) as IAcadPreferencesSystem;
end;

class function CoAcadPreferencesUser.Create: IAcadPreferencesUser;
begin
  Result := CreateComObject(CLASS_AcadPreferencesUser) as IAcadPreferencesUser;
end;

class function CoAcadPreferencesUser.CreateRemote(const MachineName: string): IAcadPreferencesUser;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPreferencesUser) as IAcadPreferencesUser;
end;

class function CoAcadMenuGroups.Create: IAcadMenuGroups;
begin
  Result := CreateComObject(CLASS_AcadMenuGroups) as IAcadMenuGroups;
end;

class function CoAcadMenuGroups.CreateRemote(const MachineName: string): IAcadMenuGroups;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMenuGroups) as IAcadMenuGroups;
end;

class function CoAcadMenuGroup.Create: IAcadMenuGroup;
begin
  Result := CreateComObject(CLASS_AcadMenuGroup) as IAcadMenuGroup;
end;

class function CoAcadMenuGroup.CreateRemote(const MachineName: string): IAcadMenuGroup;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMenuGroup) as IAcadMenuGroup;
end;

class function CoAcadMenuBar.Create: IAcadMenuBar;
begin
  Result := CreateComObject(CLASS_AcadMenuBar) as IAcadMenuBar;
end;

class function CoAcadMenuBar.CreateRemote(const MachineName: string): IAcadMenuBar;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadMenuBar) as IAcadMenuBar;
end;

class function CoAcadPopupMenus.Create: IAcadPopupMenus;
begin
  Result := CreateComObject(CLASS_AcadPopupMenus) as IAcadPopupMenus;
end;

class function CoAcadPopupMenus.CreateRemote(const MachineName: string): IAcadPopupMenus;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPopupMenus) as IAcadPopupMenus;
end;

class function CoAcadPopupMenu.Create: IAcadPopupMenu;
begin
  Result := CreateComObject(CLASS_AcadPopupMenu) as IAcadPopupMenu;
end;

class function CoAcadPopupMenu.CreateRemote(const MachineName: string): IAcadPopupMenu;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPopupMenu) as IAcadPopupMenu;
end;

class function CoAcadPopupMenuItem.Create: IAcadPopupMenuItem;
begin
  Result := CreateComObject(CLASS_AcadPopupMenuItem) as IAcadPopupMenuItem;
end;

class function CoAcadPopupMenuItem.CreateRemote(const MachineName: string): IAcadPopupMenuItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadPopupMenuItem) as IAcadPopupMenuItem;
end;

class function CoAcadUtility.Create: IAcadUtility;
begin
  Result := CreateComObject(CLASS_AcadUtility) as IAcadUtility;
end;

class function CoAcadUtility.CreateRemote(const MachineName: string): IAcadUtility;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadUtility) as IAcadUtility;
end;

class function CoAcadDocument.Create: IAcadDocument;
begin
  Result := CreateComObject(CLASS_AcadDocument) as IAcadDocument;
end;

class function CoAcadDocument.CreateRemote(const MachineName: string): IAcadDocument;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDocument) as IAcadDocument;
end;

class function CoAcadDocuments.Create: IAcadDocuments;
begin
  Result := CreateComObject(CLASS_AcadDocuments) as IAcadDocuments;
end;

class function CoAcadDocuments.CreateRemote(const MachineName: string): IAcadDocuments;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadDocuments) as IAcadDocuments;
end;

class function CoAcadToolbars.Create: IAcadToolbars;
begin
  Result := CreateComObject(CLASS_AcadToolbars) as IAcadToolbars;
end;

class function CoAcadToolbars.CreateRemote(const MachineName: string): IAcadToolbars;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadToolbars) as IAcadToolbars;
end;

class function CoAcadToolbar.Create: IAcadToolbar;
begin
  Result := CreateComObject(CLASS_AcadToolbar) as IAcadToolbar;
end;

class function CoAcadToolbar.CreateRemote(const MachineName: string): IAcadToolbar;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadToolbar) as IAcadToolbar;
end;

class function CoAcadToolbarItem.Create: IAcadToolbarItem;
begin
  Result := CreateComObject(CLASS_AcadToolbarItem) as IAcadToolbarItem;
end;

class function CoAcadToolbarItem.CreateRemote(const MachineName: string): IAcadToolbarItem;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadToolbarItem) as IAcadToolbarItem;
end;

class function CoAcadLayerStateManager.Create: IAcadLayerStateManager;
begin
  Result := CreateComObject(CLASS_AcadLayerStateManager) as IAcadLayerStateManager;
end;

class function CoAcadLayerStateManager.CreateRemote(const MachineName: string): IAcadLayerStateManager;
begin
  Result := CreateRemoteComObject(MachineName, CLASS_AcadLayerStateManager) as IAcadLayerStateManager;
end;

end.
