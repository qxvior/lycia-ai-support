#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_dec_32_1,  sel_dec_32_1  DECIMAL(32,1), 
      ins_dec_32_15, sel_dec_32_15 DECIMAL(32,15),
      ins_dec_32_31, sel_dec_32_31 DECIMAL(32,31)

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_0580
   CREATE TABLE lyc_0580
   (
    col_dec_32_1  DECIMAL(32,1), 
    col_dec_32_15 DECIMAL(32,15),
    col_dec_32_31 DECIMAL(32,31)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "0.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET ins_dec_32_1  = -9999999999999999999999999999999.9
   INSERT INTO lyc_0580(col_dec_32_1) VALUES(ins_dec_32_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32_1 = NULL
   SELECT col_dec_32_1 INTO sel_dec_32_1 FROM lyc_0580 WHERE col_dec_32_1 = ins_dec_32_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32_1 IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_dec_32_1,"|"   END IF

   LET ins_dec_32_15  =  99999999999999999.999999999999999
   INSERT INTO lyc_0580(col_dec_32_15) VALUES(ins_dec_32_15)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32_15 = NULL
   SELECT col_dec_32_15 INTO sel_dec_32_15 FROM lyc_0580 WHERE col_dec_32_15 = ins_dec_32_15
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32_15 IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_dec_32_15,"|"   END IF

   LET ins_dec_32_31  = -9.9999999999999999999999999999999
   INSERT INTO lyc_0580(col_dec_32_31) VALUES(ins_dec_32_31)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32_31 = NULL
   SELECT col_dec_32_31 INTO sel_dec_32_31 FROM lyc_0580 WHERE col_dec_32_31 = ins_dec_32_31
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32_31 IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_dec_32_31,"|"   END IF

END MAIN