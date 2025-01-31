MAIN

	CALL ui.Interface.loadTopMenu("0528/system_action_child.tm2")
	OPEN WINDOW w_child WITH FORM "0528/system_action_child" ATTRIBUTE(BORDER)
	
	MENU
		ON ACTION actButtonClick1
			CALL fgl_winmessage("Top menu command", "You chose \"Command 1\"", "info")
		ON ACTION actButtonClick2
			CALL fgl_winmessage("Top menu command", "You chose \"Command 2\"", "info")
		ON ACTION bt1
			EXIT MENU
	END MENU

END MAIN