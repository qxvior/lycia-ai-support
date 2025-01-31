#########################################################################################################################################
# The test case must execute on connection to any DBMS. Testing a table record lock.
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_demo
MAIN

   DEFINE
      stmt      CHAR(256),
      v_inter INTEGER,
      v_dec DECIMAL(10,2),
      v_char    CHAR(60)

--   SET ISOLATION TO COMMITTED READ
	SET LOCK MODE TO NOT WAIT --> Database server ends the operation immediately and returns an error code.
   WHENEVER ERROR CONTINUE

   LET v_inter = NULL LET v_dec = NULL LET v_char = NULL
   SELECT col_integer,col_decimal,col_char INTO v_inter,v_dec,v_char FROM lyc_8299_check_row_lock WHERE col_integer = 1

   DISPLAY "5.  v_inter = ",v_inter," v_dec = ",v_dec," v_char = ",v_char
   DISPLAY "6.  SQLCA.SQLCODE    = ",SQLCA.SQLCODE    --> indicates the result of any SQL statement. SQLCODE is negative after an unsuccessful SQL operation.
   DISPLAY "7.  SQLCA.SQLERRD[2] = ",SQLCA.SQLERRD[2] --> ISAM error code
   DISPLAY "8.  SQLCA.SQLERRD[3] = ",SQLCA.SQLERRD[3] --> is the number of rows inserted or updated

END MAIN
