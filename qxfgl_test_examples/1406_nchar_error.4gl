#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_nchar_1,    sel_nchar_1    NCHAR(1),
      ins_nchar_80,   sel_nchar_80   NCHAR(80)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1406
   CREATE TABLE lyc_1406
   (
    col_nchar_1    NCHAR(1),
    col_nchar_80   NCHAR(80)
   )        
   
   LET ins_nchar_1 = "A"
   INSERT INTO lyc_1406(col_nchar_1) VALUES(ins_nchar_1)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nchar_1 = NULL
   SELECT col_nchar_1 INTO sel_nchar_1 FROM lyc_1406 WHERE col_nchar_1 = ins_nchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nchar_1     IS NULL   THEN DISPLAY "3.  NULL"   ELSE DISPLAY "3.  |",sel_nchar_1,"|"   END IF

   LET ins_nchar_80 = "AaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaA"
   INSERT INTO lyc_1406(col_nchar_80) VALUES(ins_nchar_80)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_nchar_80 = NULL
   SELECT col_nchar_80 INTO sel_nchar_80 FROM lyc_1406 WHERE col_nchar_80 = ins_nchar_80
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_nchar_80     IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_nchar_80,"|"   END IF

END MAIN
