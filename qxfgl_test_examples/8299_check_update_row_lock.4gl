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
   WHENEVER ERROR CONTINUE
      DROP TABLE lyc_8299_check_row_lock

   CREATE TABLE lyc_8299_check_row_lock
   (col_integer   INTEGER,
    col_decimal   DECIMAL(10,2),
    col_char      CHAR(60)
   )

   INSERT INTO lyc_8299_check_row_lock VALUES(1,1.11,"string one")
   INSERT INTO lyc_8299_check_row_lock VALUES(2,2.22,"strinf two")
   INSERT INTO lyc_8299_check_row_lock VALUES(3,3.33,"string three")

   BEGIN WORK

      UPDATE lyc_8299_check_row_lock SET col_decimal = -col_decimal,col_char = "A row was changed"  WHERE col_integer = 1
      LET v_inter = NULL LET v_dec = NULL LET v_char = NULL
      SELECT col_integer,col_decimal,col_char INTO v_inter,v_dec,v_char FROM lyc_8299_check_row_lock WHERE col_integer = 1

      DISPLAY "Transaction not completed. Table row is locked."
{
      DISPLAY "1.  v_inter = ",v_inter," v_dec = ",v_dec," v_char = ",v_char
      DISPLAY "2.  SQLCA.SQLCODE    = ",SQLCA.SQLCODE    --> indicates the result of any SQL statement. SQLCODE is negative after an unsuccessful SQL operation.
      DISPLAY "3.  SQLCA.SQLERRD[2] = ",SQLCA.SQLERRD[2] --> ISAM error code
      DISPLAY "4.  SQLCA.SQLERRD[3] = ",SQLCA.SQLERRD[3] --> is the number of rows inserted or updated
}
      RUN "./8299_check_row_lock"

   COMMIT WORK

   DISPLAY " "
   DISPLAY "Transaction is completed. Table row is unlocked."
   SELECT col_integer,col_decimal,col_char INTO v_inter,v_dec,v_char FROM lyc_8299_check_row_lock WHERE col_integer = 1
   DISPLAY "9.  v_inter = ",v_inter," v_dec = ",v_dec," v_char = ",v_char
   DISPLAY "10. SQLCA.SQLCODE    = ",SQLCA.SQLCODE    --> indicates the result of any SQL statement. SQLCODE is negative after an unsuccessful SQL operation.
   DISPLAY "11. SQLCA.SQLERRD[2] = ",SQLCA.SQLERRD[2] --> ISAM error code
   DISPLAY "12. SQLCA.SQLERRD[3] = ",SQLCA.SQLERRD[3] --> is the number of rows inserted or updated

   DROP TABLE lyc_8299_check_row_lock

END MAIN
