MAIN
	MENU "parent"
		ON ACTION "sub menu"
			OPEN WINDOW w_vinwind AT 5,5 WITH 10 ROWS, 20 COLUMNS  attribute(BORDER)
			MENU "child"
				ON ACTION "Accept"
					OPEN WINDOW w_nested with FORM "5148/5148_toobar_button_missed"
					MENU "child"
						ON ACTION "Done"
							EXIT MENU
					END MENU
					CLOSE WINDOW w_nested
				ON ACTION "Cancel"
					EXIT MENU
			END MENU
			CLOSE WINDOW w_vinwind
		ON ACTION "exit"
			EXIT MENU
	END MENU
END MAIN