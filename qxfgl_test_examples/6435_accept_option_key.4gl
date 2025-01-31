MAIN
DEFINE f1 CHAR(5)
DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2,f3 CHAR(5) END RECORD 


	OPEN WINDOW win1 WITH FORM "6435/6435_accept_option_key" ATTRIBUTE (border)
	OPTIONS ACCEPT KEY F12
	INPUT BY NAME f1 WITHOUT DEFAULTS
	    ON KEY (F12)
	    	 DISPLAY "ON KEY f12"
	    	 CALL fgl_dialog_update_data()
	    	 EXIT INPUT
	END INPUT
	DISPLAY "Input Accepted:",f1
    CLOSE WINDOW win1


	OPEN WINDOW win1 WITH FORM "6435/6435_accept_option_key_2" ATTRIBUTE (border)
	INPUT ARRAY tarr FROM tarr.*
	    ON KEY (F12)
	    	 DISPLAY "ON KEY f12"
	    	 EXIT INPUT
	END INPUT	
	DISPLAY "InputArray Accepted:",tarr[1].f1

	DISPLAY ARRAY tarr TO tarr.*
	    ON KEY (F12)
	    	DISPLAY "ON KEY f12"
			EXIT DISPLAY	
	END DISPLAY
	DISPLAY "DisplayArray Accepted:",tarr[1].f1
    CALL fgl_getkey()
END MAIN