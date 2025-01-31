MAIN
 DEFINE p STRING
 	CALL fgl_getkey()
	IF fgl_arch() = "nt" THEN
		LET p = "C:/ProgramData/Querix/progs/"
	ELSE
		LET p = "/opt/Querix/Lycia/progs/"
	END IF

	LET p = p,"ttt.png"
	CALL fgl_download("ttt.webp",p)  
END MAIN