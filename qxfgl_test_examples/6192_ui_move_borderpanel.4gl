MAIN
DEFINE lb ui.Label
	OPEN WINDOW w WITH FORM "6192/6192_ui_move_borderpanel"

	CALL fgl_getkey()
	LET lb = ui.Label.Forname("lbLyciaVersion2")

	CALL lb.SetBorderPanelItemLocation("Right")
--	CALL ui.BorderPanel.forname("rootcontainer").SetClassNames("my_class")
	CALL fgl_getkey()

END MAIN