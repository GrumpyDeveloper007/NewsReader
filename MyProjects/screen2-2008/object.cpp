
// Module - object
//
// Includes -
//   
//   
// 
// Coded by Dark Elf
//

//#include <math.h>
#include <string.h>

#include "types.h"
#include "object.h"
#include "cScreen.h"

const int ReadScale=10;
const int cMaxVectors=10000;          // Maximum allowed vectors
const int cMaxFaces=10000;            // Maximum polygons
const int cMaxSides=50;              // Maximum sides of a polygon
const int cMaxComponentTypes=100;

extern std::fstream dale;
extern long *PolyBuffer;
extern MFLOAT *ZBuffer;
extern cSCREEN MainWindow;
extern cTEXTURE *GlobalTextures;
//MFLOAT ZZ;

#include "leecode.h" // For texture mapping routine

extern long Alpha;

////////////////////////////////////////////////////////////////////////////////////////////////
// Scan conversion code, Span plotting code
// DrawPoly - Gouraud shaded polygon / ZBuffer
// DrawPolyZShade - Gouraud shaded polygon using z as shading value / ZBuffer

void cOBJECT::DrawSpanSimple(int startx,int endx,int y)
{
	static unsigned char *SpanPtr;
	static int x;

	if (startx<0)
		startx=0;
	if (endx>400)
		endx=400;
	
	if (y>=0/* && startx<endx*/)
	{
		SpanPtr=(unsigned char *)MainWindow.FrontBuffer+(y*MainWindow.SizeX+startx)*MainWindow.PixelLength;
		
		for (x=startx;x<endx;x++)
		{
			*(SpanPtr)=(unsigned char )(255);
			*(SpanPtr+1)=(unsigned char )(0);
			*(SpanPtr+2)=(unsigned char )(0);
				
			SpanPtr+=MainWindow.PixelLength;
		}
	}
}



void cOBJECT::DrawSpan(int startx,int endx,MFLOAT z1,MFLOAT z2,int y)
{
	static unsigned char *SpanPtr,pixt;
	static int x;
	static MFLOAT z,incz;
	static MFLOAT *zbuffer;
	static long *PolyBufferTemp;
	
	z=z1;
	if (y>=0/* && startx<endx*/)
	{
		PolyBufferTemp=&PolyBuffer[startx+y*320];
		zbuffer=&MainWindow.ZBuffer[y*MainWindow.SizeX+startx];
		SpanPtr=(unsigned char *)MainWindow.FrontBuffer+(y*MainWindow.SizeX+startx)*MainWindow.PixelLength;
		incz=(z2-z1)/(endx-startx);
		for(x=startx;x<endx;x++)
		{
			if (*zbuffer<z)
			{
				*PolyBufferTemp=(long)CurrentPolyNum;
				pixt=(unsigned char) ( (MFLOAT) (z*65536*2) )-100;
				*(SpanPtr)= pixt;
				*(SpanPtr+1)= pixt;
				*(SpanPtr+2)= pixt;
				*zbuffer=z;
			}
			SpanPtr+=MainWindow.PixelLength;
			zbuffer++;
			PolyBufferTemp++;
			z+=incz;
		}
	}
}


void cOBJECT::DrawSpan2(int startx,int endx,MFLOAT z1,MFLOAT z2,int y,
						MFLOAT pix,MFLOAT pix2)
{
	static unsigned char *SpanPtr;
	static int x;
	static MFLOAT z,incz;
	static MFLOAT *zbuffer;
	static MFLOAT incshade,shade;
	static long *PolyBufferTemp;
	
	if (y>=0/* && startx<endx*/)
	{
		z=z1;
		shade=pix;
		PolyBufferTemp=&PolyBuffer[startx+y*320];
		zbuffer=&MainWindow.ZBuffer[y*MainWindow.SizeX+startx];
		SpanPtr=(unsigned char *)MainWindow.FrontBuffer
			+(y*MainWindow.SizeX+startx)*MainWindow.PixelLength;
		
		incshade=((MFLOAT)pix2-pix)/(endx-startx);
		incz=(z2-z1)/(endx-startx);
		
		for (x=startx;x<endx;x++)
		{
			shade+=incshade;
			z+=incz;
			if (z<(*zbuffer))
			{
				*PolyBufferTemp=(long)CurrentPolyNum;
				*(SpanPtr)=(unsigned char )(shade);
				*(SpanPtr+1)=(unsigned char )(shade);
				*(SpanPtr+2)=(unsigned char )(shade);
				*(SpanPtr)=(unsigned char )(255);
				
				*zbuffer=z;
			}
			zbuffer++;
			PolyBufferTemp++;
			SpanPtr+=MainWindow.PixelLength;
		}
	}
}

void cOBJECT::DrawSpan3(int startx,int endx,MFLOAT z1,MFLOAT z2,int y,
	MFLOAT pixa,MFLOAT pixa2,MFLOAT pixb,MFLOAT pixb2,MFLOAT pixc,MFLOAT pixc2)
{
	static unsigned char *SpanPtr;
	static int x;
	static MFLOAT z,incz;
	static MFLOAT *zbuffer;
	static MFLOAT incshadea,shadea;
	static MFLOAT incshadeb,shadeb;
	static MFLOAT incshadec,shadec;
	static long *PolyBufferTemp;
	
	if (y>=0/* && startx<endx*/)
	{
		z=z1;
		shadea=pixa;
		shadeb=pixb;
		shadec=pixc;
		PolyBufferTemp=&PolyBuffer[startx+y*320];
		zbuffer=&MainWindow.ZBuffer[y*MainWindow.SizeX+startx];
		SpanPtr=(unsigned char *)MainWindow.FrontBuffer
			+(y*MainWindow.SizeX+startx)*MainWindow.PixelLength;
		
		incshadea=((MFLOAT)pixa2-pixa)/(endx-startx);
		incshadeb=((MFLOAT)pixb2-pixb)/(endx-startx);
		incshadec=((MFLOAT)pixc2-pixc)/(endx-startx);
		incz=(z2-z1)/(endx-startx);
		
		for (x=startx;x<endx;x++)
		{
			shadea+=incshadea;
			shadeb+=incshadeb;
			shadec+=incshadec;
			z+=incz;
			if (z<(*zbuffer))
			{
				*PolyBufferTemp=(long)CurrentPolyNum;
				*(SpanPtr)=(unsigned char )(shadea);
				*(SpanPtr+1)=(unsigned char )(shadeb);
				*(SpanPtr+2)=(unsigned char )(shadec);
				
				*zbuffer=z;
			}
			zbuffer++;
			PolyBufferTemp++;
			SpanPtr+=MainWindow.PixelLength;
		}
	}
}

// pass 2: alpha blend shading
void cOBJECT::DrawSpan4(int startx,int endx,MFLOAT z1,MFLOAT z2,int y,
	MFLOAT pixa,MFLOAT pixa2,MFLOAT pixb,MFLOAT pixb2,MFLOAT pixc,MFLOAT pixc2)
{
	static unsigned char *SpanPtr;
	static int x;
	static MFLOAT z,incz;
	static MFLOAT *zbuffer;
	static MFLOAT incshadea,shadea;
	static MFLOAT incshadeb,shadeb;
	static MFLOAT incshadec,shadec;
	static long *PolyBufferTemp;
	//static long r,g,b;
	
	if (y>=0/* && startx<endx*/)
	{
		z=z1;
		shadea=pixa;
		shadeb=pixb;
		shadec=pixc;
		PolyBufferTemp=&PolyBuffer[startx+y*320];
		zbuffer=&MainWindow.ZBuffer[y*MainWindow.SizeX+startx];
		SpanPtr=(unsigned char *)MainWindow.AlphaBuffer
			+(y*MainWindow.SizeX+startx)*MainWindow.PixelLength;
		
		incshadea=((MFLOAT)pixa2-pixa)/(endx-startx);
		incshadeb=((MFLOAT)pixb2-pixb)/(endx-startx);
		incshadec=((MFLOAT)pixc2-pixc)/(endx-startx);
		incz=(z2-z1)/(endx-startx);
		
		for (x=startx;x<endx;x++)
		{
			shadea+=incshadea;
			shadeb+=incshadeb;
			shadec+=incshadec;
			z+=incz;
			if (z<(*zbuffer))
			{
				*PolyBufferTemp=(long)CurrentPolyNum;
				*(SpanPtr)=(unsigned char )((shadea));
				*(SpanPtr+1)=(unsigned char )((shadeb));
				*(SpanPtr+2)=(unsigned char )((shadec));
				
				*zbuffer=z;
			}
			zbuffer++;
			PolyBufferTemp++;
			SpanPtr+=MainWindow.PixelLength;
		}
	}
}


////////////////////////////////////////////////////////////////////////////////////////////////
// DrawPoly - plots polygon 

void cOBJECT::DrawPoly(POLYGON *currentpoly)
{
	long signL,xL1,yL1,numeratorL,denominatorL,incrementL;
	long signR,xR1,yR1,numeratorR,denominatorR,incrementR;
	long i,top,yval,currentL,currentR,xL2,yL2,xR2,yR2,ystart,yend,yend1;
	MFLOAT zL1,zR1,zL2,zR2,inczL,inczR; // Z values for left and right point (used for z buffer)
	MFLOAT cL1,cR1,cL2,cR2,inccL,inccR; // light values ,current light left
	
	long numpoints=currentpoly->ClippedNumVectors;
	
	inccL=0;inccR=0;
	inczL=0;inczR=0;
	
	// determine bottom point
	yend1=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y>yend1)
		{
			yend1=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
		}
	}
	
	// Clip to bottom of screen (line 400)
	if (yend1>400)
		yend1=400;
	
	// determine top point
	top=0;
	yval=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y<yval)
		{
			yval=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
			top=i;
		}
	}
	
	currentL=top;
	currentR=top;
	
	xL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // start line left
	yL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL1=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	cL1=currentpoly->ClippedLightPoints[currentL].M;
	
	currentL++;
	if (currentL>numpoints-1)
		currentL=0;
	xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
	yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	cL2=currentpoly->ClippedLightPoints[currentL].M;
	
	numeratorL=xL2-xL1;
	signL=1;
	denominatorL=yL2-yL1;
	incrementL=denominatorL;
	if (denominatorL!=0)
	{
		inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
		inccL=(cL2-cL1)/denominatorL;
	}
	
	xR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // start line right
	yR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR1=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	cR1=currentpoly->ClippedLightPoints[currentR].M;
	
	currentR--;
	if (currentR<0)
		currentR=numpoints-1;
	xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
	yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR2=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	cR2=currentpoly->ClippedLightPoints[currentR].M;
	
	numeratorR=xR2-xR1;
	signR=1;
	denominatorR=yR2-yR1;
	incrementR=denominatorR;
	if (denominatorR!=0)
	{
		inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
		inccR=(cR2-cR1)/denominatorR;
	}
	
	if (numeratorL<0)
	{
		numeratorL=-numeratorL;
		signL=-signL;
	}
	
	if (numeratorR<0)
	{
		numeratorR=-numeratorR;
		signR=-signR;
	} 
	if (yL1<yR1)
		ystart=yL1;
	else
		ystart=yR1;
	
	
	while (ystart<yend1)
	{
		
		if (yL2<yR2)
			yend=yL2;
		else
			yend=yR2;
		if (yend>yend1)	// y clipping at maxY(400)
			yend=yend1;
		
		while (ystart<yend)
		{
			DrawSpan2(xL1,xR1,zL1,zR1,ystart,cL1,cR1);
			
			zL1+=inczL;
			zR1+=inczR;
			cL1+=inccL;
			cR1+=inccR;
			incrementL+=numeratorL;
			incrementR+=numeratorR;
			
			while (incrementL>denominatorL)
			{
				xL1+=signL;
				incrementL-=denominatorL;
			} 
			
			while (incrementR>denominatorR)
			{
				xR1+=signR;
				incrementR-=denominatorR;
			}
			ystart++;
		}
		
		if (yend==yL2) // end of left segment, get next line from list
		{
			xL1=xL2;
			yL1=yL2;
			zL1=zL2;
			cL1=cL2;
			
			currentL++;
			if (currentL>numpoints-1)
				currentL=0;
			xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
			yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
			zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
			cL2=currentpoly->ClippedLightPoints[currentL].M;
			
			numeratorL=xL2-xL1;
			signL=1;
			denominatorL=yL2-yL1;
			incrementL=denominatorL;
			if (denominatorL!=0)
			{
				inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
				inccL=(cL2-cL1)/denominatorL;
			}
			else 
			{
				inczL=0;
				inccL=0;
			}
			
			if (numeratorL<0)
			{
				numeratorL=-numeratorL;
				signL=-signL;
			}
		}
		else
		{
			if (yend==yR2)
			{
				xR1=xR2;
				yR1=yR2;
				zR1=zR2;
				cR1=cR2;
				
				
				currentR--;
				if (currentR<0)
					currentR=numpoints-1;
				xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
				yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
				zR2=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
				cR2=currentpoly->ClippedLightPoints[currentR].M;
				
				numeratorR=xR2-xR1;
				signR=1;
				denominatorR=yR2-yR1;
				incrementR=denominatorR;
				if (denominatorR!=0)
				{
					inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
					inccR=(cR2-cR1)/denominatorR;
				}
				else 
				{
					inczR=0;
					inccR=0;
				}
				
				
				if (numeratorR<0)
				{
					numeratorR=-numeratorR;
					signR=-signR;
				} 
				
			}
		}
 }
}
////////////////////////////////////////////////////////////////////////////////////////////////
void cOBJECT::DrawPolySimple(POLYGON *currentpoly)
{
	long signL,xL1,yL1,numeratorL,denominatorL,incrementL;
	long signR,xR1,yR1,numeratorR,denominatorR,incrementR;
	long i,top,yval,currentL,currentR,xL2,yL2,xR2,yR2,ystart,yend,yend1;
	
	long numpoints=currentpoly->NumVectors;
	
	// determine bottom point
	yend1=(long)TVectorsint[currentpoly->VectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectorsint[currentpoly->VectorIndex[i]].y>yend1)
		{
			yend1=(long)TVectorsint[currentpoly->VectorIndex[i]].y;
		}
	}
	
	// Clip to bottom of screen (line 400)
	if (yend1>400)
		yend1=400;
	
	// determine top point
	top=0;
	yval=(long)TVectorsint[currentpoly->VectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectorsint[currentpoly->VectorIndex[i]].y<yval)
		{
			yval=(long)TVectorsint[currentpoly->VectorIndex[i]].y;
			top=i;
		}
	}
	
	currentL=top; // Top most vector
	currentR=top;
	
	xL1=(long)TVectorsint[currentpoly->VectorIndex[currentL]].x; // start line left
	yL1=(long)TVectorsint[currentpoly->VectorIndex[currentL]].y;

	currentL++; // Move to next vector
	if (currentL>numpoints-1)
		currentL=0;
	xL2=(long)TVectorsint[currentpoly->VectorIndex[currentL]].x; // end line left
	yL2=(long)TVectorsint[currentpoly->VectorIndex[currentL]].y;
	
	numeratorL=xL2-xL1;
	signL=1;
	denominatorL=yL2-yL1;
	incrementL=denominatorL;
	
	xR1=(long)TVectorsint[currentpoly->VectorIndex[currentR]].x; // start line right
	yR1=(long)TVectorsint[currentpoly->VectorIndex[currentR]].y;
	
	currentR--;// Move to next vector
	if (currentR<0)
		currentR=numpoints-1;
	xR2=(long)TVectorsint[currentpoly->VectorIndex[currentR]].x; // end line right
	yR2=(long)TVectorsint[currentpoly->VectorIndex[currentR]].y;
	
	numeratorR=xR2-xR1;
	signR=1;
	denominatorR=yR2-yR1;
	incrementR=denominatorR;
	
	if (numeratorL<0)
	{
		numeratorL=-numeratorL;
		signL=-signL;
	}
	
	if (numeratorR<0)
	{
		numeratorR=-numeratorR;
		signR=-signR;
	} 
	if (yL1<yR1) // pointless at both values are from the same point
		ystart=yL1;
	else
		ystart=yR1;
	
	
	while (ystart<yend1)
	{
		
		if (yL2<yR2) // work out which side is higher (needs to be switched to next point first)
			yend=yL2;
		else
			yend=yR2;

		if (yend>yend1)	// y clipping at maxY(400)
			yend=yend1;
		
		while (ystart<yend)
		{
			DrawSpanSimple(xL1,xR1,ystart);
			
			incrementL+=numeratorL;
			incrementR+=numeratorR;
			
			while (incrementL>denominatorL) // increase x position until it crosses the next y line
			{
				xL1+=signL;
				incrementL-=denominatorL;
			} 
			
			while (incrementR>denominatorR)
			{
				xR1+=signR;
				incrementR-=denominatorR;
			}
			ystart++;
		}
		
		if (yend==yL2) // end of left segment, get next line from list
		{
			xL1=xL2;
			yL1=yL2;

			currentL++;
			if (currentL>numpoints-1)
				currentL=0;
			xL2=(long)TVectorsint[currentpoly->VectorIndex[currentL]].x; // end line left
			yL2=(long)TVectorsint[currentpoly->VectorIndex[currentL]].y;
			
			numeratorL=xL2-xL1;
			signL=1;
			denominatorL=yL2-yL1;
			incrementL=denominatorL;
			
			if (numeratorL<0)
			{
				numeratorL=-numeratorL;
				signL=-signL;
			}
		}
			if (yend==yR2)
			{
				xR1=xR2;
				yR1=yR2;
				
				currentR--;
				if (currentR<0)
					currentR=numpoints-1;
				xR2=(long)TVectorsint[currentpoly->VectorIndex[currentR]].x; // end line right
				yR2=(long)TVectorsint[currentpoly->VectorIndex[currentR]].y;
				
				numeratorR=xR2-xR1;
				signR=1;
				denominatorR=yR2-yR1;
				incrementR=denominatorR;
				
				
				if (numeratorR<0)
				{
					numeratorR=-numeratorR;
					signR=-signR;
				} 
				
		}
 }
}
////////////////////////////////////////////////////////////////////////////////////////////////


void cOBJECT::DrawPoly24(POLYGON *currentpoly)
{
	long signL,xL1,yL1,numeratorL,denominatorL,incrementL;
	long signR,xR1,yR1,numeratorR,denominatorR,incrementR;
	long i,top,yval,currentL,currentR,xL2,yL2,xR2,yR2,ystart,yend,yend1;

	MFLOAT zL1,zR1,zL2,zR2,inczL,inczR; // Z values for left and right point (used for z buffer)

	MFLOAT cLa1,cRa1,cLa2,cRa2,inccaL,inccaR; // light values ,current light left
	MFLOAT cLb1,cRb1,cLb2,cRb2,inccbL,inccbR; // light values ,current light left
	MFLOAT cLc1,cRc1,cLc2,cRc2,incccL,incccR; // light values ,current light left
	
	long numpoints=currentpoly->ClippedNumVectors;
	
	inccaL=0;inccaR=0;
	inccbL=0;inccbR=0;
	incccL=0;incccR=0;

	inczL=0;inczR=0;
	
	// determine bottom point
	yend1=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y>yend1)
		{
			yend1=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
		}
	}
	
	// Clip to bottom of screen (line 400)
	if (yend1>400)
		yend1=400;
	
	// determine top point
	top=0;
	yval=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y<yval)
		{
			yval=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
			top=i;
		}
	}
	
	currentL=top;
	currentR=top;
	
	xL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // start line left
	yL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL1=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	cLa1=currentpoly->ClippedLightPoints[currentL].R;
	cLb1=currentpoly->ClippedLightPoints[currentL].G;
	cLc1=currentpoly->ClippedLightPoints[currentL].B;
	
	currentL++;
	if (currentL>numpoints-1)
		currentL=0;
	xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
	yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	cLa2=currentpoly->ClippedLightPoints[currentL].R;
	cLb2=currentpoly->ClippedLightPoints[currentL].G;
	cLc2=currentpoly->ClippedLightPoints[currentL].B;
	
	numeratorL=xL2-xL1;
	signL=1;
	denominatorL=yL2-yL1;
	incrementL=denominatorL;
	if (denominatorL!=0)
	{
		inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
		inccaL=(cLa2-cLa1)/denominatorL;
		inccbL=(cLb2-cLb1)/denominatorL;
		incccL=(cLc2-cLc1)/denominatorL;
	}
	
	xR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // start line right
	yR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR1=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	cRa1=currentpoly->ClippedLightPoints[currentR].R;
	cRb1=currentpoly->ClippedLightPoints[currentR].G;
	cRc1=currentpoly->ClippedLightPoints[currentR].B;
	
	currentR--;
	if (currentR<0)
		currentR=numpoints-1;
	xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
	yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR2=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	cRa2=currentpoly->ClippedLightPoints[currentR].R;
	cRb2=currentpoly->ClippedLightPoints[currentR].G;
	cRc2=currentpoly->ClippedLightPoints[currentR].B;
	
	numeratorR=xR2-xR1;
	signR=1;
	denominatorR=yR2-yR1;
	incrementR=denominatorR;
	if (denominatorR!=0)
	{
		inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
		inccaR=(cRa2-cRa1)/denominatorR;
		inccbR=(cRb2-cRb1)/denominatorR;
		incccR=(cRc2-cRc1)/denominatorR;
	}
	
	if (numeratorL<0)
	{
		numeratorL=-numeratorL;
		signL=-signL;
	}
	
	if (numeratorR<0)
	{
		numeratorR=-numeratorR;
		signR=-signR;
	} 
	if (yL1<yR1)
		ystart=yL1;
	else
		ystart=yR1;
	
	
	
	while (ystart<yend1)
	{
		
		if (yL2<yR2)
			yend=yL2;
		else
			yend=yR2;
		if (yend>yend1)	// y clipping at maxY(400)
			yend=yend1;
		
		while (ystart<yend)
		{
			if (Alpha==1)
				DrawSpan4(xL1,xR1,zL1,zR1,ystart,cLa1,cRa1,cLb1,cRb1,cLc1,cRc1);
			else
				DrawSpan3(xL1,xR1,zL1,zR1,ystart,cLa1,cRa1,cLb1,cRb1,cLc1,cRc1);
			
			zL1+=inczL;
			zR1+=inczR;

			cLa1+=inccaL;
			cRa1+=inccaR;
			cLb1+=inccbL;
			cRb1+=inccbR;
			cLc1+=incccL;
			cRc1+=incccR;
			incrementL+=numeratorL;
			incrementR+=numeratorR;
			
			while (incrementL>denominatorL)
			{
				xL1+=signL;
				incrementL-=denominatorL;
			} 
			
			while (incrementR>denominatorR)
			{
				xR1+=signR;
				incrementR-=denominatorR;
			}
			ystart++;
		}
		
		if (yend==yL2) // end of left segment, get next line from list
		{
			xL1=xL2;
			yL1=yL2;
			zL1=zL2;
			cLa1=cLa2;
			cLb1=cLb2;
			cLc1=cLc2;
			
			currentL++;
			if (currentL>numpoints-1)
				currentL=0;
			xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
			yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
			zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
			cLa2=currentpoly->ClippedLightPoints[currentL].R;
			cLb2=currentpoly->ClippedLightPoints[currentL].G;
			cLc2=currentpoly->ClippedLightPoints[currentL].B;
			
			numeratorL=xL2-xL1;
			signL=1;
			denominatorL=yL2-yL1;
			incrementL=denominatorL;
			if (denominatorL!=0)
			{
				inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
				inccaL=(cLa2-cLa1)/denominatorL;
				inccbL=(cLb2-cLb1)/denominatorL;
				incccL=(cLc2-cLc1)/denominatorL;
			}
			else 
			{
				inczL=0;
				inccaL=0;
				inccbL=0;
				incccL=0;
			}
			
			if (numeratorL<0)
			{
				numeratorL=-numeratorL;
				signL=-signL;
			}
		}
		else
		{
			if (yend==yR2)
			{
				xR1=xR2;
				yR1=yR2;
				zR1=zR2;
				cRa1=cRa2;
				cRb1=cRb2;
				cRc1=cRc2;
				
				
				currentR--;
				if (currentR<0)
					currentR=numpoints-1;
				xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
				yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
				zR2=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
				cRa2=currentpoly->ClippedLightPoints[currentR].R;
				cRb2=currentpoly->ClippedLightPoints[currentR].G;
				cRc2=currentpoly->ClippedLightPoints[currentR].B;
				
				numeratorR=xR2-xR1;
				signR=1;
				denominatorR=yR2-yR1;
				incrementR=denominatorR;
				if (denominatorR!=0)
				{
					inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
					inccaR=(cRa2-cRa1)/denominatorR;
					inccbR=(cRb2-cRb1)/denominatorR;
					incccR=(cRc2-cRc1)/denominatorR;
				}
				else 
				{
					inczR=0;
					inccaR=0;
					inccbR=0;
					incccR=0;
				}
				
				
				if (numeratorR<0)
				{
					numeratorR=-numeratorR;
					signR=-signR;
				} 
				
			}
		}
 }
}

////////////////////////////////////////////////////////////////////////////////////////////////


void cOBJECT::DrawPolyZShade(POLYGON *currentpoly)
{
	long signL,xL1,yL1,numeratorL,denominatorL,incrementL;
	long signR,xR1,yR1,numeratorR,denominatorR,incrementR;
	long i,top,yval,currentL,currentR,xL2,yL2,xR2,yR2,ystart,yend,yend1;
	MFLOAT zL1,zR1,zL2,zR2,inczL,inczR; // Z values for left and right point (used for z buffer)
	
	long numpoints=currentpoly->ClippedNumVectors;
	
	inczL=0;inczR=0;
	
	// determine bottom point
	yend1=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y>yend1)
		{
			yend1=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
		}
	}
	// Clip to bottom of screen (line 400)
	if (yend1>400)
		yend1=400;
	
	// determine top point
	top=0;
	yval=(long)TVectors[currentpoly->ClippedVectorIndex[0]].y;
	for (i=1;i<numpoints;i++)
	{
		if ((long)TVectors[currentpoly->ClippedVectorIndex[i]].y<yval)
		{
			yval=(long)TVectors[currentpoly->ClippedVectorIndex[i]].y;
			top=i;
		}
	}
	
	currentL=top;
	currentR=top;
	
	xL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // start line left
	yL1=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL1=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	
	currentL++;
	if (currentL>numpoints-1)
		currentL=0;
	xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
	yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
	zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
	
	numeratorL=xL2-xL1;
	signL=1;
	denominatorL=yL2-yL1;
	incrementL=denominatorL;
	if (denominatorL!=0)
	{
		inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
	}
	
	xR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // start line right
	yR1=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR1=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	
	currentR--;
	if (currentR<0)
		currentR=numpoints-1;
	xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
	yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
	zR2=TVectors[currentpoly->ClippedVectorIndex[currentR]].z;
	
	numeratorR=xR2-xR1;
	signR=1;
	denominatorR=yR2-yR1;
	incrementR=denominatorR;
	if (denominatorR!=0)
	{
		inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
	}
	
	if (numeratorL<0)
	{
		numeratorL=-numeratorL;
		signL=-signL;
	}
	
	if (numeratorR<0)
	{
		numeratorR=-numeratorR;
		signR=-signR;
	} 
	if (yL1<yR1)
		ystart=yL1;
	else
		ystart=yR1;
	
	
	
	while (ystart<yend1)
	{
		
		if (yL2<yR2)
			yend=yL2;
		else
			yend=yR2;
		if (yend>yend1)	// y clipping at maxY(400)
			yend=yend1;
		
		while (ystart<yend)
		{
			DrawSpan(xL1,xR1,zL1,zR1,ystart);
			
			zL1+=inczL;
			zR1+=inczR;
			incrementL+=numeratorL;
			incrementR+=numeratorR;
			
			while (incrementL>denominatorL)
			{
				xL1+=signL;
				incrementL-=denominatorL;
			} 
			
			while (incrementR>denominatorR)
			{
				xR1+=signR;
				incrementR-=denominatorR;
			}
			ystart++;
		}
		
		if (yend==yL2) // end of left segment, get next line from list
		{
			xL1=xL2;
			yL1=yL2;
			zL1=zL2;
			
			currentL++;
			if (currentL>numpoints-1)
				currentL=0;
			xL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].x; // end line left
			yL2=(long)TVectors[currentpoly->ClippedVectorIndex[currentL]].y;
			zL2=TVectors[currentpoly->ClippedVectorIndex[currentL]].z;
			
			numeratorL=xL2-xL1;
			signL=1;
			denominatorL=yL2-yL1;
			incrementL=denominatorL;
			if (denominatorL!=0)
			{
				inczL=(zL2-zL1)/(MFLOAT)(denominatorL);
			}
			else 
			{
				inczL=0;
			}
			
			if (numeratorL<0)
			{
				numeratorL=-numeratorL;
				signL=-signL;
			}
		}
		else
		{
			if (yend==yR2)
			{
				xR1=xR2;
				yR1=yR2;
				zR1=zR2;
				
				
				currentR--;
				if (currentR<0)
					currentR=numpoints-1;
				xR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].x; // end line right
				yR2=(long)TVectors[currentpoly->ClippedVectorIndex[currentR]].y;
				zR2=TVectors[currentpoly->ClippedVectorIndex [currentR]].z;
				
				numeratorR=xR2-xR1;
				signR=1;
				denominatorR=yR2-yR1;
				incrementR=denominatorR;
				if (denominatorR!=0)
				{
					inczR=(zR2-zR1)/(MFLOAT)(denominatorR);
				}
				else 
				{
					inczR=0;
				}
				
				
				if (numeratorR<0)
				{
					numeratorR=-numeratorR;
					signR=-signR;
				} 
				
			}
		}
		
 }
}



////////////////////////////////////////////////////////////////////////////////////////////////
// Clipping routine 

void cOBJECT::clipx(POLYGON *poly,VECTOR *TVectors,long v1,long v2,long current,long xclip)
{
	MFLOAT x1=TVectors[poly->VectorIndex[v1]].x,y1=TVectors[poly->VectorIndex[v1]].y;
	MFLOAT x2=TVectors[poly->VectorIndex[v2]].x,y2=TVectors[poly->VectorIndex[v2]].y;
	MFLOAT z1=TVectors[poly->VectorIndex[v1]].z,z2=TVectors[poly->VectorIndex[v2]].z;
	long  l1=poly->LightPoints[v1].M,l2=poly->LightPoints[v2].M;
	
	// Adjust light value
	poly->ClippedLightPoints[current].M=(unsigned char) ((MFLOAT)l1+(xclip-x1)*(l2-l1)/(x2-x1));
	
	// Allocate new temp vector for clipping
	poly->ClippedVectorIndex[current]=NumVectorsT;
	TVectors[NumVectorsT].x=(MFLOAT)xclip;
	TVectors[NumVectorsT].y=(MFLOAT)y1+(xclip-x1)*(y2-y1)/(x2-x1);
	TVectors[NumVectorsT].z=(MFLOAT)z1+(xclip-x1)*(z2-z1)/(x2-x1);
	NumVectorsT++;
}

long cOBJECT::Clipper2(POLYGON *poly,VECTOR *TVectors, long minx,long maxx,long miny)
{
	long v1,v2;
	int i;
	long current=0;
	
	v1=poly->NumVectors-1;
	v2=0;
	for (i=0;i<poly->NumVectors;i++)
	{
		if (TVectors[poly->VectorIndex[v1]].x>minx)
		{
			if (TVectors[poly->VectorIndex[v2]].x>minx)
			{
				
				if (TVectors[poly->VectorIndex[v1]].x<maxx)
				{
					if (TVectors[poly->VectorIndex[v2]].x<maxx)
					{
						poly->ClippedVectorIndex[current]=poly->VectorIndex[v1];
						poly->ClippedLightPoints[current]=poly->LightPoints[v1];
						current++;
					}
					else
					{
						poly->ClippedVectorIndex[current]=poly->VectorIndex[v1];
						poly->ClippedLightPoints[current]=poly->LightPoints[v1];
						current++;
						clipx(poly,TVectors,v1,v2,current,maxx);
						current++;
					}
				}
				else
				{
					if (TVectors[poly->VectorIndex[v2]].x<maxx)
					{
						clipx(poly,TVectors,v1,v2,current,maxx);
						current++;
					}
				}  
				
			}
			else
			{
				poly->ClippedVectorIndex[current]=poly->VectorIndex[v1];
				poly->ClippedLightPoints[current]=poly->LightPoints[v1];
				current++;
				clipx(poly,TVectors,v1,v2,current,0);
				current++;
			}
		}
		else
		{
			if (TVectors[poly->VectorIndex[v2]].x>minx)
			{
				if (TVectors[poly->VectorIndex[v2]].x>maxx)
				{
					clipx(poly,TVectors,v1,v2,current,maxx);
					current++;
				}
				clipx(poly,TVectors,v1,v2,current,0);
				current++;
				
			}
		}  
		
		v1=v2;
		v2++;
	}
	
	
	poly->ClippedNumVectors=current;
	return 0;
}
////////////////////////////////////////////////////////////////////////////////////////////////

cOBJECT::cOBJECT()
{
	NumPolygons=0;
	NumVectors=0;
	Polygons=NULL;
	Vectors=NULL;
	RVectors=NULL;
	TVectors=NULL;
	CX=0;CY=0;CZ=0;BR=0;
	ScaleFactor=1;
}

long cOBJECT::InitTransform()
{
	int i;
	for(i=0;i<NumVectors;i++)
	{
		RVectors[i].x=0;
		RVectors[i].y=0;
		RVectors[i].z=0;

		RVectorsint[i].x=0;
		RVectorsint[i].y=0;
		RVectorsint[i].z=0;
	}
	return 0;
}

MFLOAT mysin(MFLOAT Angle)
{
	MFLOAT sin;
//always wrap input angle to -PI..PI
while (Angle < -3.14159265)
   Angle += (MFLOAT)6.28318531;
while (Angle >  (MFLOAT)3.14159265)
    Angle -= (MFLOAT)6.28318531;

//compute sine
if (Angle < 0)    
sin = (MFLOAT)1.27323954 * Angle + (MFLOAT).405284735 * Angle * Angle;
else    
sin = (MFLOAT)1.27323954 * Angle - (MFLOAT)0.405284735 * Angle * Angle;
	return sin;
}

INT64 mysinint64(INT64 Angle)
{
	INT64 sin;
//always wrap input angle to -PI..PI
while (Angle < (-205884))
   Angle += 411768;
while (Angle >  205884)
    Angle -= 411768;

//compute sine
if (Angle < 0)    
sin = ((INT64)83441 * (INT64)Angle + ((INT64)26560 * (INT64)Angle * (INT64)Angle)/65536)/65536;
else    
sin = ((INT64)83441 * (INT64)Angle - ((INT64)26560 * (INT64)Angle * (INT64)Angle)/65536)/65536;
	return sin;
}
int mysinint(int Angle)
{
	int sin;
//always wrap input angle to -PI..PI
while (Angle < (-804))
   Angle += 1608;
while (Angle >  804)
    Angle -= 1608;

//compute sine
if (Angle < 0)    
sin = (325 * Angle + (103 * Angle * Angle)/256)/256;
else    
sin = (325 * Angle - (103 * Angle * Angle)/256)/256;
	return sin;
}

MFLOAT mycos(MFLOAT Angle)
{
	MFLOAT cos;
//compute cosine: sin(x + PI/2) = cos(x)
while (Angle < -3.14159265)
   Angle += (MFLOAT)6.28318531;
while (Angle >  (MFLOAT)3.14159265)
    Angle -= (MFLOAT)6.28318531;

	
	Angle += (MFLOAT)1.57079632;
if (Angle >  (MFLOAT)3.14159265)
    Angle -= (MFLOAT)6.28318531;
if (Angle < 0)
    cos = (MFLOAT)1.27323954 * Angle + (MFLOAT)0.405284735 * Angle * Angle;
else    
cos = (MFLOAT)1.27323954 * Angle - (MFLOAT)0.405284735 * Angle * Angle;
return cos;
}


int mycosint(int Angle)
{
	int cos;
//compute cosine: sin(x + PI/2) = cos(x)
while (Angle < -804)
   Angle += 1608;
while (Angle >  804)
    Angle -= 1608;

	Angle += 402;
if (Angle >  804)
    Angle -= 1608;
if (Angle < 0)
    cos = (325 * Angle + (103 * Angle * Angle)/256)/256;
else    
	cos = (325 * Angle - (103 * Angle * Angle)/256)/256;
return cos;
}


long cOBJECT::RotateXYZ(MFLOAT AngleXZ,MFLOAT AngleYZ,MFLOAT AngleXY,long Status)
{
	int i;
	MFLOAT sinXZ,cosXZ,sinYZ,cosYZ,sinXY,cosXY,
		TX,TY,TZ,TZ2,TX3,TY3;
	int sinXZint,cosXZint,sinYZint,cosYZint,sinXYint,cosXYint,TXint,TYint,TZint,TZ2int,TX3int,TY3int;
	
	if (Status==INIT)
	{
		//sinXZ=(MFLOAT)mysinint64(AngleXZ*65536)/65536;

		sinXZint=mysinint((int)(AngleXZ*256));
		cosXZint=mycosint((int)(AngleXZ*256));
		sinYZint=mysinint((int)(AngleYZ*256));
		cosYZint=mycosint((int)(AngleYZ*256));
		sinXYint=mysinint((int)(AngleXY*256));
		cosXYint=mycosint((int)(AngleXY*256));

		sinXZ=(MFLOAT)mysin(AngleXZ);
		cosXZ=(MFLOAT)mycos(AngleXZ);
		sinYZ=(MFLOAT)mysin(AngleYZ);
		cosYZ=(MFLOAT)mycos(AngleYZ);
		sinXY=(MFLOAT)mysin(AngleXY);
		cosXY=(MFLOAT)mycos(AngleXY);
		
		for(i=0;i<NumVectors;i++)
		{
			int x,y,z,intScaleFactor;
			intScaleFactor=(int)(ScaleFactor*256);
			x=((int)(Vectors[i].x*256)*intScaleFactor)/256;
			y=((int)(Vectors[i].y*256)*intScaleFactor)/256;
			z=((int)(Vectors[i].z*256)*intScaleFactor)/256;
			TXint=(x*cosXZint+z*sinXZint)/256;
			TZint=(-x*sinXZint+z*cosXZint)/256;
			
			TYint=(y*cosYZint+TZint*sinYZint)/256;
			TZ2int=(-y*sinYZint+TZint*cosYZint)/256;
			
			TX3int=(TXint*cosXYint+TYint*sinXYint)/256;
			TY3int=(-TXint*sinXYint+TYint*cosXYint)/256;
			RVectorsint[i].x=TX3int;
			RVectorsint[i].y=TY3int;
			RVectorsint[i].z=TZ2int;


			TX=Vectors[i].x*ScaleFactor*cosXZ+Vectors[i].z*ScaleFactor*sinXZ;
			TZ=-Vectors[i].x*ScaleFactor*sinXZ+Vectors[i].z*ScaleFactor*cosXZ;
			
			TY=Vectors[i].y*ScaleFactor*cosYZ+TZ*sinYZ;
			TZ2=-Vectors[i].y*ScaleFactor*sinYZ+TZ*cosYZ;
			
			TX3=TX*cosXY+TY*sinXY;
			TY3=-TX*sinXY+TY*cosXY;
			RVectors[i].x=TX3;
			RVectors[i].y=TY3;
			RVectors[i].z=TZ2;

		}
	}
	return 0;
}

long cOBJECT::Read3DO(char *filename)
{
	char buffer[500];		// temp field buffer
	char *bufferptr=&buffer[0];
	POLYGON *polylist;              // temp object buffer 
	long currentpoly=0;              // current polygon number
	long *vectorindexlist;
	long TextureID;
	FRAMECOMPONENT *FrameComponentList;
	cFRAMECOMPONENTTYPE *FrameComponentTypeList;
	VECTOR *tempvectorlist;
	std::fstream   reader;
	int i=0,num,polynum,t,vect;
	MFLOAT x,y,z;
	long NumComponents;
	
	long NumStates;
	long ComponentNum,NumPolygonsComponent;
	
	// Allocate a large amount of tempory memory for loading of object
	vectorindexlist=new long[cMaxSides];
	tempvectorlist=new VECTOR[cMaxVectors];
	polylist=new POLYGON[cMaxFaces];
	FrameComponentList=new FRAMECOMPONENT[cMaxFaces];
	FrameComponentTypeList=new cFRAMECOMPONENTTYPE[cMaxComponentTypes];
	
	// Open File, read ahead
	reader.open(filename,std::ios::in);
	reader >>buffer;
	
	// Read vectors (allways stored at begining of file)
	while (i<cMaxVectors && strcmp(bufferptr,(char *)"DYN_POLYGON")!=0 )
	{
		if (strcmp(bufferptr,(char *)"DYN_VERTEX")==0 )	// Ignore unwanted information
		{
			reader >> num;
			reader >> x;
			reader >> y;
			reader >> z;
			tempvectorlist[i].x=x*ReadScale;
			tempvectorlist[i].y=y*ReadScale;
			tempvectorlist[i].z=z*ReadScale;
			i++;
		}
		reader >>buffer;
		if (!reader)
			break;
	}
	
	NumVectors=i;	// Store total number of vectors
	
	i=0;
	polynum=0;
	int sides;
	NumComponents=0;
	
	// Read polygon information
	while (i<cMaxFaces)     // Get polygon information
	{
		
		if (strcmp(bufferptr,(char *)"FRAMESTATE")==0)
		{
			reader>>ComponentNum;
			reader>>NumStates;
			FrameComponentTypeList[ComponentNum].CurrentState=0;
			FrameComponentTypeList[ComponentNum].FrameType=new long[NumStates];
			FrameComponentTypeList[ComponentNum].NumStates=NumStates;
			FrameComponentTypeList[ComponentNum].Start=new FRAMECOMPONENTSTATE[NumStates];
			FrameComponentTypeList[ComponentNum].End=new FRAMECOMPONENTSTATE[NumStates];
			for (t=0;t<NumStates;t++)
			{
				reader >>FrameComponentTypeList[ComponentNum].FrameType[t];
				reader >>FrameComponentTypeList[ComponentNum].Start[t].ox;
				reader >>FrameComponentTypeList[ComponentNum].Start[t].oy;
				reader >>FrameComponentTypeList[ComponentNum].Start[t].oz;
				reader >>FrameComponentTypeList[ComponentNum].Start[t].dx;
				reader >>FrameComponentTypeList[ComponentNum].Start[t].dy;
				reader >>FrameComponentTypeList[ComponentNum].Start[t].dz;
				
				reader >>FrameComponentTypeList[ComponentNum].End[t].ox;
				reader >>FrameComponentTypeList[ComponentNum].End[t].oy;
				reader >>FrameComponentTypeList[ComponentNum].End[t].oz;
				reader >>FrameComponentTypeList[ComponentNum].End[t].dx;
				reader >>FrameComponentTypeList[ComponentNum].End[t].dy;
				reader >>FrameComponentTypeList[ComponentNum].End[t].dz;
			}
		}
		if (strcmp(bufferptr,(char *)"FRAMECOMPONENT")==0)
		{
			NumComponents++;
			reader >>ComponentNum;
			reader >>NumPolygonsComponent;
			
			FrameComponentList[ComponentNum].PolygonList=new unsigned long[NumPolygonsComponent];
			FrameComponentList[ComponentNum].NumPolygons=NumPolygonsComponent;
			for (t=0;t<NumPolygonsComponent;t++)
			{
				reader>>FrameComponentList[ComponentNum].PolygonList[t];
			}
		}
		
		// Load polygon data	
		if (strcmp(bufferptr,(char *)"DYN_POLYGON")==0 )
		{
			
			reader >> num;		// FORMAT: poly number,number of sides(n),vector*n,
			// RGB lighting values+texture coordinates*n 
			reader >> sides;
			
			polylist[currentpoly].NumVectors=sides;
			polylist[currentpoly].VectorIndex=new long[sides];
			polylist[currentpoly].ClippedVectorIndex=new long[sides*2];
			
			for (t=0;t<sides;t++)
			{
				reader >> vect;
				polylist[currentpoly].VectorIndex[t]=vect;
			}
			
			polylist[currentpoly].LightPoints=new LIGHT[sides];
			polylist[currentpoly].TexturePoints=new TEXTUREXY[sides];
			polylist[currentpoly].ClippedLightPoints=new LIGHT[sides*2];
			polylist[currentpoly].ClippedTexturePoints=new TEXTUREXY[sides*2];
			
			for (t=0;t<sides;t++)
			{			// read RGB/Texture value for each vertex, convert and store mono value
				
				// colour information
				long r,g,b;
				reader >> r;
				reader >> g;
				reader >> b;
				polylist[currentpoly].LightPoints[t].R=(unsigned char)r;
				polylist[currentpoly].LightPoints[t].G=(unsigned char)g;
				polylist[currentpoly].LightPoints[t].B=(unsigned char)b;
				polylist[currentpoly].LightPoints[t].M=( (polylist[currentpoly].LightPoints[t].R +
					polylist[currentpoly].LightPoints[t].G + polylist[currentpoly].LightPoints[t].B)/3);
				
				// Texture coordinates for each vertex
				reader >> polylist[currentpoly].TexturePoints[t].TX;
				reader >> polylist[currentpoly].TexturePoints[t].TY;
				
			}
			
			// Load texture number for that polygon
			reader >> TextureID;
			polylist[currentpoly].TextureID=TextureID;
			currentpoly++;
		}
		reader >> buffer;
		if (!reader)		// If end of file --
			break;
	}
	
	// Allocate using list to the exact static size and copy from loader memory
	NumPolygons=currentpoly;
	Polygons= new POLYGON[currentpoly];
	TVectors= new VECTOR[NumVectors+NumVectors];
	TVectorsint= new VECTORint[NumVectors+NumVectors];
	RVectors= new VECTOR[NumVectors];
	RVectorsint= new VECTORint[NumVectors];
	Vectors= new VECTOR[NumVectors];
	for (t=0;t<NumVectors;t++)
		Vectors[t]=tempvectorlist[t];
	
	for (t=0;t<currentpoly;t++)
		Polygons[t]=polylist[t];
	
	Frame.ComponentList=new FRAMECOMPONENT[NumComponents];
	Frame.ComponentStates=new cFRAMECOMPONENTTYPE[NumComponents];
	Frame.NumComponents=NumComponents;
	for (t=0;t<NumComponents;t++)
	{
		Frame.ComponentStates[t]=FrameComponentTypeList[t];
		Frame.ComponentList[t]=FrameComponentList[t];
	}
	
	
	
	// De-allocate memory
	delete FrameComponentList;
	delete FrameComponentTypeList;
	delete vectorindexlist;
	delete tempvectorlist;
	delete polylist;
	
	return 0; // No error checking yet
}

long cOBJECT::ReadCube()
{

/*DEFINE DYNA_VERTEX 9
DEFINE DYNA_POLYGON 7
CLASS DYN_VERTEX 0 0 0 0
CLASS DYN_VERTEX 1 0 0 0
CLASS DYN_VERTEX 2 0 2 0
CLASS DYN_VERTEX 3 2 2 0
CLASS DYN_VERTEX 4 2 0 0
CLASS DYN_VERTEX 5 0 0 2
CLASS DYN_VERTEX 6 0 2 2
CLASS DYN_VERTEX 7 2 2 2
CLASS DYN_VERTEX 8 2 0 2
*/
	Polygons= new POLYGON[7];
	TVectors= new VECTOR[9];
	TVectorsint= new VECTORint[9];
	RVectors= new VECTOR[9];
	RVectorsint= new VECTORint[9];
	Vectors= new VECTOR[9];

	Vectors[0].x=0;
	Vectors[0].y=0;
	Vectors[0].z=0;

	Vectors[1].x=0;
	Vectors[1].y=0;
	Vectors[1].z=0;

	Vectors[2].x=0;
	Vectors[2].y=20;
	Vectors[2].z=0;

	Vectors[3].x=20;
	Vectors[3].y=20;
	Vectors[3].z=00;

	Vectors[4].x=20;
	Vectors[4].y=00;
	Vectors[4].z=00;

	Vectors[5].x=00;
	Vectors[5].y=00;
	Vectors[5].z=20;

	Vectors[6].x=00;
	Vectors[6].y=20;
	Vectors[6].z=20;

	Vectors[7].x=20;
	Vectors[7].y=20;
	Vectors[7].z=20;

	Vectors[8].x=20;
	Vectors[8].y=00;
	Vectors[8].z=20;
	
	NumVectors=9;	// Store total number of vectors
	NumPolygons=6;

	int sides;

	// RGB lighting values+texture coordinates*n 
	sides=4;

	for (int i=0;i<7;i++)
	{
		Polygons[i].NumVectors=sides;
		Polygons[i].VectorIndex=new long[sides];
		Polygons[i].ClippedVectorIndex=new long[sides*2];
		Polygons[i].LightPoints=new LIGHT[sides];
		Polygons[i].TexturePoints=new TEXTUREXY[sides];
		Polygons[i].TexturePoints[0].TX =0;
		Polygons[i].TexturePoints[0].TY =0;
		Polygons[i].TexturePoints[1].TX =0;
		Polygons[i].TexturePoints[1].TY =0;
		Polygons[i].TexturePoints[2].TX =0;
		Polygons[i].TexturePoints[2].TY =0;
		Polygons[i].TexturePoints[3].TX =0;
		Polygons[i].TexturePoints[3].TY =0;
		Polygons[i].ClippedLightPoints=new LIGHT[sides*2];
		Polygons[i].ClippedTexturePoints=new TEXTUREXY[sides*2];
		Polygons[i].TextureID =0;
	}

	/*
CLASS DYN_POLYGON 0 4 4 3 2 1 16 16 171 103 75 16 16 222 63 63 16 16 154 63 0 16 16 198 0 0 0
xxCLASS DYN_POLYGON 1 4 5 6 2 1 182 180 16 0 63 182 182 16 63 63 182 182 16 63 0 182 181 16 0 0 0
CLASS DYN_POLYGON 2 4 8 7 3 4 205 200 16 0 63 202 200 16 63 63 205 202 16 63 0 154 153 16 0 0 0
CLASS DYN_POLYGON 3 4 3 7 6 2 16 222 16 0 63 16 222 16 63 63 16 222 16 63 0 16 113 16 0 0 0

CLASS DYN_POLYGON 4 4 5 8 4 1 16 16 227 0 63 16 16 227 63 63 16 16 227 63 0 16 16 227 0 0 0
CLASS DYN_POLYGON 5 4 6 7 8 5 16 216 215 0 63 16 216 216 63 63 16 216 216 63 0 16 216 216 0 0 0
CLASS DYN_POLYGON 6 4 2 6 5 1 213 16 16 0 63 216 16 16 63 63 216 16 16 63 0 216 16 16 0 0 0
*/

	Polygons[0].VectorIndex[0]=4;
	Polygons[0].VectorIndex[1]=3;
	Polygons[0].VectorIndex[2]=2;
	Polygons[0].VectorIndex[3]=1;
			
	Polygons[1].VectorIndex[0]=8;
	Polygons[1].VectorIndex[1]=7;
	Polygons[1].VectorIndex[2]=3;
	Polygons[1].VectorIndex[3]=4;

	Polygons[2].VectorIndex[0]=3;
	Polygons[2].VectorIndex[1]=7;
	Polygons[2].VectorIndex[2]=6;
	Polygons[2].VectorIndex[3]=2;

	Polygons[3].VectorIndex[0]=5;
	Polygons[3].VectorIndex[1]=8;
	Polygons[3].VectorIndex[2]=4;
	Polygons[3].VectorIndex[3]=1;

	Polygons[4].VectorIndex[0]=6;
	Polygons[4].VectorIndex[1]=7;
	Polygons[4].VectorIndex[2]=8;
	Polygons[4].VectorIndex[3]=5;

	Polygons[5].VectorIndex[0]=2;
	Polygons[5].VectorIndex[1]=6;
	Polygons[5].VectorIndex[2]=5;
	Polygons[5].VectorIndex[3]=1;

	return 0; // No error checking yet
}


void cOBJECT::Write3DO(char *filename)
{
	std::fstream reader;
	int i=0,t;
	POLYGON *currentpoly=NULL;
	
	reader.open(filename,std::ios::out);
	
	// Write unnessary define data
	reader <<"DEFINE DYNA_VERTEX "<<NumVectors<<std::endl;
	reader <<"DEFINE DYNA_POLYGON "<<NumPolygons<<std::endl;
	
	// Write all Vectors
	for (i=0;i<NumVectors;i++)
	{
		reader << "CLASS DYN_VERTEX ";
		reader << i<< " ";
		reader << Vectors[i].x/ReadScale << " ";
		reader << Vectors[i].y/ReadScale << " ";
		reader << Vectors[i].z/ReadScale << std::endl;
	}
	
	// Write All polygon information
	for(i=0;i<NumPolygons;i++)
	{
		reader << "CLASS DYN_POLYGON " << i << " ";
		currentpoly=&Polygons[i];
		reader << currentpoly->NumVectors ;
		for(t=0;t<currentpoly->NumVectors;t++)
		{
			reader <<" "<< currentpoly->VectorIndex[t];
		}
		
		for(t=0;t<currentpoly->NumVectors;t++)
		{
			reader <<" "<< (long)currentpoly->LightPoints[t].R
				<<" "<< (long)currentpoly->LightPoints[t].G
				<<" "<< (long)currentpoly->LightPoints[t].B
				<<" "<< currentpoly->TexturePoints[t].TX 
				<<" "<< currentpoly->TexturePoints[t].TY ;
		}
		reader <<" "<<currentpoly->TextureID<<std::endl; // Texture number 
	}
	
	// Write Component information
	for(t=0;t<Frame.NumComponents;t++)
	{
		reader <<"CLASS FRAMECOMPONENT "<<t
			<<" "<<Frame.ComponentList[t].NumPolygons;
		for(i=0;i<Frame.ComponentList[t].NumPolygons;i++)
		{
			reader << " "<<Frame.ComponentList[t].PolygonList[i];
		}
		reader <<std::endl;
	}
	
	// Write component animation data
	for(i=0;i<Frame.NumComponents;i++)
	{
		reader <<"CLASS FRAMESTATE "<<i
			<<" "<<Frame.ComponentStates[i].NumStates;
		for(t=0;t<Frame.ComponentStates[i].NumStates;t++)
		{
			reader<<" "<<Frame.ComponentStates[i].FrameType[t]
				<<" "<<Frame.ComponentStates[i].Start[t].ox
				<<" "<<Frame.ComponentStates[i].Start[t].oy
				<<" "<<Frame.ComponentStates[i].Start[t].oz
				<<" "<<Frame.ComponentStates[i].Start[t].dx
				<<" "<<Frame.ComponentStates[i].Start[t].dy
				<<" "<<Frame.ComponentStates[i].Start[t].dz
				
				<<" "<<Frame.ComponentStates[i].End[t].ox
				<<" "<<Frame.ComponentStates[i].End[t].oy
				<<" "<<Frame.ComponentStates[i].End[t].oz
				<<" "<<Frame.ComponentStates[i].End[t].dx
				<<" "<<Frame.ComponentStates[i].End[t].dy
				<<" "<<Frame.ComponentStates[i].End[t].dz;
		}
		reader <<std::endl;
	}
	
	reader.close();
}


void cOBJECT::PlotObjectZShade()
{
	MFLOAT DX1,DX2,DY1,DY2;
	CurrentPolyNum=0;
	// POLYGON *currentpoly;
	
	NumVectorsT=NumVectors;
	while (CurrentPolyNum<NumPolygons)
	{
		CurrentPoly=&Polygons[CurrentPolyNum];
		
		// Determine if vieable by clockwise/anitclockwise detection (back face culling)
		DX1=TVectors[CurrentPoly->VectorIndex[1]].x-TVectors[CurrentPoly->VectorIndex[0]].x;
		DX2=TVectors[CurrentPoly->VectorIndex[2]].x-TVectors[CurrentPoly->VectorIndex[1]].x;
		DY1=TVectors[CurrentPoly->VectorIndex[1]].y-TVectors[CurrentPoly->VectorIndex[0]].y;
		DY2=TVectors[CurrentPoly->VectorIndex[2]].y-TVectors[CurrentPoly->VectorIndex[1]].y;
		if( (DX1*DY2-DX2*DY1) <0) 					// If visible then display
		{
			Clipper2(CurrentPoly,TVectors,0,320,0);
			if(CurrentPoly->ClippedNumVectors>2)
			{
				DrawPolyZShade(CurrentPoly);
			}
		}
		
		CurrentPolyNum++;
	}
	
}

// Do perspective translation
void cOBJECT::TranslateVectors(long centerx, long centery)
{
	MFLOAT Z;
	int zint;
	long i;
	
	for(i=0;i<NumVectors;i++)
	{
		Z=( (MFLOAT)(1000/(RVectors[i].z-512)) );
		zint=(256000*256/(RVectorsint[i].z-512*256));

		TVectors[i].x=  (MFLOAT)centerx+(RVectors[i].x*Z) ; //x+256/z
		TVectors[i].y=  (MFLOAT)centery+(RVectors[i].y*Z) ; //x+256/z
		TVectors[i].z=1/((MFLOAT)RVectors[i].z-1024);

		TVectorsint[i].x=  (centerx*256+(RVectorsint[i].x*zint)/256)/256 ; //x+256/z
		TVectorsint[i].y=  (centery*256+(RVectorsint[i].y*zint)/256)/256 ; //x+256/z
		TVectorsint[i].z=0;//1/((MFLOAT)RVectorsint[i].z-1024);
	}
}

void cOBJECT::PlotObjectTexture()
{
	MFLOAT DX1,DX2,DY1,DY2;
	MFLOAT Z;
	int t;
	VertexTYPE *tempver;
	NumVectorsT=NumVectors;
	
	CurrentPolyNum=0;
	while (CurrentPolyNum<NumPolygons)
	{
		CurrentPoly=&Polygons[CurrentPolyNum];
		
		// Determine if vieable by clockwise/anitclockwise detection (back face culling)
		DX1=TVectors[CurrentPoly->VectorIndex[1]].x-TVectors[CurrentPoly->VectorIndex[0]].x;
		DX2=TVectors[CurrentPoly->VectorIndex[2]].x-TVectors[CurrentPoly->VectorIndex[1]].x;
		DY1=TVectors[CurrentPoly->VectorIndex[1]].y-TVectors[CurrentPoly->VectorIndex[0]].y;
		DY2=TVectors[CurrentPoly->VectorIndex[2]].y-TVectors[CurrentPoly->VectorIndex[1]].y;
		if( (DX1*DY2-DX2*DY1) <0) 					// If visible then display
		{
			Clipper2(CurrentPoly,TVectors,0,320,0);
			if(CurrentPoly->ClippedNumVectors>2)
			{
				tempver= new VertexTYPE[CurrentPoly->ClippedNumVectors];
				for(t=0;t<CurrentPoly->ClippedNumVectors;t++)
				{
					tempver[t].sx=TVectors[CurrentPoly->ClippedVectorIndex[t]].x;
					tempver[t].sy=TVectors[CurrentPoly->ClippedVectorIndex[t]].y;
					tempver[t].u=CurrentPoly->TexturePoints[t].TX;
					tempver[t].v=CurrentPoly->TexturePoints[t].TY;
				}
				Z=TVectors[CurrentPoly->ClippedVectorIndex[0]].z;
				TextureFacePlot(GlobalTextures[CurrentPoly->TextureID].TexturePtr,&tempver[0],CurrentPoly->ClippedNumVectors,256,Z);
			}
		}
		
		CurrentPolyNum++;
	}
	
}


void cOBJECT::PlotObjectShaded()
{
	MFLOAT DX1,DX2,DY1,DY2;
	int currentvectors;
	//POLYGON *currentpoly;
	
	CurrentPolyNum=0;
	NumVectorsT=NumVectors;
	while (CurrentPolyNum<NumPolygons)
	{
		CurrentPoly=&Polygons[CurrentPolyNum];
		currentvectors=CurrentPoly->NumVectors;
		
		// Determine if vieable by clockwise/anitclockwise detection (back face culling)
		DX1=TVectors[CurrentPoly->VectorIndex[1]].x-TVectors[CurrentPoly->VectorIndex[0]].x;
		DX2=TVectors[CurrentPoly->VectorIndex[2]].x-TVectors[CurrentPoly->VectorIndex[1]].x;
		DY1=TVectors[CurrentPoly->VectorIndex[1]].y-TVectors[CurrentPoly->VectorIndex[0]].y;
		DY2=TVectors[CurrentPoly->VectorIndex[2]].y-TVectors[CurrentPoly->VectorIndex[1]].y;
		if( (DX1*DY2-DX2*DY1) <0) 					// If visible then display
		{
			// copy vectors for clipping
			
			Clipper2(CurrentPoly,TVectors,0,320,0);
			// Ignore lines+points
			if(CurrentPoly->ClippedNumVectors>2)
			{
				//ZZ=TVectors[CurrentPoly->ClippedVectorIndex[0]].z;
				DrawPoly(CurrentPoly);
			}
		}
		
		CurrentPolyNum++;
	}
}

void cOBJECT::PlotObjectPlainShaded()
{
	int DX1,DX2,DY1,DY2;
	int currentvectors;
	
	CurrentPolyNum=0;
	NumVectorsT=NumVectors;
	while (CurrentPolyNum<NumPolygons)
	{
		CurrentPoly=&Polygons[CurrentPolyNum];
		currentvectors=CurrentPoly->NumVectors;
		
		// Determine if vieable by clockwise/anitclockwise detection (back face culling)
		DX1=TVectorsint[CurrentPoly->VectorIndex[1]].x-TVectorsint[CurrentPoly->VectorIndex[0]].x;
		DX2=TVectorsint[CurrentPoly->VectorIndex[2]].x-TVectorsint[CurrentPoly->VectorIndex[1]].x;
		DY1=TVectorsint[CurrentPoly->VectorIndex[1]].y-TVectorsint[CurrentPoly->VectorIndex[0]].y;
		DY2=TVectorsint[CurrentPoly->VectorIndex[2]].y-TVectorsint[CurrentPoly->VectorIndex[1]].y;
		if( (DX1*DY2-DX2*DY1) <0) 					// If visible then display
		{
			// copy vectors for clipping
			
			//Clipper2(CurrentPoly,TVectors,0,320,0);
			// Ignore lines+points
			//if(CurrentPoly->ClippedNumVectors>2)
			//{
				//ZZ=TVectors[CurrentPoly->ClippedVectorIndex[0]].z;
				//DrawPoly24(CurrentPoly);
				DrawPolySimple(CurrentPoly);
			//}
		}
		
		CurrentPolyNum++;
	}
}

void cOBJECT::PlotObjectShaded24()
{
	MFLOAT DX1,DX2,DY1,DY2;
	int currentvectors;
	//POLYGON *currentpoly;
	
	CurrentPolyNum=0;
	NumVectorsT=NumVectors;
	while (CurrentPolyNum<NumPolygons)
	{
		CurrentPoly=&Polygons[CurrentPolyNum];
		currentvectors=CurrentPoly->NumVectors;
		
		// Determine if vieable by clockwise/anitclockwise detection (back face culling)
		DX1=TVectors[CurrentPoly->VectorIndex[1]].x-TVectors[CurrentPoly->VectorIndex[0]].x;
		DX2=TVectors[CurrentPoly->VectorIndex[2]].x-TVectors[CurrentPoly->VectorIndex[1]].x;
		DY1=TVectors[CurrentPoly->VectorIndex[1]].y-TVectors[CurrentPoly->VectorIndex[0]].y;
		DY2=TVectors[CurrentPoly->VectorIndex[2]].y-TVectors[CurrentPoly->VectorIndex[1]].y;
		if( (DX1*DY2-DX2*DY1) <0) 					// If visible then display
		{
			// copy vectors for clipping
//			dale <<"Clipper"<<endl;
			Clipper2(CurrentPoly,TVectors,0,320,0);
			// Ignore lines+points
			if(CurrentPoly->ClippedNumVectors>2)
			{
				//ZZ=TVectors[CurrentPoly->ClippedVectorIndex[0]].z;
				DrawPoly24(CurrentPoly);
			}
		}
		
		CurrentPolyNum++;
	}
}


long cOBJECT::Scale(MFLOAT factor)
{
	int i;
	for(i=0;i<NumVectors;i++)
	{
		Vectors[i].x=Vectors[i].x*factor;
		Vectors[i].y=Vectors[i].y*factor;
		Vectors[i].z=Vectors[i].z*factor;
	}
	return 0;
}

cOBJECT::~cOBJECT()
{
	if (Vectors!=NULL)
		delete Vectors;
	if (RVectors!=NULL)
		delete RVectors;
	if (TVectors!=NULL)
		delete TVectors;
}