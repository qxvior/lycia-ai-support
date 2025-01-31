#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_char_8000, sel_char_8000  CHAR(8000),
--      ins_char_8000, sel_char_8000  CHAR(2656),  --> error -999 doesn't appear
      i INTEGER

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1607
   CREATE TABLE lyc_1607
   (
    col_char_8000 CHAR(8000)
   )

   FOR i = 1 TO 32
      LET ins_char_8000 = ins_char_8000 CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      

   INSERT INTO lyc_1607 VALUES(ins_char_8000)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char_8000 = NULL
   SELECT col_char_8000 INTO sel_char_8000 FROM lyc_1607 WHERE col_char_8000 = ins_char_8000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char_8000 IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_char_8000,"|"   END IF

END MAIN
