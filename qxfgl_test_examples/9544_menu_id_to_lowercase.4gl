DEFINE menufileinmemory TEXT

MAIN
	CALL ui.Interface.setType("container")
	CALL ui.Application.GetCurrent().setMenuType("Tree")
	CALL ui.Application.GetCurrent().SetClassNames(["md-sidebar","tabbed_container"])

	CALL fgl_setactionlabel("actEXIT","Exit Menus","",20,TRUE,"Close menus")
	CALL fgl_setactionlabel("accept","")
	CALL fgl_setactionlabel("cancel","")

	LOCATE menufileinmemory IN FILE '9544/9544_menu_id_case.fm2'

	CALL ui.interface.loadstartmenu(menufileinmemory) 
	CALL ActionsForLycia()
END MAIN

FUNCTION ActionsForLycia()

	MENU
	    ON ACTION "actExit" 
            EXIT MENU
	    ON ACTION "actCmdInvoke" 
            DISPLAY "fgl_getlastwidgetid() = ", fgl_getlastwidgetid()
            --CALL run_cmd(fgl_getlastwidgetid())
	END MENU

END FUNCTION


FUNCTION run_cmd(lc_cmd_string)
DEFINE	lc_cmd_string	CHAR(100)
DEFINE	lc_run		CHAR(100)

	LET lc_run = lc_cmd_string  CLIPPED
    DISPLAY "RUNNING ",lc_run
	RUN lc_run WITHOUT WAITING

END FUNCTION
