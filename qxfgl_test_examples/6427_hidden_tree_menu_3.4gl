MAIN
CALL ui.Interface.setType("container")
CALL ui.Application.GetCurrent().setMenuType("Tree")
CALL ui.interface.loadstartmenu("6427/6427_hidden_tree_menu_2.fm2")
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