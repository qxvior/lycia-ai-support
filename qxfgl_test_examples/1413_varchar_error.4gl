#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_varchar_1,    sel_varchar_1    VARCHAR(1)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1412
   CREATE TABLE lyc_1412
   (
    col_varchar_1    VARCHAR(1)
--    col_varchar_1    VARCHAR(2)  --> Ok !!!
   )        
   
   LET ins_varchar_1 = "ä"
   DISPLAY "1.  |",ins_varchar_1,"|"
   INSERT INTO lyc_1412(col_varchar_1) VALUES(ins_varchar_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_varchar_1 = NULL
   SELECT col_varchar_1 INTO sel_varchar_1 FROM lyc_1412 WHERE col_varchar_1 = ins_varchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_varchar_1     IS NULL   THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_varchar_1,"|"   END IF

END MAIN
