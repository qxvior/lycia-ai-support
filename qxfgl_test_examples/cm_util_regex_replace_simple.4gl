################################################################################
# MAIN
#
# Demo App to show search and replace by expression -> regex.replace method
################################################################################
MAIN
	DEFINE l_text_document_source TEXT
	DEFINE l_text_document_modified TEXT
	DEFINE l_regex_replace util.REGEX	#REPLACE
	DEFINE l_replace_str STRING	#REPLACE STRING
	DEFINE l_msg STRING	 

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS ACCEPT KEY "RETURN"

	CALL ui_init()
	DEFER INTERRUPT

	WHENEVER ERROR CONTINUE		
		LET l_regex_replace = /Mike|George/g #another example /a|e|i|o|u/g
		LET l_replace_str = "[$&]"
	WHENEVER ERROR STOP
	
	IF NOT l_regex_replace.IsValid() THEN
		LET l_msg = l_regex_replace, "\n", qx_last_exception.err_text
		CALL fgl_winmessage("Invalid regex pattern detected",qx_last_exception.err_text,"error")
	END IF

	LOCATE l_text_document_source IN FILE "txt/letter.txt"

	OPEN WINDOW cm_util_regex_replace_simple WITH FORM "form/cm_util_regex_replace_simple"

	CALL util.REGEX.replace(l_text_document_source, l_regex_replace, l_replace_str) RETURNING l_text_document_modified		

	DISPLAY l_regex_replace TO search_pattern
	DISPLAY l_replace_str TO replace_pattern
	DISPLAY l_text_document_source TO document_source
	DISPLAY l_text_document_modified TO document_modified
	
	MENU
		ON ACTION CANCEL
			EXIT MENU
		ON ACTION HELP
	 		CALL onlineHelp(NULL,"util_regex")				
	END MENU			
END MAIN
################################################################################
# END MAIN
################################################################################