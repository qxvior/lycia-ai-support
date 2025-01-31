#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE 
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
   DEFINE l_where_text CHAR(512)
   DEFINE l_idx SMALLINT
   DEFINE l_while SMALLINT

   DEFER QUIT
   DEFER INTERRUPT
      
   OPEN WINDOW w_test_construct WITH FORM "1529/1529_construct_error"

   LET l_while = TRUE                                                                                                                             
   WHILE l_while                                                                                                                                  

      CLEAR FORM
	
      CONSTRUCT l_where_text ON year_num,
                                period_num,
                                start_date,
                                end_date,
                                gl_flag,
                                ar_flag,
                                ap_flag,
                                pu_flag,
                                in_flag,
                                jm_flag,
                                oe_flag  FROM sr_period[1].*
     
      IF int_flag = 1 OR quit_flag = 1
      THEN EXIT PROGRAM
      END IF

      FOR l_idx = 1 TO 100
         LET l_arr_rec_period[l_idx].year_num = 2019                                                                             
         LET l_arr_rec_period[l_idx].period_num = l_idx                                                                         
         LET l_arr_rec_period[l_idx].start_date = TODAY                                                                         
         LET l_arr_rec_period[l_idx].end_date = TODAY                                                                             
         LET l_arr_rec_period[l_idx].gl_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].ar_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].ap_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].pu_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].in_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].jm_flag = "Y"                                                                               
         LET l_arr_rec_period[l_idx].oe_flag = "Y"                                                                               
      END FOR

      INPUT ARRAY l_arr_rec_period WITHOUT DEFAULTS FROM sr_period.* ATTRIBUTES(UNBUFFERED)                                                       
                                                                                                                                                  
         AFTER INPUT                                                                                                                              
            IF int_flag = 1 OR quit_flag = 1                                                                                                      
            THEN # "Cancel" action activated                                                                                                      
                 LET int_flag  = FALSE                                                                                                            
                 LET quit_flag = FALSE                                                                                                            
                 LET l_while   = TRUE                                                                                                            
            ELSE # "Apply" action activated                                                                                                       
                 LET l_while = FALSE                                                                                                                     
                 EXIT INPUT
            END IF                                                                                                                                

      END INPUT                                                                                                                                   
                                                                                                                                                  
   END WHILE                                                                                                                                      

   CLOSE WINDOW w_test_construct
END MAIN
