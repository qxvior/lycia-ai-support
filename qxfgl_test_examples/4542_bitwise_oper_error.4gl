#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_serial8_1,
      v_serial8_2,
      v_res_serial8 SERIAL8    --> BIGINT (If the operand is of BIGINT data type then the result is correct).

   WHENEVER ANY ERROR CONTINUE

   # ~ Bitwise complement
   LET v_serial8_1  = 9223372036854775807
   LET v_res_serial8 =  ~v_serial8_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL THEN DISPLAY "1.  NULL" ELSE DISPLAY "1.  |",v_res_serial8,"|" END IF

   LET v_serial8_1  = 12
   LET v_res_serial8 =  ~v_serial8_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL THEN DISPLAY "2.  NULL" ELSE DISPLAY "2.  |",v_res_serial8,"|" END IF
   
   LET v_serial8_1  = 0
   LET v_res_serial8 =  ~v_serial8_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL THEN DISPLAY "3.  NULL" ELSE DISPLAY "3.  |",v_res_serial8,"|" END IF
   
   LET v_serial8_1  = NULL
   LET v_res_serial8 =  ~v_serial8_1
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL THEN DISPLAY "4.  NULL" ELSE DISPLAY "4.  |",v_res_serial8,"|" END IF

END MAIN
