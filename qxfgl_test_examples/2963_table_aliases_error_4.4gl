##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
DATABASE stores
MAIN
   DEFINE
      col_dec     DECIMAL(16,2),
      col_date    DATE,
      col_sml     SMALLINT,
      col_varchar VARCHAR(80)

   OPEN WINDOW w1 AT 1,1 WITH FORM "2963/2963_table_aliases_error_3"
   LET col_dec     = 123.45
   LET col_date    = "01/01/0001"
   LET col_sml     = 123
   LET col_varchar = "abc"

   INPUT
         col_dec,
         col_date,
         col_sml,
         col_varchar
         WITHOUT DEFAULTS FROM
         alias_1.col_dec,
         alias_2.col_date,
         view_lyc_2963_2.col_sml,
         alias_4.col_varchar

   CLOSE WINDOW w1

   DISPLAY "col_dec     = ",col_dec
   DISPLAY "col_date    = ",col_date 
   DISPLAY "col_sml     = ",col_sml
   DISPLAY "col_varchar = ",col_varchar
   DISPLAY ""

END MAIN