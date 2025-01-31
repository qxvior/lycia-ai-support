MAIN
DEFINE
    p_czm ARRAY[200] OF RECORD
        country_code CHAR(3),
        country_desc CHAR(30)
    END RECORD
    CALL fgl_putenv("QX_COMPAT=Informix4GL")

	OPEN WINDOW win_czm WITH FORM "7158/7158_find_crash" ATTRIBUTE(BORDER)
	CALL set_count(3)
	LET p_czm[1].country_code="STV" 
	LET p_czm[1].country_desc= "St. Vincent"         
	LET p_czm[3].country_code="TT" 
	LET p_czm[3].country_desc= "Trinidad & Tobago"   
	LET p_czm[2].country_code="TUR" 
	LET p_czm[2].country_desc= "Turks & Caicos"   
	DISPLAY ARRAY p_czm TO s_czm.*
	DISPLAY "OK"
	CALL fgl_getkey()
END MAIN