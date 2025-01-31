MAIN
DEFINE f1,f2,f3,f4 STRING
	LET f1 = "default1"
	LET f2 = "default2"
	LET f3 = "default3"
	LET f4 = "default4"
	OPEN WINDOW w WITH FORM "7840/7840_noteditable_form_property" ATTRIBUTE(BORDER)
	INPUT BY NAME f1,f2,f3,f4
	DISPLAY "f1:",f1,"|"
	DISPLAY "f2:",f2,"|"
	DISPLAY "f3:",f3,"|"
	DISPLAY "f4:",f4,"|"
END MAIN