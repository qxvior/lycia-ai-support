MAIN
	DEFINE country_desc CHAR(13)

	OPEN WINDOW quote_screen WITH FORM "7671/7671_display_null_erases_align" ATTRIBUTE(BORDER)
	LET country_desc="Sint Maarten"        	
	DISPLAY BY NAME country_desc           	
	CALL fgl_getkey()

	DISPLAY NULL TO country_desc
	CALL fgl_getkey()
	
	DISPLAY BY NAME country_desc
	CALL fgl_getkey()
END MAIN
