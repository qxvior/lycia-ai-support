DEFINE myRec 
	RECORD
		invAddress2,invAddress3,invPostCode,invCity,invState STRING,
		delAddress1, delAddress2,delAddress3,delPostCode,delCity,delState STRING,
		notes STRING
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

	OPEN WINDOW mywin WITH FORM "form/cnt_groupBox" -- ATTRIBUTE(BORDER)
  CALL fgl_settitle("GroupBox Container Demo Example")
	CALL ui.Interface.setText("GroupBox")
	
	CALL initData()
	
	MENU
		ON ACTION "EDIT"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				BEFORE INPUT
					CALL dialog.setActionHidden("CANCEL",TRUE)
					
		    ON ACTION "HELP"
		    	CALL onlineHelp("GroupBox",NULL)
		    					
				ON ACTION "EXIT"
					EXIT INPUT
			END INPUT
			
		ON ACTION "DISPLAY"
			DISPLAY BY NAME myRec.*

		ON ACTION "CLEAR FORM"
			CLEAR FORM

    ON ACTION "HELP"
    	CALL onlineHelp("GroupBox",NULL)
		    			
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU

END MAIN	


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	DEFINE i SMALLINT
	
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

	LET myRec.notes = "This is just a dummy text note example. ABCDEFGHIJKLMNOPQRSTUVWXYZ ÖöÜüÄäß !§$%&/()=?`"		
	FOR i = 1 TO 7
		LET myRec.notes = myRec.notes, "\n",  myRec.notes 	
	END FOR
END FUNCTION