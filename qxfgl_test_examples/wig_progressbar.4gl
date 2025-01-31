##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE progressBarValue SMALLINT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	
		
	OPEN WINDOW wProgressBar WITH FORM "form/wig_progressbar"
	
	LET progressBarValue = 5

	
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME progressBarValue		
			DISPLAY progressBarValue TO progressBar		
			
		ON ACTION "EDIT"
			INPUT BY NAME progressBarValue WITHOUT DEFAULTS
				BEFORE INPUT
					CALL dialog.setActionHidden("ACCEPT",TRUE) --hide the OK/accept button
	
				ON CHANGE progressBarValue
					DISPLAY progressBarValue TO progressBar
					
	
			END INPUT
		
		ON ACTION "HELP"
  		CALL onlineHelp("Progressbar",NULL)
  	
  	ON ACTION "CANCEL"
  		EXIT MENU
	END MENU

END MAIN	
				