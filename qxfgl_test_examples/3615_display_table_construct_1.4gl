MAIN
	DEFINE l_where_text VARCHAR(200)
	DEFINE i INT
  	DEFINE l_arr_rec_bic DYNAMIC ARRAY OF
	RECORD
		bic_code,
		desc_text,
		bank_ref CHAR(20)
	END RECORD

	OPEN WINDOW G534 WITH FORM "3615/3615_display_table_construct_1" ATTRIBUTE(BORDER)
	FOR i=1 TO 100   
		LET l_arr_rec_bic[i].bic_code= "item",i
		LET l_arr_rec_bic[i].desc_text= "cont",i
		LET l_arr_rec_bic[i].bank_ref= "brief",i
	END FOR
	DISPLAY ARRAY l_arr_rec_bic TO sr_bic.*
			ON ACTION "Filter"
						CONSTRUCT BY NAME l_where_text on bic_code,desc_text,bank_ref
            			DISPLAY "Construct result:",l_where_text
            			FOR i=1 TO 100
							LET l_arr_rec_bic[i].bic_code= "mmm",i
						    LET l_arr_rec_bic[i].desc_text= "lll",i
						    LET l_arr_rec_bic[i].bank_ref= "jjj",i
					    END FOR
	END DISPLAY
	DISPLAY "First row:",l_arr_rec_bic[1].* 
END MAIN

