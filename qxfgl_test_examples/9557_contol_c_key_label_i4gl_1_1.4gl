MAIN
DEFINE f1 INT
	CALL fgl_putenv("QX_COMPAT=Informix4GL")
	CALL fgl_setactionlabel("cancel", null)
	CALL fgl_setkeylabel("E","Cancel(Crtl-C)","qx://application/key.png",1,FALSE,"", "Top")
	CALL fgl_setkeylabel("Control-C","Cancel(Crtl-C)","qx://application/key.png",1,FALSE,"", "Top")
	
	OPEN WINDOW w WITH FORM "9557/9557_contol_c_key_label_i4gl"
	MENU "Testing"
	    COMMAND KEY(Control-C,E) "Exit" "Return to the list menu"
			INPUT BY NAME f1
				ON KEY (control-c, interrupt)
					DISPLAY "yay"
					EXIT PROGRAM
			END INPUT
			EXIT MENU
	END MENU
END MAIN