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


#################################################################
# FUNCTION color_demo()
# 
#! Main Color Demo Menu
#################################################################
FUNCTION color_demo(p_menuChoice)
  DEFINE 
    inp_char CHAR,
    #menu     SMALLINT,
    p_menuChoice SMALLINT
    
    #OPTIONS AUTOREFRESH 3   --turn off automatic screen refresh/flush
{
  OPTIONS 
    FORM LINE 1
} 
  #CALL fgl_window_open("w_attrib_main",1,1,24,80,1)

  CALL fgl_settitle(get_str(830))   --Querix Gui-Demo  - Color Demo 


	CASE p_menuChoice
	
		WHEN 1
			CALL color_chart_demo()	
			
		WHEN 2
			CALL color_display_to_attrib()	
					
		WHEN 3
			CALL attribute_demo_menu()		

		WHEN 4
			CALL attribute_demo_display_at()				
		OTHERWISE
		
    	WHILE TRUE
      	PROMPT "" FOR CHAR inp_char HELP 2

        	BEFORE PROMPT
          	CALL publish_toolbar("gd_col_main",0) 

        	ON ACTION ("actColorChart") --"Color Chart" "Display Color Chart Demo"
	          #CALL fgl_settitle(get_str(830) || " - " || get_str(831)) 
	          CALL color_chart_demo()

  	      ON ACTION actColorDisplay --"Color Display To" "Display Color Chart Demo"
  	        #CALL fgl_settitle(get_str(830) || " - " || get_str(832)) 
  	        CALL color_display_to_attrib()

          # huge heavy form 
  	      ON ACTION act4glAttributes --"4GL Colors Detailed" "Display all 4gl colors with different attributes"
  	        #CALL fgl_settitle(get_str(830) || " - " || get_str(833)) 
  	        CALL attribute_demo_menu()

		ON ACTION actDisplayAt
			CALL attribute_demo_display_at()	
			
			ON ACTION actExit
			  EXIT WHILE
			
  	      ON KEY(F11) --"Exit" "Exit Color/Attribute Demo"
  	        EXIT WHILE

   	     AFTER PROMPT
   	       CALL publish_toolbar("gd_col_main",1) 

   	   END PROMPT
 	   END WHILE
    
 	
	END CASE						
    #OPTIONS AUTOREFRESH 3   --turn on automatic screen refresh/flush   
END FUNCTION



############################################################
#! FUNCTION col_array_init() - prepares the dummy text which is displayed to the fields
############################################################
FUNCTION col_array_init(col)
  DEFINE col char(15), i SMALLINT

  FOR i = 1 TO 5
    LET col_arr[i] = col CLIPPED, "-", trim(i)
  END FOR
  CALL set_count(5)

END FUNCTION


##########################################################################
#! init_test_rec_1() function to initialize test record
########################################################################## 
FUNCTION init_color_fields()
  LET fc11 = "Black"
  LET fc12 = "Black-R"
  LET fc13 = "Black-D"
  LET fc14 = "Black-B"
  LET fcsa11 = "Black"
  LET fcsa12 = "Black-R"
  LET fcsa13 = "Black-D"
  LET fcsa14 = "Black-B"
  LET fc21 = "White"
  LET fc22 = "White-R"  
  LET fc23 = "White-D"  
  LET fc24 = "White-B"  
  LET fcsa21 = "White"  
  LET fcsa22 = "White-R"  
  LET fcsa23 = "White-D"  
  LET fcsa24 = "White-B"  
  LET fc31 = "Blue"
  LET fc32 = "Blue-R"
  LET fc33 = "Blue-D"
  LET fc34 = "Blue-B"
  LET fcsa31 = "Blue"
  LET fcsa32 = "Blue-R"
  LET fcsa33 = "Blue-D"
  LET fcsa34 = "Blue-B"
  LET fc41 = "Cyan"
  LET fc42 = "Cyan-R"
  LET fc43 = "Cyan-D"
  LET fc44 = "Cyan-B"
  LET fcsa41 = "Cyan"
  LET fcsa42 = "Cyan-R"
  LET fcsa43 = "Cyan-D"
  LET fcsa44 = "Cyan-B"
  LET fc51 = "Red"
  LET fc52 = "Red-R"
  LET fc53 = "Red-D"
  LET fc54 = "Red-B"
  LET fcsa51 = "Red"
  LET fcsa52 = "Red-R"
  LET fcsa53 = "Red-D"
  LET fcsa54 = "Red-B"
  LET fc61 = "Magenta"
  LET fc62 = "Magenta-R"
  LET fc63 = "Magenta-D"
  LET fc64 = "Magenta-B"
  LET fcsa61 = "Magenta"
  LET fcsa62 = "Magenta-R"
  LET fcsa63 = "Magenta-D"
  LET fcsa64 = "Magenta-B"
  LET fc71 = "Green"
  LET fc72 = "Green-R"
  LET fc73 = "Green-D"
  LET fc74 = "Green-B"
  LET fcsa71 = "Green"
  LET fcsa72 = "Green-R"
  LET fcsa73 = "Green-D"
  LET fcsa74 = "Green-B"
  LET fc81 = "Yellow"
  LET fc82 = "Yellow-R"
  LET fc83 = "Yellow-D"
  LET fc84 = "Yellow-B"
  LET fcsa81 = "Yellow"
  LET fcsa82 = "Yellow-R"
  LET fcsa83 = "Yellow-D"
  LET fcsa84   = "Yellow-B"
END FUNCTION

