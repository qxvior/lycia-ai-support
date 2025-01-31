DATABASE stores
MAIN
DEFINE sqltype, sqllen INT
create temp table temp_customer(
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