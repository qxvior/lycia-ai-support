MAIN
	DEFINE blob TEXT
	LET blob = "test data"
	CALL c_fgl_call(blob)
	DISPLAY "2. ", blob
END MAIN

FUNCTION fgl_function(blob TEXT)
	DISPLAY "1. ", blob
	RETURN blob
END FUNCTION