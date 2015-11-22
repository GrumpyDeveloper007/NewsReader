//	Cube functionality


#include "stdafx.h"

#include "cube.h"

char DllName[] = "PMDLL.DLL/CUBE.CPP";
char sMessage[1000];

//	Constructor
Cube::Cube()
{
 	//	Hold the series of points that will draw a cube
	CubeTemplate[0].x = 0;   CubeTemplate[0].y = 0;
	CubeTemplate[1].x = 10;  CubeTemplate[1].y = 0;
	CubeTemplate[2].x = 15;  CubeTemplate[2].y = 5;
	CubeTemplate[3].x = 15;  CubeTemplate[3].y = 15;
	CubeTemplate[4].x = 5;   CubeTemplate[4].y = 15;
	CubeTemplate[5].x = 0;   CubeTemplate[5].y = 10;
	CubeTemplate[6].x = 0;   CubeTemplate[6].y = 0;
	
	CubeTemplate[7].x = 0;   CubeTemplate[7].y = 10;
	CubeTemplate[8].x = 10;  CubeTemplate[8].y = 10;
	CubeTemplate[9].x = 15;  CubeTemplate[9].y = 15;

	CubeTemplate[10].x= 10;  CubeTemplate[10].y= 0;
	CubeTemplate[11].x= 10;  CubeTemplate[11].y= 10;

	CubePointFirst.NextCubePoint = NULL;	//	The constructor terminates the chain of cubes
	CubePointCurrent = &CubePointFirst;		//	The first CubePointFirst only uses its pointer - data is invalid!
}

//	Destructor
Cube::~Cube()
{
 	//	Delete All Cubes
	DeleteAllCubes();
}

void Cube::PrepareCubeDraw( POINT *DrawPoints, int N )
{
	//	Copy the reference cube into the drawpoint array of POINTs
	memcpy( DrawPoints, CubeTemplate, sizeof(POINT) * 12 ); 
	int i;
	for(i=0; i<N; i++)	//	scale and translate everything
	{
		DrawPoints[i].x *= Transform.ScaleX;	//	x,y scaling factor
		DrawPoints[i].y *= Transform.ScaleY;

		DrawPoints[i].x += (Transform.x * 11 + Transform.z * 6) * Transform.ScaleX;	//	cube relative movement
		DrawPoints[i].y += (Transform.y * 11 + Transform.z * 6) * Transform.ScaleY;

		DrawPoints[i].x += Transform.OriginX;	//	move relative to origin (0,0) = top left corner
		DrawPoints[i].y += Transform.OriginY;
		DrawPoints[i].y  = Transform.Height - DrawPoints[i].y;	// Since y is reversed on screen, need to reverse all y coordinates
		
	};
	return;
}


void Cube::DrawNCube(CDC *pDC, int N)
{
	int i,j,k;
	
	//	Go into a loop creating an NxNxN 3D cube
	for(k = N; k>0; k--)
	{
		for(j = N; j>0; j--)
		{
			for(i = 0; i<N; i++)
			{
				Transform.x = i; Transform.y = j; Transform.z = k;
				DrawCube( pDC );			//	draw the cube
			};
		};
	};

	return;
}


void Cube::DrawNCubehDC(HDC hDC, int N)
{
	int i,j,k;
	
	//	Go into a loop creating an NxNxN 3D cube
	for(k = N; k>0; k--)
	{
		for(j = 0; j<N; j++)
		{
			for(i = 0; i<N; i++)
			{
				Transform.x = i; Transform.y = j; Transform.z = k;
				DrawCubehDC( hDC );			//	draw the cube
			};
		};
	};

	return;
}



//	Set the slice vectors up
//	Anything below min value or above max value are not drawn.
void Cube::SetSliceVector( VectorType *MinSliceVector, VectorType *MaxSliceVector)
{
 	SliceVectorMin.x = MinSliceVector->x;
 	SliceVectorMin.y = MinSliceVector->y;
 	SliceVectorMin.z = MinSliceVector->z;

 	SliceVectorMax.x = MaxSliceVector->x;
 	SliceVectorMax.y = MaxSliceVector->y;
 	SliceVectorMax.z = MaxSliceVector->z;
}

void Cube::DrawCreateWalker( int Size )
{
	int i,j,k;

	CubePointType *CubePoint;

	//	Create the body of the walker
	for(j = 3; j<5; j++)
	{
		for(i = 1; i<11; i++)
		{
			CubePoint = new CubePointType;
			CubePoint->ObjectTypeID = 1;
			CubePoint->Position.x = i;
			CubePoint->Position.y = j;
			CubePoint->Position.z = 2;
			CubePoint->Size = Size;
			CubePoint->BrushColor = RGB(255,255,0);
			CubePoint->PenColor = RGB(0,0,255);
			CubePoint->Selection = 0;
			CubePoint->Move.x = 0;
			CubePoint->Move.y = 0;
			CubePoint->Move.z = 0;
			AddCube( CubePoint );
		};
	};

	//	create the legs of the walker
	for(k=1; k<4; k+=2)
	{
		for(i=2; i<7; i+=2)
		{
			for(j=1; j<4; j++)
			{
				CubePoint = new CubePointType;
				CubePoint->ObjectTypeID = 1;
				CubePoint->Position.x = i;
				CubePoint->Position.y = j;
				CubePoint->Position.z = k;
				CubePoint->Size = Size;
				CubePoint->BrushColor = RGB(255,0,0);
				CubePoint->PenColor = RGB(0,0,255);
				CubePoint->Selection = 0;
				CubePoint->Move.x = 0;
				CubePoint->Move.y = 0;
				CubePoint->Move.z = 0;
				AddCube( CubePoint );
			};
		};
	};


	return;
}

void Cube::DrawWalker( CDC *pDC )
{
	CBrush *OldBrush = pDC->GetCurrentBrush();
	CPen *OldPen = pDC->GetCurrentPen();

	CPen NewPen(PS_SOLID, 0, RGB(0,0,255));

	COLORREF OldCubeBrush = RGB(0,0,0);
	CBrush *NewBrush;
	NewBrush = new CBrush(OldCubeBrush);

	pDC->SelectObject(&NewPen);
	pDC->SelectObject(&NewBrush);

	//	Go into a loop creating an NxNxN 3D cube
	CubePointType *CubePointer = GetFirstCube();
	
	while(CubePointer != NULL)
	{
		if(CubePointer->Position.x > SliceVectorMin.x &&
		   CubePointer->Position.y > SliceVectorMin.y &&
		   CubePointer->Position.z > SliceVectorMin.z &&
		   CubePointer->Position.x < SliceVectorMax.x &&
		   CubePointer->Position.y < SliceVectorMax.y &&
		   CubePointer->Position.z < SliceVectorMax.z)	
		{
			Transform.x = CubePointer->Position.x;
			Transform.y = CubePointer->Position.y;
			Transform.z = CubePointer->Position.z;
			if(CubePointer->BrushColor != OldCubeBrush)
			{
			 	OldCubeBrush = CubePointer->BrushColor;
				pDC->SelectObject(OldBrush);
			 	delete NewBrush;
			 	NewBrush = new CBrush(OldCubeBrush);
				pDC->SelectObject(NewBrush);
			};
			DrawCube( pDC );			//	draw the cube
		}
		CubePointer = GetNextCube();
	};

	pDC->SelectObject(OldPen);
	pDC->SelectObject(OldBrush);

	delete NewBrush;
	return;
}




void Cube::DrawWalkerhDC( HDC hDC )
{
	HGDIOBJ OldPen = GetCurrentObject(hDC, OBJ_PEN);		//	remember old colour
	HGDIOBJ OldBrush = GetCurrentObject(hDC, OBJ_BRUSH);	//	remember old brush

	HPEN NewPen = CreatePen(PS_SOLID, 0, RGB(0,0,255));		//	create blue pen color
	HBRUSH NewBrush = CreateSolidBrush(RGB(0,0,0));	//	create brush (black)

	COLORREF OldCubeBrush = RGB(0,0,0);

	SelectObject(hDC, NewPen);
	SelectObject(hDC, NewBrush);

	//	Go into a loop creating an NxNxN 3D cube
	CubePointType *CubePointer = GetFirstCube();
	
	while(CubePointer != NULL)
	{
		if(CubePointer->Position.x > SliceVectorMin.x &&
		   CubePointer->Position.y > SliceVectorMin.y &&
		   CubePointer->Position.z > SliceVectorMin.z &&
		   CubePointer->Position.x < SliceVectorMax.x &&
		   CubePointer->Position.y < SliceVectorMax.y &&
		   CubePointer->Position.z < SliceVectorMax.z)	
		{
			Transform.x = CubePointer->Position.x;
			Transform.y = CubePointer->Position.y;
			Transform.z = CubePointer->Position.z;
			if(CubePointer->BrushColor != OldCubeBrush)
			{
			 	OldCubeBrush = CubePointer->BrushColor;
				SelectObject(hDC, OldBrush);
			 	DeleteObject(NewBrush);
			 	NewBrush = CreateSolidBrush(OldCubeBrush);
				SelectObject(hDC, NewBrush);
			};
			DrawCubehDC( hDC );			//	draw the cube
		}
		CubePointer = GetNextCube();
	};

	SelectObject(hDC, OldPen);
	SelectObject(hDC, OldBrush);

	DeleteObject(NewBrush);
	DeleteObject(NewPen);

	return;
}



void Cube::DrawObjecthDC( HDC hDC, int ObjectTypeID )
{
	HGDIOBJ OldPen = GetCurrentObject(hDC, OBJ_PEN);		//	remember old colour
	HGDIOBJ OldBrush = GetCurrentObject(hDC, OBJ_BRUSH);	//	remember old brush

	HPEN NewPen = CreatePen(PS_SOLID, 0, RGB(0,0,255));		//	create blue pen color
	HBRUSH NewBrush = CreateSolidBrush(RGB(0,0,0));	//	create brush (black)

	COLORREF OldCubeBrush = RGB(0,0,0);

	SelectObject(hDC, NewPen);
	SelectObject(hDC, NewBrush);

	//	Go into a loop drawing out the cubes in 3D space
	CubePointType *CubePointer = GetFirstCube();
	
	while(CubePointer != NULL)
	{
		//if(CubePointer->ObjectTypeID == ObjectTypeID)	//	check we have matching object
		//{
			if(CubePointer->Position.x > SliceVectorMin.x &&
			   CubePointer->Position.y > SliceVectorMin.y &&
			   CubePointer->Position.z > SliceVectorMin.z &&
			   CubePointer->Position.x < SliceVectorMax.x &&
			   CubePointer->Position.y < SliceVectorMax.y &&
			   CubePointer->Position.z < SliceVectorMax.z)	
			{
				Transform.x = CubePointer->Position.x;
				Transform.y = CubePointer->Position.y;
				Transform.z = CubePointer->Position.z;
				if(CubePointer->BrushColor != OldCubeBrush)
				{
				 	OldCubeBrush = CubePointer->BrushColor;
					SelectObject(hDC, OldBrush);
				 	DeleteObject(NewBrush);
				 	NewBrush = CreateSolidBrush(OldCubeBrush);
					SelectObject(hDC, NewBrush);
				};
				DrawCubehDC( hDC );			//	draw the cube
			};
		//};
		CubePointer = GetNextCube();
	};

	SelectObject(hDC, OldPen);
	SelectObject(hDC, OldBrush);

	DeleteObject(NewBrush);
	DeleteObject(NewPen);

	return;
}



//	Set the screen X and Y scale - alternatively you can do this by setting public variable
void Cube::SetScale( int ScaleX, int ScaleY )
{
 	Transform.ScaleX = ScaleX;
	Transform.ScaleY = ScaleY;
}


//	Set the screen origin - alternatively you can do this by setting public variable
void Cube::SetOrigin( int OriginX, int OriginY, int OriginZ )
{
	Transform.OriginX = OriginX;
	Transform.OriginY = OriginY;
	Transform.OriginZ = OriginZ;
}


//	Draw a cube according to an array of points	in point array
void Cube::DrawCube(CDC *pDC)
{
	POINT DrawPoints[12];

	//	Prepare a cube for drawing
	memcpy( DrawPoints, CubeTemplate, sizeof(POINT) * 12 ); 
	int i;
	for(i=0; i<12; i++)	//	scale and translate everything
	{
		DrawPoints[i].x *= Transform.ScaleX;	//	x,y scaling factor
		DrawPoints[i].y *= Transform.ScaleY;

		DrawPoints[i].x += (Transform.x * 11 + Transform.z * 6) * Transform.ScaleX;	//	cube relative movement
		DrawPoints[i].y += (Transform.y * 11 + Transform.z * 6) * Transform.ScaleY;

		DrawPoints[i].x += Transform.OriginX;	//	move relative to origin (0,0) = top left corner
		DrawPoints[i].y += Transform.OriginY;
		DrawPoints[i].y  = Transform.Height - DrawPoints[i].y;	// Since y is reversed on screen, need to reverse all y coordinates
	};

	//	draw the cube
	pDC->Polygon( DrawPoints, 7 );
	pDC->Polyline( &(DrawPoints[7]), 3 );
	pDC->Polyline( &(DrawPoints[10]), 2 );

}




//	Draw a cube according to an array of points	in point array
void Cube::DrawCubehDC(HDC hDC)
{
	POINT DrawPoints[12];

	//	Prepare a cube for drawing
	memcpy( DrawPoints, CubeTemplate, sizeof(POINT) * 12 ); 
	int i;
	for(i=0; i<12; i++)	//	scale and translate everything
	{
		DrawPoints[i].x *= Transform.ScaleX;	//	x,y scaling factor
		DrawPoints[i].y *= Transform.ScaleY;

		DrawPoints[i].x += (Transform.x * 11 + Transform.z * 6) * Transform.ScaleX;	//	cube relative movement
		DrawPoints[i].y += (Transform.y * 11 + Transform.z * 6) * Transform.ScaleY;

		DrawPoints[i].x += Transform.OriginX;	//	move relative to origin (0,0) = top left corner
		DrawPoints[i].y += Transform.OriginY;
		DrawPoints[i].y  = Transform.Height - DrawPoints[i].y;	// Since y is reversed on screen, need to reverse all y coordinates
	};

	//	draw the cube - colours should have been set by the object drawing program - as it has to change it less frequently!
	Polygon( hDC, DrawPoints, 7 );
	Polyline( hDC, &(DrawPoints[7]), 3 );
	Polyline( hDC, &(DrawPoints[10]), 2 );
}





//	When you want to add a cube, create it with new and then pass the pointer to it to this function
//	to thread which will link the other pointers so that its in the right place for quick rendering.
void Cube::AddCube(CubePointType *CubePoint)
{
	CubePoint->NextCubePoint = NULL;	//	do this for safety!	
	//	Deal with the special case of where the list is empty
	if(CubePointFirst.NextCubePoint == NULL)
	{
	 	CubePointFirst.NextCubePoint = CubePoint;
	}
	else	//	List is not empty
	{
		//	Travel down z
		CubePointType *CubePointer = CubePointFirst.NextCubePoint;
		CubePointType *CubePointerOld = &CubePointFirst;	//	remember older copies of cube pointer
		while(CubePointer->Position.z > CubePoint->Position.z)
		{
			CubePointerOld = CubePointer;
			if(CubePointer->NextCubePoint == NULL)	//	reached end of list
				break;
			CubePointer = CubePointer->NextCubePoint;
		};
		//	If both z are equal need to travel up y if not already at end of list
		//if((CubePointer->Position.z == CubePoint->Position.z) && (CubePointer->NextCubePoint != NULL))
		if(CubePointer->Position.z == CubePoint->Position.z)
		{
			while(CubePointer->Position.y < CubePoint->Position.y)
			{
				CubePointerOld = CubePointer;
				if(CubePointer->NextCubePoint == NULL)	//	reached end of list
					break;
				CubePointer = CubePointer->NextCubePoint;
				if(CubePointer->Position.z != CubePoint->Position.z)	// new code
					break;
			};

			//	If both y are equal, need to travel up x if not already at end of list
			//if((CubePointer->Position.y == CubePoint->Position.y) && (CubePointer->NextCubePoint != NULL))
			if(CubePointer->Position.y == CubePoint->Position.y)
			{
				while(CubePointer->Position.x < CubePoint->Position.x)
				{
					CubePointerOld = CubePointer;
					if(CubePointer->NextCubePoint == NULL)	//	reached end of list
						break;
					CubePointer = CubePointer->NextCubePoint;
					if(CubePointer->Position.z != CubePoint->Position.z || CubePointer->Position.y != CubePoint->Position.y)	// new code
						break;
				};

				//	The following section of code may be an error left over from original development
				//if(CubePointer->Position.x == CubePoint->Position.x)
				//{
				//	while(CubePointer->Position.y < CubePoint->Position.y)
				//	{
				//		CubePointerOld = CubePointer;
				//		if(CubePointer->NextCubePoint == NULL)	//	reached end of list
				//			break;
				//		CubePointer = CubePointer->NextCubePoint;
				//	};
				//} 
				//	Check we are not trying to insert duplicate cube!
				if((CubePointer->Position.x == CubePoint->Position.x) &&
				   (CubePointer->Position.y == CubePoint->Position.y) &&
				   (CubePointer->Position.z == CubePoint->Position.z))
				{	
					sprintf(sMessage,"Duplicate Cube\n x=%d\n y=%d\n z=%d",CubePoint->Position.x,CubePoint->Position.y,CubePoint->Position.z);
					::MessageBox(NULL, sMessage, DllName, MB_OK);
					return;
				}
			};
		}
		
		//	Now we insert - but first we got to check if we are at end of list
		if(CubePointerOld->NextCubePoint != NULL)
			CubePoint->NextCubePoint = CubePointerOld->NextCubePoint;

		CubePointerOld->NextCubePoint = CubePoint;
	}

}

//	Deletes a particular cube point
void Cube::DeleteCube(VectorType VectorPoint)
{

}

//	Deletes all cube points
void Cube::DeleteAllCubes( void )
{
	//	Go to the first cube, find its thread into other cubes, remember it
	//	then start deleting. Remember to set the pointer to first cube null when finished
	CubePointType *CubePointerNew;
	CubePointType *CubePointerOld = CubePointFirst.NextCubePoint;
	while(CubePointerOld != NULL)
	{
	  	CubePointerNew = CubePointerOld->NextCubePoint;
		delete CubePointerOld;
		CubePointerOld = CubePointerNew;
	};
	CubePointFirst.NextCubePoint = NULL;
}

CubePointType* Cube::GetFirstCube( void )
{
	CubePointCurrent = CubePointFirst.NextCubePoint;
	return CubePointCurrent;
}

CubePointType* Cube::GetNextCube( void )
{
	if(CubePointCurrent == NULL)
	{
		return NULL;
	}
	else
	{
		CubePointCurrent = CubePointCurrent->NextCubePoint;
		return CubePointCurrent;
	}
}

//	Gets cube from that point onwards
CubePointType* Cube::GetNextCube( VectorType VectorPoint)
{

return CubePointCurrent;
}

//	Gets cube relative from current position displaced by vector x,y,z
CubePointType* Cube::GetRelativeCube( VectorType VectorPoint)
{

return CubePointCurrent;
}

//	Moves all selected cubes by movement vector amount
void Cube::MoveCubes( void )
{

}

//	Amount to move by - by multiplying movement vector
//	if movement vectors different - movements will be different to account for different speeds
//	Jump movement without collision checks
void Cube::MoveCubes( int Amount )
{

}





/****************************************************************************/

FileClass::FileClass()
{
 	FileHandle = 0;
}


BOOL FileClass::FileOpen( LPSTR FileName )
{
	if(FileHandle != 0)
		FileClose();

	FileHandle = CreateFile(FileName, GENERIC_READ, 0, NULL, OPEN_EXISTING, FILE_FLAG_SEQUENTIAL_SCAN, NULL );

	Eof = FALSE;
	Eol = FALSE;
	ch = '\0';
	IncomingSymbol[0]='\0';
	TooManyChars = FALSE;
	BytesRead = 0;
	LineNumberCount = 0;
	if (FileHandle == INVALID_HANDLE_VALUE)
	{
	 	return FALSE;
	}
	else
	{
		return TRUE;
	};
}


FileClass::~FileClass()
{
	FileClose();
}


void FileClass::FileClose(void)
{
	CloseHandle( FileHandle );
}


//	This function reads the next character from the incoming line
char FileClass::ReadChar( void )
{

	if(Eof)
		return ch;

	Eof = ReadFile( FileHandle, &ch, 1, &BytesRead, NULL );

	Eof = !(Eof && BytesRead != 0);
	
	if(Eof)			   			//	Set string to a known state
		ch=0;

	if(ch=='\r')				  	
	{
		LineNumberCount++;		//	Note the number of lines read for reporting errors.
		Eol = TRUE;				//	Indicate end of line is reached.
	}
	else
	{
	 	Eol = FALSE;
	};

	if(Eof)		   				//	This is needed to break out of loops which solely check for Eol.
		Eol = TRUE;

	return ch;
}



void FileClass::NextSymbol(char *IncomingSymbol )
{
	int i=0;

	if(Eof)
		return;

	//	skip any white spaces and line separations
	while(!Eof && (ch=='\t' || ch==' ' || ch=='\r' || ch=='\n'))
	{
		ReadChar();
	};

	IncomingSymbol[i++] = ch;			//	ch='\0' if Eof is reached

	//	if character is not alphanumeric or Eof then return straight away
	if(Eof || !((ch>='0' && ch<='9') || 
			   (ch>='A' && ch<='Z') || 
			   (ch>='a' && ch<='z') || 
			   ch=='_' ) )
	{
		ReadChar();						//	Go past current character
		IncomingSymbol[i++] = '\0';		//	Terminate string
		return;
	};

	//	Read the string in
	while(!Eol && ((ch>='0' && ch<='9') || 
				   (ch>='A' && ch<='Z') || 
				   (ch>='a' && ch<='z') || 
				   ch=='_' ) )
	 	IncomingSymbol[i++] = ReadChar();

	IncomingSymbol[--i] = '\0';	//	Terminate the string
}

