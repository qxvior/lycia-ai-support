main
define f1 VARCHAR(300)
define msg STRING

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	DEFER INTERRUPT

	CALL ui_init()	
	
	LET f1 = "{CONTEXT}/public/querix/html/demo/html_01.html"


	OPEN WINDOW mywin WITH FORM "form/wig_browser_simple" 
	CALL ui.Interface.setText("Browser Simple")	

	DISPLAY BY NAME f1
	MENU
	#BEFORE MENU
	#	CALL setDemoKeyLabels_01()				

  ON ACTION "Edit"
  	LET f1 =  fgl_winprompt(1,1,"Enter the URL","www.querix.com",300,0)
  	DISPLAY BY NAME f1
 		 	
  ON ACTION "Increment"
   	CASE f1
  		WHEN "{CONTEXT}/public/querix/html/demo/html_01.html"
  			LET f1= "{CONTEXT}/public/querix/html/demo/html_02.html" 	
  			
  		WHEN "{CONTEXT}/public/querix/html/demo/html_02.html" 	
  			LET f1= "www.liberatii.com" 

  		WHEN "www.liberatii.com" 
  			LET f1= "www.querix.com" 				

  		WHEN "www.querix.com" 
  			LET f1= "{CONTEXT}/public/querix/html/demo/html_01.html" 				

  		OTHERWISE
  			ERROR "Invalid f1 value!"
  			LET f1= "{CONTEXT}/public/querix/html/demo/html_01.html"
  	END CASE
  	
    DISPLAY BY NAME f1
    
  ON ACTION "VarValue"
  	LET msg = "The value of f1 =",trim(f1)
  	CALL fgl_winmessage("value of f1",msg,"info")

  ON ACTION "HELP"
  	CALL onlineHelp("Browser",NULL)
		#https://querix.com/go/lycia/index.htm#06_reference/ui/forms/widgets/browser.htm%3FTocPath%3DLycia%2520reference%7CUser%2520Interface%7CForms%7CWidgets%7C_____7		 	
  	
  ON ACTION "CANCEL"
    EXIT MENU
    
END MENU

END MAIN
