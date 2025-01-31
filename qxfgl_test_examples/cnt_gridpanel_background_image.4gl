##############################################################################
# Form INPUT and in the background is an image of a paper-form"
#
# 31.11.2017 HuHo
##############################################################################

		
##############################################################################
# Module Scope
##############################################################################
DEFINE taxRecord RECORD
		Finanzamt1, Finanzamt2, Finanzamt3 STRING,
		Arbeitgeber1,Arbeitgeber2,Arbeitgeber3 STRING,
		rbg_period SMALLINT
	END RECORD

		
##############################################################################
# MAIN
#
#
##############################################################################
MAIN
	CALL ui_init()

	OPTIONS INPUT WRAP
	OPTIONS FIELD ORDER UNCONSTRAINED
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL init_data()
	
	OPEN WINDOW wPaperForm WITH FORM "form/cnt_gridpanel_background_image"
	
	CALL ui.Interface.setText("Gp Background")

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME taxRecord.*
		
		ON ACTION "CLEAR FORM"
			CLEAR FORM	
						
		ON ACTION "EDIT" 	
			INPUT BY NAME taxRecord.* WITHOUT DEFAULTS
		    ON ACTION "HELP"
    			CALL onlineHelp("Gridpanel",NULL)		
    	END INPUT
    	
		ON ACTION "CANCEL"
			EXIT MENU

    ON ACTION "HELP"
    	CALL onlineHelp("Gridpanel",NULL)					
	END MENU
	
END MAIN

##############################################################################
# FUNCTION init_data()
#
#
##############################################################################
FUNCTION init_data()
	LET taxRecord.Finanzamt1 = "Finanzamt Erding"
	LET taxRecord.Finanzamt2 = "Münchener Str. 31"
	LET taxRecord.Finanzamt3 = "85435 Erding"
	LET taxRecord.Arbeitgeber1 = "Supernova GmbH"
	LET taxRecord.Arbeitgeber2 = "Marienplatz 1"
	LET taxRecord.Arbeitgeber3 = "80331 München"
	LET taxRecord.rbg_period = 1	
END FUNCTION