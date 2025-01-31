MAIN
DEFINE fuer DYNAMIC ARRAY OF CHAR(2),
       i INTEGER

FOR i=1 TO 80
	LET fuer[i]=i
END FOR
   
   OPEN WINDOW w01 WITH FORM "2015/2015_scrollbar_id_conversion"
      DISPLAY ARRAY fuer TO was.*
END MAIN