MAIN
	DEFINE l_where2_text NCHAR(20)
	DEFINE i SMALLINT
	
	LET l_where2_text = "order='Hubert'"
	FOR i = 1 TO (length(l_where2_text)-4) 
		IF l_where2_text[i,i+4] = "order" THEN 
			LET l_where2_text[i,i+4] = " pick" #uses it like LET l_where2_text[i,i+4] = "pick" or "pick " 
		END IF 
	END FOR
	DISPLAY "|",l_where2_text,"|"
END MAIN