MAIN

	MENU
		ON ACTION "Full Screen"
			OPEN WINDOW w1 WITH FORM '0345/0345_fullscreen_after_border'
		CALL fgl_getkey()
		
		CLOSE WINDOW w1

		ON ACTION "Bordered Window"
			OPEN WINDOW w1 WITH FORM '0345/0345_fullscreen_after_border' ATTRIBUTE(BORDER, STYLE="CENTER")
		CALL fgl_getkey()
		
		CLOSE WINDOW w1
		
		ON ACTION "Exit"
			EXIT MENU
			
	END MENU
	
END MAIN