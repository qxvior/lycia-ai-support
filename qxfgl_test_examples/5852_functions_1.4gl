##############################################################################################################
# This external function raises a SQL error.
##############################################################################################################
DATABASE stores

GLOBALS
	WHENEVER SQLERROR CALL sqlerror_handler_1
END GLOBALS

FUNCTION func_2()
	DEFINE
		l_integer INTEGER

   DISPLAY "FUNCTION func_2()"
   SELECT * INTO l_integer FROM table_does_not_exist

END FUNCTION