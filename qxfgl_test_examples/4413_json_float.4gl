MAIN
	DEFINE i FLOAT
	WHENEVER ANY ERROR CONTINUE
	LET i = 1234567891.23456789

	DISPLAY status, ": ", util.JSON.stringify(i)
	DISPLAY status, ": ", util.JSON.format(i)
	DISPLAY status, ": ", util.JSON.proposeType(i)

	DISPLAY "Done"
END MAIN