####################################################################
# MAIN
#
# Shown a file manager to select a path/folder
####################################################################
MAIN
	DEFINE l_folder STRING
	LET l_folder = select_folder()
	
	IF l_folder IS NOT NULL THEN
		CALL fgl_winmessage("Folder selected",l_folder,"info")
	ELSE
		CALL fgl_winmessage("No Folder selected","You have not selected any folder","info")
	END IF
	
END MAIN
####################################################################
# END MAIN
####################################################################


####################################################################
# FUNCTION select_folder()
#
# Shown a file manager to select a path/folder
####################################################################
FUNCTION select_folder()
	DEFINE l_rec_path 
		RECORD
			path STRING,
			titlebar_text STRING
		END RECORD
	DEFINE ret_selected_folder STRING

	#Set parameters/arguments
	LET l_rec_path.path = NULL
	LET l_rec_path.titlebar_text = "Select any folder"

	CALL ui.Interface.frontCall("standard","openDir",[l_rec_path.*],[ret_selected_folder])
	
	RETURN ret_selected_folder
END FUNCTION
####################################################################
# END FUNCTION select_folder()
####################################################################