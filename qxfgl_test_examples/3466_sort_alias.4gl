DATABASE stores
MAIN
DEFINE l_count SMALLINT

SELECT
	COUNT(*)
INTO
	l_count
FROM stores_demo:customer sort ---Informix 4GL accept this alias, but Lycia says:Syntax error.
DISPLAY "STATUS", STATUS
DISPLAY "Records number", l_count
END MAIN