MAIN
 DEFINE i INT
 DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2,f3 STRING END RECORD

	FOR i=1 TO 3
		LET tarr[i].f1="col1_row",trim(i)
		LET tarr[i].f2="col2_row",trim(i)
		LET tarr[i].f3="col3_row",trim(i)
	END FOR
	OPEN WINDOW w WITH FORM "8153/8153_clear_screen_array" ATTRIBUTE(BORDER)
	DISPLAY ARRAY tarr TO scr_arr.*
	CLEAR SCREEN ARRAY scr_arr.*
	CALL fgl_getkey()
END MAIN


