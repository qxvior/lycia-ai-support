#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_dec_32_32, sel_dec_32_32 DECIMAL(32,32)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1360
   CREATE TABLE lyc_1360
   (
    col_dec_32_32 DECIMAL(32,32)
   )    

   LET ins_dec_32_32  = -0.00000000000000000000000000000001  --> error -999 appears if the number is negative !
--   LET ins_dec_32_32  =  0.00000000000000000000000000000001  --> error -999 doesn't appear  
   INSERT INTO lyc_1360(col_dec_32_32) VALUES(ins_dec_32_32)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32_32 = NULL
   SELECT col_dec_32_32 INTO sel_dec_32_32 FROM lyc_1360 WHERE col_dec_32_32 = ins_dec_32_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32_32 IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_dec_32_32,"|"   END IF

   LET ins_dec_32_32  = -.99999999999999999999999999999999   --> error -999 appears if the number is negative !
--   LET ins_dec_32_32  =  .99999999999999999999999999999999   --> error -999 doesn't appear  
   INSERT INTO lyc_1360(col_dec_32_32) VALUES(ins_dec_32_32)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32_32 = NULL
   SELECT col_dec_32_32 INTO sel_dec_32_32 FROM lyc_1360 WHERE col_dec_32_32 = ins_dec_32_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32_32 IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_dec_32_32,"|"   END IF

END MAIN