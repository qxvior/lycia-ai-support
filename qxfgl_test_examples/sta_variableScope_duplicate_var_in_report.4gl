################################################################################
# GLOBAL Scope
################################################################################
GLOBALS "sta_variableScope_global.4gl"

#####################################################################################
# FUNCTION repTest()
#
#
#####################################################################################

FUNCTION repTest()
	DEFINE rep_string STRING
	LET rep_string = "This is my FIRST example report line output"
			CALL fgl_report_type("my_pipe","shell_open")  # or q4gl_add_user_report_type()
			START REPORT rep_1 TO PIPE "my_pipe"
				   OUTPUT TO REPORT rep_1(rep_string)
				   FINISH REPORT rep_1
	LET rep_string = "This is my SECOND example report line output"
			CALL fgl_report_type("my_pipe","shell_open")  # or q4gl_add_user_report_type()
			START REPORT rep_2 TO PIPE "my_pipe"
				   OUTPUT TO REPORT rep_2(rep_string)
				   FINISH REPORT rep_2

END FUNCTION

