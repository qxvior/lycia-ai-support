#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_row_number  INTEGER,
      v_char CHAR(80),
      rec_first RECORD
                  v_row_number  INTEGER,
                  v_char CHAR(80)
                END RECORD

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_7822_select_first_error_5
   CREATE TABLE lyc_7822_select_first_error_5
   (row_number INTEGER,
    col_char CHAR(80)
   )

   INSERT INTO lyc_7822_select_first_error_5 VALUES(1,"1st row")
   INSERT INTO lyc_7822_select_first_error_5 VALUES(2,"2nd row")
   INSERT INTO lyc_7822_select_first_error_5 VALUES(3,"3rd row")
   INSERT INTO lyc_7822_select_first_error_5 VALUES(4,"4th row")
   INSERT INTO lyc_7822_select_first_error_5 VALUES(5,"5th row")
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   SQL SELECT FIRST 1 row_number, col_char INTO $v_row_number,$v_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ", v_row_number,"  ",v_char END IF

   SQL SELECT FIRST 10 row_number, col_char INTO $v_row_number,$v_char FROM lyc_7822_select_first_error_5 WHERE row_number = 5 END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ", v_row_number,"  ",v_char END IF

   SQL SELECT FIRST 2 row_number, col_char INTO $v_row_number,$v_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ", v_row_number,"  ",v_char END IF

   DECLARE cursor_1 CURSOR FOR SQL SELECT FIRST 1 row_number, col_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_2 CURSOR FOR SQL SELECT FIRST 10 row_number, col_char FROM lyc_7822_select_first_error_5 WHERE row_number = 5 END SQL
   FOREACH cursor_2 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_3 CURSOR FOR SQL SELECT FIRST 2 row_number, col_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   FOREACH cursor_3 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_4 CURSOR FOR SQL SELECT FIRST 5 row_number, col_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   FOREACH cursor_4 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_5 CURSOR FOR SQL SELECT FIRST 10 row_number, col_char INTO $v_row_number,$v_char FROM lyc_7822_select_first_error_5 ORDER BY row_number END SQL
   FOREACH cursor_5 
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ", v_row_number,"  ",v_char END IF
   END FOREACH

	DROP TABLE lyc_7822_select_first_error_5
END MAIN
   