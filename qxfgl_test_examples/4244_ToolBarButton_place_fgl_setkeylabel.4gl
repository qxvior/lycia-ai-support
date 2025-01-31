MAIN

	DEFINE lb1 STRING

OPEN WINDOW ToolBarButton_setkeylabel WITH FORM "4244/4244_ToolBarButton_place_fgl_setkeylabel" ATTRIBUTE(BORDER)

CALL fgl_setkeylabel("button_SKL", "Button 1", "qx://application/cup.png", 999, true, "Test ToolTip", "Top")
CALL fgl_setkeylabel("action_test_1", "action_test_1", "", 1, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_2", "action_test_2", "", 2, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_3", "action_test_3", "", 3, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_4", "action_test_4", "", 4, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_5", "action_test_5", "", 5, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_6", "action_test_6", "", 6, true, "Test ToolTip")
CALL fgl_setkeylabel("action_test_7", "action_test_7", "", 7, true, "Test ToolTip")

	MENU		

ON ACTION action_test_1
ON ACTION action_test_2
ON ACTION action_test_3
ON ACTION action_test_4
ON ACTION action_test_5
ON ACTION action_test_6
ON ACTION action_test_7
		ON ACTION button_SKL
		DISPLAY "Button with \"fgl_setkeylabel\" pressed" to lb1
				
		ON ACTION act2
		DISPLAY "Button with default propertie pressed" to lb1
	
		ON ACTION  "exit"
		EXIT MENU			
	END MENU



END MAIN