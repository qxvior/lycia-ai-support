MAIN
   DEFINE l_idx INT,
	  l_arr_rec_period DYNAMIC ARRAY OF 
	     RECORD
            year_num,
            period_num SMALLINT,
            start_date,
            end_date   DATE,
            gl_flag,
            ar_flag,
            ap_flag,
            pu_flag,
            in_flag,
            jm_flag,
            oe_flag    NCHAR(1)
         END RECORD

   OPEN WINDOW w_test_construct WITH FORM "5225/5225_table_cur_pos"

 
      FOR l_idx = 1 TO 100
         LET l_arr_rec_period[l_idx].year_num = 2019                                                                             
         LET l_arr_rec_period[l_idx].period_num = l_idx                                                                         
         LET l_arr_rec_period[l_idx].start_date = '06/15/2020'                                                                         
         LET l_arr_rec_period[l_idx].end_date = '06/15/2020'                                                                     
         LET l_arr_rec_period[l_idx].gl_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].ar_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].ap_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].pu_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].in_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].jm_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].oe_flag = "Y"                                                                               
      END FOR

      INPUT ARRAY l_arr_rec_period WITHOUT DEFAULTS FROM sr_period.* ATTRIBUTES(UNBUFFERED)                                                       
         ON ACTION delete_rows_2_n_3
         	DISPLAY "BEFORE DELETE"
            DISPLAY "arr_curr(): ",arr_curr()
            DISPLAY "DIALOG.getCurrentRow: ",DIALOG.getCurrentRow("sr_period")
            #2 and 3 rows are removed
         	CALL l_arr_rec_period.delete(2,3)                                                                                                                                    
         	DISPLAY "AFTER DELETE"
            DISPLAY "arr_curr(): ",arr_curr()
            DISPLAY "DIALOG.getCurrentRow: ", DIALOG.getCurrentRow("sr_period")

         ON ACTION delete_curr
           	DISPLAY "BEFORE DELETE"
            DISPLAY "arr_curr(): ",arr_curr()
            DISPLAY "DIALOG.getCurrentRow: ",DIALOG.getCurrentRow("sr_period")
            #2 and 3 rows are removed
         	CALL l_arr_rec_period.delete(arr_curr())                                                                                                                                    
         	DISPLAY "AFTER DELETE"
            DISPLAY "arr_curr(): ",arr_curr()
            DISPLAY "DIALOG.getCurrentRow: ", DIALOG.getCurrentRow("sr_period")                                                                                                                   

      END INPUT                                                                                                                                   
                                                                                                                                                 
   CLOSE WINDOW w_test_construct
END MAIN
