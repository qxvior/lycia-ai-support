#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_lvarchar,      sel_lvarchar       LVARCHAR,  
      ins_lvarchar_1,    sel_lvarchar_1     LVARCHAR(1),
      ins_lvarchar_8000, sel_lvarchar_8000  LVARCHAR(8000),
      i    INTEGER,
      stmt CHAR(10000)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0436
   CREATE TABLE lyc_0436
   (col_lvarchar      LVARCHAR,
    col_lvarchar_1    LVARCHAR(1),
    col_lvarchar_8000 LVARCHAR(8000)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "0.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   FOR i = 1 TO 64
      LET ins_lvarchar = ins_lvarchar CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   DELETE FROM lyc_0436
   LET stmt = "INSERT INTO lyc_0436(col_lvarchar) VALUES(?)"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1 USING ins_lvarchar
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar = NULL
   LET stmt = "SELECT col_lvarchar FROM lyc_0436 WHERE col_lvarchar = ?"
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2 USING ins_lvarchar INTO sel_lvarchar
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar       IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_lvarchar,"|"   END IF

   LET ins_lvarchar_1 = "a"
   DELETE FROM lyc_0436
   LET stmt = "INSERT INTO lyc_0436(col_lvarchar_1) VALUES(?)"
   PREPARE p_stmt_3 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3 USING ins_lvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_1 = NULL
   LET stmt = "SELECT col_lvarchar_1 FROM lyc_0436 WHERE col_lvarchar_1 = ?"
   PREPARE p_stmt_4 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4 USING ins_lvarchar_1 INTO sel_lvarchar_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_1       IS NULL   THEN DISPLAY "9.  NULL"   ELSE DISPLAY "9.  |",sel_lvarchar_1,"|"   END IF

   FOR i = 1 TO 32
      LET ins_lvarchar_8000 = ins_lvarchar_8000 CLIPPED,"aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"
   END FOR      
   DELETE FROM lyc_0436
   LET stmt = "INSERT INTO lyc_0436(col_lvarchar_8000) VALUES(?)"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5 USING ins_lvarchar_8000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_lvarchar_8000 = NULL
   LET stmt = "SELECT col_lvarchar_8000 FROM lyc_0436 WHERE col_lvarchar_8000 = ?"
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 USING ins_lvarchar_8000 INTO sel_lvarchar_8000
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_lvarchar_8000       IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",sel_lvarchar_8000,"|"   END IF

END MAIN
