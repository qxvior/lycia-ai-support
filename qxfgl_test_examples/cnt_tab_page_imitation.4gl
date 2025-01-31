##############################################################################
# Module Scope
##############################################################################
DEFINE recContactDetails 
	RECORD
		contactId SMALLINT
	END RECORD

DEFINE recContactActivities
	RECORD
		detLogType SMALLINT
	END RECORD

DEFINE recAccountSummary
	RECORD
		totOutstanding MONEY (8,2)
	END RECORD


DEFINE windowList RECORD
		winTab1Open, winTab2Open, winTab3Open BOOLEAN
	END RECORD


##############################################################################
# MAIN
#
#
##############################################################################		
MAIN
	DEFINE inpModule SMALLINT
	
	CALL ui_init()	
	OPTIONS INPUT WRAP	
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	#init data

	#init
	#CALL editContactDetails()
	LET windowList.winTab1Open = FALSE
	LET windowList.winTab1Open = FALSE
	LET windowList.winTab1Open = FALSE

	LET inpModule = 1
	WHILE inpModule <> 0 
	
		CASE inpModule
			WHEN 1
				LET inpModule = editContactDetails()
			WHEN 2
				LET inpModule = editContactActivities()
			WHEN 3
				LET inpModule = editAccountSummary()
		END CASE	
	END WHILE

	
END MAIN

##############################################################################
# FUNCTION editContactDetails()
#
#
##############################################################################
FUNCTION editContactDetails()
	DEFINE retValue SMALLINT
	
	IF windowList.winTab1Open = TRUE THEN
		CURRENT WINDOW IS winTab1
	ELSE
		OPEN WINDOW winTab1 WITH FORM "form/cnt_tab_page_imitation_tab1.fm2"
		LET windowList.winTab1Open = TRUE 	
	END IF


	INPUT BY NAME recContactDetails.* WITHOUT DEFAULTS
	
		ON ACTION "actContactDetails"
			LET retValue = 1
			EXIT INPUT

		ON ACTION "actContactActivities"
			LET retValue = 2
			EXIT INPUT			

		ON ACTION "actAccountSummary"
			LET retValue = 3
			EXIT INPUT
					
		ON ACTION "CANCEL"
			EXIT INPUT	
			
    ON ACTION "HELP"
  		CALL onlineHelp("TabContainer",NULL)				
	
	END INPUT
	
	IF int_flag = TRUE THEN
		LET int_flag = FALSE
	ELSE
		IF FIELD_TOUCHED(*) THEN
			#write Data to database
			MESSAGE "Save/Write modified contact details record to the database"
		ELSE
			ERROR "Record was not modified - Nothing to save"	
		END IF
	END IF

	RETURN retValue
END FUNCTION

##############################################################################
# FUNCTION editContactActivities()
#
#
##############################################################################
FUNCTION editContactActivities()
	DEFINE retValue SMALLINT
	
	IF windowList.winTab2Open = TRUE THEN
		CURRENT WINDOW IS winTab2
	ELSE
		OPEN WINDOW winTab2 WITH FORM "form/cnt_tab_page_imitation_tab2.fm2"
		LET windowList.winTab2Open = TRUE 	
	END IF

	INPUT BY NAME recContactActivities.* WITHOUT DEFAULTS
	
		ON ACTION "actContactDetails"
			LET retValue = 1
			EXIT INPUT

		ON ACTION "actContactActivities"
			LET retValue = 2
			EXIT INPUT			

		ON ACTION "actAccountSummary"
			LET retValue = 3
			EXIT INPUT
					
		ON ACTION "CANCEL"
			EXIT INPUT	
			
    ON ACTION "HELP"
  		CALL onlineHelp("TabContainer",NULL)				
	
	END INPUT
	
	IF int_flag = TRUE THEN
		LET int_flag = FALSE
	ELSE
		IF FIELD_TOUCHED(*) THEN
			#write Data to database
			MESSAGE "Save/Write modified contact details record to the database"
		ELSE
			ERROR "Record was not modified - Nothing to save"	
		END IF
	END IF

	RETURN retValue
END FUNCTION
	


##############################################################################
# FUNCTION editAccountSummary()
#
#
##############################################################################
FUNCTION editAccountSummary()
	DEFINE retValue SMALLINT
	
	IF windowList.winTab3Open = TRUE THEN
		CURRENT WINDOW IS winTab3
	ELSE
		OPEN WINDOW winTab3 WITH FORM "form/cnt_tab_page_imitation_tab3.fm2"
		LET windowList.winTab3Open = TRUE 	
	END IF

	INPUT BY NAME recAccountSummary.* WITHOUT DEFAULTS
	
		ON ACTION "actContactDetails"
			LET retValue = 1
			EXIT INPUT

		ON ACTION "actContactActivities"
			LET retValue = 2
			EXIT INPUT			

		ON ACTION "actAccountSummary"
			LET retValue = 3
			EXIT INPUT
					
		ON ACTION "CANCEL"
			EXIT INPUT	
			
    ON ACTION "HELP"
  		CALL onlineHelp("TabContainer",NULL)				
	
	END INPUT
	
	IF int_flag = TRUE THEN
		LET int_flag = FALSE
	ELSE
		IF FIELD_TOUCHED(*) THEN
			#write Data to database
			MESSAGE "Save/Write modified contact details record to the database"
		ELSE
			ERROR "Record was not modified - Nothing to save"	
		END IF
	END IF

	RETURN retValue
END FUNCTION
