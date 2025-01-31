MAIN
	
	CALL ui.Interface.loadActionDefaults("0528/system_action_default")
	CALL ui.Interface.loadStartMenu("0528/start_menu")
	CALL ui.Interface.loadToolBar("0528/toolbar")
	OPEN WINDOW w WITH FORM "0528/system_action" ATTRIBUTE(BORDER)

	MENU
		
		ON ACTION actTbBttbButton1
			CALL fgl_winmessage("Top menu command", "You pressed the toolbar \"button 1\"", "info")
		ON ACTION actTbBttbButton2
			CALL fgl_winmessage("Top menu command", "You pressed the toolbar \"button 2\"", "info")
				
		
		
		ON ACTION Exit
		EXIT MENU
	END MENU
	
	
	CALL fgl_getkey()
	
	
END MAIN