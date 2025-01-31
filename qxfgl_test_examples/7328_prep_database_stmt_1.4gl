#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE

	LET stmt = "DATABASE stores"
	PREPARE prep_stmt FROM stmt
   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE   

	EXECUTE prep_stmt
   DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

   DROP TABLE lyc_7328
   CREATE TABLE lyc_7328
   (col_char CHAR(1))
   DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
