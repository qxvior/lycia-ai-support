DEFINE tarr DYNAMIC ARRAY OF CHAR(5)
MAIN
	OPEN WINDOW w WITH FORM "9214/9214_ui_dialog_deleteAllRows" ATTRIBUTE(BORDER)

	CALL arrPopulate()
	INPUT ARRAY tarr FROM tarr.* ATTRIBUTE(without defaults)
		ON ACTION del
			CALL ui.Dialog.GetCurrent().deleteAllRows("tarr")
	END INPUT
	
	CALL arrPopulate()
	INPUT ARRAY tarr FROM tarr.* ATTRIBUTE(without defaults, auto append = false)
		ON ACTION del
			CALL ui.Dialog.GetCurrent().deleteAllRows("tarr")
	END INPUT

	CALL arrPopulate()
	INPUT ARRAY tarr FROM tarr.* ATTRIBUTE(without defaults, auto append = true)
		ON ACTION del
			CALL ui.Dialog.GetCurrent().deleteAllRows("tarr")
	END INPUT
END MAIN 
FUNCTION arrPopulate()
	LET tarr[1]="row1"
	LET tarr[2]="row2"
	LET tarr[3]="row3"
END FUNCTION	