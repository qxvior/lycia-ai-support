MAIN
define i INT
Define c STRING
DISPLAY "CHILD" AT 5,5
	FOR i=1 TO 30000
		LET c = c,"" Clipped, "item", trim(i)
	END FOR
CALL fgl_getkey()	
END MAIN