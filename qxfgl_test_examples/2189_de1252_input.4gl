DATABASE de1252

MAIN
  DEFINE in_znr, i INTEGER
  DEFINE in_buch_text CHAR(30)
  DEFINE arr_test DYNAMIC ARRAY OF RECORD
   						znr INTEGER,
   						buch_text CHAR(30)
   					END RECORD

	WHENEVER ERROR CONTINUE
	DROP TABLE ly_test
	CREATE TABLE ly_test (znr SERIAL, buch_text CHAR(30))
	INSERT INTO ly_test VALUES(1,"START צהüײִÜ ß END") 
	WHENEVER ERROR STOP

	LET in_buch_text= "צהüײִÜ"
	INSERT INTO ly_test VALUES (in_znr, in_buch_text)
	DECLARE test_cur CURSOR FOR		SELECT * FROM ly_test ORDER BY znr
	LET i = 1 	
	FOREACH test_cur INTO arr_test[i].*
		DISPLAY arr_test[i].*
		LET i = i + 1 
	END FOREACH 
			
END MAIN



