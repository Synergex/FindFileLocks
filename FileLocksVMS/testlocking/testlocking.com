$! INITIALIZATION FILE...
$!
$ MYDIR = F$DIRECTORY()
$ MYDISK = F$TRNLNM("SYS$DISK")
$!
$ TSTSUB == "''MYDISK'" + F$EXTRACT(0,F$LOCATE("]",MYDIR),MYDIR) + ".TESTLOCKING.]"
$ show sym TSTSUB
$ DEFINE BUILD$ROOT TSTSUB / TRANS=CON
$!
$ DEFINE Options BUILD$ROOT:[BUILD]
$ DEFINE COMS BUILD$ROOT:[BUILD]
$ DEFINE SYNIMPDIR BUILD$ROOT:[proto]
$ DEFINE SYNEXPDIR BUILD$ROOT:[proto]
$ DEFINE SYNDEFNS ChrisBWare.net
$ SYN_DBG:=="/DEBUG"
$ DEFINE OBJ BUILD$ROOT:[obj]
$ DEFINE LOG BUILD$ROOT:[LOG]
$ define exe BUILD$ROOT:[EXE]
$ define classes BUILD$ROOT:[classes]
$ define source BUILD$ROOT:[source]
$ define subs BUILD$ROOT:[subs]
$ define scripts BUILD$ROOT:[scripts]
$ define ctrl build$root:[build]
