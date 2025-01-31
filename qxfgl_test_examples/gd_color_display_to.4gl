#########################################################################################################
# DISPLAY TO and AT Attributes Demo
#
# Color Demo - Menu Item 2
#
# Modification History:
# 29.11.06 HH - V3 - Extracted from gd_color.4gl
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

DEFINE
	colClassicArr ARRAY [10,4,10] OF STRING, #!Color codes array
	colGridArr ARRAY [10,4,10] OF STRING,    #!Color codes array
	colName DYNAMIC ARRAY OF STRING,         #!Color name variable
	attribName DYNAMIC ARRAY OF STRING       #!Attribute names array
	
#! Set color array	
FUNCTION InitColorNames()
	LET colName[1] = "BLACK"
	LET colName[2] = "WHITE"
	LET colName[3] = "BLUE"
	LET colName[4] = "CYAN"
	LET colName[5] = "RED"
	LET colName[6] = "MAGENTA"
	LET colName[7] = "GREEN"
	LET colName[8] = "YELLOW"
	LET colName[9] = "RESERVE"
		
END FUNCTION	
#! Set attributes name array
FUNCTION initAttribNames()
	LET attribName[1] = ""
	LET attribName[2] = "R"	
	LET attribName[3] = "D"	
	LET attribName[4] = "B"
END FUNCTION

############################################################
#! FUNCTION col_array_string_init() - prepares the dummy text which is displayed to the fields
############################################################
FUNCTION col_array_string_init(col)
  DEFINE col char(15), i SMALLINT

  FOR i = 1 TO 5
    LET col_arr[i] = col CLIPPED, "-", trim(i)
  END FOR
  CALL set_count(5)

END FUNCTION	


FUNCTION initColorStringArray()
	DEFINE c,a,r INT

	FOR c = 1 TO 9
		FOR a = 1 TO 4
			FOR r = 1 TO 5
				LET colClassicArr[c,a,r] = colName[c] CLIPPED, "-", attribName[a] CLIPPED, "-", r USING "<"
				LET colGridArr[c,a,r] = colName[c] CLIPPED, "-", attribName[a] CLIPPED, "-", r USING "<"				
				
			END FOR
		END FOR
		#CALL col_array_string_init(col)
	
	END FOR 

END FUNCTION
	
############################################################
# FUNCTION color_display_at_demo()
#! Function doesn't use
############################################################
FUNCTION color_display_to_attrib()
	#DEFINE formFile STRING
	DEFINE colWin WINDOW
	
	
	#LET formFile = get_form_path("gd_f_color_display_to")
	CALL colWin.openWithForm("w_color_display_to",get_form_path("gd_f_color_display_to_2_2"),1,1,"","")
	CALL colWin.setImage("icon32/col_chart02.ico")
	CALL colWin.setText(get_str(830) || " - " || get_str(832))	
  #OPTIONS FORM LINE 1

	CALL InitColorNames()
	CALL initAttribNames()	
	CALL initColorStringArray()

  CALL init_color_fields()



	#OPEN WINDOW w_color_display_to AT 1,1 WITH FORM "form/
 # CALL fgl_window_open("w_color_display_at",1,1,24,80,0)
  #CALL fgl_settitle(get_str(830) || " - " || get_str(832))

	CALL dialogDisplay()
  #CALL display_window_display_to_4gl_attrib()
  #CALL display_labels()
  #CALL display_col_text_to_4gl_attrib()

  #CALL user_control_color_display_to_4gl_attrib()

  CALL colWin.close()

  #OPTIONS FORM LINE 3

END FUNCTION


############################################################
# FUNCTION display_window_display_to_4gl_attrib()
#! Function doesn't use
############################################################
FUNCTION display_window_display_to_4gl_attrib()

  #CALL fgl_form_open("f_color_display_to_4gl_attrib",get_form_path("gd_f_color_display_to"))
  #CALL fgl_form_display("f_color_display_to_4gl_attrib")

  DISPLAY "!" TO fb_accept
  DISPLAY "!" TO fb_exit

END FUNCTION


{
############################################################
# FUNCTION display_labels()
############################################################
FUNCTION display_labels()
  DEFINE col_01,col_02 SMALLINT
  LET col_01 = 28
  LET col_02 = 54

  #Black
  DISPLAY "Black"            AT 1 , 1 attribute(BLACK) 
  DISPLAY "Black Reverse"    AT 3 , 1 attribute(BLACK,REVERSE) 
  DISPLAY "Black Dim"        AT 5 , 1 attribute(BLACK,DIM) 
  DISPLAY "Black Blink"      AT 7 , 1 attribute(BLACK,BLINK) 

  #WHITE
  DISPLAY "White"            AT 9 , 1 attribute(WHITE) 
  DISPLAY "White Reverse"    AT 11, 1 attribute(WHITE,REVERSE) 
  DISPLAY "White Dim"        AT 13, 1 attribute(WHITE,DIM) 
  DISPLAY "White Blink"      AT 15, 1 attribute(WHITE,BLINK) 


  #Blue
  DISPLAY "Blue"             AT 17, 1 attribute(BLUE) 
  DISPLAY "Blue Reverse"     AT 19, 1 attribute(BLUE,REVERSE) 
  DISPLAY "Blue Dim"         AT 21, 1 attribute(BLUE,DIM) 
  DISPLAY "Blue Blink"       AT 23, 1 attribute(BLUE,BLINK) 


  #CYAN
  DISPLAY "Cyan"             AT 1, col_01 attribute(CYAN) 
  DISPLAY "Cyan Reverse"     AT 3, col_01 attribute(CYAN,REVERSE) 
  DISPLAY "Cyan Dim"         AT 5, col_01 attribute(CYAN,DIM) 
  DISPLAY "Cyan Blink"       AT 7, col_01 attribute(CYAN,BLINK) 


  #Red
  DISPLAY "Red"              AT 9 , col_01 attribute(RED) 
  DISPLAY "Red Reverse"      AT 11 , col_01 attribute(RED,REVERSE) 
  DISPLAY "Red Dim"          AT 13 , col_01 attribute(RED,DIM) 
  DISPLAY "Red Blink"        AT 15 , col_01 attribute(RED,BLINK) 

  #MAGENTA
  DISPLAY "Magenta"           AT 17, col_01 attribute(MAGENTA) 
  DISPLAY "Magenta Reverse"   AT 19, col_01 attribute(MAGENTA,REVERSE) 
  DISPLAY "Magenta Dim"       AT 21, col_01 attribute(MAGENTA,DIM) 
  DISPLAY "Magenta Blink"     AT 23, col_01 attribute(MAGENTA,BLINK) 


  #GREEN
  DISPLAY "Green"             AT 1, col_02 attribute(GREEN) 
  DISPLAY "Green Reverse"     AT 3, col_02 attribute(GREEN,REVERSE) 
  DISPLAY "Green Dim"         AT 5, col_02 attribute(GREEN,DIM) 
  DISPLAY "Green Blink"       AT 7, col_02 attribute(GREEN,BLINK) 


  #YELLOW
  DISPLAY "Yellow"            AT 9, col_02 attribute(YELLOW) 
  DISPLAY "Yellow Reverse"    AT 11, col_02 attribute(YELLOW,REVERSE) 
  DISPLAY "Yellow Dim"        AT 13, col_02 attribute(YELLOW,DIM) 
  DISPLAY "Yellow Blink"      AT 15, col_02 attribute(YELLOW,BLINK) 



END FUNCTION
}
##########################################################################
# FUNCTION dialogDisplay() 
#! Function doesn't use
########################################################################## 
FUNCTION dialogDisplay()
  #Black
	DISPLAY  "Black" 					TO lb11       ATTRIBUTE(BLACK)
	DISPLAY  "Black-Reverse"	TO lb12       ATTRIBUTE(BLACK, REVERSE)	
	DISPLAY  "Black-Dim"			TO lb13       ATTRIBUTE(BLACK, DIM)	
	DISPLAY  "Black-Blink"		TO lb14       ATTRIBUTE(BLACK, BLINK)
	
			
  DISPLAY  fc11    TO fc11       ATTRIBUTE(BLACK)
  DISPLAY  fc12    TO fc12       ATTRIBUTE(BLACK, REVERSE)  
  DISPLAY  fc13    TO fc13       ATTRIBUTE(BLACK, DIM)
  DISPLAY  fc14    TO fc14       ATTRIBUTE(BLACK, BLINK)

  #White
	DISPLAY  "White" 					TO lb21       ATTRIBUTE(WHITE)
	DISPLAY  "White-Reverse"	TO lb22       ATTRIBUTE(WHITE, REVERSE)	
	DISPLAY  "White-Dim"			TO lb23       ATTRIBUTE(WHITE, DIM)	
	DISPLAY  "White-Blink"		TO lb24       ATTRIBUTE(WHITE, BLINK)
	

  DISPLAY  fc21    TO fc21       ATTRIBUTE(WHITE)  
  DISPLAY  fc22    TO fc22       ATTRIBUTE(WHITE, REVERSE)
  DISPLAY  fc23    TO fc23       ATTRIBUTE(WHITE, DIM)
  DISPLAY  fc24    TO fc24       ATTRIBUTE(WHITE, BLINK)

  #BLUE
	DISPLAY  "Blue" 					TO lb31       ATTRIBUTE(BLUE)
	DISPLAY  "Blue-Reverse"		TO lb32       ATTRIBUTE(BLUE, REVERSE)	
	DISPLAY  "Blue-Dim"				TO lb33       ATTRIBUTE(BLUE, DIM)	
	DISPLAY  "Blue-Blink"			TO lb34       ATTRIBUTE(BLUE, BLINK)
	

  DISPLAY  fc31    TO fc31       ATTRIBUTE(BLUE)  
  DISPLAY  fc32    TO fc32       ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fc33    TO fc33       ATTRIBUTE(BLUE, DIM)
  DISPLAY  fc34    TO fc34       ATTRIBUTE(BLUE, BLINK)

  #CYAN
	DISPLAY  "Cyan" 					TO lb41       ATTRIBUTE(CYAN)
	DISPLAY  "Cyan-Reverse"		TO lb42       ATTRIBUTE(CYAN, REVERSE)	
	DISPLAY  "Cyan-Dim"				TO lb43       ATTRIBUTE(CYAN, DIM)	
	DISPLAY  "Cyan-Blink"			TO lb44       ATTRIBUTE(CYAN, BLINK)

  DISPLAY  fc41    TO fc41       ATTRIBUTE(CYAN)
  DISPLAY  fc42    TO fc42       ATTRIBUTE(CYAN, REVERSE)
  DISPLAY  fc43    TO fc43       ATTRIBUTE(CYAN, DIM)
  DISPLAY  fc44    TO fc44       ATTRIBUTE(CYAN, BLINK)

  #RED
	DISPLAY  "Red" 						TO lb51       ATTRIBUTE(RED)
	DISPLAY  "Red-Reverse"		TO lb52       ATTRIBUTE(RED, REVERSE)	
	DISPLAY  "Red-Dim"				TO lb53       ATTRIBUTE(RED, DIM)	
	DISPLAY  "Red-Blink"			TO lb54       ATTRIBUTE(RED, BLINK)


  DISPLAY  fc51    TO fc51       ATTRIBUTE(RED)
  DISPLAY  fc52    TO fc52       ATTRIBUTE(RED, REVERSE)
  DISPLAY  fc53    TO fc53       ATTRIBUTE(RED, DIM)
  DISPLAY  fc54    TO fc54       ATTRIBUTE(RED, BLINK)
  
  #MAGENTA
	DISPLAY  "Magenta" 						TO lb61       ATTRIBUTE(MAGENTA)
	DISPLAY  "Magenta-Reverse"		TO lb62       ATTRIBUTE(MAGENTA, REVERSE)	
	DISPLAY  "Magenta-Dim"				TO lb63       ATTRIBUTE(MAGENTA, DIM)	
	DISPLAY  "Magenta-Blink"			TO lb64       ATTRIBUTE(MAGENTA, BLINK)


  DISPLAY  fc61    TO fc61       ATTRIBUTE(MAGENTA)
  DISPLAY  fc62    TO fc62       ATTRIBUTE(MAGENTA, REVERSE)
  DISPLAY  fc63    TO fc63       ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fc64    TO fc64       ATTRIBUTE(MAGENTA, BLINK)

  #GREEN
	DISPLAY  "Green" 							TO lb71       ATTRIBUTE(GREEN)
	DISPLAY  "Green-Reverse"			TO lb72       ATTRIBUTE(GREEN, REVERSE)	
	DISPLAY  "Green-Dim"					TO lb73       ATTRIBUTE(GREEN, DIM)	
	DISPLAY  "Green-Blink"				TO lb74       ATTRIBUTE(GREEN, BLINK)



  DISPLAY  fc71    TO fc71       ATTRIBUTE(GREEN)
  DISPLAY  fc72    TO fc72       ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fc73    TO fc73       ATTRIBUTE(GREEN, DIM)
  DISPLAY  fc74    TO fc74       ATTRIBUTE(GREEN, BLINK)
         
  #YELLOW
	DISPLAY  "Yellow" 						TO lb81       ATTRIBUTE(YELLOW)
	DISPLAY  "Yellow-Reverse"			TO lb82       ATTRIBUTE(YELLOW, REVERSE)	
	DISPLAY  "Yellow-Dim"					TO lb83       ATTRIBUTE(YELLOW, DIM)	
	DISPLAY  "Yellow-Blink"				TO lb84       ATTRIBUTE(YELLOW, BLINK)


  DISPLAY  fc81    TO fc81       ATTRIBUTE(YELLOW)
  DISPLAY  fc82    TO fc82       ATTRIBUTE(YELLOW, REVERSE)
  DISPLAY  fc83    TO fc83       ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fc84    TO fc84       ATTRIBUTE(YELLOW, BLINK)
  

  #Reserve
	DISPLAY  "Reserve" 							TO lb91       ATTRIBUTE(BLACK)
	DISPLAY  "Reserve-Reverse"			TO lb92       ATTRIBUTE(BLACK, REVERSE)	
	DISPLAY  "Reserve-Dim"					TO lb93       ATTRIBUTE(BLACK, DIM)	
	DISPLAY  "Reserve-Blink"				TO lb94       ATTRIBUTE(BLACK, BLINK)


  DISPLAY  fc91    TO fc91       ATTRIBUTE(BLACK)
  DISPLAY  fc92    TO fc92       ATTRIBUTE(BLACK, REVERSE)
  DISPLAY  fc93    TO fc93       ATTRIBUTE(BLACK, DIM)
  DISPLAY  fc94    TO fc94       ATTRIBUTE(BLACK, BLINK)
        
CALL col_array_init("Black")  #why do I need this - if I remove it, my table-grids are empty
	DIALOG
		#BLACK
		
			
		DISPLAY ARRAY colClassicArr[1,1] TO sc11.* ATTRIBUTE(BLACK)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[1,2] TO sc12.* ATTRIBUTE(BLACK, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[1,3] TO sc13.* ATTRIBUTE(BLACK, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[1,4] TO sc14.* ATTRIBUTE(BLACK, BLINK)
		END DISPLAY 


		DISPLAY ARRAY colGridArr[1,1] TO sg11.* ATTRIBUTE(BLACK)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[1,2] TO sg12.* ATTRIBUTE(BLACK, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[1,3] TO sg13.* ATTRIBUTE(BLACK, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[1,4] TO sg14.* ATTRIBUTE(BLACK, BLINK)
		END DISPLAY 
		
		#WHITE

		DISPLAY ARRAY colClassicArr[2,1] TO sc21.* ATTRIBUTE(WHITE)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[2,2] TO sc22.* ATTRIBUTE(WHITE, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[2,3] TO sc23.* ATTRIBUTE(WHITE, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[2,4] TO sc24.* ATTRIBUTE(WHITE, BLINK)
		END DISPLAY 
				
	

		DISPLAY ARRAY colGridArr[2,1] TO sg21.* ATTRIBUTE(WHITE)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[2,2] TO sg22.* ATTRIBUTE(WHITE, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[2,3] TO sg23.* ATTRIBUTE(WHITE, DIM)

		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[2,4] TO sg24.* ATTRIBUTE(WHITE, BLINK)

		END DISPLAY 	

		#BLUE

		DISPLAY ARRAY colClassicArr[3,1] TO sc31.* ATTRIBUTE(BLUE)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[3,2] TO sc32.* ATTRIBUTE(BLUE, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[3,3] TO sc33.* ATTRIBUTE(BLUE, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[3,4] TO sc34.* ATTRIBUTE(BLUE, BLINK)
		END DISPLAY 
				
				

		DISPLAY ARRAY colGridArr[3,1] TO sg31.* ATTRIBUTE(BLUE)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[3,2] TO sg32.* ATTRIBUTE(BLUE, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[3,3] TO sg33.* ATTRIBUTE(BLUE, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[3,4] TO sg34.* ATTRIBUTE(BLUE, BLINK)
		END DISPLAY 
				
					

		#CYAN

		DISPLAY ARRAY colClassicArr[4,1] TO sc41.* ATTRIBUTE(CYAN)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[4,2] TO sc42.* ATTRIBUTE(CYAN, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[4,3] TO sc43.* ATTRIBUTE(CYAN, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[4,4] TO sc44.* ATTRIBUTE(CYAN, BLINK)
		END DISPLAY 
	

		DISPLAY ARRAY colGridArr[4,1] TO sg41.* ATTRIBUTE(CYAN)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[4,2] TO sg42.* ATTRIBUTE(CYAN, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[4,3] TO sg43.* ATTRIBUTE(CYAN, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[4,4] TO sg44.* ATTRIBUTE(CYAN, BLINK)
		END DISPLAY 
	

		#RED

		DISPLAY ARRAY colClassicArr[5,1] TO sc51.* ATTRIBUTE(RED)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[5,2] TO sc52.* ATTRIBUTE(RED, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[5,3] TO sc53.* ATTRIBUTE(RED, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[5,4] TO sc54.* ATTRIBUTE(RED, BLINK)
		END DISPLAY 
		

		DISPLAY ARRAY colGridArr[5,1] TO sg51.* ATTRIBUTE(RED)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[5,2] TO sg52.* ATTRIBUTE(RED, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[5,3] TO sg53.* ATTRIBUTE(RED, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[5,4] TO sg54.* ATTRIBUTE(RED, BLINK)
		END DISPLAY 
		

		#MAGENTA

		DISPLAY ARRAY colClassicArr[6,1] TO sc61.* ATTRIBUTE(MAGENTA)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[6,2] TO sc62.* ATTRIBUTE(MAGENTA, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[6,3] TO sc63.* ATTRIBUTE(MAGENTA, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[6,4] TO sc64.* ATTRIBUTE(MAGENTA, BLINK)

		END DISPLAY 
		

		DISPLAY ARRAY colGridArr[6,1] TO sg61.* ATTRIBUTE(MAGENTA)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[6,2] TO sg62.* ATTRIBUTE(MAGENTA, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[6,3] TO sg63.* ATTRIBUTE(MAGENTA, DIM)

		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[6,4] TO sg64.* ATTRIBUTE(MAGENTA, BLINK)
		END DISPLAY 
		
		#GREEN

		DISPLAY ARRAY colClassicArr[7,1] TO sc71.* ATTRIBUTE(GREEN)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[7,2] TO sc72.* ATTRIBUTE(GREEN, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[7,3] TO sc73.* ATTRIBUTE(GREEN, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[7,4] TO sc74.* ATTRIBUTE(GREEN, BLINK)
		END DISPLAY 
		

		DISPLAY ARRAY colGridArr[7,1] TO sg71.* ATTRIBUTE(GREEN)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[7,2] TO sg72.* ATTRIBUTE(GREEN, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[7,3] TO sg73.* ATTRIBUTE(GREEN, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[7,4] TO sg74.* ATTRIBUTE(GREEN, BLINK)
		END DISPLAY 
		

		#YELLOW

		DISPLAY ARRAY colClassicArr[8,1] TO sc81.* ATTRIBUTE(YELLOW)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[8,2] TO sc82.* ATTRIBUTE(YELLOW, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[8,3] TO sc83.* ATTRIBUTE(YELLOW, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[8,4] TO sc84.* ATTRIBUTE(YELLOW, BLINK)
		END DISPLAY 
		


		DISPLAY ARRAY colGridArr[8,1] TO sg81.* ATTRIBUTE(YELLOW)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[8,2] TO sg82.* ATTRIBUTE(YELLOW, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[8,3] TO sg83.* ATTRIBUTE(YELLOW, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[8,4] TO sg84.* ATTRIBUTE(YELLOW, BLINK)
		END DISPLAY 								

			
		#RESERVE

		DISPLAY ARRAY colClassicArr[9,1] TO sc91.* ATTRIBUTE(BLACK)
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[9,2] TO sc92.* ATTRIBUTE(BLACK, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[9,3] TO sc93.* ATTRIBUTE(BLACK, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[9,4] TO sc94.* ATTRIBUTE(BLACK, BLINK)
		END DISPLAY 
		


		DISPLAY ARRAY colGridArr[9,1] TO sg91.* ATTRIBUTE(BLACK)
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[9,2] TO sg92.* ATTRIBUTE(BLACK, REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[9,3] TO sg93.* ATTRIBUTE(BLACK, DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[9,4] TO sg94.* ATTRIBUTE(BLACK, BLINK)
		END DISPLAY 								
						
		ON ACTION ("actExitModule")
			EXIT DIALOG		
						
		ON ACTION ("actInput")
			CALL dialogInputDisplayTo()				
													
	END DIALOG	

END FUNCTION


##########################################################################
# FUNCTION dialogInputDisplayTo()
#! Function doesn't use
########################################################################## 
FUNCTION dialogInputDisplayTo()
  #Black

	DIALOG
			
  INPUT  fc11    WITHOUT DEFAULTS FROM fc11       ATTRIBUTE(BLACK)
  END INPUT
  INPUT  fc12    WITHOUT DEFAULTS FROM fc12       ATTRIBUTE(BLACK, REVERSE)  
  END INPUT
  INPUT  fc13    WITHOUT DEFAULTS FROM fc13       ATTRIBUTE(BLACK, DIM)
  END INPUT
  INPUT  fc14    WITHOUT DEFAULTS FROM fc14       ATTRIBUTE(BLACK, BLINK)
  END INPUT

  #White

  INPUT  fc21    WITHOUT DEFAULTS FROM fc21       ATTRIBUTE(WHITE)  
  END INPUT
  INPUT  fc22    WITHOUT DEFAULTS FROM fc22       ATTRIBUTE(WHITE, REVERSE)
  END INPUT
  INPUT  fc23    WITHOUT DEFAULTS FROM fc23       ATTRIBUTE(WHITE, DIM)
  END INPUT
  INPUT  fc24    WITHOUT DEFAULTS FROM fc24       ATTRIBUTE(WHITE, BLINK)
  END INPUT

  #BLUE

  INPUT  fc31    WITHOUT DEFAULTS FROM fc31       ATTRIBUTE(BLUE)  
  END INPUT
  INPUT  fc32    WITHOUT DEFAULTS FROM fc32       ATTRIBUTE(BLUE, REVERSE)
  END INPUT
  INPUT  fc33    WITHOUT DEFAULTS FROM fc33       ATTRIBUTE(BLUE, DIM)
  END INPUT
  INPUT  fc34    WITHOUT DEFAULTS FROM fc34       ATTRIBUTE(BLUE, BLINK)
  END INPUT

  #CYAN
  INPUT  fc41    WITHOUT DEFAULTS FROM fc41       ATTRIBUTE(CYAN)
  END INPUT
  INPUT  fc42    WITHOUT DEFAULTS FROM fc42       ATTRIBUTE(CYAN, REVERSE)
  END INPUT
  INPUT  fc43    WITHOUT DEFAULTS FROM fc43       ATTRIBUTE(CYAN, DIM)
  END INPUT
  INPUT  fc44    WITHOUT DEFAULTS FROM fc44       ATTRIBUTE(CYAN, BLINK)
  END INPUT

  #RED
  INPUT  fc51    WITHOUT DEFAULTS FROM fc51       ATTRIBUTE(RED)
  END INPUT
  INPUT  fc52    WITHOUT DEFAULTS FROM fc52       ATTRIBUTE(RED, REVERSE)
  END INPUT
  INPUT  fc53    WITHOUT DEFAULTS FROM fc53       ATTRIBUTE(RED, DIM)
  END INPUT
  INPUT  fc54    WITHOUT DEFAULTS FROM fc54       ATTRIBUTE(RED, BLINK)
  END INPUT
  
  #MAGENTA
  INPUT  fc61    WITHOUT DEFAULTS FROM fc61       ATTRIBUTE(MAGENTA)
  END INPUT
  INPUT  fc62    WITHOUT DEFAULTS FROM fc62       ATTRIBUTE(MAGENTA, REVERSE)
  END INPUT
  INPUT  fc63    WITHOUT DEFAULTS FROM fc63       ATTRIBUTE(MAGENTA, DIM)
  END INPUT
  INPUT  fc64    WITHOUT DEFAULTS FROM fc64       ATTRIBUTE(MAGENTA, BLINK)
  END INPUT

  #GREEN
  INPUT  fc71    WITHOUT DEFAULTS FROM fc71       ATTRIBUTE(GREEN)
  END INPUT
  INPUT  fc72    WITHOUT DEFAULTS FROM fc72       ATTRIBUTE(GREEN, REVERSE)
  END INPUT
  INPUT  fc73    WITHOUT DEFAULTS FROM fc73       ATTRIBUTE(GREEN, DIM)
  END INPUT
  INPUT  fc74    WITHOUT DEFAULTS FROM fc74       ATTRIBUTE(GREEN, BLINK)
  END INPUT
         
  #YELLOW
  INPUT  fc81    WITHOUT DEFAULTS FROM fc81       ATTRIBUTE(YELLOW)
  END INPUT
  INPUT  fc82    WITHOUT DEFAULTS FROM fc82       ATTRIBUTE(YELLOW, REVERSE)
  END INPUT
  INPUT  fc83    WITHOUT DEFAULTS FROM fc83       ATTRIBUTE(YELLOW, DIM)
  END INPUT
  INPUT  fc84    WITHOUT DEFAULTS FROM fc84       ATTRIBUTE(YELLOW, BLINK)
  END INPUT
  
  #RESERVE
  INPUT  fc91    WITHOUT DEFAULTS FROM fc91       ATTRIBUTE(BLACK)
  END INPUT
  INPUT  fc92    WITHOUT DEFAULTS FROM fc92       ATTRIBUTE(BLACK, REVERSE)
  END INPUT
  INPUT  fc93    WITHOUT DEFAULTS FROM fc93       ATTRIBUTE(BLACK, DIM)
  END INPUT
  INPUT  fc94    WITHOUT DEFAULTS FROM fc94       ATTRIBUTE(BLACK, BLINK)
  END INPUT
        
 

		#BLACK

		INPUT ARRAY colClassicArr[1,1] WITHOUT DEFAULTS FROM sc11.* ATTRIBUTE(BLACK)
		END INPUT 
	
		INPUT ARRAY colClassicArr[1,2] WITHOUT DEFAULTS FROM sc12.* ATTRIBUTE(BLACK, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[1,3] WITHOUT DEFAULTS FROM sc13.* ATTRIBUTE(BLACK, DIM)	
		END INPUT 		
				
		INPUT ARRAY colClassicArr[1,4] WITHOUT DEFAULTS FROM sc14.* ATTRIBUTE(BLACK, BLINK)
		END INPUT 


		INPUT ARRAY colGridArr[1,1] WITHOUT DEFAULTS FROM sg11.* ATTRIBUTE(BLACK)
		END INPUT 
		
		INPUT ARRAY colGridArr[1,2] WITHOUT DEFAULTS FROM sg12.* ATTRIBUTE(BLACK, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[1,3] WITHOUT DEFAULTS FROM sg13.* ATTRIBUTE(BLACK, DIM)		
		END INPUT 		
				
		INPUT ARRAY colGridArr[1,4] WITHOUT DEFAULTS FROM sg14.* ATTRIBUTE(BLACK, BLINK)	
		END INPUT 
		
		#WHITE

		INPUT ARRAY colClassicArr[2,1] WITHOUT DEFAULTS FROM sc21.* ATTRIBUTE(WHITE)
		END INPUT 
		
		INPUT ARRAY colClassicArr[2,2] WITHOUT DEFAULTS FROM sc22.* ATTRIBUTE(WHITE, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[2,3] WITHOUT DEFAULTS FROM sc23.* ATTRIBUTE(WHITE, DIM)	
		END INPUT 		
				
		INPUT ARRAY colClassicArr[2,4] WITHOUT DEFAULTS FROM sc24.* ATTRIBUTE(WHITE, BLINK)	
		END INPUT 
				
	

		INPUT ARRAY colGridArr[2,1] WITHOUT DEFAULTS FROM sg21.* ATTRIBUTE(WHITE)
		END INPUT 
		
		INPUT ARRAY colGridArr[2,2] WITHOUT DEFAULTS FROM sg22.* ATTRIBUTE(WHITE, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[2,3] WITHOUT DEFAULTS FROM sg23.* ATTRIBUTE(WHITE, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[2,4] WITHOUT DEFAULTS FROM sg24.* ATTRIBUTE(WHITE, BLINK)	
		END INPUT 	

		#BLUE

		INPUT ARRAY colClassicArr[3,1] WITHOUT DEFAULTS FROM sc31.* ATTRIBUTE(BLUE)
		END INPUT 
		
		INPUT ARRAY colClassicArr[3,2] WITHOUT DEFAULTS FROM sc32.* ATTRIBUTE(BLUE, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[3,3] WITHOUT DEFAULTS FROM sc33.* ATTRIBUTE(BLUE, DIM)		
		END INPUT 		
				
		INPUT ARRAY colClassicArr[3,4] WITHOUT DEFAULTS FROM sc34.* ATTRIBUTE(BLUE, BLINK)
		END INPUT 
				
				

		INPUT ARRAY colGridArr[3,1] WITHOUT DEFAULTS FROM sg31.* ATTRIBUTE(BLUE)
		END INPUT 
		
		INPUT ARRAY colGridArr[3,2] WITHOUT DEFAULTS FROM sg32.* ATTRIBUTE(BLUE, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[3,3] WITHOUT DEFAULTS FROM sg33.* ATTRIBUTE(BLUE, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[3,4] WITHOUT DEFAULTS FROM sg34.* ATTRIBUTE(BLUE, BLINK)
		END INPUT 
				
					

		#CYAN

		INPUT ARRAY colClassicArr[4,1] WITHOUT DEFAULTS FROM sc41.* ATTRIBUTE(CYAN)
		END INPUT 
		
		INPUT ARRAY colClassicArr[4,2] WITHOUT DEFAULTS FROM sc42.* ATTRIBUTE(CYAN, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[4,3] WITHOUT DEFAULTS FROM sc43.* ATTRIBUTE(CYAN, DIM)
		END INPUT 		
				
		INPUT ARRAY colClassicArr[4,4] WITHOUT DEFAULTS FROM sc44.* ATTRIBUTE(CYAN, BLINK)
		END INPUT 
	

		INPUT ARRAY colGridArr[4,1] WITHOUT DEFAULTS FROM sg41.* ATTRIBUTE(CYAN)
		END INPUT 
		
		INPUT ARRAY colGridArr[4,2] WITHOUT DEFAULTS FROM sg42.* ATTRIBUTE(CYAN, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[4,3] WITHOUT DEFAULTS FROM sg43.* ATTRIBUTE(CYAN, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[4,4] WITHOUT DEFAULTS FROM sg44.* ATTRIBUTE(CYAN, BLINK)	
		END INPUT 
	

		#RED

		INPUT ARRAY colClassicArr[5,1] WITHOUT DEFAULTS FROM sc51.* ATTRIBUTE(RED)
		END INPUT 
		
		INPUT ARRAY colClassicArr[5,2] WITHOUT DEFAULTS FROM sc52.* ATTRIBUTE(RED, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[5,3] WITHOUT DEFAULTS FROM sc53.* ATTRIBUTE(RED, DIM)
		END INPUT 		
				
		INPUT ARRAY colClassicArr[5,4] WITHOUT DEFAULTS FROM sc54.* ATTRIBUTE(RED, BLINK)
		END INPUT 
		

		INPUT ARRAY colGridArr[5,1] WITHOUT DEFAULTS FROM sg51.* ATTRIBUTE(RED)
		END INPUT 
		
		INPUT ARRAY colGridArr[5,2] WITHOUT DEFAULTS FROM sg52.* ATTRIBUTE(RED, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[5,3] WITHOUT DEFAULTS FROM sg53.* ATTRIBUTE(RED, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[5,4] WITHOUT DEFAULTS FROM sg54.* ATTRIBUTE(RED, BLINK)	
		END INPUT 
		

		#MAGENTA

		INPUT ARRAY colClassicArr[6,1] WITHOUT DEFAULTS FROM sc61.* ATTRIBUTE(MAGENTA)
		END INPUT 
		
		INPUT ARRAY colClassicArr[6,2] WITHOUT DEFAULTS FROM sc62.* ATTRIBUTE(MAGENTA, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[6,3] WITHOUT DEFAULTS FROM sc63.* ATTRIBUTE(MAGENTA, DIM)	
		END INPUT 		
				
		INPUT ARRAY colClassicArr[6,4] WITHOUT DEFAULTS FROM sc64.* ATTRIBUTE(MAGENTA, BLINK)	
		END INPUT 
		

		INPUT ARRAY colGridArr[6,1] WITHOUT DEFAULTS FROM sg61.* ATTRIBUTE(MAGENTA)
		END INPUT 
		
		INPUT ARRAY colGridArr[6,2] WITHOUT DEFAULTS FROM sg62.* ATTRIBUTE(MAGENTA, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[6,3] WITHOUT DEFAULTS FROM sg63.* ATTRIBUTE(MAGENTA, DIM)
		END INPUT 		
				
		INPUT ARRAY colGridArr[6,4] WITHOUT DEFAULTS FROM sg64.* ATTRIBUTE(MAGENTA, BLINK)	
		END INPUT 
		
		#GREEN

		INPUT ARRAY colClassicArr[7,1] WITHOUT DEFAULTS FROM sc71.* ATTRIBUTE(GREEN)
		END INPUT 
		
		INPUT ARRAY colClassicArr[7,2] WITHOUT DEFAULTS FROM sc72.* ATTRIBUTE(GREEN, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[7,3] WITHOUT DEFAULTS FROM sc73.* ATTRIBUTE(GREEN, DIM)		
		END INPUT 		
				
		INPUT ARRAY colClassicArr[7,4] WITHOUT DEFAULTS FROM sc74.* ATTRIBUTE(GREEN, BLINK)
		END INPUT 
		

		INPUT ARRAY colGridArr[7,1] WITHOUT DEFAULTS FROM sg71.* ATTRIBUTE(GREEN)
		END INPUT 
		
		INPUT ARRAY colGridArr[7,2] WITHOUT DEFAULTS FROM sg72.* ATTRIBUTE(GREEN, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[7,3] WITHOUT DEFAULTS FROM sg73.* ATTRIBUTE(GREEN, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[7,4] WITHOUT DEFAULTS FROM sg74.* ATTRIBUTE(GREEN, BLINK)	
		END INPUT 
		

		#YELLOW

		INPUT ARRAY colClassicArr[8,1] WITHOUT DEFAULTS FROM sc81.* ATTRIBUTE(YELLOW)
		END INPUT 
		
		INPUT ARRAY colClassicArr[8,2] WITHOUT DEFAULTS FROM sc82.* ATTRIBUTE(YELLOW, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[8,3] WITHOUT DEFAULTS FROM sc83.* ATTRIBUTE(YELLOW, DIM)	
		END INPUT 		
				
		INPUT ARRAY colClassicArr[8,4] WITHOUT DEFAULTS FROM sc84.* ATTRIBUTE(YELLOW, BLINK)	
		END INPUT 
		


		INPUT ARRAY colGridArr[8,1] WITHOUT DEFAULTS FROM sg81.* ATTRIBUTE(YELLOW)
		END INPUT 
		
		INPUT ARRAY colGridArr[8,2] WITHOUT DEFAULTS FROM sg82.* ATTRIBUTE(YELLOW, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[8,3] WITHOUT DEFAULTS FROM sg83.* ATTRIBUTE(YELLOW, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[8,4] WITHOUT DEFAULTS FROM sg84.* ATTRIBUTE(YELLOW, BLINK)	
		END INPUT 								

			
		#RESERVE

		INPUT ARRAY colClassicArr[9,1] WITHOUT DEFAULTS FROM sc91.* ATTRIBUTE(BLACK)
		END INPUT 
		
		INPUT ARRAY colClassicArr[9,2] WITHOUT DEFAULTS FROM sc92.* ATTRIBUTE(BLACK, REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[9,3] WITHOUT DEFAULTS FROM sc93.* ATTRIBUTE(BLACK, DIM)		
		END INPUT 		
				
		INPUT ARRAY colClassicArr[9,4] WITHOUT DEFAULTS FROM sc94.* ATTRIBUTE(BLACK, BLINK)	
		END INPUT 
		


		INPUT ARRAY colGridArr[9,1] WITHOUT DEFAULTS FROM sg91.* ATTRIBUTE(BLACK)
		END INPUT 
		
		INPUT ARRAY colGridArr[9,2] WITHOUT DEFAULTS FROM sg92.* ATTRIBUTE(BLACK, REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[9,3] WITHOUT DEFAULTS FROM sg93.* ATTRIBUTE(BLACK, DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[9,4] WITHOUT DEFAULTS FROM sg94.* ATTRIBUTE(BLACK, BLINK)
		END INPUT 								
						
		ON ACTION ("actExitInput")
			EXIT DIALOG				
						
						
	END DIALOG	

END FUNCTION


##########################################################################
# FUNCTION display_col_text_to_4gl_attrib() 
#Function doesn't use
########################################################################## 
FUNCTION display_col_text_to_4gl_attrib()
  #Black
  DISPLAY  fc11    TO fc11       ATTRIBUTE(BLACK)
  DISPLAY  fc12    TO fc12       ATTRIBUTE(BLACK, REVERSE)  
  DISPLAY  fc13    TO fc13       ATTRIBUTE(BLACK, DIM)
  DISPLAY  fc14    TO fc14       ATTRIBUTE(BLACK, BLINK)

  CALL col_array_init("Black")
  DISPLAY ARRAY col_arr TO sc11.* ATTRIBUTE(BLACK) WITHOUT SCROLL
  #DISPLAY  fcsa11  TO fcsa11[1]  ATTRIBUTE(BLACK)
  #DISPLAY  fcsa11  TO fcsa11[2]  ATTRIBUTE(BLACK)
  DISPLAY  fcsa12  TO fcsa12[1]  ATTRIBUTE(BLACK, REVERSE)
  DISPLAY  fcsa12  TO fcsa12[2]  ATTRIBUTE(BLACK, REVERSE)
  CALL col_array_init("Black-D")
  DISPLAY ARRAY col_arr TO sc13.* ATTRIBUTE(BLACK, DIM) WITHOUT SCROLL
  #DISPLAY  fcsa13  TO fcsa13[1]  ATTRIBUTE(BLACK, DIM)
  #DISPLAY  fcsa13  TO fcsa13[2]  ATTRIBUTE(BLACK, DIM)
  DISPLAY  fcsa14  TO fcsa14[1]  ATTRIBUTE(BLACK, BLINK)
  DISPLAY  fcsa14  TO fcsa14[2]  ATTRIBUTE(BLACK, BLINK)

  #White
  DISPLAY  fc21    TO fc21       ATTRIBUTE(WHITE)  
  DISPLAY  fc22    TO fc22       ATTRIBUTE(WHITE, REVERSE)
  DISPLAY  fc23    TO fc23       ATTRIBUTE(WHITE, DIM)
  DISPLAY  fc24    TO fc24       ATTRIBUTE(WHITE, BLINK)

  DISPLAY  fcsa21  TO fcsa21[1]  ATTRIBUTE(WHITE)
  DISPLAY  fcsa21  TO fcsa21[2]  ATTRIBUTE(WHITE)  
  CALL col_array_init("White-R")
  DISPLAY ARRAY col_arr TO sc22.* ATTRIBUTE(WHITE, REVERSE) WITHOUT SCROLL
  #DISPLAY  fcsa22  TO fcsa22[1]  ATTRIBUTE(WHITE, REVERSE)
  #DISPLAY  fcsa22  TO fcsa22[2]  ATTRIBUTE(WHITE, REVERSE)
  DISPLAY  fcsa23  TO fcsa23[1]  ATTRIBUTE(WHITE, DIM)
  DISPLAY  fcsa23  TO fcsa23[2]  ATTRIBUTE(WHITE, DIM)
  CALL col_array_init("White-B")
  DISPLAY ARRAY col_arr TO sc24.* ATTRIBUTE(WHITE, BLINK) WITHOUT SCROLL
  #DISPLAY  fcsa24  TO fcsa24[1]  ATTRIBUTE(WHITE, BLINK)
  #DISPLAY  fcsa24  TO fcsa24[2]  ATTRIBUTE(WHITE, BLINK)

  #BLUE
  DISPLAY  fc31    TO fc31       ATTRIBUTE(BLUE)  
  DISPLAY  fc32    TO fc32       ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fc33    TO fc33       ATTRIBUTE(BLUE, DIM)
  DISPLAY  fc34    TO fc34       ATTRIBUTE(BLUE, BLINK)

  CALL col_array_init("Blue")
  DISPLAY ARRAY col_arr TO sc31.* ATTRIBUTE(BLUE) WITHOUT SCROLL
  #DISPLAY  fcsa31  TO fcsa31[1]  ATTRIBUTE(BLUE)
  #DISPLAY  fcsa31  TO fcsa31[2]  ATTRIBUTE(BLUE)
  DISPLAY  fcsa32  TO fcsa32[1]  ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fcsa32  TO fcsa32[2]  ATTRIBUTE(BLUE, REVERSE)
  CALL col_array_init("Blue-D")
  DISPLAY ARRAY col_arr TO sc33.* ATTRIBUTE(BLUE, DIM) WITHOUT SCROLL
  #DISPLAY  fcsa33  TO fcsa33[1]  ATTRIBUTE(BLUE, DIM)
  #DISPLAY  fcsa33  TO fcsa33[2]  ATTRIBUTE(BLUE, DIM)
  DISPLAY  fcsa34  TO fcsa34[1]  ATTRIBUTE(BLUE, BLINK)
  DISPLAY  fcsa34  TO fcsa34[2]  ATTRIBUTE(BLUE, BLINK)

  #CYAN
  DISPLAY  fc41    TO fc41       ATTRIBUTE(CYAN)
  DISPLAY  fc42    TO fc42       ATTRIBUTE(CYAN, REVERSE)
  DISPLAY  fc43    TO fc43       ATTRIBUTE(CYAN, DIM)
  DISPLAY  fc44    TO fc44       ATTRIBUTE(CYAN, BLINK)

  DISPLAY  fcsa41  TO fcsa41[1]  ATTRIBUTE(CYAN)
  DISPLAY  fcsa41  TO fcsa41[2]  ATTRIBUTE(CYAN)
  CALL col_array_init("Cyan-R")
  DISPLAY ARRAY col_arr TO sc42.* ATTRIBUTE(CYAN, REVERSE) WITHOUT SCROLL
  #DISPLAY  fcsa42  TO fcsa42[1]  ATTRIBUTE(CYAN, REVERSE)
  #DISPLAY  fcsa42  TO fcsa42[2]  ATTRIBUTE(CYAN, REVERSE)
  DISPLAY  fcsa43  TO fcsa43[1]  ATTRIBUTE(CYAN, DIM)
  DISPLAY  fcsa43  TO fcsa43[2]  ATTRIBUTE(CYAN, DIM)
  CALL col_array_init("Cyan-B")
  DISPLAY ARRAY col_arr TO sc44.* ATTRIBUTE(CYAN, BLINK) WITHOUT SCROLL
  #DISPLAY  fcsa44  TO fcsa44[1]  ATTRIBUTE(CYAN, BLINK)
  #DISPLAY  fcsa44  TO fcsa44[2]  ATTRIBUTE(CYAN, BLINK)

  #RED
  DISPLAY  fc51    TO fc51       ATTRIBUTE(RED)
  DISPLAY  fc52    TO fc52       ATTRIBUTE(RED, REVERSE)
  DISPLAY  fc53    TO fc53       ATTRIBUTE(RED, DIM)
  DISPLAY  fc54    TO fc54       ATTRIBUTE(RED, BLINK)

  CALL col_array_init("Red")
  DISPLAY ARRAY col_arr TO sc51.* ATTRIBUTE(RED) WITHOUT SCROLL
  #DISPLAY  fcsa51  TO fcsa51[1]  ATTRIBUTE(RED)
  #DISPLAY  fcsa51  TO fcsa51[2]  ATTRIBUTE(RED)
  DISPLAY  fcsa52  TO fcsa52[1]  ATTRIBUTE(RED, REVERSE)
  DISPLAY  fcsa52  TO fcsa52[2]  ATTRIBUTE(RED, REVERSE)
  CALL col_array_init("Red-D")
  DISPLAY ARRAY col_arr TO sc53.* ATTRIBUTE(RED, DIM) WITHOUT SCROLL
  #DISPLAY  fcsa53  TO fcsa53[1]  ATTRIBUTE(RED, DIM)
  #DISPLAY  fcsa53  TO fcsa53[2]  ATTRIBUTE(RED, DIM)
  DISPLAY  fcsa54  TO fcsa54[1]  ATTRIBUTE(RED, BLINK)
  DISPLAY  fcsa54  TO fcsa54[2]  ATTRIBUTE(RED, BLINK)

  #MAGENTA
  DISPLAY  fc61    TO fc61       ATTRIBUTE(MAGENTA)
  DISPLAY  fc62    TO fc62       ATTRIBUTE(MAGENTA, REVERSE)
  DISPLAY  fc63    TO fc63       ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fc64    TO fc64       ATTRIBUTE(MAGENTA, BLINK)

  DISPLAY  fcsa61  TO fcsa61[1]  ATTRIBUTE(MAGENTA)
  DISPLAY  fcsa61  TO fcsa61[2]  ATTRIBUTE(MAGENTA)
  CALL col_array_init("Magenta")
  DISPLAY ARRAY col_arr TO sc62.* ATTRIBUTE(MAGENTA, REVERSE) WITHOUT SCROLL
  #DISPLAY  fcsa62  TO fcsa62[1]  ATTRIBUTE(MAGENTA, REVERSE)
  #DISPLAY  fcsa62  TO fcsa62[2]  ATTRIBUTE(MAGENTA, REVERSE)
  DISPLAY  fcsa63  TO fcsa63[1]  ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fcsa63  TO fcsa63[2]  ATTRIBUTE(MAGENTA, DIM)
  CALL col_array_init("Magenta-B")
  DISPLAY ARRAY col_arr TO sc64.* ATTRIBUTE(MAGENTA, BLINK) WITHOUT SCROLL
  DISPLAY  fcsa64  TO fcsa64[1]  ATTRIBUTE(MAGENTA, BLINK)
  DISPLAY  fcsa64  TO fcsa64[2]  ATTRIBUTE(MAGENTA, BLINK)

  #GREEN
  DISPLAY  fc71    TO fc71       ATTRIBUTE(GREEN)
  DISPLAY  fc72    TO fc72       ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fc73    TO fc73       ATTRIBUTE(GREEN, DIM)
  DISPLAY  fc74    TO fc74       ATTRIBUTE(GREEN, BLINK)

  CALL col_array_init("Green")
  DISPLAY ARRAY col_arr TO sc71.* ATTRIBUTE(GREEN) WITHOUT SCROLL
  #DISPLAY  fcsa71  TO fcsa71[1]  ATTRIBUTE(GREEN)
  #DISPLAY  fcsa71  TO fcsa71[2]  ATTRIBUTE(GREEN)
  DISPLAY  fcsa72  TO fcsa72[1]  ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fcsa72  TO fcsa72[2]  ATTRIBUTE(GREEN, REVERSE)
  CALL col_array_init("Green-D")
  DISPLAY ARRAY col_arr TO sc73.* ATTRIBUTE(GREEN, DIM) WITHOUT SCROLL
  #DISPLAY  fcsa73  TO fcsa73[1]  ATTRIBUTE(GREEN, DIM)
  #DISPLAY  fcsa73  TO fcsa73[2]  ATTRIBUTE(GREEN, DIM)
  DISPLAY  fcsa74  TO fcsa74[1]  ATTRIBUTE(GREEN, BLINK)
  DISPLAY  fcsa74  TO fcsa74[2]  ATTRIBUTE(GREEN, BLINK)

  #YELLOW
  DISPLAY  fc81    TO fc81       ATTRIBUTE(YELLOW)
  DISPLAY  fc82    TO fc82       ATTRIBUTE(YELLOW, REVERSE)
  DISPLAY  fc83    TO fc83       ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fc84    TO fc84       ATTRIBUTE(YELLOW, BLINK)

  DISPLAY  fcsa81  TO fcsa81[1]  ATTRIBUTE(YELLOW)
  DISPLAY  fcsa81  TO fcsa81[2]  ATTRIBUTE(YELLOW)
  CALL col_array_init("Yellow-R")
  DISPLAY ARRAY col_arr TO sc82.* ATTRIBUTE(YELLOW, REVERSE) WITHOUT SCROLL
  #DISPLAY  fcsa82  TO fcsa82[1]  ATTRIBUTE(YELLOW, REVERSE)
  #DISPLAY  fcsa82  TO fcsa82[2]  ATTRIBUTE(YELLOW, REVERSE)
  DISPLAY  fcsa83  TO fcsa83[1]  ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fcsa83  TO fcsa83[2]  ATTRIBUTE(YELLOW, DIM)
  CALL col_array_init("Yellow-B")
  DISPLAY ARRAY col_arr TO sc84.* ATTRIBUTE(YELLOW, BLINK) WITHOUT SCROLL
  #DISPLAY  fcsa84  TO fcsa84[1]  ATTRIBUTE(YELLOW, BLINK)
  #DISPLAY  fcsa84  TO fcsa84[2]  ATTRIBUTE(YELLOW, BLINK)

END FUNCTION

{

############################################################
# FUNCTION user_control_color_display()
############################################################
FUNCTION user_control_color_display_to_4gl_attrib()
  DEFINE 
    inp_char CHAR,
    loop SMALLINT


  LET loop = 1
  WHILE loop = 1
    #LET user_input = fgl_getkey()
    PROMPT "" FOR CHAR inp_char HELP 2
      BEFORE PROMPT
        CALL publish_toolbar("gd_col_2",0)
    #CASE user_input

      #Black
      ON KEY("1")
        INPUT BY NAME fc11 WITHOUT DEFAULTS  HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY("2")
        INPUT BY NAME fc12 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY("3")
        INPUT BY NAME fc13 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY("4")
        INPUT BY NAME fc14 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY("5")
        CALL col_array_init("Black")
        DISPLAY ARRAY col_arr TO sc11.*
          ATTRIBUTES (BLACK, CURRENT ROW DISPLAY = "BLACK, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY


     ON KEY("6")
          CALL col_array_init("Black-R")
          DISPLAY ARRAY col_arr TO sc12.* 
            ATTRIBUTES (BLACK, REVERSE, CURRENT ROW DISPLAY = "BLACK")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("7")
          CALL col_array_init("Black-D")
          DISPLAY ARRAY col_arr TO sc13.*
            ATTRIBUTES (BLACK, DIM, CURRENT ROW DISPLAY = "BLACK, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("8")
          CALL col_array_init("Black-B")
          DISPLAY ARRAY col_arr TO sc14.*
            ATTRIBUTES (BLACK, BLINK, CURRENT ROW DISPLAY = "BLACK, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY


      #White
     ON KEY("F41")
        INPUT BY NAME fc21 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F42")
        INPUT BY NAME fc22 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F43")
        INPUT BY NAME fc23 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F44")
        INPUT BY NAME fc24 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F45")
          CALL col_array_init("White")
          DISPLAY ARRAY col_arr TO sc21.*
            ATTRIBUTES (WHITE, CURRENT ROW DISPLAY = "WHITE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F46")
          CALL col_array_init("White-R")
          DISPLAY ARRAY col_arr TO sc22.*
            ATTRIBUTES (WHITE, REVERSE, CURRENT ROW DISPLAY = "WHITE") 

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F47")
          CALL col_array_init("White-D")
          DISPLAY ARRAY col_arr TO sc23.*
            ATTRIBUTES (WHITE, DIM, CURRENT ROW DISPLAY = "WHITE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F48")
          CALL col_array_init("White-B")
          DISPLAY ARRAY col_arr TO sc24.*
            ATTRIBUTES (WHITE, BLINK, CURRENT ROW DISPLAY = "WHITE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Blue
     ON KEY("F49")
        INPUT BY NAME fc31 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


     ON KEY("F50")
        INPUT BY NAME fc32 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F51")
        INPUT BY NAME fc33 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F52")
        INPUT BY NAME fc34 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F13")
          CALL col_array_init("Blue")
          DISPLAY ARRAY col_arr TO sc31.*
            ATTRIBUTES (BLUE, CURRENT ROW DISPLAY = "BLUE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F14")
          CALL col_array_init("Blue-R")
          DISPLAY ARRAY col_arr TO sc32.* 
            ATTRIBUTES (BLUE, REVERSE, CURRENT ROW DISPLAY = "BLUE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F15")
          CALL col_array_init("Blue-D")
          DISPLAY ARRAY col_arr TO sc33.*
            ATTRIBUTES (BLUE, REVERSE, CURRENT ROW DISPLAY = "BLUE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F16")
          CALL col_array_init("Blue-B")
          DISPLAY ARRAY col_arr TO sc34.*
            ATTRIBUTES (BLUE, REVERSE, CURRENT ROW DISPLAY = "BLUE, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Cyan
     ON KEY("F17")
        INPUT BY NAME fc41 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F18")
        INPUT BY NAME fc42 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F19")
        INPUT BY NAME fc43 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F20")
        INPUT BY NAME fc44 WITHOUT DEFAULTS  HELP 3 
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F21")
          CALL col_array_init("Cyan")
          DISPLAY ARRAY col_arr TO sc41.*
            ATTRIBUTES (CYAN, CURRENT ROW DISPLAY = "CYAN, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F22")
          CALL col_array_init("Cyan-R")
          DISPLAY ARRAY col_arr TO sc42.* 
            ATTRIBUTES (CYAN, REVERSE, CURRENT ROW DISPLAY = "CYAN")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F23")
          CALL col_array_init("Cyan-D")
          DISPLAY ARRAY col_arr TO sc43.*
            ATTRIBUTES (CYAN, DIM, CURRENT ROW DISPLAY = "CYAN, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F24")
          CALL col_array_init("Cyan-B")
          DISPLAY ARRAY col_arr TO sc44.*
            ATTRIBUTES (CYAN, BLINK, CURRENT ROW DISPLAY = "CYAN, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Red
     ON KEY("a")
        INPUT BY NAME fc51 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("b")
        INPUT BY NAME fc52 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("c")
        INPUT BY NAME fc53 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("d")
        INPUT BY NAME fc54 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("A")
          CALL col_array_init("Red")
          DISPLAY ARRAY col_arr TO sc51.*
            ATTRIBUTES (RED, CURRENT ROW DISPLAY = "RED, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("B")
          CALL col_array_init("Red-R")
          DISPLAY ARRAY col_arr TO sc52.* 
            ATTRIBUTES (RED, REVERSE, CURRENT ROW DISPLAY = "RED")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("C")
          CALL col_array_init("Red-D")
          DISPLAY ARRAY col_arr TO sc53.*
            ATTRIBUTES (RED, DIM, CURRENT ROW DISPLAY = "RED, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("D")
          CALL col_array_init("Red-B")
          DISPLAY ARRAY col_arr TO sc54.*
            ATTRIBUTES (RED, BLINK, CURRENT ROW DISPLAY = "RED, REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Magenta
     ON KEY("f")
        INPUT BY NAME fc61 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("g")
        INPUT BY NAME fc62 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("h")
        INPUT BY NAME fc63 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("i")
        INPUT BY NAME fc64 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("F")
          CALL col_array_init("Magenta")
          DISPLAY ARRAY col_arr TO sc61.*
            ATTRIBUTES (MAGENTA, CURRENT ROW DISPLAY = "MAGENTA,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("G")
          CALL col_array_init("Magenta-R")
          DISPLAY ARRAY col_arr TO sc62.* 
            ATTRIBUTES (MAGENTA, CURRENT ROW DISPLAY = "MAGENTA")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("H")
          CALL col_array_init("Magenta-D")
          DISPLAY ARRAY col_arr TO sc63.*
            ATTRIBUTES (MAGENTA, DIM, CURRENT ROW DISPLAY = "MAGENTA,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("I")
          CALL col_array_init("Magenta-B")
          DISPLAY ARRAY col_arr TO sc64.*
            ATTRIBUTES (MAGENTA, DIM, CURRENT ROW DISPLAY = "MAGENTA,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Green
     ON KEY("j")
        INPUT BY NAME fc71 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("k")
        INPUT BY NAME fc72 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("l")
        INPUT BY NAME fc73 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("m")
        INPUT BY NAME fc74 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("J")
          CALL col_array_init("Green")
          DISPLAY ARRAY col_arr TO sc71.*
            ATTRIBUTES (GREEN, CURRENT ROW DISPLAY = "GREEN,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("K")
          CALL col_array_init("Green-R")
          DISPLAY ARRAY col_arr TO sc72.* 
            ATTRIBUTES (GREEN, REVERSE, CURRENT ROW DISPLAY = "GREEN")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("L")
          CALL col_array_init("Green-D")
          DISPLAY ARRAY col_arr TO sc73.*
            ATTRIBUTES (GREEN, DIM, CURRENT ROW DISPLAY = "GREEN,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("M")
          CALL col_array_init("Green-B")
          DISPLAY ARRAY col_arr TO sc74.*
            ATTRIBUTES (GREEN, BLINK, CURRENT ROW DISPLAY = "GREEN,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

#Yellow
     ON KEY("n")
        INPUT BY NAME fc81 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("o")
        INPUT BY NAME fc82 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("p")
        INPUT BY NAME fc83 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("q")
        INPUT BY NAME fc84 WITHOUT DEFAULTS   HELP 3
          BEFORE INPUT
          CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

     ON KEY("N")
          CALL col_array_init("Yellow")
          DISPLAY ARRAY col_arr TO sc81.*
            ATTRIBUTES (YELLOW, CURRENT ROW DISPLAY = "YELLOW,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("O")
          CALL col_array_init("Yellow-R")
          DISPLAY ARRAY col_arr TO sc82.* 
            ATTRIBUTES (YELLOW, REVERSE, CURRENT ROW DISPLAY = "YELLOW")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("P")
          CALL col_array_init("Yellow-D")
          DISPLAY ARRAY col_arr TO sc83.*
            ATTRIBUTES (YELLOW, DIM, CURRENT ROW DISPLAY = "YELLOW,REVERSE")

          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 

          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("Q")
        CALL col_array_init("Yellow-B")
        DISPLAY ARRAY col_arr TO sc84.*
            ATTRIBUTES (YELLOW, BLINK, CURRENT ROW DISPLAY = "YELLOW,REVERSE")
          BEFORE DISPLAY
            CALL publish_toolbar("gd_col_2_edit",0) 
 
          ON KEY(ACCEPT)
            EXIT DISPLAY
        END DISPLAY

     ON KEY("F11")
        #CALL fgl_winmessage("Exit","Exit Color Demo","info")
        LET loop = 0
    # ON KEY("E")
        #CALL fgl_winmessage("Exit","Exit Color Demo","info")
    #    EXIT WHILE
      AFTER PROMPT
        CALL publish_toolbar("gd_col_2",1)
    END PROMPT

  END WHILE


END FUNCTION
}
