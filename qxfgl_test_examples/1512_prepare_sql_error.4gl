#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_char, sel_char CHAR(80),
      stmt CHAR(1024)

   WHENEVER ANY ERROR CONTINUE
   DROP TABLE lyc_1512
   CREATE TABLE lyc_1512
   (col_char CHAR(80)
   )

   LET ins_char = """"""
   LET stmt = "INSERT INTO lyc_1512 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_1  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_1512 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_2  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2  INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_char CLIPPED,"|"   END IF

   DELETE FROM lyc_1512
   LET ins_char = "\"\""
   LET stmt = "INSERT INTO lyc_1512 VALUES(""",ins_char CLIPPED,""")"
   PREPARE p_stmt_3  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_char = NULL
   LET stmt = "SELECT col_char FROM lyc_1512 WHERE col_char = """,ins_char CLIPPED,""""
   PREPARE p_stmt_4  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4  INTO sel_char
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_char IS NULL   THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",sel_char CLIPPED,"|"   END IF

END MAIN
