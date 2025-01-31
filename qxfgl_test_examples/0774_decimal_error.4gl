#########################################################################################################################################
# Author Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_dec_1,  sel_dec_1  DECIMAL(1), 
      ins_dec_8,  sel_dec_8  DECIMAL(8),
      ins_dec_16, sel_dec_16 DECIMAL(16),
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0774
   CREATE TABLE lyc_0774
   ( 
    col_dec_1  DECIMAL(1), 
    col_dec_8  DECIMAL(8),
    col_dec_16 DECIMAL(16)
   )   

   LET ins_dec_1  = -9e-30
   IF ins_dec_1       IS NULL   THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",ins_dec_1 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_1) VALUES(""",ins_dec_1,""")"
   PREPARE p_stmt_5 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_1 = NULL
   LET stmt = "SELECT col_dec_1 FROM lyc_0774 WHERE col_dec_1 = """,ins_dec_1,""""
   PREPARE p_stmt_6 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6 INTO sel_dec_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_1       IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_dec_1 USING "----------------------------------------------.##########################################################################","|"   END IF

   LET ins_dec_1=9e+30
   IF ins_dec_1       IS NULL   THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",ins_dec_1 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_1) VALUES(""",ins_dec_1,""")"
   PREPARE p_stmt_7 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_7
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_1 = NULL
   LET stmt = "SELECT col_dec_1 FROM lyc_0774 WHERE col_dec_1 = """,ins_dec_1,""""
   PREPARE p_stmt_8 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_8 INTO sel_dec_1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_1       IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_dec_1 USING "----------------------------------------------.##########################################################################","|"   END IF

   LET ins_dec_8  = -9.9999999e-30
   IF ins_dec_8      IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",ins_dec_8 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_8) VALUES(""",ins_dec_8,""")"
   PREPARE p_stmt_65 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_65
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_8 = NULL
   LET stmt = "SELECT col_dec_8 FROM lyc_0774 WHERE col_dec_8 = """,ins_dec_8,""""
   PREPARE p_stmt_66 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_66 INTO sel_dec_8
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_8      IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_dec_8 USING "----------------------------------------------.##########################################################################","|"   END IF

   LET ins_dec_8  =  9.9999999e+30
   IF ins_dec_8      IS NULL   THEN DISPLAY "19. NULL"   ELSE DISPLAY "19. |",ins_dec_8 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_8) VALUES(""",ins_dec_8,""")"
   PREPARE p_stmt_67 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_67
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "21. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_8 = NULL
   LET stmt = "SELECT col_dec_8 FROM lyc_0774 WHERE col_dec_8 = """,ins_dec_8,""""
   PREPARE p_stmt_68 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_68 INTO sel_dec_8
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_8      IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_dec_8 USING "----------------------------------------------.##########################################################################","|"   END IF

   LET ins_dec_16  = -9.999999999999999e-30
   IF ins_dec_16      IS NULL   THEN DISPLAY "25. NULL"   ELSE DISPLAY "25. |",ins_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_16) VALUES(""",ins_dec_16,""")"
   PREPARE p_stmt_129 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_129
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "27. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL
   LET stmt = "SELECT col_dec_16 FROM lyc_0774 WHERE col_dec_16 = """,ins_dec_16,""""
   PREPARE p_stmt_130 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_130 INTO sel_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_16      IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF

   LET ins_dec_16  =  9.999999999999999e+30
   IF ins_dec_16      IS NULL   THEN DISPLAY "31. NULL"   ELSE DISPLAY "31. |",ins_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0774(col_dec_16) VALUES(""",ins_dec_16,""")"
   PREPARE p_stmt_131 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_131
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "33. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL
   LET stmt = "SELECT col_dec_16 FROM lyc_0774 WHERE col_dec_16 = """,ins_dec_16,""""
   PREPARE p_stmt_132 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_132 INTO sel_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "35. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_16      IS NULL   THEN DISPLAY "36. NULL"   ELSE DISPLAY "36. |",sel_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF

END MAIN
