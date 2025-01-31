MAIN
	DEFINE targetArray,targetArray2 ARRAY[2] OF SMALLINT
	DEFINE sourceArray ARRAY[2] OF INT
	WHENEVER ANY ERROR CONTINUE
	LET targetArray[1] = 5
	LET targetArray[2] = 5
	LET targetArray2[1] = 5
	LET targetArray2[2] = 5
    DISPLAY STATUS, targetArray
	LET sourceArray[1] = 1000000
	LET sourceArray[2] = 1000000
	DISPLAY STATUS, sourceArray

#return overflow
	CALL forArray( sourceArray ) RETURNING targetArray
	DISPLAY STATUS, targetArray
	IF targetArray[2] IS NULL THEN DISPLAY "NULL" END IF
#let overflow
	LET targetArray2 = forArray( sourceArray )
	DISPLAY STATUS, targetArray2
	IF targetArray2[2] IS NULL THEN DISPLAY "NULL" END IF
	
END MAIN
FUNCTION forArray( sourceArray )
	DEFINE sourceArray ARRAY[2] OF INT
	RETURN sourceArray
END FUNCTION