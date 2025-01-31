##############################################################################################################
# This external function raises a SQL error.
##############################################################################################################
DATABASE stores
FUNCTION func_3()
	DEFINE
		l_integer INTEGER

	WHENEVER SQLERROR CONTINUE	

   DISPLAY "FUNCTION func_3()"
   SELECT * INTO l_integer FROM table_does_not_exist
   DISPLAY "WHENEVER SQLERROR CONTINUE:",STATUS,SQLCA.SQLCODE
   
END FUNCTION