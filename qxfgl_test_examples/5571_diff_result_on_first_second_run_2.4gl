DATABASE stores

MAIN
   DEFINE
      ins_text_m,   sel_text_m   TEXT,
      stmt                       CHAR(1024)

   LOCATE ins_text_m IN MEMORY
   LOCATE sel_text_m IN MEMORY

   WHENEVER ANY ERROR CONTINUE 
   DROP TABLE tab_5571
   CREATE TABLE tab_5571
   (col_text TEXT)

   LET ins_text_m = NULL
   LET stmt = "INSERT INTO tab_5571(col_text) VALUES(?)"
   PREPARE p_stmt_1 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_1 USING ins_text_m
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_text_m = NULL
   LET stmt = "SELECT col_text FROM tab_5571 WHERE col_text IS NULL"
   PREPARE p_stmt_2 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_2 INTO sel_text_m
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_text_m       IS NULL   THEN DISPLAY "5.  NULL"   ELSE DISPLAY "5.  |",sel_text_m,"|"   END IF

   DELETE FROM tab_5571
   LET ins_text_m = "PASSED"
   LET stmt = "INSERT INTO tab_5571(col_text) VALUES(?)"
   PREPARE p_stmt_3 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_3 USING ins_text_m
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   LET sel_text_m = NULL
   LET stmt = "SELECT col_text FROM tab_5571"
   PREPARE p_stmt_4 FROM stmt
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   EXECUTE p_stmt_4 INTO sel_text_m
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   IF sel_text_m       IS NULL   THEN DISPLAY "10. NULL"   ELSE DISPLAY "10. |",sel_text_m,"|"   END IF

   DROP TABLE tab_5571
   CALL fgl_getkey()
END MAIN