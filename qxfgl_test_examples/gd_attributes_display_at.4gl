#########################################################################################################
# Color Attributes Demos Main Menu
#
# Center of all attrbute demos
#
# Modification History:
# 29.11.06 HH - V3 - Extracted from gd_color.4gl
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

DEFINE attributeString ARRAY[10] OF STRING #! Array of text attributes
#! FUNCTION attribute_demo_display_at() changes color attributes of displayed text
FUNCTION attribute_demo_display_at()

  LET attributeString[1] = "attribute(BLACK)" --get_str(801) --"Default"
  LET attributeString[2] = "attribute(BLACK,BOLD)" --get_str(802) --"Bold"
  LET attributeString[3] = "attribute(BLACK,REVERSE)" --get_str(803) --"Reverse"
  LET attributeString[4] = "attribute(BLACK,UNDERLINE)" --get_str(804) --"Underline"
  LET attributeString[5] = "attribute(BLACK, BLINK)" --get_str(805) --"Blink"
  LET attributeString[6] = "attribute(BLACK,DIM)" --get_str(806) --"Dim"
  LET attributeString[7] = "attribute(BLACK,UNDERLINE, BOLD)" --get_str(807) --"Un-Bo"
  LET attributeString[8] = "attribute(BLACK,UNDERLINE, REVERSE)" --get_str(808) --"Un-Re"
  LET attributeString[9] = "attribute(BLACK,UNDERLINE, BOLD, REVERSE)" --get_str(809) --"Un-Bo-Re"
  LET attributeString[10] = "attribute(BLACK,REVERSE,BOLD)" --get_str(810) --"Re-Bo"

	OPEN WINDOW winAttributeDisplayAt AT 1,1 WITH FORM "form/gd_f_attributes_display_at_2_2" --ATTRIBUTE(BORDER)
	
	MENU
		BEFORE MENU
        CALL publish_toolbar("gd_col_4",0)
        		
		ON ACTION  "actBlack"
      #Black
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(BLACK)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(BLACK,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(BLACK,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(BLACK,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(BLACK, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(BLACK,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(BLACK,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(BLACK,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(BLACK,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(BLACK,REVERSE,BOLD) --Re-Bo



		ON ACTION  "actBlue"
      #BLUE
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(BLUE)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(BLUE,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(BLUE,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(BLUE,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(BLUE, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(BLUE,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(BLUE,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(BLUE,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(BLUE,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(BLUE,REVERSE,BOLD) --Re-Bo



		ON ACTION  "actCyan"
      #CYAN
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(CYAN)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(CYAN,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(CYAN,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(CYAN,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(CYAN, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(CYAN,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(CYAN,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(CYAN,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(CYAN,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(CYAN,REVERSE,BOLD) --Re-Bo


		ON ACTION  "actGreen"
      #GREEN
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(GREEN)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(GREEN,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(GREEN,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(GREEN,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(GREEN, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(GREEN,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(GREEN,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(GREEN,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(GREEN,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(GREEN,REVERSE,BOLD) --Re-Bo


		ON ACTION  "actMagenta"
      #MAGENTA
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(MAGENTA)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(MAGENTA,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(MAGENTA,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(MAGENTA,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(MAGENTA, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(MAGENTA,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(MAGENTA,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(MAGENTA,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(MAGENTA,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(MAGENTA,REVERSE,BOLD) --Re-Bo



		ON ACTION  "actRed"
      #RED
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(RED)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(RED,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(RED,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(RED,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(RED, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(RED,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(RED,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(RED,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(RED,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(RED,REVERSE,BOLD) --Re-Bo


		ON ACTION  "actWhite"
      #WHITE
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(WHITE)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(WHITE,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(WHITE,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(WHITE,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(WHITE, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(WHITE,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(WHITE,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(WHITE,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(WHITE,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(WHITE,REVERSE,BOLD) --Re-Bo



		ON ACTION  "actYellow"
      #YELLOW
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(YELLOW)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(YELLOW,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(YELLOW,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(YELLOW,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(YELLOW, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(YELLOW,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(YELLOW,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(YELLOW,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(YELLOW,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(YELLOW,REVERSE,BOLD) --Re-Bo


		ON ACTION  "actNormal"
      #NORMAL
      DISPLAY attributeString[1]                   AT 5 , 1 attribute(NORMAL)   --Default
      DISPLAY attributeString[2]                   AT 7 , 1 attribute(NORMAL,BOLD)   --Bold
      DISPLAY attributeString[3]                   AT 9 , 1 attribute(NORMAL,REVERSE) --Reverse
      DISPLAY attributeString[4]                   AT 11, 1 attribute(NORMAL,UNDERLINE) --Underline
      DISPLAY attributeString[5]                   AT 13, 1 attribute(NORMAL, BLINK) --Blink
      DISPLAY attributeString[6]                   AT 15, 1 attribute(NORMAL,DIM) --Dim
      DISPLAY attributeString[7]                   AT 17, 1 attribute(NORMAL,UNDERLINE, BOLD)  --Un-Bo 
      DISPLAY attributeString[8]                   AT 19, 1 attribute(NORMAL,UNDERLINE, REVERSE) --Un-Re
      DISPLAY attributeString[9]                   AT 21, 1 attribute(NORMAL,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      DISPLAY attributeString[10]                   AT 23, 1 attribute(NORMAL,REVERSE,BOLD) --Re-Bo

		ON ACTION  "actClearLine"
			--clean lines
			DISPLAY "" AT 5,1
			DISPLAY "" AT 7,1
			DISPLAY "" AT 9,1
			DISPLAY "" AT 11,1
			DISPLAY "" AT 13,1
			DISPLAY "" AT 15,1
			DISPLAY "" AT 17,1
			DISPLAY "" AT 19,1
			DISPLAY "" AT 21,1
			DISPLAY "" AT 23,1

		ON ACTION  "actClearScreen"
			CLEAR SCREEN

   	    ON ACTION "actExitModule"
            EXIT MENU 
      
    #ON ACTION "CANCEL"
    #	EXIT MENU

      
    COMMAND KEY (F12)
    	EXIT MENU		

  END MENU

	CLOSE WINDOW winAttributeDisplayAt

END FUNCTION