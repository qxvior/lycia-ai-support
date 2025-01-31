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
   DROP TABLE tab_0336
   CREATE TABLE tab_0336
   (col_nchar_1 NCHAR,
    col_nchar_2 NCHAR(1),
    col_nchar_3 NCHAR(4000)
   )
   DISPLAY SQLCA.SQLCODE

   DECLARE cur CURSOR FOR
      SELECT column_name,data_type,character_maximum_length FROM information_schema.columns WHERE information_schema.columns.table_name='tab_0336'

   FOREACH cur INTO v_column_name,v_data_type,v_character_maximum_length
      DISPLAY v_column_name,v_data_type,v_character_maximum_length       
   END FOREACH      

END MAIN
