#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_char_1,    sel_char_1    CHAR(1),
      ins_char_80,   sel_char_80   CHAR(80)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1357
   CREATE TABLE lyc_1357
   (
    col_char_1    CHAR(1),
    col_char_80   CHAR(80)
   )        
   
   LET ins_char_1 = "A"
   INSERT INTO lyc_1357(col_char_1) VALUES(ins_char_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char_1 = NULL
   SELECT col_char_1 INTO sel_char_1 FROM lyc_1357 WHERE col_char_1 = ins_char_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char_1     IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_char_1,"|"   END IF

   LET ins_char_80 = "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaA"
   INSERT INTO lyc_1357(col_char_80) VALUES(ins_char_80)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char_80 = NULL
   SELECT col_char_80 INTO sel_char_80 FROM lyc_1357 WHERE col_char_80 = ins_char_80
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char_80     IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_char_80,"|"   END IF

END MAIN
