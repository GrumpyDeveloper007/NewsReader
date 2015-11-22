#pragma once

class cSCREEN;
//#include "cScreen.h"

class cCONSOLE
{
public:
	long PositionX;
	long PositionY;
	long SizeX;
	long SizeY;
	long FontSizeX;	// un-supported
	long FontSizeY;
	unsigned char *FrontBuffer;

	cCONSOLE();
	~cCONSOLE();

	long Open(long positionX,long positionY,long sizeX,long sizeY);
	long Update(cSCREEN *);
	void Cout(char *StringOut);

};