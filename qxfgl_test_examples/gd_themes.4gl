#########################################################################################################
#! GUI Demo Application to demonstrate GUI Clients
#
#! Demonstrating the same form with different color themes
#
# Modification History:
# 15.05.04 DS - Created
# 29.05.05 HH - Changed Form and Layout to make it company based
#
# Current Limitations & Bugs:
#
#
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

#########################################################################################################
# FUNCTION theme_demo()
#! Demonstrating form with different color themes
######################################################################################################### 
FUNCTION theme_demo()
  DEFINE local_debug SMALLINT
	DEFINE windowObject WINDOW
	DEFINE windowName STRING
	DEFINE formName STRING
	DEFINE themeName STRING
	DEFINE loopState BOOLEAN
	DEFINE inp_char CHAR
	
	
  LET local_debug = FALSE


  #LET win_size_y = 24
  #LET win_size_x = 80

  #LET win_pos_y = 1
  #LET win_pos_x = 1

  #CALL init_data()

  #CALL fgl_winmessage(get_str(550), get_str(551) || "\n" || get_str(552),"info")

	#CALL apply_theme("theme/my_styles.qxtheme")
	#w_theme.open("w_theme",1,1,get_form_path("gd_f_contact_english_2_2"),TRUE)

	LET windowName = "wTheme_01"
	#LET formName = "gd_f_theme01_2_2.fm2"
	LET formName = "gd_f_contact_english_2_2"
	LET themeName = "theme/gd_theme_demo_01"	
	
	call openThemeWindow(windowObject,windowName,formName,themeName)
	CALL populate_form()
	
	LET loopState = TRUE

  WHILE loopState = TRUE

    PROMPT "" FOR CHAR inp_char HELP 100
      BEFORE PROMPT
        CALL publish_toolbar("theme",0)

      ON ACTION ("actTheme01")
      	#CALL windowObject.close()
				LET windowName = "wTheme_01"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_01"
				#CALL openThemeWindow(windowObject,windowName,formName,themeName)
				CALL populate_form()				
					
      ON ACTION ("actTheme02")
      	#CALL windowObject.close()      
				LET windowName = "wTheme_02"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_02"
				#CALL openThemeWindow(windowObject,windowName,formName,themeName)
				CALL populate_form()
								
      ON ACTION ("actTheme03")
      	CALL windowObject.close()      
				LET windowName = "wTheme_03"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_03"
				CALL openThemeWindow(windowObject,windowName,formName,themeName)				
				CALL populate_form()

								
      ON ACTION ("actTheme04")
      	CALL windowObject.close()      
				LET windowName = "wTheme_04"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_04"
				CALL openThemeWindow(windowObject,windowName,formName,themeName)				
				CALL populate_form()
				
									
      ON ACTION ("actTheme05")
      	CALL windowObject.close()      
				LET windowName = "wTheme_05"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_05"
				CALL openThemeWindow(windowObject,windowName,formName,themeName)				
				CALL populate_form()
				
								
      ON ACTION ("actTheme06")
      	CALL windowObject.close()      
				LET windowName = "wTheme_06"
				#LET formName = "gd_f_contact_english_2_2"
				LET themeName = "theme/gd_theme_demo_06"
				CALL openThemeWindow(windowObject,windowName,formName,themeName)				
				CALL populate_form()				
							
			ON KEY(F5)
       CALL input_data()
       											
      #ON ACTION ("actInputData")
      # CALL input_data()


      ON ACTION ("actWindowInformation")
        CALL get_4gl_window_information()

      ON ACTION ("actExit")
        LET loopState = FALSE
        #CALL fgl_winmessage("Exit","Exit Window Toggle Mode","info")


      ON KEY(F81)
        CALL image_selection()  --click the persons picture

      #ON KEY (F83)
      #  CALL grid_export_clipboard()

      #ON KEY (F84)
      #  CALL grid_export_file()

      ON KEY (F86)
        CALL send_email()

      ON KEY(F91)    -- DISPLAY Data Update
        CALL populate_form() 

      ON KEY(F101)
        CALL example_error()

      ON KEY(F102)
        CALL example_message()

      AFTER PROMPT
        #CALL publish_toolbar("theme",1)    

			ON KEY (F12)
				EXIT WHILE
    END PROMPT

	END WHILE
	    
  CALL windowObject.close()      
	CALL apply_theme("guidemo3")  --re-instate the original theme file
	
{	
  IF local_debug THEN
    DISPLAY "CALL open_all_windows()"
  END IF

  CALL open_all_windows()

  IF local_debug THEN
    DISPLAY "CALL toggle_windows()"
  END IF

  CALL toggle_windows()

  IF local_debug THEN
    DISPLAY "CALL close_all_windows()"
  END IF

  CALL close_all_windows()
}
END FUNCTION

############################################
FUNCTION openThemeWindow(windowObject,windowName,formName,themeName)
	DEFINE windowObject WINDOW
	DEFINE windowName STRING
	DEFINE formName STRING
	DEFINE themeName STRING
	
	#@huhoCALL apply_theme(themeName)
	CALL windowObject.openWithForm(windowName,get_form_path(formName),1,1,"", "border")
	
	

END FUNCTION

########################################################################################################
#! order_windows()    current window is... function wrapper
######################################################################################################### 
FUNCTION order_windows()
  DEFINE win_id SMALLINT

  FOR win_id = 12 TO 1  STEP -1
    CALL current_window(win_id)
  END FOR

END FUNCTION

#########################################################################################################
#! current_window()    current window is... function wrapper
######################################################################################################### 
FUNCTION current_window(window_id)
  DEFINE 
    window_id SMALLINT,
    win_name VARCHAR(20),
    ret SMALLINT

  IF window_id IS NOT NULL THEN
    LET win_name = "w_theme_" || window_id
  ELSE
    CALL fgl_winmessage(get_str(30) ,get_str(31) || " close_window(indow_id = NULL)","stop")
  END IF

  #CALL fgl_window_current("SCREEN")

  CALL fgl_window_current(win_name)
 
  CALL fgl_settitle(win_name,get_str(553) || " - " || window_id) 

 
END FUNCTION

#########################################################################################################
#! toggle_window()    Toggle Open Windows
######################################################################################################### 
FUNCTION toggle_windows()
  DEFINE 
    win_active SMALLINT,
    loopState SMALLINT,
    inp_char CHAR

  #Just for cosmetic reasons - order windows
  #CALL order_windows()
  CALL current_window(1)

  #CALL display_demo_usage_instructions()

  LET loopState = 1

  WHILE loopState = 1

    PROMPT "" FOR CHAR inp_char HELP 1
      BEFORE PROMPT
        CALL publish_toolbar("theme",0)

      ON KEY ("F13")
        CALL current_window(1)

      ON KEY ("F14")
        CALL current_window(2)

      ON KEY ("F15")
        CALL current_window(3)

      ON KEY ("F16")
        CALL current_window(4)

      ON KEY ("F17")
        CALL current_window(5)

      ON KEY ("F18")
        CALL current_window(6)

      ON KEY ("F19")
        CALL current_window(7)

      ON KEY ("F20")
        CALL current_window(8)

      ON KEY ("F21")
        CALL current_window(9)

      ON KEY ("F22")
        CALL current_window(10)

      ON KEY ("F23")
        CALL current_window(11)

      ON KEY ("F24")
        CALL current_window(12)

      ON KEY ("F5")
       CALL input_data()

      ON KEY ("HELP")
        call showhelp(100)

      ON KEY ("F62")
        CALL get_4gl_window_information()

      ON KEY ("F11")
        LET loopState = 0
        #CALL fgl_winmessage("Exit","Exit Window Toggle Mode","info")

        EXIT WHILE

      AFTER PROMPT
        CALL publish_toolbar("theme",1)    

    END PROMPT

  END WHILE

END FUNCTION

#########################################################################################################
#! open_all_windows()    Open ALL Windows
######################################################################################################### 
FUNCTION open_all_windows()
 DEFINE 
   i           SMALLINT,
   local_Debug SMALLINT

  LET local_debug = FALSE

  FOR i = 1 TO 12
    IF local_debug THEN
      DISPLAY "open_window(",i,")"
    END IF
    CALL open_window(i)

    #IF local_debug THEN
    #  DISPLAY "open_form(",i,")"
    #END IF
    #CALL open_form(i)
  END FOR

END FUNCTION

#########################################################################################################
#! open_window()    Open Window
######################################################################################################### 
FUNCTION open_window(window_id)
  DEFINE 
    window_id      SMALLINT,
    win_name       VARCHAR(20),
    ret            SMALLINT,
    form_header    VARCHAR(50),
    local_debug    SMALLINT

  LET local_debug = FALSE

  IF local_debug THEN
    DISPLAY "open_window() - window_id = ",window_id
  END IF

  LET form_header = "Theme ", trim(window_id)

  IF window_id IS NOT NULL THEN
    LET win_name = "w_theme_" || trim(window_id)
  ELSE
    CALL fgl_winmessage(get_str(30),get_str(31) || " open_window(indow_id = NULL)","error")
  END IF

  #CALL fgl_window_current("SCREEN")

  LET ret = fgl_window_open( 
    win_name, 
    1,  --y 
    1, --x 
    get_form_path("gd_f_contact_english_2_2"),
    #win_size_y, --height in rows 
    #win_size_x, --width in columns, 
    TRUE--, -- border 1=yes 0 = no border
    --0
    )
 
  IF ret != 1 THEN
    CALL fgl_winmessage(get_str(30),get_str(554) || " " || win_name,"stop")
  ELSE
    CALL fgl_settitle(win_name, get_str(553) || " " || window_id)
  END IF  

  IF local_debug THEN
    DISPLAY "open_window() - window_id = ",window_id
    DISPLAY "open_window() - win_name = ",win_name
    DISPLAY "open_window() - ret = ",ret
    DISPLAY "open_window() - form_header = ",form_header
  END IF

  DISPLAY form_header
    AT 1,1 
    ATTRIBUTE(YELLOW, BOLD)

  IF local_debug THEN
    DISPLAY "CALL text_display()"
  END IF
  CALL text_display()

  IF local_debug THEN
    DISPLAY "CALL populate_form()"
  END IF
  CALL populate_form()

END FUNCTION


#########################################################################################################
#! open_form()    Open Form
######################################################################################################### 
FUNCTION open_form(form_id)
  DEFINE 
    form_id                SMALLINT,
    form_name, form_header VARCHAR(50),
    local_debug            SMALLINT

  LET local_debug = FALSE

  IF form_id < 1 OR form_id > 12 THEN
    CALL fgl_winmessage(get_str(30) || " - " || "open_form(form_id)",get_str(31) || " open_form(form_id)" || form_id, "error") 
  END IF

  LET form_name = "f_theme", form_id
  LET form_header = "Theme ", form_id

  IF local_debug THEN
    DISPLAY "open_form() - form_name =", form_name
    DISPLAY "open_form() - form_header =", form_header
  END IF

  CALL fgl_form_open(form_name, get_form_path("gd_f_contact_english"))
  CALL fgl_form_display(form_name)

  DISPLAY form_header
    AT 1,1 
    ATTRIBUTE(YELLOW, BOLD)

  CALL text_display()
  CALL populate_form()

END FUNCTION

#########################################################################################################
#! close_window()    Close Window
######################################################################################################### 
FUNCTION close_all_windows()

 DEFINE i SMALLINT

  FOR i = 1 TO 12
    CALL close_window(i)
  END FOR

  CALL fgl_settitle(get_str(50)) 

END FUNCTION

#########################################################################################################
#! close_window()    Close Window
#########################################################################################################
FUNCTION close_window(window_id)
  DEFINE 
    window_id SMALLINT,
    win_name VARCHAR(20),
    ret SMALLINT

  IF window_id IS NOT NULL THEN
    LET win_name = "w_theme_" || window_id
  ELSE
    CALL fgl_winmessage(get_str(30),get_str(31) || " close_window(indow_id = NULL)","stop")
  END IF

  CURRENT WINDOW IS SCREEN

  CALL fgl_window_close(win_name)
 
ENd FUNCTION

#########################################################################################################
#! text_form_handler()    Display different text strings to window
######################################################################################################### 

FUNCTION text_display()
      #DISPLAY "Text on line 05 using DISPLAY TO" AT 5,5
      #DISPLAY "Text on line 06 using DISPLAY TO" AT 6,5
      #DISPLAY "Text on line 07 using DISPLAY TO" AT 7,5
      #DISPLAY "Text on line 08 using DISPLAY TO" AT 8,5
      #DISPLAY "Text on line 09 using DISPLAY TO" AT 8,5

      #DISPLAY "More Text on line 15 using DISPLAY TO" AT 15,5
      #DISPLAY "More Text on line 16 using DISPLAY TO" AT 16,5
      #DISPLAY "More Text on line 17 using DISPLAY TO" AT 17,5
      #DISPLAY "More Text on line 18 using DISPLAY TO" AT 18,5
      #DISPLAY "More Text on line 19 using DISPLAY TO" AT 19,5
      #DISPLAY "More Text on line 20 using DISPLAY TO" AT 20,5

END FUNCTION

{
#########################################################################################################
# display_demo_usage_instructions() - Instructions for the user
#########################################################################################################
FUNCTION display_demo_usage_instructions()
  DEFINE i char(1)

  OPEN WINDOW w_demo_usage AT 3,3 WITH 18 ROWS, 70 COLUMNS ATTRIBUTE (BORDER)

  DISPLAY "Toggle Mode Instructions" AT 1,2

  DISPLAY "F1" AT 3,2
  DISPLAY "Green" AT 3,6
  DISPLAY "F2" AT 4,2
  DISPLAY "Purple" AT 4,6
  DISPLAY "F3" AT 5,2
  DISPLAY "Blue" AT 5,6
  DISPLAY "F4" AT 6,2
  DISPLAY "Yellow" AT 6,6
  DISPLAY "F5" AT 7,2
  DISPLAY "Orange" AT 7,6
  DISPLAY "F6" AT 8,2
  DISPLAY "Rough iron-Sample image pattern (tiled) background" AT 8,6
  DISPLAY "F7" AT 9,2
  DISPLAY "Beige sample image pattern (titled) background" AT 9,6
  DISPLAY "?" AT 10,2
  DISPLAY "Detailed Information on the application and window etc..." AT 10,6
  DISPLAY "F12" AT 11,2
  DISPLAY "Show Helpfile" AT 11,6
  DISPLAY "e" AT 12,2
  DISPLAY "Exit" AT 12,6

  PROMPT "Press any key to continue" FOR CHAR i

  CLOSE WINDOW w_demo_usage


END FUNCTION
}

