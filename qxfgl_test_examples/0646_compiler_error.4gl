##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
MAIN
   DEFINE
      field1,
      field2,
      field3  CHAR(10)

   OPEN WINDOW w1 AT 2,2 WITH FORM "0646/0646_compiler_error" ATTRIBUTE (FORM LINE FIRST,BORDER)
   INPUT BY NAME field1,field2,field3
       ON KEY(SPACE)
          DISPLAY "SPACE"
       ON KEY(HOME)
          DISPLAY "HOME "
       ON KEY(END)
          DISPLAY "END  "
   END INPUT

END MAIN
