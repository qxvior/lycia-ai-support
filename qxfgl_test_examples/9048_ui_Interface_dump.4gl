MAIN
 DEFINE c CHAR
	DISPLAY ui.Interface.dump()
	DISPLAY "##################################################"
	
	PROMPT "my_text" FOR CHAR c
		ON KEY(f2)
			DISPLAY ui.Interface.dump()
			DISPLAY "##################################################"
	END PROMPT
	DISPLAY ui.Interface.dump()
	DISPLAY "##################################################"
	DISPLAY "DONE"
END MAIN