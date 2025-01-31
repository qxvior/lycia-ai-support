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


DEFINE cntRecArr_1 DYNAMIC ARRAY OF t_contactRecord
DEFINE cntRecArr_2 DYNAMIC ARRAY OF t_contactRecord
DEFINE cntRecArr_3 DYNAMIC ARRAY OF t_contactRecord
DEFINE cntRecArr_4 DYNAMIC ARRAY OF t_contactRecord

DEFINE fActionReport, tempString STRING


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE  
		lDummy     INTEGER,
		lArrCurr   INTEGER,
		lScrLine	  INTEGER

	CALL ui_init()
   
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
   
	CALL init_data()
	CALL hideNavigation()
	   
	OPEN WINDOW wMain WITH FORM "form/cnt_tab_table_dialog"
	CALL ui.Interface.setText("Tab-Table Dialog")

	DIALOG ATTRIBUTE(UNBUFFERED)
	  #INPUT ARRAY which does NOT allow to append any rows
		#for demo purpose, we did it "double"
		#MAXCOUNT and  APPEND ROW = 0
		INPUT ARRAY cntRecArr_1 WITHOUT DEFAULTS FROM sArr_1.*
			ATTRIBUTES(MAXCOUNT = cntRecArr_1.GetLength(), APPEND ROW = 0, INSERT ROW = 0, DELETE ROW = 0)
			BEFORE ROW
				LET lArrCurr = ARR_CURR()
				LET lScrLine = SCR_LINE()
		END INPUT
	
		INPUT ARRAY cntRecArr_2 WITHOUT DEFAULTS FROM sArr_2.*
			ATTRIBUTES(MAXCOUNT = cntRecArr_1.GetLength(), APPEND ROW = 0, INSERT ROW = 0, DELETE ROW = 0)
			BEFORE ROW
				LET lArrCurr = ARR_CURR()
				LET lScrLine = SCR_LINE()
		END INPUT

		INPUT ARRAY cntRecArr_3 WITHOUT DEFAULTS FROM sArr_3.*
			ATTRIBUTES(MAXCOUNT = cntRecArr_1.GetLength(), APPEND ROW = 0, INSERT ROW = 0, DELETE ROW = 0)
			BEFORE ROW
				LET lArrCurr = ARR_CURR()
				LET lScrLine = SCR_LINE()
		END INPUT

		INPUT ARRAY cntRecArr_4 WITHOUT DEFAULTS FROM sArr_4.*
			ATTRIBUTES(MAXCOUNT = cntRecArr_1.GetLength(), APPEND ROW = 0, INSERT ROW = 0, DELETE ROW = 0)
			BEFORE ROW
				LET lArrCurr = ARR_CURR()
				LET lScrLine = SCR_LINE()
		END INPUT	   
   
   		ON ACTION "Change Row 5"
			LET cntRecArr_1[5].*  = 5, "AAAAA","AAAAA","AAAAA","AAAAA","AAAAA","AAAAA", "AAAAA"
			LET cntRecArr_2[5].*  = 5, "AAAAA","AAAAA","AAAAA","AAAAA","AAAAA","AAAAA", "AAAAA"
			LET cntRecArr_3[5].*  = 5, "AAAAA","AAAAA","AAAAA","AAAAA","AAAAA","AAAAA", "AAAAA"
			LET cntRecArr_4[5].*  = 5, "AAAAA","AAAAA","AAAAA","AAAAA","AAAAA","AAAAA", "AAAAA"				   		
		ON ACTION "CANCEL"
			EXIT DIALOG
	END DIALOG
		   
	CLOSE WINDOW wMain
END MAIN 

##################################################################################
# FUNCTION init_data()
#
#
################################################################################## 
FUNCTION init_data()
	DEFINE i INT
	
	LET cntRecArr_1[1].*  = 1, "Mike","Johnson","3rd Floor","MegaBuilding","Cross Street 12","Chicago", "SO2 PX2" 
	LET cntRecArr_1[2].*  = 2, "John","Hust","Ghost Avenue","Black House","Other Street 64","Rome", "RO2 IX3"
	LET cntRecArr_1[3].*  = 3, "Sue","Green","Green Lane","Alianz Arena","Some Place 22","Munich", "BM2 FF7"
	LET cntRecArr_1[4].*  = 4, "George","Swift","Red Square","Eclipse","Nowhere 5","London", "LO0 QA1"
	LET cntRecArr_1[5].*  = 5, "Steve","Cool","Freedom Place","Upper Floor","Enerprise","Hamburg", "HH2 FF7"
	LET cntRecArr_1[6].*  = 6, "Peter","Donson","Natur Park","Fun Destination","Red Square","Moskau", "MO3 FF9"
	LET cntRecArr_1[7].*  = 7, "Dominic","Smith","London Avenue","History","Shark Beach","Cape Town", "CA2 AY5"
	LET cntRecArr_1[8].*  = 8, "Victor","Darby","Partk Street","Secret Place","Party Mile","Barcelona", "BA3 PX9"
	LET cntRecArr_1[9].*  = 9, "Alex","Black","Snow Drive","Lost in Space","Football Lane","Madrid", "MA2 ZF5"
	LET cntRecArr_1[10].* = 10,"Sergey","Happy","Sunny Place","Bad Translation","Old Trafford","Manchester", "M12 FF0"	
	
	FOR i = 1 TO cntRecArr_1.GetLength()
		LET cntRecArr_2[i].*  = cntRecArr_1[i].*
		LET cntRecArr_3[i].*  = cntRecArr_1[i].*
		LET cntRecArr_4[i].*  = cntRecArr_1[i].*
	END FOR
					
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