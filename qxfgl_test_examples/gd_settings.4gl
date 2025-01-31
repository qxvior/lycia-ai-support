#########################################################################################################
# Settings
#
#! This 4gl module includes functions to change the environment i.e. language choice
#
# Modification History:
# 19.10.06 HH - Created - contents extracted from gd_guidemo.4gl
#
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"


##########################################################################
# settings_menu(win_x)  --pull down look like
#! Settings Menu
##########################################################################
FUNCTION settings_menu(win_x)  --window x position
  DEFINE 
    win_x,win_y SMALLINT,  -- x position of window
    l_data ARRAY[3] OF CHAR(25),
    i,item_count,y INTEGER,
    next_action SMALLINT,
    previous_help_file_id SMALLINT


  LET previous_help_file_id = get_current_classic_help()

  LET item_count = sizeof(l_data)
  LET win_y = 4

  FOR i = 1 TO item_count
    LET l_data[i] = "F", trim(i + 899),  " {", get_str(i+949) , "}"  -- menu strings start with index 950
  END FOR

	IF win_x IS NULL THEN
  	CALL fgl_window_open("w_settings",1,1,get_form_path("gd_f_settings_2_2"),FALSE)	
	ELSE
  	CALL fgl_window_open("w_settings",win_y,win_x,get_form_path("gd_f_settings_2_2"),TRUE)
	END IF
	
  CALL set_count(sizeof(l_data))  

  LET int_flag = FALSE

  DISPLAY ARRAY l_data TO sc_rec.* #ATTRIBUTE(CURRENT ROW DISPLAY = "BLUE, REVERSE") 
    BEFORE DISPLAY
      CALL publish_toolbar("settings2",0)

    BEFORE ROW
      LET next_action = arr_curr()   
			#CALL fgl_winmessage("arr_curr()",arr_curr() , "info")

  END DISPLAY


  CALL fgl_window_close("w_settings")

  CASE next_action
    WHEN 0
      # do nothing
      LET next_action=0
    WHEN 1
      CALL settings_general(TRUE)

    WHEN 2
      CALL manage_toolbar_list(TRUE)
      
    WHEN 3
      CALL lang_menu()
    OTHERWISE
      CALL fgl_winmessage("Error","Error in settings_menu() - CASE value for next_action next_action=" || next_action,"ERROR")
  END CASE      

  CALL set_classic_help_file(previous_help_file_id)
  LET languageID = get_language()

END FUNCTION

{
##########################################################################
# FUNCTION lang_menu()
##########################################################################
# The lang_menu() function allows to specify the language. 
# Note: language is a simple global SMALLINT which represents the language
#  1-english 2-spanisch 3-german 4-french 5-arabic (6-italian, 7-other)
##########################################################################
FUNCTION lang_menu()
  DEFINE
    loop_lang SMALLINT,
    inp_char CHAR,
    ret SMALLINT

  OPTIONS FORM LINE 2

  CLEAR SCREEN

  #Open full size FLAT language window embedded into the screen window
  CALL fgl_window_open("w_languages",1,1,24,80,0)

  LET loop_lang = 1

  WHILE loop_lang = 1 

    PROMPT "" FOR CHAR inp_char HELP 70

      BEFORE PROMPT
        CALL set_help_id(70)  --set the html help id
        CALL publish_toolbar("gd_lang",0)  --publish context sensitive toolbar icons for this menu

      ON KEY ("F71")  -- "English" "View form in English" HELP 71
        LET exit_menu = 0
        CALL set_language(1)
        LET loop_lang = 0
        LET ret =  1

      ON KEY ("F72") --"Deutsch" "Form auf Deutsch" HELP 72
        LET exit_menu = 0
        CALL set_language(3)
        LET loop_lang = 0
        LET ret =  3


      ON KEY ("F73") --"Arabic" "View form in Arabic" HELP 73
        LET exit_menu = 0
        CALL set_language(5)
        CALL fgl_message_box("To enable arabic support, you will need an Arabic MS-Windows System " ||
           "\nand include some additional script files:" ||
           "\nlocale_right_to_left menulocale   in this project")
        LET loop_lang = 0
        LET ret =  5

      ON KEY ("F74") --"Francais" "voi form en Francais" HELP 74
        LET exit_menu = 0
        CALL set_language(4)
        LET loop_lang = 0
        LET ret =  4

      ON KEY ("F75") --"EspaÃÂ±ol" "View form in Spanish" HELP 75
        LET exit_menu = 0
        CALL set_language(2)
        LET loop_lang = 0
        LET ret =  2


      ON KEY("F11") --"Return" "Return to previous menu" HELP 99
        LET exit_menu = 0
        LET loop_lang = 0
        LET ret =  0

      ON KEY ("F1024") --"Show Help in HTML format..."
        CALL html_help("www.querix.com")

      AFTER PROMPT
        CALL publish_toolbar("gd_lang",1)

    END PROMPT

  END WHILE

  OPTIONS FORM LINE 3
  CALL fgl_window_close("w_languages")

  RETURN ret
END FUNCTION

}

{
###########################################################
# FUNCTION process_cfg_import(file_name)
###########################################################
FUNCTION process_cfg_import(file_name)
DEFINE 
  ret SMALLINT,
  file_name VARCHAR(100)


############################################
# Using tools from www.bbf7.de - rk-config
############################################
   LET ret = configInit(file_name)

   #read from general section
   LET settings.form_path      = configGet(ret, "[General]", "form_path")
   LET settings.document_path  = configGet(ret, "[General]", "document_path")
   LET settings.html_path      = configGet(ret, "[General]", "html_path")
   LET settings.image_path     = configGet(ret, "[General]", "image_path")
   LET settings.icon16_path    = configGet(ret, "[General]", "icon16_path")
   LET settings.icon32_path    = configGet(ret, "[General]", "icon32_path")
   LET settings.unl_path       = configGet(ret, "[General]", "unl_path")

   #read from help section
   LET settings.help_file_base_url       = configGet(ret, "[Help]", "help_file_base_url")
   LET settings.help_system_type         = configGetInt(ret, "[Help]", "help_system_type")
   LET settings.help_language_dir[1]     = configGet(ret, "[Help]", "help_html_path_uk")
   LET settings.help_language_dir[2]     = configGet(ret, "[Help]", "help_html_path_sp")
   LET settings.help_language_dir[3]     = configGet(ret, "[Help]", "help_html_path_de")
   LET settings.help_language_dir[4]     = configGet(ret, "[Help]", "help_html_path_fr")
   LET settings.help_language_dir[5]     = configGet(ret, "[Help]", "help_html_path_ar")
   LET settings.help_language_dir[6]     = configGet(ret, "[Help]", "help_html_path_it")
   LET settings.help_language_dir[7]     = configGet(ret, "[Help]", "help_html_path_ot")

   #read from online section
   LET settings.online_demo_path         = configGet(ret, "[OnlineResource]", "online_demo_path")


   #read from webservice section
   LET settings.ws_name                  = configGet(ret, "[WebService]", "ws_name")
   LET settings.ws_port                  = configGet(ret, "[WebService]", "ws_port")


END FUNCTION


###########################################################
# FUNCTION process_cfg_export(file_name)
###########################################################
FUNCTION process_cfg_export(file_name)
  DEFINE 
    ret SMALLINT,
    file_name VARCHAR(100)


  ############################################
  # Using tools from www.bbf7.de - rk-config
  ############################################
  LET ret = configInit(file_name)


  #write to general section
  CALL configWrite(ret, "[General]", "form_path", settings.form_path )
  CALL configWrite(ret, "[General]", "document_path", settings.document_path )
  CALL configWrite(ret, "[General]", "html_path", settings.html_path )
  CALL configWrite(ret, "[General]", "image_path", settings.image_path )
  CALL configWrite(ret, "[General]", "icon16_path", settings.icon16_path )
  CALL configWrite(ret, "[General]", "icon32_path", settings.icon32_path )
  CALL configWrite(ret, "[General]", "unl_path", settings.unl_path )


  #write to help section
  CALL configWrite(ret, "[Help]", "help_file_base_url", settings.help_file_base_url )
  CALL configWrite(ret, "[Help]", "help_system_type", settings.help_system_type )
  CALL configWrite(ret, "[Help]", "help_html_path_uk", settings.help_language_dir[1] )
  CALL configWrite(ret, "[Help]", "help_html_path_sp", settings.help_language_dir[2] )
  CALL configWrite(ret, "[Help]", "help_html_path_de", settings.help_language_dir[3] )
  CALL configWrite(ret, "[Help]", "help_html_path_fr", settings.help_language_dir[4] )
  CALL configWrite(ret, "[Help]", "help_html_path_ar", settings.help_language_dir[5] )
  CALL configWrite(ret, "[Help]", "help_html_path_it", settings.help_language_dir[6] )
  CALL configWrite(ret, "[Help]", "help_html_path_ot", settings.help_language_dir[7] )

  #write to OnlineResource section
  CALL configWrite(ret, "[OnlineResource]", "online_demo_path", settings.online_demo_path )

  #read from webservice section
  CALL configWrite(ret, "[WebService]", "ws_name", settings.ws_name )
  CALL configWrite(ret, "[WebService]", "ws_port", settings.ws_port )

END FUNCTION




##################################################################################
# FUNCTION get_form_path(form_name)
##################################################################################
FUNCTION get_form_path(form_name)
  DEFINE
    form_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.form_path), "/", trim(form_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_image_path(image_name)
##################################################################################
FUNCTION get_image_path(image_name)
  DEFINE
    image_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.image_path), "/", trim(image_name)
  RETURN trim(ret)
END FUNCTION


##################################################################################
# FUNCTION get_document_path(document_name)
##################################################################################
FUNCTION get_document_path(document_name)
  DEFINE
    document_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.document_path), "/", trim(document_name)
  RETURN trim(ret)
END FUNCTION

##################################################################################
# FUNCTION get_document_path(document_name)
##################################################################################
FUNCTION get_html_path(document_name)
  DEFINE
    document_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.html_path), "/", trim(document_name)
  RETURN trim(ret)
END FUNCTION

##################################################################################
# FUNCTION get_icon16_path(document_name)
##################################################################################
FUNCTION get_icon16_path(icon_name)
  DEFINE
    icon_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.icon16_path), "/", trim(icon_name)
  RETURN trim(ret)
END FUNCTION

##################################################################################
# FUNCTION get_icon32_path(document_name)
##################################################################################
FUNCTION get_icon32_path(icon_name)
  DEFINE
    icon_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.icon32_path), "/", trim(icon_name)
  RETURN trim(ret)
END FUNCTION

##################################################################################
# FUNCTION get_unl_path(file_name)
##################################################################################
FUNCTION get_unl_path(file_name)
  DEFINE
    file_name VARCHAR(30),
    ret VARCHAR(150)

    LET ret = trim(settings.unl_path), "/", trim(file_name)
  RETURN trim(ret)
END FUNCTION

}

