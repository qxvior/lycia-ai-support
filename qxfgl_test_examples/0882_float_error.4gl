#########################################################################################################################################
# Author Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_float_1,  sel_float_1  FLOAT(1), 
      ins_float_7,  sel_float_7  FLOAT(7), 
      ins_float_14, sel_float_14 FLOAT(14),
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_0882
   CREATE TABLE lyc_0882
   ( 
    col_float_1  FLOAT(1), 
    col_float_7  FLOAT(7),
    col_float_14 FLOAT(14)
   )   

   LET ins_float_1  = -9.99e-4
   IF ins_float_1       IS NULL   THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",ins_float_1 USING "-&.###############################################################################################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0882(col_float_1) VALUES(""",ins_float_1,""")"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_1 = NULL
   LET stmt = "SELECT col_float_1 FROM lyc_0882 WHERE col_float_1 = """,ins_float_1,""""
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 INTO sel_float_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_float_1       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_float_1 USING "-&.###############################################################################################################################################","|"   END IF

   LET ins_float_7  = -9.999999999e-60
   IF ins_float_7       IS NULL   THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",ins_float_7 USING "-&.###############################################################################################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0882(col_float_7) VALUES(""",ins_float_7,""")"
   PREPARE p_stmt_29 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_29
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_7 = NULL
   LET stmt = "SELECT col_float_7 FROM lyc_0882 WHERE col_float_7 = """,ins_float_7,""""
   PREPARE p_stmt_30 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_30 INTO sel_float_7
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_float_7       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_float_7 USING "-&.###############################################################################################################################################","|"   END IF

   LET ins_float_14  = -9.9999999999999e-128
   IF ins_float_14      IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",ins_float_14 USING "-&.###############################################################################################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0882(col_float_14) VALUES(""",ins_float_14,""")"
   PREPARE p_stmt_57 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_57
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_float_14 = NULL
   LET stmt = "SELECT col_float_14 FROM lyc_0882 WHERE col_float_14 = """,ins_float_14,""""
   PREPARE p_stmt_58 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_58 INTO sel_float_14
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_float_14      IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_float_14 USING "-&.###############################################################################################################################################","|"   END IF

END MAIN
