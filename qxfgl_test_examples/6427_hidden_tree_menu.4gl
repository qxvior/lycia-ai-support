MAIN
	OPEN WINDOW f WITH FORM "6427/6427_hidden_tree_menu.fm2" --menubar is here
	MENU
	  	ON ACTION "actExitTm"
	      EXIT MENU 
	  	ON ACTION "open_form"
			OPEN WINDOW w WITH 20 ROWS, 80 COLUMNS
			DISPLAY "screen" AT 5,5
			CALL fgl_getkey()
			CLOSE WINDOW w
	END MENU
END MAIN