#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_dec_pow       DECIMAL(5,2),
      v_bigserial_1,
      v_bigserial_2,
      v_res_bigserial BIGSERIAL,  --> BIGINT (If the left operand is of BIGINT data type then the result is correct).
      v_serial8_1,
      v_serial8_2,
      v_res_serial8   SERIAL8     --> BIGINT (If the left operand is of BIGINT data type then the result is correct).

   WHENEVER ANY ERROR CONTINUE

   # ** Exponentiation
   LET v_bigserial_1  =  9223372036854775807
   LET v_dec_pow = 1.99  --> 4GL converts the right-hand operand of the exponentiation operator to an INTEGER value (1.99 -> 1). Any fractional part is discarded.
   LET v_res_bigserial =  v_bigserial_1 ** v_dec_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL          THEN DISPLAY "1.  NULL" ELSE DISPLAY "1.  |",v_res_bigserial,"|" END IF

   LET v_bigserial_1  = 3037000499
   LET v_dec_pow = 2.99    --> 4GL converts the right-hand operand of the exponentiation operator to an INTEGER value (2.99 -> 2). Any fractional part is discarded.
   LET v_res_bigserial =  v_bigserial_1 ** v_dec_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_bigserial IS NULL          THEN DISPLAY "2.  NULL" ELSE DISPLAY "2.  |",v_res_bigserial,"|" END IF

   LET v_serial8_1  =  9223372036854775807
   LET v_dec_pow = 1.99  
   LET v_res_serial8 =  v_serial8_1 ** v_dec_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL          THEN DISPLAY "3.  NULL" ELSE DISPLAY "3.  |",v_res_serial8,"|" END IF

   LET v_serial8_1  = 3037000499
   LET v_dec_pow = 2.99  
   LET v_res_serial8 =  v_serial8_1 ** v_dec_pow 
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_res_serial8 IS NULL          THEN DISPLAY "4.  NULL" ELSE DISPLAY "4.  |",v_res_serial8,"|" END IF

END MAIN
