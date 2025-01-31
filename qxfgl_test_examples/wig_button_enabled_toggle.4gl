##################################################################################
# MODULE SCOPE
##################################################################################

##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	#DEFINE s1,s2, msgStr STRING
	DEFINE bt0,bt1,bt2 ui.Button
	#DEFINE fBtNormal, fBtToggle1, fBtToggle2  STRING

	DEFINE i INT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	DEFER INTERRUPT

	CALL ui_init()	
	
	OPEN WINDOW wButton WITH FORM "form/wig_button_enabled_toggle"
	CALL ui.Interface.setText("Button Toggle")

	LET bt0 = ui.Button.ForName("btNormal")
  LET bt1 = ui.Button.ForName("btToggle1")
  LET bt2 = ui.Button.ForName("btToggle2")

	CALL indicateButtonState(bt1, bt2)
# 	LET msgStr = "Button 1 State:", trim(bt1.getIsPressed())
#	IF bt1.getIsPressed() THEN
#  	DISPLAY msgStr  TO fBtToggle1 ATTRIBUTE(GREEN)
#  ELSE
#  	DISPLAY msgStr  TO fBtToggle1 ATTRIBUTE(RED)
#  END IF 
#
#  LET msgStr = "Button 2 State:", trim(bt2.getIsPressed())
#	IF bt1.getIsPressed() THEN
#  	DISPLAY msgStr  TO fBtToggle2 ATTRIBUTE(GREEN)
#  ELSE
#  	DISPLAY msgStr  TO fBtToggle2 ATTRIBUTE(RED)
#  END IF 


	DISPLAY "!" TO btNormal	
	DISPLAY "!" TO btToggle1
	DISPLAY "!" TO btToggle2	
	
	MENU #INPUT s1 FROM f3 attributes(unbuffered)
	BEFORE MENU #INPUT 
	   DISPLAY "!" TO btNormal
	   DISPLAY "!" TO btToggle1
	   DISPLAY "!" TO btToggle2
	   
    #ON ACTION actBt5Click
    #   LET i=bt1.getIsPressed()
    #   DISPLAY "Button1.getIsPressed() : <",i,">"
    #   DISPLAY "Button2.getIsPressed() : <",bt2.getIsPressed(),">"

    ON ACTION switchButtonToggleState1
       # get first button
       #LET bt=ui.Button.ForName("btToggle1")
       # get its down state 
       LET i=bt1.getIsPressed()
       # set reversed state
       CALL bt1.SetIsPressed(1-i)
			CALL indicateButtonState(bt1, bt2)

    ON ACTION switchButtonToggleState2
       # get Second button
       #LET bt=ui.Button.ForName("btToggle2")
       # get its down state 
       LET i=bt2.getIsPressed()
       # set reversed state
       CALL bt2.SetIsPressed(1-i)
			CALL indicateButtonState(bt1, bt2)
			
		ON ACTION actBtNormal 
			DISPLAY "Button Clicked" TO fBtNormal
			SLEEP 2
			DISPLAY "" TO fBtNormal
			
    on action actBtToggle1
			CALL indicateButtonState(bt1, bt2)

    on action actBtToggle2
			CALL indicateButtonState(bt1, bt2)

		ON ACTION "actButtonNormal_auto"
			DISPLAY "?" TO btNormal
			#CALL bt0.setenable()
		ON ACTION "actButtonNormal_enabled"
			DISPLAY "!" TO btNormal
			CALL bt0.setenable(TRUE)
		ON ACTION "actButtonNormal_disabled"
			DISPLAY "*" TO btNormal
			CALL bt0.setenable(FALSE)


		ON ACTION "actButtonToggle1_automatic"
			DISPLAY "?" TO btToggle1

		ON ACTION "actButtonToggle1_enabled"
			DISPLAY "!" TO btToggle1
			CALL bt1.setenable(TRUE)

		ON ACTION "actButtonToggle1_disabled"
			DISPLAY "*" TO btToggle1
			CALL bt1.setenable(FALSE)

		ON ACTION "actButtonToggle2_auto"
			DISPLAY "?" TO btToggle2

		ON ACTION "actButtonToggle2_enabled"
			DISPLAY "!" TO btToggle2
			CALL bt1.setenable(FALSE)

		ON ACTION "actButtonToggle2_disabled"
			DISPLAY "*" TO btToggle2
			CALL bt1.setenable(TRUE)


	    ON ACTION "HELP"
	    	CALL onlineHelp("Button",NULL)
	    	
    ON ACTION "CANCEL"
    	EXIT MENU      
	END MENU #INPUT


END MAIN


##################################################################################
# FUNCTION FUNCTION indicateButtonState(bt1, bt2)
#
#
##################################################################################
FUNCTION indicateButtonState(bt1, bt2)
	DEFINE bt1,bt2 ui.Button
	DEFINE msgStr STRING
	
 	LET msgStr = "Button 1 State:", trim(bt1.getIsPressed())
	IF bt1.getIsPressed() THEN
  	DISPLAY msgStr  TO fBtToggle1 ATTRIBUTE(GREEN)
  ELSE
  	DISPLAY msgStr  TO fBtToggle1 ATTRIBUTE(RED)
  END IF 

  LET msgStr = "Button 2 State:", trim(bt2.getIsPressed())
	IF bt2.getIsPressed() THEN
  	DISPLAY msgStr  TO fBtToggle2 ATTRIBUTE(GREEN)
  ELSE
  	DISPLAY msgStr  TO fBtToggle2 ATTRIBUTE(RED)
  END IF 

END FUNCTION


##################################################################################
# FUNCTION displayButtonState()
#
#
##################################################################################
#FUNCTION displayButtonState()
#	DISPLAY BY NAME fBtNormal, fBtToggle1, fBtToggle2  
#END FUNCTION