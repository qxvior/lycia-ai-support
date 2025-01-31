#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_constrname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number SERIAL PRIMARY KEY CONSTRAINT lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,  
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ",v_constrname END IF	
	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_constrname END IF

   DROP TABLE lyc_7812_table
   LET v_prep = 
	"CREATE TABLE lyc_7812_table ",
   "(row_number SERIAL PRIMARY KEY CONSTRAINT lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,",
   " col_char CHAR(80)",
   ")"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_constrname END IF	
	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_constrname END IF

   DROP TABLE lyc_7812_table
	SQL
   CREATE TABLE lyc_7812_table
   (row_number SERIAL PRIMARY KEY CONSTRAINT lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz,
    col_char CHAR(80)
   )
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ",v_constrname END IF	
	SELECT constrname INTO v_constrname FROM sysconstraints WHERE constrname = "lyc_7812_table_column_row_number_primary_key_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ",v_constrname END IF

   DROP TABLE lyc_7812_table

END MAIN
