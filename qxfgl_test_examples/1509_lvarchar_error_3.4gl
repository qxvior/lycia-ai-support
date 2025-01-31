#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar,      sel_lvarchar       LVARCHAR,  
      ins_lvarchar_1,    sel_lvarchar_1     LVARCHAR(1),
      ins_lvarchar_4000, sel_lvarchar_4000  LVARCHAR(4000),
      i    INTEGER,
      stmt CHAR(10000)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1509
   CREATE TABLE lyc_1509
   (col_lvarchar      LVARCHAR,
    col_lvarchar_1    LVARCHAR(1),
    col_lvarchar_4000 LVARCHAR(4000)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "0.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   FOR i = 1 TO 64
      LET ins_lvarchar = ins_lvarchar CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   DELETE FROM lyc_1509
   LET stmt = "INSERT INTO lyc_1509(col_lvarchar) VALUES(?)"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1 USING ins_lvarchar
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar = NULL
   LET stmt = "SELECT col_lvarchar FROM lyc_1509 WHERE col_lvarchar = ?"
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2 USING ins_lvarchar INTO sel_lvarchar
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar       IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_lvarchar,"|"   END IF

   LET ins_lvarchar_1 = "a"
   DELETE FROM lyc_1509
   LET stmt = "INSERT INTO lyc_1509(col_lvarchar_1) VALUES(?)"
   PREPARE p_stmt_3 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3 USING ins_lvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_1 = NULL
   LET stmt = "SELECT col_lvarchar_1 FROM lyc_1509 WHERE col_lvarchar_1 = ?"
   PREPARE p_stmt_4 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4 USING ins_lvarchar_1 INTO sel_lvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_1       IS NULL   THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",sel_lvarchar_1,"|"   END IF

   FOR i = 1 TO 16
      LET ins_lvarchar_4000 = ins_lvarchar_4000 CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   DELETE FROM lyc_1509
   LET stmt = "INSERT INTO lyc_1509(col_lvarchar_4000) VALUES(?)"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5 USING ins_lvarchar_4000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_4000 = NULL
   LET stmt = "SELECT col_lvarchar_4000 FROM lyc_1509 WHERE col_lvarchar_4000 = ?"
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 USING ins_lvarchar_4000 INTO sel_lvarchar_4000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_4000       IS NULL   THEN DISPLAY "15. NULL"   ELSE DISPLAY "15. |",sel_lvarchar_4000,"|"   END IF

END MAIN
