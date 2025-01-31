##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	CALL ui_init()
	
	DEFER INTERRUPT
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW wButton WITH FORM "form/wig_button_simple"
	CALL ui.Interface.setText("Button Simple")
		
  MENU "Button Menu"
  	ON ACTION "actPrint"
  		CALL fgl_winmessage("Action-actPrint","The button you pressed triggered the action event actPrint","info")
  		
  	COMMAND KEY("F5")
  		CALL fgl_winmessage("Key-F5","The button you pressed triggered the key event F5","info")
  	
  	ON ACTION "CANCEL"
  		EXIT MENU
  
  END MENU
  
END MAIN
	
	
