MAIN
	DEFINE f1,f2,f3 CHAR(5)
	DEFINE tarr DYNAMIC ARRAY OF CHAR(5)
	OPEN WINDOW w WITH FORM "6710/6710_screen_arr_focus_dialog" ATTRIBUTE(BORDER)
	LET tarr[1]="row1"
	DIALOG
		INPUT BY NAME f1
		END INPUT
		INPUT ARRAY tarr FROM tarr.* ATTRIBUTE(AUTO APPEND = FALSE)
		END INPUT
		INPUT BY NAME f2
		END INPUT
		ON ACTION EXIT 
			EXIT DIALOG
	END DIALOG
	
END MAIN 