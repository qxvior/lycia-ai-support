##################################################################################
# Module Scope
##################################################################################
  DEFINE t_contactRecord TYPE AS
    RECORD 
			contId 			INT,
			firstName	STRING,
			lastName	STRING,
			address1	STRING,
			address2	STRING,
			address3	STRING,
			city			STRING,
			postCode	STRING			
	   END RECORD


DEFINE	cntRecArr DYNAMIC ARRAY OF t_contactRecord
DEFINE    cntRec t_contactRecord
DEFINE fActionReport, tempString STRING


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
   
	CALL ui_init()
	CALL fMain()
END MAIN


##################################################################################
# FUNCTION fMain()
#
#
##################################################################################
FUNCTION fMain()
DEFINE  
   lDummy     INTEGER,
   lArrCurr   INTEGER,
   lScrLine	  INTEGER

   CALL fInitArr()
   
   OPEN WINDOW wMain
      WITH FORM "form/sta_dialog_display_array_input"

	CALL ui.Interface.setText("DIALOG DA/I")

   LET fActionReport = "Log file for dialog display array / input Example"
   DISPLAY BY NAME fActionReport

	#DIALOG BEGINN ###########################################################################################	
   DIALOG ATTRIBUTES (UNBUFFERED)
   
   		#---------------- Display Array ---------------------#
      DISPLAY ARRAY cntRecArr TO sArr.*
         ATTRIBUTES(COUNT = cntRecArr.GetLength())
         BEFORE ROW
            LET lArrCurr = ARR_CURR()
            LET lScrLine = SCR_LINE()
            LET cntRec.* = cntRecArr[lArrcurr].*
						DISPLAY fgl_lastkey() TO fgl_lastkey
						DISPLAY fgl_keyname(fgl_lastkey()) TO fgl_keyname            
       END DISPLAY


   		#---------------- INPUT Record ---------------------#      
      INPUT cntRec.* WITHOUT DEFAULTS FROM xRec.* 

      END INPUT
      
   		#---------------- INPUT lineNumber for Row Navigation ---------------------#        
      INPUT BY NAME lArrCurr  WITHOUT DEFAULTS
      	ON CHANGE lArrCurr
      		CALL DIALOG.SetCurrentRow("sArr", lArrCurr)
         LET tempString = "DIALOG.SetCurrentRow(\"sArr\",",  trim(lArrCurr), ")"
         CALL displayInformation(tempString)      		
      		
      END INPUT
   		#---------------- INPUT REPORT field ---------------------#  
      INPUT BY NAME fActionReport WITHOUT DEFAULTS
      END INPUT
      
   		#---------------- DIALOG Instructions ---------------------#        

			
		ON ACTION "actAccept"
			CALL displayInformation("Simulation: Now save changes to database")
			LET cntRecArr[lArrCurr].* = cntRec.*
			CALL ui.Interface.refresh()
                  
		ON ACTION "DELETE"
     	CALL cntRecArr.delete(lArrCurr)
			LET tempString = "cntRecArr.delete(", trim(lArrCurr), ")"
			CALL displayInformation(tempString)
			IF lScrLIne > cntRecArr.GetLength() THEN
				LET lScrLine = lScrLine - 1
			END IF
			CALL DIALOG.SetCurrentRow("sArr", lArrCurr)
			LET tempString = "DIALOG.SetCurrentRow(\"sArr\",",  trim(lArrCurr), ")"
			CALL displayInformation(tempString)

                  
		ON ACTION "INSERT"
			CALL cntRecArr.insert(lArrCurr,[0,"New I First Name","New I last name","New I Addr1","New I Addr2","New I Addr3","New I City", "New I Post Code"])
			LET tempString = "cntRecArr.insert", trim(lArrCurr), ",[0,\"New I First Name\",\"New I last name\",\"New I Addr1\",\"New I Addr2\",\"New I Addr3\",\"New I City\", \"New I Post Code\"])"
			CALL displayInformation(tempString)
			CALL DIALOG.SetCurrentRow("sArr", lArrCurr)
			LET tempString = "DIALOG.SetCurrentRow(\"sArr\",",  trim(lArrCurr), ")"
			CALL displayInformation(tempString)
                  
		ON ACTION "APPEND"
			CALL cntRecArr.append([999,"New A First Name","New A last name","New A Addr1","New A Addr2","New A Addr3","New A City", "New A Post Code"])       	
			LET tempString = "cntRecArr.append([999,\"New A First Name\",\"New A last name\",\"New A Addr1\",\"New A Addr2\",\"New A Addr3\",\"New A City\", \"New A Post Code\"])"
			CALL displayInformation(tempString)
			        	
			LET lArrCurr = cntRecArr.GetLength()
#         CALL DIALOG.SetCurrentRow("sArr", cntRecArr.GetLength())
			CALL fgl_SetCurrLine(fgl_Scr_Size("sArr"), lArrCurr)
			LET tempString = "fgl_SetCurrLine(, fgl_Scr_Size(\"sArr\"),", trim(lArrCurr), ")"
			CALL displayInformation(tempString)
			CALL ui.Interface.refresh()

		AFTER DIALOG #The dialog terminates when an ACCEPT DIALOG or EXIT DIALOG control instruction is executed. The AFTER DIALOG block is not executed if an EXIT DIALOG is performed.
			IF FIELD_TOUCHED( * ) THEN
				CALL fgl_winmessage("FIELD_TOUCHED(*)", "Data have been changed... Continue DIALOG AND choose Save your data or continue", "info")
				CONTINUE DIALOG
			ELSE
				CALL fgl_winmessage("Exit", "Exit Dialog - no data were changed,, just exit", "info")
			END IF

    ON ACTION "ACCEPT"
         CALL displayInformation("D-Accept: Now save changes to database because of ACCEPT")
         LET cntRecArr[lArrCurr].* = cntRec.*
         CALL ui.Interface.refresh()
         
		ON ACTION "Exit"
			ACCEPT DIALOG


	END DIALOG
	#DIALOG END ###########################################################################################
	CALL fgl_winmessage("End", "xxxxx", "info")
   
   CLOSE WINDOW wMain
 END FUNCTiON 

##################################################################################
# FUNCTION fInitArr()
#
#
################################################################################## 
FUNCTION fInitArr()

	LET cntRecArr[1].*  = 1, "Mike","Johnson","3rd Floor","MegaBuilding","Cross Street 12","Chicago", "SO2 PX2" 
	LET cntRecArr[2].*  = 2, "John","Hust","Ghost Avenue","Black House","Other Street 64","Rome", "RO2 IX3"
	LET cntRecArr[3].*  = 3, "Sue","Green","Green Lane","Alianz Arena","Some Place 22","Munich", "BM2 FF7"
	LET cntRecArr[4].*  = 4, "George","Swift","Red Square","Eclipse","Nowhere 5","London", "LO0 QA1"
	LET cntRecArr[5].*  = 5, "Steve","Cool","Freedom Place","Upper Floor","Enerprise","Hamburg", "HH2 FF7"
	LET cntRecArr[6].*  = 6, "Peter","Donson","Natur Park","Fun Destination","Red Square","Moskau", "MO3 FF9"
	LET cntRecArr[7].*  = 7, "Dominic","Smith","London Avenue","History","Shark Beach","Cape Town", "CA2 AY5"
	LET cntRecArr[8].*  = 8, "Victor","Darby","Partk Street","Secret Place","Party Mile","Barcelona", "BA3 PX9"
	LET cntRecArr[9].*  = 9, "Alex","Black","Snow Drive","Lost in Space","Football Lane","Madrid", "MA2 ZF5"
	LET cntRecArr[10].* = 10,"Sergey","Happy","Sunny Place","Bad Translation","Old Trafford","Manchester", "M12 FF0"	
					
 END FUNCTION


##################################################################################
# FUNCTION displayInformation(fNewLine)
#
#
##################################################################################     
FUNCTION displayInformation(fNewLine)
 	DEFINE fNewLine  STRING
 	LET fActionReport = fActionReport, "\n", fNewLine
 	DISPLAY BY NAME fActionReport
 	CALL ui.interface.refresh()
END FUNCTION            



FUNCTION menu_style_popup()
	MENU ATTRIBUTE(STYLE="POPUP")
		ON ACTION "New"
			CALL fgl_winmessage("New","You have choosen 'New' ",  "INFO")
		ON ACTION "Edit"
			CALL fgl_winmessage("New","You have choosen 'Edit' ",  "INFO")
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
END FUNCTION