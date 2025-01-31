MAIN
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2 CHAR(20) END RECORD
	LET tarr[1].f1=1
	LET tarr[2].f1=2
		CALL tarr.deleteElement(100)
        DISPLAY "arr_size: ",tarr.getLength()
		CALL tarr.deleteElement(0)
        DISPLAY "arr_size: ",tarr.getLength()
		CALL tarr.deleteElement(-100)
        DISPLAY "arr_size: ",tarr.getLength()
	DISPLAY  "OK"        
END MAIN
