GLOBALS
	DEFINE my_rec_type TYPE AS RECORD
		v1 INT,
		v2 FLOAT
	END RECORD
	DEFINE my_rec my_rec_type
END GLOBALS

MAIN
	LET my_rec.v2 = 5
	CALL my_f(my_rec)
END MAIN

FUNCTION my_f(p my_rec_type)
	DISPLAY p
END FUNCTION