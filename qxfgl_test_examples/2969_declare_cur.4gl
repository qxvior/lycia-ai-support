MAIN
DEFINE stores_result,stores_demo_result SMALLINT
DEFINE qstr CHAR (500)
	CONNECT TO "stores@querix_test" USER "informix" USING "default2375"
	WHENEVER ERROR CONTINUE
		DROP TABLE lyc_5555_1
		CREATE TABLE lyc_5555_1(id SERIAL)
	WHENEVER ERROR STOP
	INSERT INTO lyc_5555_1 VALUES(1)
	
	CONNECT TO "stores_demo@querix_test" USER "informix" USING "default2375"
	WHENEVER ERROR CONTINUE
		DROP TABLE lyc_5555_1
		CREATE TABLE lyc_5555_1(id SERIAL)
		DROP TABLE lyc_5555_2
		CREATE TABLE lyc_5555_2(id SERIAL)
	WHENEVER ERROR STOP
	INSERT INTO lyc_5555_1 VALUES(2)
	INSERT INTO lyc_5555_2 VALUES(2)

	DECLARE post CURSOR FOR select s.id col1, (select max(s.id) from lyc_5555_1 s, lyc_5555_2 z where s.id=z.id) col1 from stores:lyc_5555_1 s
	FOREACH post INTO stores_result,stores_demo_result
		DISPLAY "stores_result",stores_result
		DISPLAY "stores_demo_result",stores_demo_result
	END FOREACH
END MAIN