MAIN
	DEFINE targetArray,targetArray2 ARRAY[4] OF SMALLINT
	DEFINE sourceArray ARRAY[4] OF INT
	WHENEVER ANY ERROR CONTINUE
	LET targetArray[1] = 5
	LET targetArray[2] = 5
	LET targetArray[3] = 5
	LET targetArray[4] = 5
	LET targetArray2[1] = 5
	LET targetArray2[2] = 5
	LET targetArray2[3] = 5
	LET targetArray2[4] = 5
    DISPLAY STATUS, targetArray
	LET sourceArray[1] = 1000000
	LET sourceArray[2] = 10
	LET sourceArray[3] = 1000000
	LET sourceArray[4] = 10
	DISPLAY STATUS, sourceArray
#return overflow
	CALL forArray( sourceArray ) RETURNING targetArray
	DISPLAY STATUS, targetArray
#let overflow
	LET targetArray2 = forArray( sourceArray )
	DISPLAY STATUS, targetArray2
END MAIN
FUNCTION forArray( sourceArray )
	DEFINE sourceArray ARRAY[4] OF INT
	RETURN sourceArray
END FUNCTION