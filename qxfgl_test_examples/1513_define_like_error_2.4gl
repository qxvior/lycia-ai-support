#########################################################################################################################################
# Author: Bondar A.G.
#########################################################################################################################################
DATABASE stores
MAIN
   DEFINE 
      v_nchar LIKE lyc_1513.col_nchar 
 
   DISPLAY BASE.TypeInfo.CREATE(v_nchar).toString()
   DISPLAY v_nchar.gettypefullname()   

END MAIN
