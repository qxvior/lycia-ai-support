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
		v_first INTEGER

   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_8179_select_placeholder_error_1
   CREATE TABLE lyc_8179_select_placeholder_error_1
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

	INSERT INTO lyc_8179_select_placeholder_error_1
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
		SELECT 1,* FROM lyc_8179_select_placeholder_error_1
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
		SELECT 2,* FROM lyc_8179_select_placeholder_error_1
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

	FOREACH cur USING "a","a","a","a","a",12.34,12.34,1,1,1,1,1,1,1,1,"0001-01-01 00:00:00.000","9999-11","01/01/0001",
							"a","a","a","a","a",12.34,12.34,1,1,1,1,1,1,1,1,"0001-01-01 00:00:00.000","9999-11","01/01/0001" INTO v_first,rec.*
		DISPLAY v_first,rec.*
	END FOREACH

   DROP TABLE lyc_8179_select_placeholder_error_1

END MAIN
   