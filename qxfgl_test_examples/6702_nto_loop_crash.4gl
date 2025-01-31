MAIN
	DEFINE cv CHAR(40)
	DEFINE rv DECIMAL(32)
	DEFINE i INT
	LET cv = "1234567890123456789"
	FOR i = 1 TO 50000
		LET rv = (cv[9,10] * 10000) +
		         (cv[12,13] * 360)  +
		         (cv[15,16] * 60)   +
		         cv[18,19]
	END FOR
	DISPLAY "Done"
END MAIN