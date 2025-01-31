FUNCTION mandant_lesen (f1)
	DEFINE f1 CHAR (25)
 		WHENEVER ERROR CALL function_from_another_program
END FUNCTION

FUNCTION erste_satzart(f2)
	DEFINE ruf_func CHAR (25),
		f2 INTEGER
	WHENEVER ERROR CALL function_from_another_program
END FUNCTION

FUNCTION min_satzart(f3)
	DEFINE f3 INTEGER,
		ruf_func CHAR (25)
	WHENEVER ERROR CALL function_from_another_program
END FUNCTION