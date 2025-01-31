FUNCTION getFormPath(formName)
	DEFINE formName, fullFormName STRING
	
	LET fullFormName = "form/1080x1920/", trim(formName)
	RETURN fullFormName
END FUNCTION