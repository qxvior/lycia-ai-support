#########################################################################################################################################
# Author albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE exit_program_code INTEGER
   DEFINE i INTEGER

   LET exit_program_code = ARG_VAL(1)
   # This loop is necessary to slow down execution so that the test case produces correct results.
   FOR i = 1 TO 3000 END FOR

   EXIT PROGRAM exit_program_code

END MAIN

