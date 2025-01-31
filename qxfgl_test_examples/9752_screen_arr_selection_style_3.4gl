MAIN
 DEFINE i INT
 DEFINE rec ARRAY [1000] OF RECORD 
       f1,f2,f3,f4 INTEGER 
       END RECORD 

	OPEN WINDOW w1 WITH FORM "9752/9752_screen_arr_selection_style_3" ATTRIBUTE (BORDER)
	FOR i = 1 TO 100
		LET rec[i].f1 = i  
		LET rec[i].f2 = i
		LET rec[i].f3 = i
		LET rec[i].f4 = i
	END FOR
	CALL SET_COUNT(100)
	CALL fgl_setactionlabel("nextpage","nextpage")
	DISPLAY ARRAY rec TO rec.*
END MAIN