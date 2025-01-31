MAIN
	DEFINE i INT
	DEFINE l_where_text VARCHAR(200)
  	DEFINE l_arr_rec_bic DYNAMIC ARRAY OF
	RECORD
		bic_code,
		desc_text,
		bank_ref CHAR(20)
	END RECORD

	OPEN WINDOW G534 WITH FORM "3615/3615_input_table_construct_3"   
	FOR i=1 to 100
		LET l_arr_rec_bic[i].bic_code= "item",trim(i)
		LET l_arr_rec_bic[i].desc_text= "cont",trim(i)
		LET l_arr_rec_bic[i].bank_ref= "brief",trim(i)
	END FOR
	INPUT ARRAY l_arr_rec_bic WITHOUT DEFAULTS FROM sr_bic.* 
			ON ACTION "Filter"
						CONSTRUCT BY NAME l_where_text on bic_code,desc_text,bank_ref
            			DISPLAY "Construct result:",l_where_text
						LET l_arr_rec_bic[1].bic_code= "mmm1"
					    LET l_arr_rec_bic[1].desc_text= "lll1"
					    LET l_arr_rec_bic[1].bank_ref= "jjj1"
					    LET l_arr_rec_bic[2].bic_code= "mmm2"
					    LET l_arr_rec_bic[2].desc_text= "lll2"
					    LET l_arr_rec_bic[2].bank_ref= "jjj2"
					    LET l_arr_rec_bic[3].bic_code= "mmm3"
					    LET l_arr_rec_bic[3].desc_text= "lll3"
					    LET l_arr_rec_bic[3].bank_ref= "jjj3"
	END INPUT
	DISPLAY "First row:",l_arr_rec_bic[1].* 
END MAIN

