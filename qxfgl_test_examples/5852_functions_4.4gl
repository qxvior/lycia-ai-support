##############################################################################################################
# This external function raises a error.
##############################################################################################################
DATABASE stores

GLOBALS
	WHENEVER ANY ERROR CALL error_handler_1
END GLOBALS

FUNCTION func_2()
	DEFINE
		l_integer INTEGER

   DISPLAY "FUNCTION func_2()"
   LET l_integer = "abc"

END FUNCTION