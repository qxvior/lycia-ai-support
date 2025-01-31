##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE fSpinner1, fSpinner2, fSpinner3 SMALLINT

	CALL ui_init()
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
		
	LET fSpinner1 = 1
	LET fSpinner2 = 10
	LET fSpinner3 = 20
			
	OPEN WINDOW myWin WITH FORM "form/wig_spinner"
	CALL ui.Interface.setText("Spinner")
	
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME fSpinner1, fSpinner2

		ON ACTION "EDIT"
			INPUT BY NAME fSpinner1, fSpinner2 WITHOUT DEFAULTS
			END INPUT

		ON ACTION "Swap Values"
			LET fSpinner3 = fSpinner1
			LET fSpinner1 = fSpinner2
			LET fSpinner2 = fSpinner3
			DISPLAY BY NAME fSpinner1, fSpinner2			

		ON ACTION "Increment" #Add 5
			IF fSpinner1 =20 THEN
				LET fSpinner1 = 0
			ELSE
				IF fSpinner1 <=15 THEN
					LET fSpinner1 = fSpinner1 + 5
				ELSE
					LET fSpinner1 = 20
				END IF
			END IF

			IF fSpinner2 =20 THEN
				LET fSpinner2 = 0
			ELSE
				IF fSpinner2 <=15 THEN
					LET fSpinner2 = fSpinner2 + 5
				ELSE
					LET fSpinner2 = 20
				END IF
			END IF

			DISPLAY BY NAME fSpinner1, fSpinner2			

	    ON ACTION "HELP"
	    	CALL onlineHelp("Spinner",NULL)

		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU

END MAIN
##################################################################################
# END MAIN
##################################################################################