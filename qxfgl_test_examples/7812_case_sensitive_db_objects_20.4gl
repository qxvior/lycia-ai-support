#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_tabname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   LET v_prep = "DROP SEQUENCE lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   PREPARE p_drop FROM v_prep
   EXECUTE p_drop

   LET v_prep = "CREATE SEQUENCE lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_sequence_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_tabname END IF

	SQL
	DROP SEQUENCE lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
	END SQL
	SQL
	CREATE SEQUENCE lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_tabname END IF	
	SELECT tabname INTO v_tabname FROM systables WHERE tabname = "lyc_7812_sequence_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_tabname END IF

   LET v_prep = "DROP SEQUENCE lyc_7812_sequence_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   PREPARE p_drop FROM v_prep
   EXECUTE p_drop

END MAIN
