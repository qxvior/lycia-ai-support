DEFINE dt_rec_HASH_VALUE TYPE AS RECORD
	fName STRING,
	lName STRING,
	dob DATE,
	country STRING
END RECORD

MAIN
	DEFINE l_hashMap HASHMAP OF dt_rec_HASH_VALUE
	DEFINE l_json_string STRING
		LET l_json_string = 
			'{
				"hm1_key_1":{
					"fname":"hm1_value_fname_1",
					"lname":"hm1_value_lName_1",
					"dob":"11.05.1981",
					"country":"hm1_value_country_1"},
				"hm1_key_2":{
					"fname":"hm1_value_fname_2",
					"lname":"hm1_value_lName_2",
					"dob":"08.10.1981",
					"country":"hm1_value_country_2"},
				"hm1_key_3":{
					"fname":"hm1_value_fname_3",
					"lname":"hm1_value_lName_3",
					"dob":"07.03.1982",
					"country":"hm1_value_country_3"}
			}'
			
	CALL util.JSON.parse(l_json_string, l_hashMap)
	CALL l_hashMap.keySort()
	DISPLAY l_hashMap

END MAIN