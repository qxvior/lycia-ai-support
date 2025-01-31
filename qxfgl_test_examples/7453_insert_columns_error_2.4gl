#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
	DEFINE
		l_serial INTEGER,
		l_char_1 CHAR(1),
		l_char_2 CHAR(1)

	WHENEVER ERROR CONTINUE

	DROP TABLE lyc_7453_1
	CREATE TABLE lyc_7453_1
	(
	col_serial INTEGER NOT NULL,
	col_char_1 CHAR(1),
	col_char_2 CHAR(1)
	)
	DISPLAY "1.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7453_2
	CREATE TABLE lyc_7453_2
	(
	col_char_1 CHAR(1),
	col_serial INTEGER NOT NULL,
	col_char_2 CHAR(1)
	)
	DISPLAY "2.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DROP TABLE lyc_7453_3
	CREATE TABLE lyc_7453_3
	(
	col_char_1 CHAR(1),
	col_char_2 CHAR(1),
	col_serial INTEGER NOT NULL
	)
	DISPLAY "3.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	######################### lyc_7453_1 #########################
	INSERT INTO lyc_7453_1(col_serial,col_char_1) VALUES(1,"a")
	INSERT INTO lyc_7453_1(col_serial,col_char_1) VALUES(2,"b")
	INSERT INTO lyc_7453_1(col_serial,col_char_1) VALUES(3,"c")

	DECLARE cur_1 CURSOR
	FOR SELECT col_serial, col_char_1 FROM lyc_7453_1
	ORDER BY col_serial

	FOREACH cur_1 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "4.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DELETE FROM lyc_7453_1 WHERE col_serial = 2
	FOREACH cur_1 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "5.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7453_1(col_serial,col_char_1) VALUES(4,"d")
	FOREACH cur_1 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "6.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	######################### lyc_7453_2 #########################
	INSERT INTO lyc_7453_2(col_serial,col_char_2) VALUES(1,"a")
	INSERT INTO lyc_7453_2(col_serial,col_char_2) VALUES(2,"b")
	INSERT INTO lyc_7453_2(col_serial,col_char_2) VALUES(3,"c")

	DECLARE cur_2 CURSOR
	FOR SELECT col_serial, col_char_2 FROM lyc_7453_2
	ORDER BY col_serial

	FOREACH cur_2 INTO l_serial, l_char_2
	DISPLAY l_serial,"    ",l_char_2
	END FOREACH
	DISPLAY "7.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DELETE FROM lyc_7453_2 WHERE col_serial = 2
	FOREACH cur_2 INTO l_serial, l_char_2
	DISPLAY l_serial,"    ",l_char_2
	END FOREACH
	DISPLAY "8.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7453_2(col_serial,col_char_2) VALUES(4,"d")
	FOREACH cur_2 INTO l_serial, l_char_2
	DISPLAY l_serial,"    ",l_char_2
	END FOREACH
	DISPLAY "9.  SQLCA.SQLCODE = ",SQLCA.SQLCODE

	######################### lyc_7453_3 #########################
	INSERT INTO lyc_7453_3(col_serial,col_char_1) VALUES(1,"a")
	INSERT INTO lyc_7453_3(col_serial,col_char_1) VALUES(2,"b")
	INSERT INTO lyc_7453_3(col_serial,col_char_1) VALUES(3,"c")

	DECLARE cur_3 CURSOR
	FOR SELECT col_serial, col_char_1 FROM lyc_7453_3
	ORDER BY col_serial

	FOREACH cur_3 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "10. SQLCA.SQLCODE = ",SQLCA.SQLCODE

	DELETE FROM lyc_7453_3 WHERE col_serial = 2
	FOREACH cur_3 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "11. SQLCA.SQLCODE = ",SQLCA.SQLCODE

	INSERT INTO lyc_7453_3(col_serial,col_char_1) VALUES(4,"d")
	FOREACH cur_3 INTO l_serial, l_char_1
	DISPLAY l_serial,"    ",l_char_1
	END FOREACH
	DISPLAY "12. SQLCA.SQLCODE = ",SQLCA.SQLCODE

END MAIN