MAIN

	DEFINE fListChoice, fListChoiceText STRING

	LET fListChoice = 1

	OPEN WINDOW myWin WITH FORM "3134/3134_setting_value_from_listBox" Attribute(BORDER)
	
	MENU
		
		ON ACTION "EDIT"
			DISPLAY "" TO fListChoiceText
			
			INPUT BY NAME fListChoice ATTRIBUTE(UNBUFFERED)

			ON CHANGE fListChoice
			DISPLAY fListChoice TO fListChoiceText	

			END INPUT

		ON ACTION "Exit"
			EXIT MENU

	END MENU

END MAIN