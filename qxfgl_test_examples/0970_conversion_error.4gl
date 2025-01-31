#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE 
      v_dec  DECIMAL,
      v_flt  FLOAT,
      v_char VARCHAR(255)

   LET v_flt=0.01
   DISPLAY "v_flt= ",v_flt
   LET v_char=v_flt
   DISPLAY "v_char=",v_char

   LET v_dec=0.001
   DISPLAY "v_dec= ",v_dec
   LET v_char=v_dec
   DISPLAY "v_char=",v_char

   LET v_flt=0.0001
   DISPLAY "v_flt= ",v_flt
   LET v_char=v_flt
   DISPLAY "v_char=",v_char

   LET v_dec=0.00001
   DISPLAY "v_dec= ",v_dec
   LET v_char=v_dec
   DISPLAY "v_char=",v_char

   LET v_flt=0.000001
   DISPLAY "v_flt= ",v_flt
   LET v_char=v_flt
   DISPLAY "v_char=",v_char

   LET v_dec=0.0000001
   DISPLAY "v_dec= ",v_dec
   LET v_char=v_dec
   DISPLAY "v_char=",v_char

END MAIN
