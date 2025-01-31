MAIN
CALL ui.Interface.setType("container")

	MENU
		ON ACTION "DEBUG"
			DISPLAY "f6 parent"
			RUN "4637_ad_keys_2"
		ON ACTION "EXIT"
			EXIT MENU
	END MENU
END MAIN