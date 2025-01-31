#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_row_number  INTEGER,
      v_char CHAR(80),
      rec_insert RECORD
                  r_row_number  INTEGER,
                  r_char CHAR(80)
                END RECORD

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_7811_insert_error
   CREATE TABLE lyc_7811_insert_error
   (row_number INTEGER,
    col_char CHAR(80)
   )

	LET rec_insert.r_row_number = 1
	LET rec_insert.r_char = "1st row" 
	INSERT INTO lyc_7811_insert_error VALUES(rec_insert.*)
	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	LET rec_insert.r_row_number = 2
	LET rec_insert.r_char = "2nd row" 
	INSERT INTO lyc_7811_insert_error VALUES rec_insert.*
	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   DECLARE cursor_1 CURSOR FOR 
   	SELECT * FROM lyc_7811_insert_error ORDER BY row_number
   FOREACH cursor_1 INTO v_row_number,v_char
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ", v_row_number,"  ",v_char END IF
   END FOREACH

	DROP TABLE lyc_7811_insert_error
END MAIN
   