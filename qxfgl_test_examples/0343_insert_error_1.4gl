#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_char, sel_char CHAR(255),
      stmt               CHAR(1024)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_0343
   CREATE TABLE lyc_0343
   (col_char CHAR(255))

   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET ins_char = """"""
   LET sel_char = NULL
   LET stmt = "INSERT INTO lyc_0343 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_0343 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2 INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  ",sel_char   END IF

   LET ins_char = " """" """" "
   LET sel_char = NULL
   LET stmt = "INSERT INTO lyc_0343 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_3 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_0343 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_4 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4 INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "11. NULL"   ELSE DISPLAY "11. ",sel_char   END IF
   
   DELETE FROM lyc_0343
   LET ins_char = '""""'
   LET sel_char = NULL
   LET stmt = "INSERT INTO lyc_0343 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_0343 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "16. NULL"   ELSE DISPLAY "16. ",sel_char   END IF

   LET ins_char = ' """" """" '
   LET sel_char = NULL
   LET stmt = "INSERT INTO lyc_0343 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_7 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_7
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "18. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF

   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_0343 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_8 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_8 INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "21. NULL"   ELSE DISPLAY "21. ",sel_char   END IF

END MAIN
