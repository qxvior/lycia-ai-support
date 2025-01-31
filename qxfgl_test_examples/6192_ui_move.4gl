MAIN
DEFINE lb ui.Label
DEFINE gil ui.GridItemLocation
DEFINE gd ui.GridColumnDefinition
	OPEN WINDOW w WITH FORM "6192/6192_ui_move"

	CALL fgl_getkey()
	LET lb = ui.Label.Forname("lbLyciaVersion2")

	LET gil.GridX=3
	LET gil.GridY=1
	LET gil.GridWidth=1
	LET gil.GridHeight=1
	CALL lb.SetGridItemLocation(gil)
--	CALL ui.GridPanel.forname("cntDetail1Sub").SetClassNames("my_class")
	CALL fgl_getkey()
END MAIN