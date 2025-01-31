DATABASE stores
MAIN
	DEFINE v_column_name, v_column_type, v_column_length CHAR(30)

	WHENEVER ANY ERROR CONTINUE
	DROP TABLE lyc_6044
	CREATE TABLE lyc_6044(
		col_v1 VARCHAR(1),
		col_v2 VARCHAR(255),
		col_v3 VARCHAR(256),
		col_v4 VARCHAR(8190),
		col_v5 VARCHAR(8191),
		col_v6 VARCHAR(65535),
		col_t TEXT,
		col_lv1 LVARCHAR(1),
		col_lv2 LVARCHAR(255),
		col_lv3 LVARCHAR(256),
		col_lv4 LVARCHAR(8190),
		col_lv5 LVARCHAR(8191),
		col_lv6 LVARCHAR(65535),
		col_nv1 NVARCHAR(1),
		col_nv2 NVARCHAR(255),
		col_nv3 NVARCHAR(256),
		col_nv4 NVARCHAR(8190),
		col_nv5 NVARCHAR(8191),
		col_nv6 NVARCHAR(65535)
	)
	DISPLAY SQLCA.SQLCODE

	DECLARE cur CURSOR FOR
		SELECT column_name, data_type, character_maximum_length FROM information_schema.columns
			WHERE information_schema.columns.table_name = 'lyc_6044'
	DISPLAY SQLCA.SQLCODE

	FOREACH cur INTO v_column_name, v_column_type, v_column_length
		DISPLAY v_column_name, v_column_type, v_column_length    
	END FOREACH  

END MAIN