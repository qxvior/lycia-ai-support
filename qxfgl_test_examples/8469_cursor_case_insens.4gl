DATABASE stores
MAIN
	DEFINE c_sql CHAR(100)
	DEFINE r_ca RECORD LIKE customer.*
	INITIALIZE c_sql, r_ca TO NULL
	
	create temp table tcustomer(
	customer_num int,
	address2 CHAR(30)
	)
    INSERT INTO tcustomer VALUES (101,'my_val')
	LET c_sql = "SELECT * FROM tcustomer WHERE customer_num = 101 FOR UPDATE"
	PREPARE p_upd_cursor FROM c_sql
	DECLARE c_upd_cursor CURSOR FOR p_upd_cursor
	LET c_sql = "UPDATE tcustomer SET address2 = 'upd_cursor_test' Where CUrReNT Of c_upd_cursor"
	PREPARE p_upd_ca FROM c_sql
	begin work
	FOREACH c_upd_cursor INTO r_ca.*
	    EXECUTE p_upd_ca
	END FOREACH
	commit work
	SELECT address2 INTO c_sql FROM tcustomer WHERE customer_num = 101
	DISPLAY c_sql
END MAIN