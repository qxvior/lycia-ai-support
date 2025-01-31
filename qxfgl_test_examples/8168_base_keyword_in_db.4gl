DATABASE stores
MAIN
DEFINE base_frf  INT

    CREATE TEMP TABLE p_fac(
        code_tva CHAR(2),
        base INT
    )
	
	INSERT INTO p_fac VALUES (1,1)
	INSERT INTO p_fac VALUES (2,2)
	
    SELECT SUM(base) INTO base_frf
    FROM p_fac
	DISPLAY base_frf
END MAIN