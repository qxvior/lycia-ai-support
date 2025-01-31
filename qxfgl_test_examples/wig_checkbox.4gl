DEFINE cbRec RECORD 
	f1 CHAR,
	f2 CHAR(3),
	f3 SMALLINT,
	f4 SMALLINT
	END RECORD
	
	
################################################################################
# MAIN
#
#
################################################################################	
MAIN
	CALL ui_init()
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
			
	OPEN WINDOW mywin WITH FORM "form/wig_checkbox"
	CALL ui.Interface.setText("CheckBox")
	
	CALL initData()

	DISPLAY cbRec.f1 TO f1CheckBoxValue
	DISPLAY cbRec.f2 TO f2CheckBoxValue
	DISPLAY cbRec.f3 TO f3CheckBoxValue
	DISPLAY cbRec.f4 TO f4CheckBoxValue
			
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME cbRec.f1
			DISPLAY BY NAME cbRec.f2
			DISPLAY BY NAME cbRec.f3 
			DISPLAY BY NAME cbRec.f4 
			


		ON ACTION "EDIT"
			INPUT BY NAME cbRec.* WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
				BEFORE INPUT
					#CALL dialog.setActionHidden("ACCEPT",TRUE)
					#CALL dialog.setActionHidden("CANCEL",TRUE)
					
				ON ACTION "CANCEL"
					EXIT INPUT
		
				ON CHANGE f1
					DISPLAY cbRec.f1 TO f1CheckBoxValue			
		
				ON CHANGE f2
					DISPLAY cbRec.f2 TO f2CheckBoxValue		
						
				ON CHANGE f3
					DISPLAY cbRec.f3 TO f3CheckBoxValue		
						
				ON CHANGE f4
					DISPLAY cbRec.f4 TO f4CheckBoxValue			
				

	    ON ACTION "HELP"
	    	CALL onlineHelp("Checkbox",NULL)			
			END INPUT

		ON ACTION "EXIT"
			EXIT MENU
	END MENU

	DISPLAY "F1=", trim(cbRec.f1)
	DISPLAY "F2=", trim(cbRec.f2)
	DISPLAY "F3=", trim(cbRec.f3)
	DISPLAY "F4=", trim(cbRec.f4)

END MAIN	


################################################################################
# FUNCTION initData()
#
#
################################################################################	
FUNCTION initData()
	LET cbRec.f1 = "Y"
	LET cbRec.f2 = "Yes"
	LET cbRec.f3 = 1
	LET cbRec.f4 = 0

END FUNCTION
	