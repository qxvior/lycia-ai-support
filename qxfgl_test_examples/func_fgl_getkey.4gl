MAIN
	DEFINE x CHAR
	DEFINE s STRING
	
	CALL fgl_setactionlabel("Accept","")
	CALL fgl_setactionlabel("Cancel","")
	#ui.ToolbarButton methods or something like that

	LET x = fgl_getkey()
	
	DISPLAY x

	LET s = fgl_getkey()
	
	DISPLAY s
	
END MAIN
