#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_smallflt SMALLFLOAT,
      v_variant  smallfloat --VARIANT

   WHENEVER ANY ERROR CONTINUE

   LET v_smallflt  =  0.9e+37 LET v_variant = v_smallflt
--   LET v_smallflt  =  0.9e+9 LET v_variant = v_smallflt  --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL     THEN DISPLAY "1. NULL"   ELSE DISPLAY "1. |",v_variant USING "----------------------------------------&.&&","|"   END IF

   LET v_smallflt  =  9.999999e+37 LET v_variant = v_smallflt
--   LET v_smallflt  =  9.999999e+8 LET v_variant = v_smallflt --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL     THEN DISPLAY "2. NULL"   ELSE DISPLAY "2. |",v_variant USING "----------------------------------------&.&&","|"   END IF

END MAIN

