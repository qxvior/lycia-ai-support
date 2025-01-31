CONSTANT ATTRIBUTE_OK STRING = "attribute_GREEN"
CONSTANT ATTRIBUTE_WARNING STRING = "attribute_MAGENTA"
CONSTANT ATTRIBUTE_ERROR STRING = "attribute_RED"
	
MAIN
	DEFINE l_style STRING
	DEFINE l_inp CHAR(1)
	DEFINE l_msg STRING
	
	OPEN WINDOW w_style WITH FORM "form/css_style_color"

	DISPLAY "Hello World in Green" TO f_green ATTRIBUTE(STYLE="attribute_GREEN")
	DISPLAY "Hello World in Magenta" TO f_magenta ATTRIBUTE(STYLE="attribute_MAGENTA")
	DISPLAY "Hello World in Red" TO f_red ATTRIBUTE(STYLE="attribute_RED")
	
	LET l_style = ATTRIBUTE_OK
	DISPLAY "Hello World using CONSTANT ATTRIBUTE_OK" TO f_ok ATTRIBUTE(STYLE=l_style)
	
	LET l_style = ATTRIBUTE_WARNING
	DISPLAY "Hello World using CONSTANT ATTRIBUTE_WARNING" TO f_warning ATTRIBUTE(STYLE=l_style)
	
	LET l_style = ATTRIBUTE_ERROR
	DISPLAY "Hello World using CONSTANT ATTRIBUTE_ERROR" TO f_error ATTRIBUTE(STYLE=l_style)


	MENU
		BEFORE MENU
			 CALL dialog.setActionHidden("ACCEPT",TRUE)
			 
		ON ACTION "DEMO"
		
			LET l_inp = fgl_winbutton("Choose DISPLAY Style Color", "What Color Style do you want to use ?", "Error", "Error|Warning|Ok", "exclamation", 1) 
			
			CASE l_inp
				WHEN "E"
					LET l_style = ATTRIBUTE_ERROR
	
				WHEN "W"
					LET l_style = ATTRIBUTE_WARNING
	
				WHEN "O"
					LET l_style = ATTRIBUTE_OK
				
				OTHERWISE
					EXIT MENU
			END CASE
			
			LET l_msg = "This string was displayed using ATTRIBUTE(STYLE=", trim(l_style), ")"
			DISPLAY l_msg to f_dynamic ATTRIBUTE(STYLE=l_style)
			
		ON ACTION "CANCEL"
			EXIT MENU
					
	END MENU
	
	CLOSE WINDOW w_style 
		
END MAIN