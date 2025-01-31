################################################################################
# NOTE
# var1,var2,var3 BIGINT   declared in global scope - YES
## var3 STRING             declared in module scope - YES
# var1,var2,var3 SMALLINT declared in local scope  - NO
################################################################################


################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

################################################################################
# Module Scope
# duplicate var3 on module scope
################################################################################

#DEFINE var3 STRING


################################################################################
# MAIN
#
#
################################################################################
MAIN
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL ui_init()

	OPEN WINDOW mywin WITH FORM "form/sta_variableScope" 
	CALL ui.Interface.setText("Variable Scope")
	
	#ACCESS GLOBAL VARIABLES
	CALL varReport("In Main - BEFORE LET","","")
	CALL varReport("var1\t=\t", var1,"\tGLOBAL")
	CALL varReport("var2\t=\t", var2,"\tGLOBAL")
	CALL varReport("var3\t=\t", var3,"\tGLOBAL")

	LET var1 = 1
	LET var2 = 2
	LET var3 = 3

	CALL varReport("In Main - AFTER LET","","")
	CALL varReport("var1\t=\t", var1,"\tGLOBAL")
	CALL varReport("var2\t=\t", var2,"\tGLOBAL")
	CALL varReport("var3\t=\t", var3,"\tGLOBAL")

	
	CALL module_scope()

	CALL varReport("In Main - AFTER module_scope()","","")
	CALL varReport("var1\t=\t", var1,"\tGLOBAL")
	CALL varReport("var2\t=\t", var2,"\tGLOBAL")
	CALL varReport("var3\t=\t", var3,"\tGLOBAL")

	CALL local_scope()
	
	CALL varReport("In Main - AFTER local_scope()","","")
	CALL varReport("var1\t=\t", var1,"\tGLOBAL")
	CALL varReport("var2\t=\t", var2,"\tGLOBAL")
	CALL varReport("var3\t=\t", var3,"\tGLOBAL")

	#To see/test what happens if the same variable name was used in 2 different global files with different dataTypes	
	#CALL local_scope_with_global_conflict()	
	#CALL varReport("In Main - AFTER local_scope_with_global_conflict()","")
	#CALL varReport("var1 = ", var1)
	#CALL varReport("var2 = ", var2)
	#CALL varReport("var3 = ", var3)

	CALL repTest()	
	CALL edit_varReport()
	
END MAIN
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION varReport(argValue1,argValue2,argScope)
#
#
################################################################################
FUNCTION varReport(argValue1,argValue2,argScope)
	DEFINE argValue1,argValue2,argScope STRING
	
	IF argValue2 IS NULL THEN
		LET gl_varReport = gl_varReport, "\n", argValue1
	ELSE
		LET gl_varReport = gl_varReport, "\n", trim(argValue1), " ", trim(argValue2), " ", trim(argScope)
	END IF
	
	CALL ui.interface.refresh()
END FUNCTION
################################################################################
# END FUNCTION varReport(argValue1,argValue2,argScope)
################################################################################


################################################################################
# FUNCTION edit_varReport()
#
#
################################################################################
FUNCTION edit_varReport()
	INPUT gl_varReport WITHOUT DEFAULTS FROM fReport 
END FUNCTION
################################################################################
# END FUNCTION edit_varReport()
################################################################################