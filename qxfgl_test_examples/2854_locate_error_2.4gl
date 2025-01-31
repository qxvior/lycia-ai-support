#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################

DATABASE stores

MAIN
   DEFINE
      var_text LIKE lyc_2854.col_text
--      var_text TEXT -- runtime error does not appear      

   LOCATE var_text IN MEMORY
   DISPLAY "1.  status = ",status 

END MAIN
