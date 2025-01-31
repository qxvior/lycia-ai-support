##############################################################################################################
# This external function raises a SQL error.
##############################################################################################################
GLOBALS "5852_global_file_2.4gl"
FUNCTION func_2()

   DISPLAY "FUNCTION func_2()"
   SELECT * INTO glob_integer FROM table_does_not_exist

END FUNCTION