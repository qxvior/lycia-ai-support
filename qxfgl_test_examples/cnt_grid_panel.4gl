################################################################################
# Module Scope
################################################################################
DEFINE myRec 
	RECORD
		invAddress1, invAddress2,invAddress3,invPostCode,invCity,invState STRING,
		delAddress1, delAddress2,delAddress3,delPostCode,delCity,delState STRING
	END RECORD

################################################################################
# MAIN
#
#
################################################################################
MAIN
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()

	OPEN WINDOW mywin WITH FORM "form/cnt_gridpanel" 
	CALL ui.Interface.setText("Gridpanel")
	
	CALL initData()
	
	MENU
		ON ACTION DISPLAY
			DISPLAY BY NAME myRec.*
			
		ON ACTION "EDIT"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				BEFORE INPUT
					CALL dialog.setActionHidden("CANCEL",TRUE)
					
		    ON ACTION "HELP"
		    	CALL onlineHelp("Gridpanel",NULL)
		    					
				ON ACTION "CANCEL"
					EXIT INPUT				
					
			END INPUT

		ON ACTION "CLEAR FORM"
			CLEAR FORM	
					
		ON ACTION "CANCEL"
			EXIT MENU

    ON ACTION "HELP"
    	CALL onlineHelp("Gridpanel",NULL)			
	END MENU

END MAIN	


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i SMALLINT
	
	LET myRec.invAddress1 = "Pixel House"
	LET myRec.invAddress2 = "Pixel Drive"
	LET myRec.invAddress3 = "Pixel Area"
	LET myRec.invPostCode = "ABC DEF"		
	LET myRec.invCity = "Pixel City"		
	LET myRec.invState = "Pixel State"		
	
	LET myRec.delAddress1 = "Omega House"
	LET myRec.delAddress2 = "Omega Drive"
	LET myRec.delAddress3 = "Omega Area"
	LET myRec.delPostCode = "GHI JKL"		
	LET myRec.delCity = "Omega City"		
	LET myRec.delState = "Omega State"		


END FUNCTION