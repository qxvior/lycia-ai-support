#########################################################################################################################################
# Authtor Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      v_int INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0712

   # !!! If the table is created within the SQL...END SQL block - there is no bug !!!
-- SQL
   CREATE TABLE lyc_0712
   (
    col_serial8 SERIAL8(1000)
--    col_serial8 SERIAL(1000) --> test case is performed correctly
   )
-- END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   INSERT INTO lyc_0712 VALUES(0)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET v_int = 0
   INSERT INTO lyc_0712 VALUES(v_int)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   
   LET v_int = NULL
   SELECT col_serial8 INTO v_int FROM lyc_0712 WHERE  col_serial8 = 1000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF v_int  IS NULL THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.",v_int END IF
   LET v_int = NULL
   SELECT col_serial8 INTO v_int FROM lyc_0712 WHERE  col_serial8 = 1001
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF v_int  IS NULL THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.",v_int END IF

END MAIN
