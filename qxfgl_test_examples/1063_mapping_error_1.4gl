##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_column_name,
      v_data_type   CHAR(30)
      
   WHENEVER ERROR CONTINUE
   DROP TABLE lyc_1063
   CREATE TABLE lyc_1063
   (col_date DATE
   )
   IF SQLCA.SQLCODE <> 0 THEN DISPLAY SQLCA.SQLCODE END IF

   DECLARE cur CURSOR FOR
      SELECT column_name,data_type FROM information_schema.columns WHERE information_schema.columns.table_name='lyc_1063'

   FOREACH cur INTO v_column_name,v_data_type
      DISPLAY v_column_name,v_data_type       
   END FOREACH      

END MAIN
