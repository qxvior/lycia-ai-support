MAIN
	DEFINE f1,f2,field_name STRING

	LET field_name="f1f2"

	OPEN WINDOW w WITH FORM "4445/4445_field_touched_variable_param"
	INPUT BY NAME f1,f2
		AFTER INPUT
			DISPLAY FIELD_TOUCHED(field_name[1,2])
			DISPLAY FIELD_TOUCHED(field_name[3,4])
	END INPUT
END MAIN