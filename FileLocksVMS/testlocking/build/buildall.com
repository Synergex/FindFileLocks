$ ! Build all the .DBL files in a directory
$ SET NOON
$ DIRECTORY = ''P1'
$ TYPE = ''P2'
$ PROJECTNAME = ''P3'
$ IF TYPE .EQS. "ALL" 
$   THEN
$     WRITE SYS$OUTPUT "********************************************************************************"
$     WRITE SYS$OUTPUT "PROTOTYPING CLASSES FOR PROJECT ''PROJECTNAME'"
$     WRITE SYS$OUTPUT "********************************************************************************"
$     TYPE = "PROTO"
$     DIRECTORY = "CLASSES:"
$     GOSUB FILELOOP
$     WRITE SYS$OUTPUT "********************************************************************************"
$     WRITE SYS$OUTPUT "BUILDING SUBROUTINES FOR PROJECT ''PROJECTNAME'"
$     WRITE SYS$OUTPUT "********************************************************************************"
$     TYPE = "SUB"
$     DIRECTORY = "SUBS:"
$     GOSUB FILELOOP
$     WRITE SYS$OUTPUT "********************************************************************************"
$     WRITE SYS$OUTPUT "BUILDING CLASSES FOR PROJECT ''PROJECTNAME'"
$     WRITE SYS$OUTPUT "********************************************************************************"
$     TYPE = "CLASS"
$     DIRECTORY = "CLASSES:"
$     GOSUB FILELOOP
$     WRITE SYS$OUTPUT "********************************************************************************"
$     WRITE SYS$OUTPUT "BUILDING SHARED IMAGE FOR PROJECT ''PROJECTNAME'"
$     WRITE SYS$OUTPUT "********************************************************************************"
$     @CTRL:BUILDSHARE
$     WRITE SYS$OUTPUT " "
$     WRITE SYS$OUTPUT "********************************************************************************"
$     WRITE SYS$OUTPUT "BUILDING MAINS FOR PROJECT ''PROJECTNAME'"
$     WRITE SYS$OUTPUT "********************************************************************************"
$     TYPE = "MAIN"
$     DIRECTORY = "SOURCE:"
$     GOSUB FILELOOP
$   ELSE
$     GOSUB FILELOOP
$   ENDIF
$ EXIT
$FILELOOP:
$ PROCESSED = 0
$NEXTFILE:
$ FILENAME = F$SEARCH("''DIRECTORY'*.DBL")
$ IF FILENAME .NES. ""
$   THEN
$     PROCESSED = 1
$     WRITE SYS$OUTPUT "PROCESSING: ''FILENAME' TYPE: ''TYPE' PROJECTNAME: ''PROJECTNAME'"
$     IF TYPE .EQS. "PROTO"
$       THEN 
$         GOSUB PROTOCLASS
$       ENDIF
$     IF TYPE .EQS. "SUB"
$       THEN 
$         GOSUB BUILDSUB
$       ENDIF
$     IF TYPE .EQS. "MAIN"
$       THEN 
$         GOSUB BUILDMAIN
$       ENDIF
$     IF TYPE .EQS. "CLASS"
$       THEN 
$         GOSUB BUILDCLASS
$       ENDIF
$     GOTO NEXTFILE
$   ENDIF
$ IF PROCESSED .EQ. 0 
$   THEN
$     WRITE SYS$OUTPUT "NOTHING TO DO..."
$   ENDIF
$ WRITE SYS$OUTPUT " "
$ RETURN
$PROTOCLASS:
$ @CTRL:PROTOTYPECLASS 'FILENAME' OBJ:'PROJECTNAME'.OLB
$ RETURN
$BUILDSUB:
$ @CTRL:BUILDSUB 'FILENAME' OBJ:'PROJECTNAME'.OLB
$ RETURN
$BUILDMAIN:
$ @CTRL:BUILDMAIN 'FILENAME'
$ RETURN
$BUILDCLASS:
$ @CTRL:BUILDCLASS 'FILENAME'
$ RETURN
