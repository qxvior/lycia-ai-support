MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_theme WITH FORM "4244/4244_ToolBarButton_place_theme" ATTRIBUTE(BORDER)

	MENU		
		ON ACTION act1
		DISPLAY "Button1 with theme pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button2 with default property pressed" to lb1
	
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN