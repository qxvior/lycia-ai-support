#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_nvarchar_2,    sel_nvarchar_2     NVARCHAR(2),
      ins_nvarchar_4000, sel_nvarchar_4000  NVARCHAR(4000),
      i INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1626
   CREATE TABLE lyc_1626
   (
    col_nvarchar_2    NVARCHAR(2),
    col_nvarchar_4000 NVARCHAR(4000)
   )

   LET ins_nvarchar_2 = "ä"
   INSERT INTO lyc_1626(col_nvarchar_2) VALUES(ins_nvarchar_2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nvarchar_2 = NULL
   SELECT col_nvarchar_2 INTO sel_nvarchar_2 FROM lyc_1626 WHERE col_nvarchar_2 = ins_nvarchar_2
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nvarchar_2     IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_nvarchar_2,"|"   END IF

   FOR i = 1 TO 8
      LET ins_nvarchar_4000 = ins_nvarchar_4000 CLIPPED,"ääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääääää"
   END FOR      
   INSERT INTO lyc_1626(col_nvarchar_4000) VALUES(ins_nvarchar_4000)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nvarchar_4000 = NULL
   SELECT col_nvarchar_4000 INTO sel_nvarchar_4000 FROM lyc_1626 WHERE col_nvarchar_4000 = ins_nvarchar_4000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nvarchar_4000 IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_nvarchar_4000,"|"   END IF

END MAIN