MAIN
DEFINE utf CHAR(20)
DEFINE cp819 CHAR(20)

CALL fgl_putenv("CLIENT_LOCALE=en_us.utf8")
CALL fgl_putenv("DB_LOCALE=en_us.utf8")


CONNECT TO "utf_test"
CREATE TEMP TABLE for_utf(
f1 CHAR(20))
IF STATUS = 0 THEN DISPLAY "1. Temp table for_utf created without errors" 
ELSE DISPLAY "2. Table for_utf isn't created" END IF


INSERT INTO for_utf VALUES ("ä")
IF STATUS = 0 THEN DISPLAY "3. UTF value inserted successfully"
ELSE DISPLAY "4. UTF insert error" END IF	


SELECT * INTO utf FROM for_utf
IF STATUS = 0 THEN DISPLAY "5. Successfully selected: '",trim(utf),"'"
ELSE DISPLAY "6. Selection error" END IF	


DISCONNECT "utf_test"
IF STATUS = 0 THEN DISPLAY "7. Disconnected successfully"
ELSE DISPLAY "8. Disconnection error" END IF	




CALL fgl_putenv("DB_LOCALE=en_us.819")
CONNECT TO "stores_demo"
IF STATUS = 0 THEN DISPLAY "9. Connection to for_utf_in_819 successful" 
ELSE DISPLAY "10. Connection failed to for_utf_in_819 " END IF


CREATE TEMP TABLE for_utf_in_819(
f1 CHAR(20))
IF STATUS = 0 THEN DISPLAY "11. Temp table for_utf_in_819 created without errors" 
ELSE DISPLAY "12. Table for_utf_in_819 isn't created" END IF


INSERT INTO for_utf_in_819 VALUES (utf) 
IF STATUS = 0 THEN DISPLAY "13. UTF value inserted successfully to 819"
ELSE DISPLAY "14. UTF insert error" END IF	


SELECT * INTO cp819 FROM for_utf_in_819
IF STATUS = 0 THEN DISPLAY "15. Data from 819 is selected:'",trim(cp819),"'" 
ELSE DISPLAY "16. Data isn't selected" END IF
END MAIN