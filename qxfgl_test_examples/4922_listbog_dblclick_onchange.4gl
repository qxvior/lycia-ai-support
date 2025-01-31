MAIN
DEFINE f1 CHAR(20)
OPEN WINDOW w WITH FORM "4922/4922_listbog_dblclick_onchange"
INPUT BY NAME f1
	ON CHANGE f1
		DISPLAY "Listbox value:|",f1,"|"
	ON ACTION "dbl_click"
		DISPLAY "action double click"
END INPUT
END MAIN