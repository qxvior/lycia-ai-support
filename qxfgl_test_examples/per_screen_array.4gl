##################################################################################
# Module Variables
##################################################################################
DEFINE recFields1 RECORD
		f1 STRING ,f2 INTEGER,f3 FLOAT,f4 DATE,f5 VARCHAR(50),f6 STRING,f7 INTEGER,f8 FLOAT,f9 DATE,f10 VARCHAR(50)
	END RECORD
DEFINE recFields2 RECORD
		f1a STRING ,f2a INTEGER,f3a FLOAT,f4a DATE,f5a VARCHAR(50),f6a STRING,f7a INTEGER,f8a FLOAT,f9a DATE,f10a VARCHAR(50)
	END RECORD
DEFINE recFields3 RECORD
		f1b STRING ,f2b INTEGER,f3b FLOAT,f4b DATE,f5b VARCHAR(50),f6b STRING,f7b INTEGER,f8b FLOAT,f9b DATE,f10b VARCHAR(50)
	END RECORD

DEFINE recArray1 DYNAMIC ARRAY OF RECORD
		ar1_1 STRING, ar1_2 INTEGER, ar1_3 DATE, ar1_4 FLOAT, ar1_5 VARCHAR(50)
	END RECORD	
DEFINE recArray2 DYNAMIC ARRAY OF RECORD
		ar1_1a STRING, ar1_2a INTEGER, ar1_3a DATE, ar1_4a FLOAT, ar1_5a VARCHAR(50)
	END RECORD	
DEFINE recArray3 DYNAMIC ARRAY OF RECORD
		ar1_1b STRING, ar1_2b INTEGER, ar1_3b DATE, ar1_4b FLOAT, ar1_5b VARCHAR(50)
	END RECORD	


##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	CALL init_data()

  CALL ui.interface.frontcall("html5","scriptImport",["qx://application/scripts/pseudo_table_scroller.js"],[])
	
	OPEN WINDOW wScreenArray WITH FORM "per/per_screen_array"
	CALL ui.Interface.setText("PER screen array")
	MENU "PER_Screen_Array"
	
		COMMAND "DISPLAY"
			DISPLAY BY NAME recFields1.*
			DISPLAY BY NAME recFields2.*
			DISPLAY BY NAME recFields3.*					

			DIALOG
				DISPLAY ARRAY recArray1 TO scr1.*
				END DISPLAY
				
				DISPLAY ARRAY recArray2 TO scr2.*
				END DISPLAY	

				DISPLAY ARRAY recArray3 TO scr3.*
				END DISPLAY	
		
				ON ACTION "CANCEL"
					EXIT DIALOG
				
			END DIALOG

		COMMAND "INPUT"
			
			DIALOG
				INPUT BY NAME recFields1.* WITHOUT DEFAULTS
				END INPUT
		
				INPUT BY NAME recFields2.* WITHOUT DEFAULTS
				END INPUT
		
				INPUT BY NAME recFields3.* WITHOUT DEFAULTS
				END INPUT
				
				INPUT ARRAY recArray1 WITHOUT DEFAULTS FROM scr1.* 
				END INPUT
				
				INPUT ARRAY recArray2 WITHOUT DEFAULTS FROM scr2.* 
				END INPUT	

				INPUT ARRAY recArray3 WITHOUT DEFAULTS FROM scr3.* 
				END INPUT	
		
				ON ACTION "EXIT"
					EXIT DIALOG
				
			END DIALOG

		COMMAND "Exit"
			EXIT MENU
			
	END MENU

END MAIN


##################################################################################
# FUNCTION init_data()
#
#
##################################################################################
FUNCTION init_data()
	DEFINE i,rand SMALLINT
	DEFINE intdate INT
	DEFINE dmy DATE
	LET recFields1.f1 = "Hubert"
	LET recFields1.f2 = 12345678
	LET recFields1.f3 = 123456.123456
	LET recFields1.f4 = "12/12/2019"
	LET recFields1.f5 = "This is a longer story... a very long story"
	LET recFields1.f6 = "Hubert"
	LET recFields1.f7 = 12345678
	LET recFields1.f8 = 123456.123456
	LET recFields1.f9 = "12/12/2019"
	LET recFields1.f10 = "This is a longer story... a very long story"

	LET recFields2.f1a = "Hubert"
	LET recFields2.f2a = 12345678
	LET recFields2.f3a = 123456.123456
	LET recFields2.f4a = "12/12/2019"
	LET recFields2.f5a = "This is a longer story... a very long story"
	LET recFields2.f6a = "Hubert"
	LET recFields2.f7a = 12345678
	LET recFields2.f8a = 123456.123456
	LET recFields2.f9a = "12/12/2019"
	LET recFields2.f10a = "This is a longer story... a very long story"
	
	LET recFields3.f1b = "Hubert"
	LET recFields3.f2b = 12345678
	LET recFields3.f3b = 123456.123456
	LET recFields3.f4b = "12/12/2019"
	LET recFields3.f5b = "This is a longer story... a very long story"
	LET recFields3.f6b = "Hubert"
	LET recFields3.f7b = 12345678
	LET recFields3.f8b = 123456.123456
	LET recFields3.f9b = "12/12/2019"
	LET recFields3.f10b = "This is a longer story... a very long story"		

	LET dmy = "12/12/2019"
	LET intDate = dmy
	
	FOR i = 1 TO 500
		LET recArray1[i].ar1_1 = "Mike-" , i using("###")
		LET recArray2[i].ar1_1a = recArray1[i].ar1_1
		LET recArray3[i].ar1_1b = recArray1[i].ar1_1

		LET recArray1[i].ar1_2 = (1000*i) + (99*i) + (8*i) + i
		LET rand = fgl_random(0,2)

		IF rand = 1 THEN
			LET recArray1[i].ar1_2 = -1 * recArray1[i].ar1_2 --make it random negative  		
		END IF
		
		LET recArray2[i].ar1_2a = recArray1[i].ar1_2
		LET recArray3[i].ar1_2b = recArray1[i].ar1_2

		LET intDate = intDate +21
		LET recArray1[i].ar1_3 = intDate
		LET recArray2[i].ar1_3a = intDate
		LET recArray3[i].ar1_3b = intDate

		LET recArray1[i].ar1_4 = (1000*i) + (99*i) + (8*i) + i + (i/10) + (i/99)  + (i/999) 
		LET recArray2[i].ar1_4a = recArray1[i].ar1_4  
		LET recArray3[i].ar1_4b = recArray1[i].ar1_4  


		LET recArray1[i].ar1_5 = "Angela, Laura and Alex-" , i using("###")
		LET recArray2[i].ar1_5a = recArray1[i].ar1_5		
		LET recArray3[i].ar1_5b = recArray1[i].ar1_5		

	END FOR
		 
END FUNCTION