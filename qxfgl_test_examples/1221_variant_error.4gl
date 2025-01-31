#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_fltoat  FLOAT,
      v_variant VARIANT

   WHENEVER ANY ERROR CONTINUE

   LET v_fltoat  =  0.9e+124 LET v_variant = v_fltoat
--   LET v_fltoat  =  0.9e+32 LET v_variant = v_fltoat  --> Ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL     THEN DISPLAY "1. NULL"   ELSE DISPLAY "1. |",v_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF
   LET v_fltoat  =  9.99999999999999e+124 LET v_variant = v_fltoat
--   LET v_fltoat  =  9.99999999999999e+31 LET v_variant = v_fltoat  --> Ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL    THEN DISPLAY "2. NULL"   ELSE DISPLAY "2. |",v_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

END MAIN

