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
   DROP TABLE lyc_2346
   CREATE TABLE lyc_2346
   (
      col_dec    DECIMAL,    
      col_dec_1  DECIMAL(1), 
      col_dec_2  DECIMAL(2), 
      col_dec_3  DECIMAL(3), 
      col_dec_4  DECIMAL(4), 
      col_dec_5  DECIMAL(5), 
      col_dec_6  DECIMAL(6), 
      col_dec_7  DECIMAL(7), 
      col_dec_8  DECIMAL(8), 
      col_dec_9  DECIMAL(9), 
      col_dec_10 DECIMAL(10),
      col_dec_11 DECIMAL(11),
      col_dec_12 DECIMAL(12),
      col_dec_13 DECIMAL(13),
      col_dec_14 DECIMAL(14),
      col_dec_15 DECIMAL(15),
      col_dec_16 DECIMAL(16),
      col_dec_17 DECIMAL(17),
      col_dec_18 DECIMAL(18),
      col_dec_19 DECIMAL(19),
      col_dec_20 DECIMAL(20),
      col_dec_21 DECIMAL(21),
      col_dec_22 DECIMAL(22),
      col_dec_23 DECIMAL(23),
      col_dec_24 DECIMAL(24),
      col_dec_25 DECIMAL(25),
      col_dec_26 DECIMAL(26),
      col_dec_27 DECIMAL(27),
      col_dec_28 DECIMAL(28),
      col_dec_29 DECIMAL(29),
      col_dec_30 DECIMAL(30),
      col_dec_31 DECIMAL(31),
      col_dec_32 DECIMAL(32) 
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY SQLCA.SQLCODE END IF

   DECLARE cur CURSOR FOR
      SELECT UNIQUE column_name,data_type FROM all_tab_columns WHERE table_name = 'LYC_2346' ORDER BY column_name 

   FOREACH cur INTO v_column_name,v_data_type
      DISPLAY v_column_name,v_data_type       
   END FOREACH      

END MAIN
