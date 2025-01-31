# Project: lyc1000
# Filename: 4936_child_no_toolbar.4gl
# Created By: alch
# Creation Date: Feb 3, 2020

MAIN

	CALL ui.Interface.setType("child")
	CALL ui.Interface.setName("child_app")
	CALL ui.Interface.setContainer("cont")

	MENU "child"
		ON ACTION "test"
			MESSAGE "test"
		ON ACTION "exit"
			EXIT MENU
	END MENU

END MAIN


