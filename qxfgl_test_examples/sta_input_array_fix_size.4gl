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


DEFINE cntRecArr DYNAMIC ARRAY OF t_contactRecord
DEFINE cntRec t_contactRecord
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
	   
	OPEN WINDOW wMain WITH FORM "form/sta_input_array_fix_size"
	CALL ui.Interface.setText("INPUT ARRAY Fix Size")
  
  #INPUT ARRAY which does NOT allow to append any rows
	#for demo purpose, we did it "double"
	#MAXCOUNT and  APPEND ROW = 0
  INPUT ARRAY cntRecArr WITHOUT DEFAULTS FROM sArr.*
     ATTRIBUTES(MAXCOUNT = cntRecArr.GetLength(), APPEND ROW = 0, INSERT ROW = 0, DELETE ROW = 0)
     BEFORE ROW
        LET lArrCurr = ARR_CURR()
        LET lScrLine = SCR_LINE()
        LET cntRec.* = cntRecArr[lArrcurr].*
   END INPUT
   
   CLOSE WINDOW wMain
 END MAIN 

##################################################################################
# FUNCTION init_data()
#
#
################################################################################## 
FUNCTION init_data()

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