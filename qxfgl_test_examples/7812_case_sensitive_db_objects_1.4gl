#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_tabname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   DROP TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   DROP TABLE lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
   CREATE TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   (row_number INTEGER,
    col_char CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_tabname END IF

   DROP TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   DROP TABLE lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
	LET v_prep = 
	"CREATE TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz",
   "(row_number INTEGER,",
   "col_char CHAR(80)",
   ")"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_tabname END IF

   DROP TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   DROP TABLE lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz
	SQL
   CREATE TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   (row_number INTEGER,
    col_char CHAR(80)
   )
	END SQL
	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "7. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables where tabname = "lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "8. ",v_tabname END IF

   DROP TABLE lyc_7812_table_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
   DROP TABLE lyc_7812_table_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz

END MAIN
   