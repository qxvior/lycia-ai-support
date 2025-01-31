#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar_2,    sel_lvarchar_2     LVARCHAR(2),
      ins_lvarchar_8000, sel_lvarchar_8000  LVARCHAR(8000),
      i INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1627
   CREATE TABLE lyc_1627
   (
    col_lvarchar_2    LVARCHAR(2),
    col_lvarchar_8000 LVARCHAR(8000)
   )

   LET ins_lvarchar_2 = "ä"
   INSERT INTO lyc_1627(col_lvarchar_2) VALUES(ins_lvarchar_2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_2 = NULL
   SELECT col_lvarchar_2 INTO sel_lvarchar_2 FROM lyc_1627 WHERE col_lvarchar_2 = ins_lvarchar_2
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_2     IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_lvarchar_2,"|"   END IF

   FOR i = 1 TO 16
      LET ins_lvarchar_8000 = ins_lvarchar_8000 CLIPPED,"ääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääää"
   END FOR      
   INSERT INTO lyc_1627(col_lvarchar_8000) VALUES(ins_lvarchar_8000)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_8000 = NULL
   SELECT col_lvarchar_8000 INTO sel_lvarchar_8000 FROM lyc_1627 WHERE col_lvarchar_8000 = ins_lvarchar_8000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_8000 IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_lvarchar_8000,"|"   END IF

END MAIN