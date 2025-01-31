MAIN
 DEFINE c CHAR
	DISPLAY fgl_getkey(5)
	DISPLAY "fgl_getkey(5)"
	OPEN WINDOW w at 1,1 WITH 20 ROWS, 40 COLUMNS ATTRIBUTE (BORDER)
	DISPLAY "waiting for label" AT 5,5
	CALL fgl_getkey() 
END MAIN