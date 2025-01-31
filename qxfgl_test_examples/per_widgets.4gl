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
		f22 SMALLINT,
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
		radBut1 SMALLINT
	END RECORD


##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE c CHAR
	
	CALL ui_init()
	DEFER INTERRUPT

  OPTIONS 
    FORM LINE 1,
    ACCEPT KEY RETURN,
    PROMPT LINE FIRST,
    MESSAGE LINE FIRST,
    COMMENT LINE FIRST

  CALL init_rec_data()

	OPEN WINDOW w_per WITH FORM "per/per_widgets"
	CALL ui.Interface.setText("PER Widgets")
		
  MENU "per menu"

		COMMAND "DISPLAY"
			DISPLAY BY NAME rec_data.*
			DISPLAY "www.querix.com" TO f_brows
  	COMMAND "INPUT"
			INPUT BY NAME rec_data.* 
				WITHOUT DEFAULTS HELP 100
				BEFORE INPUT
					DISPLAY "www.querix.com" TO f_brows
		  	ON ACTION "actHello"	
					CALL fgl_winmessage("actHello","Hello World","info")
		  	#ON ACTION "actGoodBye"	
				#	CALL fgl_winmessage("actGoodBye","Good Bye World","info")
		  	ON ACTION "actHello2"	
					CALL fgl_winmessage("actHello2","Hello World 2","info")
		  	#ON ACTION "actGoodBye2"	
				#	CALL fgl_winmessage("actGoodBye2","Good Bye World 2","info")	
				ON KEY (F6)			  		
					CALL fgl_winmessage("Key F6","Key F6","info")	
				ON KEY (F7)			  		
					CALL fgl_winmessage("Key F7","Key F7","info")						
			END INPUT

		COMMAND "DISPLAY AT"
			CALL display_at()

		COMMAND "CLEAR FORM"
			CLEAR FORM	

		COMMAND "Widget Specific"
			CALL widgetsMenu()
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
  		EXIT MENU
  		
  	ON ACTION "actHello"	
			CALL fgl_winmessage("actHello","Hello World","info")

  	ON ACTION "actHello2"	
			CALL fgl_winmessage("actHello2","Hello World 2","info")
			
		COMMAND KEY (F6)			  		
			CALL fgl_winmessage("Key F6","Key F6","info")	
		COMMAND KEY (F7)			  		
			CALL fgl_winmessage("Key F7","Key F7","info")						

  END MENU

END MAIN
##################################################################################
# END MAIN
#
#
##################################################################################	
		
		
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
		
		
	LET rec_data.f14 = "Tuesday"		
	LET rec_data.f16 = "12/12/2019"
	LET rec_data.f18 = "Mike"			

	LET rec_data.f21 = 1 
	LET rec_data.f22 = 2 
	
	LET rec_data.f24 = "Wednesday"
	LET rec_data.f25 = "Maria"			
	
	LET rec_data.f27 = 3 
	
	LET rec_data.radBut1 = 1

			
END FUNCTION
##################################################################################
# END FUNCTION init_rec_data()
##################################################################################	

		
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
# END FUNCTION display_at()
##################################################################################	

		
##################################################################################
# FUNCTION display_frame()
#
#
##################################################################################	
FUNCTION display_frame()
	DEFINE i SMALLINT
	DEFINE c CHAR, ch CHAR(2)
	DEFINE formHeight SMALLINT
	LET formHeight = 34

	FOR i = 1 TO 80
		LET ch = i USING "##"
		LET c = ch[2]	
		DISPLAY c AT 1,i  ATTRIBUTE(RED)
		DISPLAY c AT formHeight,i ATTRIBUTE(RED)
	END FOR
	
	FOR i = 1 TO formHeight
		LET ch = i USING "##"
		LET c = ch[2]		
		DISPLAY c AT i,1 ATTRIBUTE(RED)
		DISPLAY c AT i,81 ATTRIBUTE(RED)
	END FOR
	
	FOR i = 5 TO 13
		LET ch = i USING "##"
		LET c = ch[2]		
		DISPLAY c AT i,41 ATTRIBUTE(RED)
		DISPLAY c AT i,51 ATTRIBUTE(RED)	
	END FOR	

END FUNCTION
##################################################################################
# END FUNCTION display_frame()
##################################################################################