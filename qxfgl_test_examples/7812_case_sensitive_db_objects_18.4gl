#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_idxname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,  
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	CREATE INDEX lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ON lyc_7812_table (row_number ASC)
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF


	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_idxname END IF	
	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "4. ",v_idxname END IF

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,  
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   LET v_prep = "CREATE INDEX lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ON lyc_7812_table (row_number ASC)" 
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ",v_idxname END IF	
	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ",v_idxname END IF

   DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (row_number INTEGER,  
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SQL
	CREATE INDEX lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz ON lyc_7812_table (row_number ASC)
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "11. ",v_idxname END IF	
	SELECT idxname INTO v_idxname FROM sysindexes WHERE idxname = "lyc_7812_table_index_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "12. ",v_idxname END IF

   DROP TABLE lyc_7812_table

END MAIN
