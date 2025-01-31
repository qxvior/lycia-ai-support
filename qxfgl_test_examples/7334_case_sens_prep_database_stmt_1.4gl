#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
	DEFINE
		l_count INTEGER,
		stmt CHAR(1024)

	WHENEVER ERROR CONTINUE

	LET stmt = "DATABASE StOrEs_cs"
	PREPARE prep_stmt FROM stmt
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7334_1
	CREATE TABLE lyc_7334_1
	(col_char CHAR(1))
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_1'
	END SQL
	DISPLAY "4. l_count = ",l_count

END MAIN
