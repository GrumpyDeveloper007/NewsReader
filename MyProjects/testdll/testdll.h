
// The following ifdef block is the standard way of creating macros which make exporting 
// from a DLL simpler. All files within this DLL are compiled with the TESTDLL_EXPORTS
// symbol defined on the command line. this symbol should not be defined on any project
// that uses this DLL. This way any other project whose source files include this file see 
// TESTDLL_API functions as being imported from a DLL, wheras this DLL sees symbols
// defined with this macro as being exported.
#define DllExport __declspec( dllexport )
#define DllImport __declspec( dllimport )

//	used to pass in data about new cubes being added to the system
//typedef struct tagVBCubePointType


// This class is exported from the testdll.dll
class DllExport CTestdll {
public:
	CTestdll(void);
	// TODO: add your methods here.
};

extern DllExport int nTestdll;

DllExport int fnTestdll(void);
DllExport int pascal GetCRC2(char* Buffer, int Size ,int pBufferLength);
DllExport int pascal CopyTo(int pBuffer,int Size,int pOutBuffer, int WriteMax ,int DataStart );
DllExport int pascal CopyArray(int pInBuffer,int Size,int pOutBuffer);
DllExport int pascal ReadLine(int pBinaryBuffer,int pBufferSize,int *pLineCursor,int* pString);


