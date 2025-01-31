MAIN
	DISPLAY f()
END MAIN

FUNCTION f() RETURNS (INT, STRING)
	DEFINE response web.Response
	RETURN 0, response.getTextResponse()
END FUNCTION