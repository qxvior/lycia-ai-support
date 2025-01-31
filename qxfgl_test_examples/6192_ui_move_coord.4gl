MAIN
DEFINE lb ui.Label
DEFINE location ui.Location
	OPEN WINDOW w WITH FORM "6192/6192_ui_move_coord"

	CALL fgl_getkey()
	LET lb = ui.Label.Forname("lbLyciaVersion2")
	LET location.XCoord = 200
	LET location.YCoord = 154
	CALL lb.SetLocation(location)
--	CALL ui.CoordPanel.forname("rootContainer").SetClassNames("my_class")
	CALL fgl_getkey()

END MAIN