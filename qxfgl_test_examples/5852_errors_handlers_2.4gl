##############################################################################################################
# This function handles SQL-errors.
##############################################################################################################
FUNCTION sqlerror_handler_1()
   DISPLAY "FUNCTION sqlerror_handler_1():",STATUS,SQLCA.SQLCODE
END FUNCTION

##############################################################################################################
# This function handles SQL-errors.
##############################################################################################################
FUNCTION sqlerror_handler_2()
   DISPLAY "FUNCTION sqlerror_handler_2():",STATUS,SQLCA.SQLCODE
END FUNCTION

##############################################################################################################
# This function handles SQL-errors.
##############################################################################################################
FUNCTION sqlerror_handler_3()
   DISPLAY "FUNCTION sqlerror_handler_3():",STATUS,SQLCA.SQLCODE
END FUNCTION