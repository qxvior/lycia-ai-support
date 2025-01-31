##############################################################################################################
# Testing the priority of the INPUT ARRAY statement control blocks execution
# Author: Bondar A.G.
##############################################################################################################
# bug 14728
# full log
MAIN
   DEFINE
      prg_arr DYNAMIC ARRAY OF RECORD
                              field1 CHAR(10),
                              field2 CHAR(10),
                              field3 CHAR(10)
                           END RECORD,
      i INTEGER
   DEFER INTERRUPT
   OPEN WINDOW w1 AT 1,2 WITH FORM "3621/3621_input_array_before_row" ATTRIBUTE (FORM LINE FIRST)

   LET i = 0
   INPUT ARRAY prg_arr WITHOUT DEFAULTS FROM scr_arr.* ATTRIBUTE(UNBUFFERED,auto append=FALSE)
      BEFORE INPUT
         LET i = i+1
         DISPLAY i," BEFORE INPUT"
      BEFORE ROW
         LET i = i+1
         DISPLAY i," BEFORE ROW"
      BEFORE INSERT
         LET i = i+1
         DISPLAY i," BEFORE INSERT"
      BEFORE FIELD field1
         LET i = i+1
         DISPLAY i," BEFORE FIELD field1"
   END INPUT
   CLOSE WINDOW w1
END MAIN