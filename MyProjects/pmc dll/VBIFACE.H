//	VB4 Interface
#ifndef VB_INTERFACE
#define VB_INTERFACE


/*	Short hand for exporting a function	*/
#define DllExport __declspec( dllexport )
#define DllImport __declspec( dllimport )

//	used to pass in data about new cubes being added to the system
typedef struct tagVBCubePointType
{
	int ObjectTypeID;		//	Several objects may be present at the same time in list
	int x;					//	Position of cube
	int y;
	int z;
	int Size;				//	Size of robotic cube - larger sizes must respect rule which
							//	says they must be located at 0,0,0 in respect of their fractal cousin
							//	You can't use lower sizes than smallest size in use. They can however be larger.

} VBCubePointType, *LPVBCubePointType;


typedef struct tagVBSliceVectorType
{
	int MinX;	//	The coordinates at which chopping of the drawing using VBDrawObjecthDC will take place
	int MinY;
	int MinZ;
	int MaxX;
	int MaxY;
	int MaxZ;
	 	
} VBSliceVectorType, *LPVBSliceVectorType;


DllExport int FAR PASCAL VBCubeArrayDraw(HDC hDC, int N);
DllExport int FAR PASCAL VBWalkerDraw(HDC hDC);
DllExport int FAR PASCAL VBAddCube(VBCubePointType *VBCubePoint);
DllExport int FAR PASCAL VBDeleteAllCubes(void);
DllExport int FAR PASCAL VBDrawObjecthDC(HDC hDC, int ObjectTypeID);
DllExport int FAR PASCAL VBSliceVectorSet( VBSliceVectorType *SliceVector );
DllExport int FAR PASCAL VBSetOrigin( int x, int y, int z );
DllExport int FAR PASCAL VBSetScale( int x, int y );


DllExport int FAR PASCAL VBOpenFile(LPSTR FileName);
DllExport int FAR PASCAL VBReadChar();
DllExport int FAR PASCAL VBCloseFile();
DllExport int FAR PASCAL VBEof();
DllExport int FAR PASCAL VBEol();


#endif 	//	VB_INTERFACE
