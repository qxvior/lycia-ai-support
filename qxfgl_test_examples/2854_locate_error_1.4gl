#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################

DATABASE stores

MAIN

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_2854
   CREATE TABLE lyc_2854
   (col_text TEXT
   )
   
   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE 

END MAIN
