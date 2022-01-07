SUBMISSION AUTHOR:  Nigel White  
		    mailto:nigel@synergex.com
		    Systems Programmer
		    Synergex; 2330 Gold Meadow Way;
		    Gold River, CA 95670 	
		    Phone: 916/853 0366
		    http://www.synergex.com

SUBMISSION NAME:    FindLocks.DBL
  
PLATFORM:	    VMS v5.5-2 or higher

SYNERGY VERSION:    Synergy v5.7.9 or higher

DESCRIPTION:	    Identifying a VMS process with a record locked

	People have been asking for a very long time how to 
	identify processes which are holding a record locked 
	on VMS. Well, here's a DBL program that will do it. 
	It produces output like this:

	Triton> run findlocks
	Process 3420009F, "Nigel", User: NIGEL on node: TRITON
	running DKA600:[NIGEL]FINDLOCKS.EXE;149 at _TNA1:
	Has a lock on $2$DKA600:[SYNERGY65.DBL]SYNTXT.ISM;3 
	VBN = 4, ID = 105
	CMP00001RECBIG    E%s size too large              
	Key  1: "CMP00001"
	Key  2: "CMPRECBIG    "


	The file needs two include files in the DBLSTARLET: 
	directory which people don't have.  The modules are 
	"FABDEF.DBL" and "RABDEF.DBL".


