PUBLIC CONSTANT publ_const_boolean BOOLEAN  = TRUE
PUBLIC CONSTANT publ_const_tinyint TINYINT = -128
PUBLIC CONSTANT publ_const_smallint SMALLINT = -32767 #-32,767
PUBLIC CONSTANT publ_const_integer INTEGER = -2147483647 #-2,147,483,647 
PUBLIC CONSTANT publ_const_bigint BIGINT = -9223372036854775807 #-9,223,372,036,854,775,807

PUBLIC CONSTANT publ_const_smallfloat SMALLFLOAT = 123456.1234
PUBLIC CONSTANT publ_const_float FLOAT = 1234567890.1234567890123
PUBLIC CONSTANT publ_const_money MONEY = 1234567890.45 
PUBLIC CONSTANT publ_const_decimal DECIMAL(10,2) = 12345678.12

PUBLIC CONSTANT publ_const_char CHAR = "H" #"H"
PUBLIC CONSTANT publ_const_char10 CHAR(10) = "ABCDEFGHIJ"
PUBLIC CONSTANT publ_const_varchar VARCHAR(5) = "Chris"
PUBLIC CONSTANT publ_const_string STRING = "Africa"


PUBLIC CONSTANT publ_const_date DATE = MDY(12,24,2011)
PUBLIC CONSTANT publ_const_datetime DATETIME YEAR TO HOUR = DATETIME(2022-02-06 16) YEAR TO HOUR
PUBLIC CONSTANT publ_const_interval INTERVAL DAY(5) TO SECOND = INTERVAL(-7634 22:14:32) DAY(5) TO SECOND
PUBLIC CONSTANT publ_const_interval2 INTERVAL YEAR TO MONTH = INTERVAL(2222-10) YEAR(4) TO MONTH

PUBLIC CONSTANT publ_const_array_string ARRAY[10] OF STRING = ["AAA","BBB"]
PUBLIC CONSTANT publ_const_array2_string ARRAY[2,2] OF STRING = [["AAA","BBB"],["CCC","DDD"]]
PUBLIC CONSTANT publ_const_array3_string ARRAY[2,2,2] OF STRING = [
                                                                   [
                                                                     ["AAA","BBB"],["CCC","DDD"]
                                                                   ],
                                                                   [
                                                                     ["EEE","FFF"],["GGG","KKK"]
                                                                   ]
                                                                  ]

PUBLIC CONSTANT publ_const_dy_array_string DYNAMIC ARRAY OF STRING = ["AAA","BBB"]
PUBLIC CONSTANT publ_const_dy_array2_string DYNAMIC ARRAY WITH 2 DIMENSIONS OF STRING = [["AAA","BBB"],["CCC","DDD"]]
PUBLIC CONSTANT publ_const_dy_array3_string DYNAMIC ARRAY WITH 3 DIMENSIONS OF STRING = [
                                                                   [
                                                                     ["AAA","BBB"],["CCC","DDD"]
                                                                   ],
                                                                   [
                                                                     ["EEE","FFF"],["GGG","KKK"]
                                                                   ]
                                                                  ]

MAIN
	DISPLAY publ_const_boolean
	DISPLAY publ_const_tinyint
	DISPLAY publ_const_smallint
	DISPLAY publ_const_integer 
	DISPLAY publ_const_bigint
	
	DISPLAY publ_const_smallfloat
	DISPLAY publ_const_float
	DISPLAY publ_const_money 
	DISPLAY publ_const_decimal
	
	DISPLAY publ_const_char
	DISPLAY publ_const_char10
	DISPLAY publ_const_varchar
	DISPLAY publ_const_string
	
	DISPLAY publ_const_date
	DISPLAY publ_const_datetime
	DISPLAY publ_const_interval
	DISPLAY publ_const_interval2
	
	DISPLAY publ_const_array_string
	DISPLAY publ_const_array2_string
	DISPLAY publ_const_array3_string
	DISPLAY publ_const_dy_array_string
	DISPLAY publ_const_dy_array2_string
	DISPLAY publ_const_dy_array3_string
END MAIN