
MAIN
	OPEN WINDOW w_child WITH FORM "5292/5292_form"
	DISPLAY "OPEN CHILD 1 - WINDOW"
	CALL fgl_getkey()	
	
	RUN "5292_grandchild"

	DISPLAY ("BACK TO CHILD 1 - WINDOW")
	CALL fgl_getkey()
END MAIN