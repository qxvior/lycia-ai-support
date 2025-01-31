# Project: lyc1000
# Filename: 4775_arr_curr_after_arr_clean.4gl
# Created By: alch
# Creation Date: Dec 18, 2019

MAIN
DEFINE arr_rec_disp DYNAMIC ARRAY OF RECORD 
	id INTEGER,
	col1 CHAR(16),
	col2 CHAR(16)
	END RECORD
DEFINE l_idx SMALLINT
	
CALL init_record(NULL) RETURNING arr_rec_disp
OPEN WINDOW w1 WITH FORM "4775/4775_arr_curr_after_arr_clean"
DISPLAY ARRAY arr_rec_disp TO sr_disp.* #ATTRIBUTES (UNBUFFERED)  
	BEFORE ROW	
		LET l_idx = arr_curr()
		DISPLAY "arr_curr() = ", l_idx
		IF l_idx > 0 THEN
			DISPLAY "Selected row ",  arr_rec_disp[l_idx]
		END IF
	ON ACTION "Clean"
		CALL arr_rec_disp.clear()
		CALL init_record(5) RETURNING arr_rec_disp
		#CLEAR FORM
	ON ACTION "Exit"
		EXIT DISPLAY
END DISPLAY
END MAIN

FUNCTION init_record(idx)
	DEFINE i INTEGER
	DEFINE idx INTEGER
	DEFINE l_arr_rec_disp DYNAMIC ARRAY OF RECORD 
		id INTEGER,
		col1 CHAR(16),
		col2 CHAR(16)
	END RECORD
	IF idx IS NULL THEN
		LET idx = 0
	END IF
	
	FOR i = 1 TO 20
		LET l_arr_rec_disp[i].id = i + idx
		LET l_arr_rec_disp[i].col1 = i + 5 + idx
		LET l_arr_rec_disp[i].col2 = "column"||trim(i + idx)
	END FOR
	RETURN l_arr_rec_disp
END FUNCTION