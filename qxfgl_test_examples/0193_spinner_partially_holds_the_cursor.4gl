MAIN
DEFINE f1,f2,f3,f4,f5,f6,f7,f8,f9,f0 INTEGER
OPEN WINDOW w WITH FORM "0193/0193_spinner_partially_holds_the_cursor" ATTRIBUTE (BORDER)
INPUT BY NAME f1,f2,f3,f4,f5,f6
AFTER FIELD f1
	DISPLAY "Combobox:",f1
AFTER FIELD f2
	DISPLAY "FunctionField:",f2
AFTER FIELD f3
	DISPLAY "Spinner:",f3
AFTER FIELD f4
	DISPLAY "Listbox:",f4
AFTER FIELD f5
	DISPLAY "TextArea:",f5
AFTER FIELD f6
	DISPLAY "TextField:",f6
ON KEY ("B")
 display "B key pressed"
END INPUT
END MAIN