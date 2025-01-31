#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	SQL DROP TABLE lyc_7334_6 END SQL
	SQL
	CREATE TABLE lyc_7334_6
	(col_char CHAR(1),
	 COL_CHAR CHAR(1))
	END SQL
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL DROP TABLE LYC_7334_6 END SQL
	SQL
	CREATE TABLE LYC_7334_6
	(col_char CHAR(1),
	 COL_CHAR CHAR(1))
	END SQL
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE	

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_6'
	END SQL
	DISPLAY "3. l_count = ",l_count
	
	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'LYC_7334_6'
	END SQL
	DISPLAY "4. l_count = ",l_count
	
END MAIN
