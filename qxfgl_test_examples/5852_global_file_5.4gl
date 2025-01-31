##############################################################################################################
# Global file for the test case 5852_whenever_global_error_5.
# This file contains the WHENEVER ANY ERROR statement in GLOBALS ... END GLOBALS section.
##############################################################################################################
DATABASE stores
GLOBALS
	DEFINE
		glob_integer INTEGER

		WHENEVER ANY ERROR CALL error_handler_1
END GLOBALS
