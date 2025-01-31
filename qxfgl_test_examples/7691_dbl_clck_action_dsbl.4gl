DEFINE modu_arr_rec DYNAMIC ARRAY OF INT
MAIN
	OPEN WINDOW win WITH FORM "7691/7691_dbl_clck_action_dsbl"
	LET modu_arr_rec[1]=1
	DISPLAY ARRAY modu_arr_rec TO sc_table.*
		BEFORE DISPLAY
			CALL dialog.setActionActive("DOUBLECLICK",FALSE)
	
		ON ACTION "ACCEPT"
			DISPLAY "accept"
			CONTINUE DISPLAY
	END DISPLAY
END MAIN