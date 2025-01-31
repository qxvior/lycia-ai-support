#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_mon_32_32, sel_mon_32_32 MONEY(32,32)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_7686
   CREATE TABLE lyc_7686
   (
    col_mon_32_32 MONEY(32,32)
   )    

   LET ins_mon_32_32  = -0.00000000000000000000000000000001  --> error -999 appears if the number is negative !
--   LET ins_mon_32_32  =  0.00000000000000000000000000000001  --> error -999 doesn't appear  
   INSERT INTO lyc_7686(col_mon_32_32) VALUES(ins_mon_32_32)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_mon_32_32 = NULL
   SELECT col_mon_32_32 INTO sel_mon_32_32 FROM lyc_7686 WHERE col_mon_32_32 = ins_mon_32_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_mon_32_32 IS NULL    THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_mon_32_32,"|"   END IF

   LET ins_mon_32_32  = -.99999999999999999999999999999999   --> error -999 appears if the number is negative !
--   LET ins_mon_32_32  =  .99999999999999999999999999999999   --> error -999 doesn't appear  
   INSERT INTO lyc_7686(col_mon_32_32) VALUES(ins_mon_32_32)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_mon_32_32 = NULL
   SELECT col_mon_32_32 INTO sel_mon_32_32 FROM lyc_7686 WHERE col_mon_32_32 = ins_mon_32_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_mon_32_32 IS NULL    THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_mon_32_32,"|"   END IF

END MAIN
