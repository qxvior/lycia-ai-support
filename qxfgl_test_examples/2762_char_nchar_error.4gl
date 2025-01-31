#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_char_1,     sel_char_1     CHAR(1),
      ins_char_80,    sel_char_80    CHAR(80),
      ins_nchar_1,    sel_nchar_1    NCHAR(1),
      ins_nchar_80,   sel_nchar_80   NCHAR(80)
{     # !!! with such a declarations, the error does not occur !!!
      ins_char_1,     sel_char_1     CHAR(2),
      ins_char_80,    sel_char_80    CHAR(81),
      ins_nchar_1,    sel_nchar_1    NCHAR(2),
      ins_nchar_80,   sel_nchar_80   NCHAR(81)
}
   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_2762
   CREATE TABLE lyc_2762
   (
    col_char_1     CHAR(1),
    col_char_80    CHAR(80),
    col_nchar_1    NCHAR(1),
    col_nchar_80   NCHAR(80)
   )        
   
   LET ins_char_1 = "A"
   INSERT INTO lyc_2762(col_char_1) VALUES(ins_char_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char_1 = NULL
   SELECT col_char_1 INTO sel_char_1 FROM lyc_2762 WHERE col_char_1 = ins_char_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char_1     IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_char_1,"|"   END IF

   LET ins_char_80 = "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaA"
   INSERT INTO lyc_2762(col_char_80) VALUES(ins_char_80)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char_80 = NULL
   SELECT col_char_80 INTO sel_char_80 FROM lyc_2762 WHERE col_char_80 = ins_char_80
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char_80     IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_char_80,"|"   END IF

   LET ins_nchar_1 = "A"
   INSERT INTO lyc_2762(col_nchar_1) VALUES(ins_nchar_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nchar_1 = NULL
   SELECT col_nchar_1 INTO sel_nchar_1 FROM lyc_2762 WHERE col_nchar_1 = ins_nchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nchar_1     IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_nchar_1,"|"   END IF

   LET ins_nchar_80 = "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaA"
   INSERT INTO lyc_2762(col_nchar_80) VALUES(ins_nchar_80)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nchar_80 = NULL
   SELECT col_nchar_80 INTO sel_nchar_80 FROM lyc_2762 WHERE col_nchar_80 = ins_nchar_80
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nchar_80     IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_nchar_80,"|"   END IF

END MAIN
