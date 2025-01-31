MAIN
  	CALL ui.Interface.setType("container")
  	CALL ui.Interface.setName("cont")
	CALL ui.Interface.loadStartMenu("4871/4871_msg_child_1")
	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
	MENU
		ON ACTION "RUN"
			RUN "4871_msg_child_2" WITHOUT WAITING
		ON ACTION "EXIT"
			EXIT MENU
	END MENU
END MAIN