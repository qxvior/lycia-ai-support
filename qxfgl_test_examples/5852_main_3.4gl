##############################################################################################################
# Testing the WHENEVER statement in GLOBALS ... END GLOBALS section.
# Author: albo (A.Bondar)
##############################################################################################################
GLOBALS "5852_global_file_3a.4gl"
MAIN

#  Scope of the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)
	DISPLAY "1. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)
	CALL func_1() --> Inside the internal func_1() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_3 statement
   CALL func_2() --> Inside the external func_2() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)
   CALL func_3() --> Inside the external func_3() function, the sql-error will be handled by the WHENEVER SQLERROR CONTINUE (see 5852_functions_2a.4gl module)
	DISPLAY "2. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)


#  Scope of the WHENEVER SQLERROR CALL sqlerror_handler_2 statement
	WHENEVER SQLERROR CALL sqlerror_handler_2
	DISPLAY "3. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_2 statement
	CALL func_1() --> Inside the internal func_1() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_3 statement
	CALL func_2() --> Inside the external func_2() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)
	CALL func_3() --> Inside the external func_3() function, the sql-error will be handled by the WHENEVER SQLERROR CONTINUE (see 5852_functions_2a.4gl module)
	DISPLAY "4. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_2 statement


#  Scope of the WHENEVER SQLERROR CALL sqlerror_handler_3 statement
	IF 1 != 1 THEN WHENEVER SQLERROR CALL sqlerror_handler_3 END IF
	DISPLAY "5. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_3 statement
	CALL func_1() --> Inside the internal func_1() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_3 statement
   CALL func_2() --> Inside the external func_2() function, the sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_1 statement (see 5852_global_file_3.4gl module)
   CALL func_3() --> Inside the external func_3() function, the sql-error will be handled by the WHENEVER SQLERROR CONTINUE (see 5852_functions_2a.4gl module)
	DISPLAY "6. MAIN"
	SELECT * INTO glob_integer FROM table_does_not_exist --> This sql-error will be handled by the WHENEVER SQLERROR CALL sqlerror_handler_3 statement

   DISPLAY "7. END MAIN"
END MAIN

##############################################################################################################
# This internal function raises a SQL error.
##############################################################################################################
FUNCTION func_1()
	DEFINE
		l_integer INTEGER

   DISPLAY "FUNCTION func_1()"
   SELECT * INTO l_integer FROM table_does_not_exist

END FUNCTION
