DATABASE utf_test
MAIN
DEFINE sqltype, sqllen INT
WHENEVER ANY ERROR CONTINUE
DROP TABLE CUSTOMER
WHENEVER ANY ERROR STOP

CREATE TABLE CUSTOMER(
fname CHAR(20)
)

CREATE TEMP TABLE temp_customer(
i int
)


DISPLAY "CUSTOMER table:"
IF fgl_find_table("customer") THEN DISPLAY "FOUND" ELSE DISPLAY "NOT FOUND" END IF
DISPLAY "TEMP_CUSTOMER table:"
IF fgl_find_table("temp_customer") THEN DISPLAY "FOUND" ELSE DISPLAY "NOT FOUND" END IF
CALL fgl_column_info("customer","fname") RETURNING sqltype, sqllen 

DISPLAY "TEMP fgl_column_info:",sqltype, sqllen
INITIALIZE sqltype, sqllen TO NULL
CALL fgl_column_info("temp_customer","i") RETURNING sqltype, sqllen
DISPLAY "TEMP fgl_column_info:",sqltype, sqllen


END MAIN