#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_col1,
      v_par1,
      v_par2 INTEGER,
      v_prep VARCHAR(255)

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_7810_declare_error_1
   DROP TABLE lyc_7810_declare_error_2
   CREATE TABLE lyc_7810_declare_error_1
   (col1 INTEGER,
    col2 INTEGER,
    col3 INTEGER,
    col4 INTEGER
   )
   CREATE TABLE lyc_7810_declare_error_2
   (col1 INTEGER,
    col2 INTEGER
   )

	PREPARE p_select FROM "SELECT col1 FROM lyc_7810_declare_error_1 WHERE col2 = col4 AND col2 = ? AND col3 = (SELECT col1 FROM lyc_7810_declare_error_2 WHERE col2 = ?)"
	DECLARE cursor_1 CURSOR FOR p_select

	LET v_prep = "SELECT col1 FROM lyc_7810_declare_error_1 WHERE col2 = col4 AND col2 = ? AND col3 = (SELECT col1 FROM lyc_7810_declare_error_2 WHERE col2 = ?)" 
	PREPARE p_select FROM v_prep
	DECLARE cursor_2 CURSOR FOR p_select

	DECLARE cursor_3 CURSOR FOR
		SELECT col1 FROM lyc_7810_declare_error_1 WHERE col2 = col4 AND col2 = ? AND col3 = (SELECT col1 FROM lyc_7810_declare_error_2 WHERE col2 = ?) 

   INSERT INTO lyc_7810_declare_error_1 VALUES(1,2,1,2)
   INSERT INTO lyc_7810_declare_error_1 VALUES(2,2,2,2)
   INSERT INTO lyc_7810_declare_error_1 VALUES(3,2,2,2)
   INSERT INTO lyc_7810_declare_error_1 VALUES(4,2,4,2)
   INSERT INTO lyc_7810_declare_error_2 VALUES(1,1)
   INSERT INTO lyc_7810_declare_error_2 VALUES(2,2)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	LET v_par1 = 2
	LET v_par2 = 2
	LET v_col1 = NULL
   FOREACH cursor_1 USING v_par1,v_par2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ", v_col1 END IF
   END FOREACH

	LET v_col1 = NULL
   FOREACH cursor_1 USING 2,2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ", v_col1 END IF
   END FOREACH

	LET v_col1 = NULL
   FOREACH cursor_2 USING v_par1,v_par2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ", v_col1 END IF
   END FOREACH

	LET v_col1 = NULL
   FOREACH cursor_2 USING 2,2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ", v_col1 END IF
   END FOREACH

	LET v_col1 = NULL
   FOREACH cursor_3 USING v_par1,v_par2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ", v_col1 END IF
   END FOREACH

	LET v_col1 = NULL
   FOREACH cursor_3 USING 2,2 INTO v_col1   
      IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ", v_col1 END IF
   END FOREACH

	DROP TABLE lyc_7810_declare_error_1
   DROP TABLE lyc_7810_declare_error_2

END MAIN
