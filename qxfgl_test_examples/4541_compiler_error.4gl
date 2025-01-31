#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_bigserial_1,
      v_bigserial_2,
      v_res_bigserial BIGSERIAL

   WHENEVER ANY ERROR CONTINUE

   # ~ Bitwise complement
   LET v_bigserial_1  = 9223372036854775807
   LET v_res_bigserial =  ~v_bigserial_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL THEN DISPLAY "1.  NULL" ELSE DISPLAY "1.  |",v_res_bigserial,"|" END IF

   LET v_bigserial_1  = 12
   LET v_res_bigserial =  ~v_bigserial_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL THEN DISPLAY "2.  NULL" ELSE DISPLAY "2.  |",v_res_bigserial,"|" END IF
   
   LET v_bigserial_1  = 0
   LET v_res_bigserial =  ~v_bigserial_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL THEN DISPLAY "3.  NULL" ELSE DISPLAY "3.  |",v_res_bigserial,"|" END IF
   
   LET v_bigserial_1  = NULL
   LET v_res_bigserial =  ~v_bigserial_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL THEN DISPLAY "4.  NULL" ELSE DISPLAY "4.  |",v_res_bigserial,"|" END IF

END MAIN
