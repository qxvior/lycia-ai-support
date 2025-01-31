MAIN
	DEFINE c ARRAY[10] OF CHAR(10)
	WHENEVER ANY ERROR CONTINUE
	-- NEW TAI LUE DIGITS
	LET c[1] = "᧐" -- 0
	LET c[2] = "᧑" -- 1
	LET c[3] = "᧒" -- 2
	LET c[4] = "᧓" -- 3
	LET c[5] = "᧔" -- 4
	LET c[6] = "᧕" -- 5
	LET c[7] = "᧖" -- 6
	LET c[8] = "᧗" -- 7
	LET c[9] = "᧘" -- 8
	LET c[10] = "᧙" -- 9
	CALL convert( c, "SINGLE" )

	-- NEW TAI LUE DIGITS
	LET c[1] = "1᧐" -- 0
	LET c[2] = "1᧑" -- 1
	LET c[3] = "1᧒" -- 2
	LET c[4] = "1᧓" -- 3
	LET c[5] = "1᧔" -- 4
	LET c[6] = "1᧕" -- 5
	LET c[7] = "1᧖" -- 6
	LET c[8] = "1᧗" -- 7
	LET c[9] = "1᧘" -- 8
	LET c[10] = "1᧙" -- 9
	CALL convert( c, "MIX #1" )

	-- NEW TAI LUE DIGITS
	LET c[1] = "᧐1" -- 0
	LET c[2] = "᧑1" -- 1
	LET c[3] = "᧒1" -- 2
	LET c[4] = "᧓1" -- 3
	LET c[5] = "᧔1" -- 4
	LET c[6] = "᧕1" -- 5
	LET c[7] = "᧖1" -- 6
	LET c[8] = "᧗1" -- 7
	LET c[9] = "᧘1" -- 8
	LET c[10] = "᧙1" -- 9
	CALL convert( c, "MIX #2" )

	-- NEW TAI LUE DIGITS
	LET c[1] = "1᧐1" -- 0
	LET c[2] = "1᧑1" -- 1
	LET c[3] = "1᧒1" -- 2
	LET c[4] = "1᧓1" -- 3
	LET c[5] = "1᧔1" -- 4
	LET c[6] = "1᧕1" -- 5
	LET c[7] = "1᧖1" -- 6
	LET c[8] = "1᧗1" -- 7
	LET c[9] = "1᧘1" -- 8
	LET c[10] = "1᧙1" -- 9
	CALL convert( c, "MIX #3" )

	-- OTHERS
	DISPLAY displayRow( 1, "三", "CJK" )
END MAIN

FUNCTION convert( c, prefix )
	DEFINE c ARRAY[10] OF CHAR(10)
	DEFINE prefix STRING
	DEFINE i INT
	FOR i = 1 TO 10
		CALL displayRow( i, c[i], prefix )
	END FOR
END FUNCTION

FUNCTION displayRow( i, c, prefix )
	DEFINE i INT
	DEFINE c CHAR(10)
	DEFINE prefix STRING
	DISPLAY prefix, "[", i, "]: ", c, toDecimal(c)
	DISPLAY prefix, "[", i, "]: ", c, toInt(c)
	DISPLAY prefix, "[", i, "]: ", c, toFloat(c)
	DISPLAY "================================================================================"
END FUNCTION

FUNCTION toDecimal( c )
	DEFINE c STRING
	DEFINE d DECIMAL(32)
	DEFINE d_status INT
	DEFINE d_str CHAR(10)
	LET d = c
	LET d_status = STATUS
	LET d_str = d
	LET c = " | DECIMAL: {{V:", d_str, "},{S:", d_status, "},{N:", d IS NULL, "}}"
	RETURN c
END FUNCTION

FUNCTION toInt( c )
	DEFINE c STRING
	DEFINE d INT
	DEFINE d_status INT
	DEFINE d_str CHAR(10)
	LET d = c
	LET d_status = STATUS
	LET d_str = d
	LET c = " | INT    : {{V:", d_str, "},{S:", d_status, "},{N:", d IS NULL, "}}"
	RETURN c
END FUNCTION

FUNCTION toFloat( c )
	DEFINE c STRING
	DEFINE d FLOAT
	DEFINE d_status INT
	DEFINE d_str CHAR(10)
	LET d = c
	LET d_status = STATUS
	LET d_str = d
	LET c = " | FLOAT  : {{V:", d_str, "},{S:", d_status, "},{N:", d IS NULL, "}}"
	RETURN c
END FUNCTION