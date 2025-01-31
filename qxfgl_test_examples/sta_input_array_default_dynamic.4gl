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

DEFINE modu_arr_rec_contact DYNAMIC ARRAY OF t_contactRecord
DEFINE modu_rpt_log STRING


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE l_arr_curr INTEGER
	DEFINE l_scr_line	INTEGER
	DEFINE l_count SMALLINT
	DEFINE l_select_idx SMALLINT
	DEFINE l_msg STRING
	DEFINE l_choice CHAR
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	DEFER INTERRUPT   
		
	CALL ui_init()

	CALL hideNavigation()
	   
	OPEN WINDOW wMain WITH FORM "form/sta_input_array_default_dynamic"
	CALL ui.Interface.setText("INPUT ARRAY Default (Dynamic Array)")
  
  #INPUT ARRAY which does NOT allow to append any rows
	#for demo purpose, we did it "double"
	#MAXCOUNT and  APPEND ROW = 0
	INPUT ARRAY modu_arr_rec_contact WITHOUT DEFAULTS FROM sArr.* ATTRIBUTES(UNBUFFERED)
		BEFORE INPUT
			LET l_msg = "BEFORE INPUT"
			CALL displayInformation(l_msg)
			LET l_msg = "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength() 
			CALL displayInformation(l_msg)

			CALL fgl_dialog_setkeylabel("INSERT",								"Insert Row",						"{CONTEXT}/public/querix/icon/svg/24/ic_add_insert_24px.svg",						109,FALSE,"Insert Row",								"top")
			CALL fgl_dialog_setkeylabel("APPEND",								"Append Row",						"{CONTEXT}/public/querix/icon/svg/24/ic_add_append_24px.svg",						110,FALSE,"Append Row",								"top")			
			CALL fgl_dialog_setkeylabel("INIT",									"Init Variables",				"{CONTEXT}/public/querix/icon/svg/24/ic_init1_24px.svg",								111,FALSE,"Initialze variables",			"top")
			CALL fgl_dialog_setkeylabel("DELETE ARRAY",					"Delete Array",  				"{CONTEXT}/public/querix/icon/svg/24/ic_delete_sweep_24px.svg",					112,FALSE,"Delete Array",							"top")
			CALL fgl_dialog_setkeylabel("DELETE ARRAY ELEMENT",	"Delete Array Element",	"{CONTEXT}/public/querix/icon/svg/24/ic_delete_array_element_24px.svg",	113,FALSE,"Delete Array Element",			"top")
			CALL fgl_dialog_setkeylabel("NAVIGATE ROW",					"Navigate Row",					"{CONTEXT}/public/querix/icon/svg/24/ic_navigation_outline_1_24px.svg",	114,FALSE,"Navigate Row",							"top")
			CALL fgl_dialog_setkeylabel("CLEAR LOG",						"Clear Log",						"{CONTEXT}/public/querix/icon/svg/24/ic_log_clear_24px.svg",						115,FALSE,"Clear the log file",				"top")
			CALL fgl_dialog_setkeylabel("INFO",									"Info",									"{CONTEXT}/public/querix/icon/svg/24/ic_info_24px.svg",									116,FALSE,"Information on this demo",	"top")
			
		BEFORE ROW
			LET l_msg =  "BEFORE ROW arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
			CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg) 
			LET l_arr_curr = arr_curr()
			LET l_scr_line = scr_line()

		AFTER ROW
			LET l_msg =  "AFTER ROW arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
			CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg)  	

			IF modu_arr_rec_contact[l_arr_curr].contId = 0 OR modu_arr_rec_contact[l_arr_curr].contId IS NULL THEN
			
				IF modu_arr_rec_contact[l_arr_curr].firstName IS NULL AND
					modu_arr_rec_contact[l_arr_curr].lastName IS NULL AND
					modu_arr_rec_contact[l_arr_curr].address1 IS NULL AND
					modu_arr_rec_contact[l_arr_curr].address2 IS NULL AND
					modu_arr_rec_contact[l_arr_curr].address3 IS NULL AND
					modu_arr_rec_contact[l_arr_curr].city IS NULL AND
					modu_arr_rec_contact[l_arr_curr].postCode IS NULL THEN  
{
					LET l_choice = fgl_winbutton("Row doesDelete ALL hashMap buckets?","Do you want to delete all HashMap buckets/data?","No","Yes|No","question")
					IF l_choice = "Y"	THEN    	
		      	CALL l_hm1.clear()
		      END IF	      


}
					ERROR "Field Contact ID can not be empty or 0"
					CONTINUE INPUT #NEXT FIELD contId
				END IF
			END IF

			
		BEFORE INSERT  
  		LET l_msg =  "BEFORE INSERT arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
  		CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg)
			  		        
		AFTER INSERT  
  		LET l_msg =  "AFTER INSERT arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
  		CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg)  		        

		BEFORE DELETE
			LET l_msg =  "BEFORE DELETE arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
			CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg)  	

		AFTER DELETE
			LET l_msg =  "AFTER DELETE arr_curr()=", trim(arr_curr()), " scr_line()= ", trim(scr_line())
			CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg)  	
			
		ON ACTION "INIT" #init array with some demo data
  		CALL init_data()
  	
  	ON ACTION "DELETE ARRAY"
  		CALL modu_arr_rec_contact.clear()

  	ON ACTION "DELETE ARRAY ELEMENT"
  		LET l_count = modu_arr_rec_contact.getSize()
  		LET l_select_idx = 1
  		LET l_msg = "Your record array has got ", trim(l_count), " rows. Which row do you want to delete (1-", trim(l_count), ")?"
  		
  		WHILE TRUE
  			LET l_select_idx = fgl_winprompt(1,1,l_msg,1,2,0) 

  			IF 
	  			(modu_arr_rec_contact.getSize() > 0) AND
	  			(l_select_idx > 0) AND  			  
	  			(l_select_idx <= modu_arr_rec_contact.getSize()) AND 
	  			(int_flag = FALSE) THEN  
		
	  			CALL modu_arr_rec_contact.delete(l_select_idx)
					EXIT WHILE
				ELSE
					ERROR "Invalid Row Index to delete the array row"
				END IF
									  		
	  	END WHILE

		ON ACTION "Navigate Row"
  		LET l_count = modu_arr_rec_contact.getSize()
  		LET l_select_idx = 1
  		LET l_msg = "Your cursor is currently in row ", trim(arr_curr()), " and your record array has got ", trim(l_count), " rows. To which row do you want to navigate (1-", trim(l_count), ")?"
  		
  		WHILE TRUE
  			LET l_select_idx = fgl_winprompt(1,1,l_msg,1,2,0) 

  			IF 
	  			(modu_arr_rec_contact.getSize() > 0) AND
	  			(l_select_idx > 0) AND  			  
	  			(l_select_idx <= modu_arr_rec_contact.getSize()) AND 
	  			(int_flag = FALSE) THEN  
		
	  			CALL fgl_dialog_setcurrline(1,l_select_idx)
					EXIT WHILE
				ELSE
					ERROR "Invalid Row Index to navigate to..."
				END IF
									  		
	  	END WHILE		

		ON ACTION "CLEAR LOG"
			LET modu_rpt_log = NULL
			DISPLAY modu_rpt_log TO fActionReport

		ON ACTION "INFO"
			CALL info()		

		BEFORE FIELD contId
			LET l_msg =   "BEFORE FIELD contId"
			CALL displayInformation(l_msg)

		AFTER FIELD contId
			LET l_msg =   "AFTER FIELD contId"
			CALL displayInformation(l_msg)
		

		BEFORE FIELD firstName
			LET l_msg =   "BEFORE FIELD firstName"
			CALL displayInformation(l_msg)

		AFTER FIELD firstName
			LET l_msg =   "AFTER FIELD firstName"
			CALL displayInformation(l_msg)
			IF modu_arr_rec_contact[l_arr_curr].firstName IS NULL THEN
				ERROR "Field Contact First Name can not be empty"
				NEXT FIELD firstName
			END IF
			 			
		AFTER INPUT
			LET l_msg =  "AFTER INPUT"

			CALL displayInformation(l_msg)
			LET l_msg =  "modu_arr_rec_contact.getLength()=", modu_arr_rec_contact.getLength()
			CALL displayInformation(l_msg) 
			  		        
	END INPUT
   
   CLOSE WINDOW wMain
 END MAIN 
##################################################################################
# END MAIN
##################################################################################


##################################################################################
# FUNCTION init_data()
#
#
################################################################################## 
FUNCTION init_data()

	LET modu_arr_rec_contact[1].*  = 1, "Mike","Johnson","3rd Floor","MegaBuilding","Cross Street 12","Chicago", "SO2 PX2" 
	LET modu_arr_rec_contact[2].*  = 2, "John","Hust","Ghost Avenue","Black House","Other Street 64","Rome", "RO2 IX3"
	LET modu_arr_rec_contact[3].*  = 3, "Sue","Green","Green Lane","Alianz Arena","Some Place 22","Munich", "BM2 FF7"
	LET modu_arr_rec_contact[4].*  = 4, "George","Swift","Red Square","Eclipse","Nowhere 5","London", "LO0 QA1"
	LET modu_arr_rec_contact[5].*  = 5, "Steve","Cool","Freedom Place","Upper Floor","Enerprise","Hamburg", "HH2 FF7"
	LET modu_arr_rec_contact[6].*  = 6, "Peter","Donson","Natur Park","Fun Destination","Red Square","Moskau", "MO3 FF9"
	LET modu_arr_rec_contact[7].*  = 7, "Dominic","Smith","London Avenue","History","Shark Beach","Cape Town", "CA2 AY5"
	LET modu_arr_rec_contact[8].*  = 8, "Victor","Darby","Partk Street","Secret Place","Party Mile","Barcelona", "BA3 PX9"
	LET modu_arr_rec_contact[9].*  = 9, "Alex","Black","Snow Drive","Lost in Space","Football Lane","Madrid", "MA2 ZF5"
	LET modu_arr_rec_contact[10].* = 10,"Sergey","Happy","Sunny Place","Bad Translation","Old Trafford","Manchester", "M12 FF0"	
					
 END FUNCTION
##################################################################################
# FUNCTION init_data()
##################################################################################


##################################################################################
# FUNCTION displayInformation(fNewLine)
#
#
##################################################################################     
FUNCTION displayInformation(fNewLine)
 	DEFINE fNewLine  STRING

 	LET modu_rpt_log = modu_rpt_log, "\n", fNewLine

 	DISPLAY modu_rpt_log TO fActionReport
 	CALL ui.interface.refresh()
 	
END FUNCTION
##################################################################################
# FUNCTION displayInformation(fNewLine)
##################################################################################


##################################################################################
# FUNCTION info()
#
#
##################################################################################
FUNCTION info()
	DEFINE l_msg STRING
	LET l_msg = l_msg, "array.getLength()=", trim(modu_arr_rec_contact.getLength()), "\n"
	LET l_msg = l_msg, "arr_curr()=", trim(arr_curr()), "\n"
	LET l_msg = l_msg, "scr_line()=", trim(scr_line()), "\n"
		
	CALL fgl_winmessage("Info",l_msg, "INFO")

END FUNCTION
##################################################################################
# END FUNCTION info()
##################################################################################