DEFINE notAcceptableValue STRING

MAIN
 DEFINE i int
 DEFINE notValid STRING
 DEFINE tarr DYNAMIC ARRAY OF RECORD f1,f2,f3 CHAR(20) END RECORD

	LET notAcceptableValue = "33"
	FOR i=1 to 10
	 LET tarr[i].f1 = i
	END FOR
	OPEN WINDOW w WITH FORM "form/sta_input_array_after_row_validation"
	INPUT ARRAY tarr FROM rootContainer.* ATTRIBUTE(WITHOUT DEFAULTS)
		AFTER ROW 
		  LET notValid = validation(tarr[scr_line()].*) 
		  IF notValid THEN CALL DIALOG.nextField(notValid) end if
	END INPUT
END MAIN

FUNCTION validation(rec)
 DEFINE rec RECORD f1,f2,f3 CHAR(20) END RECORD
	CASE notAcceptableValue
		WHEN rec.f1 RETURN "f1"
		WHEN rec.f2 RETURN "f2"
		WHEN rec.f3 RETURN "f3"
		OTHERWISE RETURN 0
	END CASE
END FUNCTION