MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_ad2 WITH FORM "4244/4244_ToolBarButton_place_ad2" ATTRIBUTE(BORDER)

	MENU		
ON ACTION action_test_1
ON ACTION action_test_2
ON ACTION action_test_3
ON ACTION action_test_4
ON ACTION action_test_5
ON ACTION action_test_6
ON ACTION action_test_7
		ON ACTION tbb_ad2
		DISPLAY "Button with ad2 class pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button with default propertie pressed" to lb1
	
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN