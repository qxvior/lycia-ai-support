######################################################################################
# Module Scope
#
#
######################################################################################	

DEFINE myRec RECORD
	f11,f12,f13,f14,
	f21,f22,f23,f24,
	f31,f32,f33,f34,
	f41,f42,f43,f44,
	f51,f52,f53,f54 STRING
		END RECORD
		

######################################################################################
# MAIN
#
#
######################################################################################	
MAIN
	OPTIONS INPUT WRAP	
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()
	
	OPEN WINDOW mywin WITH FORM "form/cnt_scrollviewer"
	CALL ui.Interface.setText("ScrollViewer")
	CALL initData()

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME myRec.*
		ON ACTION "EDIT"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS

				ON ACTION "Cancel"
					EXIT INPUT
			
			END INPUT
			
		ON ACTION "CLEAR FORM"
			CLEAR FORM	
			
		ON ACTION "CANCEL"
			EXIT MENU
			
    ON ACTION "HELP"
  		CALL onlineHelp("ScrollViewer",NULL)	
	END MENU
	
END MAIN			


######################################################################################
# FUNCTION initData()
#
#
######################################################################################	
FUNCTION initData()

	LET myRec.f11 = "12345"
	LET myRec.f12 = "1234567890"
	LET myRec.f13 = "123456789012345"
	LET myRec.f14 = "12345678901234567890"

	LET myRec.f22 = "12345"
	LET myRec.f23 = "1234567890"
	LET myRec.f24 = "123456789012345"
	LET myRec.f21 = "12345678901234567890"

	LET myRec.f33 = "12345"
	LET myRec.f34 = "1234567890"
	LET myRec.f31 = "123456789012345"
	LET myRec.f32 = "12345678901234567890"

	LET myRec.f44 = "12345"
	LET myRec.f41 = "1234567890"
	LET myRec.f42 = "123456789012345"
	LET myRec.f43 = "12345678901234567890"

	LET myRec.f51 = "12345"
	LET myRec.f52 = "1234567890"
	LET myRec.f53 = "123456789012345"
	LET myRec.f54 = "12345678901234567890"

END FUNCTION
		