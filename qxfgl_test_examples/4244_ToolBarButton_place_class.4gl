MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_class WITH FORM "4244/4244_ToolBarButton_place_class" ATTRIBUTE(BORDER)

	MENU		
		ON ACTION act1
		DISPLAY "Button with \"expose\" class pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button with default propertie pressed" to lb1
	
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN