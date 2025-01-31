######################################################################
# Module Scope
#
#
######################################################################
DEFINE
  pProg         ARRAY[100] OF RECORD
     LineNo        INTEGER,
     LineText      CHAR(32)
                END RECORD,

  MaxpProg      INTEGER,
  IspProg       INTEGER,


   lValue       CHAR(1)  

	DEFINE info,info2, info3 STRING
	   

  
######################################################################
# MAIN
#
#
######################################################################  
MAIN
	DEFER INTERRUPT
	CALL ui_init()

	CALL ui.Interface.setText("Display Array")


	LET MaxpProg = 100

	   
	MENU
		BEFORE MENU
			CALL fgl_dialog_setkeylabel("PER Record","PER Record","{CONTEXT}/public/querix/icon/svg/24/ic_table_classic_24px.svg",11,true,"Show Display Array with classic PER Screen Array RECORD","top")
			CALL fgl_dialog_setkeylabel("PER GRID","PER GRID","{CONTEXT}/public/querix/icon/svg/24/ic_table_grid_24px.svg",12,true,"Show Display Array with classic PER Screen Array GRID","top")
			CALL fgl_dialog_setkeylabel("FM2 Table","FM2 Table","{CONTEXT}/public/querix/icon/svg/24/ic_table_grid_24px.svg",13,true,"Show DISPLAY ARRAY with Dynamic fm2 Table","top")
	
		ON ACTION "PER Record"
		   
			OPEN WINDOW wMain
				WITH FORM "form/cnt_table_display_array_classic_and_modern_per_classic"
				
				#ATTRIBUTES (BORDER, FORM LINE FIRST + 1)
			CALL initLabels()
			CALL subMenu()
			CLOSE WINDOW wMain
						
		ON ACTION "PER Grid"

			OPEN WINDOW wMain
				WITH FORM "form/cnt_table_display_array_classic_and_modern_per_modern"
				#ATTRIBUTES (BORDER, FORM LINE FIRST + 1)
			CALL initLabels()
			CALL subMenu()
			CLOSE WINDOW wMain
		
		ON ACTION "FM2 Table"

			OPEN WINDOW wMain
				WITH FORM "form/cnt_table_display_array_classic_and_modern_fm2"
				#ATTRIBUTES (BORDER, FORM LINE FIRST + 1)
			CALL initLabels()
			CALL subMenu()
			CLOSE WINDOW wMain
		


		ON ACTION "Exit"
			EXIT MENU
			
    ON ACTION "HELP"
  		CALL onlineHelp("Table",NULL)				
			
	END MENU

END MAIN


######################################################################
# FUNCTION initLabels()
#
#
###################################################################### 
FUNCTION initLabels()
LET info =""
LET info2 =""
LET info3 =""
DISPLAY BY NAME info
DISPLAY BY NAME info2
DISPLAY BY NAME info3
END FUNCTION


######################################################################
# FUNCTION subMenu()
#
#
###################################################################### 
FUNCTION subMenu()
	MENU
		BEFORE MENU
			CALL fgl_dialog_setkeylabel("Show All I","Show All Inactive","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_1_24px.svg",11,true,"Show ALL rows - Inactive - Move to the last line")
			CALL fgl_dialog_setkeylabel("Show 3 I","Show 3 Inactive","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_2_24px.svg",12,true,"Show 3 rows - Inactive - Move to the last line")
			CALL fgl_dialog_setkeylabel("Show All A","Show All Active","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_3_24px.svg",13,true,"Show ALL rows - Active - Move to the last line")
			CALL fgl_dialog_setkeylabel("Show 3 A","Show 3 Active","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_4_24px.svg",14,true,"Show 3 rows - Active - Move to the last line")
			CALL fgl_dialog_setkeylabel("Show All I E","Show All Ina. Ex","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_5_24px.svg",15,true,"Show ALL rows - Inactive - with straight BEFORE DISPLAY / EXIT DISPLAY")
			CALL fgl_dialog_setkeylabel("Show 3 I E","Show 3 Ina. Ex","{CONTEXT}/public/querix/icon/svg/24/key/ic_filter_6_24px.svg",16,true,"Show 3 rows - Inactive - with straight BEFORE DISPLAY / EXIT DISPLAY")
			

		ON ACTION "Show All I"
			CALL showAllInactive()
		ON ACTION "Show 3 I"
			CALL show3Inactive()
		ON ACTION "Show ALL A"
			CALL showAllActive()
		ON ACTION "Show 3 A"
			CALL show3Active()
		ON ACTION "Show All I E"
			CALL showAllInactiveWithBeforeExit() 
		ON ACTION "Show 3 I E"			
			CALL show3InactiveWithBeforeExit()
			 
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
END FUNCTION


######################################################################
# FUNCTION initArray(contentsType)
#
#
###################################################################### 
FUNCTION initArray(contentsType)
	DEFINE contentsType smallInt
	DEFINE    lIdx         INTEGER


	IF contentsType = 3 THEN
	FOR lIdx = 1 TO MaxpProg 
		LET pProg[lIdx].LineNo = lIdx
		LET pProg[lIdx].LineText = "003 - AAAAA Line-No: ", lIdx USING "&&&", " AAAAA - 003"
	END FOR
	ELSE
	FOR lIdx = 1 TO MaxpProg 
		LET pProg[lIdx].LineNo = lIdx
		LET pProg[lIdx].LineText = "100 - BBBBB Line-No: ", lIdx USING "&&&", " BBBBB - 100"
	END FOR

	END IF
	
END FUNCTION

 
######################################################################
# FUNCTION show3Inactive()
#
# Display 3 rows and select the last/3rd row
###################################################################### 
FUNCTION show3Inactive()
	LET IspProg = 3

	CALL initArray(3)
		
	DISPLAY ARRAY pProg TO sProg.* 
		ATTRIBUTES (COUNT = IspProg) 
      
		BEFORE DISPLAY
    	LET info = "Display ", trim(IspProg), " Rows and select the last row" 
			DISPLAY BY NAME info
			LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
			DISPLAY BY NAME info2
			LET info3 = "BEFORE DISPLAY fgl_dialog_setcurrline(", trim(fgl_scr_size("sprog")), ",", trim(ARR_COUNT()), ")"
			DISPLAY BY NAME info3 
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size 

			CALL fgl_dialog_setcurrline(fgl_scr_size("sprog"), ARR_COUNT())
			DISPLAY arr_curr() TO arr_curr      
			EXIT DISPLAY	

	END DISPLAY

END FUNCTION

######################################################################
# FUNCTION showAllInactive()
#
# Display all/100 rows and select the last/100th row	
###################################################################### 
FUNCTION showAllInactive()
	LET IspProg = MaxpProg

	CALL initArray(100)
	            
	DISPLAY ARRAY pProg TO sProg.*  
		ATTRIBUTES (COUNT = IspProg) 

		BEFORE DISPLAY
    	LET info = "Display ", trim(IspProg), " Rows and select the last row" 
			DISPLAY BY NAME info		
			LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
			DISPLAY BY NAME info2		
			LET info3 = "BEFORE DISPLAY fgl_dialog_setcurrline(", trim(fgl_scr_size("sprog")), ",", trim(ARR_COUNT()), ")"
			DISPLAY BY NAME info3 				
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size
			       
			CALL fgl_dialog_setcurrline(fgl_scr_size("sprog"), ARR_COUNT())
			DISPLAY arr_curr() TO arr_curr 

      EXIT DISPLAY

   END DISPLAY
         
END FUNCTION


######################################################################
# FUNCTION showAllActive()
#
# Normal active display array with all rows
###################################################################### 
FUNCTION showAllActive()
	LET IspProg = MaxpProg

	CALL initArray(100)
	
	DISPLAY ARRAY pProg TO sProg.*  
		ATTRIBUTES (COUNT = IspProg) 
		
		BEFORE DISPLAY
    	LET info = "Display ", trim(IspProg), " Rows, select last row and act ACTIVE" 
			DISPLAY BY NAME info		
			LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
			DISPLAY BY NAME info2			
			LET info3 = "BEFORE DISPLAY fgl_dialog_setcurrline(", trim(fgl_scr_size("sprog")), ",", trim(ARR_COUNT()), ")"
			DISPLAY BY NAME info3 		
				
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size    

			CALL fgl_dialog_setcurrline(fgl_scr_size("sprog"), ARR_COUNT())
			
		BEFORE ROW
			DISPLAY arr_curr() TO arr_curr 
			 
	END DISPLAY  
  
END FUNCTION


######################################################################
# FUNCTION show3Active()
#
# 3 rows - Active display array with 3 rows
###################################################################### 
FUNCTION show3Active()
	LET IspProg = 3
	CALL initArray(3)
	
	DISPLAY ARRAY pProg TO sProg.*  
		ATTRIBUTES (COUNT = IspProg) 
		
		BEFORE DISPLAY
    	LET info = "Display ", trim(IspProg), " Rows, select last row and act ACTIVE" 
			DISPLAY BY NAME info		
			LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
			DISPLAY BY NAME info2			
			LET info3 = "BEFORE DISPLAY fgl_dialog_setcurrline(", trim(fgl_scr_size("sprog")), ",", trim(ARR_COUNT()), ")"
			DISPLAY BY NAME info3 
			
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size    

			CALL fgl_dialog_setcurrline(fgl_scr_size("sprog"), ARR_COUNT())	

		BEFORE ROW
			DISPLAY arr_curr() TO arr_curr 
						 
	END DISPLAY  
  
END FUNCTION




######################################################################
# FUNCTION showAllInactiveWithBeforeExit()
#
# Test a display array with ALL rows (100) and follow a straight exit display in the before display statement / like a none scroll
###################################################################### 
FUNCTION showAllInactiveWithBeforeExit()   
	LET IspProg = MaxpProg
	CALL initArray(100)
	
	LET info = "Display ", trim(IspProg), " Rows and exit display array like a none scroll" 
	DISPLAY BY NAME info		
	LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
	DISPLAY BY NAME info2	
	LET info3 = "BEFORE DISPLAY EXIT DISPLAY"
	DISPLAY BY NAME info3 

	DISPLAY ARRAY pProg TO sProg.*  
		ATTRIBUTES (COUNT = IspProg)	
		BEFORE DISPLAY
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size  	
			DISPLAY arr_curr() TO arr_curr 	
			EXIT DISPLAY
	END DISPLAY
         
END FUNCTION


######################################################################
# FUNCTION show3InactiveWithBeforeExit()  
#
# Test a display array with ALL rows (100) and follow a straight exit display in the before display statement / like a none scroll
###################################################################### 
FUNCTION show3InactiveWithBeforeExit()   
	LET IspProg = 3
	CALL initArray(3)
	
	LET info = "Display ", trim(IspProg), " Rows and exit display array like a none scroll" 
	DISPLAY BY NAME info		
	LET info2 = "ATTRIBUTES (COUNT = ", trim(IspProg), ")"
	DISPLAY BY NAME info2	
	LET info3 = "BEFORE DISPLAY EXIT DISPLAY"
	DISPLAY BY NAME info3 
			
	DISPLAY ARRAY pProg TO sProg.*  
		ATTRIBUTES (COUNT = IspProg)	
		BEFORE DISPLAY
			DISPLAY ARR_COUNT() TO ARR_COUNT
			DISPLAY fgl_scr_size("sprog") TO fgl_scr_size  
			DISPLAY arr_curr() TO arr_curr 		
			EXIT DISPLAY
	END DISPLAY
         
END FUNCTION