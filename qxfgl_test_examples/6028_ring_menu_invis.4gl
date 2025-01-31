MAIN
CALL fgl_putenv("QX_COMPAT=Informix4GL")
CALL fgl_setactionlabel("accept","")
CALL fgl_setactionlabel("cancel","")
CALL fgl_setactionlabel("help","")
MENU
	COMMAND "EXIT"
		EXIT MENU
END MENU
END MAIN