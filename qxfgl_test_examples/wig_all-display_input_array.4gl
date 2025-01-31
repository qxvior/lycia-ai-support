DEFINE t_rec TYPE AS
	RECORD
	f1 STRING,
	f2 STRING,
	f3 SMALLINT,
	f4 SMALLINT,
	f5 STRING,
	f6 SMALLINT,
	f7 DATE,
	f8 Datetime Hour to Second,
	f9 SMALLINT,
	f10 SMALLINT,
	f11 SMALLINT, 
	f12 SMALLINT,
	f13 STRING,
	f14 STRING	
	END RECORD

	DEFINE myRec DYNAMIC ARRAY OF t_rec	


##################################################################################
# MAIN
#
#
##################################################################################		
MAIN
	CALL ui_init()
	
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL initData()

	OPEN WINDOW wMixedWidgetClassicArray WITH FORM "form/wig_all-display_input_array"
	CALL ui.Interface.setText("Widg Array")
		
	MENU
		ON ACTION "DISPLAY"
			DISPLAY ARRAY myRec TO scr.*
			END DISPLAY
		ON ACTION "INPUT"
			INPUT ARRAY myRec WITHOUT DEFAULTS FROM scr.*
			END INPUT
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
	
END MAIN	



FUNCTION initData()
	DEFINE i SMALLINT
	LET i = 1
	
	LET myRec[i].f1 = "1-Label-1"
	LET myRec[i].f2 = "1-TextField-1"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "1-FunctionField-1"
	LET myRec[i].f6 = 1
	LET myRec[i].f7 = DATE ("01/01/2021")
	LET myRec[i].f8 = "01:01:01"		
	LET myRec[i].f9 = 0
	LET myRec[i].f10 = 0
	LET myRec[i].f11 = 1
	LET myRec[i].f12 = 1
	LET myRec[i].f13 = "1-TextArea Memo with text and more text and more text-1"
	LET myRec[i].f14 = "1-Label-1"

	LET i = i+1	
	LET myRec[i].f1 = "2-Label-2"
	LET myRec[i].f2 = "2-TextField-2"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "2-FunctionField-2"
	LET myRec[i].f6 = 2
	LET myRec[i].f7 = DATE ("02/02/2022")
	LET myRec[i].f8 = "02:02:02"		
	LET myRec[i].f9 = 1
	LET myRec[i].f10 = 1
	LET myRec[i].f11 = 2
	LET myRec[i].f12 = 2
	LET myRec[i].f13 = "2-TextArea Memo with text and more text and more text-2"
	LET myRec[i].f14 = "2-Label-2"

	LET i = i+1	
	LET myRec[i].f1 = "3-Label-3"
	LET myRec[i].f2 = "3-TextField-3"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "3-FunctionField-3"
	LET myRec[i].f6 = 3
	LET myRec[i].f7 = DATE ("03/03/2023")
	LET myRec[i].f8 = "03:03:03"		
	LET myRec[i].f9 = 2
	LET myRec[i].f10 = 2
	LET myRec[i].f11 = 3
	LET myRec[i].f12 = 3
	LET myRec[i].f13 = "3-TextArea Memo with text and more text and more text-3"
	LET myRec[i].f14 = "3-Label-3"


	LET i = i+1	
	LET myRec[i].f1 = "4-Label-4"
	LET myRec[i].f2 = "4-TextField-4"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "4-FunctionField-4"
	LET myRec[i].f6 = 4
	LET myRec[i].f7 = DATE ("04/04/2024")
	LET myRec[i].f8 = "04:04:04"		
	LET myRec[i].f9 = 0
	LET myRec[i].f10 = 0
	LET myRec[i].f11 = 4
	LET myRec[i].f12 = 4
	LET myRec[i].f13 = "4-TextArea Memo with text and more text and more text-4"
	LET myRec[i].f14 = "4-Label-4"

	LET i = i+1	
	LET myRec[i].f1 = "5-Label-5"
	LET myRec[i].f2 = "5-TextField-5"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "5-FunctionField-5"
	LET myRec[i].f6 = 5
	LET myRec[i].f7 = DATE ("05/05/2025")
	LET myRec[i].f8 = "05:05:05"		
	LET myRec[i].f9 = 1
	LET myRec[i].f10 = 1
	LET myRec[i].f11 = 5
	LET myRec[i].f12 = 5
	LET myRec[i].f13 = "5-TextArea Memo with text and more text and more text-5"
	LET myRec[i].f14 = "5-Label-5"

	LET i = i+1	
	LET myRec[i].f1 = "6-Label-6"
	LET myRec[i].f2 = "6-TextField-6"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "6-FunctionField-6"
	LET myRec[i].f6 = 6
	LET myRec[i].f7 = DATE ("06/06/2026")
	LET myRec[i].f8 = "06:06:06"		
	LET myRec[i].f9 = 2
	LET myRec[i].f10 = 2
	LET myRec[i].f11 = 6
	LET myRec[i].f12 = 6
	LET myRec[i].f13 = "6-TextArea Memo with text and more text and more text-6"
	LET myRec[i].f14 = "6-Label-6"

	LET i = i+1	
	LET myRec[i].f1 = "7-Label-7"
	LET myRec[i].f2 = "7-TextField-7"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "7-FunctionField-7"
	LET myRec[i].f6 = 7
	LET myRec[i].f7 = DATE ("07/07/2027")
	LET myRec[i].f8 = "07:07:07"		
	LET myRec[i].f9 = 0
	LET myRec[i].f10 = 0
	LET myRec[i].f11 = 7
	LET myRec[i].f12 = 7
	LET myRec[i].f13 = "7-TextArea Memo with text and more text and more text-7"
	LET myRec[i].f14 = "7-Label-7"

	LET i = i+1	
	LET myRec[i].f1 = "8-Label-8"
	LET myRec[i].f2 = "8-TextField-8"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "8-FunctionField-8"
	LET myRec[i].f6 = 8
	LET myRec[i].f7 = DATE ("08/08/2028")	
	LET myRec[i].f8 = "08:08:08"		
	LET myRec[i].f9 = 1
	LET myRec[i].f10 = 1
	LET myRec[i].f11 = 8
	LET myRec[i].f12 = 8
	LET myRec[i].f13 = "8-TextArea Memo with text and more text and more text-8"
	LET myRec[i].f14 = "8-Label-8"

	LET i = i+1	
	LET myRec[i].f1 = "9-Label-9"
	LET myRec[i].f2 = "9-TextField-9"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "9-FunctionField-9"
	LET myRec[i].f6 = 9
	LET myRec[i].f7 = DATE ("09/09/2029")
	LET myRec[i].f8 = "09:09:09"		
	LET myRec[i].f9 = 2
	LET myRec[i].f10 = 2
	LET myRec[i].f11 = 9
	LET myRec[i].f12 = 9
	LET myRec[i].f13 = "9-TextArea Memo with text and more text and more text-9"
	LET myRec[i].f14 = "9-Label-9"

	LET i = i+1	
	LET myRec[i].f1 = "10-Label-10"
	LET myRec[i].f2 = "10-TextField-10"
	LET myRec[i].f3 = 1
	LET myRec[i].f4 = 1
	LET myRec[i].f5 = "10-FunctionField-10"
	LET myRec[i].f6 = 10
	LET myRec[i].f7 = DATE ("10/10/2030")
	LET myRec[i].f8 = "10:10:10"		
	LET myRec[i].f9 = 0
	LET myRec[i].f10 = 0
	LET myRec[i].f11 = 10
	LET myRec[i].f12 = 10
	LET myRec[i].f13 = "10-TextArea Memo with text and more text and more text-10"
	LET myRec[i].f14 = "10-Label-10"
	
				
END FUNCTION