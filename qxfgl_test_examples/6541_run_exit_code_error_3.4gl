#########################################################################################################################################
# Author albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE run_returning_code INTEGER
   DEFINE run_status_code INTEGER
   DEFINE run_exit_program_code INTEGER
   DEFINE run_cmd CHAR(256)

   # The external program '6541_run_program_2' was interrupted before the execution of the exit program statement.
   LET run_cmd = "./6541_run_program_2"
   RUN run_cmd RETURNING run_returning_code
   LET run_status_code       = run_returning_code MOD 256
   LET run_exit_program_code = run_returning_code / 256
   IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
   IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
   IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF
   DISPLAY " "
   
   # After interrupting the external program '6541_run_program_3', the exit program statement was executed.
   LET run_cmd = "./6541_run_program_3"
   RUN run_cmd RETURNING run_returning_code
   LET run_status_code       = run_returning_code MOD 256
   LET run_exit_program_code = run_returning_code / 256
   IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
   IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
   IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF
   DISPLAY " "   

   # As a result of an external program '6541_run_program_4' runtime error, the exit program statement was not executed.
   LET run_cmd = "./6541_run_program_4"
   RUN run_cmd RETURNING run_returning_code
   LET run_status_code       = run_returning_code MOD 256
   LET run_exit_program_code = run_returning_code / 256
   IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
   IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
   IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF
   DISPLAY " "

   # As a result of an external program '6541_run_program_5' runtime error, the exit program statement was executed.
   LET run_cmd = "./6541_run_program_5"
   RUN run_cmd RETURNING run_returning_code
   LET run_status_code       = run_returning_code MOD 256
   LET run_exit_program_code = run_returning_code / 256
   IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
   IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
   IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF
   DISPLAY " "

   # In the external program '6541_run_program_6', the exit program statement returns NULL.
   LET run_cmd = "./6541_run_program_6"
   RUN run_cmd RETURNING run_returning_code
   LET run_status_code       = run_returning_code MOD 256
   LET run_exit_program_code = run_returning_code / 256
   IF run_returning_code    IS NULL THEN DISPLAY "1. NULL" ELSE DISPLAY "1. run_returning_code    = ",run_returning_code END IF
   IF run_status_code       IS NULL THEN DISPLAY "2. NULL" ELSE DISPLAY "2. run_status_code       = ",run_status_code END IF
   IF run_exit_program_code IS NULL THEN DISPLAY "3. NULL" ELSE DISPLAY "3. run_exit_program_code = ",run_exit_program_code END IF

END MAIN