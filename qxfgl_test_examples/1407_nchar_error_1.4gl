#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_nchar_4000, sel_nchar_4000 NCHAR(4000),
--      ins_nchar_4000, sel_nchar_4000 NCHAR(2656),   --> error -999 doesn't appear  
      i INTEGER

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1407
   CREATE TABLE lyc_1407
   (
    col_nchar_4000 NCHAR(4000)
   )        

   FOR i = 1 TO 16
      LET ins_nchar_4000 = ins_nchar_4000 CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      

   INSERT INTO lyc_1407 VALUES(ins_nchar_4000)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nchar_4000 = NULL
   SELECT col_nchar_4000 INTO sel_nchar_4000 FROM lyc_1407 WHERE col_nchar_4000 = ins_nchar_4000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nchar_4000 IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_nchar_4000,"|"   END IF

END MAIN
