#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_5
	CREATE TABLE lyc_7334_5
	(col_int_1 INTEGER,
	 col_int_2 INTEGER,
	 col_char CHAR(1))
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	CREATE INDEX index_lyc_7334_5 ON lyc_7334_5 (col_int_1)
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	CREATE UNIQUE INDEX INDEX_lyc_7334_5 ON lyc_7334_5 (col_int_2)
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7334_6
	CREATE TABLE lyc_7334_6
	(col_int  INTEGER,
	 col_char CHAR(1))
	DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE
	CREATE INDEX index_lyc_7334_5 ON lyc_7334_6 (col_int)
	DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM sys.indexes
		WHERE name = 'index_lyc_7334_5' 
	END SQL
	DISPLAY "6. l_count = ",l_count
	
	SQL
		SELECT COUNT(*) INTO $l_count FROM sys.indexes
		WHERE name = 'INDEX_lyc_7334_5' 
	END SQL
	DISPLAY "7. l_count = ",l_count	

END MAIN
