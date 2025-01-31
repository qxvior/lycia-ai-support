MAIN
	CALL fgl_putenv("QX_COMPAT=Informix4gl")
	OPEN WINDOW w WITH FORM "8600/8600_action_toolbar_i4gl"
	MENU
		ON ACTION "act1" DISPLAY "act1"
		ON ACTION "act2" DISPLAY "act2"
		ON ACTION "exit"
			EXIT MENU
	END MENU
END MAIN