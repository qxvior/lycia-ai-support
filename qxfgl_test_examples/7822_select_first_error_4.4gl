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
   DROP TABLE lyc_7822_select_first_error_4
   CREATE TABLE lyc_7822_select_first_error_4
   (row_number INTEGER,
    col_char CHAR(80)
   )

   INSERT INTO lyc_7822_select_first_error_4 VALUES(1,"1st row")
   INSERT INTO lyc_7822_select_first_error_4 VALUES(2,"2nd row")
   INSERT INTO lyc_7822_select_first_error_4 VALUES(3,"3rd row")
   INSERT INTO lyc_7822_select_first_error_4 VALUES(4,"4th row")
   INSERT INTO lyc_7822_select_first_error_4 VALUES(5,"5th row")
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   SELECT FIRST 1 * INTO rec_first.* FROM lyc_7822_select_first_error_4 ORDER BY row_number
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ", rec_first.v_row_number,"  ",rec_first.v_char END IF

	SELECT FIRST 10 * INTO rec_first.* FROM lyc_7822_select_first_error_4 WHERE row_number = 5 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ", rec_first.v_row_number,"  ",rec_first.v_char END IF

   SELECT FIRST 2 * INTO rec_first.* FROM lyc_7822_select_first_error_4 ORDER BY row_number
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ", rec_first.v_row_number,"  ",rec_first.v_char END IF

   DECLARE cursor_1 CURSOR FOR SELECT FIRST 1 * FROM lyc_7822_select_first_error_4 ORDER BY row_number
   FOREACH cursor_1 INTO rec_first.*
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ", rec_first.v_row_number,"  ",rec_first.v_char END IF
   END FOREACH

   DECLARE cursor_2 CURSOR FOR SELECT FIRST 10 * FROM lyc_7822_select_first_error_4 WHERE row_number = 5
   FOREACH cursor_2 INTO rec_first.*
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ", rec_first.v_row_number,"  ",rec_first.v_char END IF
   END FOREACH

   DECLARE cursor_3 CURSOR FOR SELECT FIRST 2 * FROM lyc_7822_select_first_error_4 ORDER BY row_number
   FOREACH cursor_3 INTO rec_first.*
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ", rec_first.v_row_number,"  ",rec_first.v_char END IF
   END FOREACH

   DECLARE cursor_4 CURSOR FOR SELECT FIRST 5 * FROM lyc_7822_select_first_error_4 ORDER BY row_number
   FOREACH cursor_4 INTO rec_first.*
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ", rec_first.v_row_number,"  ",rec_first.v_char END IF
   END FOREACH

   DECLARE cursor_5 CURSOR FOR SELECT FIRST 10 * FROM lyc_7822_select_first_error_4 ORDER BY row_number
   FOREACH cursor_5 INTO rec_first.*
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ", rec_first.v_row_number,"  ",rec_first.v_char END IF
   END FOREACH

	DROP TABLE lyc_7822_select_first_error_4
END MAIN
   