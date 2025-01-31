#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_smallfloat, sel_smallfloat SMALLFLOAT,
      ins_variant,    sel_variant    VARIANT       

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_1337
   CREATE TABLE lyc_1337
  (
    col_smallfloat SMALLFLOAT 
   )    
   
   LET ins_smallfloat = 9.0e+37 LET ins_variant = ins_smallfloat
   INSERT INTO lyc_1337(col_smallfloat) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat = NULL LET sel_variant = sel_smallfloat
   SELECT col_smallfloat INTO sel_variant FROM lyc_1337 WHERE col_smallfloat = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant       IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_variant USING "-------------------------------------------------&.&&","|"   END IF

   LET ins_smallfloat  =  9.999e+37 LET ins_variant = ins_smallfloat
   INSERT INTO lyc_1337(col_smallfloat) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat = NULL LET sel_variant = sel_smallfloat
   SELECT col_smallfloat INTO sel_variant FROM lyc_1337 WHERE col_smallfloat = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_variant      USING "-------------------------------------------------&.&&","|"   END IF

   LET ins_smallfloat  =  9.99999e+37 LET ins_variant = ins_smallfloat
   INSERT INTO lyc_1337(col_smallfloat) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat = NULL LET sel_variant = sel_smallfloat
   SELECT col_smallfloat INTO sel_variant FROM lyc_1337 WHERE col_smallfloat = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_variant      USING "-------------------------------------------------&.&&","|"   END IF

END MAIN


