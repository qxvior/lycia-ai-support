MAIN
DEFINE ht HASHMAP OF STRING
DEFINE s STRING

	LET s = '{
		"ht1_imp_key_1":"ht1_imp_value_1",
		"ht1_imp_key_2":"ht1_imp_value_2",
		"ht1_imp_key_3":"ht1_imp_value_3",
		"ht1_imp_key_4":"ht1_imp_value_4",
		"ht1_imp_key_5":"ht1_imp_value_5"
		}'
	CALL util.JSON.parse(s, ht)
	CALL ht.keySort()
	DISPLAY ht
	
	LET s = '{
		"ht1_imp_key_6":"ht1_imp_value_6",
		"ht1_imp_key_7":"ht1_imp_value_7",
		"ht1_imp_key_8":"ht1_imp_value_8",
		"ht1_imp_key_9":"ht1_imp_value_9",
		"ht1_imp_key_10":"ht1_imp_value_10"
		}'
	CALL util.JSON.parse(s, ht)
	CALL ht.keySort()
	DISPLAY ht
END MAIN