// Borland C++ Builder
// Copyright (c) 1995, 1999 by Borland International
// All rights reserved

// (DO NOT EDIT: machine generated header) 'AcadDwgV.pas' rev: 5.00

#ifndef AcadDwgVHPP
#define AcadDwgVHPP

#pragma delphiheader begin
#pragma option push -w-
#pragma option push -Vx
#include <Controls.hpp>	// Pascal unit
#include <AcadDraw.hpp>	// Pascal unit
#include <Graphics.hpp>	// Pascal unit
#include <Classes.hpp>	// Pascal unit
#include <SysUtils.hpp>	// Pascal unit
#include <Messages.hpp>	// Pascal unit
#include <Windows.hpp>	// Pascal unit
#include <SysInit.hpp>	// Pascal unit
#include <System.hpp>	// Pascal unit

//-- user supplied -----------------------------------------------------------

namespace Acaddwgv
{
//-- type declarations -------------------------------------------------------
typedef AnsiString TDwgFileName;

#pragma option push -b-
enum TDrawFileMode { dfmNONE, dfmDWG, dfmOLDDWG, dfmBMP, dfmWMF };
#pragma option pop

typedef void __fastcall (__closure *TOnDropFile)(System::TObject* Sender, AnsiString DropFileName, bool 
	&Loading);

typedef void __fastcall (__closure *TOnReadFileSize)(System::TObject* Sender, AnsiString &ReadFileName
	);

class DELPHICLASS TAcadDwgView;
class PASCALIMPLEMENTATION TAcadDwgView : public Acaddraw::TCustomAcadControl 
{
	typedef Acaddraw::TCustomAcadControl inherited;
	
private:
	bool FLoadImaging;
	AnsiString FLastLoadFile;
	Graphics::TCanvas* FBackCanvas;
	TDrawFileMode FDrawFileMode;
	Graphics::TBitmap* FBitmap;
	Graphics::TMetafile* FMetaFile;
	Graphics::TColor FColor;
	Graphics::TColor FMetaColor;
	bool FStretch;
	bool FDwgOnly;
	AnsiString FFileName;
	__int64 FFileSize;
	AnsiString FFileSizeName;
	bool FBackBlack;
	unsigned FAcadVersion;
	bool FOpenFiled;
	bool FLoadImage;
	bool FShowVersion;
	bool FShowFileSize;
	bool FDropLoading;
	bool FVersionLine;
	AnsiString FLineStr;
	TOnReadFileSize FOnReadFileSize;
	Classes::TNotifyEvent FOnChangeView;
	TOnDropFile FOnDropFile;
	
protected:
	virtual void __fastcall WndProc(Messages::TMessage &Message);
	HIDESBASE MESSAGE void __fastcall WmSize(Messages::TWMSize &Msg);
	HIDESBASE MESSAGE void __fastcall WmEraseBkgnd(Messages::TWMEraseBkgnd &Msg);
	virtual void __fastcall LoadDrawFile(const AnsiString FileName, const bool ReDraw);
	void __fastcall DragFunc(const int hDrop);
	HIDESBASE void __fastcall SetColor(Graphics::TColor Value);
	void __fastcall SetMetaColor(Graphics::TColor Value);
	void __fastcall SetFileName(AnsiString Value);
	void __fastcall SetBackBlack(bool Value);
	void __fastcall SetLoadImage(bool Value);
	void __fastcall SetShowVersion(bool Value);
	void __fastcall SetShowFileSize(bool Value);
	void __fastcall SetStretch(bool Value);
	void __fastcall SetVersionLine(bool Value);
	void __fastcall SetDwgOnly(bool Value);
	void __fastcall SetLineStr(AnsiString Value);
	
public:
	__fastcall virtual TAcadDwgView(Classes::TComponent* AOwner);
	__fastcall virtual ~TAcadDwgView(void);
	__property Graphics::TBitmap* Bitmap = {read=FBitmap};
	__property Graphics::TMetafile* MetaFile = {read=FMetaFile};
	__property unsigned AcadVersion = {read=FAcadVersion, nodefault};
	__property bool OpenFiled = {read=FOpenFiled, nodefault};
	
__published:
	__property Align ;
	__property Graphics::TColor Color = {read=FColor, write=SetColor, default=-2147483636};
	__property Graphics::TColor MetaColor = {read=FMetaColor, write=SetMetaColor, default=16777215};
	__property AnsiString FileName = {read=FFileName, write=SetFileName};
	__property bool BackBlack = {read=FBackBlack, write=SetBackBlack, default=1};
	__property bool LoadImage = {read=FLoadImage, write=SetLoadImage, default=1};
	__property bool ShowVersion = {read=FShowVersion, write=SetShowVersion, default=1};
	__property bool ShowFileSize = {read=FShowFileSize, write=SetShowFileSize, default=0};
	__property bool DropLoading = {read=FDropLoading, write=FDropLoading, default=0};
	__property bool Stretch = {read=FStretch, write=SetStretch, default=0};
	__property bool VersionLine = {read=FVersionLine, write=SetVersionLine, default=0};
	__property AnsiString LineStr = {read=FLineStr, write=SetLineStr};
	__property bool DwgOnly = {read=FDwgOnly, write=SetDwgOnly, default=0};
	__property TOnReadFileSize OnReadFileSize = {read=FOnReadFileSize, write=FOnReadFileSize};
	__property Classes::TNotifyEvent OnChangeView = {read=FOnChangeView, write=FOnChangeView};
	__property TOnDropFile OnDropFile = {read=FOnDropFile, write=FOnDropFile};
public:
	#pragma option push -w-inl
	/* TWinControl.CreateParented */ inline __fastcall TAcadDwgView(HWND ParentWindow) : Acaddraw::TCustomAcadControl(
		ParentWindow) { }
	#pragma option pop
	
};


//-- var, const, procedure ---------------------------------------------------

}	/* namespace Acaddwgv */
#if !defined(NO_IMPLICIT_NAMESPACE_USE)
using namespace Acaddwgv;
#endif
#pragma option pop	// -w-
#pragma option pop	// -Vx

#pragma delphiheader end.
//-- end unit ----------------------------------------------------------------
#endif	// AcadDwgV
