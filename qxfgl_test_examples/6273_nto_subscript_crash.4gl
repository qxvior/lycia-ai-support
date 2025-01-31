MAIN
	DEFINE s STRING
	DEFINE c CHAR(10)
	LET c = "abcdefghij"
	LET s = f1()         DISPLAY "|",s,"|"
	LET s = f2()         DISPLAY "|",s,"|"
	LET s = f3()         DISPLAY "|",s,"|"
	LET s = f4()         DISPLAY "|",s,"|"
	LET s = f5( c )      DISPLAY "|",s,"|"
	LET s = f5( c[5] )   DISPLAY "|",s,"|"
	LET s = f5( c[5,6] ) DISPLAY "|",s,"|"
	LET s = f6( c )      DISPLAY "|",s,"|"
	LET s = f6( c[5] )   DISPLAY "|",s,"|"
	LET s = f6( c[5,6] ) DISPLAY "|",s,"|"
END MAIN

FUNCTION f1()
	DEFINE c CHAR(10)
	LET c = "1234567890"
	RETURN c[5]
END FUNCTION

FUNCTION f2()
	DEFINE c CHAR(10)
	LET c = "1234567890"
	RETURN c[5,6]
END FUNCTION

FUNCTION f3()
	DEFINE c STRING
	LET c = "1234567890"
	RETURN c[5]
END FUNCTION

FUNCTION f4()
	DEFINE c STRING
	LET c = "1234567890"
	RETURN c[5,6]
END FUNCTION

FUNCTION f5( c )
	DEFINE c CHAR(10)
	RETURN c
END FUNCTION

FUNCTION f6( c )
	DEFINE c STRING
	RETURN c
END FUNCTION