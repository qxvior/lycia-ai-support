DATABASE stores
MAIN
 DEFINE i INT

	PREPARE p FROM "select 1 FROM systables where tabid=1"
	DECLARE cur CURSOR FOR p
	FOREACH cur INTO i
	END FOREACH
	CALL fgl_getkey()
END MAIN