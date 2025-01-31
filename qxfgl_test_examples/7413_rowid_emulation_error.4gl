#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
	DEFINE 
		l_rowid INTEGER,
		l_char CHAR(1)

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7413
	CREATE TABLE lyc_7413
	(col_char CHAR(1))
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7413 VALUES("a")
	INSERT INTO lyc_7413 VALUES("b")
	INSERT INTO lyc_7413 VALUES("c")

	DECLARE cur CURSOR
		FOR SELECT rowid, col_char FROM lyc_7413
			ORDER BY rowid

	FOREACH cur INTO l_rowid, l_char
		DISPLAY l_rowid,"    ",l_char
	END FOREACH
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE	

	DELETE FROM lyc_7413 WHERE col_char = "b"
	FOREACH cur INTO l_rowid, l_char
		DISPLAY l_rowid,"    ",l_char
	END FOREACH
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7413 VALUES("d")
	FOREACH cur INTO l_rowid, l_char
		DISPLAY l_rowid,"    ",l_char
	END FOREACH
	DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN
