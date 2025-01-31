#########################################################################################################
# DISPLAY TO and AT Attributes Demo
#
# Color Demo - Menu Item 2
#
# Modification History:
# 29.11.06 HH - V3 - Extracted from gd_color.4gl
#########################################################################################################

############################################################
# GLOBAL Scope
############################################################
GLOBALS
  DEFINE col_arr ARRAY[5] OF CHAR(12)

  DEFINE 
    fcBlack,fcBlackRev,fcBlackDim,fcBlackBlink,fcsa11,fcsa12,fcsa13,fcsa14, 
    fcWhite,fcWhiteRev,fcWhiteDim,fcWhiteBlink,fcsa21,fcsa22,fcsa23,fcsa24,
    fcBlue,fcBlueRev,fcBlueDim,fcBlueBlink,fcsa31,fcsa32,fcsa33,fcsa34, 
    fcCyan,fcCyanRev,fcCyanDim,fcCyanBlink,fcsa41,fcsa42,fcsa43,fcsa44, 
    fcRed,fcRedRev,fcRedDim,fcRedBlink,fcsa51,fcsa52,fcsa53,fcsa54, 
    fcMagenta,fcMagentaRev,fcMagentaDim,fcMagentaBlink,fcsa61,fcsa62,fcsa63,fcsa64, 
    fcGreen,fcGreenRev,fcGreenDim,fcGreenBlink,fcsa71,fcsa72,fcsa73,fcsa74, 
    fcYellow,fcYellowRev,fcYellowDim,fcYellowBlink,fcsa81,fcsa82,fcsa83,fcsa84,  
    fcDefault,fcDefaultRev,fcDefaultDim,fcDefaultBlink,fcScrDefault,fcScrDefaultRev,fcScrDefaultDim,fcScrDefaultBlink,      
    fc15,fc16,fc17,fc18,fc19,fc20,
    fcsa15,fcsa16,fcsa17,fcsa18,fcsa19,fcsa20, 
    fc35,fc36,fc37,fc38,fc39,fc40,
    fcsa35,fcsa36,fcsa37,fcsa38,fcsa39,fcsa40,
    fc55,fc56,fc57,fc58,fc59,fc60,
    fcsa55,fcsa56,fcsa57,fcsa58,fcsa59,fcsa60

  CHAR(10)
END GLOBALS

DEFINE
	colClassicArr ARRAY [10,4,10] OF STRING, #Color codes array
	colGridArr ARRAY [10,4,10] OF STRING,    #Color codes array
	colName DYNAMIC ARRAY OF STRING,         #Color name variable
	attribName DYNAMIC ARRAY OF STRING       #Attribute names array
	
# Set color array	
FUNCTION InitColorNames()
	LET colName[1] = "BLACK"
	LET colName[2] = "WHITE"
	LET colName[3] = "BLUE"
	LET colName[4] = "CYAN"
	LET colName[5] = "RED"
	LET colName[6] = "MAGENTA"
	LET colName[7] = "GREEN"
	LET colName[8] = "YELLOW"
	LET colName[9] = "DEFAULT"
		
END FUNCTION	
# Set attributes name array
FUNCTION initAttribNames()
	LET attribName[1] = ""
	LET attribName[2] = "R"	
	LET attribName[3] = "D"	
	LET attribName[4] = "B"
END FUNCTION

############################################################
# FUNCTION col_array_string_init() - prepares the dummy text which is displayed to the fields
############################################################
FUNCTION col_array_string_init(col)
  DEFINE col char(15), i SMALLINT

  FOR i = 1 TO 5
    LET col_arr[i] = col CLIPPED, "-", trim(i)
  END FOR
  CALL set_count(5)

END FUNCTION	

############################################################
# FUNCTION initColorStringArray()
#
############################################################
FUNCTION initColorStringArray()
	DEFINE c,a,r INT

	FOR c = 1 TO 9
		FOR a = 1 TO 4
			FOR r = 1 TO 5
				LET colClassicArr[c,a,r] = colName[c] CLIPPED, "-", attribName[a] CLIPPED, "-", r USING "<"
				LET colGridArr[c,a,r] = colName[c] CLIPPED, "-", attribName[a] CLIPPED, "-", r USING "<"				
				
			END FOR
		END FOR
	END FOR 

END FUNCTION
	
############################################################
# FUNCTION color_display_at_demo()
# Is funcgion used ?
############################################################
FUNCTION color_display_to_attrib()
	DEFINE colWin WINDOW

	CALL colWin.openWithForm("w_color_display_to","form/css_color",1,1,"","")
	CALL colWin.setImage("icon32/col_chart02.ico")

	CALL InitColorNames()
	CALL initAttribNames()	
	CALL initColorStringArray()

  CALL init_color_fields()
	CALL dialogDisplay()
  CALL colWin.close()

END FUNCTION

##########################################################################
# FUNCTION dialogDisplay() 
# Function doesn't use
########################################################################## 
FUNCTION dialogDisplay()
  #Black
	DISPLAY  "Black" 					TO lb11       ATTRIBUTE(BLACK)
	DISPLAY  "Black-Reverse"	TO lb12       ATTRIBUTE(BLACK, REVERSE)	
	DISPLAY  "Black-Dim"			TO lb13       ATTRIBUTE(BLACK, DIM)	
	DISPLAY  "Black-Blink"		TO lb14       ATTRIBUTE(BLACK, BLINK)
	
			
  DISPLAY  fcBlack    TO fcBlack       ATTRIBUTE(BLACK)
  DISPLAY  fcBlackRev    TO fcBlackRev       ATTRIBUTE(BLACK, REVERSE)  
  DISPLAY  fcBlackDim    TO fcBlackDim       ATTRIBUTE(BLACK, DIM)
  DISPLAY  fcBlackBlink    TO fcBlackBlink       ATTRIBUTE(BLACK, BLINK)

  #White
	DISPLAY  "White" 					TO lb21       ATTRIBUTE(WHITE)
	DISPLAY  "White-Reverse"	TO lb22       ATTRIBUTE(WHITE, REVERSE)	
	DISPLAY  "White-Dim"			TO lb23       ATTRIBUTE(WHITE, DIM)	
	DISPLAY  "White-Blink"		TO lb24       ATTRIBUTE(WHITE, BLINK)
	

  DISPLAY  fcWhite    TO fcWhite       ATTRIBUTE(WHITE)  
  DISPLAY  fcWhiteRev    TO fcWhiteRev       ATTRIBUTE(WHITE, REVERSE)
  DISPLAY  fcWhiteDim    TO fcWhiteDim       ATTRIBUTE(WHITE, DIM)
  DISPLAY  fcWhiteBlink    TO fcWhiteBlink       ATTRIBUTE(WHITE, BLINK)

  #BLUE
	DISPLAY  "Blue" 					TO lb31       ATTRIBUTE(BLUE)
	DISPLAY  "Blue-Reverse"		TO lb32       ATTRIBUTE(BLUE, REVERSE)	
	DISPLAY  "Blue-Dim"				TO lb33       ATTRIBUTE(BLUE, DIM)	
	DISPLAY  "Blue-Blink"			TO lb34       ATTRIBUTE(BLUE, BLINK)
	

  DISPLAY  fcBlue    TO fcBlue       ATTRIBUTE(BLUE)  
  DISPLAY  fcBlueRev    TO fcBlueRev       ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fcBlueDim    TO fcBlueDim       ATTRIBUTE(BLUE, DIM)
  DISPLAY  fcBlueBlink    TO fcBlueBlink       ATTRIBUTE(BLUE, BLINK)

  #CYAN
	DISPLAY  "Cyan" 					TO lb41       ATTRIBUTE(CYAN)
	DISPLAY  "Cyan-Reverse"		TO lb42       ATTRIBUTE(CYAN, REVERSE)	
	DISPLAY  "Cyan-Dim"				TO lb43       ATTRIBUTE(CYAN, DIM)	
	DISPLAY  "Cyan-Blink"			TO lb44       ATTRIBUTE(CYAN, BLINK)

  DISPLAY  fcCyan    TO fcCyan       ATTRIBUTE(CYAN)
  DISPLAY  fcCyanRev    TO fcCyanRev       ATTRIBUTE(CYAN, REVERSE)
  DISPLAY  fcCyanDim    TO fcCyanDim       ATTRIBUTE(CYAN, DIM)
  DISPLAY  fcCyanBlink    TO fcCyanBlink       ATTRIBUTE(CYAN, BLINK)

  #RED
	DISPLAY  "Red" 						TO lb51       ATTRIBUTE(RED)
	DISPLAY  "Red-Reverse"		TO lb52       ATTRIBUTE(RED, REVERSE)	
	DISPLAY  "Red-Dim"				TO lb53       ATTRIBUTE(RED, DIM)	
	DISPLAY  "Red-Blink"			TO lb54       ATTRIBUTE(RED, BLINK)


  DISPLAY  fcRed    TO fcRed       ATTRIBUTE(RED)
  DISPLAY  fcRedRev    TO fcRedRev       ATTRIBUTE(RED, REVERSE)
  DISPLAY  fcRedDim    TO fcRedDim       ATTRIBUTE(RED, DIM)
  DISPLAY  fcRedBlink    TO fcRedBlink       ATTRIBUTE(RED, BLINK)
  
  #MAGENTA
	DISPLAY  "Magenta" 						TO lb61       ATTRIBUTE(MAGENTA)
	DISPLAY  "Magenta-Reverse"		TO lb62       ATTRIBUTE(MAGENTA, REVERSE)	
	DISPLAY  "Magenta-Dim"				TO lb63       ATTRIBUTE(MAGENTA, DIM)	
	DISPLAY  "Magenta-Blink"			TO lb64       ATTRIBUTE(MAGENTA, BLINK)


  DISPLAY  fcMagenta    TO fcMagenta       ATTRIBUTE(MAGENTA)
  DISPLAY  fcMagentaRev    TO fcMagentaRev       ATTRIBUTE(MAGENTA, REVERSE)
  DISPLAY  fcMagentaDim    TO fcMagentaDim       ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fcMagentaBlink    TO fcMagentaBlink       ATTRIBUTE(MAGENTA, BLINK)

  #GREEN
	DISPLAY  "Green" 							TO lb71       ATTRIBUTE(GREEN)
	DISPLAY  "Green-Reverse"			TO lb72       ATTRIBUTE(GREEN, REVERSE)	
	DISPLAY  "Green-Dim"					TO lb73       ATTRIBUTE(GREEN, DIM)	
	DISPLAY  "Green-Blink"				TO lb74       ATTRIBUTE(GREEN, BLINK)



  DISPLAY  fcGreen    TO fcGreen       ATTRIBUTE(GREEN)
  DISPLAY  fcGreenRev    TO fcGreenRev       ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fcGreenDim    TO fcGreenDim       ATTRIBUTE(GREEN, DIM)
  DISPLAY  fcGreenBlink    TO fcGreenBlink       ATTRIBUTE(GREEN, BLINK)
         
  #YELLOW
	DISPLAY  "Yellow" 						TO lb81       ATTRIBUTE(YELLOW)
	DISPLAY  "Yellow-Reverse"			TO lb82       ATTRIBUTE(YELLOW, REVERSE)	
	DISPLAY  "Yellow-Dim"					TO lb83       ATTRIBUTE(YELLOW, DIM)	
	DISPLAY  "Yellow-Blink"				TO lb84       ATTRIBUTE(YELLOW, BLINK)


  DISPLAY  fcYellow    TO fcYellow       ATTRIBUTE(YELLOW)
  DISPLAY  fcYellowRev    TO fcYellowRev       ATTRIBUTE(YELLOW, REVERSE)
  DISPLAY  fcYellowDim    TO fcYellowDim       ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fcYellowBlink    TO fcYellowBlink       ATTRIBUTE(YELLOW, BLINK)
  

  #Default (no color attribute)
	DISPLAY  "Default" 							TO lbDefault
	DISPLAY  "Default-Reverse"			TO lbDefaultRev   ATTRIBUTE(REVERSE)	
	DISPLAY  "Default-Dim"					TO lbDefaultDim   ATTRIBUTE(DIM)	
	DISPLAY  "Default-Blink"				TO lbDefaultBlink ATTRIBUTE(BLINK)


  DISPLAY  fcDefault    TO fcDefault       
  DISPLAY  fcDefaultRev    TO fcDefaultRev       ATTRIBUTE(REVERSE)
  DISPLAY  fcDefaultDim    TO fcDefaultDim       ATTRIBUTE(DIM)
  DISPLAY  fcDefaultBlink    TO fcDefaultBlink       ATTRIBUTE(BLINK)
        
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

			
		#DEFAULT COLOR (no color attribute)

		DISPLAY ARRAY colClassicArr[9,1] TO scrDefault.* 
		END DISPLAY 
		
		DISPLAY ARRAY colClassicArr[9,2] TO scrDefaultRev.* ATTRIBUTE(REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colClassicArr[9,3] TO scrDefaultDim.* ATTRIBUTE(DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colClassicArr[9,4] TO scrDefaultBlink.* ATTRIBUTE(BLINK)
		END DISPLAY 
		


		DISPLAY ARRAY colGridArr[9,1] TO scgDefault.* 
		END DISPLAY 
		
		DISPLAY ARRAY colGridArr[9,2] TO scgDefaultRev.* ATTRIBUTE(REVERSE)
		END DISPLAY 
				
		DISPLAY ARRAY colGridArr[9,3] TO scgDefaultDim.* ATTRIBUTE(DIM)
		END DISPLAY 		
				
		DISPLAY ARRAY colGridArr[9,4] TO scgDefaultBlink.* ATTRIBUTE(BLINK)
		END DISPLAY 								
						
		ON ACTION ("EXIT")
			EXIT DIALOG		
						
		ON ACTION ("EDIT")
			CALL dialogInputDisplayTo()				
													
	END DIALOG	

END FUNCTION


##########################################################################
# FUNCTION dialogInputDisplayTo()
# Function doesn't use
########################################################################## 
FUNCTION dialogInputDisplayTo()
  #Black

	DIALOG
			
  INPUT  fcBlack    WITHOUT DEFAULTS FROM fcBlack       ATTRIBUTE(BLACK)
  END INPUT
  INPUT  fcBlackRev    WITHOUT DEFAULTS FROM fcBlackRev       ATTRIBUTE(BLACK, REVERSE)  
  END INPUT
  INPUT  fcBlackDim    WITHOUT DEFAULTS FROM fcBlackDim       ATTRIBUTE(BLACK, DIM)
  END INPUT
  INPUT  fcBlackBlink    WITHOUT DEFAULTS FROM fcBlackBlink       ATTRIBUTE(BLACK, BLINK)
  END INPUT

  #White

  INPUT  fcWhite    WITHOUT DEFAULTS FROM fcWhite       ATTRIBUTE(WHITE)  
  END INPUT
  INPUT  fcWhiteRev    WITHOUT DEFAULTS FROM fcWhiteRev       ATTRIBUTE(WHITE, REVERSE)
  END INPUT
  INPUT  fcWhiteDim    WITHOUT DEFAULTS FROM fcWhiteDim       ATTRIBUTE(WHITE, DIM)
  END INPUT
  INPUT  fcWhiteBlink    WITHOUT DEFAULTS FROM fcWhiteBlink       ATTRIBUTE(WHITE, BLINK)
  END INPUT

  #BLUE

  INPUT  fcBlue    WITHOUT DEFAULTS FROM fcBlue       ATTRIBUTE(BLUE)  
  END INPUT
  INPUT  fcBlueRev    WITHOUT DEFAULTS FROM fcBlueRev       ATTRIBUTE(BLUE, REVERSE)
  END INPUT
  INPUT  fcBlueDim    WITHOUT DEFAULTS FROM fcBlueDim       ATTRIBUTE(BLUE, DIM)
  END INPUT
  INPUT  fcBlueBlink    WITHOUT DEFAULTS FROM fcBlueBlink       ATTRIBUTE(BLUE, BLINK)
  END INPUT

  #CYAN
  INPUT  fcCyan    WITHOUT DEFAULTS FROM fcCyan       ATTRIBUTE(CYAN)
  END INPUT
  INPUT  fcCyanRev    WITHOUT DEFAULTS FROM fcCyanRev       ATTRIBUTE(CYAN, REVERSE)
  END INPUT
  INPUT  fcCyanDim    WITHOUT DEFAULTS FROM fcCyanDim       ATTRIBUTE(CYAN, DIM)
  END INPUT
  INPUT  fcCyanBlink    WITHOUT DEFAULTS FROM fcCyanBlink       ATTRIBUTE(CYAN, BLINK)
  END INPUT

  #RED
  INPUT  fcRed    WITHOUT DEFAULTS FROM fcRed       ATTRIBUTE(RED)
  END INPUT
  INPUT  fcRedRev    WITHOUT DEFAULTS FROM fcRedRev       ATTRIBUTE(RED, REVERSE)
  END INPUT
  INPUT  fcRedDim    WITHOUT DEFAULTS FROM fcRedDim       ATTRIBUTE(RED, DIM)
  END INPUT
  INPUT  fcRedBlink    WITHOUT DEFAULTS FROM fcRedBlink       ATTRIBUTE(RED, BLINK)
  END INPUT
  
  #MAGENTA
  INPUT  fcMagenta    WITHOUT DEFAULTS FROM fcMagenta       ATTRIBUTE(MAGENTA)
  END INPUT
  INPUT  fcMagentaRev    WITHOUT DEFAULTS FROM fcMagentaRev       ATTRIBUTE(MAGENTA, REVERSE)
  END INPUT
  INPUT  fcMagentaDim    WITHOUT DEFAULTS FROM fcMagentaDim       ATTRIBUTE(MAGENTA, DIM)
  END INPUT
  INPUT  fcMagentaBlink    WITHOUT DEFAULTS FROM fcMagentaBlink       ATTRIBUTE(MAGENTA, BLINK)
  END INPUT

  #GREEN
  INPUT  fcGreen    WITHOUT DEFAULTS FROM fcGreen       ATTRIBUTE(GREEN)
  END INPUT
  INPUT  fcGreenRev    WITHOUT DEFAULTS FROM fcGreenRev       ATTRIBUTE(GREEN, REVERSE)
  END INPUT
  INPUT  fcGreenDim    WITHOUT DEFAULTS FROM fcGreenDim       ATTRIBUTE(GREEN, DIM)
  END INPUT
  INPUT  fcGreenBlink    WITHOUT DEFAULTS FROM fcGreenBlink       ATTRIBUTE(GREEN, BLINK)
  END INPUT
         
  #YELLOW
  INPUT  fcYellow    WITHOUT DEFAULTS FROM fcYellow       ATTRIBUTE(YELLOW)
  END INPUT
  INPUT  fcYellowRev    WITHOUT DEFAULTS FROM fcYellowRev       ATTRIBUTE(YELLOW, REVERSE)
  END INPUT
  INPUT  fcYellowDim    WITHOUT DEFAULTS FROM fcYellowDim       ATTRIBUTE(YELLOW, DIM)
  END INPUT
  INPUT  fcYellowBlink    WITHOUT DEFAULTS FROM fcYellowBlink       ATTRIBUTE(YELLOW, BLINK)
  END INPUT
  
  #DEFFAULT (no color attribute)
  INPUT  fcDefault    WITHOUT DEFAULTS FROM fcDefault       
  END INPUT
  INPUT  fcDefaultRev    WITHOUT DEFAULTS FROM fcDefaultRev       ATTRIBUTE(REVERSE)
  END INPUT
  INPUT  fcDefaultDim    WITHOUT DEFAULTS FROM fcDefaultDim       ATTRIBUTE(DIM)
  END INPUT
  INPUT  fcDefaultBlink    WITHOUT DEFAULTS FROM fcDefaultBlink       ATTRIBUTE(BLINK)
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

			
		#DEFFAULT (no color attribute)

		INPUT ARRAY colClassicArr[9,1] WITHOUT DEFAULTS FROM scrDefault.* 
		END INPUT 
		
		INPUT ARRAY colClassicArr[9,2] WITHOUT DEFAULTS FROM scrDefaultRev.* ATTRIBUTE(REVERSE)
		END INPUT 
				
		INPUT ARRAY colClassicArr[9,3] WITHOUT DEFAULTS FROM scrDefaultDim.* ATTRIBUTE(DIM)		
		END INPUT 		
				
		INPUT ARRAY colClassicArr[9,4] WITHOUT DEFAULTS FROM scrDefaultBlink.* ATTRIBUTE(BLINK)	
		END INPUT 
		


		INPUT ARRAY colGridArr[9,1] WITHOUT DEFAULTS FROM scgDefault.* 
		END INPUT 
		
		INPUT ARRAY colGridArr[9,2] WITHOUT DEFAULTS FROM scgDefaultRev.* ATTRIBUTE(REVERSE)
		END INPUT 
				
		INPUT ARRAY colGridArr[9,3] WITHOUT DEFAULTS FROM scgDefaultDim.* ATTRIBUTE(DIM)	
		END INPUT 		
				
		INPUT ARRAY colGridArr[9,4] WITHOUT DEFAULTS FROM scgDefaultBlink.* ATTRIBUTE(BLINK)
		END INPUT 								
						
		ON ACTION ("CANCEL")
			EXIT DIALOG				
						
						
	END DIALOG	

END FUNCTION


##########################################################################
# FUNCTION display_col_text_to_4gl_attrib() 
#Function doesn't use
########################################################################## 
FUNCTION display_col_text_to_4gl_attrib()
  #Black
  DISPLAY  fcBlack    TO fcBlack       ATTRIBUTE(BLACK)
  DISPLAY  fcBlackRev    TO fcBlackRev       ATTRIBUTE(BLACK, REVERSE)  
  DISPLAY  fcBlackDim    TO fcBlackDim       ATTRIBUTE(BLACK, DIM)
  DISPLAY  fcBlackBlink    TO fcBlackBlink       ATTRIBUTE(BLACK, BLINK)

  CALL col_array_init("Black")
  DISPLAY ARRAY col_arr TO sc11.* ATTRIBUTE(BLACK) WITHOUT SCROLL
  DISPLAY  fcsa12  TO fcsa12[1]  ATTRIBUTE(BLACK, REVERSE)
  DISPLAY  fcsa12  TO fcsa12[2]  ATTRIBUTE(BLACK, REVERSE)
  CALL col_array_init("Black-D")
  DISPLAY ARRAY col_arr TO sc13.* ATTRIBUTE(BLACK, DIM) WITHOUT SCROLL
  DISPLAY  fcsa14  TO fcsa14[1]  ATTRIBUTE(BLACK, BLINK)
  DISPLAY  fcsa14  TO fcsa14[2]  ATTRIBUTE(BLACK, BLINK)

  #White
  DISPLAY  fcWhite    TO fcWhite       ATTRIBUTE(WHITE)  
  DISPLAY  fcWhiteRev    TO fcWhiteRev       ATTRIBUTE(WHITE, REVERSE)
  DISPLAY  fcWhiteDim    TO fcWhiteDim       ATTRIBUTE(WHITE, DIM)
  DISPLAY  fcWhiteBlink    TO fcWhiteBlink       ATTRIBUTE(WHITE, BLINK)

  DISPLAY  fcsa21  TO fcsa21[1]  ATTRIBUTE(WHITE)
  DISPLAY  fcsa21  TO fcsa21[2]  ATTRIBUTE(WHITE)  
  CALL col_array_init("White-R")
  DISPLAY ARRAY col_arr TO sc22.* ATTRIBUTE(WHITE, REVERSE) WITHOUT SCROLL
  DISPLAY  fcsa23  TO fcsa23[1]  ATTRIBUTE(WHITE, DIM)
  DISPLAY  fcsa23  TO fcsa23[2]  ATTRIBUTE(WHITE, DIM)
  CALL col_array_init("White-B")
  DISPLAY ARRAY col_arr TO sc24.* ATTRIBUTE(WHITE, BLINK) WITHOUT SCROLL

  #BLUE
  DISPLAY  fcBlue    TO fcBlue       ATTRIBUTE(BLUE)  
  DISPLAY  fcBlueRev    TO fcBlueRev       ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fcBlueDim    TO fcBlueDim       ATTRIBUTE(BLUE, DIM)
  DISPLAY  fcBlueBlink    TO fcBlueBlink       ATTRIBUTE(BLUE, BLINK)

  CALL col_array_init("Blue")
  DISPLAY ARRAY col_arr TO sc31.* ATTRIBUTE(BLUE) WITHOUT SCROLL
  DISPLAY  fcsa32  TO fcsa32[1]  ATTRIBUTE(BLUE, REVERSE)
  DISPLAY  fcsa32  TO fcsa32[2]  ATTRIBUTE(BLUE, REVERSE)
  CALL col_array_init("Blue-D")
  DISPLAY ARRAY col_arr TO sc33.* ATTRIBUTE(BLUE, DIM) WITHOUT SCROLL
  DISPLAY  fcsa34  TO fcsa34[1]  ATTRIBUTE(BLUE, BLINK)
  DISPLAY  fcsa34  TO fcsa34[2]  ATTRIBUTE(BLUE, BLINK)

  #CYAN
  DISPLAY  fcCyan    TO fcCyan       ATTRIBUTE(CYAN)
  DISPLAY  fcCyanRev    TO fcCyanRev       ATTRIBUTE(CYAN, REVERSE)
  DISPLAY  fcCyanDim    TO fcCyanDim       ATTRIBUTE(CYAN, DIM)
  DISPLAY  fcCyanBlink    TO fcCyanBlink       ATTRIBUTE(CYAN, BLINK)

  DISPLAY  fcsa41  TO fcsa41[1]  ATTRIBUTE(CYAN)
  DISPLAY  fcsa41  TO fcsa41[2]  ATTRIBUTE(CYAN)
  CALL col_array_init("Cyan-R")
  DISPLAY ARRAY col_arr TO sc42.* ATTRIBUTE(CYAN, REVERSE) WITHOUT SCROLL
  DISPLAY  fcsa43  TO fcsa43[1]  ATTRIBUTE(CYAN, DIM)
  DISPLAY  fcsa43  TO fcsa43[2]  ATTRIBUTE(CYAN, DIM)
  CALL col_array_init("Cyan-B")
  DISPLAY ARRAY col_arr TO sc44.* ATTRIBUTE(CYAN, BLINK) WITHOUT SCROLL

  #RED
  DISPLAY  fcRed    TO fcRed       ATTRIBUTE(RED)
  DISPLAY  fcRedRev    TO fcRedRev       ATTRIBUTE(RED, REVERSE)
  DISPLAY  fcRedDim    TO fcRedDim       ATTRIBUTE(RED, DIM)
  DISPLAY  fcRedBlink    TO fcRedBlink       ATTRIBUTE(RED, BLINK)

  CALL col_array_init("Red")
  DISPLAY ARRAY col_arr TO sc51.* ATTRIBUTE(RED) WITHOUT SCROLL
  DISPLAY  fcsa52  TO fcsa52[1]  ATTRIBUTE(RED, REVERSE)
  DISPLAY  fcsa52  TO fcsa52[2]  ATTRIBUTE(RED, REVERSE)
  CALL col_array_init("Red-D")
  DISPLAY ARRAY col_arr TO sc53.* ATTRIBUTE(RED, DIM) WITHOUT SCROLL
  DISPLAY  fcsa54  TO fcsa54[1]  ATTRIBUTE(RED, BLINK)
  DISPLAY  fcsa54  TO fcsa54[2]  ATTRIBUTE(RED, BLINK)

  #MAGENTA
  DISPLAY  fcMagenta    TO fcMagenta       ATTRIBUTE(MAGENTA)
  DISPLAY  fcMagentaRev    TO fcMagentaRev       ATTRIBUTE(MAGENTA, REVERSE)
  DISPLAY  fcMagentaDim    TO fcMagentaDim       ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fcMagentaBlink    TO fcMagentaBlink       ATTRIBUTE(MAGENTA, BLINK)

  DISPLAY  fcsa61  TO fcsa61[1]  ATTRIBUTE(MAGENTA)
  DISPLAY  fcsa61  TO fcsa61[2]  ATTRIBUTE(MAGENTA)
  CALL col_array_init("Magenta")
  DISPLAY ARRAY col_arr TO sc62.* ATTRIBUTE(MAGENTA, REVERSE) WITHOUT SCROLL
  DISPLAY  fcsa63  TO fcsa63[1]  ATTRIBUTE(MAGENTA, DIM)
  DISPLAY  fcsa63  TO fcsa63[2]  ATTRIBUTE(MAGENTA, DIM)
  CALL col_array_init("Magenta-B")
  DISPLAY ARRAY col_arr TO sc64.* ATTRIBUTE(MAGENTA, BLINK) WITHOUT SCROLL
  DISPLAY  fcsa64  TO fcsa64[1]  ATTRIBUTE(MAGENTA, BLINK)
  DISPLAY  fcsa64  TO fcsa64[2]  ATTRIBUTE(MAGENTA, BLINK)

  #GREEN
  DISPLAY  fcGreen    TO fcGreen       ATTRIBUTE(GREEN)
  DISPLAY  fcGreenRev    TO fcGreenRev       ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fcGreenDim    TO fcGreenDim       ATTRIBUTE(GREEN, DIM)
  DISPLAY  fcGreenBlink    TO fcGreenBlink       ATTRIBUTE(GREEN, BLINK)

  CALL col_array_init("Green")
  DISPLAY ARRAY col_arr TO sc71.* ATTRIBUTE(GREEN) WITHOUT SCROLL
  DISPLAY  fcsa72  TO fcsa72[1]  ATTRIBUTE(GREEN, REVERSE)
  DISPLAY  fcsa72  TO fcsa72[2]  ATTRIBUTE(GREEN, REVERSE)
  CALL col_array_init("Green-D")
  DISPLAY ARRAY col_arr TO sc73.* ATTRIBUTE(GREEN, DIM) WITHOUT SCROLL
  DISPLAY  fcsa74  TO fcsa74[1]  ATTRIBUTE(GREEN, BLINK)
  DISPLAY  fcsa74  TO fcsa74[2]  ATTRIBUTE(GREEN, BLINK)

  #YELLOW
  DISPLAY  fcYellow    TO fcYellow       ATTRIBUTE(YELLOW)
  DISPLAY  fcYellowRev    TO fcYellowRev       ATTRIBUTE(YELLOW, REVERSE)
  DISPLAY  fcYellowDim    TO fcYellowDim       ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fcYellowBlink    TO fcYellowBlink       ATTRIBUTE(YELLOW, BLINK)

  DISPLAY  fcsa81  TO fcsa81[1]  ATTRIBUTE(YELLOW)
  DISPLAY  fcsa81  TO fcsa81[2]  ATTRIBUTE(YELLOW)
  CALL col_array_init("Yellow-R")
  DISPLAY ARRAY col_arr TO sc82.* ATTRIBUTE(YELLOW, REVERSE) WITHOUT SCROLL
  DISPLAY  fcsa83  TO fcsa83[1]  ATTRIBUTE(YELLOW, DIM)
  DISPLAY  fcsa83  TO fcsa83[2]  ATTRIBUTE(YELLOW, DIM)
  CALL col_array_init("Yellow-B")
  DISPLAY ARRAY col_arr TO sc84.* ATTRIBUTE(YELLOW, BLINK) WITHOUT SCROLL

END FUNCTION

