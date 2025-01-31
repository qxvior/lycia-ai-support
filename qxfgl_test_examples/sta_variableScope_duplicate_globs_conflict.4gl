################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global_conflict.4gl"


################################################################################
# FUNCTION local_scope_with_global_conflict()
#
#
################################################################################
FUNCTION local_scope_with_global_conflict()
	DEFINE var1,var3 SMALLINT  -- use var2 from globals NOTE: var2 in the duplicate globals is of different type
	CALL varReport("------------------------------------------------","","")
	CALL varReport("Note:var2 was defined on a global scope twice with 2 dataTypes (int and smallint)","","")

	CALL varReport("------------------------------------------------","","")


	CALL varReport("In local_scope_with_global_conflict() - BEFORE LET","","")
	CALL varReport("local var1=", var1, "LOCAL")
	CALL varReport("loacl var2=", var2, "GLOBAL")
	CALL varReport("local var3=", var3, "LOCAL")
	
	LET var1 = 100
	LET var2 = 200
	LET var3 = 300
	
	CALL varReport("In local_scope_with_global_conflict() - AFTER LET","")
	CALL varReport("local var1=", var1, "LOCAL")
	CALL varReport("loacl var2=", var2, "GLOBAL")
	CALL varReport("local var3=", var3, "LOCAL")
	CALL varReport("------------------------------------------------","")
	
END FUNCTION
################################################################################
# END FUNCTION local_scope_with_global_conflict()
################################################################################