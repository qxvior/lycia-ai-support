#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE StOrEs_cs
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_1
	CREATE TABLE lyc_7334_1
	(col_char CHAR(1))
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_1'
	END SQL
	DISPLAY "2. l_count = ",l_count

END MAIN
