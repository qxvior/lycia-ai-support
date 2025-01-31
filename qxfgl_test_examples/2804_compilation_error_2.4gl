#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      var_char     LIKE lyc_2804.col_char,
      var_varchar  LIKE lyc_2804.col_varchar,
      var_smallint LIKE lyc_2804.col_smallint,
      var_integer  LIKE lyc_2804.col_integer,
      var_decimal  LIKE lyc_2804.col_decimal,
      var_date     LIKE lyc_2804.col_date

   DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
   