##################################################################################
# MODULE SCOPE Variables
##################################################################################	
DEFINE lbImage, lbText VARCHAR(100)

##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE mywin ui.Window, myform ui.Form
	DEFINE msg STRING

	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	LET lbText = "01 - Label f1 test data - 01"

	CALL mywin.openWithForm("wLabel", "form/wig_label_simple",1,1,"")
	LET myform = mywin.getForm() -- returns reference to form 
  CALL mywin.setText("Label Simple")
  	
	MENU
	    	 		 	
  	ON ACTION "Increment"
			CALL textChange()
			CALL imageChange()
			#change label using classic 4gl DISPLAY statement
  		DISPLAY lbText TO lbTextOnly
  		DISPLAY lbImage TO lbImageOnly
  		#Change label using API methods
  		CALL myform.setElementText("lbTextImage", lbText)
	    CALL myform.setElementImage("lbTextImage", lbImage)
	    	  		

	        
	  ON ACTION "VarValue"
	  	LET msg = "The value of lb1 =",trim(lbText), " and imageUri=", trim(lbImage)
	  	CALL fgl_winmessage("Text and image value of the label lb1",msg,"info")
	  	
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

   	CASE lbText
  		WHEN "01 - Label labelText test data - 01"
  			LET lbText= "02 - Label labelText test data - 02"  		
  		WHEN "02 - Label labelText test data - 02"
  			LET lbText= "03 - Label labelText test data - 03"   		
  		WHEN "03 - Label labelText test data - 03"
  			LET lbText= "04 - Label labelText - 04"   		
  		WHEN "04 - Label labelText - 04"
  			LET lbText= "05 - Very Long Label labelText test data Very Long XXL XXL XXL XXL XXL XXL XXL XXL XXL XXL - 05" 
  		WHEN "05 - Very Long Label labelText test data Very Long XXL XXL XXL XXL XXL XXL XXL XXL XXL XXL - 05"
  			LET lbText= "01 - Label labelText test data - 01"   			
  			
  		OTHERWISE
  			#ERROR "Custom labelText value!"
  			LET lbText= "01 - Label labelText test data - 01" 
  	END CASE
  	
END FUNCTION


##################################################################################
# FUNCTION imageChange()
#
#
##################################################################################	
FUNCTION imageChange()
   	CASE lbImage
  		WHEN "qx://application/icon32/people_05.ico"
  			LET lbImage= "qx://application/icon32/edit04.ico" 	
  				
  		WHEN "qx://application/icon32/edit04.ico" 
  			LET lbImage= "qx://application/icon32/add_w2_01_032.ico"   
  					
  		WHEN "qx://application/icon32/add_w2_01_032.ico" 
  			LET lbImage= "qx://application/icon32/delete_w2_01_032.ico"    		
  			
  		WHEN "qx://application/icon32/delete_w2_01_032.ico"
  			LET lbImage= "qx://application/icon32/people_05.ico" 			
  			
  		OTHERWISE
  			#MESSAGE "Custom lb1 value!"
  			LET lbImage= "qx://application/icon32/people_05.ico"
  	END CASE
  	
END FUNCTION