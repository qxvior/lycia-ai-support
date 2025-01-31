MAIN
DEFINE tr DYNAMIC ARRAY OF RECORD	
		f1,f2 CHAR(20)
	END RECORD
	
	OPEN WINDOW w WITH FORM "2049/2049_table_col_doubleclick" ATTRIBUTE (BORDER)
	INPUT ARRAY tr FROM rec.*
		ON ACTION mc
		 DISPLAY "Click in first column"
		ON ACTION dbmc
		 DISPLAY "Doubleclick in second column"
	END INPUT
	END MAIN