# Project: lyc1000
# Filename: 4936_parent_no_toolbar.4gl
# Created By: alch
# Creation Date: Feb 3, 2020

MAIN 
	DEFINE startmenu ui.menubar
	
--	CALL ui.interface.frontcall("html5","styleImport]",["{CONTEXT}/public/querix/css/ocean/transformers.css",""],[])
	CALL ui.Interface.setType("container")
	CALL ui.Interface.setName("cont")
	CALL ui.Application.GetCurrent().setMenuType("Tree") 
--	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"]) 

	CALL ui.interface.loadstartmenu("4936/4936_parent_no_toolbar.fm2") 

	MENU 
		ON ACTION "runChild" 
			RUN "4936_child_no_toolbar" WITHOUT WAITING
		ON ACTION "actClose" 
			EXIT MENU 
	END MENU 
END MAIN 
