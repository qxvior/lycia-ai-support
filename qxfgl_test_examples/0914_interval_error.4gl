#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_res_interval_h_s,
      v_interval1_h_s     INTERVAL HOUR(9) TO SECOND,
      v_interval2_f_f     INTERVAL FRACTION TO FRACTION   

   WHENEVER ANY ERROR CONTINUE
  
   LET v_interval1_h_s = "00:00:00"
   LET v_interval2_f_f  = ".999"
   LET v_res_interval_h_s =  v_interval1_h_s + v_interval2_f_f
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_interval_h_s IS NULL    THEN DISPLAY "1.  NULL"   ELSE DISPLAY "1.  |",v_res_interval_h_s,"|"   END IF
  
   LET v_interval1_h_s = "99:59:59"
   LET v_interval2_f_f  = ".999"
   LET v_res_interval_h_s =  v_interval1_h_s - v_interval2_f_f
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_interval_h_s IS NULL    THEN DISPLAY "2.  NULL"   ELSE DISPLAY "2.  |",v_res_interval_h_s,"|"   END IF

END MAIN
