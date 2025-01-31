MAIN
 DEFINE p STRING
	IF fgl_arch() = "nt" THEN
		LET p = "C:/ProgramData/Querix/progs/"
	ELSE
		LET p = "/opt/Querix/Lycia/progs/"
	END IF

	LET p = p,"ttt.png"
display p
	IF NOT fgl_test("e",p) THEN
		DISPLAY "File does not exist"
	ELSE DISPLAY "PASSED" END IF
	CALL fgl_getkey()

END MAIN