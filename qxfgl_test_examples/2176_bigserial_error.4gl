###########################################################################################################################
# Author: Bondar A.G.
###########################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_bigint,  sel_bigint  BIGINT

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_2176    
   CREATE TABLE lyc_2176
   (
   col_bigserial BIGSERIAL  --> an error -999 appears 
--   col_bigserial SERIAL8 --> table and trigger is created !!!
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET ins_bigint = 0

   INSERT INTO lyc_2176(col_bigserial) VALUES(ins_bigint)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_bigint = NULL
   SELECT col_bigserial INTO sel_bigint FROM lyc_2176 WHERE col_bigserial = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_bigint       IS NULL   THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_bigint,"|"   END IF

END MAIN
