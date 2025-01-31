MAIN
	DEFINE tarr DYNAMIC ARRAY OF RECORD 
		f1 CHAR(30), 
		f2 CHAR(30)
	END RECORD 

	OPTIONS FIELD ORDER UNCONSTRAINED 
	LET tarr[1].f1=1
	LET tarr[2].f1=2	
	OPEN WINDOW w WITH FORM "6080/6080_tabindex_unconstrained"	
	INPUT ARRAY tarr WITHOUT DEFAULTS FROM sr_orderdetl.* 
		BEFORE ROW
			DISPLAY "BEFORE ROW arr_curr()=", trim(arr_curr()),"|",trim(fgl_lastkey())			 
		AFTER ROW
			DISPLAY "AFTER ROW arr_curr()=", trim(arr_curr()),"|",trim(fgl_lastkey())
	END INPUT 
 END MAIN
