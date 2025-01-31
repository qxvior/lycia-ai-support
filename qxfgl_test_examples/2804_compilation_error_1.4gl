#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores

MAIN

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_2804
   CREATE TABLE lyc_2804
   (
    col_char     CHAR(80),
    col_varchar  VARCHAR(80),
    col_smallint SMALLINT,
    col_integer  INTEGER,
    col_decimal  DECIMAL(16,2),
    col_date     DATE
   )

   DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN