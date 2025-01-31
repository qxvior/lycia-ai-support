#########################################################################################################################################
# Author Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      ins_dec_16, sel_dec_16 DECIMAL(16),
      ins_dec_24, sel_dec_24 DECIMAL(24),
      ins_dec_32, sel_dec_32 DECIMAL(32),
      stmt CHAR(1024)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_0767
   CREATE TABLE lyc_0767
   ( 
    col_dec_16 DECIMAL(16), 
    col_dec_24 DECIMAL(24),
    col_dec_32 DECIMAL(32)
   )   

   LET ins_dec_16  = -9.999999999999999e-30
   IF ins_dec_16      IS NULL   THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",ins_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_16) VALUES(?)"
   PREPARE p_stmt_1  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1  USING ins_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL
   LET stmt = "SELECT col_dec_16 FROM lyc_0767 WHERE col_dec_16 = ?"
   PREPARE p_stmt_2  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2  USING ins_dec_16 INTO sel_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_16      IS NULL   THEN DISPLAY "6.  NULL"   ELSE DISPLAY "6.  |",sel_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF

   DELETE FROM lyc_0767
   LET ins_dec_16  =  9.999999999999999e+31
   IF ins_dec_16      IS NULL   THEN DISPLAY "7.  NULL"   ELSE DISPLAY "7.  |",ins_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_16) VALUES(?)"
   PREPARE p_stmt_3  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3  USING ins_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_16 = NULL
   LET stmt = "SELECT col_dec_16 FROM lyc_0767 WHERE col_dec_16 = ?"
   PREPARE p_stmt_4  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4  USING ins_dec_16 INTO sel_dec_16
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_16      IS NULL   THEN DISPLAY "12. NULL"   ELSE DISPLAY "12. |",sel_dec_16 USING "----------------------------------------------.##########################################################################","|"   END IF

   DELETE FROM lyc_0767
   LET ins_dec_24  = -9.99999999999999999999999e-31
   IF ins_dec_24      IS NULL   THEN DISPLAY "13. NULL"   ELSE DISPLAY "13. |",ins_dec_24 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_24) VALUES(?)"
   PREPARE p_stmt_5  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14 .SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_5  USING ins_dec_24
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_24 = NULL
   LET stmt = "SELECT col_dec_24 FROM lyc_0767 WHERE col_dec_24 = ?"
   PREPARE p_stmt_6  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_6  USING ins_dec_24 INTO sel_dec_24
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_24      IS NULL   THEN DISPLAY "18. NULL"   ELSE DISPLAY "18. |",sel_dec_24 USING "----------------------------------------------.##########################################################################","|"   END IF

   DELETE FROM lyc_0767
   LET ins_dec_24  =  9.99999999999999999999999e+32
   IF ins_dec_24      IS NULL   THEN DISPLAY "19. NULL"   ELSE DISPLAY "19. |",ins_dec_24 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_24) VALUES(?)"
   PREPARE p_stmt_7  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_7  USING ins_dec_24
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "21. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_24 = NULL
   LET stmt = "SELECT col_dec_24 FROM lyc_0767 WHERE col_dec_24 = ?"
   PREPARE p_stmt_8   FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_8   USING ins_dec_24 INTO sel_dec_24
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_24      IS NULL   THEN DISPLAY "24. NULL"   ELSE DISPLAY "24. |",sel_dec_24 USING "----------------------------------------------.##########################################################################","|"   END IF

   DELETE FROM lyc_0767
   LET ins_dec_32  = -9.9999999999999999999999999999999e-32
   IF ins_dec_32      IS NULL   THEN DISPLAY "25. NULL"   ELSE DISPLAY "25. |",ins_dec_32 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_32) VALUES(?)"
   PREPARE p_stmt_9   FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "26. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_9   USING ins_dec_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "27. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32 = NULL
   LET stmt = "SELECT col_dec_32 FROM lyc_0767 WHERE col_dec_32 = ?"
   PREPARE p_stmt_10  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "28. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_10  USING ins_dec_32 INTO sel_dec_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "29. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32      IS NULL   THEN DISPLAY "30. NULL"   ELSE DISPLAY "30. |",sel_dec_32 USING "----------------------------------------------.##########################################################################","|"   END IF

   DELETE FROM lyc_0767
   LET ins_dec_32  =  9.9999999999999999999999999999999e+33
   IF ins_dec_32      IS NULL   THEN DISPLAY "31. NULL"   ELSE DISPLAY "31. |",ins_dec_32 USING "----------------------------------------------.##########################################################################","|"   END IF
   LET stmt = "INSERT INTO lyc_0767(col_dec_32) VALUES(?)"
   PREPARE p_stmt_11  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "32. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_11  USING ins_dec_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "33. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_dec_32 = NULL
   LET stmt = "SELECT col_dec_32 FROM lyc_0767 WHERE col_dec_32 = ?"
   PREPARE p_stmt_12  FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "34. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_12  USING ins_dec_32 INTO sel_dec_32
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "35. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_dec_32      IS NULL   THEN DISPLAY "36. NULL"   ELSE DISPLAY "36. |",sel_dec_32 USING "----------------------------------------------.##########################################################################","|"   END IF

END MAIN
