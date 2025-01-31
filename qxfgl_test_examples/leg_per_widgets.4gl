##################################################################################
# Module Scope Variables
##################################################################################
DEFINE rec_widget_radBut RECORD
	RadioGroup1,RadioGroup2,RadioGroup3 STRING
	END RECORD

DEFINE rec_data RECORD
		f1 STRING,
		f2 DATE,
		f3 SMALLINT,
		f4 STRING,
		f5 STRING,
		f6 DATE,
		f7 SMALLINT,
		f8 STRING,
		f9 STRING,
		f10 STRING,
		f11 STRING,
		f12 STRING,
		f13 STRING,
		f14 STRING,
		f15 STRING,
		f16 DATE,
		f17 STRING,
		f18 STRING,
		f19 STRING,
		f20 STRING,
		f21 SMALLINT,
		f22 STRING,
		f23 STRING,
		f24 STRING,
		f25 STRING,
		f26 STRING,
		f27 SMALLINT,
		f28 STRING,
		f29 STRING,
		f30 STRING,
		f31 STRING,
		f32 STRING,
		f33 STRING,
		f34 STRING,
		f35 STRING,
		radBut1 SMALLINT,
		amount1,amount2,amount3,amount4,amount5,amount6,amount7,am_sum money
	END RECORD

	DEFINE md_legacy_mode BOOLEAN
	DEFINE md_dialog_window BOOLEAN
	DEFINE md_form_line SMALLINT# Default = 3
	DEFINE md_menu_line SMALLINT #Default = 1 NOTE: MENU HELP LINE is the next line and can not be set/changed
	DEFINE md_prompt_line SMALLINT #Default = 1
	DEFINE md_message_line SMALLINT #Default = 2
	DEFINE md_comment_line SMALLINT #The next-to-last line of the 4GL screen (or the last line in a 4GL window) displays COMMENTS attribute messages.
	DEFINE md_error_line SMALLINT #The last line of the 4GL SCREEN
	DEFINE md_win_l SMALLINT
	DEFINE md_win_c SMALLINT
	DEFINE md_form_height SMALLINT	
	
##################################################################################
# MAIN
#
#3
##################################################################################	
MAIN
	DEFINE c CHAR
	DEFINE l_form_line_input SMALLINT

	CALL fgl_setenv("QX_COMPAT","Informix4GL")
	
	DEFER INTERRUPT

	LET md_win_l = 1
	LET md_win_c = 1	
	LET md_form_height = 42  #this needs to be adjusted when the PER changes	
	
  OPTIONS ACCEPT KEY RETURN
  OPTIONS INPUT WRAP
  OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
  
  CALL init_rec_data()

	WHILE TRUE
	
	
		IF NOT md_dialog_window THEN #none dialog window
			OPEN WINDOW w_per AT md_win_l,md_win_c WITH FORM "per/leg_per_widgets"
		ELSE
			OPEN WINDOW w_per AT md_win_l,md_win_c WITH FORM "per/leg_per_widgets" ATTRIBUTE(BORDER)	
		END IF
		CALL ui.Interface.setText("PER Widgets")	
		CALL display_win_attributes()
					
	  MENU "."
			COMMAND "OPTIONS Line", "Change Form Line"
	
				CALL input_option_line()
{			
			LET l_form_line_input =  fgl_winprompt(1,1,"Enter Form Line",3,2,1)
			
			IF l_form_line_input < 1 OR l_form_line_input > 20 THEN
				CALL fgl_winmessage("Invalid value","Valid range for form line is 1-20","info")
				CONTINUE MENU
			END IF
			
			IF l_form_line_input = md_form_line THEN #nothing changed
				CALL fgl_winmessage("Same value","New form line = original form line","info")
				CONTINUE MENU
			END IF
			
			LET md_form_line = l_form_line_input
		  OPTIONS FORM LINE md_form_line
}
				EXIT MENU
				
			COMMAND "DISPLAY Data", "Display record data to fields"
				DISPLAY BY NAME rec_data.*
				DISPLAY "www.querix.com" TO f_brows
	  	COMMAND "INPUT", "Input data record from fields"
				INPUT BY NAME rec_data.* 
					WITHOUT DEFAULTS HELP 100
					BEFORE INPUT
						DISPLAY "www.querix.com" TO f_brows
					ON ACTION "ERROR"
						ERROR "This is a 4GL-ERROR message"
					ON ACTION "MESSAGE"
						ERROR "This is a 4GL-MESSAGE message"
	
			  	ON ACTION "actHello"	
						CALL fgl_winmessage("actHello","Hello World","info")
			  	#ON ACTION "actGoodBye"	
					#	CALL fgl_winmessage("actGoodBye","Good Bye World","info")3
			  	ON ACTION "actHello2"	
						CALL fgl_winmessage("actHello2","Hello World 2","info")
			  	#ON ACTION "actGoodBye2"	
					#	CALL fgl_winmessage("actGoodBye2","Good Bye World 2","info")	
					ON KEY (F6)			  		
						CALL fgl_winmessage("Key F6","Key F6","info")	
					ON KEY (F7)			  		
						CALL fgl_winmessage("Key F7","Key F7","info")						
				END INPUT
	
			COMMAND "DISPLAY AT", "Display some text (numbers) to different location to test the layout"
				CALL display_at()
	
			COMMAND "CLEAR FORM", "Clear the form"
				CLEAR FORM	
	
			#COMMAND "Widget Specific", "Some widget specific functionality"
			#	CALL widgetsMenu()
			#	MENU "widget specific"
			#	
			#		ON ACTION "RadioButton"
			#			OPEN WINDOW wRadBut WITH FORM "per/per_widgets_radiobutton"
			#			INPUT BY NAME rec_widget_radBut.* WITHOUT DEFAULTS
			#
			#			CLOSE WINDOW wRadBut
			#
			#		ON ACTION "EXIT"
			#			EXIT MENU
			#	END MENU
						  
	  	COMMAND "CANCEL" "Exit Menu"
	  		EXIT WHILE
	  		
	  	ON ACTION "actHello"	
				CALL fgl_winmessage("actHello","Hello World","info")
	
	  	ON ACTION "actHello2"	
				CALL fgl_winmessage("actHello2","Hello World 2","info")
				
			COMMAND KEY (F6)			  		
				CALL fgl_winmessage("Key F6","Key F6","info")	
			COMMAND KEY (F7)			  		
				CALL fgl_winmessage("Key F7","Key F7","info")						
			ON ACTION "ERROR"
				ERROR "This is a 4GL-ERROR message"
			ON ACTION "MESSAGE"
				ERROR "This is a 4GL-MESSAGE message"	
	  END MENU
	
		CALL set_line_options()
		CLOSE WINDOW 	w_per

	END WHILE

END MAIN
		
		
##################################################################################
# FUNCTION init_rec_data()
#
#
##################################################################################	
FUNCTION init_rec_data()
	LET rec_data.f1 = "Hubert"
	LET rec_data.f2 = "12/12/2019"	
	LET rec_data.f3 = 1	
	LET rec_data.f4 = "Monday"	
	
	LET rec_data.f6 = "12/12/2019"	
	LET rec_data.f7 = 1		
	LET rec_data.f8 = "John"			
		
	LET rec_data.f9 = "Shopping Center"
	LET rec_data.f11 = "Marienplatz"
	LET rec_data.f13 = "80011 München"

	LET rec_data.f10 = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
	LET rec_data.f12 = "abcdefghijklmnopqrstuvwxyz"


		
	LET rec_data.f14 = "Tuesday"		
	LET rec_data.f16 = "12/12/2019"
	LET rec_data.f18 = "Mike"			

	LET rec_data.f17 = "Johnny Walker"
	LET rec_data.f19 = "Michael Jackson"
	LET rec_data.f21 = "Axel Rose"
	LET rec_data.f23 = "Supernova Plc" 

	LET rec_data.f22 = 2 
	
	LET rec_data.f24 = "Wednesday"
	LET rec_data.f25 = "Maria is walking down the street with her dog to test this long string"			
	LET rec_data.f26 = "And Maria is still walking down the street, just like she did yesterday with her dog but she also brought her cat, rabbit and bird along too test this long string."			
	LET rec_data.f26 =  rec_data.f26, " ", trim(rec_data.f26)  
	
	LET rec_data.f27 = 3 
	
	LET rec_data.radBut1 = 1

	LET rec_data.f28 = "Germany"
	LET rec_data.f28 = "United States of America"
	LET rec_data.f28 = "United Kingdom"
	LET rec_data.f28 = "France"
	 
	
	LET rec_data.amount1 = -123.11
	LET rec_data.amount2 = 92387983.22
	LET rec_data.amount3 = 9235.33
	LET rec_data.amount4 = -17231.33 
	LET rec_data.amount5 = -23901.33
	LET rec_data.amount6 = 15221.29
	LET rec_data.amount7 = 53291.20
	LET rec_data.am_sum	= rec_data.amount1 +rec_data.amount2 + rec_data.amount3 + rec_data.amount4 + rec_data.amount5 + rec_data.amount6 + rec_data.amount7   
	
			
END FUNCTION

		
##################################################################################
# FUNCTION display_at()
#
#
##################################################################################	
FUNCTION display_at()
	DEFINE x,y SMALLINT

	CALL display_frame()
END FUNCTION

		
##################################################################################
# FUNCTION display_frame()
#
#
##################################################################################	
FUNCTION display_frame()
	DEFINE i SMALLINT
	DEFINE c CHAR, ch CHAR(2)
	#DEFINE formHeight SMALLINT
	dEFINE msgStr STRING
	DEFINE l_form_line SMALLINT 

	
	IF md_form_line  = 0 THEN
		LET l_form_line = 3
	ELSE
		LET l_form_line = md_form_line
	ENd IF

	
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




FUNCTION set_line_options()

{
Reserved Lines
On the 4GL screen, certain lines are reserved for output from specific 4GL
statements or from other sources. By default, these reserved lines appear in the
following positions on the 4GL screen:
- Menu line. Line 1 displays the menu title and options list from
MENU.
- Prompt line. Line 1 also displays text specified by the PROMPT
statement.
- Menu Help line. Line 2 displays text describing MENU options. You
cannot reposition this line independently of the Menu line.
- Message line. Line 2 also displays text from the MESSAGE statement.
You can reposition this line with the OPTIONS statement.
- Form line. Line 3 begins a form display when DISPLAY FORM
executes.
- Comment line. The next-to-last line of the 4GL screen (or the last line
in a 4GL window) displays COMMENTS attribute messages.
- Error line. The last line of the 4GL screen displays output from the
ERROR statement.

	DEFINE md_form_line SMALLINT# Default = 3
	DEFINE md_menu_line SMALLINT #Default = 1 NOTE: MENU HELP LINE is the next line and can not be set/changed
	DEFINE md_prompt_line SMALLINT #Default = 1
	DEFINE md_message_line SMALLINT #Default = 2
	DEFINE md_comment_line SMALLINT #The next-to-last line of the 4GL screen (or the last line in a 4GL window) displays COMMENTS attribute messages.
	DEFINE md_error_line SMALLINT #The last line of the 4GL SCREEN
	DEFINE md_prompt_line SMALLINT #
	DEFINE md_win_l SMALLINT
	DEFINE md_win_c SMALLINT

}
	
	IF md_form_line <> 0 THEN  #Default = 3
		OPTIONS FORM LINE md_form_line 
	END IF

	IF md_menu_line <> 0 THEN  #Default = 1
		OPTIONS MENU LINE md_menu_line
	END IF

	IF md_prompt_line <> 0 THEN  #Default = 1
		OPTIONS PROMPT LINE md_prompt_line
	END IF
	
	IF md_message_line <> 0 THEN  #Default = 2
		OPTIONS MESSAGE LINE md_message_line
	END IF

	IF md_comment_line <> 0 THEN  #LAST in SCREEN and LAST-1 in normal window
		OPTIONS COMMENT LINE md_comment_line
	END IF	

	IF md_error_line <> 0 THEN  --LAST LINE in SCREEN
		OPTIONS ERROR LINE md_error_line
	END IF
	

	
END FUNCTION


FUNCTION display_win_attributes()
	DEFINE msgStr STRING
	DEFINE l_lastLine SMALLINT
	DEFINE l_commentline SMALLINT

	DISPLAY md_form_height TO form_height	 
	DISPLAY md_dialog_window TO dialog_window
	DISPLAY md_win_l TO win_l
	DISPLAY md_win_c TO win_c
	
	LET l_lastLine = 	md_form_height + md_form_line
	
	IF md_form_line  = 0 THEN
		DISPLAY "Default=3" TO form_line
	ELSE
		DISPLAY md_form_line TO form_line
	ENd IF
	
	IF md_menu_line  = 0 THEN
		DISPLAY "Default=1" TO menu_line
	ELSE
		DISPLAY md_menu_line TO menu_line
	END IF
	
	IF md_prompt_line  = 0 THEN
		DISPLAY "Default=1" TO prompt_line
	ELSE
		DISPLAY md_prompt_line TO prompt_line
	END IF

	IF md_message_line  = 0 THEN
		DISPLAY "Default=2" TO message_line
	ELSE
		DISPLAY md_message_line TO message_line
	END IF

	IF md_comment_line  = 0 THEN
		LET l_commentline = md_form_height - 1
		LET msgStr = "Def-Last-1=", trim(l_commentline); #trim(md_form_height-1)
		DISPLAY msgStr TO comment_line
	ELSE
		DISPLAY md_comment_line TO comment_line
	END IF

	IF md_error_line  = 0 THEN
		LET msgStr = "Def-Last=", trim(l_lastLine)
		DISPLAY msgStr TO error_line
	ELSE
		DISPLAY md_error_line TO error_line
	END IF

END FUNCTION

FUNCTION input_option_line()
	DEFINE l_dialog_window BOOLEAN
	DEFINE l_form_line SMALLINT# Default = 3
	DEFINE l_menu_line SMALLINT #Default = 1 NOTE: MENU HELP LINE is the next line and can not be set/changed
	DEFINE l_prompt_line SMALLINT #Default = 1
	DEFINE l_message_line SMALLINT #Default = 2
	DEFINE l_comment_line SMALLINT #The next-to-last line of the 4GL screen (or the last line in a 4GL window) displays COMMENTS attribute messages.
	DEFINE l_error_line SMALLINT #The last line of the 4GL SCREEN
	DEFINE l_win_l SMALLINT
	DEFINE l_win_c SMALLINT
	DEFINE ret BOOLEAN
	
		LET	l_dialog_window = md_dialog_window
		LET l_form_line = md_form_line
		LET l_menu_line = md_menu_line
		LET l_prompt_line = md_prompt_line
		LET l_message_line = md_message_line
		LET l_comment_line = md_comment_line
		LET l_error_line = md_error_line
		LET l_win_l = md_win_l
		LET l_win_c = md_win_c	
	
	OPEN WINDOW wLine AT 1,1 WITH FORM "form/leg_line_input" ATTRIBUTE(BORDER)
	
	INPUT
		l_dialog_window,
		l_form_line,
		l_menu_line,
		l_prompt_line,
		l_message_line,
		l_comment_line,
		l_error_line,
		l_win_l,
		l_win_c
		WITHOUT DEFAULTS
	FROM
		dialog_window,
		form_line,
		menu_line,
		prompt_line,
		message_line,
		comment_line,
		error_line,
		win_l,
		win_c
	

	CLOSE WINDOW wLine

	IF NOT int_flag THEN	
		LET	md_dialog_window = l_dialog_window
		LET md_form_line = l_form_line
		LET md_menu_line = l_menu_line
		LET md_prompt_line = l_prompt_line
		LET md_message_line = l_message_line
		LET md_comment_line = l_comment_line
		LET md_error_line = l_error_line
		LET md_win_l = l_win_l
		LET md_win_c = l_win_c
		LET ret = TRUE
	ELSE
		LET int_flag = FALSE
		LET ret = FALSE
	END IF
			
	RETURN ret
END FUNCTION