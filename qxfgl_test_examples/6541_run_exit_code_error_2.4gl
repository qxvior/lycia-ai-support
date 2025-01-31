#########################################################################################################################################
# Author albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE run_returning_code INTEGER
   DEFINE run_status_code INTEGER
   DEFINE run_exit_program_code INTEGER
   DEFINE exit_program_code INTEGER
   DEFINE run_cmd CHAR(256)

   RUN "chmod 775 ./6541_runapp"
   FOR exit_program_code = -128 TO 255
      LET run_cmd = "./6541_runapp ./6541_run_program_1 ",exit_program_code
      RUN run_cmd RETURNING run_returning_code

      LET run_status_code       = run_returning_code MOD 256

      LET run_exit_program_code = run_returning_code / 256

      IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
      IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
      IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF

   END FOR

   DISPLAY " "
END MAIN
