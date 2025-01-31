DATABASE stores
MAIN
	DEFINE c CURSOR
	
	CALL c.Declare( "select 1 FROM systables where tabid=1" )
	CALL c.Open()
	CALL c.Close()
	CALL fgl_getkey()

	CALL fgl_getkey()
END MAIN