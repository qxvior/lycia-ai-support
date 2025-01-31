# Project: lyc1000
# Filename: 9818_construct_row_specify.4gl
# Created By: alch
# Creation Date: Mar 05, 2024
MAIN

    DEFINE l_arr_shipcosttype ARRAY[5] OF RECORD 
        cost_type_code CHAR(8), 
        desc_text CHAR(40)
    END RECORD 
    DEFINE l_query_text CHAR(2048) 


    OPEN WINDOW l9818 with FORM "9818/9818_construct_row_specify.fm2" 

    CONSTRUCT l_query_text 
    ON cost_type_code, 
    desc_text 
    FROM sr_sct[1].cost_type_code, 
    sr_sct[1].desc_text 
    -- FROM sr_sct.cost_type_code, 
    -- sr_sct.desc_text

    CLOSE WINDOW l9818 

    DISPLAY l_query_text

END MAIN

