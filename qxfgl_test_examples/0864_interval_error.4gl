###########################################################################################################################
# Author: Bondar A.G.
###########################################################################################################################
DATABASE stores
MAIN
   DEFINE
    v_interval_3  INTERVAL DAY(9) TO DAY,
    v_interval_13 INTERVAL HOUR(9)TO HOUR
      
   WHENEVER ERROR CONTINUE   	
   DROP TABLE lyc_0864
   CREATE TABLE lyc_0864
   (
    col_interval_3  INTERVAL DAY(9) TO DAY,
    col_interval_13 INTERVAL HOUR(9) TO HOUR
   )

   INSERT INTO lyc_0864(col_interval_3)  VALUES(INTERVAL(999999999)DAY(9) TO DAY)  
   INSERT INTO lyc_0864(col_interval_13) VALUES(INTERVAL(999999999)HOUR(9) TO HOUR)  

   DECLARE cur CURSOR FOR
      SELECT * FROM lyc_0864
      
   FOREACH cur INTO v_interval_3,v_interval_13
      DISPLAY v_interval_3,v_interval_13
   END FOREACH      

   DROP TABLE lyc_0864

END MAIN

