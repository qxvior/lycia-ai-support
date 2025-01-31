FUNCTION demo_topMenu()
	DEFINE w_topMenu WINDOW
	

	CALL w_topMenu.openWithForm("w_slider", getFormPath("gdt_wdg_topmenu"), 1,1,"", "BORDER")	
	CALL fgl_settitle("TopMenu Demo")


	MENU
		ON ACTION actAnalyzeStock
			DISPLAY "Analyze Stock Data" TO lb1 ATTRIBUTE(BLUE)
			
		ON ACTION actAnalyzeRevenue
			DISPLAY "Analyze Revenue Data" TO lb1 ATTRIBUTE(BLUE)		
			
		ON ACTION actSave
			DISPLAY "Save" TO lb1 ATTRIBUTE(BLUE)		
			
		ON ACTION actSaveAs
			DISPLAY "Save as" TO lb1 ATTRIBUTE(BLUE)	
				
		ON ACTION actSaveAll
			DISPLAY "Save all" TO lb1 ATTRIBUTE(BLUE)		

		ON ACTION actCut
			DISPLAY "Edit - Cut" TO lb1 ATTRIBUTE(BLUE)

		ON ACTION actCopy
			DISPLAY "Edit - Copy" TO lb1 ATTRIBUTE(BLUE)

		ON ACTION actPaste
			DISPLAY "Edit Paste" TO lb1 ATTRIBUTE(BLUE)

		ON ACTION actHelpContents
			DISPLAY "Help - Contents" TO lb1 ATTRIBUTE(BLUE)


		ON ACTION actSearch
			DISPLAY "Help - Search" TO lb1 ATTRIBUTE(BLUE)


		ON ACTION actAbout
			DISPLAY "Help - About" TO lb1 ATTRIBUTE(BLUE)									
									
		ON ACTION ("actExit","actBtExit")
			EXIT MENU
	END MENU	
			
	CALL w_topMenu.close()

END FUNCTION