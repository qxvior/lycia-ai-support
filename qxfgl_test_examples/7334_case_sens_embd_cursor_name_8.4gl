#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores_CS
MAIN
	DEFINE
		l_count INTEGER

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7334_8
	CREATE TABLE lyc_7334_8
	(col_char CHAR(1))
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7334_8 VALUES("a") 
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DECLARE cursor_1 CURSOR FOR
		SELECT COUNT(*) FROM lyc_7334_8

	DECLARE CURSOR_1 CURSOR FOR
		SELECT COUNT(*) FROM lyc_7334_8

	LET l_count = 0 
	FOREACH cursor_1 INTO l_count
	END FOREACH
	DISPLAY "3. l_count = ",l_count

	LET l_count = 0
	FOREACH CURSOR_1 INTO l_count
	END FOREACH
	DISPLAY "4. l_count = ",l_count

END MAIN
