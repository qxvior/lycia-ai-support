###########################################################################################################################
# Author: Bondar A.G.
###########################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_bigint,  sel_bigint  BIGINT

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1041_1    

   # !!! If the tables is created within the SQL...END SQL block - there is no bug !!!
-- SQL
   CREATE TABLE lyc_1041_1
   (col_bigserial BIGSERIAL(1000)
   )
-- END SQL   

   LET ins_bigint = 0

   INSERT INTO lyc_1041_1(col_bigserial) VALUES(ins_bigint)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_bigint = NULL
   SELECT col_bigserial INTO sel_bigint FROM lyc_1041_1 WHERE col_bigserial = 1000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_bigint       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_bigint,"|"   END IF

END MAIN
