MAIN
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2 CHAR(20) END RECORD
DEFINE i,zzz INT
	OPEN WINDOW w WITH FORM "5931/5931_table_row_autoinsert" ATTRIBUTE(BORDER)
	LET tarr[1].f1=1
	LET tarr[2].f1=2

	DIALOG    
		INPUT ARRAY tarr FROM record1.* 
		    BEFORE INPUT 
		        DISPLAY "before INPUT"
			BEFORE INSERT
		        DISPLAY "before INSERT"
		    AFTER INSERT
		        DISPLAY "after INSERT"
			BEFORE ROW 
		        DISPLAY "BEFORE ROW"
				LET i=arr_curr()
				DISPLAY i
			AFTER INPUT
		        DISPLAY "after input"
				CALL tarr.deleteElement(i) --remove selected row
		END INPUT

	    INPUT BY NAME zzz
	    END INPUT	

		ON ACTION EXIT
			EXIT DIALOG
	    ON ACTION ARR_SIZE
	        DISPLAY tarr.getLength()
	END DIALOG
END MAIN
