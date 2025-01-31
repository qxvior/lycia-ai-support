#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_row_number  INTEGER,
      v_char CHAR(80)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_7865_select_when_error_5
   CREATE TABLE lyc_7865_select_when_error_5
   (row_number INTEGER,
    col_char CHAR(80)
   )

   INSERT INTO lyc_7865_select_when_error_5 VALUES(1,"1st row")
   INSERT INTO lyc_7865_select_when_error_5 VALUES(2,"2nd row")
   INSERT INTO lyc_7865_select_when_error_5 VALUES(3,"3rd row")
   INSERT INTO lyc_7865_select_when_error_5 VALUES(4,"4th row")
   INSERT INTO lyc_7865_select_when_error_5 VALUES(5,"5th row")
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT row_number,CASE row_number WHEN 1 THEN "1st row" ELSE "NULL" END INTO v_row_number,v_char FROM lyc_7865_select_when_error_5 WHERE row_number = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ", v_row_number,"  ",v_char END IF

	SELECT row_number,CASE row_number WHEN 1 THEN "1st row" ELSE "NULL" END INTO v_row_number,v_char FROM lyc_7865_select_when_error_5 WHERE row_number = 5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ", v_row_number,"  ",v_char END IF

	SELECT row_number,
		  	 CASE row_number     
		       WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		    END
	INTO v_row_number,v_char
	FROM lyc_7865_select_when_error_5 WHERE row_number = 1
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ", v_row_number,"  ",v_char END IF

	SELECT row_number, 
		  	 CASE row_number
		       WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		    END
	INTO v_row_number,v_char
	FROM lyc_7865_select_when_error_5 WHERE row_number = 5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ", v_row_number,"  ",v_char END IF

	SELECT row_number,
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
			 	 WHEN 3 THEN "3rd row"
			 	 WHEN 4 THEN "4th row"
			 	 WHEN 5 THEN "5th row"
			 	 ELSE "NULL"
		  	 END
	INTO v_row_number,v_char
	FROM lyc_7865_select_when_error_5 WHERE row_number = 0
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ", v_row_number,"  ",v_char END IF

	SELECT row_number,
		  	 CASE row_number
		       WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		  	 END
	INTO v_row_number,v_char
	FROM lyc_7865_select_when_error_5
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ", v_row_number,"  ",v_char END IF

   DECLARE cursor_1 CURSOR FOR
	SELECT row_number, 
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		  	 END
	FROM lyc_7865_select_when_error_5 WHERE row_number = 1
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_2 CURSOR FOR
	SELECT row_number, 
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 ELSE "NULL"
		    END
	FROM lyc_7865_select_when_error_5 WHERE row_number = 5
   FOREACH cursor_2 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_3 CURSOR FOR
	SELECT row_number, 
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		    END
	FROM lyc_7865_select_when_error_5 ORDER BY row_number
   FOREACH cursor_3 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "10. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_4 CURSOR FOR
	SELECT row_number, 
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		    END
	FROM lyc_7865_select_when_error_5 WHERE row_number BETWEEN 2 AND 4 ORDER BY row_number
   FOREACH cursor_4 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "11. ", v_row_number,"  ",v_char END IF
   END FOREACH

   DECLARE cursor_5 CURSOR FOR
	SELECT row_number, 
		  	 CASE row_number
		  		 WHEN 1 THEN "1st row"
				 WHEN 2 THEN "2nd row" 
				 WHEN 3 THEN "3rd row"
				 WHEN 4 THEN "4th row"
				 WHEN 5 THEN "5th row"
				 ELSE "NULL"
		    END
	FROM lyc_7865_select_when_error_5 WHERE row_number = 0
   FOREACH cursor_5 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "12. ", v_row_number,"  ",v_char END IF
   END FOREACH

	DROP TABLE lyc_7865_select_when_error_5
END MAIN
   