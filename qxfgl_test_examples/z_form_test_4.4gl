MAIN
	CALL ui_init()
	OPEN WINDOW wForm4a WITH FORM "form/z_form_test_4a"
	CALL nextForm()
	OPEN WINDOW wForm4b WITH FORM "form/z_form_test_4b"
	CALL nextForm()
	OPEN WINDOW wForm4c WITH FORM "form/z_form_test_4c"
	CALL nextForm()
	OPEN WINDOW wForm4d WITH FORM "form/z_form_test_4d"
	MENU
		ON ACTION "Cancel"
			EXIT PROGRAM
	END MENU
	

END MAIN


FUNCTION nextForm()
	MENU
		ON ACTION "Next"
			EXIT MENU
		ON ACTION "Cancel"
			EXIT PROGRAM
	END MENU
END FUNCTION