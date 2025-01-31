MAIN
	OPEN WINDOW w1 WITH 20 ROWS, 60 COLUMNS
	DISPLAY "app1" at 5,5
	CALL fgl_setactionlabel("RUN_NO_WAIT","RUN_NO_WAIT","qx://application/about.png",10,TRUE,"Run child")
	CALL fgl_setactionlabel("wait","wait","qx://application/about.png",10,TRUE,"Run child")
	MENU
		ON ACTION "RUN_NO_WAIT"
			RUN "6364_child_2_1" WITHOUT WAITING
		ON ACTION "wait"
			RUN "6364_child_2_2" 
	END MENU
END MAIN