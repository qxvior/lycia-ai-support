MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_property WITH FORM "4244/4244_ToolBarButton_place_property" ATTRIBUTE(BORDER)

	MENU		
		ON ACTION act1
		DISPLAY "Button with \"place\" property pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button with default propertie pressed" to lb1
	
		ON ACTION act3
		ON ACTION act4
		ON ACTION act5
		ON ACTION act6
		ON ACTION act7
		ON ACTION act8
		ON ACTION act9
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN