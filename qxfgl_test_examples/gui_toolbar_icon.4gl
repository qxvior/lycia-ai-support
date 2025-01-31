MAIN

	MENU
		BEFORE MENU
			CALL fgl_dialog_setkeylabel("EXIT","Exit","{CONTEXT}/public/querix/icon/svg/24/ic_home_24px.svg",1,false,"Tooltip Message 1","top")	
			CALL fgl_dialog_setkeylabel("SAVE","Save Record","{CONTEXT}/public/querix/icon/svg/24/ic_done_24px.svg",2,false,"Tooltip Message 2","top")
			CALL fgl_dialog_setkeylabel("Delete Record","Delete","{CONTEXT}/public/querix/icon/svg/24/ic_delete_24px.svg",3,false,"Tooltip Message 3","top")
			CALL fgl_dialog_setkeylabel("Refresh","Refresh","{CONTEXT}/public/querix/icon/svg/24/ic_refresh_24px.svg",4,false,"Tooltip Message 4","top")	
		
			CALL fgl_dialog_setkeylabel("Export","Export","{CONTEXT}/public/querix/icon/svg/24/ic_cloud_upload_24px.svg",5,false,"Tooltip Message 5","top")	
			CALL fgl_dialog_setkeylabel("Import","Import","{CONTEXT}/public/querix/icon/svg/24/ic_cloud_download_24px.svg",6,false,"Tooltip Message 6","top")				

			CALL fgl_dialog_setkeylabel("Template","Template","{CONTEXT}/public/querix/icon/svg/24/ic_library_books_24px.svg",7,false,"Tooltip Message 7","top")		
			CALL fgl_dialog_setkeylabel("CopyTb","Copy Tb","{CONTEXT}/public/querix/icon/svg/24/ic_content_copy_24px.svg",8,false,"Tooltip Message 8","top")

			CALL fgl_dialog_setkeylabel("Record","PER Record","{CONTEXT}/public/querix/icon/svg/24/ic_table_classic_24px.svg",9,true,"Show Display Array with classic PER Screen Array RECORD","top")
			CALL fgl_dialog_setkeylabel("GRID","PER GRID","{CONTEXT}/public/querix/icon/svg/24/ic_table_grid_24px.svg",10,true,"Show Display Array with classic PER Screen Array GRID","top")
			CALL fgl_dialog_setkeylabel("Table","FM2 Table","{CONTEXT}/public/querix/icon/svg/24/ic_table_grid_24px.svg",11,true,"Show DISPLAY ARRAY with Dynamic fm2 Table","top")
	
		ON ACTION "EXIT"
			EXIT MENU
		ON ACTION "SAVE"
		ON ACTION "Delete"
		ON ACTION "Refresh"
		ON ACTION "Export"
		ON ACTION "Import"
		ON ACTION "Template"
		ON ACTION "CopyTb"
		ON ACTION "Record"
		ON ACTION "GRID"
		ON ACTION "Table"
		
	END MENU


END MAIN