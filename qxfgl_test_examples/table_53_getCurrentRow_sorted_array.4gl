# Project: 17000
# Filename: table_53_getCurrentRow_sorted_array.4gl
# Created By: egza
# Creation Date: Jan 10, 2017

MAIN
	DEFINE i INT
	DEFINE s STRING
	DEFINE arr DYNAMIC ARRAY OF RECORD
								f1 STRING
							END RECORD
	DEFINE ofs, len INT

OPEN WINDOW w1 WITH FORM "table_53_getCurrentRow_sorted_array" ATTRIBUTE(BORDER)

    LET len = 1000
		FOR i=1 TO len
			LET arr[i].f1="item "||i
		END FOR


      
	DISPLAY ARRAY arr TO sr1.*
		ON ACTION get_curr
			DISPLAY "getCurrwntRow(): ", DIALOG.getCurrentRow("sr1")
			DISPLAY "scr_line(): ",scr_line()

	END DISPLAY
END MAIN