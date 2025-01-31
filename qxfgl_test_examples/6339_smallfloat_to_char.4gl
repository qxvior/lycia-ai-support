MAIN
	DEFINE f SMALLFLOAT
	DEFINE s CHAR(3)
	DEFINE s1, s2 CHAR(4)

	LET f = 10.50
	LET s = f
	DISPLAY "|", s, "|"

	LET f = 10.5
	LET s1 = f
	DISPLAY "|", s1, "|"

	LET s2[1,3] = f
	DISPLAY "|", s2, "|"
END MAIN