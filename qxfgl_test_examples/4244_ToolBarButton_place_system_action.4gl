

MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_action WITH FORM "4244/4244_ToolBarButton_place_system_action" ATTRIBUTE(BORDER)

	MENU		
		ON ACTION test_tbb
		DISPLAY "Button from SystemActionDefaults pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button 2 with default propertie pressed" to lb1
		
		
	
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN