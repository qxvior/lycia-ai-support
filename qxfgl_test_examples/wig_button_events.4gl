

MAIN
	CALL ui_init()
	DEFER INTERRUPT

	OPEN WINDOW wButton WITH FORM "form/wig_button_events"
	CALL ui.Interface.setText("Button Events")
		

	MENU
		ON ACTION ("actActionEventHandler")
			CALL fgl_winmessage("Action Event","Action event actActionEventHandler was triggered","info")

		ON ACTION ("actEventInBatchList1")			
			CALL fgl_winmessage("Batch - Action Event","Batch - Action event actEventInBatchList1 was triggered","info")
			
		COMMAND KEY ("F8")
			CALL fgl_winmessage("F8 - Key Event","Key F8 - Key event F8 was triggered","info")	


		COMMAND KEY ("F6")
			CALL fgl_winmessage("F6 - Key Event","This event is NOT handled by any form widget\nFor this reason, it is shown in the toolbar.\nKey event F6 was triggered","info")
			
		ON ACTION ("PRINT")			
			CALL fgl_winmessage("PRINT - Action Event","This action event is NOT handled by any form widget\nFor this reason, it is shown in the toolbar.\nAction event PRINT was triggered","info")
				
			

		ON ACTION ("CANCEL")
			EXIT MENU
	END MENU
	
END MAIN					

#####################################################################
# FUNCTION function_called_by_event()
#
# NOTE: A form event which triggers a function call CAN NOT USE ANY ARGUMENTS
#####################################################################
FUNCTION function_called_by_event()

	CALL fgl_winmessage("Function was called","This was a function call event!\nThe function function_called_by_event() was invoked>","info")

END FUNCTION	