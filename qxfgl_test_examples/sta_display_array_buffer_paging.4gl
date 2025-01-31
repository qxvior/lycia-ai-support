################################################################################
# Module Scope Variables
################################################################################
DEFINE glBufferSize SMALLINT
DEFINE glBufferArrayIndex SMALLINT
DEFINE glMasterArraySize INT
DEFINE bufferActionReport STRING
DEFINE recArrayMaster DYNAMIC ARRAY OF
	RECORD       
		f01	STRING,
		f02	STRING,
		f03	STRING,
		f04	STRING,
		f05	STRING
	END RECORD


DEFINE recArrayBuffer DYNAMIC ARRAY OF
	RECORD       
		f01	STRING,
		f02	STRING,
		f03	STRING,
		f04	STRING,
		f05	STRING
	END RECORD


################################################################################
# FUNCTION getBuffer(bufferStart,bufferSize,scrLine)
#
#
################################################################################
FUNCTION getBuffer(bufferStart,bufferSize,scrLine)  --scrLine is only/just used for debugging purpose
	DEFINE i,bufferStart, bufferSize,scrLine INT
	DEFINE debugString STRING
	DEFINE d ui.Dialog

	MESSAGE "getBuffer() is called"
	LET debugString = "getBuffer(", trim(bufferStart), ",", trim(bufferSize), ")   - scrLine=", trim(scrLine)
	#DISPLAY debugSTring
	CALL displayBufferActionReport(debugSTring)
		
	
  LET glBufferArrayIndex = bufferStart

	#check, if the end of the masterArray is reached / DB would simply return an error if you try to move your cursor out of range
	IF glMasterArraySize < bufferStart + bufferSize THEN
		LET bufferStart = glMasterArraySize - bufferStart
		CALL d.setArrayLength("sc5",glMasterArraySize)
	END IF

	FOR i = 1 TO bufferSize
		LET recArrayBuffer[i].f01 = recArrayMaster[glBufferArrayIndex].f01	
		LET recArrayBuffer[i].f02 = recArrayMaster[glBufferArrayIndex].f02
		LET recArrayBuffer[i].f03 = recArrayMaster[glBufferArrayIndex].f03
		LET recArrayBuffer[i].f04 = recArrayMaster[glBufferArrayIndex].f04
		LET recArrayBuffer[i].f05 = recArrayMaster[glBufferArrayIndex].f05
		LET glBufferArrayIndex = glBufferArrayIndex+1		
	END FOR
		--debugInfo on Screen
		DISPLAY recArrayBuffer.getLength() TO recArrayBuffer_getLength

END FUNCTION

################################################################################
# MAIN
#
#
################################################################################
MAIN
	DEFINE bufferStart, bufferLength, i, scrLine,navigateRowLine INTEGER	

	CALL ui_init()	
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	LET glBufferArrayIndex = 1
	OPEN WINDOW mywin WITH FORM "form/sta_display_array_buffer_paging"
	CALL ui.Interface.setText("Paged Disp Arr")	

	CALL initMasterArray(500)  --populates the master array with data - this can be seen like the full DB query with all rows
	
	DISPLAY ARRAY recArrayBuffer TO sc5.* ATTRIBUTES(COUNT=-1) --ATTRIBUTES (UNBUFFERED, COUNT=rec_count,black)
		BEFORE DISPLAY
			DISPLAY arr_curr() TO arr_curr
			DISPLAY fgl_scr_size("sc5") TO fgl_scr_size
			DISPLAY arr_count() TO arr_count

		BEFORE ROW
			DISPLAY fgl_lastkey() TO fgl_lastkey
			DISPLAY fgl_keyname(fgl_lastkey()) TO fgl_keyname
						
		ON ACTION "GoTo"
			LET navigateRowLine = fgl_winprompt(1,1,"Enter the row number which you want to display",1,5,2)
			CALL fgl_dialog_setcurrline(5,navigateRowLine)
			
    ON FILL BUFFER
			CALL recArrayBuffer.clear()
			LET bufferStart = fgl_dialog_getBufferStart()
			LET bufferLength = fgl_dialog_getBufferLength()
				
			#for on screen debugging / demo
			DISPLAY bufferStart TO fgl_dialog_getBufferStart
			DISPLAY bufferLength TO fgl_dialog_getBufferLength
				
			LET scrLine = arr_curr()
			CALL getBuffer(bufferStart,bufferLength,scrLine)

    END DISPLAY
    
    
END MAIN	

################################################################################
# FUNCTION initMasterArray(pArraySize)	
#
#
################################################################################	
FUNCTION initMasterArray(pArraySize)	
	DEFINE pArraySize, i INT
	FOR i = 1 TO pArraySize
		LET recArrayMaster[i].f01 = "AAAA-", trim(i), "-AAAA"  
		LET recArrayMaster[i].f02 = "BBBB-", trim(i), "-BBBB"
		LET recArrayMaster[i].f03 = "CCCC-", trim(i), "-CCCC"
		LET recArrayMaster[i].f04 = "DDDD-", trim(i), "-DDDD"
		LET recArrayMaster[i].f05 = "EEEE-", trim(i), "-EEEE"						
	END FOR	
	
	LET glMasterArraySize = recArrayMaster.getlength()
	DISPLAY glMasterArraySize TO recArrayMaster_getlength
END FUNCTION	


################################################################################
# FUNCTION displayBufferActionReport(appendString)
#
#
################################################################################
FUNCTION displayBufferActionReport(appendString)
	DEFINE appendString STRING
	LET bufferActionReport = bufferActionReport, "\n", appendString
	DISPLAY BY NAME bufferActionReport
END FUNCTION

