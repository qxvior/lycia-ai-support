# Module Scope Variables
DEFINE rec_data 
	RECORD
		f1,f2,f3,f4,f5,f6,f7,f8,f9 VARCHAR(60),
		f11,f12,f13,f14,f15,f16,f17,f18,f19 VARCHAR(60),
		f21,f22,f23,f24,f25,f26,f27,f28,f29 VARCHAR(60),
		f101,f102,f103,f104,f105,f106,f107,f108,f109 VARCHAR(60),
		rb_options SMALLINT
	END RECORD

##################################################################################
# MAIN
#
#
##################################################################################
MAIN
	define msg STRING
	
	CALL ui_init()

	OPTIONS FIELD ORDER CONSTRAINED
	OPTIONS INPUT WRAP		
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	DEFER INTERRUPT
	
	CALL init_data()
	LET rec_data.rb_options = 0

	OPEN WINDOW mywin WITH FORM "form/wig_textField_vdom_properties" 
	
	MENU
		ON ACTION "DISPLAY"
			DISPLAY BY NAME rec_data.*
			DISPLAY "rb_options=", rec_data.rb_options
			
	  ON ACTION "EDIT"
	  	WHILE TRUE
				INPUT BY NAME rec_data.* WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
					ON CHANGE rb_options
						IF rec_data.rb_options = 0 THEN
							OPTIONS FIELD ORDER CONSTRAINED
							MESSAGE "OPTIONS FIELD ORDER CONSTRAINED"
						ELSE
							OPTIONS FIELD ORDER UNCONSTRAINED
							MESSAGE "OPTIONS FIELD ORDER UNCONSTRAINED"
						END IF	  	
						EXIT INPUT
					ON ACTION "CANCEL"
						EXIT WHILE
	 			END INPUT
	 		END WHILE 	

		ON ACTION "CLEAR FORM"
			CLEAR FORM
	 		
	  ON ACTION "Swap Values"
	 		LET rec_data.f9 = rec_data.f8
	 		LET rec_data.f8 = rec_data.f7
	 		LET rec_data.f7 = rec_data.f6
	 		LET rec_data.f6 = rec_data.f5
	 		LET rec_data.f5 = rec_data.f4
	 		LET rec_data.f4 = rec_data.f3
	 		LET rec_data.f3 = rec_data.f2
	 		LET rec_data.f2 = rec_data.f1

	   	CASE rec_data.f1
	  		WHEN "01 - 0111-2222-3333-4444 - 01"
	  			LET rec_data.f1= "02 - 0211-2222-3333-4444 - 02"	
	  			MESSAGE ""  			
	  		WHEN "02 - 0211-2222-3333-4444 - 02"
	  			LET rec_data.f1= "03 - 0311-2222-3333-4444 - 03"   
	  			MESSAGE ""    					
	  		WHEN "03 - 0311-2222-3333-4444 - 03"
	  			LET rec_data.f1= "04 - 0411-2222-3333-4444 - 04"  
	  			MESSAGE ""    					
	  		WHEN "04 - 0411-2222-3333-4444 - 04"
	  			LET rec_data.f1= "05 - 0511-2222-3333-4444 - 05"
	  			MESSAGE ""    			
	  		WHEN "05 - 0511-2222-3333-4444 - 05"
	  			LET rec_data.f1= "01 - 0111-2222-3333-4444 - 01"			
	  			MESSAGE ""    			
	  		OTHERWISE
	  			MESSAGE "Custom f1 value!"
	  			LET rec_data.f1= "01 - 0111-2222-3333-4444 - 01"
	  	END CASE
		
	    DISPLAY BY NAME rec_data.*
    
#	  ON ACTION "VarValue"
#	  	LET msg = "The value of f1 =",trim(f1)
#	  	CALL fgl_winmessage("value of f1",msg,"info")
	  	
    ON ACTION "HELP"
    	CALL onlineHelp("TextField",NULL)		
	    	    	
    ON ACTION "CANCEL"
    	EXIT MENU
    
	END MENU

END MAIN

FUNCTION init_data()
	LET rec_data.f1  = "01 - 0111-2222-3333-4444 - 01"
	LET rec_data.f2  = "02 - 0211-2222-3333-4444 - 02"
	LET rec_data.f3  = "03 - 0311-2222-3333-4444 - 03"
	LET rec_data.f4  = "04 - 0411-2222-3333-4444 - 04"
	LET rec_data.f5  = "05 - 0511-2222-3333-4444 - 05"
	LET rec_data.f6  = "06 - 0611-2222-3333-4444 - 06"
	LET rec_data.f7  = "07 - 0711-2222-3333-4444 - 07"
	LET rec_data.f8  = "08 - 0811-2222-3333-4444 - 08"
	LET rec_data.f9  = "09 - 0911-2222-3333-4444 - 09"

	LET rec_data.f11 = "11 - 1111-2222-3333-4444 - 11"
	LET rec_data.f12 = "12 - 1211-2222-3333-4444 - 12"
	LET rec_data.f13 = "13 - 1311-2222-3333-4444 - 13"
	LET rec_data.f14 = "14 - 1411-2222-3333-4444 - 14"
	LET rec_data.f15 = "15 - 1511-2222-3333-4444 - 15"
	LET rec_data.f16 = "16 - 1611-2222-3333-4444 - 16"
	LET rec_data.f17 = "17 - 1711-2222-3333-4444 - 17"
	LET rec_data.f18 = "18 - 1811-2222-3333-4444 - 18"
	LET rec_data.f19 = "19 - 1911-2222-3333-4444 - 19"

	LET rec_data.f21 = "21 - 1111-2222-3333-4444 - 21"
	LET rec_data.f22 = "22 - 1211-2222-3333-4444 - 22"
	LET rec_data.f23 = "23 - 1311-2222-3333-4444 - 23"
	LET rec_data.f24 = "24 - 1411-2222-3333-4444 - 24"
	LET rec_data.f25 = "25 - 1511-2222-3333-4444 - 25"
	LET rec_data.f26 = "26 - 1611-2222-3333-4444 - 26"
	LET rec_data.f27 = "27 - 1711-2222-3333-4444 - 27"
	LET rec_data.f28 = "28 - 1811-2222-3333-4444 - 28"
	LET rec_data.f29 = "29 - 1911-2222-3333-4444 - 29"
		
	LET rec_data.f101  = "101 - 0111-2222-3333-4444 - 101"
	LET rec_data.f102  = "102 - 0211-2222-3333-4444 - 102"
	LET rec_data.f103  = "103 - 0311-2222-3333-4444 - 103"
	LET rec_data.f104  = "104 - 0411-2222-3333-4444 - 104"
	LET rec_data.f105  = "105 - 0511-2222-3333-4444 - 105"
	LET rec_data.f106  = "106 - 0611-2222-3333-4444 - 106"
	LET rec_data.f107  = "107 - 0711-2222-3333-4444 - 107"
	LET rec_data.f108  = "108 - 0811-2222-3333-4444 - 108"
	LET rec_data.f109  = "109 - 0911-2222-3333-4444 - 109"
		
		
END FUNCTION