MAIN
	CALL fgl_getkey()
	WHILE TRUE
		CALL fgl_winprompt(1, 2, "Enter any string (max = 25 chars)", "Your input", 25, 0)
		DISPLAY int_flag
		IF int_flag=1 THEN EXIT WHILE END IF
	END WHILE
	CALL fgl_getkey()
END MAIN