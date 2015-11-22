#include "cSlider.h"
#include "cScreen.h"

///////////////////////////////////////////////////////////////////////////
// Sliders

cSLIDER::cSLIDER()
{
	UpdateMeB=0;
	UpdateMeW=0;
	UpdateMeL=0;
}
cSLIDER::~cSLIDER()
{
	
}

void cSLIDER::Check(long MouseX,long MouseY)
{
	if (MouseX>=PositionX && MouseY>=PositionY && MouseX<PositionX+SizeX &&
		MouseY<PositionY+SizeY)
	{
		if (Alignment==1) // horiz
		{
			CurrentValue=(MouseX-PositionX)/ScaleFactor;
			if (UpdateMeB!=0)
				*UpdateMeB=(unsigned char)CurrentValue;
			if (UpdateMeW!=0)
				*UpdateMeW=(unsigned short)CurrentValue;
			if (UpdateMeL!=0)
				*UpdateMeL=(long)CurrentValue;
		}
		if (Alignment==2) // vert
		{
			CurrentValue=(MouseY-PositionY)/ScaleFactor;
			if (UpdateMeB!=0)
				*UpdateMeB=(unsigned char)CurrentValue;
			if (UpdateMeW!=0)
				*UpdateMeW=(unsigned short)CurrentValue;
			if (UpdateMeL!=0)
				*UpdateMeL=(long)CurrentValue;
		}
	}
}
void cSLIDER::Update(cSCREEN *CurrentWindow)
{
	if (CurrentValue!=LastValue)
	{
		LastValue=CurrentValue;
		int i;
		long type;
		char stringbuffer[4];
		type =Type;
		if (type&8)
		{
			CurrentWindow->CLSBox(PositionX-28,PositionY,PositionX+SizeX,PositionY+SizeY+1);
			type=type&(0xfffffff7);
			CurrentWindow->Cout(PositionX-28,PositionY,itoa(CurrentValue,stringbuffer,10));
		}
		else
			CurrentWindow->CLSBox(PositionX,PositionY,PositionX+SizeX,PositionY+SizeY+1);
		switch (type)
		{
		case 1:
			for(i=0;i<256;i++)
			{
				CurrentWindow->Box(PositionX+i,PositionY+1,PositionX+i+1,PositionY+SizeY-1,0,0,i);
			}
			break;
		case 2:
			for(i=0;i<256;i++)
			{
				CurrentWindow->Box(PositionX+i,PositionY+1,PositionX+i+1,PositionY+SizeY-1,0,i,0);
			}
			break;
		case 3:
			for(i=0;i<256;i++)
			{
				CurrentWindow->Box(PositionX+i,PositionY+1,PositionX+i+1,PositionY+SizeY-1,i,0,0);
			}
			break;
		case 4:
			for(i=0;i<256;i++)
			{
				CurrentWindow->Box(PositionX+i,PositionY+1,PositionX+i+1,PositionY+SizeY-1,i,i,i);
			}
			break;
		}
		PlotPosition(CurrentWindow);
	}
}

void cSLIDER::PlotPosition(cSCREEN *CurrentWindow)
{
	if (Alignment==1)
	{
		CurrentWindow->Dot(PositionX+(CurrentValue*ScaleFactor),PositionY,255,255,255);
		CurrentWindow->Dot(PositionX+(CurrentValue*ScaleFactor),PositionY+SizeY,255,255,255);
	}
	
}
