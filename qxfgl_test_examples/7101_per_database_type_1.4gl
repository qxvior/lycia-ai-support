MAIN
 DEFINE customer_num STRING
	OPEN WINDOW w1 WITH FORM "7101/7101_per_database_type_1_1" ATTRIBUTE(BORDER)
	INPUT BY NAME customer_num 
	DISPLAY customer_num
	
	OPEN WINDOW w2 WITH FORM "7101/7101_per_database_type_1_2" ATTRIBUTE(BORDER)
	INPUT BY NAME customer_num
	DISPLAY customer_num
	
	OPEN WINDOW w3 WITH FORM "7101/7101_per_database_type_1_3" ATTRIBUTE(BORDER)
	INPUT BY NAME customer_num
	DISPLAY customer_num
END MAIN