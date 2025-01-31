##############################################################################################################
# Created By: albo (Bondar A.G.)
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
     col_lvarchar LVARCHAR(80),
     col_boolean  BOOLEAN

   LET col_lvarchar = "col_lvarchar"
   LET col_boolean  = 1

   OPEN WINDOW w1 AT 1,1 WITH FORM "3118/3118_form_compilation_error_2"
   INPUT BY NAME  col_lvarchar, col_boolean  WITHOUT DEFAULTS

   CLOSE WINDOW w1 
   
   DISPLAY "1.  col_lvarchar = ",col_lvarchar
   DISPLAY "2.  col_boolean  = ",col_boolean   

END MAIN

