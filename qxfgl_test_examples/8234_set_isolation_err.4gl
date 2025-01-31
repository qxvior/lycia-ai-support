DATABASE stores

MAIN
	PREPARE p_committed FROM "set isolation committed read"
	CLOSE DATABASE
	DATABASE stores
	PREPARE p_committed FROM "set isolation committed read"
	PREPARE p_select FROM "select 1 from systables where tabid = ?"
	EXECUTE p_committed
	DISPLAY "Done"
END MAIN