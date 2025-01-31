#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      ins_mon_32_0,  sel_mon_32_0  MONEY(32,0), 
      ins_mon_32_16, sel_mon_32_16 MONEY(32,16),
      ins_mon_32_32, sel_mon_32_32 MONEY(32,32)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_2399
   CREATE TABLE lyc_2399
   (
    col_mon_32_0  MONEY(32,0),
    col_mon_32_16 MONEY(32,16),
    col_mon_32_32 MONEY(32,32)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET ins_mon_32_0  = -99999999999999999999999999999999.0
   INSERT INTO lyc_2399(col_mon_32_0) VALUES(ins_mon_32_0)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_mon_32_0 = NULL
   SELECT col_mon_32_0 INTO sel_mon_32_0 FROM lyc_2399 WHERE col_mon_32_0 = ins_mon_32_0
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_mon_32_0 IS NULL    THEN DISPLAY "4.  NULL"   ELSE DISPLAY "4.  |",sel_mon_32_0,"|"   END IF

   LET ins_mon_32_16  = -9999999999999999.9999999999999999
   INSERT INTO lyc_2399(col_mon_32_16) VALUES(ins_mon_32_16)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_mon_32_16 = NULL
   SELECT col_mon_32_16 INTO sel_mon_32_16 FROM lyc_2399 WHERE col_mon_32_16 = ins_mon_32_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_mon_32_16 IS NULL    THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",sel_mon_32_16,"|"   END IF

   LET ins_mon_32_32  = -.99999999999999999999999999999999
   INSERT INTO lyc_2399(col_mon_32_32) VALUES(ins_mon_32_32)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_mon_32_32 = NULL
   SELECT col_mon_32_32 INTO sel_mon_32_32 FROM lyc_2399 WHERE col_mon_32_32 = ins_mon_32_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_mon_32_32 IS NULL    THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",sel_mon_32_32,"|"   END IF

END MAIN