#include "cConsole.h"
#include "cScreen.h"

///////////////////////////////////////////////////////////////////////////
// Console 
cCONSOLE::cCONSOLE()
{
}

cCONSOLE::~cCONSOLE()
{
}


long cCONSOLE::Open(long positionX,long positionY,long sizeX,long sizeY)
{
	PositionX=positionX;
	PositionY=positionY;
	SizeX=sizeX;
	SizeY=sizeY;
	FrontBuffer=new unsigned char[SizeX*SizeY];	// Stored as chars
	FontSizeX=8;
	FontSizeY=8;
	return true;
}

long cCONSOLE::Update(cSCREEN *DestnationScreen)
{
//	int t;
	DestnationScreen->CLSBox(PositionX,PositionY,PositionX+SizeX*FontSizeX,
		PositionY+SizeY*FontSizeY);

	//for (t=0;t<SizeY;t++)
	//{
	//	DestnationScreen->Cout(PositionX,PositionY+t*FontSizeY,
	//		(char*)FrontBuffer+t*SizeX,SizeX);
	//}
		
	return true;
}

void cCONSOLE::Cout(char *StringOut)
{
}

