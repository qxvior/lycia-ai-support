################################################################################
# MAIN
#
# Demo App to show search and replace by expression -> regex.replace method
################################################################################
MAIN
	DEFINE l_text_document_source TEXT		#text to be modified/searched
	DEFINE l_text_document_modified TEXT  #RETURN modified text result

	DEFINE l_str_inp_search_for STRING	#text pattern to search for
	DEFINE l_regex_search util.REGEX	


	DEFINE l_str_inp_replace_with STRING	 #REPLACE with this text (also pattern but not an regex object)
	DEFINE l_msg STRING
#	DEFINE l_regex_replace util.REGEX	#REPLACE


#	DEFINE l_replace_str STRING	#REPLACE STRING

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS ACCEPT KEY "RETURN"

	CALL ui_init()
	DEFER INTERRUPT
	
	LET l_str_inp_search_for = "Mike|George" #another example /a|e|i|o|u/g
	LET l_str_inp_replace_with = "[$&]"
	
	LOCATE l_text_document_source IN FILE "txt/letter.txt"

	OPEN WINDOW cm_util_regex_replace_simple_input WITH FORM "form/cm_util_regex_replace_simple_input"

	INPUT l_str_inp_search_for,l_str_inp_replace_with,l_text_document_source WITHOUT DEFAULTS
	FROM search_pattern, replace_pattern, document_source ATTRIBUTE(UNBUFFERED) 
		AFTER FIELD replace_pattern
			WHENEVER ERROR CONTINUE	
				CALL l_regex_search.setPattern(l_str_inp_search_for)
			WHENEVER ERROR STOP
			#validate pattern
			IF NOT l_regex_search.IsValid() THEN #invalid reg expresseions/pattern can lead to an exception error
				LET l_msg = l_str_inp_search_for, "\n", qx_last_exception.err_text
				CALL fgl_winmessage("Invalid regex pattern detected",qx_last_exception.err_text,"error")
				NEXT FIELD search_pattern
			END IF
				
		ON ACTION ("ACCEPT","REPLACE")
			WHENEVER ERROR CONTINUE	
				CALL l_regex_search.setPattern(l_str_inp_search_for)
				#We need to set the "/g" flag, otherwise it will stop on/after the first occurence 
				CALL l_regex_search.setFlags("g") 	#"/g"   # regex method for flags
				WHENEVER ERROR STOP

			#validate pattern
			IF NOT l_regex_search.IsValid() THEN
				LET l_msg = l_str_inp_search_for, "\n", qx_last_exception.err_text
				CALL fgl_winmessage("Invalid regex pattern detected",qx_last_exception.err_text,"error")
				NEXT FIELD search_pattern
			END IF


			CALL util.REGEX.replace(l_text_document_source, l_regex_search, l_str_inp_replace_with) 
				RETURNING l_text_document_modified		

			DISPLAY l_text_document_source TO document_source
			DISPLAY l_text_document_modified TO document_modified
			CONTINUE INPUT
			
		ON ACTION HELP
	 		CALL onlineHelp(NULL,"util_regex")				
	END INPUT			
END MAIN
################################################################################
# END MAIN
################################################################################