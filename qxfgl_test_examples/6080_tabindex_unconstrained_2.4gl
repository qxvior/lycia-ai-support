MAIN
	DEFINE tarr DYNAMIC ARRAY OF RECORD 
		f1 CHAR(30),
		f2 CHAR(30)
	END RECORD 
	DEFINE l_idx SMALLINT 

	OPTIONS FIELD ORDER UNCONSTRAINED 
	DEFER INTERRUPT
	
	OPEN WINDOW w WITH FORM "6080/6080_tabindex_unconstrained_2"	
	WHILE TRUE
		INPUT ARRAY tarr WITHOUT DEFAULTS FROM sr_orderdetl.* 
			BEFORE ROW
				DISPLAY "BEFORE ROW arr_curr()=", trim(arr_curr())			 
				LET l_idx = arr_curr()

			AFTER ROW
				LET l_idx = arr_curr() 
   				DISPLAY "AFTER ROW arr_curr()=", l_idx
				IF fgl_lastkey() <>  FGL_KEYVAL("DOWN") THEN
					CALL tarr.delete(l_idx)								 
				END IF

			AFTER INPUT
				CALL tarr.delete(l_idx) 
				NEXT FIELD line_num 
		END INPUT 
	END WHILE
 END MAIN

