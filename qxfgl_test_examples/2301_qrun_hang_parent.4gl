MAIN
  	CALL ui.Interface.setType("container")
  	CALL ui.Interface.setName("cont")
	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
	MENU 
		ON ACTION "RUN CHILD"
			RUN "2301_qrun_hang_child" WITHOUT WAITING
		ON ACTION "exit"
			EXIT MENU
	END MENU 
END MAIN