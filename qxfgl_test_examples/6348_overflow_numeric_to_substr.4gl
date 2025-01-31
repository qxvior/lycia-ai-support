MAIN
	DEFINE v TINYINT
	DEFINE s1, s2 CHAR(1)
	LET v = 10

	LET s1 = v
	DISPLAY "|", s1, "|"

	LET s2[1] = v
	DISPLAY "|", s2, "|"
END MAIN