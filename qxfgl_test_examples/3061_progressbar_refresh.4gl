MAIN
DEFINE l_maxvalue int
DEFINE l_pb ui.ProgressBar
DEFINE i smallint
define w ui.Window
let l_maxvalue=5
CALL fgl_getkey()
OPEN WINDOW w1 WITH FORM '3061/3061_progressbar_refresh' ATTRIBUTE(BORDER)

LET  w = ui.Window.forname("w1")
CALL w.SetVisible(TRUE)

LET l_pb = ui.ProgressBar.forName("pb01")
CALL l_pb.SetMinValue(0)
CALL l_pb.SetMaxValue(l_maxvalue)
FOR i = 1 to l_maxvalue
	CALL l_pb.SetCurrentValue(i)
	SLEEP 1
END FOR
CALL fgl_getkey()
END MAIN