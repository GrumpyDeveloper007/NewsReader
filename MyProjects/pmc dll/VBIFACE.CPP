#include "stdafx.h"

#include "cube.h"
#include "vbiface.h"

Cube CubeObject;	//	The single cube object which is accessed by VB when it runs code
FileClass FileObject;	//	The single file object which is accessed by VB when it runs code

char DllName2[] = "PMDLL.DLL/VBIFACE.CPP";
char sMessage2[1000];


DllExport int FAR PASCAL VBCubeArrayDraw(HDC hDC, int N)
{

int j;

	//Cube CubeObject;
	RECT r;

	GetClipBox(hDC, &r);
	
	//	Height should be set by drawing program
	CubeObject.Transform.Height = r.bottom - r.top;
	CubeObject.SetOrigin( 100, 100, 0);
	CubeObject.SetScale( 2, 2 );
	
	j=N;
	if(j<1)
		j=1;
	
	//	Colour should be set by the drawing program!
	HPEN NewPen = CreatePen(PS_SOLID, 0, RGB(0,0,255));		//	create blue pen color
	HBRUSH NewBrush = CreateSolidBrush(RGB(255,255,255));	//	create brush (white)

	HGDIOBJ OldPen = GetCurrentObject(hDC, OBJ_PEN);		//	remember old colour
	HGDIOBJ OldBrush = GetCurrentObject(hDC, OBJ_BRUSH);	//	remember old brush
	
	//	Set colours
	SelectObject(hDC, NewPen);
	SelectObject(hDC, NewBrush);

	CubeObject.DrawNCubehDC(hDC, j);

	//	Return Colours
	SelectObject(hDC, OldPen);
	SelectObject(hDC, OldBrush);

	//	Delete all unnecessary objects
	DeleteObject(NewPen);
	DeleteObject(NewBrush);

return j;
}


DllExport int FAR PASCAL VBWalkerDraw(HDC hDC)
{

int j;

	//Cube CubeObject;
	RECT r;
	VectorType SliceVectorMin, SliceVectorMax;

	GetClipBox(hDC, &r);
	
	//	Height should be set by drawing program!
	CubeObject.Transform.Height = r.bottom - r.top;
	CubeObject.SetOrigin( 100, 100, 0);
	CubeObject.SetScale( 2, 2 );
	
	//	Set the visibe slice through object
	SliceVectorMin.x = 0;
	SliceVectorMin.y = 0;
	SliceVectorMin.z = 0;
	SliceVectorMax.x = 11;
	SliceVectorMax.y = 5;
	SliceVectorMax.z = 4;

	//	Colour should be set by the drawing program!
	//	But we don't need to do it here because drawing program has such
	//	functionality built in.
	CubeObject.DrawCreateWalker(3);
	CubeObject.SetSliceVector(&SliceVectorMin, &SliceVectorMax);
	CubeObject.DrawWalkerhDC(hDC);
	CubeObject.DeleteAllCubes();

return j;
}


DllExport int FAR PASCAL VBAddCube(VBCubePointType *VBCubePoint)
{
	//	create a new cube so that it can be added to list
	CubePointType *CubePoint;
	CubePoint = new CubePointType;

	//	copy the data to the new cube
	CubePoint->ObjectTypeID = VBCubePoint->ObjectTypeID;	//	object type IDs denote draw types
	CubePoint->Position.x = VBCubePoint->x;
	CubePoint->Position.y = VBCubePoint->y;
	CubePoint->Position.z = VBCubePoint->z;
	CubePoint->Size = VBCubePoint->Size;
	CubePoint->BrushColor = RGB(255,255,255); //	brush colour is paint colour, pen colour is line drawing colour, background colour is separate as well

	if(CubePoint->ObjectTypeID == 2)
		CubePoint->BrushColor = RGB(0,0,128);	//	cursor - dark blue
	if(CubePoint->ObjectTypeID == 3)
		CubePoint->BrushColor = RGB(0,255,0);	//	specialised unit - green
	if(CubePoint->ObjectTypeID == 4)
		CubePoint->BrushColor = RGB(255,0,0);	//	fault condition	- red
	if(CubePoint->ObjectTypeID == 5)
		CubePoint->BrushColor = RGB(255,0,255);	//	object selection - magenta

	CubePoint->PenColor = RGB(0,0,255);
	CubePoint->Selection = 0;
	CubePoint->Move.x = 0;
	CubePoint->Move.y = 0;
	CubePoint->Move.z = 0;
	
	//	thread the new cube point into the list of all cube points
	CubeObject.AddCube( CubePoint );

	return 0;
}


//	Cubes are created with new and this will delete all cubes created and stored.
DllExport int FAR PASCAL VBDeleteAllCubes(void)
{
	CubeObject.DeleteAllCubes();
	return 0;
}


//	Draw cubes from cube point list for a given object id
DllExport int FAR PASCAL VBDrawObjecthDC(HDC hDC, int ObjectTypeID)
{

	//RECT r;
	//GetClipBox(hDC, &r);
	
	//	Height should be set by drawing program!
	//CubeObject.Transform.Height = r.bottom - r.top;




	RECT r;
	VectorType SliceVectorMin, SliceVectorMax;

	GetClipBox(hDC, &r);
	
	//	Height should be set by drawing program!
	CubeObject.Transform.Height = r.bottom - r.top;
	
	//CubeObject.SetOrigin( 100, 100, 0);	// modified 09/04/96 to take account of presetting of origin
	//CubeObject.SetScale( 2, 2 );
	
	//	Set the visibe slice through object
	SliceVectorMin.x = -100;
	SliceVectorMin.y = -100;
	SliceVectorMin.z = -100;
	SliceVectorMax.x = 100;
	SliceVectorMax.y = 100;
	SliceVectorMax.z = 100;

	//	Colour should be set by the drawing program!
	//	But we don't need to do it here because drawing program has such
	//	functionality built in.
	//CubeObject.DrawCreateWalker(3);
	CubeObject.SetSliceVector(&SliceVectorMin, &SliceVectorMax);






 	CubeObject.DrawObjecthDC(hDC, ObjectTypeID);
	return 0;
}



//	Set the slice vector where objects are cut off when drawn using VBDrawObjecthDC
DllExport int FAR PASCAL VBSliceVectorSet( VBSliceVectorType *SliceVector )
{
	VectorType SliceVectorMin, SliceVectorMax;

	SliceVectorMin.x = SliceVector->MinX;
	SliceVectorMin.y = SliceVector->MinY;
	SliceVectorMin.z = SliceVector->MinZ;

	SliceVectorMax.x = SliceVector->MaxX;
	SliceVectorMax.y = SliceVector->MaxY;
	SliceVectorMax.z = SliceVector->MaxZ;

	CubeObject.SetSliceVector(&SliceVectorMin, &SliceVectorMax);
	
	return 0;
}



//	Set the origin for drawing on window
DllExport int FAR PASCAL VBSetOrigin( int x, int y, int z )
{
 	CubeObject.SetOrigin( x, y, z );	
	return 0;
}


//	Set the scaling on x and y axis
DllExport int FAR PASCAL VBSetScale( int x, int y )
{
	CubeObject.SetScale( x, y );
	return 0;
}



DllExport int FAR PASCAL VBOpenFile(LPSTR FileName)
{
	int Success = (int)FileObject.FileOpen( FileName );
	return Success;
}						


DllExport int FAR PASCAL VBCloseFile()
{
	FileObject.FileClose();
	return 0L;
}						


DllExport int FAR PASCAL VBReadChar()
{
 	int ch = (int)FileObject.ReadChar();
	return ch;
}

DllExport int FAR PASCAL VBEof()
{
	if (FileObject.Eof)
	{
		return 1L;
	}
	else
	{
		return 0L;
	}
}


DllExport int FAR PASCAL VBEol()
{
	int Eol = 0;
	if(FileObject.Eol)
		Eol = 1;
	return Eol;
}
