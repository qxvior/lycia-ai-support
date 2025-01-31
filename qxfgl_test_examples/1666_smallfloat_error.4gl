#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_smallfloat, sel_smallfloat SMALLFLOAT

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1666
   CREATE TABLE lyc_1666
   (
    col_smallfloat SMALLFLOAT
   )

   LET ins_smallfloat = NULL
   INSERT INTO lyc_1666 VALUES(ins_smallfloat)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_smallfloat = 0
   SELECT col_smallfloat INTO sel_smallfloat FROM lyc_1666 WHERE col_smallfloat IS NULL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_smallfloat       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_smallfloat,"|"   END IF

END MAIN
