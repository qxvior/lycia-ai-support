#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
		v_username VARCHAR(32),
		v_prep CHAR(2048)

   WHENEVER ERROR CONTINUE

   LET v_prep = "DROP ROLE ABCDEFGHIJKLMNOPabcdefghijklmnop"
   PREPARE p_drop FROM v_prep
   EXECUTE p_drop

   LET v_prep = "CREATE ROLE ABCDEFGHIJKLMNOPabcdefghijklmnop"
   PREPARE p_create FROM v_prep
   EXECUTE p_create
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "1. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT username INTO v_username FROM sysusers WHERE username = "ABCDEFGHIJKLMNOPabcdefghijklmnop"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "2. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "2. ",v_username END IF	
	SELECT username INTO v_username FROM sysusers WHERE username = "abcdefghijklmnopabcdefghijklmnop"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "3. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "3. ",v_username END IF

	SQL
	DROP ROLE ABCDEFGHIJKLMNOPabcdefghijklmnop
	END SQL
	SQL
	CREATE ROLE ABCDEFGHIJKLMNOPabcdefghijklmnop
	END SQL
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "4. SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

	SELECT username INTO v_username FROM sysusers WHERE username = "ABCDEFGHIJKLMNOPabcdefghijklmnop"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "5. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "5. ",v_username END IF	
	SELECT username INTO v_username FROM sysusers WHERE username = "abcdefghijklmnopabcdefghijklmnop"
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "6. SQLCA.SQLCODE = ",SQLCA.SQLCODE ELSE DISPLAY "6. ",v_username END IF

   LET v_prep = "DROP ROLE ABCDEFGHIJKLMNOPabcdefghijklmnop"
   PREPARE p_drop FROM v_prep
   EXECUTE p_drop

END MAIN
