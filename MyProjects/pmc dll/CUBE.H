//	Cube functionality

#ifndef CUBE_CLASS
#define CUBE_CLASS


//	This is used to work out the coordinate transforms from 3D to 2D representation
typedef struct tagTransformType
{
	int ScaleX;		//	These are scaling factors in terms of screen
	int ScaleY;
	int OriginX;	//	These are coordinates in terms of screen
	int OriginY;
	int OriginZ;
	int x;			//	These are coordinates in terms of cubes
	int y;
	int z;
	int Height;		//	Height of screen for use in inverting y axis

} TransformType, *LPTransformType;



typedef struct tagVector
{
	int x;		//	a vector
	int y;
	int z;

} VectorType, *LPVectorType;



//	This is used for defining a cube in 3D space including its colour and location
typedef struct tagCubePointType
{
	int ObjectTypeID;		//	Several objects may be present at the same time in list
	VectorType Position;	//	Position of cube
	int Size;				//	Size of robotic cube - larger sizes must respect rule which
							//	says they must be located at 0,0,0 in respect of their fractal cousin
							//	You can't use lower sizes than smallest size in use. They can however be larger.
	COLORREF BrushColor;
	COLORREF PenColor;	 	//	Not going to worry about pen colour for present
	int Selection;			//	Movement selector
							//	0 = not selected, 1 = selected. Other numbers could mean different
							//	things but not implemented at present
	VectorType Move;		//	Movement vector (multiple blocks can now move differently with
							//	each time step increment!)
	tagCubePointType *NextCubePoint;	//	Next cube point in the list

} CubePointType, *LPCubePointType;



class Cube
{
public:
	Cube();
	virtual ~Cube();

//	Draw preparation functions
public:
	void PrepareCubeDraw( POINT *DrawPoints, int N ); // prepares N points in an array for drawing
	void SetScale( int ScaleX, int ScaleY );	 	//	set the screen scaling
	void SetOrigin( int OriginX, int OriginY, int OriginZ );	//	screen origin

//	Objects
public:
	void DrawNCube(CDC *pDC, int N);	//	draw an N-Cube
	void DrawNCubehDC(HDC hDC, int N);
	void DrawCreateWalker( int Size );	//	creating a walking machine object
	void DrawWalker(CDC *pDC);			//	Draw a walking machine
	void DrawWalkerhDC(HDC hDC);		//	Draw a walking machine through hDC
	void DrawCube(CDC *pDC); 			//	Draw a cube according to an array of points
	void DrawCubehDC(HDC hDC); 			//	Draw a cube according to an array of points
	void DrawObjecthDC( HDC hDC, int ObjectTypeID );	//	Draw cubes from cube point list where object IDs correspond

//	List management
public:

	void AddCube(CubePointType *CubePoint);
	void DeleteCube(VectorType VectorPoint);	//	Deletes a particular cube point
	void DeleteAllCubes( void );				//	Deletes all cube points
	CubePointType* GetFirstCube( void );
	CubePointType* GetNextCube( void );
	CubePointType* GetNextCube( VectorType VectorPoint);	//	Gets cube from that point onwards
	CubePointType* GetRelativeCube( VectorType VectorPoint);	//	Gets cube relative from current position displaced by vector x,y,z
	void MoveCubes( void );			//	Moves all selected cubes by movement vector amount
	void MoveCubes( int Amount );	//	Amount to move by - by multiplying movement vector
									//	if movement vectors different - movements will be different to account for different speeds
									//	Jump movement without collision checks
	void SetSliceVector( VectorType *MinSliceVector, VectorType *MaxSliceVector);

//	Member variables
public:
	TransformType Transform;		//	The coordinate transformations are stored here
	CubePointType CubePointFirst;	//	First object in list of cubes
	CubePointType *CubePointCurrent;	//	Pointer to current cube
	VectorType SliceVectorMax;			//	Beyond this vector no cubes are reported
	VectorType SliceVectorMin;			//	Below this no cubes are reported

//	private member variables
private:
	POINT CubeTemplate[12];		//	The template of cube points which is intialised at construct time
};



/*******************************************************************************/


class FileClass
{
public:
	FileClass();
	virtual ~FileClass();

//	File reading functions
public:
	BOOL FileOpen( LPSTR FileName );
	void FileClose(void);
	char ReadChar( void );
	void NextSymbol(char *IncomingSymbol );

//	Member variables
public:
	HANDLE FileHandle;
	BOOL Eof;
	BOOL Eol;
	char ch;
	char IncomingSymbol[32];
	BOOL TooManyChars;
	DWORD BytesRead;
	int LineNumberCount;
};


#endif	//	CUBE_CLASS
