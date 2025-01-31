MAIN
	WHENEVER ERROR CALL error_handling
	OPEN WINDOW w1 WITH FORM "no_form"
END MAIN

FUNCTION error_handling()
	DISPLAY qx_last_exception
END FUNCTION