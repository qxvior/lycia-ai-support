################################################################################
# MAIN
#
#
################################################################################
MAIN 
	DEFINE lAnswer STRING
	CALL ui_init()

	OPEN WINDOW myWin WITH FORM "form/gui_dialogBoxes_winButton" 
	CALL ui.Interface.setText("fgl_winbutton()")

	MENU
		BEFORE MENU
			CALL fgl_dialog_setKeyLabel("message","fgl_winbutton()","{CONTEXT}/public/querix/icon/svg/24/ic_dialog_24px.svg",1,0,"Call an example winButton dialog messageBox using fgl_winbutton()")		

		ON ACTION "message"
			let lAnswer = demo_fgl_winbutton()
			IF lAnswer = "E" THEN 
				EXIT MENU
			END IF
			
		ON ACTION EXIT
			EXIT MENU	
			
    ON ACTION "HELP"
  		CALL onlineHelp("fgl_winbutton",NULL)								
	END MENU

	CLOSE WINDOW myWin
END MAIN

################################################################################
# FUNCTION demo_fgl_winbutton()
#
#
################################################################################	
FUNCTION demo_fgl_winbutton()
	DEFINE answer STRING

	LET answer = fgl_winbutton("My Title Text","Press the button of your choice!\nNote: The \"clicked\" button label will be the return value of this function call","Yes","Yes|No|Exit","question")
	
	LET answer = answer[1]  --would be required if the original classic 4gl application worked with i.e. char(2)
	CASE answer[1]
		WHEN "Y"
			CALL fgl_winmessage("Yes","You pressed the Yes button","info")
		WHEN "N"
			CALL fgl_winmessage("No","You pressed the No button","info")
		WHEN "E"
			CALL fgl_winmessage("Exit","You pressed the Exit button","info")						
	END CASE
	
	RETURN answer			

END FUNCTION 