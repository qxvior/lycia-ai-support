#########################################################################################################################################
# Author albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE exit_program_code INTEGER
   DEFINE int_var INTEGER

   WHENEVER ANY ERROR CONTINUE

   LET int_var = int_var/0

   LET exit_program_code = 123
   EXIT PROGRAM exit_program_code

END MAIN