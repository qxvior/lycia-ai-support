######################################################################################
# MAIN
#
#
######################################################################################
MAIN
	DEFINE l_client_doc_file_name STRING
	DEFINE l_client_text_file TEXT
	DEFINE ui_button_open ui.button
	DEFINE ui_button_open_m ui.button
	DEFINE ui_button_save ui.button

	OPEN WINDOW file_func_file_dialog WITH FORM "form/file_func_file_dialog"

	LET  ui_button_open = ui.button.ForName("bt_file_open")
	LET  ui_button_open_m = ui.button.ForName("bt_file_open_multiple")
	LET  ui_button_save = ui.button.ForName("bt_file_save")

	CALL ui_button_open.setCollapsed(TRUE)
	CALL ui_button_open_m.setCollapsed(TRUE)
	CALL ui_button_save.setCollapsed(TRUE)

	MENU
		ON ACTION "File"
			CALL ui_button_open.setCollapsed(FALSE)
			CALL ui_button_open_m.setCollapsed(FALSE)
			CALL ui_button_save.setCollapsed(FALSE)
			
			MENU
				BEFORE MENU
					CALL dialog.setActionHidden("ACCEPT",TRUE)
					
				ON ACTION "OPEN FILE"
					LET l_client_doc_file_name = fgl_file_dialog("open",TRUE,"Select the text file","txt",NULL,"*.txt;*.log;*.dat;*.inf")
					IF l_client_doc_file_name IS NOT NULL THEN
						CALL l_client_text_file.readFile(l_client_doc_file_name)
					END IF
					EXIT MENU
					
				ON ACTION "OPEN FILE S"
					LET l_client_doc_file_name = fgl_file_dialog("open",FALSE,"Select the text file(s)","txt",NULL,"*.txt;*.log;*.dat;*.inf")
					IF l_client_doc_file_name IS NOT NULL THEN
						CALL l_client_text_file.readFile(l_client_doc_file_name)
					END IF
					EXIT MENU

				ON ACTION "OPEN FILE S2"
					LET l_client_doc_file_name = fgl_file_dialog("open","0","Select the text file ????","txt",NULL,"*.txt;*.log;*.dat;*.inf")
					IF l_client_doc_file_name IS NOT NULL THEN
						CALL l_client_text_file.readFile(l_client_doc_file_name)
					END IF
					EXIT MENU

				ON ACTION "SAVE FILE"
					LET l_client_doc_file_name = fgl_file_dialog("save",TRUE,"Specify the text file name","txt",l_client_doc_file_name,"*.txt,*.log,*.dat,*.inf")
					IF l_client_doc_file_name IS NOT NULL THEN
						CALL l_client_text_file.writeFile(l_client_doc_file_name)
					END IF
					EXIT MENU
					
				ON ACTION "CANCEL"
					EXIT MENU
			ENd MENU

			CALL ui_button_open.setCollapsed(TRUE)
			CALL ui_button_open_m.setCollapsed(TRUE)
			CALL ui_button_save.setCollapsed(TRUE)
							
		ON ACTION "DISPLAY"
			DISPLAY l_client_text_file TO file_text_area
			DISPLAY l_client_text_file TO file_blob_viewer
		
		ON ACTION "EDIT"
		
			DIALOG ATTRIBUTE(UNBUFFERED)
				INPUT l_client_text_file WITHOUT DEFAULTS FROM file_text_area
				END INPUT
	
				INPUT l_client_text_file WITHOUT DEFAULTS FROM file_blob_viewer 
				END INPUT
				
				ON ACTION "CANCEL"
					EXIT DIALOG

				ON ACTION "ACCEPT"
					EXIT DIALOG

			END DIALOG

			DISPLAY l_client_text_file TO file_text_area
			DISPLAY l_client_text_file TO file_blob_viewer
			
		ON ACTION "CANCEL"
			EXIT MENU


		ON ACTION "HELP"
			CALL onlineHelp("StackPanel",NULL)				
	END MENU	
	
	CLOSE WINDOW file_func_file_dialog
END MAIN
######################################################################################
# END MAIN
######################################################################################