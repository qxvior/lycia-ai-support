MAIN
	DEFINE arr DYNAMIC ARRAY OF RECORD c01,c02,c03,c04,c05,c06,c07,c08,c09,c10,c11,c12,c13,c14,c15,c16 CHAR(20) END RECORD
DEFINE i INT

	OPEN WINDOW w WITH FORM "1352/1352_table_row_resize" 


FOR i=1 TO 100
LET arr[i].c01="Row-",i
LET arr[i].c04="Row-",i
LET arr[i].c06="Row-",i
LET arr[i].c07="Row-",i
LET arr[i].c14="Row-",i
LET arr[i].c16="Row-",i
END FOR
DISPLAY ARRAY arr to sc.*
END MAIN