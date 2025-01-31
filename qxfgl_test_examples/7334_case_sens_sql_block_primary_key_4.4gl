#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_1
	SQL CREATE TABLE lyc_7334_1(col_int INTEGER PRIMARY KEY CONSTRAINT pk_lyc_7334_1, col_char CHAR(1)) END SQL
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7334_2
	SQL CREATE TABLE lyc_7334_2(col_int  INTEGER PRIMARY KEY CONSTRAINT PK_LYC_7334_1,col_char CHAR(1)) END SQL
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_1'
	END SQL
	DISPLAY "3. l_count = ",l_count

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_2'
	END SQL
	DISPLAY "4. l_count = ",l_count

END MAIN

{
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
	(col_int INTEGER PRIMARY KEY CONSTRAINT pk_lyc_7334_1,
	 col_char CHAR(1))
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7334_2
	CREATE TABLE lyc_7334_2
	(col_int  INTEGER PRIMARY KEY CONSTRAINT PK_LYC_7334_1,
	 col_char CHAR(1))
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_1'
	END SQL
	DISPLAY "3. l_count = ",l_count
	
	SQL
		SELECT COUNT(*) INTO $l_count FROM INFORMATION_SCHEMA.TABLES
		WHERE TABLE_TYPE = 'BASE TABLE' AND 
				TABLE_NAME = 'lyc_7334_2'
	END SQL
	DISPLAY "4. l_count = ",l_count	

END MAIN
}
