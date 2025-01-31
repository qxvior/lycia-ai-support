MAIN
DEFINE f1 CHAR(20)
DEFINE l_menubar ui.MenuBar
DEFINE l_topmenugroup DYNAMIC ARRAY OF ui.MenuGroup
DEFINE l_menugroup DYNAMIC ARRAY with 2 DIMENSIONS OF ui.MenuGroup
DEFINE l_menucommand DYNAMIC ARRAY WITH 3 DIMENSIONS OF ui.MenuCommand
DEFINE l_menuEvent ui.BackgroundServerEventHandler
CALL ui.Interface.setType("container")
CALL ui.Interface.loadStartMenu("2490/2490_inactive_menucommand_ld") 
OPEN WINDOW w1 WITH FORM "2490/2490_inactive_menucommand_ld"

	LET l_menuEvent = ui.BackgroundServerEventHandler.Create()
	CALL l_menuEvent.SetCallBackAction("actCmdInvoke")

	LET l_menubar =ui.MenuBar.ForName("menubar_pouziv01")
	
	LET l_topmenugroup[1] = ui.MenuGroup.create("File")
	CALL l_topmenugroup[1].setText("Súbor")
		LET l_menugroup[1,1] = ui.MenuGroup.create("OpenAs")
		CALL l_menugroup[1,1].setText("Otvoriť ako")
			LET l_menucommand[1,1,1] = ui.MenuCommand.create("ExcelCsv")
			CALL l_menucommand[1,1,1].setText("Excel (csv)")
			CALL l_menucommand[1,1,1].SetOninvoke(l_menuEvent)
			CALL l_menugroup[1,1].setMenuItems([l_menucommand[1,1,1]])
			CALL l_topmenugroup[1].setMenuItems([l_menugroup[1,1]])

	LET l_topmenugroup[5] = ui.MenuGroup.create("Helper")
	CALL l_topmenugroup[5].setText("Pomocník")
		LET l_menucommand[5,1,1] = ui.MenuCommand.create("Helper2")
		CALL l_menucommand[5,1,1].setText("Pomocník F1")
		CALL l_menucommand[5,1,1].SetOninvoke(l_menuEvent)
		CALL l_topmenugroup[5].setMenuItems([l_menucommand[5,1,1]])	

	CALL l_menubar.setMenuItems([l_topmenugroup[1],l_topmenugroup[5]])
	CALL fgl_getkey()
	INPUT BY NAME f1
		ON ACTION actCmdInvoke
		 DISPLAY "menu action invoked"
		 	END INPUT
END MAIN