#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1513
   CREATE TABLE lyc_1513
   (col_nchar NCHAR(80)
   )
   DISPLAY "SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN