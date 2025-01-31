GLOBALS "3462_globs.4gl"
define ag array[100] of record ---Informix 4GL accept, because variable ag in m
        cech char
       END RECORD
MAIN
	LET ag[1].cech ="!"
	LET gtext = "!!"
	DISPLAY "OK"
	DISPLAY ag[1].cech
	DISPLAY gtext
END MAIN
