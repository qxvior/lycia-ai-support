#############################################################################
# Module Scope
#############################################################################
DEFINE myRec RECORD 
	f1 STRING,
	f3 STRING,
	f4 STRING,
	f5 DATE,
	f6 STRING,
	f7 STRING,
	f8 SMALLINT,
	f9 Datetime Hour to Second

	END RECORD
	
#############################################################################
# MAIN
#
#
#############################################################################	
MAIN
	CALL ui_init()
	CALL ui.Interface.setText("Widgets")
	
	OPEN WINDOW mywin WITH FORM "form/css_dataWidget_selectors"

	CALL ui.Interface.setText("CSS-Selectors")
		
	CALL initData()	

		
	INPUT BY NAME myRec.* WITHOUT DEFAULTS
		BEFORE INPUT
			EXIT INPUT
	END INPUT
	
	
	MENU
		ON ACTION "Edit"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				ON ACTION actButton
					CALL fgl_winmessage("button","button","info")
			END INPUT
			
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU		
			
										
END MAIN


#############################################################################
# FUNCTION initData()
#
#
#############################################################################
FUNCTION initData()
								
	LET myRec.f1 = "f1"
	#LET myRec.f2 = "f2"
	LET myRec.f3 = "f3"
	LET myRec.f4 = "f4-1"
	LET myRec.f5 = "12/12/2015"
	LET myRec.f6 = "f6"
	LET myRec.f7 = "f7"		
	LET myRec.f8 = 8
	LET myRec.f9 = "20:45:11"
	
END FUNCTION

