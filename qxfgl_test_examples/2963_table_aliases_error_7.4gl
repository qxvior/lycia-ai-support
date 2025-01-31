##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
      col_int     INTEGER,
      col_dec     DECIMAL(16,2),
      col_date    DATE,
      col_char    CHAR(5)

   OPEN WINDOW w1 AT 1,1 WITH FORM "2963/2963_table_aliases_error_6"
   LET col_int     = 123
   LET col_dec     = 123.45
   LET col_date = "1/1/2001"
   LET col_char = "col_char"
   
   INPUT BY NAME 
      col_int,
      col_dec,
      col_date,
      col_char
      WITHOUT DEFAULTS

   CLOSE WINDOW w1

   DISPLAY "col_int = ",col_int
   DISPLAY "col_dec = ",col_dec
   DISPLAY "col_date= ",col_date
   DISPLAY "col_char= ",col_char

END MAIN