################################################################################
# MAIN
#
#
################################################################################
MAIN 
	DEFINE lAnswer STRING
	CALL ui_init()
	OPEN WINDOW myWin WITH FORM "form/gui_dialogBoxes_winMessage" 
	CALL ui.Interface.setText("fgl_winquestion()")	
								

	MENU
		BEFORE MENU
			CALL fgl_dialog_setKeyLabel("demo_fgl_winmessage","fgl_winmessage()","{CONTEXT}/public/querix/icon/svg/24/ic_dialog_24px.svg",10,0,"Call an example message dialogBox using fgl_winmessage()")

		ON ACTION "demo_fgl_winmessage"
			CALL demo_fgl_winmessage()  #Has NO RETURN VALUE - programs suspends until the users presses the OK button in the dialog box


		ON ACTION "Icon"
			CALL demo_fgl_winmessage_icons()  #Has NO RETURN VALUE - programs suspends until the users presses the OK button in the dialog box


		ON ACTION EXIT
			EXIT MENU	
			
    ON ACTION "HELP"
  		CALL onlineHelp("fgl_winmessage",NULL)	
	END MENU

	CLOSE WINDOW myWin
END MAIN

	
	
################################################################################
# FUNCTION demo_fgl_winmessage()
#
#
################################################################################	
FUNCTION demo_fgl_winmessage()

	CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified","info")

END FUNCTION 


################################################################################
# FUNCTION demo_fgl_winmessage_icons()
#
#
################################################################################	
FUNCTION demo_fgl_winmessage_icons()

	MENU
		ON ACTION "INFO"
			CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified\nINFO ICON","info")
		ON ACTION "EXCLAMATION"
			CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified\nERROR ICON","exclamation")
		ON ACTION "ERROR"
			CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified\nERROR ICON","Error")
		ON ACTION "STOP"
			CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified\nERROR ICON","STOP")
		ON ACTION "QUESTION"
			CALL fgl_winmessage("This is the titlebar text","This is the main message body!\nMultiple lines can be specified.\nThe icon type i.e. question, exclamation... can also be specified\nQUESTION ICON","Question")
	
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU



END FUNCTION 