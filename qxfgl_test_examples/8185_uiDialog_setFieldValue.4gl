MAIN
	DEFINE country DYNAMIC ARRAY OF STRING
	OPEN WINDOW w WITH FORM "8185/8185_uiDialog_setFieldValue"
	LET country[1] = "old"
	INPUT ARRAY country WITHOUT DEFAULTS FROM country.*
		ON ACTION "set"
			CALL ui.Dialog.GetCurrent().SetFieldValue("country", "new")
	END INPUT
END MAIN