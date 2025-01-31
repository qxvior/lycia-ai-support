MAIN
	DEFINE tarr DYNAMIC ARRAY OF RECORD 
		f1 CHAR(30),
		f2 CHAR(30)
	END RECORD 
	DEFINE l_idx SMALLINT 
	OPEN WINDOW w WITH FORM "6081/6081_single_row_navigation"	

	INPUT ARRAY tarr WITHOUT DEFAULTS FROM sr_orderdetl.*  
		AFTER FIELD sold_qty
			DISPLAY "AFTER FIELD"
		BEFORE ROW
			LET l_idx = arr_curr()
			DISPLAY "BEFORE ROW arr_curr()=", trim(l_idx)			 

		AFTER ROW
			LET l_idx = arr_curr()
			DISPLAY "AFTER ROW arr_curr()=", trim(l_idx)			 
			CALL tarr.delete(l_idx)								 
	END INPUT 
 END MAIN
