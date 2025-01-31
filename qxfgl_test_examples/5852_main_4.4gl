##############################################################################################################
# Testing the WHENEVER statement in GLOBALS ... END GLOBALS section.
# Author: albo (A.Bondar)
##############################################################################################################
DATABASE stores

GLOBALS
	WHENEVER ANY ERROR CALL error_handler_1
END GLOBALS

MAIN
	DEFINE
		l_integer INTEGER

#  Scope of the WHENEVER ANY ERROR CALL error_handler_1 statement
	DISPLAY "1. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_1 statement 
	CALL func_1() --> Inside the internal func_1() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_3 statement
   CALL func_2() --> Inside the external func_2() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_1 statement (see 5852_functions_4.4gl module)
	DISPLAY "2. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_1 statement


#  Scope of the WHENEVER ANY ERROR CALL error_handler_2 statement
	WHENEVER ANY ERROR CALL error_handler_2
	DISPLAY "3. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_2 statement
	CALL func_1() --> Inside the internal func_1() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_3 statement
   CALL func_2() --> Inside the external func_2() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_1 statement (see 5852_functions_4.4gl module)
	DISPLAY "4. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_2 statement


#  Scope of the WHENEVER ANY ERROR CALL error_handler_3 statement
	WHENEVER ANY ERROR CALL error_handler_3
	DISPLAY "5. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_3 statement
	CALL func_1() --> Inside the internal func_1() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_3 statement
   CALL func_2() --> Inside the external func_2() function, the error will be handled by the WHENEVER ANY ERROR CALL error_handler_1 statement (see 5852_functions_4.4gl module)
	DISPLAY "6. MAIN"
	LET l_integer = "abc" --> This error will be handled by the WHENEVER ANY ERROR CALL error_handler_3 statement

   DISPLAY "7. END MAIN"
END MAIN

##############################################################################################################
# This internal function raises a SQL error.
##############################################################################################################
FUNCTION func_1()
	DEFINE
		l_integer INTEGER

   DISPLAY "FUNCTION func_1()"
   LET l_integer = "abc"

END FUNCTION
