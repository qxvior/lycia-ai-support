DATABASE stores
MAIN
DEFINE a    INTEGER
DEFINE r_borrar555 RECORD LIKE borrar555.*
	FOR a=1 TO 20000
		IF a mod 1000 =0 THEN DISPLAY a END IF
	   INITIALIZE r_borrar555.* TO NULL
	   LET r_borrar555.numero = a
	   
	   START REPORT cvreport TO "lyciatest.txt"
	   OUTPUT TO report cvreport("this is a test")
	   FINISH REPORT cvreport
	   
	   LOCATE r_borrar555.texto IN FILE "lyciatest.txt"
	   
	   INSERT INTO borrar555 values (r_borrar555.*)
	END FOR
END MAIN
REPORT cvreport(linea1)
 DEFINE linea1 CHAR(1024)
    
 OUTPUT
     PAGE   LENGTH 1
     TOP    MARGIN  0
     LEFT   MARGIN  0
     BOTTOM MARGIN  0
FORMAT
 ON EVERY ROW
 PRINT linea1
END REPORT
