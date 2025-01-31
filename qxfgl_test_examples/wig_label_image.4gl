	DEFINE lb1 VARCHAR(60)
	
main
	DEFINE msg STRING
	DEFINE mywin ui.Window, myform ui.Form
	
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	LET lb1 = "qx://application/icon32/people_05.ico"

	CALL mywin.openWithForm("wLabel", "form/wig_label_image",1,1,NULL)
  CALL mywin.setText("Simple Label with an image (no text) Demo 01")
	LET myform = mywin.getForm() -- returns reference to form 

	CALL ui.Interface.setText("Label Image")
		
	MENU
  	ON ACTION "Edit"
  		LET lb1 =  fgl_winprompt(1,1,"Enter the new image file name","icon32/edit04.ico",50,0)
  		DISPLAY BY NAME lb1
 		 	
  	ON ACTION "Increment"
			#MESSAGE ""
  		CALL imageChange() 			
    	DISPLAY BY NAME lb1


  	ON ACTION "UI_API_IMAGE"
				CALL imageChange()   
	    	CALL myform.setElementImage("lb1", lb1)
        
  	ON ACTION "VarValue"
  		LET msg = "The value of lb1 =",trim(lb1)
  		CALL fgl_winmessage("value of lb1",msg,"info")
  	
  	ON ACTION "CANCEL"
    	EXIT MENU
    	
    ON ACTION "HELP"
    	CALL onlineHelp("Label",NULL)    	
    
	END MENU

END MAIN


FUNCTION imageChange()
   	CASE lb1
  		WHEN "qx://application/icon32/people_05.ico"
  			LET lb1= "qx://application/icon32/edit04.ico" 	
  				
  		WHEN "qx://application/icon32/edit04.ico" 
  			LET lb1= "qx://application/icon32/add_w2_01_032.ico"   
  					
  		WHEN "qx://application/icon32/add_w2_01_032.ico" 
  			LET lb1= "qx://application/icon32/delete_w2_01_032.ico"    		
  			
  		WHEN "qx://application/icon32/delete_w2_01_032.ico"
  			LET lb1= "qx://application/icon32/people_05.ico" 			
  			
  		OTHERWISE
  			#MESSAGE "Custom lb1 value!"
  			LET lb1= "qx://application/icon32/people_05.ico"
  	END CASE
  	
END FUNCTION