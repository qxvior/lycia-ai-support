##################################################################################
# MODULE SCOPE Variables
##################################################################################
DEFINE labelText STRING

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

	CALL mywin.openWithForm("wLabel", "form/wig_label_text_multi_line",1,1,"")

  CALL mywin.setText("Label Multi-Line")
  

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

   	CASE labelText[1,2]

  		WHEN "00"
  			LET labelText= "01\nLabel labelText\ntest\ndata\n01"  		
  		WHEN "01"
  			LET labelText= "02\nLabel labelText\ntest data - 02"  		
  		WHEN "02"
  			LET labelText= "03\nLabel\nlabelText\ntest data\n03"   		
  		WHEN "03"
  			LET labelText= "04\nLabel labelText\n- 04"   		
  		WHEN "04"
  			LET labelText= "05\nVery Long Label labelText\n test data Very Long\nXXL XXL\nXXL XXL\nXXL XXL\nXXL XXL\nXXL XX ----------------------------------------------------------------------------\n05" 
  		WHEN "05"
  			LET labelText= "00\nMy initial Single Line Test\nLabel defined in the form"   			

   	

  			
  		OTHERWISE
  			#ERROR "Invalid labelText value!"
  			LET labelText= "01\nLabel labelText\n test data - 01" 
  	END CASE
  	
END FUNCTION