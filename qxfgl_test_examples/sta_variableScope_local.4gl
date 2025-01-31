################################################################################
# NOTE
# var1,var2,var3 BIGINT   declared in global scope - YES
# var1,var2,var3 INT      declared in module scope - NO
# var1,var2 SMALLINT declared in local scope  - YES
################################################################################

################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

################################################################################
# Module Scope
################################################################################
# DEFINE NONE


################################################################################
# FUNCTION local_scope()
#
#
################################################################################
FUNCTION local_scope()
	DEFINE var1,var2 SMALLINT  -- use var2 from globals NOTE: var2 in the duplicate globals is of different type
	#NOTE: var3 is used/defined in the global scope
	CALL varReport("------------------------------------------------------------------------------------------------","","")
	CALL varReport("In LOCAL Scope Test","","")
	CALL varReport("
		GLOBALS	DEFINE var1,var2,var3 BIGINT END GLOBALS
		DEFINE MODULE <NONE> INT #MODULE SCOPE
		<DEFINE LOCAL var1,var2 SMALLINT>
		","","")
			
	CALL varReport("Note:var3 was not defind in local scope","","")
	CALL varReport("------------------------------------------------","","")
	
	CALL varReport("In local_scope() - BEFORE LET","","")
	CALL varReport("LOCAL \tvar1=\t", var1, "\tLOCAL \tSCOPE\tINT")
	CALL varReport("LOCAL \tvar2=\t", var2, "\tLOCAL \tSCOPE\tINT")
	CALL varReport("GLOBAL\tvar3=\t", var3, "\tGLOBAL\tSCOPE\tINT")
	CALL varReport("------------------------------------------------","","")
		
	LET var1 = 100
	LET var2 = 200
	LET var3 = 300
	
	CALL varReport("
	LET var1 = 100
	LET var2 = 200
	LET var3 = 300
	","","")
	
	CALL varReport("------------------------------------------------","","")	
	CALL varReport("In local_scope() - AFTER LET","","")
	CALL varReport("LOCAL \tvar1=\t", var1, "\tLOCAL \tSCOPE\tINT")
	CALL varReport("LOCAL \tvar2=\t", var2, "\tLOCAL \tSCOPE\tINT")
	CALL varReport("GLOBAL\tvar3=\t", var3, "\tGLOBAL\tSCOPE\tINT")
	CALL varReport("------------------------------------------------------------------------------------------------","","")
	
END FUNCTION
################################################################################
# END FUNCTION local_scope()
################################################################################