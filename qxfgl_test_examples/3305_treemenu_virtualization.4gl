MAIN
	CALL ui.Interface.setType("container")
	CALL ui.Application.GetCurrent().setMenuType("Tree")
	CALL ui.Interface.LoadStartMenu("3305/3305_fail_to_open_in_fd")
	MENU ON ACTION actClose EXIT MENU END MENU
END MAIN