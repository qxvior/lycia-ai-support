##############################################################################################################
# Author: Bondar A.G.
##############################################################################################################
MAIN
   DEFINE
      field1,
      field2,
      field3  CHAR(10)

   OPEN WINDOW w1 AT 2,2 WITH FORM "0663/0663_pageup_pagedown_in_textfield" ATTRIBUTE (FORM LINE FIRST,BORDER)
   DISPLAY "Press PageDown, Tab, PageUp, Accept" AT 7,1
   
   INPUT BY NAME field1,field2,field3

END MAIN

