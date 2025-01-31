MAIN
DEFINE tarr dynamic array of record modulname,beschreibung,schluessel,frei CHAR(20) END RECORD
DEFINE i INT
FOR i=1 to 100
LET tarr[i].modulname=i 
END FOR
OPEN WINDOW w WITH FORM "1277/1277_form_jumps"

INPUT ARRAY tarr FROM s_modkey.* ATTRIBUTE(WITHOUT DEFAULTS) 
END MAIN