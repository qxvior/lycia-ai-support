##################################################################################
# Module Scope Variables
##################################################################################	
DEFINE myRec RECORD
	f0,f1,f2,f3,f4,f5 VARCHAR(200),
	f6,f7,f8,f9,f10,fs SMALLINT,
	d1 DATE,
	t1 DATETIME HOUR TO SECOND,
	memo1 VARCHAR(200)	

	END RECORD

DEFINE eolRec RECORD
	m01,m02,m03,m04,m05,m06,m07,m08,m09,m10,m11,m12,m13,m14,m15,m16,m17,m18,m19,m20,m21,m22,m23,m24 CHAR(2),
	measure1,measure2 VARCHAR(40)  
	END RECORD

##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE where_text CHAR(1000)
	CALL ui_init()	
	OPEN WINDOW perWin WITH FORM "form/per_widget_translation"
	CALL ui.Interface.setText("PER INCLUDE")
	
	CALL initData()
	
	MENU "PER"
		COMMAND "DISPLAY"
			DISPLAY BY NAME myRec.*
			
		COMMAND "Edit"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS

		COMMAND "CLEAR FORM"
			CLEAR FORM			  
			
  	COMMAND "CANCEL" "Exit Menu"
  		EXIT MENU
  END MENU

END MAIN


##################################################################################
# FUNCTION initData()
#
#
##################################################################################	
FUNCTION initData()

	LET myRec.f0 = "Yes"
	LET myRec.f1 = "Yes"
	LET myRec.f2 = "John"
	LET myRec.f3 = "G"
	LET myRec.f4 = "X"
	LET myRec.f5 = "BB"
	LET myRec.f6 = 1 
	LET myRec.f7 = 1		
	LET myRec.f8 = 25		
	LET myRec.f9 = 75
	LET myRec.f10 = 85
	LET myRec.fs = 5

	LET myRec.t1 = DATETIME(12:30:59) HOUR TO SECOND
  LET myRec.d1 = DATE(12/12/2017)
	
	LET eolRec.m01 = "01"
	LET eolRec.m02 = "02"
	LET eolRec.m03 = "03"
	LET eolRec.m04 = "04"
	LET eolRec.m05 = "05"
	LET eolRec.m06 = "06"
	LET eolRec.m07 = "07"
	LET eolRec.m08 = "08"
	LET eolRec.m09 = "09"
	LET eolRec.m10 = "10"
	LET eolRec.m11 = "11"
	LET eolRec.m12 = "12"
	LET eolRec.m13 = "13"
	LET eolRec.m14 = "14"
	LET eolRec.m15 = "15"
	LET eolRec.m16 = "16"
	LET eolRec.m17 = "17"
	LET eolRec.m18 = "18"
	LET eolRec.m19 = "19"
	LET eolRec.m20 = "20"
	LET eolRec.m21 = "21"
	LET eolRec.m22 = "22"
	LET eolRec.m23 = "23"
	LET eolRec.m24 = "24"
	LET eolRec.m24 = "25"
	
	LET eolRec.measure1 = "To compare/measure field width"
	LET eolRec.measure2 = "To compare/measure field width"
	DISPLAY BY NAME eolRec.*
END FUNCTION