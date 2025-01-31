MAIN
	CALL ui.Interface.setType("container")
	CALL ui.Application.GetCurrent().setMenuType("Tree")
	CALL ui.Application.GetCurrent().SetClassNames(["md-sidebar","tabbed_container"])

	CALL fgl_setactionlabel("actEXIT","Exit Menus","",20,TRUE,"Close menus")
	CALL fgl_setactionlabel("accept","")
	CALL fgl_setactionlabel("cancel","")

	CALL ui.interface.loadstartmenu('9653/9653_browser_reloading_parent.sm2') 
	CALL ActionsForLycia()
END MAIN

FUNCTION ActionsForLycia()

	MENU
	    ON ACTION "actExit" 
            EXIT MENU
	    ON ACTION "actCmdInvoke" 
            DISPLAY "fgl_getlastwidgetid() = ", fgl_getlastwidgetid()
            RUN fgl_getlastwidgetid() WITHOUT WAITING
	END MENU

END FUNCTION

