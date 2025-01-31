#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_trigname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   LET v_prep = "CREATE TRIGGER lyc_7812_table_trigger_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ",
                "UPDATE OF row_number ON lyc_7812_table AFTER (UPDATE lyc_7812_table SET row_number = row_number + 1)"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT trigname INTO v_trigname FROM systriggers WHERE trigname = "lyc_7812_table_trigger_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_trigname END IF	
	SELECT trigname INTO v_trigname FROM systriggers WHERE trigname = "lyc_7812_table_trigger_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ",v_trigname END IF

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SQL
		CREATE TRIGGER lyc_7812_table_trigger_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
      UPDATE OF row_number ON lyc_7812_table AFTER (UPDATE lyc_7812_table SET row_number = row_number + 1)
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT trigname INTO v_trigname FROM systriggers WHERE trigname = "lyc_7812_table_trigger_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ",v_trigname END IF	
	SELECT trigname INTO v_trigname FROM systriggers WHERE trigname = "lyc_7812_table_trigger_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ",v_trigname END IF

   DROP TABLE lyc_7812_table

END MAIN
