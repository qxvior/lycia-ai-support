#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
MAIN
   DEFINE 
      v_float FLOAT   --> if SMALLFLOAT then  status = -1213 Ok! 

   WHENEVER ANY ERROR CONTINUE

   LET v_float="0abc"
   DISPLAY "1. status = ",status
   IF v_float IS NULL THEN DISPLAY "2. NULL"   ELSE DISPLAY "2. ",v_float END IF
   LET v_float="10<>^&"
   DISPLAY "3. status = ",status
   IF v_float IS NULL THEN DISPLAY "4. NULL"   ELSE DISPLAY "4. ",v_float END IF
   LET v_float="1234567890.?"
   DISPLAY "5. status = ",status
   IF v_float IS NULL THEN DISPLAY "6. NULL"   ELSE DISPLAY "6. ",v_float END IF
   LET v_float="1 2 3"
   DISPLAY "7. status = ",status
   IF v_float IS NULL THEN DISPLAY "8. NULL"   ELSE DISPLAY "8. ",v_float END IF

END MAIN
