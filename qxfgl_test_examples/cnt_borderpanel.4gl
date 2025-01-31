#IMPORT FGL _lib_tool_string
#IMPORT FGL _lib_tool

DEFINE myRec RECORD
	f11,f12,
	f21,f22,
	f31,f32,
	f41,f42,f43,f44,f45,f46 STRING
		END RECORD

		
################################################################################
# MAIN
#
#
################################################################################		
MAIN
	CALL ui_init()
	OPTIONS INPUT WRAP
			
	OPEN WINDOW mywin WITH FORM "form/cnt_borderpanel"
  #CALL fgl_settitle("BorderPanel Demo Example")
	CALL ui.Interface.setText("BorderPanel")
	CALL initData()

	INPUT BY NAME myRec.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL fgl_dialog_setkeylabel("ACCEPT","")
#			CALL fgl_dialog_setkeylabel("CANCEL","")
			
		ON ACTION "Cancel"
			EXIT INPUT
			
		ON ACTION actBt1
			CALL fgl_winmessage("Button 1","You pressed Button1","info")
		ON ACTION actBt2
			CALL fgl_winmessage("Button 2","You pressed Button2","info")
		ON ACTION actBt3
			CALL fgl_winmessage("Button 3","You pressed Button3","info")
		ON ACTION actBt4
			CALL fgl_winmessage("Button 4","You pressed Button4","info")
		ON ACTION actBt5
			CALL fgl_winmessage("Button 5","You pressed Button5","info")
		ON ACTION actBt6
			CALL fgl_winmessage("Button 6","You pressed Button6","info")

		ON ACTION actBt11
			CALL fgl_winmessage("Button 1","You pressed Button1","info")
		ON ACTION actBt12
			CALL fgl_winmessage("Button 2","You pressed Button2","info")
		ON ACTION actBt13
			CALL fgl_winmessage("Button 3","You pressed Button3","info")
		ON ACTION actBt14
			CALL fgl_winmessage("Button 4","You pressed Button4","info")
		ON ACTION actBt15
			CALL fgl_winmessage("Button 5","You pressed Button5","info")
		ON ACTION actBt16
			CALL fgl_winmessage("Button 6","You pressed Button6","info")

	END INPUT
END MAIN			


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()

	LET myRec.f11 = "12345"
	LET myRec.f12 = "1234567890"

	LET myRec.f22 = "12345"
	LET myRec.f21 = "12345678901234567890"

	LET myRec.f31 = "123456789012345"
	LET myRec.f32 = "12345678901234567890"


	LET myRec.f41 = "1234567890"
	LET myRec.f42 = "123456789012345"
	LET myRec.f43 = "12345678901234567890"
	LET myRec.f44 = "12345678901234567890123"
	LET myRec.f45 = "12345678901234567890123456"
	LET myRec.f46 = "12345678901234567890123456789"
	

END FUNCTION
		