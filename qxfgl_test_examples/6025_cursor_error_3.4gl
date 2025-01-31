DATABASE stores
DEFINE lc_sql CHAR(200)

MAIN
DEFINE f1,f2 CHAR(3)

	CREATE TEMP TABLE t_customer(
		f1 INT,
		f2 CHAR(3)
		)
              
	LET lc_sql = "INSERT INTO t_customer VALUES (?,?) "
	PREPARE pi_cntr_quote_field FROM lc_sql
	DECLARE ci_cntr_quote_field CURSOR FOR pi_cntr_quote_field
	BEGIN WORK
	DISPLAY "BEGIN"	                
	OPEN ci_cntr_quote_field  --first open
	PUT ci_cntr_quote_field FROM "1","ln1" --first put          
	              
	PUT ci_cntr_quote_field FROM "2","ln2" --second put          
              
	#check inserted data
	DECLARE c CURSOR FOR SELECT * FROM t_customer
	FOREACH c INTO f1,f2
		DISPLAY f1,f2
	END FOREACH
	COMMIT WORK
	DISPLAY "COMMIT"
	FOREACH c INTO f1,f2
		DISPLAY f1,f2
	END FOREACH	
	DISPLAY "PASSED"
END MAIN

