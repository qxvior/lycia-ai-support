MAIN
	DEFINE c CHAR
	DEFINE l_form_line_input SMALLINT
		CALL fgl_setenv("QX_COMPAT","Informix4GL")

	
	OPEN WINDOW w_per AT 1,1 WITH FORM "3556/3556_infomix_mode_display_at_align"

	  MENU "."
		COMMAND "DISPLAY AT", "Display some text (numbers) to different location to test the layout"
			CALL display_frame()
						  
	  	COMMAND "EXIT"
	  		EXIT MENU
	  END MENU
END MAIN
		

FUNCTION display_frame()
	DEFINE i SMALLINT
	DEFINE c CHAR, ch CHAR(2)
	dEFINE msgStr STRING
	DEFINE l_form_line SMALLINT 
	DEFINE md_win_l SMALLINT
	DEFINE md_win_c SMALLINT
	DEFINE md_form_height SMALLINT	

	

	LET md_win_l = 1
	LET md_win_c = 1	
	LET md_form_height = 42 
	LET l_form_line = 3


	
	FOR i = 3 TO l_form_line -1
		LET ch = i USING "##"
		LET ch = "R", trim(ch)
		DISPLAY ch AT i,1 ATTRIBUTE(GREEN)
	END FOR
	LET msgStr = "OPTIONS FORM LINE ", trim(l_form_line)
	DISPLAY msgStr AT l_form_line-1,5
	

	FOR i = 1 TO 80
		LET ch = i USING "##"
		LET c = ch[2]	
		DISPLAY c AT l_form_line,i  ATTRIBUTE(RED)
		DISPLAY c AT md_form_height+l_form_line-1,i ATTRIBUTE(RED)
	END FOR
	
	FOR i = l_form_line TO md_form_height + l_form_line-1
		LET ch = i USING "##"
		LET c = ch[2]		
		DISPLAY c AT i,1 ATTRIBUTE(RED)
		DISPLAY c AT i,81 ATTRIBUTE(RED)
	END FOR
	
	#special ruler characters inside the form to test correct alignment inside the form
	FOR i = l_form_line+12 TO l_form_line+20
		LET ch = i USING "##"
		LET c = ch[2]		
		DISPLAY c AT i,42 ATTRIBUTE(RED)
		DISPLAY c AT i,53 ATTRIBUTE(RED)	
	END FOR	

END FUNCTION


