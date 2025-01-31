FUNCTION secondInput()
 DEFINE f1,f2 STRING
	OPEN WINDOW w WITH FORM "6320/6320_next_field_in_function" ATTRIBUTE(BORDER)
	INPUT BY NAME f1,f2
		ON ACTION moveToF2
			CALL nextFieldDialog()
	END INPUT
END FUNCTION

FUNCTION nextFieldDialog()
  CALL ui.DIALOG.GetCurrent().nextField("f2") #must compile without errors
END FUNCTION