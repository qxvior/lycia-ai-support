MAIN 
	DEFINE fDateTime1, fDateTime2, fDateTime3 DateTime Hour to Second

	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	#setenv DBTIME '%Y-%m-%d %H:%M:%S'
	CALL fgl_setenv("DBTIME","%H:%M:%S")
	LET fDateTime1 = Time ("16:40:25")
	LET fDateTime2 = Time ("22:18:40")
		
	OPEN WINDOW myWin WITH FORM "form/wig_timeedit"

	DISPLAY fgl_getenv("DBTime") TO fDBTime

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME fDateTime1, fDateTime2

		ON ACTION "EDIT"
			INPUT BY NAME fDateTime1, fDateTime2 WITHOUT DEFAULTS
			END INPUT

		ON ACTION "Swap Values"
			LET fDateTime3 = fDateTime1
			LET fDateTime1 = fDateTime2
			LET fDateTime2 = fDateTime3
			DISPLAY BY NAME fDateTime1, fDateTime2			

		ON ACTION "Increment" #Add 2hours 30 minutes 
			LET fDateTime1 = fDateTime1 + TIME("02:30")
			LET fDateTime2 = fDateTime2 + TIME("02:30")
			DISPLAY BY NAME fDateTime1, fDateTime2			

	    ON ACTION "HELP"
	    	CALL onlineHelp("Timeedit",NULL)

		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU

END MAIN	