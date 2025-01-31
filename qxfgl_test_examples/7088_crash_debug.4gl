DATABASE stores
MAIN
	CALL show_ar()
	DISPLAY "ok"
END MAIN

FUNCTION ringMenu_init()
    WHENEVER ERROR CONTINUE
END FUNCTION

FUNCTION show_ar()
 DEFINE 
	i SMALLINT,
	bl DECIMAL(10,2),
	trand ARRAY[3000] OF RECORD 
	     bdate DATE,
	     balance DECIMAL(12,2)
	END RECORD

	CREATE TEMP TABLE art (
	    bdate DATE,
	    balance DECIMAL(12,2))

	LET i=1
    LET trand[i].bdate = "03/31/2019"
    INSERT INTO art VALUES (trand[i].*) 
    DECLARE totar CURSOR FOR SELECT * FROM art ORDER BY bdate DESC

	LET bl = 0 
	FOREACH totar INTO trand[i].*
		LET bl = bl + trand[i].balance 
		LET i = i + 1 
	END FOREACH
end function