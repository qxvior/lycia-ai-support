# Project: lyc1000
# Filename: 6491_extern_vars_c.4gl
# Created By: alch
# Creation Date: May 6, 2021

MAIN
	CALL modify_int_flag()
	CALL modify_quit_flag()
	CALL modify_sqlstate()
	CALL modify_engine_sql_code()
	CALL modify_sqlca()
	CALL modify_status()
	DISPLAY "SUCCESS"
END MAIN