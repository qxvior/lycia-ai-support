DEFINE order SMALLINT
DEFINE var_1, var_2 STRING 
DEFINE c base.Channel
DEFINE out TEXT
DEFINE str STRING
DEFINE i INT

MAIN
	FOR order=1 TO 50
		DISPLAY "Now is planning batch:",order
		IF order <= 10 THEN CALL fgl_getkey() END IF #to see how qrun grows first 3 iterations 
		FOR i = 1 TO 20000
			IF var_1[1] = var_2[1] THEN
				#do nothing and leak string comparison  
			END IF
		END FOR
	END FOR


	LET c = base.Channel.create()
	IF fgl_arch() = 'nt'THEN
		CALL c.openPipe('tasklist /FI "IMAGENAME eq qrun.exe" > 3173_if_char_memory_leak.txt', "u")
		SLEEP 1
		LOCATE out IN FILE "3173_if_char_memory_leak.txt"
		LET str = out
		LET i = str[str.getlength()-10,str.getlength()-3]
		IF i > 37000 AND i IS NOT NULL THEN 
		 	DISPLAY "FAIL. Actual process size is:",i, "KB"
		ELSE 
		 	DISPLAY "PASS"
		END IF
	ELSE
		CALL c.openPipe('ps -eo comm,rss | grep qrun > 3173_if_char_memory_leak.txt', "u")
		SLEEP 1
		LOCATE out IN FILE "3173_if_char_memory_leak.txt"
		LET str = out
		LET i = str[str.getlength()-10,str.getlength()-1]
		IF i > 70000 AND i IS NOT NULL THEN 
		 	DISPLAY "FAIL. Actual process size is:",i, "KB"
		ELSE 
		 	DISPLAY "PASS"
		END IF

	END IF
	 	
CALL fgl_getkey()
END MAIN

