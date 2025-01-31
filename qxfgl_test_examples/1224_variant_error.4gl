#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################

MAIN
   DEFINE
      v_dec_1   DECIMAL(1),
      v_dec_16  DECIMAL(16),
      v_dec_32  DECIMAL(32),
      v_variant VARIANT

   WHENEVER ANY ERROR CONTINUE

   LET v_dec_1  = -0.9e-124 LET v_variant = v_dec_1 
--   LET v_dec_1  = -0.9e-5 LET v_variant = v_dec_1 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL     THEN DISPLAY "1. NULL"   ELSE DISPLAY "1. |",v_variant USING "-.###########################################################################################################################################################","|"   END IF
   LET v_dec_1  =  0.9e+124 LET v_variant = v_dec_1
--   LET v_dec_1  =  0.9e+32 LET v_variant = v_dec_1 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL     THEN DISPLAY "2. NULL"   ELSE DISPLAY "2. |",v_variant USING "--------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

   LET v_dec_16  = -9.999999999999999e-124  LET v_variant = v_dec_16
--   LET v_dec_16  = -9.999999999999999e-5  LET v_variant = v_dec_16 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL    THEN DISPLAY "3. NULL"   ELSE DISPLAY "3. |",v_variant USING "-.###########################################################################################################################################################","|"   END IF
   LET v_dec_16  =  9.999999999999999e+124 LET v_variant = v_dec_16
--   LET v_dec_16  =  9.999999999999999e+31 LET v_variant = v_dec_16 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL    THEN DISPLAY "4. NULL"   ELSE DISPLAY "4. |",v_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

   LET v_dec_32  = -9.9999999999999999999999999999999e-124   LET v_variant = v_dec_32
--   LET v_dec_32  = -9.9999999999999999999999999999999e-5   LET v_variant = v_dec_32 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL    THEN DISPLAY "5. NULL"   ELSE DISPLAY "5. |",v_variant USING "-.###########################################################################################################################################################","|"   END IF
   LET v_dec_32  =  9.9999999999999999999999999999999e+124  LET v_variant = v_dec_32
--   LET v_dec_32  =  9.9999999999999999999999999999999e+31  LET v_variant = v_dec_32 --> ok
   IF status <> 0 THEN DISPLAY "status = ",status END IF
   IF v_variant IS NULL    THEN DISPLAY "6. NULL"   ELSE DISPLAY "6. |",v_variant USING "---------------------------------------------------------------------------------------------------------------------------------&.&&","|"   END IF

END MAIN

