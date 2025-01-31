#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      rec RECORD
   		r_char CHAR(80),
   		r_nchar NCHAR(80),
   		r_varchar VARCHAR(80),
   		r_nvarchar NVARCHAR(80),
   		r_lvarchar LVARCHAR(80),
   		r_decimal DECIMAL(32,16),
   		r_money MONEY(32,16),
   		r_integer INTEGER,
   		r_serial INTEGER,
	   	r_smallint SMALLINT,
   		r_bigint BIGINT,
   		r_int8   INT8,
   		r_serial8 INTEGER,
   		r_float  FLOAT,
   		r_smallfloat SMALLFLOAT,
		   r_datetime   DATETIME YEAR TO FRACTION,
			r_interval  INTERVAL YEAR TO MONTH,
			r_date DATE
		END RECORD,
		v_first INTEGER,
		v_char CHAR(80),
   	v_nchar NCHAR(80),
   	v_varchar VARCHAR(80),
   	v_nvarchar NVARCHAR(80),
   	v_lvarchar LVARCHAR(80),
   	v_decimal DECIMAL(32,16),
   	v_money MONEY(32,16),
   	v_integer INTEGER,
   	v_serial INTEGER,
	   v_smallint SMALLINT,
   	v_bigint BIGINT,
   	v_int8   INT8,
   	v_serial8 INTEGER,
   	v_float  FLOAT,
   	v_smallfloat SMALLFLOAT,
	   v_datetime   DATETIME YEAR TO FRACTION,
		v_interval  INTERVAL YEAR TO MONTH,
		v_date DATE

		LET v_char = "a"
   	LET v_nchar = "a"
   	LET v_varchar = "a"
   	LET v_nvarchar = "a"
   	LET v_lvarchar = "a"
   	LET v_decimal = 12.34
   	LET v_money = 12.34
   	LET v_integer = 1
   	LET v_serial = 1
	   LET v_smallint = 1
   	LET v_bigint = 1
   	LET v_int8 = 1
   	LET v_serial8 = 1
   	LET v_float = 1
   	LET v_smallfloat = 1
	   LET v_datetime = "0001-01-01 00:00:00.000" 
		LET v_interval = "9999-11"
		LET v_date = "01/01/0001"

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_8179_select_placeholder_error_2
   CREATE TABLE lyc_8179_select_placeholder_error_2
   (
   col_char CHAR(80),
   col_nchar NCHAR(80),
   col_varchar VARCHAR(80),
   col_nvarchar NVARCHAR(80),
   col_lvarchar LVARCHAR(80),
   col_decimal DECIMAL(32,16),
   col_money MONEY(32,16),
   col_integer INTEGER,
   col_serial SERIAL,
   col_smallint SMALLINT,
   col_bigint BIGINT,
   col_int8   INT8,
   col_serial8 SERIAL8,
   col_float  FLOAT,
   col_smallfloat SMALLFLOAT,
   col_datetime   DATETIME YEAR TO FRACTION,
	col_interval  INTERVAL YEAR TO MONTH,
	col_date DATE
	)

	INSERT INTO lyc_8179_select_placeholder_error_2
	( 
   col_char,
   col_nchar,
   col_varchar,
   col_nvarchar,
   col_lvarchar,
   col_decimal,
   col_money,
   col_integer,
   col_serial,
   col_smallint,
   col_bigint,
   col_int8,
   col_serial8,
   col_float,
   col_smallfloat,
   col_datetime,
	col_interval,
	col_date
	)		
	VALUES
	("a",
	 "a",	
	 "a",
 	 "a",	 
 	 "a",
	 12.34,
	 12.34,
	 1,	 
	 1,
	 1,
	 1,
	 1,
	 1,
	 1,
	 1,
	 "0001-01-01 00:00:00.000",
	 "9999-11",
	 "01/01/0001"
	)  

	DECLARE cur CURSOR FOR		
		SELECT 1,* FROM lyc_8179_select_placeholder_error_2
		WHERE col_char = ?
		AND col_nchar = ?
   	AND col_varchar = ?
   	AND col_nvarchar = ?
   	AND col_lvarchar = ?
   	AND col_decimal = ?
   	AND col_money = ?
   	AND col_integer = ?
   	AND col_serial = ? 
   	AND col_smallint = ? 
   	AND col_bigint = ? 
   	AND col_int8 = ? 
   	AND col_serial8 = ? 
   	AND col_float = ?
   	AND col_smallfloat = ?
   	AND col_datetime = ?
		AND col_interval = ?
		AND col_date = ?
		UNION
		SELECT 2,* FROM lyc_8179_select_placeholder_error_2
		WHERE col_char = ?
		AND col_nchar = ?
   	AND col_varchar = ?
   	AND col_nvarchar = ?
   	AND col_lvarchar = ?
   	AND col_decimal = ?
   	AND col_money = ?
   	AND col_integer = ?
   	AND col_serial = ? 
   	AND col_smallint = ? 
   	AND col_bigint = ? 
   	AND col_int8 = ? 
   	AND col_serial8 = ? 
   	AND col_float = ?
   	AND col_smallfloat = ?
   	AND col_datetime = ?
		AND col_interval = ?
		AND col_date = ?

	FOREACH cur USING v_char,v_nchar,v_varchar,v_nvarchar,v_lvarchar,v_decimal,v_money,v_integer,v_serial,
							v_smallint,v_bigint,v_int8,v_serial8,v_float,v_smallfloat,v_datetime,v_interval,v_date,
							v_char,v_nchar,v_varchar,v_nvarchar,v_lvarchar,v_decimal,v_money,v_integer,v_serial,
							v_smallint,v_bigint,v_int8,v_serial8,v_float,v_smallfloat,v_datetime,v_interval,v_date INTO v_first,rec.*   						
		DISPLAY v_first,rec.*
	END FOREACH

   DROP TABLE lyc_8179_select_placeholder_error_2

END MAIN
   