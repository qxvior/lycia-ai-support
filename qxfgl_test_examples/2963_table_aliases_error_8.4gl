##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
      col_dec     DECIMAL(16,2),
      col_date    DATE

   OPEN WINDOW w1 AT 1,1 WITH FORM "2963/2963_table_aliases_error_7"
   LET col_dec     = 123.45
   LET col_date    = "01/01/0001" 

   INPUT col_dec,
         col_date
         WITHOUT DEFAULTS FROM
         col_dec,
         alias_1.col_date
                 
   CLOSE WINDOW w1

   DISPLAY "col_dec  = ",col_dec
   DISPLAY "col_date = ",col_date

END MAIN
