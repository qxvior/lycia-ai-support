#########################################################################################################
# Attributes Demo
#
# Color Demo - Menu Item 3
#
# Modification History:
# 29.11.06 HH - V3 - Extracted from gd_color.4gl
#########################################################################################################
#
# attribute_demo_menu() is the main control block
#

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"


DEFINE
	adRec_T01 RECORD  #! Record adRec_T01 - form fields record   
			t01_fc11 VARCHAR(20),
			t01_fc12 VARCHAR(20),
			t01_fc13 VARCHAR(20),
			t01_fc14 VARCHAR(20),
			t01_fc15 VARCHAR(20),
			t01_fc16 VARCHAR(20),
			t01_fc17 VARCHAR(20),
			t01_fc18 VARCHAR(20),
			t01_fc19 VARCHAR(20),
			t01_fc20 VARCHAR(20)
		END RECORD		
		
#! Color atributes
DEFINE colAttributeArr ARRAY[10,5] OF CHAR(12)
#! Array of states Display or Not the values into fields  		
DEFINE colDisplayInitState ARRAY[10] OF BOOLEAN
												
############################################################
#! attribute_demo_menu() is the main control block
# FUNCTION attribute_demo_menu()
############################################################
FUNCTION attribute_demo_menu()
  DEFINE
    inp_char CHAR,
    loopState SMALLINT,
    colWin WINDOW,
		formObject ui.Form    
    
#  CALL fgl_window_open("w_attribute",1,1,24,80,0)


	#Init Variables
	CALL initColAttributeArr()
    CALL init_field_variables()

	CALL colWin.openWithForm("w_color_attributes",get_form_path("gd_f_attributes_detailed_2_2"),1,1,"","")
	CALL colWin.setImage("icon32/col_chart02.ico")
	CALL colWin.setText(get_str(830) || " - " || get_str(832))
	
	LET formObject = colWin.getForm()	
	
	#show the black tab-page by default
  CALL display_text_to_fields(1) --color_4gl(1)
        
  LET loopState = TRUE

  WHILE loopState = TRUE
    PROMPT "" FOR CHAR inp_char HELP 1
      BEFORE PROMPT
        CALL publish_toolbar("gd_col_3",0)
				#BEFORE DIALOG
				CALL fgl_setkeylabel("ACCEPT","","")
				CALL fgl_setkeylabel("INTERRUPT","","")        
				#CALL ui.Interface.refresh()

			ON ACTION "actInput_t01"
				CALL formObject.ensureFieldVisible("t01_TabPage")
				CALL attribDemoInput_Tab01()
				
			ON ACTION "actInput_t02"
				CALL formObject.ensureFieldVisible("t02_TabPage")			
				CALL attribDemoInput_Tab02()
			
			ON ACTION "actInput_t03"
				CALL formObject.ensureFieldVisible("t03_TabPage")			
				CALL attribDemoInput_Tab03()
			
			ON ACTION "actInput_t04"
				CALL formObject.ensureFieldVisible("t04_TabPage")    			
				CALL attribDemoInput_Tab04()
			
			ON ACTION "actInput_t05"
				CALL formObject.ensureFieldVisible("t05_TabPage")    			
				CALL attribDemoInput_Tab05()
			
			ON ACTION "actInput_t06"
				CALL formObject.ensureFieldVisible("t06_TabPage")    			
				CALL attribDemoInput_Tab06()
			
			ON ACTION "actInput_t07"
				CALL formObject.ensureFieldVisible("t07_TabPage")    			
				CALL attribDemoInput_Tab07()
			
			ON ACTION "actInput_t08"
				CALL formObject.ensureFieldVisible("t08_TabPage")    			
				CALL attribDemoInput_Tab08()
			
			
			
      ON KEY (F621)
				CALL formObject.ensureFieldVisible("t01_TabPage")       
        CALL display_text_to_fields(1) --CALL color_4gl(1)

      ON KEY (F622) 
				CALL formObject.ensureFieldVisible("t02_TabPage")      
        CALL display_text_to_fields(2) --CALL color_4gl(2)

      ON KEY (F623) 
				CALL formObject.ensureFieldVisible("t03_TabPage")      
        CALL display_text_to_fields(3) -- CALL color_4gl(3)

      ON KEY (F624) 
				CALL formObject.ensureFieldVisible("t04_TabPage")          
        CALL display_text_to_fields(4) --CALL color_4gl(4)

      ON KEY (F625) 
				CALL formObject.ensureFieldVisible("t05_TabPage")          
        CALL display_text_to_fields(5) -- CALL color_4gl(5)

      ON KEY (F626) 
				CALL formObject.ensureFieldVisible("t06_TabPage")          
        CALL display_text_to_fields(6) -- CALL color_4gl(6)

      ON KEY (F627) 
				CALL formObject.ensureFieldVisible("t07_TabPage")          
        CALL display_text_to_fields(7) --CALL color_4gl(7)

      ON KEY (F628) 
				CALL formObject.ensureFieldVisible("t08_TabPage")          
        CALL display_text_to_fields(8) --CALL color_4gl(8)

      #ON KEY (F629) 
			#	CALL formObject.ensureFieldVisible("t09_TabPage")          
      #  CALL display_text_to_fields(9) --CALL color_4gl(9)

      #ON KEY (F630) 
			#	CALL formObject.ensureFieldVisible("t10_TabPage")          
      #  CALL display_text_to_fields(10) --CALL color_4gl(10)

      ON ACTION actExitModule
         LET loopState = 0
      ON KEY (F11) 
        LET loopState = 0
      AFTER PROMPT
        CALL publish_toolbar("gd_col_3",1)
    END PROMPT

  END WHILE

  #CALL fgl_window_close("w_attribute")

	CALL colWin.close()
	
	
END FUNCTION

############################################################
#!FUNCTION color_4gl() transfers color code to FUNCTION display_text_to_fields() 
# FUNCTION color_4gl()
############################################################
FUNCTION color_4gl(color_code)
  DEFINE 
    color_code SMALLINT,
    color_name VARCHAR(20),
    ret SMALLINT,
    formName STRING
      
 # OPTIONS FORM LINE 3
  #CALL init_field_variables()

  #LET color_name = get_color_name(color_code)

	#LET formName = "gd_f_attributes_", trim(color_name), "_2"
	#LET formFile = get_form_path(formName")

	


  #the titlebar text changes for each color/form
  #CALL fgl_settitle(get_str(830) || " - " || get_str(833))


  #CALL display_form_4gl_color(color_code)  --should no longer be required 10.2.2014
  #CALL display_labels_4gl(color_code)
  CALL display_text_to_fields(color_code)

  #CALL user_control_color_display_to_4gl_attrib_4gl(color_code)

  #LET color_name = get_color_name(color_code)


  #LET ret = fgl_window_close("w_" || color_name)

#  OPTIONS FORM LINE 3

END FUNCTION


#############################################################################
#!FUNCTION initColAttributeArr() Initialize color attribute array
#############################################################################
FUNCTION initColAttributeArr()
	DEFINE i SMALLINT
   

	FOR i = 1 TO 5
		LET colAttributeArr[1,i] = get_str(801),"-", trim(i)
		LET colAttributeArr[2,i] = get_str(802),"-", trim(i)
		LET colAttributeArr[3,i] = get_str(803),"-", trim(i)
		LET colAttributeArr[4,i] = get_str(804),"-", trim(i)
		LET colAttributeArr[5,i] = get_str(805),"-", trim(i)
		LET colAttributeArr[6,i] = get_str(806),"-", trim(i)
		LET colAttributeArr[7,i] = get_str(807),"-", trim(i)
		LET colAttributeArr[8,i] = get_str(808),"-", trim(i)
		LET colAttributeArr[9,i] = get_str(809),"-", trim(i)
		LET colAttributeArr[10,i] = get_str(810),"-", trim(i)
		
	END FOR			
	
	FOR i = 1 TO 10
		LET colDisplayInitState[i] = FALSE
	END FOR		
END FUNCTION


##########################################################################
#! FUNCTION init_field_variables() 
#! function to initialize the displayed strings (fields and field labels)
########################################################################## 
FUNCTION init_field_variables()

{
  LET adRec_T01.fc11 = get_str(801) --"Default"
  LET adRec_T01.fc12 = get_str(802) --"Bold"
  LET adRec_T01.fc13 = get_str(803) --"Reverse"
  LET adRec_T01.fc14 = get_str(804) --"Underline"
  LET adRec_T01.fc15 = get_str(805) --"Blink"
  LET adRec_T01.fc16 = get_str(806) --"Dim"
  LET adRec_T01.fc17 = get_str(807) --"Un-Bo"
  LET adRec_T01.fc18 = get_str(808) --"Un-Re"
  LET adRec_T01.fc19 = get_str(809) --"Un-Bo-Re"
  LET adRec_T01.fc20 = get_str(810) --"Re-Bo"

  LET fcsa11 = adRec_T01.fc11 --"Default"
  LET fcsa12 = adRec_T01.fc12 --"Bold"
  LET fcsa13 = adRec_T01.fc13 --"Reverse"
  LET fcsa14 = adRec_T01.fc14 --"Underline"
  LET fcsa15 = adRec_T01.fc15 --"Blink"
  LET fcsa16 = adRec_T01.fc16 --"Dim"
  LET fcsa17 = adRec_T01.fc17 --"Un-Bo"
  LET fcsa18 = adRec_T01.fc18 --"Un-Re"
  LET fcsa19 = adRec_T01.fc19 --"Un-Bo-Re"
  LET fcsa20 = adRec_T01.fc20 --"Re-Bo"
}

  LET fc11 = get_str(801) --"Default"
  LET fc12 = get_str(802) --"Bold"
  LET fc13 = get_str(803) --"Reverse"
  LET fc14 = get_str(804) --"Underline"
  LET fc15 = get_str(805) --"Blink"
  LET fc16 = get_str(806) --"Dim"
  LET fc17 = get_str(807) --"Un-Bo"
  LET fc18 = get_str(808) --"Un-Re"
  LET fc19 = get_str(809) --"Un-Bo-Re"
  LET fc20 = get_str(810) --"Re-Bo"
{
  LET fcsa11 = get_str(801) --"Default"
  LET fcsa12 = get_str(802) --"Bold"
  LET fcsa13 = get_str(803) --"Reverse"
  LET fcsa14 = get_str(804) --"Underline"
  LET fcsa15 = get_str(805) --"Blink"
  LET fcsa16 = get_str(806) --"Dim"
  LET fcsa17 = get_str(807) --"Un-Bo"
  LET fcsa18 = get_str(808) --"Un-Re"
  LET fcsa19 = get_str(809) --"Un-Bo-Re"
  LET fcsa20 = get_str(810) --"Re-Bo"

}
  LET fc31 = fc11 --"Default"
  LET fc32 = fc12 --"Bold"
  LET fc33 = fc13 --"Reverse"
  LET fc34 = fc14 --"Underline"
  LET fc35 = fc15 --"Blink"
  LET fc36 = fc16 --"Dim"
  LET fc37 = fc17 --"Un-Bo"
  LET fc38 = fc18 --"Un-Re"
  LET fc39 = fc19 --"Un-Bo-Re"
  LET fc40 = fc20 --"Re-Bo"
{
  LET fcsa31 = get_str(801) --"Default"
  LET fcsa32 = get_str(802) --"Bold"
  LET fcsa33 = get_str(803) --"Reverse"
  LET fcsa34 = get_str(804) --"Underline"
  LET fcsa35 = get_str(805) --"Blink"
  LET fcsa36 = get_str(806) --"Dim"
  LET fcsa37 = get_str(807) --"Un-Bo"
  LET fcsa38 = get_str(808) --"Un-Re"
  LET fcsa39 = get_str(809) --"Un-Bo-Re"
  LET fcsa40 = get_str(810) --"Re-Bo"

}
  LET fc51 = fc11 --"Default"
  LET fc52 = fc12 --"Bold"
  LET fc53 = fc13 --"Reverse"
  LET fc54 = fc14 --"Underline"
  LET fc55 = fc15 --"Blink"
  LET fc56 = fc16 --"Dim"
  LET fc57 = fc17 --"Un-Bo"
  LET fc58 = fc18 --"Un-Re"
  LET fc59 = fc19 --"Un-Bo-Re"
  LET fc60 = fc20 --"Re-Bo"
{
  LET fcsa51 = get_str(801) --"Default"
  LET fcsa52 = get_str(802) --"Bold"
  LET fcsa53 = get_str(803) --"Reverse"
  LET fcsa54 = get_str(804) --"Underline"
  LET fcsa55 = get_str(805) --"Blink"
  LET fcsa56 = get_str(806) --"Dim"
  LET fcsa57 = get_str(807) --"Un-Bo"
  LET fcsa58 = get_str(808) --"Un-Re"
  LET fcsa59 = get_str(809) --"Un-Bo-Re"
  LET fcsa60 = get_str(810) --"Re-Bo"
}
END FUNCTION

FUNCTION get_color_name(color_code)
  DEFINE 
    color_code SMALLINT,
    color_name VARCHAR(20)

  CASE color_code
    WHEN 1
      LET color_name = get_str(811) --"black"
    WHEN 2
      LET color_name = get_str(812) --"blue"
    WHEN 3
      LET color_name = get_str(813) --"cyan"
    WHEN 4
      LET color_name = get_str(814) --"green"
    WHEN 5
      LET color_name = get_str(815) --"magenta"
    WHEN 6
      LET color_name = get_str(816) --"red"
    WHEN 7
      LET color_name = get_str(817) --"white"
    WHEN 8
      LET color_name = get_str(818) --"yellow"
    #WHEN 9
    #  LET color_name = get_str(819) --"normal"
    #WHEN 10
    #  LET color_name = get_str(820) --"other"
    OTHERWISE
      CALL fgl_winmessage(get_str(821),get_str(822) || "\n" || color_code, "error")
      LET color_name = "<unknown_colour>"
  END CASE

RETURN color_name

END FUNCTION

############################################################
# FUNCTION display_form_4gl_color(color_code)
############################################################
FUNCTION display_form_4gl_color(color_code)
  DEFINE 
    color_code SMALLINT,
    win_name VARCHAR(100),
    color_name VARCHAR(20),
    ret SMALLINT

  LET color_name = get_color_name(color_code)

  #CALL fgl_form_open("f_" || color_name, "form/gd_f_attributes_" || color_name)
  #CALL fgl_form_display("f_" || color_name)
  CALL fgl_settitle(get_str(830) || " - " || get_str(833) || " - " || color_name)

END FUNCTION

{
############################################################
# FUNCTION display_labels_4gl()
############################################################
FUNCTION display_labels_4gl(color_code)
  DEFINE 
    color_code    SMALLINT,
    col_01,col_02 SMALLINT,
    str VARCHAR(100)
  LET col_01 = 28
  LET col_02 = 54


  CASE color_code

    WHEN 1 --Black
      #Black
      #DISPLAY fc11                   AT 5 , 1 attribute(BLACK)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(BLACK,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(BLACK,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(BLACK,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(BLACK, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(BLACK,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(BLACK,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(BLACK,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(BLACK,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(BLACK,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO t01_dl_1       ATTRIBUTE(BLACK)
      DISPLAY  fc12     TO t01_dl_2       ATTRIBUTE(BLACK, BOLD)  
      DISPLAY  fc13     TO t01_dl_3       ATTRIBUTE(BLACK, REVERSE)
      DISPLAY  fc14     TO t01_dl_4       ATTRIBUTE(BLACK, UNDERLINE)
      DISPLAY  fc15     TO t01_dl_5       ATTRIBUTE(BLACK, BLINK)
      DISPLAY  fc16     TO t01_dl_6       ATTRIBUTE(BLACK, DIM)
      DISPLAY  fc17     TO t01_dl_7       ATTRIBUTE(BLACK, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t01_dl_8       ATTRIBUTE(BLACK, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t01_dl_9       ATTRIBUTE(BLACK, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t01_dl_10      ATTRIBUTE(BLACK, REVERSE, BOLD)

    WHEN 2
      #BLUE
      #DISPLAY fc11                   AT 5 , 1 attribute(BLUE)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(BLUE,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(BLUE,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(BLUE,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(BLUE, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(BLUE,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(BLUE,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(BLUE,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(BLUE,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(BLUE,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO t02_dl_1       ATTRIBUTE(BLUE)
      DISPLAY  fc12     TO t02_dl_2       ATTRIBUTE(BLUE, BOLD)  
      DISPLAY  fc13     TO t02_dl_3       ATTRIBUTE(BLUE, REVERSE)
      DISPLAY  fc14     TO t02_dl_4       ATTRIBUTE(BLUE, UNDERLINE)
      DISPLAY  fc15     TO t02_dl_5       ATTRIBUTE(BLUE, BLINK)
      DISPLAY  fc16     TO t02_dl_6       ATTRIBUTE(BLUE, DIM)
      DISPLAY  fc17     TO t02_dl_7       ATTRIBUTE(BLUE, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t02_dl_8       ATTRIBUTE(BLUE, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t02_dl_9       ATTRIBUTE(BLUE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t02_dl_10      ATTRIBUTE(BLUE, REVERSE, BOLD)

    WHEN 3  --CYAN
      #CYAN
      #DISPLAY fc11                   AT 5 , 1 attribute(CYAN)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(CYAN,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(CYAN,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(CYAN,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(CYAN, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(CYAN,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(CYAN,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(CYAN,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(CYAN,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(CYAN,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO t03_dl_1       ATTRIBUTE(CYAN)
      DISPLAY  fc12     TO t03_dl_2       ATTRIBUTE(CYAN, BOLD)  
      DISPLAY  fc13     TO t03_dl_3       ATTRIBUTE(CYAN, REVERSE)
      DISPLAY  fc14     TO t03_dl_4       ATTRIBUTE(CYAN, UNDERLINE)
      DISPLAY  fc15     TO t03_dl_5       ATTRIBUTE(CYAN, BLINK)
      DISPLAY  fc16     TO t03_dl_6       ATTRIBUTE(CYAN, DIM)
      DISPLAY  fc17     TO t03_dl_7       ATTRIBUTE(CYAN, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t03_dl_8       ATTRIBUTE(CYAN, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t03_dl_9       ATTRIBUTE(CYAN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t03_dl_10      ATTRIBUTE(CYAN, REVERSE, BOLD)

    WHEN 4 --GREEN
      #GREEN
      #DISPLAY fc11                   AT 5 , 1 attribute(GREEN)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(GREEN,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(GREEN,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(GREEN,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(GREEN, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(GREEN,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(GREEN,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(GREEN,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(GREEN,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(GREEN,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(GREEN)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(GREEN, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(GREEN, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(GREEN, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(GREEN, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(GREEN, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(GREEN, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(GREEN, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(GREEN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(GREEN, REVERSE, BOLD)

    WHEN 5  --Magenta
      #MAGENTA
      #DISPLAY fc11                   AT 5 , 1 attribute(MAGENTA)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(MAGENTA,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(MAGENTA,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(MAGENTA,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(MAGENTA, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(MAGENTA,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(MAGENTA,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(MAGENTA,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(MAGENTA,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(MAGENTA,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(MAGENTA)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(MAGENTA, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(MAGENTA, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(MAGENTA, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(MAGENTA, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(MAGENTA, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(MAGENTA, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(MAGENTA, REVERSE, BOLD)

    WHEN 6  --RED
      #RED
      #DISPLAY fc11                   AT 5 , 1 attribute(RED)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(RED,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(RED,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(RED,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(RED, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(RED,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(RED,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(RED,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(RED,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(RED,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(RED)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(RED, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(RED, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(RED, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(RED, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(RED, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(RED, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(RED, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(RED, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(RED, REVERSE, BOLD)

    WHEN 7  --WHITE
      #WHITE
      #DISPLAY fc11                   AT 5 , 1 attribute(WHITE)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(WHITE,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(WHITE,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(WHITE,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(WHITE, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(WHITE,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(WHITE,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(WHITE,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(WHITE,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(WHITE,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(WHITE)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(WHITE, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(WHITE, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(WHITE, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(WHITE, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(WHITE, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(WHITE, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(WHITE, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(WHITE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(WHITE, REVERSE, BOLD)

    WHEN 8  --YELLOW
      #YELLOW
      #DISPLAY fc11                   AT 5 , 1 attribute(YELLOW)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(YELLOW,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(YELLOW,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(YELLOW,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(YELLOW, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(YELLOW,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(YELLOW,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(YELLOW,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(YELLOW,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(YELLOW,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(YELLOW)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(YELLOW, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(YELLOW, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(YELLOW, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(YELLOW, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(YELLOW, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(YELLOW, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(YELLOW, REVERSE, BOLD)


    WHEN 9  --NORMAL
      #NORMAL
      #DISPLAY fc11                   AT 5 , 1 attribute(NORMAL)   --Default
      #DISPLAY fc12                   AT 7 , 1 attribute(NORMAL,BOLD)   --Bold
      #DISPLAY fc13                   AT 9 , 1 attribute(NORMAL,REVERSE) --Reverse
      #DISPLAY fc14                   AT 11, 1 attribute(NORMAL,UNDERLINE) --Underline
      #DISPLAY fc15                   AT 13, 1 attribute(NORMAL, BLINK) --Blink
      #DISPLAY fc16                   AT 15, 1 attribute(NORMAL,DIM) --Dim
      #DISPLAY fc17                   AT 17, 1 attribute(NORMAL,UNDERLINE, BOLD)  --Un-Bo 
      #DISPLAY fc18                   AT 19, 1 attribute(NORMAL,UNDERLINE, REVERSE) --Un-Re
      #DISPLAY fc19                   AT 21, 1 attribute(NORMAL,UNDERLINE, BOLD, REVERSE) --Un-Bo-Re
      #DISPLAY fc20                   AT 23, 1 attribute(NORMAL,REVERSE,BOLD) --Re-Bo

      DISPLAY  fc11     TO dl_1       ATTRIBUTE(NORMAL)
      DISPLAY  fc12     TO dl_2       ATTRIBUTE(NORMAL, BOLD)  
      DISPLAY  fc13     TO dl_3       ATTRIBUTE(NORMAL, REVERSE)
      DISPLAY  fc14     TO dl_4       ATTRIBUTE(NORMAL, UNDERLINE)
      DISPLAY  fc15     TO dl_5       ATTRIBUTE(NORMAL, BLINK)
      DISPLAY  fc16     TO dl_6       ATTRIBUTE(NORMAL, DIM)
      DISPLAY  fc17     TO dl_7       ATTRIBUTE(NORMAL, UNDERLINE,BOLD)
      DISPLAY  fc18     TO dl_8       ATTRIBUTE(NORMAL, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO dl_9       ATTRIBUTE(NORMAL, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO dl_10      ATTRIBUTE(NORMAL, REVERSE, BOLD)

    OTHERWISE
      CALL fgl_winmessage(get_str(823),get_str(824) || "\n" || color_code,"stop")

  END CASE

END FUNCTION
}

##########################################################################
#! FUNCTION display_text_to_fields(color_code)
#! Fill out the form with preset colors
########################################################################## 
FUNCTION display_text_to_fields(color_code)
  DEFINE color_code SMALLINT

	IF colDisplayInitState[color_code] = TRUE THEN
		RETURN
	ELSE
		LET colDisplayInitState[color_code] = TRUE
	END IF
				
  CASE color_code

    WHEN 1  -- BLACK


			#Label text
      DISPLAY  fc11     TO t01_dl_1       ATTRIBUTE(BLACK)
      DISPLAY  fc12     TO t01_dl_2       ATTRIBUTE(BLACK, BOLD)  
      DISPLAY  fc13     TO t01_dl_3       ATTRIBUTE(BLACK, REVERSE)
      DISPLAY  fc14     TO t01_dl_4       ATTRIBUTE(BLACK, UNDERLINE)
      DISPLAY  fc15     TO t01_dl_5       ATTRIBUTE(BLACK, BLINK)
      DISPLAY  fc16     TO t01_dl_6       ATTRIBUTE(BLACK, DIM)
      DISPLAY  fc17     TO t01_dl_7       ATTRIBUTE(BLACK, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t01_dl_8       ATTRIBUTE(BLACK, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t01_dl_9       ATTRIBUTE(BLACK, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t01_dl_10      ATTRIBUTE(BLACK, REVERSE, BOLD)
      
      
			#Column 1 - single field
      DISPLAY  fc11    TO t01_fc11       ATTRIBUTE(BLACK)
      DISPLAY  fc12    TO t01_fc12       ATTRIBUTE(BLACK, BOLD)  
      DISPLAY  fc13    TO t01_fc13       ATTRIBUTE(BLACK, REVERSE)
      DISPLAY  fc14    TO t01_fc14       ATTRIBUTE(BLACK, UNDERLINE)
      DISPLAY  fc15    TO t01_fc15       ATTRIBUTE(BLACK, BLINK)
      DISPLAY  fc16    TO t01_fc16       ATTRIBUTE(BLACK, DIM)
      DISPLAY  fc17    TO t01_fc17       ATTRIBUTE(BLACK, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t01_fc18       ATTRIBUTE(BLACK, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t01_fc19       ATTRIBUTE(BLACK, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t01_fc20       ATTRIBUTE(BLACK, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t01_fc31       --ATTRIBUTE(BLACK)
			DISPLAY  fc32    TO t01_fc32       --ATTRIBUTE(BLACK, BOLD)  
			DISPLAY  fc33    TO t01_fc33       --ATTRIBUTE(BLACK, REVERSE)
			DISPLAY  fc34    TO t01_fc34       --ATTRIBUTE(BLACK, UNDERLINE)
			DISPLAY  fc35    TO t01_fc35       --ATTRIBUTE(BLACK, BLINK)
			DISPLAY  fc36    TO t01_fc36       --ATTRIBUTE(BLACK, DIM)
			DISPLAY  fc37    TO t01_fc37       --ATTRIBUTE(BLACK, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t01_fc38       --ATTRIBUTE(BLACK, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t01_fc39       --ATTRIBUTE(BLACK, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t01_fc40       --ATTRIBUTE(BLACK, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t01_fc51       --ATTRIBUTE(BLACK)
			DISPLAY  fc52    TO t01_fc52       --ATTRIBUTE(BLACK, BOLD)  
			DISPLAY  fc53    TO t01_fc53       --ATTRIBUTE(BLACK, REVERSE)
			DISPLAY  fc54    TO t01_fc54       --ATTRIBUTE(BLACK, UNDERLINE)
			DISPLAY  fc55    TO t01_fc55       --ATTRIBUTE(BLACK, BLINK)
			DISPLAY  fc56    TO t01_fc56       --ATTRIBUTE(BLACK, DIM)
			DISPLAY  fc57    TO t01_fc57       --ATTRIBUTE(BLACK, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t01_fc58       --ATTRIBUTE(BLACK, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t01_fc59       --ATTRIBUTE(BLACK, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t01_fc60       --ATTRIBUTE(BLACK, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t01_sc11.*
        ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t01_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t01_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t01_sc12.*
        ATTRIBUTE (BLACK, BOLD, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t01_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t01_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t01_sc13.*
        ATTRIBUTE (BLACK, REVERSE, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t01_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t01_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t01_sc14.*
        ATTRIBUTE (BLACK, UNDERLINE, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t01_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t01_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t01_sc15.*
        ATTRIBUTE (BLACK, BLINK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t01_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t01_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t01_sc16.*
        ATTRIBUTE (BLACK, DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t01_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t01_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t01_sc17.*
        ATTRIBUTE (BLACK, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t01_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t01_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t01_sc18.*
        ATTRIBUTE (BLACK, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t01_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t01_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t01_sc19.*
        ATTRIBUTE (BLACK, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t01_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t01_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t01_sc20.*
        ATTRIBUTE (BLACK, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t01_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t01_sc60.*
        WITHOUT SCROLL
          
      

    WHEN 2  -- BLUE


				
			#Label Text
      DISPLAY  fc11     TO t02_dl_1       ATTRIBUTE(BLUE)
      DISPLAY  fc12     TO t02_dl_2       ATTRIBUTE(BLUE, BOLD)  
      DISPLAY  fc13     TO t02_dl_3       ATTRIBUTE(BLUE, REVERSE)
      DISPLAY  fc14     TO t02_dl_4       ATTRIBUTE(BLUE, UNDERLINE)
      DISPLAY  fc15     TO t02_dl_5       ATTRIBUTE(BLUE, BLINK)
      DISPLAY  fc16     TO t02_dl_6       ATTRIBUTE(BLUE, DIM)
      DISPLAY  fc17     TO t02_dl_7       ATTRIBUTE(BLUE, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t02_dl_8       ATTRIBUTE(BLUE, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t02_dl_9       ATTRIBUTE(BLUE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t02_dl_10      ATTRIBUTE(BLUE, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t02_fc11       ATTRIBUTE(BLUE)
      DISPLAY  fc12    TO t02_fc12       ATTRIBUTE(BLUE, BOLD)  
      DISPLAY  fc13    TO t02_fc13       ATTRIBUTE(BLUE, REVERSE)
      DISPLAY  fc14    TO t02_fc14       ATTRIBUTE(BLUE, UNDERLINE)
      DISPLAY  fc15    TO t02_fc15       ATTRIBUTE(BLUE, BLINK)
      DISPLAY  fc16    TO t02_fc16       ATTRIBUTE(BLUE, DIM)
      DISPLAY  fc17    TO t02_fc17       ATTRIBUTE(BLUE, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t02_fc18       ATTRIBUTE(BLUE, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t02_fc19       ATTRIBUTE(BLUE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t02_fc20       ATTRIBUTE(BLUE, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t02_fc31       --ATTRIBUTE(BLUE)
			DISPLAY  fc32    TO t02_fc32       --ATTRIBUTE(BLUE, BOLD)  
			DISPLAY  fc33    TO t02_fc33       --ATTRIBUTE(BLUE, REVERSE)
			DISPLAY  fc34    TO t02_fc34       --ATTRIBUTE(BLUE, UNDERLINE)
			DISPLAY  fc35    TO t02_fc35       --ATTRIBUTE(BLUE, BLINK)
			DISPLAY  fc36    TO t02_fc36       --ATTRIBUTE(BLUE, DIM)
			DISPLAY  fc37    TO t02_fc37       --ATTRIBUTE(BLUE, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t02_fc38       --ATTRIBUTE(BLUE, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t02_fc39       --ATTRIBUTE(BLUE, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t02_fc40       --ATTRIBUTE(BLUE, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t02_fc51       --ATTRIBUTE(BLUE)
			DISPLAY  fc52    TO t02_fc52       --ATTRIBUTE(BLUE, BOLD)  
			DISPLAY  fc53    TO t02_fc53       --ATTRIBUTE(BLUE, REVERSE)
			DISPLAY  fc54    TO t02_fc54       --ATTRIBUTE(BLUE, UNDERLINE)
			DISPLAY  fc55    TO t02_fc55       --ATTRIBUTE(BLUE, BLINK)
			DISPLAY  fc56    TO t02_fc56       --ATTRIBUTE(BLUE, DIM)
			DISPLAY  fc57    TO t02_fc57       --ATTRIBUTE(BLUE, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t02_fc58       --ATTRIBUTE(BLUE, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t02_fc59       --ATTRIBUTE(BLUE, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t02_fc60       --ATTRIBUTE(BLUE, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t02_sc11.*
        ATTRIBUTE (BLUE, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t02_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t02_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t02_sc12.*
        ATTRIBUTE (BLUE, BOLD, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t02_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t02_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t02_sc13.*
        ATTRIBUTE (BLUE, REVERSE, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t02_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t02_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t02_sc14.*
        ATTRIBUTE (BLUE, UNDERLINE, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t02_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t02_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t02_sc15.*
        ATTRIBUTE (BLUE, BLINK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t02_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t02_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t02_sc16.*
        ATTRIBUTE (BLUE, DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t02_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t02_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t02_sc17.*
        ATTRIBUTE (BLUE, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t02_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t02_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t02_sc18.*
        ATTRIBUTE (BLUE, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t02_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t02_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t02_sc19.*
        ATTRIBUTE (BLUE, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t02_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t02_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t02_sc20.*
        ATTRIBUTE (BLUE, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t02_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t02_sc60.*
        WITHOUT SCROLL
        

		#######################################################################
    WHEN 3  -- CYAN


			#Label Text
      DISPLAY  fc11     TO t03_dl_1       ATTRIBUTE(CYAN)
      DISPLAY  fc12     TO t03_dl_2       ATTRIBUTE(CYAN, BOLD)  
      DISPLAY  fc13     TO t03_dl_3       ATTRIBUTE(CYAN, REVERSE)
      DISPLAY  fc14     TO t03_dl_4       ATTRIBUTE(CYAN, UNDERLINE)
      DISPLAY  fc15     TO t03_dl_5       ATTRIBUTE(CYAN, BLINK)
      DISPLAY  fc16     TO t03_dl_6       ATTRIBUTE(CYAN, DIM)
      DISPLAY  fc17     TO t03_dl_7       ATTRIBUTE(CYAN, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t03_dl_8       ATTRIBUTE(CYAN, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t03_dl_9       ATTRIBUTE(CYAN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t03_dl_10      ATTRIBUTE(CYAN, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t03_fc11       ATTRIBUTE(CYAN)
      DISPLAY  fc12    TO t03_fc12       ATTRIBUTE(CYAN, BOLD)  
      DISPLAY  fc13    TO t03_fc13       ATTRIBUTE(CYAN, REVERSE)
      DISPLAY  fc14    TO t03_fc14       ATTRIBUTE(CYAN, UNDERLINE)
      DISPLAY  fc15    TO t03_fc15       ATTRIBUTE(CYAN, BLINK)
      DISPLAY  fc16    TO t03_fc16       ATTRIBUTE(CYAN, DIM)
      DISPLAY  fc17    TO t03_fc17       ATTRIBUTE(CYAN, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t03_fc18       ATTRIBUTE(CYAN, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t03_fc19       ATTRIBUTE(CYAN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t03_fc20       ATTRIBUTE(CYAN, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t03_fc31       --ATTRIBUTE(CYAN)
			DISPLAY  fc32    TO t03_fc32       --ATTRIBUTE(CYAN, BOLD)  
			DISPLAY  fc33    TO t03_fc33       --ATTRIBUTE(CYAN, REVERSE)
			DISPLAY  fc34    TO t03_fc34       --ATTRIBUTE(CYAN, UNDERLINE)
			DISPLAY  fc35    TO t03_fc35       --ATTRIBUTE(CYAN, BLINK)
			DISPLAY  fc36    TO t03_fc36       --ATTRIBUTE(CYAN, DIM)
			DISPLAY  fc37    TO t03_fc37       --ATTRIBUTE(CYAN, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t03_fc38       --ATTRIBUTE(CYAN, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t03_fc39       --ATTRIBUTE(CYAN, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t03_fc40       --ATTRIBUTE(CYAN, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t03_fc51       --ATTRIBUTE(CYAN)
			DISPLAY  fc52    TO t03_fc52       --ATTRIBUTE(CYAN, BOLD)  
			DISPLAY  fc53    TO t03_fc53       --ATTRIBUTE(CYAN, REVERSE)
			DISPLAY  fc54    TO t03_fc54       --ATTRIBUTE(CYAN, UNDERLINE)
			DISPLAY  fc55    TO t03_fc55       --ATTRIBUTE(CYAN, BLINK)
			DISPLAY  fc56    TO t03_fc56       --ATTRIBUTE(CYAN, DIM)
			DISPLAY  fc57    TO t03_fc57       --ATTRIBUTE(CYAN, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t03_fc58       --ATTRIBUTE(CYAN, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t03_fc59       --ATTRIBUTE(CYAN, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t03_fc60       --ATTRIBUTE(CYAN, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t03_sc11.*
        ATTRIBUTE (CYAN, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t03_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t03_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t03_sc12.*
        ATTRIBUTE (CYAN, BOLD, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t03_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t03_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t03_sc13.*
        ATTRIBUTE (CYAN, REVERSE, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t03_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t03_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t03_sc14.*
        ATTRIBUTE (CYAN, UNDERLINE, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t03_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t03_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t03_sc15.*
        ATTRIBUTE (CYAN, BLINK, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t03_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t03_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t03_sc16.*
        ATTRIBUTE (CYAN, DIM, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t03_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t03_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t03_sc17.*
        ATTRIBUTE (CYAN, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t03_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t03_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t03_sc18.*
        ATTRIBUTE (CYAN, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t03_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t03_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t03_sc19.*
        ATTRIBUTE (CYAN, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t03_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t03_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t03_sc20.*
        ATTRIBUTE (CYAN, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "CYAN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t03_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t03_sc60.*
        WITHOUT SCROLL


    WHEN 4  -- GREEN

			#Label Text
      DISPLAY  fc11     TO t04_dl_1       ATTRIBUTE(GREEN)
      DISPLAY  fc12     TO t04_dl_2       ATTRIBUTE(GREEN, BOLD)  
      DISPLAY  fc13     TO t04_dl_3       ATTRIBUTE(GREEN, REVERSE)
      DISPLAY  fc14     TO t04_dl_4       ATTRIBUTE(GREEN, UNDERLINE)
      DISPLAY  fc15     TO t04_dl_5       ATTRIBUTE(GREEN, BLINK)
      DISPLAY  fc16     TO t04_dl_6       ATTRIBUTE(GREEN, DIM)
      DISPLAY  fc17     TO t04_dl_7       ATTRIBUTE(GREEN, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t04_dl_8       ATTRIBUTE(GREEN, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t04_dl_9       ATTRIBUTE(GREEN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t04_dl_10      ATTRIBUTE(GREEN, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t04_fc11       ATTRIBUTE(GREEN)
      DISPLAY  fc12    TO t04_fc12       ATTRIBUTE(GREEN, BOLD)  
      DISPLAY  fc13    TO t04_fc13       ATTRIBUTE(GREEN, REVERSE)
      DISPLAY  fc14    TO t04_fc14       ATTRIBUTE(GREEN, UNDERLINE)
      DISPLAY  fc15    TO t04_fc15       ATTRIBUTE(GREEN, BLINK)
      DISPLAY  fc16    TO t04_fc16       ATTRIBUTE(GREEN, DIM)
      DISPLAY  fc17    TO t04_fc17       ATTRIBUTE(GREEN, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t04_fc18       ATTRIBUTE(GREEN, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t04_fc19       ATTRIBUTE(GREEN, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t04_fc20       ATTRIBUTE(GREEN, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t04_fc31       --ATTRIBUTE(GREEN)
			DISPLAY  fc32    TO t04_fc32       --ATTRIBUTE(GREEN, BOLD)  
			DISPLAY  fc33    TO t04_fc33       --ATTRIBUTE(GREEN, REVERSE)
			DISPLAY  fc34    TO t04_fc34       --ATTRIBUTE(GREEN, UNDERLINE)
			DISPLAY  fc35    TO t04_fc35       --ATTRIBUTE(GREEN, BLINK)
			DISPLAY  fc36    TO t04_fc36       --ATTRIBUTE(GREEN, DIM)
			DISPLAY  fc37    TO t04_fc37       --ATTRIBUTE(GREEN, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t04_fc38       --ATTRIBUTE(GREEN, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t04_fc39       --ATTRIBUTE(GREEN, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t04_fc40       --ATTRIBUTE(GREEN, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t04_fc51       --ATTRIBUTE(GREEN)
			DISPLAY  fc52    TO t04_fc52       --ATTRIBUTE(GREEN, BOLD)  
			DISPLAY  fc53    TO t04_fc53       --ATTRIBUTE(GREEN, REVERSE)
			DISPLAY  fc54    TO t04_fc54       --ATTRIBUTE(GREEN, UNDERLINE)
			DISPLAY  fc55    TO t04_fc55       --ATTRIBUTE(GREEN, BLINK)
			DISPLAY  fc56    TO t04_fc56       --ATTRIBUTE(GREEN, DIM)
			DISPLAY  fc57    TO t04_fc57       --ATTRIBUTE(GREEN, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t04_fc58       --ATTRIBUTE(GREEN, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t04_fc59       --ATTRIBUTE(GREEN, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t04_fc60       --ATTRIBUTE(GREEN, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t04_sc11.*
        ATTRIBUTE (GREEN, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t04_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t04_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t04_sc12.*
        ATTRIBUTE (GREEN, BOLD, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t04_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t04_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t04_sc13.*
        ATTRIBUTE (GREEN, REVERSE, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t04_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t04_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t04_sc14.*
        ATTRIBUTE (GREEN, UNDERLINE, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t04_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t04_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t04_sc15.*
        ATTRIBUTE (GREEN, BLINK, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t04_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t04_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t04_sc16.*
        ATTRIBUTE (GREEN, DIM, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t04_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t04_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t04_sc17.*
        ATTRIBUTE (GREEN, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t04_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t04_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t04_sc18.*
        ATTRIBUTE (GREEN, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t04_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t04_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t04_sc19.*
        ATTRIBUTE (GREEN, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t04_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t04_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t04_sc20.*
        ATTRIBUTE (GREEN, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "GREEN")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t04_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t04_sc60.*
        WITHOUT SCROLL



    WHEN 5  -- MAGENTA

			#Label Text
      DISPLAY  fc11     TO t05_dl_1       ATTRIBUTE(MAGENTA)
      DISPLAY  fc12     TO t05_dl_2       ATTRIBUTE(MAGENTA, BOLD)  
      DISPLAY  fc13     TO t05_dl_3       ATTRIBUTE(MAGENTA, REVERSE)
      DISPLAY  fc14     TO t05_dl_4       ATTRIBUTE(MAGENTA, UNDERLINE)
      DISPLAY  fc15     TO t05_dl_5       ATTRIBUTE(MAGENTA, BLINK)
      DISPLAY  fc16     TO t05_dl_6       ATTRIBUTE(MAGENTA, DIM)
      DISPLAY  fc17     TO t05_dl_7       ATTRIBUTE(MAGENTA, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t05_dl_8       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t05_dl_9       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t05_dl_10      ATTRIBUTE(MAGENTA, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t05_fc11       ATTRIBUTE(MAGENTA)
      DISPLAY  fc12    TO t05_fc12       ATTRIBUTE(MAGENTA, BOLD)  
      DISPLAY  fc13    TO t05_fc13       ATTRIBUTE(MAGENTA, REVERSE)
      DISPLAY  fc14    TO t05_fc14       ATTRIBUTE(MAGENTA, UNDERLINE)
      DISPLAY  fc15    TO t05_fc15       ATTRIBUTE(MAGENTA, BLINK)
      DISPLAY  fc16    TO t05_fc16       ATTRIBUTE(MAGENTA, DIM)
      DISPLAY  fc17    TO t05_fc17       ATTRIBUTE(MAGENTA, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t05_fc18       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t05_fc19       ATTRIBUTE(MAGENTA, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t05_fc20       ATTRIBUTE(MAGENTA, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t05_fc31       --ATTRIBUTE(MAGENTA)
			DISPLAY  fc32    TO t05_fc32       --ATTRIBUTE(MAGENTA, BOLD)  
			DISPLAY  fc33    TO t05_fc33       --ATTRIBUTE(MAGENTA, REVERSE)
			DISPLAY  fc34    TO t05_fc34       --ATTRIBUTE(MAGENTA, UNDERLINE)
			DISPLAY  fc35    TO t05_fc35       --ATTRIBUTE(MAGENTA, BLINK)
			DISPLAY  fc36    TO t05_fc36       --ATTRIBUTE(MAGENTA, DIM)
			DISPLAY  fc37    TO t05_fc37       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t05_fc38       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t05_fc39       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t05_fc40       --ATTRIBUTE(MAGENTA, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t05_fc51       --ATTRIBUTE(MAGENTA)
			DISPLAY  fc52    TO t05_fc52       --ATTRIBUTE(MAGENTA, BOLD)  
			DISPLAY  fc53    TO t05_fc53       --ATTRIBUTE(MAGENTA, REVERSE)
			DISPLAY  fc54    TO t05_fc54       --ATTRIBUTE(MAGENTA, UNDERLINE)
			DISPLAY  fc55    TO t05_fc55       --ATTRIBUTE(MAGENTA, BLINK)
			DISPLAY  fc56    TO t05_fc56       --ATTRIBUTE(MAGENTA, DIM)
			DISPLAY  fc57    TO t05_fc57       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t05_fc58       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t05_fc59       --ATTRIBUTE(MAGENTA, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t05_fc60       --ATTRIBUTE(MAGENTA, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t05_sc11.*
        ATTRIBUTE (MAGENTA, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t05_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t05_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t05_sc12.*
        ATTRIBUTE (MAGENTA, BOLD, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t05_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t05_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t05_sc13.*
        ATTRIBUTE (MAGENTA, REVERSE, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t05_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t05_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t05_sc14.*
        ATTRIBUTE (MAGENTA, UNDERLINE, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t05_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t05_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t05_sc15.*
        ATTRIBUTE (MAGENTA, BLINK, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t05_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t05_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t05_sc16.*
        ATTRIBUTE (MAGENTA, DIM, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t05_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t05_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t05_sc17.*
        ATTRIBUTE (MAGENTA, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t05_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t05_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t05_sc18.*
        ATTRIBUTE (MAGENTA, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t05_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t05_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t05_sc19.*
        ATTRIBUTE (MAGENTA, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t05_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t05_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t05_sc20.*
        ATTRIBUTE (MAGENTA, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "MAGENTA")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t05_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t05_sc60.*
        WITHOUT SCROLL


    WHEN 6  -- RED

			#Label Text
      DISPLAY  fc11     TO t06_dl_1       ATTRIBUTE(RED)
      DISPLAY  fc12     TO t06_dl_2       ATTRIBUTE(RED, BOLD)  
      DISPLAY  fc13     TO t06_dl_3       ATTRIBUTE(RED, REVERSE)
      DISPLAY  fc14     TO t06_dl_4       ATTRIBUTE(RED, UNDERLINE)
      DISPLAY  fc15     TO t06_dl_5       ATTRIBUTE(RED, BLINK)
      DISPLAY  fc16     TO t06_dl_6       ATTRIBUTE(RED, DIM)
      DISPLAY  fc17     TO t06_dl_7       ATTRIBUTE(RED, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t06_dl_8       ATTRIBUTE(RED, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t06_dl_9       ATTRIBUTE(RED, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t06_dl_10      ATTRIBUTE(RED, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t06_fc11       ATTRIBUTE(RED)
      DISPLAY  fc12    TO t06_fc12       ATTRIBUTE(RED, BOLD)  
      DISPLAY  fc13    TO t06_fc13       ATTRIBUTE(RED, REVERSE)
      DISPLAY  fc14    TO t06_fc14       ATTRIBUTE(RED, UNDERLINE)
      DISPLAY  fc15    TO t06_fc15       ATTRIBUTE(RED, BLINK)
      DISPLAY  fc16    TO t06_fc16       ATTRIBUTE(RED, DIM)
      DISPLAY  fc17    TO t06_fc17       ATTRIBUTE(RED, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t06_fc18       ATTRIBUTE(RED, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t06_fc19       ATTRIBUTE(RED, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t06_fc20       ATTRIBUTE(RED, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t06_fc31       --ATTRIBUTE(RED)
			DISPLAY  fc32    TO t06_fc32       --ATTRIBUTE(RED, BOLD)  
			DISPLAY  fc33    TO t06_fc33       --ATTRIBUTE(RED, REVERSE)
			DISPLAY  fc34    TO t06_fc34       --ATTRIBUTE(RED, UNDERLINE)
			DISPLAY  fc35    TO t06_fc35       --ATTRIBUTE(RED, BLINK)
			DISPLAY  fc36    TO t06_fc36       --ATTRIBUTE(RED, DIM)
			DISPLAY  fc37    TO t06_fc37       --ATTRIBUTE(RED, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t06_fc38       --ATTRIBUTE(RED, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t06_fc39       --ATTRIBUTE(RED, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t06_fc40       --ATTRIBUTE(RED, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t06_fc51       --ATTRIBUTE(RED)
			DISPLAY  fc52    TO t06_fc52       --ATTRIBUTE(RED, BOLD)  
			DISPLAY  fc53    TO t06_fc53       --ATTRIBUTE(RED, REVERSE)
			DISPLAY  fc54    TO t06_fc54       --ATTRIBUTE(RED, UNDERLINE)
			DISPLAY  fc55    TO t06_fc55       --ATTRIBUTE(RED, BLINK)
			DISPLAY  fc56    TO t06_fc56       --ATTRIBUTE(RED, DIM)
			DISPLAY  fc57    TO t06_fc57       --ATTRIBUTE(RED, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t06_fc58       --ATTRIBUTE(RED, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t06_fc59       --ATTRIBUTE(RED, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t06_fc60       --ATTRIBUTE(RED, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t06_sc11.*
        ATTRIBUTE (RED, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t06_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t06_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t06_sc12.*
        ATTRIBUTE (RED, BOLD, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t06_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t06_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t06_sc13.*
        ATTRIBUTE (RED, REVERSE, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t06_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t06_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t06_sc14.*
        ATTRIBUTE (RED, UNDERLINE, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t06_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t06_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t06_sc15.*
        ATTRIBUTE (RED, BLINK, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t06_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t06_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t06_sc16.*
        ATTRIBUTE (RED, DIM, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t06_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t06_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t06_sc17.*
        ATTRIBUTE (RED, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t06_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t06_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t06_sc18.*
        ATTRIBUTE (RED, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t06_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t06_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t06_sc19.*
        ATTRIBUTE (RED, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t06_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t06_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t06_sc20.*
        ATTRIBUTE (RED, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t06_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t06_sc60.*
        WITHOUT SCROLL



    WHEN 7  -- WHITE
			#Label Text
      DISPLAY  fc11     TO t07_dl_1       ATTRIBUTE(WHITE)
      DISPLAY  fc12     TO t07_dl_2       ATTRIBUTE(WHITE, BOLD)  
      DISPLAY  fc13     TO t07_dl_3       ATTRIBUTE(WHITE, REVERSE)
      DISPLAY  fc14     TO t07_dl_4       ATTRIBUTE(WHITE, UNDERLINE)
      DISPLAY  fc15     TO t07_dl_5       ATTRIBUTE(WHITE, BLINK)
      DISPLAY  fc16     TO t07_dl_6       ATTRIBUTE(WHITE, DIM)
      DISPLAY  fc17     TO t07_dl_7       ATTRIBUTE(WHITE, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t07_dl_8       ATTRIBUTE(WHITE, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t07_dl_9       ATTRIBUTE(WHITE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t07_dl_10      ATTRIBUTE(WHITE, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t07_fc11       ATTRIBUTE(WHITE)
      DISPLAY  fc12    TO t07_fc12       ATTRIBUTE(WHITE, BOLD)  
      DISPLAY  fc13    TO t07_fc13       ATTRIBUTE(WHITE, REVERSE)
      DISPLAY  fc14    TO t07_fc14       ATTRIBUTE(WHITE, UNDERLINE)
      DISPLAY  fc15    TO t07_fc15       ATTRIBUTE(WHITE, BLINK)
      DISPLAY  fc16    TO t07_fc16       ATTRIBUTE(WHITE, DIM)
      DISPLAY  fc17    TO t07_fc17       ATTRIBUTE(WHITE, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t07_fc18       ATTRIBUTE(WHITE, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t07_fc19       ATTRIBUTE(WHITE, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t07_fc20       ATTRIBUTE(WHITE, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t07_fc31       --ATTRIBUTE(WHITE)
			DISPLAY  fc32    TO t07_fc32       --ATTRIBUTE(WHITE, BOLD)  
			DISPLAY  fc33    TO t07_fc33       --ATTRIBUTE(WHITE, REVERSE)
			DISPLAY  fc34    TO t07_fc34       --ATTRIBUTE(WHITE, UNDERLINE)
			DISPLAY  fc35    TO t07_fc35       --ATTRIBUTE(WHITE, BLINK)
			DISPLAY  fc36    TO t07_fc36       --ATTRIBUTE(WHITE, DIM)
			DISPLAY  fc37    TO t07_fc37       --ATTRIBUTE(WHITE, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t07_fc38       --ATTRIBUTE(WHITE, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t07_fc39       --ATTRIBUTE(WHITE, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t07_fc40       --ATTRIBUTE(WHITE, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t07_fc51       --ATTRIBUTE(WHITE)
			DISPLAY  fc52    TO t07_fc52       --ATTRIBUTE(WHITE, BOLD)  
			DISPLAY  fc53    TO t07_fc53       --ATTRIBUTE(WHITE, REVERSE)
			DISPLAY  fc54    TO t07_fc54       --ATTRIBUTE(WHITE, UNDERLINE)
			DISPLAY  fc55    TO t07_fc55       --ATTRIBUTE(WHITE, BLINK)
			DISPLAY  fc56    TO t07_fc56       --ATTRIBUTE(WHITE, DIM)
			DISPLAY  fc57    TO t07_fc57       --ATTRIBUTE(WHITE, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t07_fc58       --ATTRIBUTE(WHITE, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t07_fc59       --ATTRIBUTE(WHITE, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t07_fc60       --ATTRIBUTE(WHITE, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t07_sc11.*
        ATTRIBUTE (WHITE, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t07_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t07_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t07_sc12.*
        ATTRIBUTE (WHITE, BOLD, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t07_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t07_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t07_sc13.*
        ATTRIBUTE (WHITE, REVERSE, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t07_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t07_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t07_sc14.*
        ATTRIBUTE (WHITE, UNDERLINE, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t07_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t07_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t07_sc15.*
        ATTRIBUTE (WHITE, BLINK, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t07_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t07_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t07_sc16.*
        ATTRIBUTE (WHITE, DIM, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t07_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t07_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t07_sc17.*
        ATTRIBUTE (WHITE, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t07_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t07_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t07_sc18.*
        ATTRIBUTE (WHITE, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t07_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t07_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t07_sc19.*
        ATTRIBUTE (WHITE, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t07_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t07_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t07_sc20.*
        ATTRIBUTE (WHITE, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "WHITE")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t07_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t07_sc60.*
        WITHOUT SCROLL


    WHEN 8  -- YELLOW
			#Label Text
      DISPLAY  fc11     TO t08_dl_1       ATTRIBUTE(YELLOW)
      DISPLAY  fc12     TO t08_dl_2       ATTRIBUTE(YELLOW, BOLD)  
      DISPLAY  fc13     TO t08_dl_3       ATTRIBUTE(YELLOW, REVERSE)
      DISPLAY  fc14     TO t08_dl_4       ATTRIBUTE(YELLOW, UNDERLINE)
      DISPLAY  fc15     TO t08_dl_5       ATTRIBUTE(YELLOW, BLINK)
      DISPLAY  fc16     TO t08_dl_6       ATTRIBUTE(YELLOW, DIM)
      DISPLAY  fc17     TO t08_dl_7       ATTRIBUTE(YELLOW, UNDERLINE,BOLD)
      DISPLAY  fc18     TO t08_dl_8       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE)
      DISPLAY  fc19     TO t08_dl_9       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20     TO t08_dl_10      ATTRIBUTE(YELLOW, REVERSE, BOLD)
      
			#Column 1 - single field
      DISPLAY  fc11    TO t08_fc11       ATTRIBUTE(YELLOW)
      DISPLAY  fc12    TO t08_fc12       ATTRIBUTE(YELLOW, BOLD)  
      DISPLAY  fc13    TO t08_fc13       ATTRIBUTE(YELLOW, REVERSE)
      DISPLAY  fc14    TO t08_fc14       ATTRIBUTE(YELLOW, UNDERLINE)
      DISPLAY  fc15    TO t08_fc15       ATTRIBUTE(YELLOW, BLINK)
      DISPLAY  fc16    TO t08_fc16       ATTRIBUTE(YELLOW, DIM)
      DISPLAY  fc17    TO t08_fc17       ATTRIBUTE(YELLOW, UNDERLINE,BOLD)
      DISPLAY  fc18    TO t08_fc18       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO t08_fc19       ATTRIBUTE(YELLOW, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO t08_fc20       ATTRIBUTE(YELLOW, REVERSE,BOLD)

			# for second column - attributes will be handeled in the form definition
			#	ANY Color  (Color independent display stuff)
			DISPLAY  fc31    TO t08_fc31       --ATTRIBUTE(YELLOW)
			DISPLAY  fc32    TO t08_fc32       --ATTRIBUTE(YELLOW, BOLD)  
			DISPLAY  fc33    TO t08_fc33       --ATTRIBUTE(YELLOW, REVERSE)
			DISPLAY  fc34    TO t08_fc34       --ATTRIBUTE(YELLOW, UNDERLINE)
			DISPLAY  fc35    TO t08_fc35       --ATTRIBUTE(YELLOW, BLINK)
			DISPLAY  fc36    TO t08_fc36       --ATTRIBUTE(YELLOW, DIM)
			DISPLAY  fc37    TO t08_fc37       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD)
			DISPLAY  fc38    TO t08_fc38       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc39    TO t08_fc39       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD,DIM)
			DISPLAY  fc40    TO t08_fc40       --ATTRIBUTE(YELLOW, REVERSE,DIM)


			# For third column
			# Attributes will be handeled by display form attributes

			DISPLAY  fc51    TO t08_fc51       --ATTRIBUTE(YELLOW)
			DISPLAY  fc52    TO t08_fc52       --ATTRIBUTE(YELLOW, BOLD)  
			DISPLAY  fc53    TO t08_fc53       --ATTRIBUTE(YELLOW, REVERSE)
			DISPLAY  fc54    TO t08_fc54       --ATTRIBUTE(YELLOW, UNDERLINE)
			DISPLAY  fc55    TO t08_fc55       --ATTRIBUTE(YELLOW, BLINK)
			DISPLAY  fc56    TO t08_fc56       --ATTRIBUTE(YELLOW, DIM)
			DISPLAY  fc57    TO t08_fc57       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD)
			DISPLAY  fc58    TO t08_fc58       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD,BLINK)
			DISPLAY  fc59    TO t08_fc59       --ATTRIBUTE(YELLOW, UNDERLINE,BOLD,DIM)
			DISPLAY  fc60    TO t08_fc60       --ATTRIBUTE(YELLOW, REVERSE,DIM)


  		CALL set_count(5)
      DISPLAY ARRAY colAttributeArr[1] TO t08_sc11.*
        ATTRIBUTE (YELLOW, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t08_sc31.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[1] TO t08_sc51.*
        WITHOUT SCROLL


      DISPLAY ARRAY colAttributeArr[2] TO t08_sc12.*
        ATTRIBUTE (YELLOW, BOLD, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t08_sc32.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[2] TO t08_sc52.*
        WITHOUT SCROLL
        

      DISPLAY ARRAY colAttributeArr[3] TO t08_sc13.*
        ATTRIBUTE (YELLOW, REVERSE, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t08_sc33.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[3] TO t08_sc53.*
        WITHOUT SCROLL

      DISPLAY ARRAY colAttributeArr[4] TO t08_sc14.*
        ATTRIBUTE (YELLOW, UNDERLINE, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t08_sc34.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[4] TO t08_sc54.*
        WITHOUT SCROLL             


      DISPLAY ARRAY colAttributeArr[5] TO t08_sc15.*
        ATTRIBUTE (YELLOW, BLINK, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t08_sc35.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[5] TO t08_sc55.*
        WITHOUT SCROLL  



      DISPLAY ARRAY colAttributeArr[6] TO t08_sc16.*
        ATTRIBUTE (YELLOW, DIM, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t08_sc36.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[6] TO t08_sc56.*
        WITHOUT SCROLL 
        
 
      DISPLAY ARRAY colAttributeArr[7] TO t08_sc17.*
        ATTRIBUTE (YELLOW, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t08_sc37.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[7] TO t08_sc57.*
        WITHOUT SCROLL        
 
  
      DISPLAY ARRAY colAttributeArr[8] TO t08_sc18.*
        ATTRIBUTE (YELLOW, UNDERLINE,BOLD,BLINK, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t08_sc38.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[8] TO t08_sc58.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[9] TO t08_sc19.*
        ATTRIBUTE (YELLOW, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t08_sc39.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[9] TO t08_sc59.*
        WITHOUT SCROLL      

  
      DISPLAY ARRAY colAttributeArr[10] TO t08_sc20.*
        ATTRIBUTE (YELLOW, UNDERLINE,BOLD,DIM, CURRENT ROW DISPLAY = "YELLOW")
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t08_sc40.*
        WITHOUT SCROLL
      DISPLAY ARRAY colAttributeArr[10] TO t08_sc60.*
        WITHOUT SCROLL

{

    WHEN 9  -- NORMAL
      DISPLAY  fc11    TO fc11       ATTRIBUTE(NORMAL)
      DISPLAY  fc12    TO fc12       ATTRIBUTE(NORMAL, BOLD)  
      DISPLAY  fc13    TO fc13       ATTRIBUTE(NORMAL, REVERSE)
      DISPLAY  fc14    TO fc14       ATTRIBUTE(NORMAL, UNDERLINE)
      DISPLAY  fc15    TO fc15       ATTRIBUTE(NORMAL, BLINK)
      DISPLAY  fc16    TO fc16       ATTRIBUTE(NORMAL, DIM)
      DISPLAY  fc17    TO fc17       ATTRIBUTE(NORMAL, UNDERLINE,BOLD)
      DISPLAY  fc18    TO fc18       ATTRIBUTE(NORMAL, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO fc19       ATTRIBUTE(NORMAL, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO fc20       ATTRIBUTE(NORMAL, REVERSE,BOLD)


      CALL col_array_init("Default")
      DISPLAY ARRAY col_arr TO sc11.*
        ATTRIBUTE (NORMAL, CURRENT ROW DISPLAY = "RED")
        WITHOUT SCROLL

      CALL col_array_init("Bold")
      DISPLAY ARRAY col_arr TO sc12.*
        ATTRIBUTE (NORMAL, BOLD, CURRENT ROW DISPLAY = "RED, BOLD")
        WITHOUT SCROLL

      CALL col_array_init("Reverse")
      DISPLAY ARRAY col_arr TO sc13.*
        ATTRIBUTE (NORMAL, REVERSE, CURRENT ROW DISPLAY = "RED, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Underline")
      DISPLAY ARRAY col_arr TO sc14.*
        ATTRIBUTE (NORMAL, UNDERLINE, CURRENT ROW DISPLAY = "RED, UNDERLINE")
        WITHOUT SCROLL

      CALL col_array_init("Blink")
      DISPLAY ARRAY col_arr TO sc15.*
        ATTRIBUTE (NORMAL, BLINK, CURRENT ROW DISPLAY = "RED, BLINK")
        WITHOUT SCROLL

      CALL col_array_init("Dim")
      DISPLAY ARRAY col_arr TO sc16.*
        ATTRIBUTE (NORMAL, DIM, CURRENT ROW DISPLAY = "RED, DIM")
        WITHOUT SCROLL

      CALL col_array_init("Un-Bo")
      DISPLAY ARRAY col_arr TO sc17.*
        ATTRIBUTE (NORMAL, UNDERLINE, BOLD, CURRENT ROW DISPLAY = "RED, UNDERLINE, BOLD")
        WITHOUT SCROLL

      CALL col_array_init("Un-Re")
      DISPLAY ARRAY col_arr TO sc18.*
        ATTRIBUTE (NORMAL, UNDERLINE, REVERSE, CURRENT ROW DISPLAY = "RED, UNDERLINE, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Un-Bo-Re")
      DISPLAY ARRAY col_arr TO sc19.*
        ATTRIBUTE (NORMAL, UNDERLINE,BOLD,REVERSE, CURRENT ROW DISPLAY = "RED, UNDERLINE, BOLD, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Re-Bo")
      DISPLAY ARRAY col_arr TO sc20.*
        ATTRIBUTE (NORMAL, REVERSE, BOLD, CURRENT ROW DISPLAY = "RED, REVERSE, BOLD")
        WITHOUT SCROLL


    WHEN 10  -- Other i.e. password and hidden

  
      DISPLAY  fc11    TO fc11       ATTRIBUTE(BLACK)
      DISPLAY  fc12    TO fc12       ATTRIBUTE(BLACK, BOLD)  
      DISPLAY  fc13    TO fc13       ATTRIBUTE(BLACK, REVERSE)
      DISPLAY  fc14    TO fc14       ATTRIBUTE(BLACK, UNDERLINE)
      DISPLAY  fc15    TO fc15       ATTRIBUTE(BLACK, BLINK)
      DISPLAY  fc16    TO fc16       ATTRIBUTE(BLACK, DIM)
      DISPLAY  fc17    TO fc17       ATTRIBUTE(BLACK, UNDERLINE,BOLD)
      DISPLAY  fc18    TO fc18       ATTRIBUTE(BLACK, UNDERLINE,REVERSE)
      DISPLAY  fc19    TO fc19       ATTRIBUTE(BLACK, UNDERLINE,REVERSE,BOLD)
      DISPLAY  fc20    TO fc20       ATTRIBUTE(BLACK, REVERSE,BOLD)


      CALL col_array_init("Default")
      DISPLAY ARRAY col_arr TO sc11.*
        ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE")
        WITHOUT SCROLL

      CALL col_array_init("Bold")
      DISPLAY ARRAY col_arr TO sc12.*
        ATTRIBUTE (BLACK, BOLD, CURRENT ROW DISPLAY = "BLUE, BOLD")
        WITHOUT SCROLL

      CALL col_array_init("Reverse")
      DISPLAY ARRAY col_arr TO sc13.*
        ATTRIBUTE (BLACK, REVERSE, CURRENT ROW DISPLAY = "BLUE, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Underline")
      DISPLAY ARRAY col_arr TO sc14.*
        ATTRIBUTE (BLACK, UNDERLINE, CURRENT ROW DISPLAY = "BLUE, UNDERLINE")
        WITHOUT SCROLL

      CALL col_array_init("Blink")
      DISPLAY ARRAY col_arr TO sc15.*
        ATTRIBUTE (BLACK, BLINK, CURRENT ROW DISPLAY = "BLUE, BLINK")
        WITHOUT SCROLL

      CALL col_array_init("Dim")
      DISPLAY ARRAY col_arr TO sc16.*
        ATTRIBUTE (BLACK, DIM, CURRENT ROW DISPLAY = "BLUE, DIM")
        WITHOUT SCROLL

      CALL col_array_init("Un-Bo")
      DISPLAY ARRAY col_arr TO sc17.*
        ATTRIBUTE (BLACK, UNDERLINE, BOLD, CURRENT ROW DISPLAY = "BLUE, UNDERLINE, BOLD")
        WITHOUT SCROLL

      CALL col_array_init("Un-Re")
      DISPLAY ARRAY col_arr TO sc18.*
        ATTRIBUTE (BLACK, UNDERLINE, REVERSE, CURRENT ROW DISPLAY = "BLUE, UNDERLINE, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Un-Bo-Re")
      DISPLAY ARRAY col_arr TO sc19.*
        ATTRIBUTE (BLACK, UNDERLINE,BOLD,REVERSE, CURRENT ROW DISPLAY = "BLUE, UNDERLINE, BOLD, REVERSE")
        WITHOUT SCROLL

      CALL col_array_init("Re-Bo")
      DISPLAY ARRAY col_arr TO sc20.*
        ATTRIBUTE (BLACK, REVERSE, BOLD, CURRENT ROW DISPLAY = "BLUE, REVERSE, BOLD")
        WITHOUT SCROLL
}

    OTHERWISE
      CALL fgl_winmessage(get_str(825),get_str(826) || "/n" || color_code, "error")

  END CASE




END FUNCTION


{

############################################################
# FUNCTION user_control_color_display_to_4gl_attrib_4gl(color_code)
############################################################
FUNCTION user_control_color_display_to_4gl_attrib_4gl(color_code)
  DEFINE 
    color_code, loopState SMALLINT,
    user_input integer,
    inpchar CHAR

  LET loopState = TRUE


	
  #WHILE (loop_exit = 0)
  WHILE loopState = TRUE  --(TRUE)
#    LET user_input = fgl_getkey()


    PROMPT "" FOR CHAR inpchar HELP 2
      BEFORE PROMPT
        CALL publish_toolbar("gd_col_3",0)


			
    ON KEY (F621) --fgl_winmessage()
      LET loopState = 0
      CALL fgl_key_queue(fgl_keyval("F621"))

    ON KEY (F622) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F622"))
      LET loopState = 0


    ON KEY (F623) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F623"))
      LET loopState = 0

    ON KEY (F624) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F624"))
      LET loopState = 0

    ON KEY (F625) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F625"))
      LET loopState = 0

    ON KEY (F626) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F626"))
      LET loopState = 0

    ON KEY (F627) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F627"))
      LET loopState = 0

    ON KEY (F628) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F628"))
      LET loopState = 0

    ON KEY (F629) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F629"))
      LET loopState = 0

    ON KEY (F630) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F630"))
      LET loopState = 0

    ON KEY (F11) --fgl_winquestion()
      CALL fgl_key_queue(fgl_keyval("F11"))
      LET loopState = 0


		#Tab t01 event section ##############################################################################

		ON ACTION "actInput_t01"
			CALL attribDemoInput_Tab01()

    ON KEY (F10)
			INPUT fc11 WITHOUT DEFAULTS FROM t01_fc11 ATTRIBUTES(BLACK) 
			END INPUT
			
		ON ACTION "act_t01_input_fc11"
			INPUT fc11 WITHOUT DEFAULTS FROM t01_fc11 ATTRIBUTES(BLACK) 
			END INPUT
			
		ON ACTION "act_t01_input_fc11x1"
			INPUT fc11 WITHOUT DEFAULTS FROM t01_fc11 ATTRIBUTES(BLACK) 
			END INPUT
			
		ON ACTION "act_t01_input_fc12"
			INPUT fc12 WITHOUT DEFAULTS FROM t01_fc12 ATTRIBUTES(BLACK,BOLD) 
			END INPUT
			
		ON ACTION "act_t01_input_fc13"
			INPUT fc13 WITHOUT DEFAULTS FROM t01_fc13 ATTRIBUTES(BLACK,REVERSE) 
			END INPUT

		ON ACTION "act_t01_input_fc14"
			INPUT fc14 WITHOUT DEFAULTS FROM t01_fc14 ATTRIBUTES(BLACK,UNDERLINE) 
			END INPUT

		ON ACTION "act_t01_input_fc15"
			INPUT fc15 WITHOUT DEFAULTS FROM t01_fc15 ATTRIBUTES(BLACK,BLINK) 
			END INPUT

		ON ACTION "act_t01_input_fc16"
			INPUT fc16 WITHOUT DEFAULTS FROM t01_fc16 ATTRIBUTES(BLACK,DIM) 
			END INPUT

		ON ACTION "act_t01_input_fc17"
			INPUT fc17 WITHOUT DEFAULTS FROM t01_fc17 ATTRIBUTES(BLACK,UNDERLINE,BOLD) 
			END INPUT

		ON ACTION "act_t01_input_fc18"
			INPUT fc18 WITHOUT DEFAULTS FROM t01_fc18 ATTRIBUTES(BLACK,UNDERLINE,REVERSE) 
			END INPUT

		ON ACTION "act_t01_input_fc19"
			INPUT fc19 WITHOUT DEFAULTS FROM t01_fc19 ATTRIBUTES(BLACK,UNDERLINE,BOLD,REVERSE) 
			END INPUT

		ON ACTION "act_t01_input_fc20"
			INPUT fc20 WITHOUT DEFAULTS FROM t01_fc20 ATTRIBUTES(BLACK,REVERSE,BOLD) 
			END INPUT




      -- 1st Column Single fields ------------------------------------------
      ON KEY ("F311")
        INPUT BY NAME fc11 WITHOUT DEFAULTS
          ATTRIBUTE (BLACK)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      ON KEY ("F312")
        INPUT BY NAME fc12 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, BOLD)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F313")
        INPUT BY NAME fc13 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, REVERSE)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F314")
        INPUT BY NAME fc14 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, UNDERLINE)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT
         
      ON KEY ("F315")
        INPUT BY NAME fc15 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, BLINK)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F316")
        INPUT BY NAME fc16 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, DIM)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F317")
        INPUT BY NAME fc17 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, BOLD, UNDERLINE)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F318")
        INPUT BY NAME fc18 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, BOLD, UNDERLINE,BLINK)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F319")
        INPUT BY NAME fc19 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK,UNDERLINE,REVERSE,BOLD)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F320")
        INPUT BY NAME fc20 WITHOUT DEFAULTS 
          ATTRIBUTE (BLACK, REVERSE, DIM)
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT
      --Input/Display Array Column 1-------------------------------------------------------------------
      ON KEY ("F321")
        CALL col_array_init("Default")
        DISPLAY ARRAY col_arr TO sc11.*
          ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT DISPLAY
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY


      ON KEY ("F331")
        CALL col_array_init("Default")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc11.*
          ATTRIBUTE (BLACK, CURRENT ROW DISPLAY = "BLUE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F322")
        CALL col_array_init("Bold")
        DISPLAY ARRAY col_arr TO sc12.*
          ATTRIBUTE (BLACK, BOLD,CURRENT ROW DISPLAY = "BLUE, BOLD")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F332")
        CALL col_array_init("Bold")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc12.*
          ATTRIBUTE (BLACK, BOLD, CURRENT ROW DISPLAY = "BLUE, BOLD")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F323")
        CALL col_array_init("Reverse")
        DISPLAY ARRAY col_arr TO sc13.*
          ATTRIBUTE (BLACK, REVERSE,CURRENT ROW DISPLAY = "BLUE, REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F333")
        CALL col_array_init("Reverse")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc13.*
          ATTRIBUTE (BLACK, REVERSE, CURRENT ROW DISPLAY = "BLUE, REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY ("F324")
        CALL col_array_init("Underline")
        DISPLAY ARRAY col_arr TO sc14.*
          ATTRIBUTE (BLACK, UNDERLINE,CURRENT ROW DISPLAY = "BLUE, UNDERLINE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F334")
        CALL col_array_init("Underline")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc14.*
          ATTRIBUTE (BLACK, UNDERLINE, CURRENT ROW DISPLAY = "BLUE, UNDERLINE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F325")
        CALL col_array_init("Blink")
        DISPLAY ARRAY col_arr TO sc15.*
          ATTRIBUTE (BLACK, BLINK, CURRENT ROW DISPLAY = "BLUE,BLINK")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY


      ON KEY ("F335")
        CALL col_array_init("Blink")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc15.*
          ATTRIBUTE (BLACK, BLINK, CURRENT ROW DISPLAY = "BLUE, BLINK")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F326")
        CALL col_array_init("Dim")
        DISPLAY ARRAY col_arr TO sc16.*
          ATTRIBUTE (BLACK, DIM,CURRENT ROW DISPLAY = "BLUE, DIM")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F336")
        CALL col_array_init("Dim")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc16.*
          ATTRIBUTE (BLACK, DIM, CURRENT ROW DISPLAY = "BLUE, DIM")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F327")
        CALL col_array_init("Und-Bol")
        DISPLAY ARRAY col_arr TO sc17.*
          ATTRIBUTE (BLACK, UNDERLINE,BOLD,CURRENT ROW DISPLAY = "BLUE, UNDERLINE,BOLD")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F337")
        CALL col_array_init("Und-Bol")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc17.*
          ATTRIBUTE (BLACK, UNDERLINE,BOLD, CURRENT ROW DISPLAY = "BLUE, UNDERLINE,BOLD")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT


      ON KEY ("F328")
        CALL col_array_init("Un-Re")
        DISPLAY ARRAY col_arr TO sc18.*
          ATTRIBUTE (BLACK, UNDERLINE,REVERSE,CURRENT ROW DISPLAY = "BLUE, UNDERLINE,REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F338")
        CALL col_array_init("Un-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc18.*
          ATTRIBUTE (BLACK, UNDERLINE,REVERSE,CURRENT ROW DISPLAY = "BLUE, UNDERLINE,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY ("F329")
        CALL col_array_init("Un-Bo-Re")
        DISPLAY ARRAY col_arr TO sc19.*
          ATTRIBUTE (BLACK, UNDERLINE,BOLD,REVERSE,CURRENT ROW DISPLAY = "BLUE, UNDERLINE,BOLD,REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F339")
        CALL col_array_init("Un-Bo-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc19.*
          ATTRIBUTE (BLACK, UNDERLINE,BOLD,REVERSE,CURRENT ROW DISPLAY = "BLUE, UNDERLINE,BOLD,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      ON KEY ("F330")
        CALL col_array_init("Re-Bo")
        DISPLAY ARRAY col_arr TO sc20.*
          ATTRIBUTE (BLACK, REVERSE,BOLD,CURRENT ROW DISPLAY = "BLUE, REVERSE,BOLD")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F340")
        CALL col_array_init("Re-Bo")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc20.*
          ATTRIBUTE (BLACK, REVERSE,BOLD,CURRENT ROW DISPLAY = "BLUE, REVERSE,BOLD")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT
        END INPUT

      -- 2nd Column Single fields ------------------------------------------
-- single fields
      ON KEY ("F341")
        INPUT BY NAME fc31 WITHOUT DEFAULTS
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      ON KEY ("F342")
        INPUT BY NAME fc32 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F343")
        INPUT BY NAME fc33 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F344")
        INPUT BY NAME fc34 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT
         
      ON KEY ("F345")
        INPUT BY NAME fc35 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F346")
        INPUT BY NAME fc36 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F347")
        INPUT BY NAME fc37 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F348")
        INPUT BY NAME fc38 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F349")
        INPUT BY NAME fc39 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F350")
        INPUT BY NAME fc40 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      --Input/Display Array Column 2-------------------------------------------------------------------
      ON KEY ("F351")
        CALL col_array_init("Default")
        DISPLAY ARRAY col_arr TO sc31.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE")
          ON KEY(F3)
            EXIT DISPLAY  
        END DISPLAY

      ON KEY ("F361")
        CALL col_array_init("Default")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc31.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      ON KEY ("F352")
        CALL col_array_init("Bold")
        DISPLAY ARRAY col_arr TO sc32.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,BOLD")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F362")
        CALL col_array_init("Bold")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc32.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,BOLD")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT



      ON KEY ("F353")
        CALL col_array_init("Reverse")
        DISPLAY ARRAY col_arr TO sc33.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F363")
        CALL col_array_init("Reverse")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc33.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F354")
        CALL col_array_init("Underline")
        DISPLAY ARRAY col_arr TO sc34.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F364")
        CALL col_array_init("Underline")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc34.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F355")
        CALL col_array_init("Blink")
        DISPLAY ARRAY col_arr TO sc35.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE, BLINK")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F365")
        CALL col_array_init("Blink")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc35.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,BLINK")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      ON KEY ("F356")
        CALL col_array_init("Dim")
        DISPLAY ARRAY col_arr TO sc36.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,DIM")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F366")
        CALL col_array_init("Dim")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc36.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,DIM")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F357")
        CALL col_array_init("Und-Bol")
        DISPLAY ARRAY col_arr TO sc37.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE, UNDERLINE,BOLD")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F367")
        CALL col_array_init("Und-Bol")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc37.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE,BOLD")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F358")
        CALL col_array_init("Un-Re")
        DISPLAY ARRAY col_arr TO sc38.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE, UNDERLINE,REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F368")
        CALL col_array_init("Un-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc38.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F359")
        CALL col_array_init("Un-Bo-Re")
        DISPLAY ARRAY col_arr TO sc39.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE,BOLD,REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F369")
        CALL col_array_init("Un-Bo-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc39.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,UNDERLINE,BOLD,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F360")
        CALL col_array_init("Re-Bo")
        DISPLAY ARRAY col_arr TO sc40.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,DIM, REVERSE")
          ON KEY(F3)
            EXIT DISPLAY
        END DISPLAY

      ON KEY ("F370")
        CALL col_array_init("Re-Bo")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc40.*
          ATTRIBUTE (CURRENT ROW DISPLAY = "BLUE,BOLD,REVERSE")
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      -- 3rd Column Single fields ---(SCRIPT section - do not send any attributes from 4gl or forms)-----------------------------------
      ON KEY ("F371")
        INPUT BY NAME fc51 WITHOUT DEFAULTS
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT


      ON KEY ("F372")
        INPUT BY NAME fc52 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F373")
        INPUT BY NAME fc53 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F374")
        INPUT BY NAME fc54 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT
         
      ON KEY ("F375")
        INPUT BY NAME fc55 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F376")
        INPUT BY NAME fc56 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F377")
        INPUT BY NAME fc57 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F378")
        INPUT BY NAME fc58 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F379")
        INPUT BY NAME fc59 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT

      ON KEY ("F380")
        INPUT BY NAME fc60 WITHOUT DEFAULTS 
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT 
        END INPUT
      --Input Array Column 3 -------------------------------------------------------------------
      ON KEY ("F381")
        CALL col_array_init("Default")
        DISPLAY ARRAY col_arr TO sc51.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F391")
        CALL col_array_init("Default")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc51.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F382")
        CALL col_array_init("Bold")
        DISPLAY ARRAY col_arr TO sc52.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F392")
        CALL col_array_init("Bold")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc52.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F383")
        CALL col_array_init("Reverse")
        DISPLAY ARRAY col_arr TO sc53.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F393")
        CALL col_array_init("Reverse")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc53.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F384")
        CALL col_array_init("Underline")
        DISPLAY ARRAY col_arr TO sc54.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F394")
        CALL col_array_init("Underline")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc54.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT


      ON KEY ("F385")
        CALL col_array_init("Blink")
        DISPLAY ARRAY col_arr TO sc55.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F395")
        CALL col_array_init("Blink")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc55.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F386")
        CALL col_array_init("Dim")
        DISPLAY ARRAY col_arr TO sc56.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F396")
        CALL col_array_init("Dim")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc56.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F387")
        CALL col_array_init("Un-Bo")
        DISPLAY ARRAY col_arr TO sc57.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F397")
        CALL col_array_init("Un-Bo")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc57.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F388")
        CALL col_array_init("Un-Re")
        DISPLAY ARRAY col_arr TO sc58.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F398")
        CALL col_array_init("Un-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc58.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F389")
        CALL col_array_init("Un-Bo-Re")
        DISPLAY ARRAY col_arr TO sc59.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F399")
        CALL col_array_init("Un-Bo-Re")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc59.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      ON KEY ("F390")
        CALL col_array_init("Re-Bo")
        DISPLAY ARRAY col_arr TO sc60.*
          ON KEY(F3)
            EXIT DISPLAY 
        END DISPLAY

      ON KEY ("F400")
        CALL col_array_init("Re-Bo")
        INPUT ARRAY col_arr WITHOUT DEFAULTS FROM sc60.*
          ON KEY(F10)
            CALL fgl_dialog_update_data()
            EXIT INPUT
          ON KEY(F3)
            EXIT INPUT  
        END INPUT

      AFTER PROMPT
        CALL publish_toolbar("gd_col_3",1)
    END PROMPT

  END WHILE

END FUNCTION
}

#######################################################################################################
#! FUNCTION attribDemoInput_Tab01() initialize first tab page with BLACK color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab01()

	DIALOG ATTRIBUTES(UNBUFFERED)
	
			
		INPUT fc11 WITHOUT DEFAULTS FROM t01_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t01_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t01_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t01_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t01_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t01_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t01_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t01_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t01_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t01_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t01_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t01_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t01_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t01_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t01_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t01_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t01_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t01_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t01_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t01_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t01_fc31,t01_fc32,t01_fc33,t01_fc34,t01_fc35,t01_fc36,t01_fc37,t01_fc38,t01_fc39,t01_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t01_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t01_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t01_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t01_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t01_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t01_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t01_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t01_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t01_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t01_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t01_fc51,t01_fc52,t01_fc53,t01_fc54,t01_fc55,t01_fc56,t01_fc57,t01_fc58,t01_fc59,t01_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t01_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t01_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t01_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t01_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t01_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t01_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t01_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t01_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t01_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t01_sc60.*  END INPUT			

#		BEFORE DIALOG
#		CALL fgl_setkeylabel("ACCEPT","","")
#		CALL fgl_setkeylabel("INTERRUPT","","")	
		
		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION




#######################################################################################################
#! FUNCTION attribDemoInput_Tab02() initialize first tab page with BLUE color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab02()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t02_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t02_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t02_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t02_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t02_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t02_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t02_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t02_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t02_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t02_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t02_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t02_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t02_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t02_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t02_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t02_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t02_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t02_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t02_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t02_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t02_fc31,t02_fc32,t02_fc33,t02_fc34,t02_fc35,t02_fc36,t02_fc37,t02_fc38,t02_fc39,t02_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t02_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t02_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t02_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t02_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t02_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t02_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t02_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t02_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t02_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t02_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t02_fc51,t02_fc52,t02_fc53,t02_fc54,t02_fc55,t02_fc56,t02_fc57,t02_fc58,t02_fc59,t02_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t02_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t02_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t02_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t02_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t02_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t02_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t02_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t02_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t02_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t02_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION



#######################################################################################################
#! FUNCTION attribDemoInput_Tab03() initialize first tab page with CYAN color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab03()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t03_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t03_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t03_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t03_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t03_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t03_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t03_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t03_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t03_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t03_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t03_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t03_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t03_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t03_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t03_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t03_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t03_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t03_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t03_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t03_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t03_fc31,t03_fc32,t03_fc33,t03_fc34,t03_fc35,t03_fc36,t03_fc37,t03_fc38,t03_fc39,t03_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t03_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t03_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t03_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t03_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t03_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t03_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t03_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t03_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t03_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t03_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t03_fc51,t03_fc52,t03_fc53,t03_fc54,t03_fc55,t03_fc56,t03_fc57,t03_fc58,t03_fc59,t03_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t03_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t03_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t03_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t03_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t03_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t03_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t03_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t03_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t03_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t03_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION



#######################################################################################################
#! FUNCTION attribDemoInput_Tab04() initialize first tab page with GREEN color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab04()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t04_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t04_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t04_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t04_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t04_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t04_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t04_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t04_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t04_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t04_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t04_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t04_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t04_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t04_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t04_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t04_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t04_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t04_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t04_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t04_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t04_fc31,t04_fc32,t04_fc33,t04_fc34,t04_fc35,t04_fc36,t04_fc37,t04_fc38,t04_fc39,t04_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t04_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t04_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t04_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t04_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t04_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t04_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t04_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t04_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t04_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t04_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t04_fc51,t04_fc52,t04_fc53,t04_fc54,t04_fc55,t04_fc56,t04_fc57,t04_fc58,t04_fc59,t04_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t04_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t04_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t04_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t04_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t04_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t04_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t04_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t04_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t04_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t04_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION



#######################################################################################################
#! FUNCTION attribDemoInput_Tab05() initialize first tab page with MAGENTA color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab05()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t05_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t05_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t05_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t05_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t05_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t05_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t05_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t05_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t05_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t05_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t05_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t05_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t05_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t05_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t05_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t05_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t05_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t05_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t05_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t05_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t05_fc31,t05_fc32,t05_fc33,t05_fc34,t05_fc35,t05_fc36,t05_fc37,t05_fc38,t05_fc39,t05_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t05_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t05_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t05_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t05_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t05_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t05_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t05_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t05_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t05_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t05_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t05_fc51,t05_fc52,t05_fc53,t05_fc54,t05_fc55,t05_fc56,t05_fc57,t05_fc58,t05_fc59,t05_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t05_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t05_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t05_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t05_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t05_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t05_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t05_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t05_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t05_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t05_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION


#######################################################################################################
#! FUNCTION attribDemoInput_Tab06() initialize first tab page with RED color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab06()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t06_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t06_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t06_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t06_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t06_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t06_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t06_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t06_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t06_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t06_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t06_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t06_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t06_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t06_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t06_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t06_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t06_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t06_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t06_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t06_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t06_fc31,t06_fc32,t06_fc33,t06_fc34,t06_fc35,t06_fc36,t06_fc37,t06_fc38,t06_fc39,t06_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t06_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t06_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t06_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t06_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t06_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t06_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t06_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t06_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t06_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t06_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t06_fc51,t06_fc52,t06_fc53,t06_fc54,t06_fc55,t06_fc56,t06_fc57,t06_fc58,t06_fc59,t06_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t06_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t06_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t06_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t06_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t06_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t06_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t06_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t06_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t06_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t06_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION


#######################################################################################################
#! FUNCTION attribDemoInput_Tab07() initialize first tab page with WHITE color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab07()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t07_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t07_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t07_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t07_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t07_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t07_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t07_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t07_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t07_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t07_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t07_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t07_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t07_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t07_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t07_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t07_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t07_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t07_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t07_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t07_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t07_fc31,t07_fc32,t07_fc33,t07_fc34,t07_fc35,t07_fc36,t07_fc37,t07_fc38,t07_fc39,t07_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t07_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t07_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t07_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t07_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t07_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t07_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t07_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t07_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t07_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t07_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t07_fc51,t07_fc52,t07_fc53,t07_fc54,t07_fc55,t07_fc56,t07_fc57,t07_fc58,t07_fc59,t07_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t07_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t07_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t07_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t07_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t07_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t07_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t07_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t07_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t07_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t07_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION



#######################################################################################################
#! FUNCTION attribDemoInput_Tab08() initialize first tab page with YELLOW color attribute
#######################################################################################################
FUNCTION attribDemoInput_Tab08()

	DIALOG ATTRIBUTES(UNBUFFERED)
		INPUT fc11 WITHOUT DEFAULTS FROM t08_fc11 ATTRIBUTE(BLACK) END INPUT
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t08_sc11.* END INPUT
				
		INPUT fc12 WITHOUT DEFAULTS FROM t08_fc12 ATTRIBUTE(BLACK, BOLD) END INPUT				
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t08_sc12.* ATTRIBUTE(BLACK, BOLD) END INPUT
		
		INPUT fc13 WITHOUT DEFAULTS FROM t08_fc13 ATTRIBUTE(BLACK, REVERSE) END INPUT				
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t08_sc13.* ATTRIBUTE(BLACK, REVERSE) END INPUT	
			
		INPUT fc14 WITHOUT DEFAULTS FROM t08_fc14 ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t08_sc14.* ATTRIBUTE(BLACK, UNDERLINE) END INPUT	
				
		INPUT fc15 WITHOUT DEFAULTS FROM t08_fc15 ATTRIBUTE(BLACK, BLINK) END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t08_sc15.* ATTRIBUTE(BLACK, BLINK) END INPUT	
				
		INPUT fc16 WITHOUT DEFAULTS FROM t08_fc16 ATTRIBUTE(BLACK, DIM) END INPUT				
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t08_sc16.* ATTRIBUTE(BLACK, DIM) END INPUT	
				
		INPUT fc17 WITHOUT DEFAULTS FROM t08_fc17 ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t08_sc17.* ATTRIBUTE(BLACK, UNDERLINE,BOLD) END INPUT	
		
		INPUT fc18 WITHOUT DEFAULTS FROM t08_fc18 ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t08_sc18.* ATTRIBUTE(BLACK, UNDERLINE,REVERSE) END INPUT	
				
		INPUT fc19 WITHOUT DEFAULTS FROM t08_fc19 ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t08_sc19.* ATTRIBUTE(BLACK, UNDERLINE,BOLD,REVERSE) END INPUT	
				
		INPUT fc20 WITHOUT DEFAULTS FROM t08_fc20 ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t08_sc20.* ATTRIBUTE(BLACK, REVERSE,BOLD) END INPUT	
		
		#Middle Column - Form Attributes				
		Input fc31,fc32,fc33,fc34,fc35,fc36,fc37,fc38,fc39,fc40 WITHOUT DEFAULTS
			FROM t08_fc31,t08_fc32,t08_fc33,t08_fc34,t08_fc35,t08_fc36,t08_fc37,t08_fc38,t08_fc39,t08_fc40
		END INPUT
		
		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t08_sc31.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t08_sc32.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t08_sc33.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t08_sc34.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t08_sc35.*  END INPUT
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t08_sc36.*  END INPUT
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t08_sc37.*  END INPUT
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t08_sc38.*  END INPUT
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t08_sc39.*  END INPUT
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t08_sc40.*  END INPUT			
		
											
		#LEFT Column - Form DISPLAY THEME Attributes											
		Input fc51,fc52,fc53,fc54,fc55,fc56,fc57,fc58,fc59,fc60 WITHOUT DEFAULTS
			FROM t08_fc51,t08_fc52,t08_fc53,t08_fc54,t08_fc55,t08_fc56,t08_fc57,t08_fc58,t08_fc59,t08_fc60
		END INPUT

		INPUT ARRAY colAttributeArr[1] WITHOUT DEFAULTS FROM t08_sc51.*  END INPUT	
		INPUT ARRAY colAttributeArr[2] WITHOUT DEFAULTS FROM t08_sc52.*  END INPUT	
		INPUT ARRAY colAttributeArr[3] WITHOUT DEFAULTS FROM t08_sc53.*  END INPUT			
		INPUT ARRAY colAttributeArr[4] WITHOUT DEFAULTS FROM t08_sc54.*  END INPUT	
		INPUT ARRAY colAttributeArr[5] WITHOUT DEFAULTS FROM t08_sc55.*  END INPUT			
		INPUT ARRAY colAttributeArr[6] WITHOUT DEFAULTS FROM t08_sc56.*  END INPUT			
		INPUT ARRAY colAttributeArr[7] WITHOUT DEFAULTS FROM t08_sc57.*  END INPUT			
		INPUT ARRAY colAttributeArr[8] WITHOUT DEFAULTS FROM t08_sc58.*  END INPUT			
		INPUT ARRAY colAttributeArr[9] WITHOUT DEFAULTS FROM t08_sc59.*  END INPUT			
		INPUT ARRAY colAttributeArr[10] WITHOUT DEFAULTS FROM t08_sc60.*  END INPUT			


		ON KEY(ACCEPT)
			EXIT DIALOG		
		ON KEY(F12)
			EXIT DIALOG		
				
	END DIALOG
	
END FUNCTION

