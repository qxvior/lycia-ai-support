MAIN
DEFINE menuVar TEXT
CALL ui.Interface.setType("container")
CALL ui.Application.GetCurrent().setMenuType("Tree")
CALL ui.Interface.setName("window1")
LOCATE menuVar in file "3423/3423_blob_loadmenu.fm2"
CALL ui.Interface.loadStartMenu(menuVar)


MENU "m"
	ON ACTION CANCEL
		EXIT MENU
	ON ACTION actCmdInvoke
		DISPLAY "Click menu group was triggered"
END MENU

END MAIN
