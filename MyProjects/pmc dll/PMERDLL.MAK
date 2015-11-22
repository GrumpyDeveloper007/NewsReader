# Microsoft Developer Studio Generated NMAKE File, Format Version 4.20
# ** DO NOT EDIT **

# TARGTYPE "Win32 (x86) Dynamic-Link Library" 0x0102

!IF "$(CFG)" == ""
CFG=pmdll - Win32 Debug
!MESSAGE No configuration specified.  Defaulting to pmdll - Win32 Debug.
!ENDIF 

!IF "$(CFG)" != "pmdll - Win32 Debug" && "$(CFG)" != "pmdll - Win32 Release"
!MESSAGE Invalid configuration "$(CFG)" specified.
!MESSAGE You can specify a configuration when running NMAKE on this makefile
!MESSAGE by defining the macro CFG on the command line.  For example:
!MESSAGE 
!MESSAGE NMAKE /f "pmerdll.mak" CFG="pmdll - Win32 Debug"
!MESSAGE 
!MESSAGE Possible choices for configuration are:
!MESSAGE 
!MESSAGE "pmdll - Win32 Debug" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE "pmdll - Win32 Release" (based on "Win32 (x86) Dynamic-Link Library")
!MESSAGE 
!ERROR An invalid configuration is specified.
!ENDIF 

!IF "$(OS)" == "Windows_NT"
NULL=
!ELSE 
NULL=nul
!ENDIF 
################################################################################
# Begin Project
CPP=cl.exe
MTL=mktyplib.exe
RSC=rc.exe

!IF  "$(CFG)" == "pmdll - Win32 Debug"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 1
# PROP BASE Output_Dir "WinDebug"
# PROP BASE Intermediate_Dir "WinDebug"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 1
# PROP Output_Dir "WinDebug"
# PROP Intermediate_Dir "WinDebug"
OUTDIR=.\WinDebug
INTDIR=.\WinDebug

ALL : "$(OUTDIR)\pmerdll.dll" "$(OUTDIR)\pmerdll.bsc"

CLEAN : 
	-@erase "$(INTDIR)\cube.obj"
	-@erase "$(INTDIR)\cube.sbr"
	-@erase "$(INTDIR)\pmdll.obj"
	-@erase "$(INTDIR)\pmdll.res"
	-@erase "$(INTDIR)\pmdll.sbr"
	-@erase "$(INTDIR)\pmerdll.pch"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\vbiface.obj"
	-@erase "$(INTDIR)\vbiface.sbr"
	-@erase "$(INTDIR)\vc40.idb"
	-@erase "$(INTDIR)\vc40.pdb"
	-@erase "$(OUTDIR)\pmerdll.bsc"
	-@erase "$(OUTDIR)\pmerdll.dll"
	-@erase "$(OUTDIR)\pmerdll.ilk"
	-@erase "$(OUTDIR)\pmerdll.pdb"
	-@erase ".\pmdll.exp"
	-@erase ".\pmdll.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXEXT" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/pmerdll.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c 
CPP_OBJS=.\WinDebug/
CPP_SBRS=.\WinDebug/
# ADD BASE RSC /l 0x0 /d "_DEBUG" /d "_AFXDLL"
# ADD RSC /l 0x0 /d "_DEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x0 /fo"$(INTDIR)/pmdll.res" /d "_DEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/pmerdll.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\cube.sbr" \
	"$(INTDIR)\pmdll.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\vbiface.sbr"

"$(OUTDIR)\pmerdll.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /debug /machine:I386 /def:"pmdll.def" /implib:"pmdll.lib"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /dll /debug /machine:I386 /def:"pmdll.def" /implib:"pmdll.lib"
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:yes\
 /pdb:"$(OUTDIR)/pmerdll.pdb" /debug /machine:I386 /def:"pmdll.def"\
 /out:"$(OUTDIR)/pmerdll.dll" /implib:"pmdll.lib" 
DEF_FILE= \
	".\pmdll.def"
LINK32_OBJS= \
	"$(INTDIR)\cube.obj" \
	"$(INTDIR)\pmdll.obj" \
	"$(INTDIR)\pmdll.res" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\vbiface.obj"

"$(OUTDIR)\pmerdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ELSEIF  "$(CFG)" == "pmdll - Win32 Release"

# PROP BASE Use_MFC 6
# PROP BASE Use_Debug_Libraries 0
# PROP BASE Output_Dir "WinRel"
# PROP BASE Intermediate_Dir "WinRel"
# PROP Use_MFC 6
# PROP Use_Debug_Libraries 0
# PROP Output_Dir "WinRel"
# PROP Intermediate_Dir "WinRel"
OUTDIR=.\WinRel
INTDIR=.\WinRel

ALL : "$(OUTDIR)\pmerdll.dll" "$(OUTDIR)\pmerdll.bsc"

CLEAN : 
	-@erase "$(INTDIR)\cube.obj"
	-@erase "$(INTDIR)\cube.sbr"
	-@erase "$(INTDIR)\pmdll.obj"
	-@erase "$(INTDIR)\pmdll.res"
	-@erase "$(INTDIR)\pmdll.sbr"
	-@erase "$(INTDIR)\pmerdll.pch"
	-@erase "$(INTDIR)\stdafx.obj"
	-@erase "$(INTDIR)\stdafx.sbr"
	-@erase "$(INTDIR)\vbiface.obj"
	-@erase "$(INTDIR)\vbiface.sbr"
	-@erase "$(OUTDIR)\pmerdll.bsc"
	-@erase "$(OUTDIR)\pmerdll.dll"
	-@erase ".\pmdll.exp"
	-@erase ".\pmdll.lib"

"$(OUTDIR)" :
    if not exist "$(OUTDIR)/$(NULL)" mkdir "$(OUTDIR)"

# ADD BASE CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_MBCS" /D "_AFXEXT" /FR /Yu"stdafx.h" /c
# ADD CPP /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR /Yu"stdafx.h" /c
CPP_PROJ=/nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/pmerdll.pch" /Yu"stdafx.h" /Fo"$(INTDIR)/" /c 
CPP_OBJS=.\WinRel/
CPP_SBRS=.\WinRel/
# ADD BASE RSC /l 0x0 /d "NDEBUG" /d "_AFXDLL"
# ADD RSC /l 0x0 /d "NDEBUG" /d "_AFXDLL"
RSC_PROJ=/l 0x0 /fo"$(INTDIR)/pmdll.res" /d "NDEBUG" /d "_AFXDLL" 
BSC32=bscmake.exe
# ADD BASE BSC32 /nologo
# ADD BSC32 /nologo
BSC32_FLAGS=/nologo /o"$(OUTDIR)/pmerdll.bsc" 
BSC32_SBRS= \
	"$(INTDIR)\cube.sbr" \
	"$(INTDIR)\pmdll.sbr" \
	"$(INTDIR)\stdafx.sbr" \
	"$(INTDIR)\vbiface.sbr"

"$(OUTDIR)\pmerdll.bsc" : "$(OUTDIR)" $(BSC32_SBRS)
    $(BSC32) @<<
  $(BSC32_FLAGS) $(BSC32_SBRS)
<<

LINK32=link.exe
# ADD BASE LINK32 /nologo /subsystem:windows /dll /machine:I386 /def:"pmdll.def" /implib:"pmdll.lib"
# SUBTRACT BASE LINK32 /pdb:none
# ADD LINK32 /nologo /subsystem:windows /dll /machine:I386 /def:"pmdll.def" /implib:"pmdll.lib"
# SUBTRACT LINK32 /pdb:none
LINK32_FLAGS=/nologo /subsystem:windows /dll /incremental:no\
 /pdb:"$(OUTDIR)/pmerdll.pdb" /machine:I386 /def:"pmdll.def"\
 /out:"$(OUTDIR)/pmerdll.dll" /implib:"pmdll.lib" 
DEF_FILE= \
	".\pmdll.def"
LINK32_OBJS= \
	"$(INTDIR)\cube.obj" \
	"$(INTDIR)\pmdll.obj" \
	"$(INTDIR)\pmdll.res" \
	"$(INTDIR)\stdafx.obj" \
	"$(INTDIR)\vbiface.obj"

"$(OUTDIR)\pmerdll.dll" : "$(OUTDIR)" $(DEF_FILE) $(LINK32_OBJS)
    $(LINK32) @<<
  $(LINK32_FLAGS) $(LINK32_OBJS)
<<

!ENDIF 

.c{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_OBJS)}.obj:
   $(CPP) $(CPP_PROJ) $<  

.c{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cpp{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

.cxx{$(CPP_SBRS)}.sbr:
   $(CPP) $(CPP_PROJ) $<  

MTL_PROJ=
################################################################################
# Begin Target

# Name "pmdll - Win32 Debug"
# Name "pmdll - Win32 Release"

!IF  "$(CFG)" == "pmdll - Win32 Debug"

!ELSEIF  "$(CFG)" == "pmdll - Win32 Release"

!ENDIF 

################################################################################
# Begin Source File

SOURCE=.\stdafx.cpp
DEP_CPP_STDAF=\
	".\stdafx.h"\
	

!IF  "$(CFG)" == "pmdll - Win32 Debug"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MDd /W3 /Gm /GX /Zi /Od /D "_DEBUG" /D "WIN32" /D "_WINDOWS"\
 /D "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/pmerdll.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /Fd"$(INTDIR)/" /c\
 $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\pmerdll.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ELSEIF  "$(CFG)" == "pmdll - Win32 Release"

# ADD BASE CPP /Yc"stdafx.h"
# ADD CPP /Yc"stdafx.h"

BuildCmds= \
	$(CPP) /nologo /MD /W3 /GX /O2 /D "NDEBUG" /D "WIN32" /D "_WINDOWS" /D\
 "_AFXEXT" /D "_WINDLL" /D "_AFXDLL" /D "_MBCS" /FR"$(INTDIR)/"\
 /Fp"$(INTDIR)/pmerdll.pch" /Yc"stdafx.h" /Fo"$(INTDIR)/" /c $(SOURCE) \
	

"$(INTDIR)\stdafx.obj" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\stdafx.sbr" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

"$(INTDIR)\pmerdll.pch" : $(SOURCE) $(DEP_CPP_STDAF) "$(INTDIR)"
   $(BuildCmds)

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\pmdll.cpp
DEP_CPP_PMDLL=\
	".\stdafx.h"\
	

"$(INTDIR)\pmdll.obj" : $(SOURCE) $(DEP_CPP_PMDLL) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"

"$(INTDIR)\pmdll.sbr" : $(SOURCE) $(DEP_CPP_PMDLL) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\pmdll.rc
DEP_RSC_PMDLL_=\
	".\res\pmdll.rc2"\
	

"$(INTDIR)\pmdll.res" : $(SOURCE) $(DEP_RSC_PMDLL_) "$(INTDIR)"
   $(RSC) $(RSC_PROJ) $(SOURCE)


# End Source File
################################################################################
# Begin Source File

SOURCE=.\readme.txt

!IF  "$(CFG)" == "pmdll - Win32 Debug"

!ELSEIF  "$(CFG)" == "pmdll - Win32 Release"

!ENDIF 

# End Source File
################################################################################
# Begin Source File

SOURCE=.\cube.cpp
DEP_CPP_CUBE_=\
	".\cube.h"\
	".\stdafx.h"\
	

"$(INTDIR)\cube.obj" : $(SOURCE) $(DEP_CPP_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"

"$(INTDIR)\cube.sbr" : $(SOURCE) $(DEP_CPP_CUBE_) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\vbiface.cpp
DEP_CPP_VBIFA=\
	".\cube.h"\
	".\stdafx.h"\
	".\vbiface.h"\
	

"$(INTDIR)\vbiface.obj" : $(SOURCE) $(DEP_CPP_VBIFA) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"

"$(INTDIR)\vbiface.sbr" : $(SOURCE) $(DEP_CPP_VBIFA) "$(INTDIR)"\
 "$(INTDIR)\pmerdll.pch"


# End Source File
################################################################################
# Begin Source File

SOURCE=.\pmdll.def

!IF  "$(CFG)" == "pmdll - Win32 Debug"

!ELSEIF  "$(CFG)" == "pmdll - Win32 Release"

!ENDIF 

# End Source File
# End Target
# End Project
################################################################################
