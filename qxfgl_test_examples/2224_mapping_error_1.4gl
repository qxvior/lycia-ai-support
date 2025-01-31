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
   DROP TABLE lyc_2224
   CREATE TABLE lyc_2224
   (col_float_1 FLOAT,
    col_float_2 FLOAT(1),
    col_float_3 FLOAT(14)
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY SQLCA.SQLCODE END IF

   DECLARE cur CURSOR FOR
      SELECT UNIQUE column_name,data_type,data_length FROM all_tab_columns WHERE table_name = 'LYC_2224' ORDER BY column_name 

   FOREACH cur INTO v_column_name,v_data_type,v_data_length
      DISPLAY v_column_name,v_data_type,v_data_length       
   END FOREACH      

END MAIN
