################################################################################
# NOTE
# var1,var2,var3 BIGINT   declared in global scope
# var1 INT      declared in module scope
# var3 SMALLINT declared in local scope
################################################################################

################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

################################################################################
# Module Scope
################################################################################
DEFINE var1 INT
#DEFINE var2 INT -> defined in GLOBALS as BIGINT
#DEFINE var3 SMALLINT -> defined in LOCAL as SMALLINT

################################################################################
# FUNCTION module_scope()#
#
#
################################################################################	
FUNCTION module_scope()
	DEFINE var3 SMALLINT
	
	CALL varReport("------------------------------------------------------------------------------------------------","","")
	CALL varReport("In MODULE Scope Test","","")
	CALL varReport("
		GLOBALS	DEFINE var1,var2,var3 BIGINT END GLOBALS
		DEFINE var1,var3 INT #MODULE SCOPE
		DEFINE var3 SMALLINT #LOCAL SCOPE
		","","")
		
	CALL varReport("Note:var2 was not defined in module scope","","")		
	CALL varReport("------------------------------------------------","","")

	CALL varReport("In Module Scope Test - before LET","","")	
	CALL varReport("Module\tvar1=\t", var1,"\tMODULE\tSCOPE\tINT")
	CALL varReport("Global\tvar2=\t", var2,"\tGLOBAL\tSCOPE\tBIGINT")
	CALL varReport("LOCAL\tvar3= \t", var3,"\tLOCAL \tSCOPE\tSMALLINT")
	CALL varReport("------------------------------------------------","","")

	LET var1 = 10
	LET var2 = 20
	LET var3 = 30

	CALL varReport("
	LET var1 = 10
	LET var2 = 20
	LET var3 = 30
	","","")
	
	CALL varReport("------------------------------------------------","","")
	CALL varReport("In Module Scope Test - AFTER LET","","")
	CALL varReport("Module\tvar1=\t", var1,"\tMODULE\tSCOPE\tINT")
	CALL varReport("Global\tvar2=\t", var2,"\tGLOBAL\tSCOPE\tBIGINT")
	CALL varReport("LOCAL \tvar3=\t", var3,"\tLOCAL \tSCOPE\tSMALLINT")
	CALL varReport("------------------------------------------------------------------------------------------------","","")
	
END FUNCTION
################################################################################
# END FUNCTION module_scope()
################################################################################