##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_column_name,
      v_data_type,
      v_character_maximum_length CHAR(30)
      
   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1104
   CREATE TABLE lyc_1104
   (col_text TEXT
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY SQLCA.SQLCODE END IF

   DECLARE cur CURSOR FOR
      SELECT column_name,data_type,character_maximum_length FROM information_schema.columns WHERE information_schema.columns.table_name='lyc_1104'

   FOREACH cur INTO v_column_name,v_data_type,v_character_maximum_length
      DISPLAY v_column_name,v_data_type,v_character_maximum_length       
   END FOREACH      

END MAIN
