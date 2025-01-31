##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores

MAIN
   DEFINE
      var_float_1 LIKE lyc_2224.col_float_1, 
      var_float_2 LIKE lyc_2224.col_float_2,
      var_float_3 LIKE lyc_2224.col_float_3

   DISPLAY "1. var_float_1  ",var_float_1.gettypefullname() 
   DISPLAY "2. var_float_2  ",var_float_1.gettypefullname()
   DISPLAY "3. var_float_3  ",var_float_1.gettypefullname()   

END MAIN