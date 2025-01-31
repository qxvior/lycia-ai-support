#########################################################################################################################################
# Created By: albo (Bondar A.G.)
#########################################################################################################################################
MAIN
   DEFINE
      answer char(1) 

   WHENEVER ANY ERROR STOP

   LET answer = fgl_winbutton("Message box title","Message box message","Yes","Yes|No|Cancel","exclamation",1) 

   DISPLAY answer

END MAIN

{
Scenario to run the test cases:
Press [Y]
Press [N]
Press [C]
Press [y]
Press [n]
Press [c]
Press RightArrow 3 times (As a result, we have to be on the <Yes> button)
Press LeftArrow 3 times (As a result, we have to be on the <Yes> button)
}