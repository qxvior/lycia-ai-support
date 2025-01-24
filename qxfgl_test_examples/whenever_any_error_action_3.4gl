##############################################################################################################
# Testing of WHENEVER ANY ERRER ... statement.
# Author: Bondar A.G.
##############################################################################################################
IMPORT FGL whenever_any_error_action_imported_func
DATABASE stores_demo
MAIN
   DEFINE
      v_integer INTEGER
      
   WHENEVER ANY ERROR CONTINUE
   LET v_integer = -3
   VALIDATE v_integer LIKE table_for_insert.col_integer
   DISPLAY "WHENEVER ERROR CONTINUE            ",status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn

   WHENEVER ANY ERROR GOTO lab
   OPEN WINDOW w_form_1 AT 1,1 WITH FORM "form_not_exist"
   
   LABEL lab:
   DISPLAY "WHENEVER ERROR GOTO lab            ", status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn   

   WHENEVER ANY ERROR CALL func_1
   SELECT * FROM table_not_exist
   
   WHENEVER ANY ERROR CALL imported_func_3
   LET v_integer = v_integer/0
   
   WHENEVER ANY ERROR STOP
   LET v_integer = "abc"
   
   DISPLAY "end program"
END MAIN
##############################################################################################################
# Function exception handling
##############################################################################################################
FUNCTION func_1()
   LABEL lab:
   DISPLAY "WHENEVER ERROR CALL func_1         ", status,sqlca.sqlcode,sqlca.sqlerrd[3],sqlca.sqlawarn
END FUNCTION
