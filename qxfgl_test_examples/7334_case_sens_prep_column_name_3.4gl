#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
DEFINE
	l_count INTEGER,
	stmt CHAR(1024)

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_3
	LET stmt = "CREATE TABLE lyc_7334_3(col_char CHAR(1),COL_CHAR CHAR(1))"
	PREPARE prep_stmt_1 FROM stmt
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	EXECUTE prep_stmt_1
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'lyc_7334_3' AND
		      COLUMN_NAME = 'col_char';
	END SQL
	DISPLAY "3. l_count = ",l_count

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.COLUMNS
		WHERE TABLE_NAME = 'lyc_7334_3' AND
		      COLUMN_NAME = 'COL_CHAR';
	END SQL
	DISPLAY "4. l_count = ",l_count

END MAIN
