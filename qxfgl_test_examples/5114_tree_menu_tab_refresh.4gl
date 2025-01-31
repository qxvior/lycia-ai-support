# Project: lyc1000
# Filename: 5114_tree_menu_tab_refresh.4gl
# Created By: alch
# Creation Date: Mar 16, 2020


MAIN
	CALL ui.Interface.setType("container") 
	CALL ui.Application.GetCurrent().setMenuType("Tree") 
	CALL ui.Application.GetCurrent().SetClassNames(["md-sidebar","tabbed_container"]) 
	
	CALL ui.interface.loadstartmenu("5114/5114_tree_menu_tab_refresh_01")
	CALL fgl_setkeylabel("actexit","Exit")
	CALL fgl_setkeylabel("actmenu1","Load Menu 1")
	CALL fgl_setkeylabel("actmenu2","Load Menu 2")
	CALL ui.interface.refresh()
	
	
	MENU 
		ON ACTION actrun
			DISPLAY "Item triggered - ", fgl_getlastwidgetid() 
		ON ACTION actmenu1
			CALL ui.interface.loadstartmenu("5114/5114_tree_menu_tab_refresh_01")
			CALL ui.interface.refresh()
		ON ACTION actmenu2
			CALL ui.interface.loadstartmenu("5114/5114_tree_menu_tab_refresh_02")
			CALL ui.interface.refresh()
		ON ACTION actexit
			EXIT MENU
	END MENU

END MAIN