##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_column_name,
      v_data_type,
      v_datetime_precision CHAR(30)
      
   WHENEVER ERROR CONTINUE
   DROP TABLE mapping_datetime
   CREATE TABLE mapping_datetime
   (
      col_datetime_y_y   DATETIME YEAR TO YEAR,
      col_datetime_y_mo  DATETIME YEAR TO MONTH,
      col_datetime_y_d   DATETIME YEAR TO DAY,
      col_datetime_y_h   DATETIME YEAR TO HOUR,
      col_datetime_y_mi  DATETIME YEAR TO MINUTE,   
      col_datetime_y_s   DATETIME YEAR TO SECOND,
      col_datetime_y_f   DATETIME YEAR TO FRACTION,   
      col_datetime_y_f1  DATETIME YEAR TO FRACTION(1),   
      col_datetime_y_f2  DATETIME YEAR TO FRACTION(2),
      col_datetime_y_f3  DATETIME YEAR TO FRACTION(3),    
      col_datetime_y_f4  DATETIME YEAR TO FRACTION(4),      
      col_datetime_y_f5  DATETIME YEAR TO FRACTION(5),
      col_datetime_mo_mo DATETIME MONTH TO MONTH,
      col_datetime_mo_d  DATETIME MONTH TO DAY,
      col_datetime_mo_h  DATETIME MONTH TO HOUR,
      col_datetime_mo_mi DATETIME MONTH TO MINUTE,   
      col_datetime_mo_s  DATETIME MONTH TO SECOND,
      col_datetime_mo_f  DATETIME MONTH TO FRACTION,   
      col_datetime_mo_f1 DATETIME MONTH TO FRACTION(1),   
      col_datetime_mo_f2 DATETIME MONTH TO FRACTION(2),
      col_datetime_mo_f3 DATETIME MONTH TO FRACTION(3),    
      col_datetime_mo_f4 DATETIME MONTH TO FRACTION(4),      
      col_datetime_mo_f5 DATETIME MONTH TO FRACTION(5),
      col_datetime_d_d   DATETIME DAY TO DAY,
      col_datetime_d_h   DATETIME DAY TO HOUR,
      col_datetime_d_mi  DATETIME DAY TO MINUTE,   
      col_datetime_d_s   DATETIME DAY TO SECOND,
      col_datetime_d_f   DATETIME DAY TO FRACTION,   
      col_datetime_d_f1  DATETIME DAY TO FRACTION(1),   
      col_datetime_d_f2  DATETIME DAY TO FRACTION(2),
      col_datetime_d_f3  DATETIME DAY TO FRACTION(3),    
      col_datetime_d_f4  DATETIME DAY TO FRACTION(4),      
      col_datetime_d_f5  DATETIME DAY TO FRACTION(5),
      col_datetime_h_h   DATETIME HOUR TO HOUR,
      col_datetime_h_mi  DATETIME HOUR TO MINUTE,   
      col_datetime_h_s   DATETIME HOUR TO SECOND,
      col_datetime_h_f   DATETIME HOUR TO FRACTION,   
      col_datetime_h_f1  DATETIME HOUR TO FRACTION(1),   
      col_datetime_h_f2  DATETIME HOUR TO FRACTION(2),
      col_datetime_h_f3  DATETIME HOUR TO FRACTION(3),    
      col_datetime_h_f4  DATETIME HOUR TO FRACTION(4),      
      col_datetime_h_f5  DATETIME HOUR TO FRACTION(5),
      col_datetime_mi_mi DATETIME MINUTE TO MINUTE,   
      col_datetime_mi_s  DATETIME MINUTE TO SECOND,
      col_datetime_mi_f  DATETIME MINUTE TO FRACTION,   
      col_datetime_mi_f1 DATETIME MINUTE TO FRACTION(1),   
      col_datetime_mi_f2 DATETIME MINUTE TO FRACTION(2),
      col_datetime_mi_f3 DATETIME MINUTE TO FRACTION(3),    
      col_datetime_mi_f4 DATETIME MINUTE TO FRACTION(4),      
      col_datetime_mi_f5 DATETIME MINUTE TO FRACTION(5),
      col_datetime_s_s   DATETIME SECOND TO SECOND,
      col_datetime_s_f   DATETIME SECOND TO FRACTION,   
      col_datetime_s_f1  DATETIME SECOND TO FRACTION(1),   
      col_datetime_s_f2  DATETIME SECOND TO FRACTION(2),
      col_datetime_s_f3  DATETIME SECOND TO FRACTION(3),    
      col_datetime_s_f4  DATETIME SECOND TO FRACTION(4),      
      col_datetime_s_f5  DATETIME SECOND TO FRACTION(5),
      col_datetime_f_f   DATETIME FRACTION TO FRACTION,
      col_datetime_f_f1  DATETIME FRACTION TO FRACTION(1),
      col_datetime_f_f2  DATETIME FRACTION TO FRACTION(2),
      col_datetime_f_f3  DATETIME FRACTION TO FRACTION(3),
      col_datetime_f_f4  DATETIME FRACTION TO FRACTION(4),
      col_datetime_f_f5  DATETIME FRACTION TO FRACTION(5) 
   )

   DISPLAY SQLCA.SQLCODE

   DECLARE cur CURSOR FOR
      SELECT column_name,data_type,datetime_precision FROM information_schema.columns WHERE information_schema.columns.table_name='mapping_datetime'

   FOREACH cur INTO v_column_name,v_data_type,v_datetime_precision
      DISPLAY v_column_name,v_data_type,v_datetime_precision       
   END FOREACH      

END MAIN
