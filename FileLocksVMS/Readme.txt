To install the new subroutine

Copy testLocking.zip to your sys$login
$ unzip testlocking.zip
This will create a subdirectory [.testlocking]
$ @[.testlocking]testlocking

This sets up the environment for running the build.

$ copy build$root:[build]*.dbl; dblstarlet

This copies the correct FABDEF and NAMDEF files to DBLSTARLET. Of course you only need to do this first time you do this.

$ @build$root:[build]buildall BUILD$ROOT ALL TESTLOCKING
********************************************************************************
PROTOTYPING CLASSES FOR PROJECT TESTLOCKING
********************************************************************************
NOTHING TO DO...
 
********************************************************************************
BUILDING SUBROUTINES FOR PROJECT TESTLOCKING
********************************************************************************
PROCESSING: BUILD$ROOT:[SUBS]LOCKING.DBL;1 TYPE: SUB PROJECTNAME: TESTLOCKING
COMPILING
DBL /DEBUG /OBJ=OBJ: BUILD$ROOT:[SUBS]LOCKING.DBL;1
LIB/REPLACE/LOG OBJ:TESTLOCKING.OLB OBJ:LOCKING
%LIBRAR-S-REPLACED, module FINDLOCKS replaced in BUILD$ROOT:[OBJ]TESTLOCKING.OLB
;1
%LIBRAR-S-REPLACED, module TOSTRING replaced in BUILD$ROOT:[OBJ]TESTLOCKING.OLB;
1
%LIBRAR-S-REPLACED, module ADDSTRING replaced in BUILD$ROOT:[OBJ]TESTLOCKING.OLB
;1
%LIBRAR-S-REPLACED, module FORMAT_UNPRINTABLE replaced in BUILD$ROOT:[OBJ]TESTLO
CKING.OLB;1
%LIBRAR-S-REPLACED, module DBLPARSE replaced in BUILD$ROOT:[OBJ]TESTLOCKING.OLB;
1
 
********************************************************************************
BUILDING CLASSES FOR PROJECT TESTLOCKING
********************************************************************************
NOTHING TO DO...
 
********************************************************************************
BUILDING SHARED IMAGE FOR PROJECT TESTLOCKING
********************************************************************************
@COMS:TOOLS
%DCL-E-OPENIN, error opening BUILD$ROOT:[BUILD]TOOLS.COM; as input
-RMS-E-FNF, file not found
 
********************************************************************************
BUILDING MAINS FOR PROJECT TESTLOCKING
********************************************************************************
PROCESSING: BUILD$ROOT:[SOURCE]TESTLOCKING.DBL;1 TYPE: MAIN PROJECTNAME: TESTLOC
KING
COMPILING/LINKING DKA0:[USER.CBLUNDELL.TESTLOCKING.][SOURCE]TESTLOCKING.DBL;1
        TO CREATE DKA0:[USER.CBLUNDELL.TESTLOCKING.][EXE]TESTLOCKING.EXE;
DBL /DEBUG /OBJ=OBJ: BUILD$ROOT:[SOURCE]TESTLOCKING.DBL;1
LINK /EXE=EXE: OBJ:TESTLOCKING, SYS$SHARE:SSQLRTL.OPT/OPTION, OPTIONS:TOOLS.OPT/
OPTION
 
$ 

If you’re using the Workbench and my remoteBuild utility from the code exchange
Copy testLocking.zip to your sys$login
$ unzip testlocking.zip
This will create a subdirectory [.testlocking]
$ copy build$root:[build]*.dbl; dblstarlet

This copies the correct FABDEF and NAMDEF files to DBLSTARLET. Of course you only need to do this first time you do this.

Then from the Workbench…
Open the Workspace file in the project directory
Start the BuildService from the build menu
Click connect on the BuildService
Click BuildProject from the Build menu
