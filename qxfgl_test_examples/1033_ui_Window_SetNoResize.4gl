MAIN
DEFINE zzz INTEGER
DEFINE ow ui.Window

	OPEN WINDOW w WITH FORM "1033/1033_ui_Window_SetNoResize" ATTRIBUTE (BORDER)
	let ow = ui.Window.GetCurrent()
	DISPLAY ow.GetIdentifier()
	CALL ow.setNoResize(TRUE)
	DISPLAY ow.getNoResize()
	CALL fgl_getkey()
END MAIN