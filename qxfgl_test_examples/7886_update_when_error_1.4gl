#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_row_number,
      v_int_init  INTEGER,
      v_char,
      v_char_init CHAR(80),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_7886_update_when_error_1
   CREATE TABLE lyc_7886_update_when_error_1
   (row_number INTEGER,
    col_char CHAR(80)
   )

   INSERT INTO lyc_7886_update_when_error_1 VALUES(1,"1st row")
   INSERT INTO lyc_7886_update_when_error_1 VALUES(2,"2nd row")
   INSERT INTO lyc_7886_update_when_error_1 VALUES(3,"3rd row")
   INSERT INTO lyc_7886_update_when_error_1 VALUES(4,"4th row")
   INSERT INTO lyc_7886_update_when_error_1 VALUES(5,"5th row")
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   DECLARE cursor_1 CURSOR FOR 
   	SELECT row_number,col_char FROM lyc_7886_update_when_error_1 ORDER BY row_number

	PREPARE p_update FROM "UPDATE lyc_7886_update_when_error_1 SET col_char = (CASE WHEN row_number = 1 THEN ""1st row updated 1"" ELSE ""NULL"" END) WHERE row_number = 1"
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_char END IF

	PREPARE p_update FROM "UPDATE lyc_7886_update_when_error_1 SET col_char = CASE WHEN row_number = 1 THEN ""1st row updated 2"" ELSE ""NULL"" END WHERE row_number = 5"
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_char END IF

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							 "(CASE WHEN row_number = 1 THEN ""1st row updated 3"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 3"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 3"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 3"" ",
									 "WHEN row_number = 5 THEN ""5th row updated 3"" ",
									 "ELSE ""NULL"" ",
							  "END) ",
					 "WHERE row_number = 1"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ",v_char END IF

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							  "CASE WHEN row_number = 1 THEN ""1st row updated 4"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 4"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 4"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 4"" ",
									 "WHEN row_number = 5 THEN ""5th row updated 4"" ",
									 "ELSE ""NULL"" ",
							  "END ",
					 "WHERE row_number = 5"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ",v_char END IF

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							 "(CASE WHEN row_number = 1 THEN ""1st row updated 5"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 5"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 5"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 5"" ",
									 "WHEN row_number = 5 THEN ""5th row updated 5"" ",
									 "ELSE ""NULL"" ",
							  "END) ",
					 "WHERE row_number = 0"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "11. ", v_row_number,"  ",v_char END IF
   END FOREACH

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							  "CASE WHEN row_number = 1 THEN ""1st row updated 6"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 6"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 6"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 6"" ",
									 "WHEN row_number = 5 THEN ""5th row updated 6"" ",
									 "ELSE ""NULL"" ",
							  "END"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "13. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "13. ", v_row_number,"  ",v_char END IF
   END FOREACH

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							 "(CASE WHEN row_number = 1 THEN ""1st row updated 7"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 7"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 7"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 7"" ",
									 "ELSE ""NULL"" ",
							  "END) ",
					 "WHERE row_number = 5"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "14. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "15. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "15. ", v_row_number,"  ",v_char END IF
   END FOREACH

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							  "CASE WHEN row_number = 1 THEN ""1st row updated 8"" ",
									 "WHEN row_number = 2 THEN ""2nd row updated 8"" ", 
									 "WHEN row_number = 3 THEN ""3rd row updated 8"" ",
									 "WHEN row_number = 4 THEN ""4th row updated 8"" ",
									 "WHEN row_number = 5 THEN ""5th row updated 8"" ",
									 "ELSE ""NULL"" ",
							  "END ",
					 "WHERE row_number BETWEEN 2 AND 4"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "16. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "17. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "17. ", v_row_number,"  ",v_char END IF
   END FOREACH

	LET v_int_init = 1 
	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = (CASE WHEN ",v_int_init," = 1 THEN ""1st row updated 9"" ELSE ""NULL"" END) WHERE row_number = 1"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "18. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "19. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "19. ",v_char END IF

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = CASE WHEN "||v_int_init||" = 5 THEN ""1st row updated 10"" ELSE ""NULL"" END WHERE row_number = 5" 
	PREPARE p_update FROM v_prep 
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "20. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
	SELECT col_char INTO v_char FROM lyc_7886_update_when_error_1 WHERE row_number = 5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "21. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "21. ",v_char END IF

	LET v_int_init = 5
	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							 "(CASE WHEN ",v_int_init," = 1 THEN ""1st row updated 11"" ",
									 "WHEN ",v_int_init," = 2 THEN ""2nd row updated 11"" ", 
									 "WHEN ",v_int_init," = 3 THEN ""3rd row updated 11"" ",
									 "WHEN ",v_int_init," = 4 THEN ""4th row updated 11"" ",
									 "ELSE ""NULL"" ",
							  "END) ",
					 "WHERE row_number = 5"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "22. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "23. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "23. ", v_row_number,"  ",v_char END IF
   END FOREACH

	LET v_prep = "UPDATE lyc_7886_update_when_error_1 SET col_char = ", 
							  "CASE WHEN "||v_int_init||" = 1 THEN ""1st row updated 12"" ",
									 "WHEN "||v_int_init||" = 2 THEN ""2nd row updated 12"" ", 
									 "WHEN "||v_int_init||" = 3 THEN ""3rd row updated 12"" ",
									 "WHEN "||v_int_init||" = 4 THEN ""4th row updated 12"" ",
									 "WHEN "||v_int_init||" = 5 THEN ""5th row updated 12"" ",
									 "ELSE ""NULL"" ",
							  "END ",
					 "WHERE row_number BETWEEN 2 AND 4"
	PREPARE p_update FROM v_prep
   EXECUTE p_update
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "24. SQLCA.SQLCODE = ",SQLCA.SQLCODE END IF
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "25. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "25. ", v_row_number,"  ",v_char END IF
   END FOREACH

	DROP TABLE lyc_7886_update_when_error_1
END MAIN
   