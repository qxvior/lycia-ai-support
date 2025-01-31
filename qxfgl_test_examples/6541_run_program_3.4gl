#########################################################################################################################################
# Author albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE exit_program_code INTEGER
   DEFINE responce INTEGER
   
   DEFER INTERRUPT
   DEFER QUIT

   LET responce = fgl_getkey()

   LET exit_program_code = 123
   EXIT PROGRAM exit_program_code

END MAIN