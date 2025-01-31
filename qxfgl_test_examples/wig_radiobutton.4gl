##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fChoice1,fChoice2,fChoice1Text,fChoice2Text, fChoice3 SMALLINT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	
	
	OPEN WINDOW myWin WITH FORM "form/wig_radiobutton"
	
	LET fChoice1 = 0
	LET fChoice2 = 1
	LET fChoice1Text = fChoice1
	LET fChoice2Text = fChoice2
	

	DISPLAY BY NAME fChoice1, fChoice2, fChoice1Text, fChoice2Text
		
	MENU
		ON ACTION "Display"
			DISPLAY BY NAME fChoice1, fChoice2, fChoice1Text, fChoice2Text

		ON ACTION "EDIT"
			INPUT BY NAME fChoice1, fChoice2 WITHOUT DEFAULTS

				ON CHANGE fChoice1,fChoice2
					DISPLAY fChoice1 TO fChoice1Text
					DISPLAY fChoice2 TO fChoice2Text		
										
				AFTER INPUT 
					DISPLAY fChoice1 TO fChoice1Text
					DISPLAY fChoice2 TO fChoice2Text
			END INPUT

		ON ACTION "Toggle"
			LET fChoice3 = fChoice1
			LET fChoice1 = fChoice2
			LET fChoice2 = fChoice3
			
			LET fChoice1Text = fChoice1
			LET fChoice2Text = fChoice2
			
			DISPLAY BY NAME fChoice1, fChoice2, fChoice1Text, fChoice2Text						

		ON ACTION "+1"
			IF fChoice1 < 2 THEN
				LET fChoice1 = fChoice1 + 1
			ELSE
				LET fChoice1 = 0
			END IF
			IF fChoice2 < 2 THEN
				LET fChoice2 = fChoice2 + 1
			ELSE
				LET fChoice2 = 0
			END IF

			LET fChoice1Text = fChoice1
			LET fChoice2Text = fChoice2
			
			DISPLAY BY NAME fChoice1, fChoice2, fChoice1Text, fChoice2Text			

		ON ACTION "HELP"
  		CALL onlineHelp("Radiobutton",NULL)
  		
		ON ACTION "CANCEL"
			EXIT MENU							

	END MENU
	
END MAIN	

