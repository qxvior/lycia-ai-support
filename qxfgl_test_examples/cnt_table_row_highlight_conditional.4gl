######################################################################
# Module Scope
######################################################################

DEFINE mdArrSize INT
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

######################################################################
# MAIN
#
#
###################################################################### 
MAIN
	DEFINE i INT
	
	CALL ui_init()
		
	LET mdArrSize = 1000
	CALL initData()							#init master array with data  (also creates an array duplicate/casting just for demo purpose)

	#CALL initToolbar()					#set some default key labels (toolbar buttons)
	
	OPEN WINDOW mywin WITH FORM "form/cnt_table_row_highlight_conditional"
  CALL fgl_settitle("XXL DISPLAY Array with conditional row highlighr Demo Example")

	DISPLAY "" TO arr_count
	CALL ui.Interface.setText("XXL Display pArray")

	CALL ui.interface.refresh()
	CALL fgl_winmessage("Display Array 1000 Rows","Note: We use a Display Array with\n1000 Rows !\n\nAND\n\nWe apply a conditional\nrow highligth format","info")
 
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
		
		ON ACTION "Exit"
			EXIT DIALOG
     			
    ON ACTION "HELP"
  		CALL onlineHelp("TableAll",NULL)				
		
	END DIALOG
END MAIN


######################################################################
# FUNCTION initData()
#
#
######################################################################
FUNCTION initData()
DEFINE i int
	FOR i = 1 TO mdArrSize
		LET fullData[i].f1 = "Original Data - row ", trim(i), " - f1"
		LET fullData[i].f2 = "Original Data - row ", trim(i), " - f2"
		LET fullData[i].f3 = "Original Data - row ", trim(i), " - f3"		
		LET fullData[i].f4 = fgl_random(1,100)
		LET fullData[i].f5 = fgl_random(38000,45000)
	END FOR
	
	CALL recordCasting()		
	CALL initTableStyleArray()  ## example for highligthing rows with a specific condition

END FUNCTION


######################################################################
# FUNCTION addRows()
#
#
######################################################################
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


######################################################################
# FUNCTION recordCasting()
#
#
######################################################################
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


######################################################################
# FUNCTION initTableStyleArray()
#
#
######################################################################
FUNCTION initTableStyleArray()
	DEFINE i INT
	
	FOR i = 1 TO  fullData.getsize()
		IF fullData[i].f5 < 39500 THEN
			#this row needs be highlighted (some background color)
			LET styles_arr[i].stylesf = "style=\highlight_str\""
		END IF
	END FOR
END FUNCTION

