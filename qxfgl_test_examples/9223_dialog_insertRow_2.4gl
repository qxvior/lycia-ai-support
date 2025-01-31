DEFINE arrRec DYNAMIC ARRAY OF STRING
MAIN
	DEFINE i INTEGER
	FOR i = 1 TO 10
		LET arrRec[i] = "TF1-", trim(i)
	END FOR
	OPEN WINDOW w1 WITH FORM "9223/9223_dialog_insertRow_1"
	INPUT ARRAY arrRec WITHOUT DEFAULTS FROM my_scr.*
		ON ACTION insertAct
			CALL dialog.insertRow("my_scr",5)
	END INPUT
END MAIN


