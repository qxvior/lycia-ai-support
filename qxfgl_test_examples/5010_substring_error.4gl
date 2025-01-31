MAIN
	DEFINE s CHAR(9)
	DEFINE res char(10)
	LET s = "123456789"

LET res = s[2][3]
DISPLAY s[2][3]
	
LET res = s[1][2][3][4][5]
DISPLAY s[1][2][3][4][5] 

END MAIN