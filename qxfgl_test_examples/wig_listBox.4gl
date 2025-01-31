##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	DEFINE fListChoice, fListChoiceText SMALLINT
	DEFINE tmpStr STRING

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT

	CALL ui_init()	
		
	LET fListChoice = 1
	
	OPEN WINDOW myWin WITH FORM "form/wig_listBox"
	CALL ui.Interface.setText("ListBox")
	
	MENU
		ON ACTION "EDIT" #WHILE TRUE	
			INPUT BY NAME fListChoice ATTRIBUTE(UNBUFFERED)
				#BEFORE INPUT
				#	CALL dialog.setActionHidden("ACCEPT",TRUE)
				#	CALL dialog.setActionHidden("CANCEL",TRUE)
		
				ON ACTION updateField
					DISPLAY fListChoice TO fListChoiceText
				
				ON CHANGE fListChoice
					DISPLAY fListChoice TO fListChoiceText	

				ON ACTION actMouseDoubleClick		
					LET tmpStr = "Mouse DoubleClick Event on List Item Value: ",fListChoice CLIPPED 
					CALL fgl_winmessage("DoubleClick", tmpStr, "info")
				
#				ON ACTION "CANCEL"
#					EXIT WHILE	
		
		    ON ACTION "HELP"
		    	CALL onlineHelp(NULL,"Listbox")				

			END INPUT

		ON ACTION "Exit"
			EXIT MENU

    ON ACTION "HELP"
    	CALL onlineHelp(NULL,"LISTBOX")	
		    	
	END MENU
	
END MAIN