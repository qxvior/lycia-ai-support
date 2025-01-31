DATABASE stores

GLOBALS "5862_glob.4gl"

MAIN
	DEFINE fname_v CHAR(50)
	DEFINE a, b, c INT

	LET a = 1
	LET b = 0
	LET c = a / b
	DISPLAY "STATUS: ", STATUS

	SELECT fname INTO fname_v FROM customer WHERE customer_num = -1
	DISPLAY "STATUS: ", STATUS
	DISPLAY "fname_v: ", fname_v

	DISPLAY "END MAIN"
END MAIN

FUNCTION HandleError()
	DISPLAY "HandleError() called"
END FUNCTION

FUNCTION HandleSQLError()
	DISPLAY "HandleSQLError() called"
END FUNCTION

FUNCTION HandleNotFound()
	DISPLAY "HandleNotFound() called"
END FUNCTION

FUNCTION HandleWarning()
	DISPLAY "HandleWarning() called"
END FUNCTION