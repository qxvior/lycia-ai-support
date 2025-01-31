##############################################################################################################
# Global file for the test case 5852_whenever_global_error_2.
# This file contains the WHENEVER SQLERROR statement in GLOBALS ... END GLOBALS section.
##############################################################################################################
DATABASE stores
GLOBALS
	DEFINE
		glob_integer INTEGER

		WHENEVER SQLERROR CALL sqlerror_handler_1
END GLOBALS
