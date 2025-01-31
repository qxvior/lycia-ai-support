MAIN
	DEFINE i INT
  	DEFINE l_arr_rec_bic DYNAMIC ARRAY OF
	RECORD
		bic_code,
		desc_text,
		bank_ref CHAR(20)
	END RECORD

	OPEN WINDOW G534 WITH FORM "3615/3615_input_table_input_diff_rows_5"   
	FOR i=1 to 100
		LET l_arr_rec_bic[i].bic_code= "item",trim(i)
		LET l_arr_rec_bic[i].desc_text= "cont",trim(i)
		LET l_arr_rec_bic[i].bank_ref= "brief",trim(i)
	END FOR
	DISPLAY ARRAY l_arr_rec_bic TO sr_bic.* 
			ON ACTION "Filter"
						INPUT l_arr_rec_bic[1].bic_code,l_arr_rec_bic[2].desc_text,l_arr_rec_bic[3].bank_ref FROM sr_bic[1].bic_code,sr_bic[2].desc_text,sr_bic[3].bank_ref
						LET l_arr_rec_bic[1].bic_code= "mmm1"
					    LET l_arr_rec_bic[1].desc_text= "lll1"
					    LET l_arr_rec_bic[1].bank_ref= "jjj1"
	END DISPLAY
	DISPLAY "First row:",l_arr_rec_bic[1].* 
	DISPLAY "Second row:",l_arr_rec_bic[2].* 
	DISPLAY "Third row:",l_arr_rec_bic[3].* 
END MAIN