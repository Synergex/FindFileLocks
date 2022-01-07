$ DEFINE BUILD$ROOT DKA0:[USER.CBLUNDELL.TestLocking.] /TRANS=CON
$ DEFINE Options BUILD$ROOT:[BUILD]
$ DEFINE COMS BUILD$ROOT:[BUILD]
$ DEFINE SYNIMPDIR BUILD$ROOT:[proto]
$ DEFINE SYNEXPDIR BUILD$ROOT:[proto]
$ DEFINE SYNDEFNS ChrisBWare.net
$ SYN_DBG:=="/DEBUG"
$ DEFINE OBJ BUILD$ROOT:[obj]
$ define exe BUILD$ROOT:[EXE]
$ define classes BUILD$ROOT:[classes]
$ define source BUILD$ROOT:[source]
$ define subs BUILD$ROOT:[subs]
$ define scripts BUILD$ROOT:[scripts]
$ SET DEF BUILD$ROOT:[BUILD]
