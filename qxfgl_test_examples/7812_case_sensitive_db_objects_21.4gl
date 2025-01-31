#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_procname VARCHAR(128),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

	PREPARE p_drop FROM "DROP PROCEDURE lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   EXECUTE p_drop

   CREATE PROCEDURE FROM "sp_7812_case_sensitive_db_objects_21.sql"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT procname INTO v_procname FROM sysprocedures WHERE procname = "lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ",v_procname END IF	
	SELECT procname INTO v_procname FROM sysprocedures WHERE procname = "lyc_7812_stored_procedure_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_procname END IF

	SQL
	DROP PROCEDURE lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz
	END SQL
	SQL
		CREATE PROCEDURE lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz()
   		RETURNING CHAR(20)

   		RETURN "Hello world!"; 

		END PROCEDURE
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT procname INTO v_procname FROM sysprocedures WHERE procname = "lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_procname END IF	
	SELECT procname INTO v_procname FROM sysprocedures WHERE procname = "lyc_7812_stored_procedure_abcdefghijklmnopqrstuvwxyzabcdefghijklmnopqrstuvwxyz"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_procname END IF

	PREPARE p_drop FROM "DROP PROCEDURE lyc_7812_stored_procedure_ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz"
   EXECUTE p_drop

END MAIN
