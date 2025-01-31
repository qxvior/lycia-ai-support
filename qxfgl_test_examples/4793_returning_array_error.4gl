##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################

MAIN
   DEFINE
      arr DYNAMIC ARRAY OF CHAR(80),
      i INTEGER
      
   FOR i = 1 TO 10
      LET arr[i] = "Old Row ",i USING "<<<&"
   END FOR 
   
   DISPLAY "Before CALL func(): arr.arr.getLength() = ",arr.getLength() USING "<<<&"
   FOR i = 1 TO arr.getLength()
      DISPLAY arr[i]
   END FOR     

--   LET arr = func()  --> When assigning, there are no old elements in the target array 'arr' !!!
   CALL func()RETURNING arr      

   DISPLAY ""

   DISPLAY "After  CALL func(): arr.arr.getLength() = ",arr.getLength() USING "<<<&"
   FOR i = 1 TO arr.getLength()
      DISPLAY arr[i]
   END FOR     

END MAIN

FUNCTION func()
   DEFINE
      arr DYNAMIC ARRAY OF CHAR(80),
      i INTEGER
      
   FOR i = 1 TO 5
      LET arr[i] = "New Row ",i USING "<<<&"
   END FOR    

   RETURN arr
END FUNCTION
