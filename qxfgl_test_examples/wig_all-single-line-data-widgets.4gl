define myRec RECORD 
	fx1 STRING,
	f1 STRING,
	fx2 STRING,
	fx3 STRING,	
	f3 STRING,
	fx4 STRING,	
	f4 STRING,
	fx5 STRING,	
	f5 DATE,
	fx6 STRING,	
	f6 STRING,
	fx6b STRING,	
	f6b STRING,
	fx7 STRING,	
	f7 STRING,
	fx8 STRING,	
	f8 SMALLINT,
	fx9 STRING,	
	f9 Datetime Hour to Second,
	fx10 STRING,	
	f10_1 STRING, f10_2 STRING, f10_3 SMALLINT, f10_4 STRING,
	fx11 STRING,	
	f11_1 STRING, f11_2 STRING, f11_3 SMALLINT, f11_4 STRING,
	fx12 STRING,	
	f12_1 STRING, f12_2 STRING, f12_3 SMALLINT, f12_4 STRING
	END RECORD
	
	
MAIN
	DEFER INTERRUPT
	OPTIONS FIELD ORDER UNCONSTRAINED
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	CALL ui_init()
	
	CALL initData()

	OPEN WINDOW mywin WITH FORM "form/wig_all-single-line-data-widgets"
	CALL ui.Interface.setText("Widgets")	
  CALL fgl_settitle("Widgets Demo Example")


	DISPLAY BY NAME myRec.* 		
	#INPUT BY NAME myRec.* WITHOUT DEFAULTS
	#	BEFORE INPUT
	#		EXIT INPUT
	#END INPUT
	
	
	menu
		ON ACTION "Edit"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
				ON ACTION actButton
					CALL fgl_winmessage("button","button","info")
				ON ACTION "actFunctionFieldF6"
					CALL fgl_winmessage("actFunctionFieldF6","Button Event of the FunctionField F6","info")
					
				ON ACTION "actFunctionFieldF10"
					CALL fgl_winmessage("actFunctionFieldF10","Button Event of the FunctionField F10","info")

				ON ACTION "actFunctionFieldF11"
					CALL fgl_winmessage("actFunctionFieldF11","Button Event of the FunctionField F11","info")

				ON ACTION "actFunctionFieldF12"
					CALL fgl_winmessage("actFunctionFieldF12","Button Event of the FunctionField F12","info")
				
				
			END INPUT

				#action event outside of INPUT			
				ON ACTION actButton
					CALL fgl_winmessage("button","button","info")
				ON ACTION "actFunctionFieldF6"
					CALL fgl_winmessage("actFunctionFieldF6","Button Event of the FunctionField F6","info")
					
				ON ACTION "actFunctionFieldF10"
					CALL fgl_winmessage("actFunctionFieldF10","Button Event of the FunctionField F10","info")

				ON ACTION "actFunctionFieldF11"
					CALL fgl_winmessage("actFunctionFieldF11","Button Event of the FunctionField F11","info")

				ON ACTION "actFunctionFieldF12"
					CALL fgl_winmessage("actFunctionFieldF12","Button Event of the FunctionField F12","info")
			
			
			
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU		
				
	
	
	#DISPLAY myRec.f1
	##DISPLAY f2
	#DISPLAY myRec.f3
	#DISPLAY myRec.f4
	#DISPLAY myRec.f5
	#DISPLAY myRec.f6
	#DISPLAY myRec.f7
	#DISPLAY myRec.f8
	#DISPLAY myRec.f9
	#DISPLAY myRec.f10_1
	#DISPLAY myRec.f11_1
	#DISPLAY myRec.f12_1
										
END MAIN

FUNCTION initData()

	LET myRec.fx1 = "fx1"
	LET myRec.fx2 = "fx2"
	LET myRec.fx3 = "fx3"
	LET myRec.fx4 = "fx4"
	LET myRec.fx5 = "fx5"
	LET myRec.fx6 = "fx6"
	LET myRec.fx6b = "fx6b"
	LET myRec.fx7 = "fx7"
	LET myRec.fx8 = "fx8"
	LET myRec.fx9 = "fx9"
	LET myRec.fx10 = "fx10"
	LET myRec.fx11 = "fx11"
	LET myRec.fx12 = "fx12"	
											
	LET myRec.f1 = "f1"
	#LET myRec.f2 = "f2"
	LET myRec.f3 = "f3"
	LET myRec.f4 = "f4-1"
	LET myRec.f5 = "12/12/2015"
	LET myRec.f6 = "f6"
	LET myRec.f6b = "f6b"
	
	LET myRec.f7 = "f7"		
	LET myRec.f8 = 8
	LET myRec.f9 = "20:45:11"
	
	LET myRec.f10_1 = "f10_1"
	LET myRec.f10_2 = "f10_2"
	LET myRec.f10_3 =  55
	LET myRec.f10_4 = "f10_4_1"
			
	LET myRec.f11_1 = "f11_1"
	LET myRec.f11_2 = "f11_2"
	LET myRec.f11_3 =  70
	LET myRec.f11_4 = "f11_4_1"
		
	LET myRec.f12_1 = "f12_1"
	LET myRec.f12_2 = "f12_2"
	LET myRec.f12_3 =  80		
	LET myRec.f12_4 = "f12_4_1"	
	
END FUNCTION

