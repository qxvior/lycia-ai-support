##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_column_name,
      v_data_type,
      v_data_length CHAR(30)
      
   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_2263
   CREATE TABLE lyc_2263
   (col_smallfloat SMALLFLOAT
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY SQLCA.SQLCODE END IF

   DECLARE cur CURSOR FOR
      SELECT UNIQUE column_name,data_type,data_length FROM all_tab_columns WHERE table_name = 'LYC_2263' ORDER BY column_name 

   FOREACH cur INTO v_column_name,v_data_type,v_data_length
      DISPLAY v_column_name,v_data_type,v_data_length       
   END FOREACH      

END MAIN
