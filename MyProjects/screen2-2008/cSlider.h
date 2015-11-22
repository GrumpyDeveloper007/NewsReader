#pragma once

class cSCREEN;

// Draws a simple colour selection bar
class cSLIDER
{
public:
	long PositionX;
	long PositionY;
	long SizeX;
	long SizeY;
	long CurrentValue;
	long LastValue;
	long ScaleFactor; // mouse coord to value
	long Alignment;//1-horiz, 2-vert
	long Type; // 1-Colour bar horiz red,2-green,3-blue,4-mono (or) 8 display value
	
	unsigned char *UpdateMeB;	// Pointers Set to varable attached to slider value
	unsigned short *UpdateMeW;	// if ptr==0 then none attached
	long *UpdateMeL;
	
	cSLIDER();
	~cSLIDER();
	
	void Check(long MouseX,long MouseY);	// update slider value if mouse in bounds
	void PlotPosition(cSCREEN *CurrentWindow); // plots 2 dots at the moment
	void Update(cSCREEN *CurrentWindow);	// If slider has changed then update
};
