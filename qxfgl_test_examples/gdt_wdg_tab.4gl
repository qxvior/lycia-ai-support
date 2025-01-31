FUNCTION demo_tab()
	DEFINE w_tab WINDOW
	

	CALL w_tab.openWithForm("w_tabPage", getFormPath("gdt_wdg_tab"), 1,1,"", "BORDER")	
	CALL fgl_settitle("Tab Menu Demo")


	MENU
						
									
		ON ACTION actExit
			EXIT MENU
	END MENU	
			
	CALL w_tab.close()

END FUNCTION