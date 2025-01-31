MAIN
	DEFINE 
	   l_arr DYNAMIC ARRAY OF 
	      RECORD year_num INTEGER,
	             year_all INTEGER
          END RECORD,	             
	   i INTEGER

   FOR i = 1 TO 10
      LET l_arr[i].year_num = i 	
      LET l_arr[i].year_all = i
   END FOR 	   

	OPEN WINDOW test_input_array_2 WITH FORM "5202/5202_editable_combo_in_table" ATTRIBUTE(BORDER) 

	CALL fgl_list_insert("year_num",1,3)
	CALL fgl_list_insert("year_num",2,4)
	CALL fgl_list_insert("year_num",3,5)	
	CALL fgl_list_insert("year_num",4,6) 		
	 
    INPUT ARRAY l_arr WITHOUT DEFAULTS FROM sr_period.* 

END MAIN
