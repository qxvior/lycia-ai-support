MAIN
CALL fgl_putenv("QX_COMPAT=Informix4GL")
	MENU
		BEFORE MENU
			CALL fgl_setKeylabel("f4","f4 on toolbar") #on toolbar
			CALL fgl_setActionlabel("Action","Action on toolbar")
			CALL fgl_setActionlabel("command2","command2") #should be ignored
		COMMAND "command"
			DISPLAY "command"
		COMMAND "command2" #should be one button in ring menu(not in toolbar)
			DISPLAY "command2"
		COMMAND KEY("F4") #on toolbar
			DISPLAY "F4"
		COMMAND KEY("F5") "F5 on menu" #on ring menu area
			DISPLAY "F5"
		ON ACTION "Action" #on toolbar
			EXIT MENU
		ON ACTION "Exit"#on toolbar
			EXIT MENU
	END MENU
END MAIN