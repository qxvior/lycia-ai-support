################################################################################
# Module Scope
################################################################################
DEFINE myData DYNAMIC ARRAY OF 
	RECORD
		f1,f2,f3 STRING,
		f4 int,
		f5 DATE
	END RECORD
	
DEFINE fullData DYNAMIC ARRAY OF 
	RECORD
		f1,f2,f3 STRING,
		f4 int,
		f5 DATE
	END RECORD

DEFINE styles_arr DYNAMIC ARRAY OF RECORD
		f1,f2,f3,f4,f5,stylesf STRING
		END RECORD

DEFINE l_currentLine INT
 
DEFINE initialArraySize INT

DEFINE modu_action_state BOOLEAN #Used to demonstate dynamic hide/show toolbar button in display array
################################################################################
# MAIN
#
#
################################################################################ 
MAIN
	DEFINE i INT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	DEFER INTERRUPT
	
	CALL ui_init()
	CALL initData()							#init master array with data  (also creates an array duplicate/casting just for demo purpose)

		
	OPEN WINDOW mywin WITH FORM "form/gui_toolbar_dynamic_conditional_button"
	CALL ui.Interface.setText("Display Array")
	
	DIALOG
		#DISPLAY ARRAY
		DISPLAY ARRAY myData TO sc5.*
			BEFORE DISPLAY
				CALL DIALOG.setArrayAttributes( "sc5", styles_arr )
				DISPLAY arr_count() TO arr_count
		
			BEFORE ROW
				DISPLAY arr_curr() TO l_currentLine  	
				DISPLAY fgl_scr_size("sc5")	 TO scr_size  --NOTE: This is just for demo purpose, screenSize is NOT supported in the dynamic table container		
				DISPLAY arr_count() TO arr_count
				
				
			ON ACTION "Hide-Show Button"
				CALL dialog.setActionHidden("Message", modu_action_state);
	 			LET modu_action_state = NOT modu_action_state
	 			
--				IF modu_action_state = TRUE THEN
--					LET modu_action_state = FALSE
--					CALL fgl_dialog_setkeylabel("Message","")
--				ELSE
--					LET modu_action_state = TRUE
--					CALL fgl_dialog_setkeylabel("Message","Message")
--				END IF					
				
			
			ON ACTION "Message"
				CALL fgl_winmessage("Test Message","Test Message","info")					
		END DISPLAY
		
		#INPUT
		INPUT BY NAME l_currentLine
			AFTER FIELD l_currentLine
				CALL fgl_dialog_setcurrline(fgl_scr_size("sc5"), l_currentLine)	 
		END INPUT
		
		#DIALOG actions
		ON ACTION "Add Rows"
			INITIALIZE styles_arr TO NULL
			CALL addRows()
				DISPLAY arr_count() TO arr_count			
			CALL initTableStyleArray()
		
			CALL DIALOG.setArrayAttributes( "sc5", styles_arr )
		
		ON ACTION "CANCEL"
			EXIT DIALOG
			
    ON ACTION "HELP"
  		CALL onlineHelp(NULL,"TableAll")				
		
	END DIALOG
END MAIN


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
DEFINE i int

	LET initialArraySize = 300

	FOR i = 1 TO initialArraySize
		LET fullData[i].f1 = "Original Data - row ", trim(i), " - f1"
		LET fullData[i].f2 = "Original Data - row ", trim(i), " - f2"
		LET fullData[i].f3 = "Original Data - row ", trim(i), " - f3"		
		LET fullData[i].f4 = fgl_random(1,100)
		LET fullData[i].f5 = fgl_random(38000,45000)
	END FOR
	
	CALL recordCasting()		
	CALL initTableStyleArray()  ## example for highligthing rows with a specific condition

END FUNCTION


################################################################################
# FUNCTION addRows()
#
#
################################################################################
FUNCTION addRows()
	DEFINE i, arrSize INT

	LET arrSize = myData.getLength()
	FOR i=arrSize TO arrSize+20
	LET fullData[i].f1 = "New Data - row ", trim(i), " - f1"
	LET fullData[i].f2 = "New Data - row ", trim(i), " - f2"
	LET fullData[i].f3 = "New Data - row ", trim(i), " - f3"
	LET fullData[i].f4 = fgl_random(1,100)
	LET fullData[i].f5 = fgl_random(38000,45000)
	END FOR	
	CALL recordCasting()	
	CALL initTableStyleArray()  ## example for highligthing rows with a specific condition	
END FUNCTION

################################################################################
# FUNCTION recordCasting()
#
#
################################################################################
FUNCTION recordCasting()
	DEFINE i INT
	
	FOR i = 1 TO fullData.getSize()
		LET myData[i].f1 = fullData[i].f1
		LET myData[i].f2 = fullData[i].f2
		LET myData[i].f3 = fullData[i].f3
		LET myData[i].f4 = fullData[i].f4
		LET myData[i].f5 = fullData[i].f5								
	END FOR
END FUNCTION


################################################################################
#FUNCTION initTableStyleArray()
#
#
################################################################################
FUNCTION initTableStyleArray()
	DEFINE i INT
	
	FOR i = 1 TO  fullData.getsize()
		IF fullData[i].f4 >80 THEN
			#this row needs be highlighted (some background color)
			LET styles_arr[i].stylesf = "style=\highlight_str\""
		END IF
	END FOR
END FUNCTION

