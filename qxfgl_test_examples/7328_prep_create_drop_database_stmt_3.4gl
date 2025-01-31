#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE

	DATABASE stores

	LET stmt = "CREATE DATABASE lyc_7328"
	PREPARE prep_stmt FROM stmt
   DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE   

	EXECUTE prep_stmt
   DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DATABASE lyc_7328

   DROP TABLE lyc_7328
   CREATE TABLE lyc_7328
   (col_char CHAR(1))
   DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DATABASE stores

	LET stmt = "DROP DATABASE lyc_7328"
	PREPARE prep_stmt FROM stmt
   DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE   

	EXECUTE prep_stmt
   DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
