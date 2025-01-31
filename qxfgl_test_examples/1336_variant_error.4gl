#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_float_1,  sel_float_1  FLOAT(1), 
      ins_float_7,  sel_float_7  FLOAT(7), 
      ins_float_14, sel_float_14 FLOAT(14),
      ins_variant,  sel_variant  VARIANT      

   WHENEVER ANY ERROR CONTINUE

   DROP TABLE lyc_1336
   CREATE TABLE lyc_1336
  (
    col_float_1  FLOAT(1), 
    col_float_7  FLOAT(7),
    col_float_14 FLOAT(14)
   )    

   LET ins_float_1  =  9e+124 LET ins_variant = ins_float_1
   INSERT INTO lyc_1336(col_float_1) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_1 = NULL LET sel_variant = sel_float_1
   SELECT col_float_1 INTO sel_variant FROM lyc_1336 WHERE col_float_1 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

   LET ins_float_7  =  9.999999e+124 LET ins_variant = ins_float_7
   INSERT INTO lyc_1336(col_float_7) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_7 = NULL LET sel_variant = sel_float_7
   SELECT col_float_7 INTO sel_variant FROM lyc_1336 WHERE col_float_7 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

   LET ins_float_14  =  9.9999999999999e+124 LET ins_variant = ins_float_14
   INSERT INTO lyc_1336(col_float_14) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_14 = NULL LET sel_variant = sel_float_14
   SELECT col_float_14 INTO sel_variant FROM lyc_1336 WHERE col_float_14 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

END MAIN
