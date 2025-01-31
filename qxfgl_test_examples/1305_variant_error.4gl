#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_dec_1,   sel_dec_1   DECIMAL(1), 
      ins_dec_16,  sel_dec_16  DECIMAL(16),
      ins_dec_32,  sel_dec_32  DECIMAL(32),
      ins_variant, sel_variant VARIANT      

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1305
   CREATE TABLE lyc_1305
   (
    col_dec_1   DECIMAL(1), 
    col_dec_16  DECIMAL(16),
    col_dec_32  DECIMAL(32)
   )    
 
   LET ins_dec_1  = -9e-128 LET ins_variant = ins_dec_1
   INSERT INTO lyc_1305(col_dec_1) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_1 = NULL LET sel_variant = sel_dec_1
   SELECT col_dec_1 INTO sel_variant FROM lyc_1305 WHERE col_dec_1 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_variant   USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

   LET ins_dec_1  =  9e+124 LET ins_variant = ins_dec_1
   INSERT INTO lyc_1305(col_dec_1) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_1 = NULL LET sel_variant = sel_dec_1
   SELECT col_dec_1 INTO sel_variant FROM lyc_1305 WHERE col_dec_1 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_variant   USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

   LET ins_dec_16  = -9.999999999999999e-128  LET ins_variant = ins_dec_16
   INSERT INTO lyc_1305(col_dec_16) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL LET sel_variant = sel_dec_16
   SELECT col_dec_16 INTO sel_variant FROM lyc_1305 WHERE col_dec_16 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_variant USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

   LET ins_dec_16  =  9.999999999999999e+124 LET ins_variant = ins_dec_16
   INSERT INTO lyc_1305(col_dec_16) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL LET sel_variant = sel_dec_16
   SELECT col_dec_16 INTO sel_variant FROM lyc_1305 WHERE col_dec_16 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_variant USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

   LET ins_dec_32  = -9.9999999999999999999999999999999e-128  LET ins_variant = ins_dec_32
   INSERT INTO lyc_1305(col_dec_32) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32 = NULL LET sel_variant = sel_dec_32
   SELECT col_dec_32 INTO sel_variant FROM lyc_1305 WHERE col_dec_32 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_variant USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

   LET ins_dec_32  =  9.9999999999999999999999999999999e+124 LET ins_variant = ins_dec_32
   INSERT INTO lyc_1305(col_dec_32) VALUES(ins_variant)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32 = NULL LET sel_variant = sel_dec_32
   SELECT col_dec_32 INTO sel_variant FROM lyc_1305 WHERE col_dec_32 = ins_variant
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_variant IS NULL    THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_variant USING "----------------------------------------------------------------------------------------------------------------------------------.###################################################################################################################################################################","|"   END IF

END MAIN

