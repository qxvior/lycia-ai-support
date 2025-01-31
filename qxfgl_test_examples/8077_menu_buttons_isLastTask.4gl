MAIN

OPEN WINDOW w1 WITH FORM "8077/8077_menu_buttons_isLastTask"

	MENU
		ON ACTION actTbBttbButton1
		SLEEP 1
		DISPLAY "actTbBttbButton1"
	
		ON ACTION actTbBttbButton2
		DISPLAY "actTbBttbButton2"

		ON ACTION Exit
		EXIT MENU
	END MENU
END MAIN