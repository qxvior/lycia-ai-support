##############################################################################################################
# Testing scope of WHENEVER statement.
# Author: Bondar A.G.
##############################################################################################################
MAIN
   DEFINE
      v_integer INTEGER

   WHENEVER ERROR CONTINUE
   LET v_integer = "abc"
   DISPLAY "main:  status = ",status

   START REPORT rep_1 TO FILE "dummy" 
   OUTPUT TO REPORT rep_1()
   FINISH REPORT rep_1

   LET v_integer = "abc"
   DISPLAY "main:  status = ",status

   WHENEVER ANY ERROR CONTINUE
   LET v_integer = "abc"
   DISPLAY "main:  status = ",status

   START REPORT rep_2 TO FILE "dummy" 
   OUTPUT TO REPORT rep_2()
   FINISH REPORT rep_2

   LET v_integer = "abc"
   DISPLAY "main:  status = ",status

   DISPLAY "end program"
END MAIN
