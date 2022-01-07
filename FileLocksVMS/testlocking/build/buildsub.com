$ !Compile and link utility
$ WRITE SYS$OUTPUT "COMPILING"
$ TYPE = F$PARSE(''P1',,,"TYPE")
$ IF TYPE .EQS. "." 
$   THEN 
$     TYPE=".DBL"
$   ENDIF
$ NAME = F$PARSE(''P1',,,"NAME")
$ DIRECTORY = F$PARSE(''P1',,,"DIRECTORY")
$ DEVICE = F$PARSE(''P1',,,"DEVICE")
$ NODE = F$PARSE(''P1',,,"NODE")
$ VERSION = F$PARSE(''P1',,,"VERSION")
$ WRITE SYS$OUTPUT "DBL ''SYN_DBG' /OBJ=OBJ: ''NODE'''DEVICE'''DIRECTORY'''NAME'''TYPE'''VERSION'"
$ DBL 'SYN_DBG' /OBJ=OBJ: 'NODE''DEVICE''DIRECTORY''NAME'
$ IF F$SEARCH(''P2') .EQS. ""
$   THEN
$     WRITE SYS$OUTPUT "LIB/CREATE/LOG ''P2' OBJ:''NAME'"
$     LIB/CREATE/LOG 'P2' OBJ:'NAME'
$   ELSE
$     WRITE SYS$OUTPUT "LIB/REPLACE/LOG ''P2' OBJ:''NAME'"
$     LIB/REPLACE/LOG 'P2' OBJ:'NAME'
$   ENDIF
$ EXIT