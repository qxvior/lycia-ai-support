MAIN
 DEFINE i INT
 DEFINE rec ARRAY [1000] OF RECORD 
       f1,f2,f3 INTEGER 
       END RECORD 

	OPEN WINDOW w1 WITH FORM "9752/9752_screen_arr_selection_style_1" ATTRIBUTE (BORDER)
	FOR i = 1 TO 100
		LET rec[i].f1 = i  
		LET rec[i].f2 = i
		LET rec[i].f3 = i
	END FOR
	CALL SET_COUNT(100)
	DIALOG
		DISPLAY ARRAY rec TO table4.*
		END DISPLAY
		DISPLAY ARRAY rec TO rec.*
		END DISPLAY
		ON ACTION "exit"
			EXIT DIALOG
	END DIALOG
END MAIN