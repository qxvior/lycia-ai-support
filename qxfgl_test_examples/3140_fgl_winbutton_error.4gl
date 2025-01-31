#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE
      answer char(1) 

   WHENEVER ANY ERROR STOP

   LET answer = fgl_winbutton("Message box title","","Yes","Yes|No|Cancel","exclamation",1) 

   DISPLAY answer

END MAIN
