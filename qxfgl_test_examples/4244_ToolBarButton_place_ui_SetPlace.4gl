MAIN
	DEFINE ui_tbb ui.ToolbarButton
	DEFINE buttonEvent ui.BackgroundServerEventHandler
	DEFINE img ui.Image
	
OPEN WINDOW ToolBarButton_ui_SetPlace WITH FORM '4244/4244_ToolBarButton_place_ui_SetPlace' ATTRIBUTE(BORDER)

	LET buttonEvent = ui.BackgroundServerEventHandler.Create()
	CALL buttonEvent.SetCallBackAction("tbButton9")

	LET ui_tbb = ui.ToolbarButton.Create("tbb","tbGroup2")
	CALL ui_tbb.SetText("ui_Button")
	
	CALL img.SetImageUrl("qx://application/save.png")
	CALL ui_tbb.setImage(img)
	CALL ui_tbb.setPlace("top")
	CALL ui_tbb.SetOninvoke(buttonEvent)

	MENU
		ON ACTION act1
		ON ACTION act2
		ON ACTION act3
		ON ACTION act4
		ON ACTION act5
		ON ACTION act6
		ON ACTION act7
		ON ACTION act8
		ON ACTION act9
		ON ACTION  "exit"
		EXIT MENU			
	END MENU

END MAIN