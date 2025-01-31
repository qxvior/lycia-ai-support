	DEFINE lb1 VARCHAR(60)
	
main
	DEFINE msg STRING
	DEFINE mywin ui.Window, myform ui.Form
	
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	OPEN WINDOW mywin WITH FORM "form/wig_label_event" 
	CALL ui.Interface.setText("Label Event")

	MENU "mymenu"
		ON ACTION "actOnMouseClickLabelText"
			CALL fgl_winmessage("actOnMouseClickLabelText","actOnMouseClickLabelText - Action", "info")			

		ON ACTION "actOnMouseClickLabelImage"
			CALL fgl_winmessage("actOnMouseClickLabelImage","actOnMouseClickLabelImage - Action", "info")	
			
		ON ACTION "actOnMouseClickLabelTextImage"
			CALL fgl_winmessage("actOnMouseClickLabelTextImage","actOnMouseClickLabelTextImage - Action", "info")	

		COMMAND KEY ("F101")
			CALL fgl_winmessage("F101","F101 LabelWithText onMouseClick Event", "info")


		COMMAND KEY (F102)
			CALL fgl_winmessage("F102","F102 LabelWithImage onMouseClick Event", "info")
			

		COMMAND KEY (F103)
			CALL fgl_winmessage("F103","F103 LabelWithTextImage onMouseClick Event", "info")
			
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
