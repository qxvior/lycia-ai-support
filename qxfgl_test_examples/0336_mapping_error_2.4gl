##########################################################################################################################################
# Author: Bondar A.G.
##########################################################################################################################################
DATABASE stores
MAIN
   DEFINE
      v_nchar_1 LIKE  tab_0336.col_nchar_1,
      v_nchar_2 LIKE  tab_0336.col_nchar_2,
      v_nchar_3 LIKE  tab_0336.col_nchar_3
   
   WHENEVER ERROR CONTINUE

   DISPLAY v_nchar_1.gettypefullname() 
   DISPLAY v_nchar_2.gettypefullname()
   DISPLAY v_nchar_3.gettypefullname()

--   DROP TABLE tab_0336

END MAIN
