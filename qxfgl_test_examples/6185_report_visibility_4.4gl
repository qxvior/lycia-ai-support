MAIN  

CASE arg_val(1)
	WHEN "mdi"
		CALL ui.Interface.setType("container")
		CALL ui.Interface.setName("window1")
		CALL ui.Application.GetCurrent().setMenuType("Tree")
	WHEN "tab_mdi"
		CALL ui.Interface.setType("container")
		CALL ui.Interface.setName("window1")
		CALL ui.Application.GetCurrent().setMenuType("Tree")
		CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
END CASE

RUN "6185_report_child_app no_wait"
CALL fgl_getkey()
END MAIN