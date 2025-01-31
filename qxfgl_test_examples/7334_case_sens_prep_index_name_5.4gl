#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
DEFINE
	l_count INTEGER,
	stmt CHAR(1024)

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_5
	LET stmt = "CREATE TABLE lyc_7334_5	(col_int_1 INTEGER,col_int_2 INTEGER,col_char CHAR(1))"
	PREPARE prep_stmt_1 FROM stmt
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_1
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	LET stmt = "CREATE INDEX index_lyc_7334_5 ON lyc_7334_5 (col_int_1)"
	PREPARE prep_stmt_2 FROM stmt
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_2
	DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	LET stmt = "CREATE UNIQUE INDEX INDEX_lyc_7334_5 ON lyc_7334_5 (col_int_2)"
	PREPARE prep_stmt_3 FROM stmt
	DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_3
	DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE LYC_7334_6
	LET stmt = "	CREATE TABLE lyc_7334_6	(col_int INTEGER,col_char CHAR(1))"
	PREPARE prep_stmt_4 FROM stmt
	DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_4
	DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	LET stmt = "CREATE INDEX index_lyc_7334_5 ON lyc_7334_6 (col_int)"
	PREPARE prep_stmt_5 FROM stmt
	DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_5
	DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE
	SQL
		SELECT COUNT(*) INTO $l_count FROM sys.indexes
		WHERE name = 'index_lyc_7334_5' 
	END SQL
	DISPLAY "11. l_count = ",l_count
	
	SQL
		SELECT COUNT(*) INTO $l_count FROM sys.indexes
		WHERE name = 'INDEX_lyc_7334_5' 
	END SQL
	DISPLAY "12. l_count = ",l_count	

END MAIN
