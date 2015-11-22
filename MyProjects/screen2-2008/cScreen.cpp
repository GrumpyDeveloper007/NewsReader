#pragma warning(disable : 4996)
// Module object
//
// Includes -
//  cSCREEN  
//   
// 
// Coded by Dark Elf
//
#include <fstream>
#include <string.h>
#include <ddraw.h>

#include "types.h"
#include "cScreen.h"

extern std::fstream dale;
#define TITLE "Elf 3DO object mapper"

//////////////////////////////////////////////////////////////////////////////
// Init

cSCREEN::cSCREEN()
{
	BackBuffer=0;
	Type=0;
	  ScreenXSize =1920;
  ScreenYSize =1200;

//	SizeX=0;
//	SizeY=0;
//	PositionX=0;
//	PositionY=0;
//	SubScreenList=NULL;
//	NumSubScreens=0;
	// Sliders=new cSLIDER[10];
}
cSCREEN::~cSCREEN()
{
	if (FakeID!=0)
	{
		std::fstream temp;
		temp.open("screen.raw",std::ios::out|std::ios::binary);
//		temp.write(&BackBuffer[0],SizeX*SizeY*PixelLength);
	}
	
	if (BackBuffer!=0)
		delete BackBuffer;
	if (ZBuffer!=0)
		delete ZBuffer;
	if (AlphaBuffer!=0)
		delete AlphaBuffer;
}

void cSCREEN::CloseScreen( )
{
    if( lpDD != NULL )
    {
		if( lpDDSPrimary != NULL )
		{
			lpDDSPrimary->Release();
			lpDDSPrimary = NULL;
		}
		lpDD->Release();
		lpDD = NULL;
    }
} /* finiObjects */

char szMsg[] = " ";
char szFrontMsg[] = " ";
char szBackMsg[] = " ";

long FAR PASCAL WindowProc( HWND hWnd, UINT message, 
						   WPARAM wParam, LPARAM lParam )
{
    PAINTSTRUCT ps;
    RECT        rc;
    SIZE        size;
    static BYTE phase = 0;
	
    switch( message )
    {
    case WM_ACTIVATEAPP:
		//	bActive = wParam;
		break;
		
    case WM_CREATE:
		break;
		
    case WM_SETCURSOR:
		SetCursor(NULL);
		
		return TRUE;
		
    case WM_TIMER:
		// Flip surfaces
		break;
		
    case WM_KEYDOWN:
		switch( wParam )
		{
		case VK_ESCAPE:
		case VK_F12:
			{
				//		CloseScreen();
				PostMessage(hWnd, WM_CLOSE, 0, 0);
			}
			break;
		}
		break;
		
		case WM_PAINT:
			BeginPaint( hWnd, &ps );
			GetClientRect(hWnd, &rc);
			GetTextExtentPoint( ps.hdc, szMsg, lstrlen(szMsg), &size );
			SetBkColor( ps.hdc, RGB( 0, 0, 255 ) );
			SetTextColor( ps.hdc, RGB( 255, 255, 0 ) );
			TextOut( ps.hdc, (rc.right - size.cx)/2, (rc.bottom - size.cy)/2,
				szMsg, sizeof( szMsg )-1 );
			EndPaint( hWnd, &ps );
			
			break;
			
		case WM_DESTROY:
			PostQuitMessage( 0 );
			break;
	}
    return DefWindowProc(hWnd, message, wParam, lParam);
} /* WindowProc */


void DDError(HRESULT hErr)
{
char dderr[256];
//char string[1024];

 switch (hErr)
{
case DDERR_DDSCAPSCOMPLEXREQUIRED : sprintf(dderr, "DDERR_DDSCAPSCOMPLEXREQUIRED: New for DirectX 7.0. The surface requires the DDSCAPS_COMPLEX flag."); break;
case DDERR_DEVICEDOESNTOWNSURFACE : sprintf(dderr, "DDERR_DEVICEDOESNTOWNSURFACE: Surfaces created by one DirectDraw device cannot be used directly by another DirectDraw device."); break;
case DDERR_EXPIRED : sprintf(dderr, "DDERR_EXPIRED: The data has expired and is therefore no longer valid."); break;
case DDERR_INVALIDSTREAM : sprintf(dderr, "DDERR_INVALIDSTREAM: The specified stream contains invalid data."); break;
case DDERR_MOREDATA : sprintf(dderr, "DDERR_MOREDATA: There is more data available than the specified buffer size can hold."); break;
case DDERR_NEWMODE : sprintf(dderr, "DDERR_NEWMODE: New for DirectX 7.0. When IDirectDraw7::StartModeTest is called with the DDSMT_ISTESTREQUIRED flag, it may return this value to denote that some or all of the resolutions can and should be tested. IDirectDraw7::EvaluateMode returns this value to indicate that the test has switched to a new display mode."); break;
case DDERR_NODRIVERSUPPORT : sprintf(dderr, "DDERR_NODRIVERSUPPORT: New for DirectX 7.0. Testing cannot proceed because the display adapter driver does not enumerate refresh rates."); break;
case DDERR_NOFOCUSWINDOW : sprintf(dderr, "DDERR_NOFOCUSWINDOW: An attempt was made to create or set a device window without first setting the focus window."); break;
case DDERR_NOMONITORINFORMATION : sprintf(dderr, "DDERR_NOMONITORINFORMATION: New for DirectX 7.0. Testing cannot proceed because the monitor has no associated EDID data."); break;
case DDERR_NONONLOCALVIDMEM : sprintf(dderr, "DDERR_NONONLOCALVIDMEM: An attempt was made to allocate nonlocal video memory from a device that does not support nonlocal video memory."); break;
case DDERR_NOOPTIMIZEHW : sprintf(dderr, "DDERR_NOOPTIMIZEHW: The device does not support optimized surfaces."); break;
case DDERR_NOSTEREOHARDWARE : sprintf(dderr, "DDERR_NOSTEREOHARDWARE: There is no stereo hardware present or available."); break;
case DDERR_NOSURFACELEFT : sprintf(dderr, "DDERR_NOSURFACELEFT: There is no hardware present that supports stereo surfaces."); break;
case DDERR_NOTLOADED : sprintf(dderr, "DDERR_NOTLOADED: The surface is an optimized surface, but it has not yet been allocated any memory."); break;
case DDERR_OVERLAPPINGRECTS : sprintf(dderr, "DDERR_OVERLAPPINGRECTS: The source and destination rectangles are on the same surface and overlap each other."); break;
case DDERR_TESTFINISHED : sprintf(dderr, "DDERR_TESTFINISHED: New for DirectX 7.0. When returned by the IDirectDraw7::StartModeTest method, this value means that no test could be initiated because all the resolutions chosen for testing already have refresh rate information in the registry. When returned by IDirectDraw7::EvaluateMode, the value means that DirectDraw has completed a refresh rate test."); break;
case DDERR_VIDEONOTACTIVE : sprintf(dderr, "DDERR_VIDEONOTACTIVE: The video port is not active."); break;
case DDERR_ALREADYINITIALIZED : sprintf(dderr, "DDERR_ALREADYINITIALIZED: The object has already been initialized."); break;
case DDERR_CANNOTATTACHSURFACE : sprintf(dderr, "DDERR_CANNOTATTACHSURFACE: A surface cannot be attached to another requested surface."); break;
case DDERR_CANNOTDETACHSURFACE : sprintf(dderr, "DDERR_CANNOTDETACHSURFACE: A surface cannot be detached from another requested surface."); break;
case DDERR_CURRENTLYNOTAVAIL : sprintf(dderr, "DDERR_CURRENTLYNOTAVAIL: No support is currently available"); break;
case DDERR_EXCEPTION : sprintf(dderr, "DDERR_EXCEPTION: An exception was encountered while performing the requested operation."); break;
case DDERR_GENERIC : sprintf(dderr, "DDERR_GENERIC: There is an undefined error condition."); break;
case DDERR_HEIGHTALIGN : sprintf(dderr, "DDERR_HEIGHTALIGN: The height of the provided rectangle is not a multiple of the required alignment."); break;
case DDERR_INCOMPATIBLEPRIMARY : sprintf(dderr, "DDERR_INCOMPATIBLEPRIMARY: The primary surface creation request does not match the existing primary surface."); break;
case DDERR_INVALIDCAPS : sprintf(dderr, "DDERR_INVALIDCAPS: One or more of the capability bits passed to the callback function are incorrect."); break;
case DDERR_INVALIDCLIPLIST : sprintf(dderr, "DDERR_INVALIDCLIPLIST: DirectDraw does not support the provided clip list."); break;
case DDERR_INVALIDMODE : sprintf(dderr, "DDERR_INVALIDMODE: DirectDraw does not support the requested mode."); break;
case DDERR_INVALIDOBJECT : sprintf(dderr, "DDERR_INVALIDOBJECT: DirectDraw received a pointer that was an invalid DirectDraw object."); break;
case DDERR_INVALIDPARAMS : sprintf(dderr, "DDERR_INVALIDPARAMS: One or more of the parameters passed to the method are incorrect."); break;
case DDERR_INVALIDPIXELFORMAT : sprintf(dderr, "DDERR_INVALIDPIXELFORMAT: The pixel format was invalid as specified."); break;
case DDERR_INVALIDRECT : sprintf(dderr, "DDERR_INVALIDRECT: The provided rectangle was invalid."); break;
case DDERR_LOCKEDSURFACES : sprintf(dderr, "DDERR_LOCKEDSURFACES: One or more surfaces are locked, causing the failure of the requested operation."); break;
case DDERR_NO3D : sprintf(dderr, "DDERR_NO3D: No 3-D hardware or emulation is present."); break;
case DDERR_NOALPHAHW : sprintf(dderr, "DDERR_NOALPHAHW: No alpha-acceleration hardware is present or available, causing the failure of the requested operation."); break;
case DDERR_NOCLIPLIST : sprintf(dderr, "DDERR_NOCLIPLIST: No clip list is available."); break;
case DDERR_NOCOLORCONVHW : sprintf(dderr, "DDERR_NOCOLORCONVHW: No color-conversion hardware is present or available."); break;
case DDERR_NOCOOPERATIVELEVELSET : sprintf(dderr, "DDERR_NOCOOPERATIVELEVELSET: A create function was called without the IDirectDraw7::SetCooperativeLevel method."); break;
case DDERR_NOCOLORKEY : sprintf(dderr, "DDERR_NOCOLORKEY: The surface does not currently have a color key."); break;
case DDERR_NOCOLORKEYHW : sprintf(dderr, "DDERR_NOCOLORKEYHW: There is no hardware support for the destination color key."); break;
case DDERR_NODIRECTDRAWSUPPORT : sprintf(dderr, "DDERR_NODIRECTDRAWSUPPORT: DirectDraw support is not possible with the current display driver."); break;
case DDERR_NOEXCLUSIVEMODE : sprintf(dderr, "DDERR_NOEXCLUSIVEMODE: The operation requires the application to have exclusive mode, but the application does not have exclusive mode."); break;
case DDERR_NOFLIPHW : sprintf(dderr, "DDERR_NOFLIPHW: Flipping visible surfaces is not supported."); break;
case DDERR_NOGDI : sprintf(dderr, "DDERR_NOGDI: No GDI is present."); break;
case DDERR_NOMIRRORHW : sprintf(dderr, "DDERR_NOMIRRORHW: No mirroring hardware is present or available."); break;
case DDERR_NOTFOUND : sprintf(dderr, "DDERR_NOTFOUND: The requested item was not found."); break;
case DDERR_NOOVERLAYHW : sprintf(dderr, "DDERR_NOOVERLAYHW: No overlay hardware is present or available."); break;
case DDERR_NORASTEROPHW : sprintf(dderr, "DDERR_NORASTEROPHW: No appropriate raster-operation hardware is present or available."); break;
case DDERR_NOROTATIONHW : sprintf(dderr, "DDERR_NOROTATIONHW: No rotation hardware is present or available."); break;
case DDERR_NOSTRETCHHW : sprintf(dderr, "DDERR_NOSTRETCHHW: There is no hardware support for stretching."); break;
case DDERR_NOT4BITCOLOR : sprintf(dderr, "DDERR_NOT4BITCOLOR: The DirectDrawSurface object is not using a 4-bit color palette, and the requested operation requires a 4-bit color palette."); break;
case DDERR_NOT4BITCOLORINDEX : sprintf(dderr, "DDERR_NOT4BITCOLORINDEX: The DirectDrawSurface object is not using a 4-bit color index palette, and the requested operation requires a 4-bit color index palette."); break;
case DDERR_NOT8BITCOLOR : sprintf(dderr, "DDERR_NOT8BITCOLOR: The DirectDrawSurface object is not using an 8-bit color palette, and the requested operation requires an 8-bit color palette."); break;
case DDERR_NOTEXTUREHW : sprintf(dderr, "DDERR_NOTEXTUREHW: The operation cannot be carried out because no texture-mapping hardware is present or available."); break;
case DDERR_NOVSYNCHW : sprintf(dderr, "DDERR_NOVSYNCHW: There is no hardware support for vertical blank synchronized operations."); break;
case DDERR_NOZBUFFERHW : sprintf(dderr, "DDERR_NOZBUFFERHW: The operation to create a z-buffer in display memory or to perform a blit, using a z-buffer cannot be carried out because there is no hardware support for z-buffers."); break;
case DDERR_NOZOVERLAYHW : sprintf(dderr, "DDERR_NOZOVERLAYHW: The overlay surfaces cannot be z-layered, based on the z-order because the hardware does not support z-ordering of overlays."); break;
case DDERR_OUTOFCAPS : sprintf(dderr, "DDERR_OUTOFCAPS: The hardware needed for the requested operation has already been allocated."); break;
case DDERR_OUTOFMEMORY : sprintf(dderr, "DDERR_OUTOFMEMORY: DirectDraw does not have enough memory to perform the operation."); break;
case DDERR_OUTOFVIDEOMEMORY : sprintf(dderr, "DDERR_OUTOFVIDEOMEMORY: DirectDraw does not have enough display memory to perform the operation."); break;
case DDERR_OVERLAYCANTCLIP : sprintf(dderr, "DDERR_OVERLAYCANTCLIP: The hardware does not support clipped overlays."); break;
case DDERR_OVERLAYCOLORKEYONLYONEACTIVE : sprintf(dderr, "DDERR_OVERLAYCOLORKEYONLYONEACTIVE: An attempt was made to have more than one color key active on an overlay."); break;
case DDERR_PALETTEBUSY : sprintf(dderr, "DDERR_PALETTEBUSY: Access to this palette is refused because the palette is locked by another thread."); break;
case DDERR_COLORKEYNOTSET : sprintf(dderr, "DDERR_COLORKEYNOTSET: No source color key is specified for this operation."); break;
case DDERR_SURFACEALREADYATTACHED : sprintf(dderr, "DDERR_SURFACEALREADYATTACHED: An attempt was made to attach a surface to another surface to which it is already attached."); break;
case DDERR_SURFACEALREADYDEPENDENT : sprintf(dderr, "DDERR_SURFACEALREADYDEPENDENT: An attempt was made to make a surface a dependency of another surface on which it is already dependent."); break;
case DDERR_SURFACEBUSY : sprintf(dderr, "DDERR_SURFACEBUSY: Access to the surface is refused because the surface is locked by another thread."); break;
case DDERR_CANTLOCKSURFACE : sprintf(dderr, "DDERR_CANTLOCKSURFACE: Access to this surface is refused because an attempt was made to lock the primary surface without DCI support."); break;
case DDERR_SURFACEISOBSCURED : sprintf(dderr, "DDERR_SURFACEISOBSCURED: Access to the surface is refused because the surface is obscured."); break;
case DDERR_SURFACELOST : sprintf(dderr, "DDERR_SURFACELOST: Access to the surface is refused because the surface memory is gone. Call the IDirectDrawSurface7::Restore method on this surface to restore the memory associated with it."); break;
case DDERR_SURFACENOTATTACHED : sprintf(dderr, "DDERR_SURFACENOTATTACHED: The requested surface is not attached."); break;
case DDERR_TOOBIGHEIGHT : sprintf(dderr, "DDERR_TOOBIGHEIGHT: The height requested by DirectDraw is too large."); break;
case DDERR_TOOBIGSIZE : sprintf(dderr, "DDERR_TOOBIGSIZE: The size requested by DirectDraw is too large. However, the individual height and width are valid sizes."); break;
case DDERR_TOOBIGWIDTH : sprintf(dderr, "DDERR_TOOBIGWIDTH: The width requested by DirectDraw is too large."); break;
case DDERR_UNSUPPORTED : sprintf(dderr, "DDERR_UNSUPPORTED: The operation is not supported."); break;
case DDERR_UNSUPPORTEDFORMAT : sprintf(dderr, "DDERR_UNSUPPORTEDFORMAT: The pixel format requested is not supported by DirectDraw."); break;
case DDERR_UNSUPPORTEDMASK : sprintf(dderr, "DDERR_UNSUPPORTEDMASK: The bitmask in the pixel format requested is not supported by DirectDraw."); break;
case DDERR_VERTICALBLANKINPROGRESS : sprintf(dderr, "DDERR_VERTICALBLANKINPROGRESS: A vertical blank is in progress."); break;
case DDERR_WASSTILLDRAWING : sprintf(dderr, "DDERR_WASSTILLDRAWING: The previous blit operation that is transferring information to or from this surface is incomplete."); break;
case DDERR_XALIGN : sprintf(dderr, "DDERR_XALIGN: The provided rectangle was not horizontally aligned on a required boundary."); break;
case DDERR_INVALIDDIRECTDRAWGUID : sprintf(dderr, "DDERR_INVALIDDIRECTDRAWGUID: The globally unique identifier (GUID) passed to the DirectDrawCreate function is not a valid DirectDraw driver identifier."); break;
case DDERR_DIRECTDRAWALREADYCREATED : sprintf(dderr, "DDERR_DIRECTDRAWALREADYCREATED: A DirectDraw object representing this driver has already been created for this process."); break;
case DDERR_NODIRECTDRAWHW : sprintf(dderr, "DDERR_NODIRECTDRAWHW: Hardware-only DirectDraw object creation is not possible; the driver does not support any hardware."); break;
case DDERR_PRIMARYSURFACEALREADYEXISTS : sprintf(dderr, "DDERR_PRIMARYSURFACEALREADYEXISTS: This process has already created a primary surface."); break;
case DDERR_NOEMULATION : sprintf(dderr, "DDERR_NOEMULATION: Software emulation is not available."); break;
case DDERR_REGIONTOOSMALL : sprintf(dderr, "DDERR_REGIONTOOSMALL: The region passed to the IDirectDrawClipper::GetClipList method is too small."); break;
case DDERR_CLIPPERISUSINGHWND : sprintf(dderr, "DDERR_CLIPPERISUSINGHWND: An attempt was made to set a clip list for a DirectDrawClipper object that is already monitoring a window handle."); break;
case DDERR_NOCLIPPERATTACHED : sprintf(dderr, "DDERR_NOCLIPPERATTACHED: No DirectDrawClipper object is attached to the surface object."); break;
case DDERR_NOHWND : sprintf(dderr, "DDERR_NOHWND: Clipper notification requires a window handle, or no window handle has been previously set as the cooperative level window handle."); break;
case DDERR_HWNDSUBCLASSED : sprintf(dderr, "DDERR_HWNDSUBCLASSED: DirectDraw is prevented from restoring state because the DirectDraw cooperative-level window handle has been subclassed."); break;
case DDERR_HWNDALREADYSET : sprintf(dderr, "DDERR_HWNDALREADYSET: The DirectDraw cooperative-level window handle has already been set. It cannot be reset while the process has surfaces or palettes created."); break;
case DDERR_NOPALETTEATTACHED : sprintf(dderr, "DDERR_NOPALETTEATTACHED: No palette object is attached to this surface."); break;
case DDERR_NOPALETTEHW : sprintf(dderr, "DDERR_NOPALETTEHW: There is no hardware support for 16- or 256-color palettes."); break;
case DDERR_BLTFASTCANTCLIP : sprintf(dderr, "DDERR_BLTFASTCANTCLIP: A DirectDrawClipper object is attached to a source surface that has passed into a call to the IDirectDrawSurface7::BltFast method."); break;
case DDERR_NOBLTHW : sprintf(dderr, "DDERR_NOBLTHW: No blitter hardware is present."); break;
case DDERR_NODDROPSHW : sprintf(dderr, "DDERR_NODDROPSHW: No DirectDraw raster-operation (ROP) hardware is available."); break;
case DDERR_OVERLAYNOTVISIBLE : sprintf(dderr, "DDERR_OVERLAYNOTVISIBLE: The IDirectDrawSurface7::GetOverlayPosition method was called on a hidden overlay."); break;
case DDERR_NOOVERLAYDEST : sprintf(dderr, "DDERR_NOOVERLAYDEST: The IDirectDrawSurface7::GetOverlayPosition method is called on an overlay that the IDirectDrawSurface7::UpdateOverlay method has not been called on to establish as a destination."); break;
case DDERR_INVALIDPOSITION : sprintf(dderr, "DDERR_INVALIDPOSITION: The position of the overlay on the destination is no longer legal."); break;
case DDERR_NOTAOVERLAYSURFACE : sprintf(dderr, "DDERR_NOTAOVERLAYSURFACE: An overlay component is called for a nonoverlay surface."); break;
case DDERR_EXCLUSIVEMODEALREADYSET : sprintf(dderr, "DDERR_EXCLUSIVEMODEALREADYSET: An attempt was made to set the cooperative level when it was already set to exclusive."); break;
case DDERR_NOTFLIPPABLE : sprintf(dderr, "DDERR_NOTFLIPPABLE: An attempt was made to flip a surface that cannot be flipped."); break;
case DDERR_CANTDUPLICATE : sprintf(dderr, "DDERR_CANTDUPLICATE: Primary and 3-D surfaces, or surfaces that are implicitly created, cannot be duplicated."); break;
case DDERR_NOTLOCKED : sprintf(dderr, "DDERR_NOTLOCKED: An attempt was made to unlock a surface that was not locked."); break;
case DDERR_CANTCREATEDC : sprintf(dderr, "DDERR_CANTCREATEDC: Windows cannot create any more device contexts (DCs), or a DC has requested a palette-indexed surface when the surface had no palette and the display mode was not palette-indexed (in this case DirectDraw cannot select a proper palette into the DC)."); break;
case DDERR_NODC : sprintf(dderr, "DDERR_NODC: No device context (DC) has ever been created for this surface."); break;
case DDERR_WRONGMODE : sprintf(dderr, "DDERR_WRONGMODE: This surface cannot be restored because it was created in a different mode."); break;
case DDERR_IMPLICITLYCREATED : sprintf(dderr, "DDERR_IMPLICITLYCREATED: The surface cannot be restored because it is an implicitly created surface."); break;
case DDERR_NOTPALETTIZED : sprintf(dderr, "DDERR_NOTPALETTIZED: The surface being used is not a palette-based surface."); break;
case DDERR_UNSUPPORTEDMODE : sprintf(dderr, "DDERR_UNSUPPORTEDMODE: The display is currently in an unsupported mode."); break;
case DDERR_NOMIPMAPHW : sprintf(dderr, "DDERR_NOMIPMAPHW: No mipmap-capable texture mapping hardware is present or available."); break;
case DDERR_INVALIDSURFACETYPE : sprintf(dderr, "DDERR_INVALIDSURFACETYPE: The surface was of the wrong type."); break;
case DDERR_DCALREADYCREATED : sprintf(dderr, "DDERR_DCALREADYCREATED: A device context (DC) has already been returned for this surface. Only one DC can be retrieved for each surface."); break;
case DDERR_CANTPAGELOCK : sprintf(dderr, "DDERR_CANTPAGELOCK: An attempt to page-lock a surface failed. Page lock does not work on a display-memory surface or an emulated primary surface."); break;
case DDERR_CANTPAGEUNLOCK : sprintf(dderr, "DDERR_CANTPAGEUNLOCK: An attempt to page-unlock a surface failed. Page unlock does not work on a display-memory surface or an emulated primary surface."); break;
case DDERR_NOTPAGELOCKED : sprintf(dderr, "DDERR_NOTPAGELOCKED: An attempt was made to page-unlock a surface with no outstanding page locks."); break;
case DDERR_NOTINITIALIZED : sprintf(dderr, "DDERR_NOTINITIALIZED: An attempt was made to call an interface method of a DirectDraw object created by CoCreateInstance before the object was initialized."); break;

default :  sprintf(dderr,  "Unknown Error"); break;
}
}

long cSCREEN::Open( HINSTANCE hInstance, int nCmdShow,long FakeON )
{
    WNDCLASS            wc;
    DDSCAPS             ddscaps;
    HRESULT             ddrval;
	
	dale <<"Opening Screen"<<std::endl;
	PixelLength=3;
    /*
	* set up and register window class
	*/
    wc.style = CS_HREDRAW | CS_VREDRAW;
    wc.lpfnWndProc = WindowProc;
    wc.cbClsExtra = 0;
    wc.cbWndExtra = 0;
    wc.hInstance = hInstance;
    wc.hIcon = LoadIcon( hInstance, IDI_APPLICATION );
    wc.hCursor = LoadCursor( NULL, IDC_ARROW );
    wc.hbrBackground = NULL;
    wc.lpszMenuName = "DDExample1";
    wc.lpszClassName = "DDExample1";
    RegisterClass( &wc );
    
    /*
	* create a window
	*/
    hwnd = CreateWindowEx(
		0,
		"DDExample1",
		TITLE,
		WS_POPUP,
		0, 0,
		1920,
		1000,
		NULL,
		NULL,
		hInstance,
		NULL );
	
    if( !hwnd )
		return FALSE;
	
    ShowWindow( hwnd, nCmdShow );
    UpdateWindow( hwnd );
	
	if (FakeON==0)
	{
		FakeID=0;
		/*
		* create the main DirectDraw object
		*/
		ddrval = DirectDrawCreate( NULL, &lpDD, NULL );
		if( ddrval == DD_OK )
		{
			// Get exclusive mode
			ddrval = lpDD->SetCooperativeLevel( hwnd,
				DDSCL_FULLSCREEN | DDSCL_EXCLUSIVE  );
			if(ddrval == DD_OK )
			{
				Type=0;
				ddrval = lpDD->SetDisplayMode( ScreenXSize, ScreenYSize, 24 );
				PixelLength=3;
				if (ddrval!=DD_OK)
				{
					ddrval = lpDD->SetDisplayMode( ScreenXSize, ScreenYSize, 32 );
					PixelLength=4;
					if (ddrval!=DD_OK)
					{
						dale << "ERROR: Cannot Open 640x480 24/32 bit screen mode "<<std::endl;
						exit(-1);
					}
				}
				dale <<"Screen Opened"<<std::endl;
				if( ddrval == DD_OK )
				{
					// Create the primary surface with 1 back buffer
					ZeroMemory( &ddsd, sizeof( ddsd ) );
					ddsd.dwSize = sizeof( ddsd );
					// DDSD_CAPS makes CreateSurface() check the
// ddsd.ddsCaps.dwCaps value. DDS_BACKBUFFERCOUNT makes it
// check the ddsd.dwBackBufferCount value.
ddsd.dwFlags = DDSD_CAPS | DDSD_BACKBUFFERCOUNT;

// Make it the primary surface that can be flipped.
ddsd.ddsCaps.dwCaps = DDSCAPS_PRIMARYSURFACE |
                      DDSCAPS_FLIP | DDSCAPS_COMPLEX;

// Give it one back buffer.
ddsd.dwBackBufferCount = 1;

					ddrval = lpDD->CreateSurface( &ddsd, (IDirectDrawSurface **)&lpDDSPrimary, NULL );
					if( ddrval == DD_OK )
					{
						// Get a pointer to the back buffer
						ddscaps.dwCaps = DDSCAPS_BACKBUFFER;
						ddrval = lpDDSPrimary->GetAttachedSurface(&ddscaps, 
							&lpDDSBack);
						//					if( ddrval == DD_OK )
						//						return TRUE;
					}
					else
						DDError(ddrval);
				}
			}
		}
	}
	else
		FakeID=1;
	SizeX=2048;//ScreenXSize;
	SizeY=ScreenYSize;
	ZBuffer=new MFLOAT[SizeX*SizeY];
	BackBuffer=new unsigned char[SizeX*SizeY*PixelLength]; 
	AlphaBuffer=new unsigned char [SizeX*SizeY*PixelLength];
	//BackBuffer=new unsigned char[SizeX*SizeY*PixelLength];
	return (1==1);
	//    return FALSE;
}
long cSCREEN::Lock()
{
	if (FakeID==0)
	{
		res=lpDDSBack->Lock(NULL,&ddsd,DDLOCK_SURFACEMEMORYPTR|DDLOCK_WAIT,NULL);
		//		res=lpDDSPrimary->Lock(NULL,&ddsd,DDLOCK_SURFACEMEMORYPTR|DDLOCK_WAIT,NULL);
		if (res==DD_OK)
		{
			Locked=1;
			FrontBuffer=(unsigned char *)ddsd.lpSurface;
			
			return TRUE;
		}
		return FALSE;
	}
	else
	{
		FrontBuffer=BackBuffer;
		return TRUE;
	}
}
long cSCREEN::Unlock()
{
	if (FakeID==0)
	{
		res=lpDDSBack->Unlock(NULL);
		//		res=lpDDSPrimary->Unlock(NULL);
		Locked=0;
		return TRUE;
	}
	else 
		return TRUE;
}

long cSCREEN::Open(long sizex,long sizey,long bbp,long r,long g,long b,long rv)
{
	SizeX=sizex;
	SizeY=sizey;
	//PixelLength=bbp/8;
	//BackBuffer=new unsigned char[SizeX*SizeY*PixelLength];
	return (1==1);
}


void cSCREEN::CopyBackToFront()
{
	Rect.left=0;
	Rect.top=0;
	Rect.right=ScreenXSize ;
	Rect.bottom=ScreenYSize;
	if (lpDDSPrimary !=0)
	 if (Locked==1)
	{
		Unlock();
		hr=lpDDSPrimary->BltFast(0,0,lpDDSBack,&Rect,DDBLTFAST_NOCOLORKEY|DDBLTFAST_WAIT);
	 }
	 else 
		hr=lpDDSPrimary->BltFast(0,0,lpDDSBack,&Rect,DDBLTFAST_NOCOLORKEY|DDBLTFAST_WAIT);
}
//////////////////////////////////////////////////////////////////////////////
// Windows Operations

long cSCREEN::Cout(long PositionX,long PositionY,char *Text)
{
	long status=0;
	if (Locked==1)
	{
		Unlock();
		status=1;
	}
	if (FakeID==0)
	{
		if (lpDDSBack->GetDC(&hdc) == DD_OK)
		{
			SetTextColor( hdc, RGB( TextR, TextG, TextB ) );
			SetBkColor( hdc, RGB( BackTextR, BackTextG, BackTextB ) );
			TextOut( hdc, PositionX, PositionY, Text, lstrlen(Text) );
			lpDDSBack->ReleaseDC(hdc);
			if (status==1)
			{
				return Lock();
			}
			else
				return TRUE;
		}
		else
			if (status==1)
			{
				Lock();
				return FALSE;
			}
			else
				return FALSE;
	}
	else
		return false;
}


long cSCREEN::Cout(long PositionX,long PositionY,char *Text,long Length)
{
	long status=0;
	if (Locked==1)
	{
		Unlock();
		status=1;
	}
	
	if (FakeID==0)
	{
		if (lpDDSBack->GetDC(&hdc) == DD_OK)
		{
			SetTextColor( hdc, RGB( TextR, TextG, TextB ) );
			SetBkColor( hdc, RGB( BackTextR, BackTextG, BackTextB ) );
			TextOut( hdc, PositionX, PositionY, Text, Length );
			lpDDSBack->ReleaseDC(hdc);
			if (status==1)
			{
				return Lock();
			}
			else
				return TRUE;
		}
		else
			if (status==1)
			{
				Lock();
				return FALSE;
			}
			else
				return FALSE;
	}
	else
		return true;
}


long cSCREEN::Cout(long PositionX,long PositionY,char *Text,unsigned char r,
				   unsigned char g,unsigned char b)
{
	long status=0;
	if (Locked==1)
	{
		Unlock();
		status=1;
	}
	
	if (lpDDSBack->GetDC(&hdc) == DD_OK)
	{
		SetTextColor( hdc, RGB( r, g, b ) );
		SetBkColor( hdc, RGB( BackTextR, BackTextG, BackTextB ) );
		TextOut( hdc, PositionX, PositionY, Text, lstrlen(Text) );
		lpDDSBack->ReleaseDC(hdc);
		if (status==1)
		{
			return Lock();
		}
		else
			return TRUE;
	}
	else
		if (status==1)
		{
			Lock();
			return FALSE;
		}
		else
			return FALSE;
}



////////////////////////////////////////////////////////////////////////////////

void cSCREEN::CLSBoxLong(long x1,long y1,long x2,long y2)
{
	unsigned char *temp=FrontBuffer+(y1*SizeX+x1)*PixelLength;
	int moduloX=(SizeX-(x2-x1))*PixelLength;
	int width=((x2-x1)*PixelLength)/4;
	int x,y;
	for (y=y1;y<y2;y++)
	{
		for(x=0;x<width;x++)
		{
			*(unsigned long *)temp=0;
			temp+=4;
		}
		temp+=moduloX;
	}
}


void cSCREEN::CLSBox(int x1,int y1,int x2,int y2)
{
	if (((x2-x1)*PixelLength%4)==0)
	{
		CLSBoxLong(x1,y1,x2,y2);
		return;
	}
	unsigned char *temp=FrontBuffer+(y1*SizeX+x1)*PixelLength;
	int moduloX=(SizeX-(x2-x1))*PixelLength;
	int x,y;
	for (y=y1;y<y2;y++)
	{
		for(x=x1;x<x2;x++)
		{
			*temp++=0;
			*temp++=0;
			*temp++=0;
			temp+=PixelLength-3;
		}
		temp+=moduloX;
	}
}
void cSCREEN::Dot(long x,long y,unsigned char r,unsigned char g,unsigned char b)
{
	FrontBuffer[(y*SizeX+x)*PixelLength+2]=r;
	FrontBuffer[(y*SizeX+x)*PixelLength+1]=g;
	FrontBuffer[(y*SizeX+x)*PixelLength]=b;
}

void cSCREEN::LargeDot(long x,long y)
{
	if (x>0&&y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength]=0;
	}
	if (x<SizeX&&y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength]=0;
	}
	if (x>0&&y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength]=0;
	}
	if (x<SizeX&&y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength]=0;
	}
	if (y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength+2]=255;
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength]=0;
	}
	if (x>0)
	{
		FrontBuffer[(y*SizeX+x-1)*PixelLength+2]=255;
		FrontBuffer[(y*SizeX+x-1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-1)*PixelLength]=0;
	}
	if (y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength+2]=255;
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength]=0;
	}
	if (x<SizeX)
	{
		FrontBuffer[(y*SizeX+x+1)*PixelLength+2]=255;
		FrontBuffer[(y*SizeX+x+1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+1)*PixelLength]=0;
	}
}

void cSCREEN::LargeDot(long x,long y,unsigned char r,unsigned char g,unsigned char b)
{
	if (x>0&&y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-SizeX-1)*PixelLength]=0;
	}
	if (x<SizeX&&y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x-SizeX+1)*PixelLength]=0;
	}
	if (x>0&&y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+SizeX-1)*PixelLength]=0;
	}
	if (x<SizeX&&y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength+2]=0;
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength+1]=0;
		FrontBuffer[(y*SizeX+x+SizeX+1)*PixelLength]=0;
	}
	if (y>0)
	{
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength+2]=r;
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength+1]=g;
		FrontBuffer[(y*SizeX+x-SizeX)*PixelLength]=b;
	}
	if (x>0)
	{
		FrontBuffer[(y*SizeX+x-1)*PixelLength+2]=r;
		FrontBuffer[(y*SizeX+x-1)*PixelLength+1]=g;
		FrontBuffer[(y*SizeX+x-1)*PixelLength]=b;
	}
	if (y<SizeY)
	{
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength+2]=r;
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength+1]=g;
		FrontBuffer[(y*SizeX+x+SizeX)*PixelLength]=b;
	}
	if (x<SizeX)
	{
		FrontBuffer[(y*SizeX+x+1)*PixelLength+2]=r;
		FrontBuffer[(y*SizeX+x+1)*PixelLength+1]=g;
		FrontBuffer[(y*SizeX+x+1)*PixelLength]=b;
	}
}

void cSCREEN::DrawLine(long x1,long y1,long x2,long y2)
{
	MFLOAT x,y;
	MFLOAT XStep,YStep;
	long xi,yi;
	long xd,yd;
	long NextPixel;
	unsigned char *ScreenPtrTemp=FrontBuffer;
	
	xd=abs(x1-x2);
	yd=abs(y1-y2);
	if (xd>=yd)
	{
		NextPixel=PixelLength;
		if (x2>x1)
		{
			y=(MFLOAT)y1;
			ScreenPtrTemp+=x1*PixelLength;
			YStep=(MFLOAT)(y2-y1)/xd;
		}
		else
		{
			y=(MFLOAT)y2;
			ScreenPtrTemp+=x2*PixelLength;
			YStep=((MFLOAT)y1-y2)/xd;
		}
		
		for(xi=0;xi<xd;xi++)
		{
			yi=(int)y;
			ScreenPtrTemp[(yi*SizeX)*PixelLength+2]=0;
			ScreenPtrTemp[(yi*SizeX)*PixelLength+1]=0;
			ScreenPtrTemp[(yi*SizeX)*PixelLength]=0;
			ScreenPtrTemp+=NextPixel;
			y+=YStep;
		}
		
	}
	else
	{
		NextPixel=(SizeX)*PixelLength;
		if (y2>y1)
		{
			ScreenPtrTemp+=(y1*SizeX)*PixelLength;
			x=(MFLOAT)x1;
			XStep=(MFLOAT)(x2-x1)/yd;
		}
		else
		{
			ScreenPtrTemp+=(y2*SizeX)*PixelLength;
			x=(MFLOAT)x2;
			XStep=(MFLOAT)(x1-x2)/yd;
		}
		for(yi=0;yi<yd;yi++)
		{
			xi=(int)x;
			ScreenPtrTemp[(xi)*PixelLength+2]=0;
			ScreenPtrTemp[(xi)*PixelLength+1]=0;
			ScreenPtrTemp[(xi)*PixelLength]=0;
			ScreenPtrTemp+=NextPixel;
			x+=XStep;
		}
	}
}

////////////////////////////////////////////////////////////////////////
// Bitmap operations

void cSCREEN::BlitAreaLong(unsigned char *SourcePtr,int OffsetX,
						   int OffsetY,int SourceX,int SourceY)
{
	int moduloD;
	int width;
	moduloD=(SizeX-SourceX)*PixelLength;
	unsigned char *Dest=FrontBuffer+(OffsetX+OffsetY*SizeX)*PixelLength;
	unsigned long *source=(unsigned long *)SourcePtr;
	width=(SourceX*PixelLength)/4;
	int x,y;
	
	for(y=0;y<SourceY;y++)
	{
		for(x=0;x<width;x++)
		{
			*(unsigned long *)Dest=*source++;
			Dest+=4;
		}
		Dest+=moduloD;
	}
}

void cSCREEN::BlitArea(unsigned char *SourcePtr,int OffsetX,
					   int OffsetY,int SourceX,int SourceY)
{
	/*if ((SourceX*PixelLength%4)==0 )
	{
		BlitAreaLong(SourcePtr,OffsetX,OffsetY,SourceX,SourceY);
		return;
	}*/
	
	int moduloD;
	moduloD=(SizeX-SourceX)*PixelLength;
	unsigned char *Dest=FrontBuffer+(OffsetX+OffsetY*SizeX)*PixelLength;
	
	int x,y;
	
	for(y=0;y<SourceY;y++)
	{
		for(x=0;x<SourceX;x++)
		{
			*Dest++=*SourcePtr++;
			*Dest++=*SourcePtr++;
			*Dest++=*SourcePtr++;
			Dest+=PixelLength-3;
		}
		Dest+=moduloD;
	}
}

void cSCREEN::BlitAreaMono(unsigned char *SourcePtr,int OffsetX,
						   int OffsetY,int SourceX,int SourceY)
{
	int moduloD;
	moduloD=(SizeX-SourceX)*PixelLength;
	unsigned char *Dest=FrontBuffer+(OffsetX+OffsetY*SizeX)*PixelLength;
	
	int x,y;
	unsigned char c;
	for(y=0;y<SourceY;y++)
	{
		for(x=0;x<SourceX;x++)
		{
			c=*SourcePtr++;
			*Dest++=c;
			*Dest++=c;
			*Dest++=c;
			Dest+=PixelLength-3;
		}
		Dest+=moduloD;
	}
}

void cSCREEN::BlitAreaM(unsigned char *SourcePtr,int OffsetX,
						int OffsetY,int SourceX,int SourceY,unsigned char Mask)
{
	int moduloD;
	moduloD=(SizeX-SourceX)*PixelLength;
	unsigned char *Dest=FrontBuffer+(OffsetX+OffsetY*SizeX)*PixelLength;
	
	int x,y;
	
	for(y=0;y<SourceY;y++)
	{
		for(x=0;x<SourceX;x++)
		{
			if (*SourcePtr!=Mask)
			{
				*Dest++=*SourcePtr++;
				*Dest++=*SourcePtr++;
				*Dest++=*SourcePtr++;
				Dest+=PixelLength-3;
			}
			else
			{
				Dest+=PixelLength;
				SourcePtr+=3;
			}
		}
		Dest+=moduloD;
	}
}


void cSCREEN::CLSAreaL(int start,int Size)
{
	//unsigned char *Destnation=VESAScreenPtr+start;
	//for(i=0;i<Size;i++)
	//PlotPixel(Destnation++,0);
}

void cSCREEN::CopyBack(long PositionX,long PositionY,cTEXTURE *Destnation)
{
	int moduloS;
	int x,y;
	
	moduloS=(SizeX-Destnation->SizeX)*PixelLength;
	unsigned char *SourcePtr=FrontBuffer+(PositionX+PositionY*SizeX)*PixelLength;
	unsigned char *DestPtr=Destnation->TexturePtr;
	
	for(y=0;y<Destnation->SizeY;y++)
	{
		for(x=0;x<Destnation->SizeX;x++)
		{
			*DestPtr++=*SourcePtr++;
			*DestPtr++=*SourcePtr++;
			*DestPtr++=*SourcePtr++;
			SourcePtr+=PixelLength-3;
		}
		SourcePtr+=moduloS;
	}
}

// Copy using 0 as mask value
void cSCREEN::CopyBack0M(long PositionX,long PositionY,cTEXTURE *Destnation)
{
	int moduloS;
	int x,y;
	
	moduloS=(SizeX-Destnation->SizeX)*PixelLength;
	unsigned char *SourcePtr=FrontBuffer+(PositionX+PositionY*SizeX)*PixelLength;
	unsigned char *DestPtr=Destnation->TexturePtr;
	
	for(y=0;y<Destnation->SizeY;y++)
	{
		for(x=0;x<Destnation->SizeX;x++)
		{
			if (*SourcePtr!=0 && *(SourcePtr+1)!=0 && *(SourcePtr+2)!=0)
			{
				*DestPtr++=*SourcePtr++;
				*DestPtr++=*SourcePtr++;
				*DestPtr++=*SourcePtr++;
				SourcePtr+=PixelLength-3;
			}
			else 
				SourcePtr+=PixelLength;
		}
		SourcePtr+=moduloS;
	}
}
void cSCREEN::BlitArea0M(unsigned char *SourcePtr,int OffsetX,
						 int OffsetY,int SourceX,int SourceY)
{
	int moduloD;
	moduloD=(SizeX-SourceX)*PixelLength;
	unsigned char *DestPtr=FrontBuffer+(OffsetX+OffsetY*SizeX)*PixelLength;
	
	int x,y;
	
	for(y=0;y<SourceY;y++)
	{
		for(x=0;x<SourceX;x++)
		{
			if ((*SourcePtr)!=0 ||(*(SourcePtr+1))!=0 || (*(SourcePtr+2))!=0)
			{
				*DestPtr++=*SourcePtr++;
				*DestPtr++=*SourcePtr++;
				*DestPtr++=*SourcePtr++;
				DestPtr+=PixelLength-3;
			}
			else
			{
				DestPtr+=PixelLength;
				SourcePtr+=3;
			}
		}
		DestPtr+=moduloD;
	}
}

///////////////////////////////////////////////////////////////////////////////
// Mouse Cursor

void cSCREEN::MousePlot(long x,long y,unsigned char r,unsigned char g,unsigned char b)
{
	long temp=(y*SizeX+x);
	if (y>0)
	{
		MouseBuffer[0]=FrontBuffer[(temp-SizeX)*PixelLength+2];
		MouseBuffer[1]=FrontBuffer[(temp-SizeX)*PixelLength+1];
		MouseBuffer[2]=FrontBuffer[(temp-SizeX)*PixelLength];
		
		FrontBuffer[(temp-SizeX)*PixelLength]=~MouseBuffer[0];
		FrontBuffer[(temp-SizeX)*PixelLength+1]=~MouseBuffer[1];
		FrontBuffer[(temp-SizeX)*PixelLength+2]=~MouseBuffer[2];
	}
	if (x>0)
	{
		MouseBuffer[3]=FrontBuffer[(temp-1)*PixelLength+2];
		MouseBuffer[4]=FrontBuffer[(temp-1)*PixelLength+1];
		MouseBuffer[5]=FrontBuffer[(temp-1)*PixelLength];
		
		FrontBuffer[(temp-1)*PixelLength+2]=~MouseBuffer[3];
		FrontBuffer[(temp-1)*PixelLength+1]=~MouseBuffer[4];
		FrontBuffer[(temp-1)*PixelLength]=~MouseBuffer[5];
	}
	if (y<SizeY)
	{
		MouseBuffer[6]=FrontBuffer[(temp+SizeX)*PixelLength+2];
		MouseBuffer[7]=FrontBuffer[(temp+SizeX)*PixelLength+1];
		MouseBuffer[8]=FrontBuffer[(temp+SizeX)*PixelLength];
		
		FrontBuffer[(temp+SizeX)*PixelLength+2]=~MouseBuffer[6];
		FrontBuffer[(temp+SizeX)*PixelLength+1]=~MouseBuffer[7];
		FrontBuffer[(temp+SizeX)*PixelLength]=~MouseBuffer[8];
	}
	if (x<SizeX)
	{
		MouseBuffer[9]=FrontBuffer[(temp+1)*PixelLength+2];
		MouseBuffer[10]=FrontBuffer[(temp+1)*PixelLength+1];
		MouseBuffer[11]=FrontBuffer[(temp+1)*PixelLength];
		
		FrontBuffer[(temp+1)*PixelLength+2]=~MouseBuffer[9];
		FrontBuffer[(temp+1)*PixelLength+1]=~MouseBuffer[10];
		FrontBuffer[(temp+1)*PixelLength]=~MouseBuffer[11];
	}
}

void cSCREEN::MouseRemove(long x,long y)
{
	long temp=(y*SizeX+x);
	if (y>0)
	{
		FrontBuffer[(temp-SizeX)*PixelLength+2]=MouseBuffer[0];
		FrontBuffer[(temp-SizeX)*PixelLength+1]=MouseBuffer[1];
		FrontBuffer[(temp-SizeX)*PixelLength]=MouseBuffer[2];
	}
	if (x>0)
	{
		FrontBuffer[(temp-1)*PixelLength+2]=MouseBuffer[3];
		FrontBuffer[(temp-1)*PixelLength+1]=MouseBuffer[4];
		FrontBuffer[(temp-1)*PixelLength]=MouseBuffer[5];
	}
	if (y<SizeY)
	{
		FrontBuffer[(temp+SizeX)*PixelLength+2]=MouseBuffer[6];
		FrontBuffer[(temp+SizeX)*PixelLength+1]=MouseBuffer[7];
		FrontBuffer[(temp+SizeX)*PixelLength]=MouseBuffer[8];
	}
	if (x<SizeX)
	{
		FrontBuffer[(temp+1)*PixelLength+2]=MouseBuffer[9];
		FrontBuffer[(temp+1)*PixelLength+1]=MouseBuffer[10];
		FrontBuffer[(temp+1)*PixelLength]=MouseBuffer[11];
	}
}


/////////////////////////////////////////////////////////////////////////////
// ZBuffer

void cSCREEN::ClearZBuffer()
{
	int i;
	MFLOAT *ZBufferPtrTemp=&ZBuffer[0];
	for (i=0;i<SizeX*SizeY;i++)
		*ZBufferPtrTemp++=0;
}
void cSCREEN::ClearZBufferFast()
{
	int i;
	unsigned long *ZBufferClear=(unsigned long*) &ZBuffer[0];
	for(i=0;i<SizeX*SizeY;i++)
		*ZBufferClear++=0;	// Floating point 0.0=0x00000000
}
void cSCREEN::ClearZBufferArea(long x1,long y1,long x2,long y2)
{
	long moduloD;
	moduloD=(SizeX-(x2-x1));
	MFLOAT *Dest=ZBuffer+x1+y1*SizeX;
	
	long x,y;
	
	for(y=0;y<y2-y1;y++)
	{
		for(x=0;x<x2-x1;x++)
		{
			*Dest++=0;
		}
		Dest+=moduloD;
	}
}

///////////////////////////////////////////////////////////////////////////
// Filled Boxes

void cSCREEN::Box(long x1,long y1,long x2,long y2,unsigned char r,
				  unsigned char g,unsigned char b)
{
	long moduloD;
	moduloD=(SizeX-(x2-x1))*4;

	unsigned char *Dest=FrontBuffer+(x1+y1*SizeX)*PixelLength;
	
	long x,y;
	
	for(y=0;y<y2-y1;y++)
	{
		for(x=0;x<x2-x1;x++)
		{
			*Dest++=r;
			*Dest++=g;
			*Dest++=b;
			Dest+=PixelLength-3;
		}
		Dest+=moduloD;
	}
}

