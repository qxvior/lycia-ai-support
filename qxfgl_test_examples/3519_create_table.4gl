DATABASE stores
MAIN
--First of all I created the table in the DATABASE
WHENEVER ANY ERROR CONTINUE
	DROP TABLE borrar555
	CREATE table borrar555
		(numero INTEGER,
		  texto TEXT)
WHENEVER ANY ERROR STOP
   DISPLAY status
END MAIN       