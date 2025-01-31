#########################################################################################################
# MAIN DDE Menu
#
# Modification History:
# 19.10.06 HH - V3 - Extracted from gd_guidemo.4gl
# 13.11.06 HH - V3 - Added dynamic toolbar support
#
#
# dde_demo()                               DDE Demo main menu                                   NONE
# dde_excel_demo()                         Loads a document from the server to Excel,           NONE
#                                          and transfers some data to it
#
#########################################################################################################      

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

#####################################################
# FUNCTION dde_demo()
#
#! DDE Demo main menu
#
# RETURN NONE
#####################################################
FUNCTION dde_demo(pChoice)
  DEFINE 
    inp_char CHAR,
    loopState BOOLEAN,
    pChoice SMALLINT

  CLEAR SCREEN
  CALL fgl_settitle("Querix Gui-Demo - DDE DEMO") 

	CASE pChoice  --which DDE demo to run
	
		WHEN 1
			CALL dde_excel_demo()			
		WHEN 2
			CALL dde_word_demo()	
          
		OTHERWISE  --display the toolbar buttons for the different DDE demos
			
          
			LET loopState = TRUE
			WHILE loopState = TRUE

				PROMPT "" FOR CHAR inp_char HELP 1
					BEFORE PROMPT
						CALL publish_toolbar("dde_main",0)    

					ON KEY(F401)  -- DDE Excel
						CALL dde_excel_demo()

					ON KEY(F402)  -- DDE Word
						CALL dde_word_demo()

					ON KEY(F11)
						LET loopState = FALSE

					AFTER PROMPT
						CALL publish_toolbar("dde_main",1)  

			END PROMPT

		END WHILE
		
	END CASE
	
	CALL fgl_settitle("Querix Gui-Demo V6") 

END FUNCTION


###############################################################################
# FUNCTION dde_excel_demo()
#
#! Loads a document from the server to Excel, and transfers some data to it
#
# RETURN NONE
###############################################################################
FUNCTION dde_excel_demo()
  DEFINE 
    doc_name           VARCHAR(100),
    doc_name_with_path VARCHAR(200),
    ret                CHAR(3)

  LET doc_name = "gd_document1.xls"

  #Start up excel using the document - file will be downloaded by the function
  LET doc_name_with_path = run_local_application_with_server_doc(get_document_path(doc_name))
 
  #Initialisee DDE environment inc. connection
  CALL init_dde("excel",doc_name,doc_name_with_path,NULL,FALSE)  --NULL=timeout read from settings (not overwritten)  TRUE/FALSE turns debug on/off

  #Set Excel to work with R1C1 format
  CALL dde_execute("[A1.R1C1(0)]",TRUE)  --True turns error checking/capturing on
  #CALL DDEExecute("Excel","System","[A1.R1C1(0)]") 

  #Transfer Data
  CALL dde_excel_transfer_data()
  #CALL dde_transfer_cell(5,3,"My String",0)  --example line... this function is called for each value to transfer

  #Optional Printing in Excel
  LET ret = fgl_winbutton("Print", "Do you want to print the MS-Excel Document?", "Yes", "Yes|No", "question", 1)
  
  IF ret = "Yes" THEN
    CALL dde_execute("[PRINT]",FALSE)   --FALSE turns error checking/capturing on
  END IF

  #Finnish/Close all DDE connections
  CALL DDEFinishAll()

END FUNCTION



###############################################################################
# FUNCTION dde_word_demo()
#
#! Loads a document from the server to Excel, and transfers some data to it
#
# RETURN NONE
###############################################################################
FUNCTION dde_word_demo()
  DEFINE 
    doc_name           VARCHAR(100),
    doc_name_with_path VARCHAR(200),
    ret                CHAR(3)

  LET doc_name = "gd_document1.doc"

###################################
# Note: Word is not Word - Different version and 'locations i.e. German MS-Word & US MS-Word
# can also show different behaviour in the DDE implementation
###################################

  #Start up Word using the document - file will be downloaded by the function
  LET doc_name_with_path = run_local_application_with_server_doc(get_document_path(doc_name))

  
  #LET doc_name = "gd_document1"

  #Initialisee DDE environment inc. connection
  CALL init_dde("winword",doc_name,doc_name_with_path,10,FALSE)  --10=timeout  TRUE/FALSE turns debug on/off

  #Transfer Data
  CALL dde_word_transfer_data()

  #Save the document to be sure it works
  CALL dde_execute("[FileSave]",FALSE)

  #Optional Printing in Excel
  LET ret = fgl_winbutton("Print", "Do you want to print the MS-Word Document?", "Yes", "Yes|No", "question", 1)
  
  IF ret = "Yes" THEN
    CALL dde_execute("[FilePrintDefault]",FALSE)   --FALSE turns error checking/capturing on
  END IF

  #Finnish/Close all DDE connections
  CALL DDEFinishAll()

END FUNCTION





#########################################################################################################
#! FUNCTION dde_excel_transfer_data()
######################################################################################################### 
FUNCTION dde_excel_transfer_data()
  DEFINE 
    td ARRAY[12] OF RECORD
      ddeRow SMALLINT,
      col SMALLINT,
      data VARCHAR(100),
      font SMALLINT
    END RECORD,
    i SMALLINT

  #Set Excel to work with R1C1 format:
  CALL DDEExecute("Excel","System","[A1.R1C1(0)]") 

  LET td[1].ddeRow = 10
  LET td[1].col = 3
  LET td[1].data = get_strm(30) || " - " || get_str(516)
  LET td[1].font = 1

  LET td[2].ddeRow = 11
  LET td[2].col = 3
  LET td[2].data = get_str(201)  --"Customer ID:"
  LET td[2].font = 2

  LET td[3].ddeRow = 11
  LET td[3].col = 4
  LET td[3].data = cust_rec[1].cust_id
  LET td[3].font = 3

  LET td[4].ddeRow = 12
  LET td[4].col = 3
  LET td[4].data = get_str(202)  --"Title:"
  LET td[4].font = 2

  LET td[5].ddeRow = 12
  LET td[5].col = 4
  LET td[5].data = cust_rec[1].cust_title
  LET td[5].font = 3

  LET td[6].ddeRow = 13
  LET td[6].col = 3
  LET td[6].data = get_str(203)  --"First Name:"
  LET td[6].font = 2

  LET td[7].ddeRow = 13
  LET td[7].col = 4
  LET td[7].data = cust_rec[1].cust_fname
  LET td[7].font = 3

  LET td[8].ddeRow = 14
  LET td[8].col = 3
  LET td[8].data = get_str(204)  --"Last Name:"
  LET td[8].font = 2

  LET td[9].ddeRow = 14
  LET td[9].col = 4
  LET td[9].data = cust_rec[1].cust_lname
  LET td[9].font = 3


  LET td[10].ddeRow = 15
  LET td[10].col = 3
  LET td[10].data = get_str(205)  --"Country:"
  LET td[10].font = 2

  LET td[11].ddeRow = 15
  LET td[11].col = 4
  LET td[11].data = cust_rec[1].cust_country
  LET td[11].font = 3

  LET td[12].ddeRow = 16
  LET td[12].col = 3
  LET td[12].data = get_str(517)--"Thank You for using this Small DDE example"
  LET td[12].font = 4


  FOR i = 1 TO 12 
    CALL dde_transfer_excel_cell(td[i].ddeRow,td[i].col,td[i].data,td[i].font)

    #CALL dde_transfer_cell(td[i].row,td[i].col,td[i].data,td[i].font)
    #IF dde_settings.f_dde_return = 0 THEN
    #  EXIT FOR
    #END IF
  END FOR

  #RETURN dde_error_check("Transfer Data")

END FUNCTION


#################################################################################
# FUNCTION dde_word_transfer_data()
#
#! Transfer data to MS-Word via DDE
#
# RETURN NONE
#################################################################################
FUNCTION dde_word_transfer_data()
  CALL dde_transfer_bookmark("title",cust_rec[1].cust_title)
  CALL dde_transfer_bookmark("firstname",cust_rec[1].cust_fname)
  CALL dde_transfer_bookmark("lastname",cust_rec[1].cust_lname)
  CALL dde_transfer_bookmark("country",cust_rec[1].cust_country)
  CALL dde_transfer_bookmark("dear",cust_rec[1].cust_fname)

END FUNCTION

