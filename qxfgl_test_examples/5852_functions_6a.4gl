##############################################################################################################
# This external function raises a error.
##############################################################################################################
DATABASE stores
FUNCTION func_3()
	DEFINE
		l_integer INTEGER

	WHENEVER ERROR CONTINUE

   DISPLAY "FUNCTION func_3()"
   LET l_integer = "abc"
   DISPLAY "WHENEVER ERROR CONTINUE:",STATUS   

END FUNCTION