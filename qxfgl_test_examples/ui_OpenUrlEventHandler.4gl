MAIN
 DEFINE urlHand ui.OpenUrlEventHandler
 DEFINE tbb1 ui.ToolbarButton
	CALL ui_init() 
 MENU
	ON ACTION acttb1
		LET urlHand = ui.OpenUrlEventHandler.Create()
		CALL urlHand.SetUrl("https://querix.com")

		LET tbb1 = ui.ToolbarButton.ForName("acttb1")
		CALL tbb1.SetOnInvoke(urlHand)
	ON ACTION exit_prog 	EXIT MENU
 END MENU
END MAIN