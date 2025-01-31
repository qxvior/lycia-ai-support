FUNCTION getFormPath(formName)
	DEFINE formName, fullFormName STRING
	
	LET fullFormName = "form/0640x0960/", trim(formName)
	RETURN fullFormName
END FUNCTION