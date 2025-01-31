

MAIN
	DEFINE mywin ui.Window 
	DEFINE msg STRING

	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT


	CALL mywin.openWithForm("wLabel", "form/wig_label_urlEvent",1,1)
  CALL mywin.setText("Label URL")
  	
	MENU

		ON ACTION "UI_API_WEBSITE"
			CALL ui.Interface.frontCall("standard","launchurl", ["www.querix.com"],[])

		ON ACTION "UI_API_EMAIL"
			CALL ui.Interface.frontCall("standard","launchurl", ["mailto:support@querix.com?cc=info@querix.com&bcc=sales@querix.com&subject=My%20Subject&body=This%20is%20my%20message%20body"],[])
	  	
	  ON ACTION "CANCEL"
	    EXIT MENU
	    
    ON ACTION "HELP"
    	CALL onlineHelp("FormPropertyEvent",NULL)    
	END MENU

END MAIN
