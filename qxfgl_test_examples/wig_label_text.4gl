##################################################################################
# MODULE SCOPE Variables
##################################################################################
DEFINE labelText VARCHAR(60)

##################################################################################
# MAIN
#
#
##################################################################################		
MAIN

	DEFINE msg STRING
	DEFINE mywin ui.Window, myform ui.Form
 
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	LET labelText = "01 - Label labelText test data - 01"

	CALL mywin.openWithForm("wLabel", "form/wig_label_text",1,1,"")

  CALL mywin.setText("Label Text")
  

	LET myform = mywin.getForm() -- returns reference to form 

	
	MENU

	  ON ACTION "EDIT"
  		LET labelText =  fgl_winprompt(1,1,"Enter the new label","01 - Label labelText test data - 01",50,0)
  		CALL myform.setElementText("lb1", labelText)
 		 	
  	ON ACTION "Increment"
			CALL textChange() 
			DISPLAY labelText TO lb1

  	ON ACTION "UI_API_TEXT"
			CALL textChange()   
	    CALL myform.setElementText("lb1", labelText)
	    
  	ON ACTION "VarValue"
  		LET msg = "The value of labelText =",trim(labelText)
  		CALL fgl_winmessage("value of labelText",msg,"info")

  	ON ACTION "CANCEL"
    	EXIT MENU
    	
    ON ACTION "HELP"
    	CALL onlineHelp("Label",NULL)      	
    
	END MENU

END MAIN


##################################################################################
# FUNCTION textChange()
#
#
##################################################################################	
FUNCTION textChange()

   	CASE labelText
  		WHEN "01 - Label labelText test data - 01"
  			LET labelText= "02 - Label labelText test data - 02"  		
  		WHEN "02 - Label labelText test data - 02"
  			LET labelText= "03 - Label labelText test data - 03"   		
  		WHEN "03 - Label labelText test data - 03"
  			LET labelText= "04 - Label labelText - 04"   		
  		WHEN "04 - Label labelText - 04"
  			LET labelText= "05 - Very Long Label labelText test data Very Long XXL XXL XXL XXL XXL XXL XXL XXL XXL XXL - 05" 
  		WHEN "05 - Very Long Label labelText test data Very Long XXL XXL XXL XXL XXL XXL XXL XXL XXL XXL - 05"
  			LET labelText= "01 - Label labelText test data - 01"   			
  			
  		OTHERWISE
  			#ERROR "Invalid labelText value!"
  			LET labelText= "01 - Label labelText test data - 01" 
  	END CASE
  	
END FUNCTION