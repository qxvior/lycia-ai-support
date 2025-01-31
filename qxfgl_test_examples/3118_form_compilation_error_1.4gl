#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores

MAIN

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_3118
   CREATE TABLE lyc_3118
   (
    col_lvarchar LVARCHAR(80),
    col_boolean  BOOLEAN    
   )

   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
