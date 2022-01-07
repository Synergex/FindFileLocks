$ !Compile and link utility
$ TYPE = F$PARSE(''P1',,,"TYPE")
$ IF TYPE .EQS. "." 
$       THEN 
$               TYPE=".DBL"
$       ENDIF
$ NAME = F$PARSE(''P1',,,"NAME")
$ DIRECTORY = F$PARSE(''P1',,,"DIRECTORY")
$ FULLDIRECTORY = F$PARSE(''P1',,,"DIRECTORY", "NO_CONCEAL")
$ DEVICE = F$PARSE(''P1',,,"DEVICE")
$ FULLDEVICE = F$PARSE(''P1',,,"DEVICE", "NO_CONCEAL")
$ NODE = F$PARSE(''P1',,,"NODE")
$ VERSION = F$PARSE(''P1',,,"VERSION")
$ FULLEXEDEV = F$PARSE("EXE:",,,"DEVICE", "NO_CONCEAL")
$ FULLEXEDIR = F$PARSE("EXE:",,,"DIRECTORY", "NO_CONCEAL")
$ WRITE SYS$OUTPUT "COMPILING/LINKING ''NODE'''FULLDEVICE'''FULLDIRECTORY'''NAME'''TYPE'''VERSION'"
$ WRITE SYS$OUTPUT "        TO CREATE ''NODE'''FULLEXEDEV'''FULLEXEDIR'''NAME'.EXE;"
$ WRITE SYS$OUTPUT "DBL ''SYN_DBG' /OBJ=OBJ: ''NODE'''DEVICE'''DIRECTORY'''NAME'''TYPE'''VERSION'"
$ dbl 'SYN_DBG' /OBJ=OBJ: 'NODE''DEVICE''DIRECTORY''NAME'
$ WRITE SYS$OUTPUT "LINK /EXE=EXE: OBJ:''NAME', SYS$SHARE:SSQLRTL.OPT/OPTION, OPTIONS:TOOLS.OPT/OPTION"
$ link /exe=exe: obj:'NAME', options:tools.opt/option, sys$share:synrtl.opt/option
$ EXIT

