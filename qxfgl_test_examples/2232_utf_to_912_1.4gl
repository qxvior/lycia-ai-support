database sk912
MAIN
DEFINE qstr char(3000)
DEFINE zzz CHAR(20)
create temp table whois(    last_name varchar(122,0)    )
INSERT INTO whois VALUES ("Šatala") 
LET qstr='select * from whois WHERE last_name matches "[SsŠš][AaÁáÄä][TtŤť][AaÁáÄä][LlĹĺĽľ][AaÁáÄä]"'

PREPARE prkpc_02 FROM qstr

EXECUTE prkpc_02 INTO zzz

DISPLAY zzz CLIPPED

END MAIN