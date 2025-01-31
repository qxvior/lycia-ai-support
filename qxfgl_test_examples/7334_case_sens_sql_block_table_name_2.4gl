#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_2
	SQL CREATE TABLE lyc_7334_2(col_char CHAR(1)) END SQL
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE LYC_7334_2
	SQL CREATE TABLE LYC_7334_2(col_char CHAR(1)) END SQL
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_2'
	END SQL
	DISPLAY "3. l_count = ",l_count

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'LYC_7334_2'
	END SQL
	DISPLAY "4. l_count = ",l_count

END MAIN
