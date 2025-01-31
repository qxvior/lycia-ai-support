#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_tabname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   CREATE SYNONYM lyc_7812_synonym_1_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz FOR lyc_7812_table
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_1_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_1_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ",v_tabname END IF

	LET v_prep = "CREATE SYNONYM lyc_7812_synonym_2_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz FOR lyc_7812_table"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_2_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_2_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ",v_tabname END IF

	SQL
   CREATE SYNONYM lyc_7812_synonym_3_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz FOR lyc_7812_table
	END SQL

	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_3_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_synonym_3_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ",v_tabname END IF

   DROP TABLE lyc_7812_table

END MAIN
   