#########################################################################################################################################
# Author Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_smallfloat_1,  sel_smallfloat_1  SMALLFLOAT, 
      ins_smallfloat_7,  sel_smallfloat_7  SMALLFLOAT, 
      ins_smallfloat_14, sel_smallfloat_14 SMALLFLOAT,
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_0889
   CREATE TABLE lyc_0889
   ( 
    col_smallfloat_1  SMALLFLOAT, 
    col_smallfloat_7  SMALLFLOAT,
    col_smallfloat_14 SMALLFLOAT
   )   

   LET ins_smallfloat_1  = -9.9e-4
   IF ins_smallfloat_1       IS NULL   THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",ins_smallfloat_1  USING "-&.#############################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0889(col_smallfloat_1) VALUES(""",ins_smallfloat_1,""")"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat_1 = NULL
   LET stmt = "SELECT col_smallfloat_1 FROM lyc_0889 WHERE col_smallfloat_1 = """,ins_smallfloat_1,""""
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 INTO sel_smallfloat_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_smallfloat_1       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_smallfloat_1  USING "-&.#############################################################################","|"   END IF

   LET ins_smallfloat_7  = -9.99e-18
   IF ins_smallfloat_7       IS NULL   THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",ins_smallfloat_7  USING "-&.#############################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0889(col_smallfloat_7) VALUES(""",ins_smallfloat_7,""")"
   PREPARE p_stmt_29 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_29
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat_7 = NULL
   LET stmt = "SELECT col_smallfloat_7 FROM lyc_0889 WHERE col_smallfloat_7 = """,ins_smallfloat_7,""""
   PREPARE p_stmt_30 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_30 INTO sel_smallfloat_7
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_smallfloat_7       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_smallfloat_7  USING "-&.#############################################################################","|"   END IF

   LET ins_smallfloat_14  = -9.99999e-37
   IF ins_smallfloat_14      IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",ins_smallfloat_14 USING "-&.#############################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0889(col_smallfloat_14) VALUES(""",ins_smallfloat_14,""")"
   PREPARE p_stmt_57 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_57
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_smallfloat_14 = NULL
   LET stmt = "SELECT col_smallfloat_14 FROM lyc_0889 WHERE col_smallfloat_14 = """,ins_smallfloat_14,""""
   PREPARE p_stmt_58 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_58 INTO sel_smallfloat_14
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_smallfloat_14      IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_smallfloat_14 USING "-&.#############################################################################","|"   END IF

END MAIN
