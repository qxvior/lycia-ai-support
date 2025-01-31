###########################################################################################################
# MAIN
#
#
###########################################################################################################
MAIN
	CALL ui_init()

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	CALL retrieveLyciaSystemEnvironment()
END MAIN