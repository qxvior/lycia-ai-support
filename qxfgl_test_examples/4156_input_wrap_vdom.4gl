##############################################################################################################
# Testing the priority of the INPUT statement control blocks execution
# Author: Bondar A.G.
##############################################################################################################
# full log
MAIN
   DEFINE
      field1,
      field2,
      field3 CHAR(10),
      i      INTEGER

   OPTIONS
      INPUT WRAP
   
   DEFER INTERRUPT

   OPEN WINDOW w1 AT 1,2 WITH FORM "4156/4156_input_wrap_vdom" ATTRIBUTE (FORM LINE FIRST)

   DISPLAY "1. Press <Enter> 3 times, press <Accept>                " AT 4,1
   DISPLAY "2. Press <Tab> 3 times, press <Accept>                  " AT 5,1
   DISPLAY "3. Press <Right> 3 times, press <Accept>                " AT 6,1
   DISPLAY "4. Press <Down> 3 times, press <Accept>                 " AT 7,1
   DISPLAY "5. Press <Shift-Tab> 4 times, press <Accept>            " AT 8,1
   DISPLAY "6. Press <Left> 4 times, press <Accept>                 " AT 9,1
   DISPLAY "7. Press <Up> 4 times, press <Accept>                   " AT 10,1

   LET i = 0
   INPUT BY NAME field1, field2, field3

      BEFORE INPUT
         LET i = i+1
         DISPLAY i," BEFORE INPUT"

      BEFORE FIELD field1
         LET i = i+1
         DISPLAY i," BEFORE FIELD field1"

      BEFORE FIELD field2
         LET i = i+1
         DISPLAY i," BEFORE FIELD field2"

      BEFORE FIELD field3
         LET i = i+1
         DISPLAY i," BEFORE FIELD field3"

      AFTER FIELD field1
         LET i = i+1
         DISPLAY i," AFTER FIELD field1"

      AFTER FIELD field2
         LET i = i+1
         DISPLAY i," AFTER FIELD field2"

      AFTER FIELD field3
         LET i = i+1
         DISPLAY i," AFTER FIELD field3"

      AFTER INPUT
         LET i = i+1
         DISPLAY i," AFTER INPUT"
         
   END INPUT     

   CLOSE WINDOW w1 

END MAIN
