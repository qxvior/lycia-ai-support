##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE fDate1, fDate2, fDate3 DATE
	
	CALL ui_init()
	
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
		
	LET fDate1 = DATE ("12/12/2016")
	LET fDate2 = DATE ("12/12/2017")
		
	OPEN WINDOW myWin WITH FORM "form/wig_calendar"
	CALL ui.Interface.setText("Calendar")
	
	DISPLAY fgl_getenv("DBDATE") TO fDBDate

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME fDate1, fDate2

		ON ACTION "EDIT"
			INPUT BY NAME fDate1, fDate2 WITHOUT DEFAULTS
			END INPUT

		ON ACTION "Swap Values"
			LET fDate3 = fDate1
			LET fDate1 = fDate2
			LET fDate2 = fDate3
			DISPLAY BY NAME fDate1, fDate2			

		ON ACTION "Increment" #Add 365 Days
			LET fDate1 = fDate1 + 365
			LET fDate2 = fDate2 + 365
			DISPLAY BY NAME fDate1, fDate2			

	    ON ACTION "HELP"
	    	CALL onlineHelp("Calendar",NULL)

		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU

END MAIN	