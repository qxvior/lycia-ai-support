MAIN
	OPEN WINDOW w_parent WITH FORM "5292/5292_form"
	DISPLAY "PARENT - OPEN WINDOW"
	CALL fgl_getkey()
	RUN "5292_child"
	DISPLAY "PARENT - CLOSED"
	CALL fgl_getkey()
END MAIN
