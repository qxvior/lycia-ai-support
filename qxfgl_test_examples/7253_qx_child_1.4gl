MAIN
	DISPLAY "|",fgl_getenv("QX_CHILD"),"|" 
	RUN "echo 'ff'" 
	DISPLAY "|",fgl_getenv("QX_CHILD"),"|"
	RUN "7253_qx_child_2"
	DISPLAY "|",fgl_getenv("QX_CHILD"),"|" 
	CALL fgl_getkey()
END MAIN