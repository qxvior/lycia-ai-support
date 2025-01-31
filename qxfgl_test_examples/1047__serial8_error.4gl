###########################################################################################################################
# Author: Bondar A.G.
###########################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_integer,  sel_integer  INTEGER

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1047    

   # !!! If the table is created within the SQL...END SQL block - there is no bug !!!
-- SQL
   CREATE TABLE lyc_1047
   (col_serial8 SERIAL8(1000)
   )
-- END SQL

   LET ins_integer = 0

   INSERT INTO lyc_1047(col_serial8) VALUES(ins_integer)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_integer = NULL
   SELECT col_serial8 INTO sel_integer FROM lyc_1047 WHERE col_serial8 = 1000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_integer       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_integer,"|"   END IF

END MAIN
