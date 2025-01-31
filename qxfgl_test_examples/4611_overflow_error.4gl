#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_flt_pow FLOAT,  --> INTEGER,  -- If the exponent is INTEGER, an overflow error -1200 is generated
      v_flt1,
      v_res_flt FLOAT 

   WHENEVER ANY ERROR CONTINUE

   LET v_flt1  = 9.99999999999999E+124
   LET v_flt_pow = 3  
   IF status <> 0 THEN DISPLAY "5.  status = ",status END IF
   LET v_res_flt =  v_flt1 ** v_flt_pow 
   IF status <> 0 THEN DISPLAY "6.  status = ",status END IF
   IF v_res_flt IS NULL          THEN DISPLAY "7.  NULL" ELSE DISPLAY "7.  |",v_res_flt,"|" END IF

END MAIN