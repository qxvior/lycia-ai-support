MAIN
	DEFINE f2,f3 string

	OPEN WINDOW w WITH FORM '6534/6534_combobox_resets_value' ATTRIBUTE(BORDER)
	INPUT BY NAME f2,f3 
		ON ACTION actTouched
			DISPLAY "ON TOUCH"
			CALL fgl_dialog_update_data()
    END INPUT
END MAIN
