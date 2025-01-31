#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
	DEFINE
		v_char_1 CHAR(80),
		v_char_2 CHAR(80)

	WHENEVER ERROR CONTINUE
	DROP TABLE lyc_7780_load_error
	CREATE TABLE lyc_7780_load_error
	(col_char_1 CHAR(80),
 	 col_char_2 CHAR(80)
	)

   DECLARE cur CURSOR FOR
      SELECT nvl(col_char_1,'null'),nvl(col_char_2,'null') FROM lyc_7780_load_error 

	LOAD FROM "7780/7780_load_error.unl" INSERT INTO lyc_7780_load_error
--	LOAD FROM "7780/7780_load_error.unl" DELIMITER ";" INSERT INTO lyc_7780_load_error --> With the phrase DELIMITER ";" LOAD statement works correctly!
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY "SQLCA.SQLCODE = ",SQLCA.SQLCODE EXIT PROGRAM END IF

   FOREACH cur INTO v_char_1,v_char_2
      DISPLAY v_char_1 CLIPPED,v_char_2 CLIPPED       
   END FOREACH

	DROP TABLE lyc_7780_load_error
END MAIN
