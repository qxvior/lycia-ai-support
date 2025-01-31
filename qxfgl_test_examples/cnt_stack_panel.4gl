##############################################################################
# Module Scope
##############################################################################

DEFINE myRec RECORD
	f11,f12,f13,f14,
	f21,f22,f23,f24,
	f31,f32,f33,f34,
	f41,f42,f43,f44,
	f51,f52,f53,f54 STRING
		END RECORD
		
##############################################################################
# MAIN
#
#
##############################################################################
MAIN
	CALL ui_init()
	
	OPEN WINDOW mywin WITH FORM "form/cnt_stack_panel"
	CALL ui.Interface.setText("Stack Panel")
	CALL initData()

	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME myRec.*
		
		ON ACTION "CLEAR FORM"
			CLEAR FORM
					
		ON ACTION "EDIT"
			INPUT BY NAME myRec.* WITHOUT DEFAULTS
					
				ON ACTION actBtV1
					CALL fgl_winmessage("Button V-1","You pressed Button 1\nlocated in the vertical stack panel","info")
				ON ACTION actBtV2
					CALL fgl_winmessage("Button V-2","You pressed Button 2\nlocated in the vertical stack panel","info")
				ON ACTION actBtV3
					CALL fgl_winmessage("Button V-3","You pressed Button 3\nlocated in the vertical stack panel","info")
				ON ACTION actBtV4
					CALL fgl_winmessage("Button V-4","You pressed Button 4\nlocated in the vertical stack panel","info")
				ON ACTION actBtV5
					CALL fgl_winmessage("Button V-5","You pressed Button 5\nlocated in the vertical stack panel","info")
				ON ACTION actBtV6
					CALL fgl_winmessage("Button V-6","You pressed Button 6\nlocated in the vertical stack panel","info")


				ON ACTION actBtH1
					CALL fgl_winmessage("Button H-1","You pressed Button 1\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH2
					CALL fgl_winmessage("Button H-2","You pressed Button 2\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH3
					CALL fgl_winmessage("Button H-3","You pressed Button 3\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH4
					CALL fgl_winmessage("Button H-4","You pressed Button 4\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH5
					CALL fgl_winmessage("Button H-5","You pressed Button 5\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH6
					CALL fgl_winmessage("Button H-6","You pressed Button 6\nlocated in the horizontal stack panel","info")

				ON ACTION "Cancel"
					EXIT INPUT

		    ON ACTION "HELP"
		  		CALL onlineHelp("StackPanel",NULL)				
					
			END INPUT

		#Button actions also active in the menu
				ON ACTION actBtV1
					CALL fgl_winmessage("Button V-1","You pressed Button 1\nlocated in the vertical stack panel","info")
				ON ACTION actBtV2
					CALL fgl_winmessage("Button V-2","You pressed Button 2\nlocated in the vertical stack panel","info")
				ON ACTION actBtV3
					CALL fgl_winmessage("Button V-3","You pressed Button 3\nlocated in the vertical stack panel","info")
				ON ACTION actBtV4
					CALL fgl_winmessage("Button V-4","You pressed Button 4\nlocated in the vertical stack panel","info")
				ON ACTION actBtV5
					CALL fgl_winmessage("Button V-5","You pressed Button 5\nlocated in the vertical stack panel","info")
				ON ACTION actBtV6
					CALL fgl_winmessage("Button V-6","You pressed Button 6\nlocated in the vertical stack panel","info")


				ON ACTION actBtH1
					CALL fgl_winmessage("Button H-1","You pressed Button 1\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH2
					CALL fgl_winmessage("Button H-2","You pressed Button 2\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH3
					CALL fgl_winmessage("Button H-3","You pressed Button 3\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH4
					CALL fgl_winmessage("Button H-4","You pressed Button 4\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH5
					CALL fgl_winmessage("Button H-5","You pressed Button 5\nlocated in the horizontal stack panel","info")
				ON ACTION actBtH6
					CALL fgl_winmessage("Button H-6","You pressed Button 6\nlocated in the horizontal stack panel","info")
			
    ON ACTION "HELP"
  		CALL onlineHelp("StackPanel",NULL)				

		ON ACTION "CANCEL"
			EXIT MENU
	END MENU		
END MAIN			

	
##############################################################################
# FUNCTION initData()
#
#
##############################################################################
FUNCTION initData()

	LET myRec.f11 = "12345"
	LET myRec.f12 = "1234567890"
	LET myRec.f13 = "123456789012345"
	LET myRec.f14 = "12345678901234567890"

	LET myRec.f22 = "12345"
	LET myRec.f23 = "1234567890"
	LET myRec.f24 = "123456789012345"
	LET myRec.f21 = "12345678901234567890"

	LET myRec.f33 = "12345"
	LET myRec.f34 = "1234567890"
	LET myRec.f31 = "123456789012345"
	LET myRec.f32 = "12345678901234567890"

	LET myRec.f44 = "12345"
	LET myRec.f41 = "1234567890"
	LET myRec.f42 = "123456789012345"
	LET myRec.f43 = "12345678901234567890"

	LET myRec.f51 = "12345"
	LET myRec.f52 = "1234567890"
	LET myRec.f53 = "123456789012345"
	LET myRec.f54 = "12345678901234567890"
	

END FUNCTION
		