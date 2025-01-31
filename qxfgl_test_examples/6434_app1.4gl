MAIN
	CALL ui.Interface.setType("container")
	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
	OPEN WINDOW login WITH 20 rows, 40 columns
	CLOSE WINDOW login
	run "6434_app2"
END MAIN 