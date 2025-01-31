#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_colname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7812_table
   CREATE TABLE lyc_7812_table
   (
    lyc_7812_column_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz CHAR(80)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   CREATE VIEW lyc_7812_view AS SELECT * FROM lyc_7812_table 
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	DECLARE cur CURSOR FOR
		SELECT syscolumns.colname 
		FROM syscolumns,systables
		WHERE syscolumns.tabid = systables.tabid AND
				systables.tabname = "lyc_7812_view" 
		ORDER BY syscolumns.colno

	FOREACH cur INTO v_colname
   	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_colname END IF
	END FOREACH

   DROP TABLE lyc_7812_table
	LET v_prep = 
	"CREATE TABLE lyc_7812_table",
   "(",
   "lyc_7812_column_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz CHAR(80)",
   ")"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	LET v_prep = "CREATE VIEW lyc_7812_view AS SELECT * FROM lyc_7812_table"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	FOREACH cur INTO v_colname
   	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_colname END IF
	END FOREACH

   DROP TABLE lyc_7812_table
	SQL
   CREATE TABLE lyc_7812_table
   (
	 lyc_7812_column_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz CHAR(80)
   )
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "7. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SQL
   CREATE VIEW lyc_7812_view AS SELECT * FROM lyc_7812_table 
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "8. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	FOREACH cur INTO v_colname
   	IF SQLCA.SQLCODE <> 0 THEN DISPLAY "9. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "9. ",v_colname END IF
	END FOREACH

   DROP TABLE lyc_7812_table

END MAIN
