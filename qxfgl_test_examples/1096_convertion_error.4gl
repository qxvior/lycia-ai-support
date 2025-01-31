###########################################################################################################################
# Author: Bondar A.G.
###########################################################################################################################
MAIN
   DEFINE
      v_decimal DECIMAL,
      v_serial8 SERIAL8
--      v_serial8 BIGINT  --> bug is not reproduced  !!!

   LET v_serial8 = -9223372036854775807   
   DISPLAY "1. v_serial8 =",v_serial8 USING "---------------------&.&&"
   LET v_decimal = -9223372036854775807   
   DISPLAY "2. v_decimal =",v_decimal USING "---------------------&.&&"
   LET v_decimal = v_serial8
   DISPLAY "3. v_decimal =",v_decimal USING "---------------------&.&&"     

   LET v_serial8 = 9223372036854775807   
   DISPLAY "4. v_serial8 =",v_serial8 USING "---------------------&.&&"
   LET v_decimal = 9223372036854775807   
   DISPLAY "5. v_decimal =",v_decimal USING "---------------------&.&&"
   LET v_decimal = v_serial8
   DISPLAY "6. v_decimal =",v_decimal USING "---------------------&.&&"     

END MAIN
