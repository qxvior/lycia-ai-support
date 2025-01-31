MAIN
DEFINE i INT
DEFINE tarr DYNAMIC ARRAY OF RECORD 
								f1 INT,
								f2 INT,
								f3 DATE,
								f4 STRING,
								f5 STRING,
								f6 INT,
								f7 INT,
								f8 INT,
								f9 CHAR(20),
								f10 CHAR(20)
							END RECORD

OPEN WINDOW w1 WITH FORM "4438/4438_table_data_redraw" ATTRIBUTE(BORDER)

FOR i=1 TO 20
	LET tarr[i].f1 = 1
	LET tarr[i].f2 = 1
	LET tarr[i].f3 = "01/01/01"
	LET tarr[i].f4 = "val2"
	LET tarr[i].f5 = "val2"
	LET tarr[i].f6 = 50
	LET tarr[i].f7 = 50
	LET tarr[i].f8 = 50
	LET tarr[i].f9 = "text",trim(i)
	LET tarr[i].f10 = "01:01:01"
END FOR

INPUT ARRAY tarr FROM tarr.* ATTRIBUTE (WITHOUT DEFAULTS)
	ON ACTION FILTER1
	clear form
		INPUT tarr[1].* FROM tarr.*
			ON ACTION "DO NOTHING"
				EXIT INPUT
	    END INPUT
END INPUT
CLEAR FORM
CALL fgl_getkey()
END MAIN