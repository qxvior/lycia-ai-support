#########################################################################################################
# Functions to change the help file dynamically at runtime
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# get_language()                                  Get the current language choice                            language
# set_language(lang)                              Set the current language                                   NONE
# lang_menu()                                     The lang_menu() function allows to specify the language.   ret 
#                                                 Note: language is a simple global SMALLINT which represents 
#                                                 the language 1-english 2-spanisch 3-german 4-french 
#                                                 5-arabic 6-italian, 7-other
#
# 
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


############################################################
# FUNCTION get_language()
#
# Get the current language choice
#
# RETURN language
############################################################
FUNCTION get_language()

  RETURN tl_settings.languageId

END FUNCTION


#############################################################
# FUNCTION set_language(lang)
#
# Set the current language 
#
# RETURN NONE
############################################################
FUNCTION set_language(lang)
  DEFINE lang SMALLINT

  IF lang < 1 OR lang > 7 THEN
    LET tl_err_msg = get_str_tool(30), " - set_language(lang) Language ID\n " , lang 
    CALL fgl_winmessage(get_str_tool(804),tl_err_msg,"error") 
  ELSE
    LET tl_settings.languageId = lang
    CALL publish_toolbar("global",0)  -- toolbar refresh
    CALL publish_toolbar("global",1)  -- toolbar refresh
    #CALL load_main_menu()  --refresh main menu with new language

  END IF

END FUNCTION



##########################################################################
# FUNCTION lang_menu()
##########################################################################
# The lang_menu() function allows to specify the language. 
# Note: language is a simple global SMALLINT which represents the language
#  1-english 2-spanisch 3-german 4-french 5-arabic (6-italian, 7-other)
#
# RETURN ret
##########################################################################
FUNCTION lang_menu()
  DEFINE
    inp_char CHAR,
    ret SMALLINT,
    previous_help_file_id SMALLINT

  #OPTIONS FORM LINE 2

  LET previous_help_file_id = get_current_classic_help()
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  CLEAR SCREEN

  #Open full size FLAT language window embedded into the screen window
  #CALL fgl_window_open("w_languages",1,1,24,80,0)

  #IF fgl_fglgui() THEN
    WHILE TRUE 

      PROMPT "" FOR CHAR inp_char HELP 200
 
        BEFORE PROMPT
          CALL set_help_id(70)  --set the html help id
          CALL publish_toolbar("gd_lang",0)  --publish context sensitive toolbar icons for this menu

        ON KEY ("F71")  -- "English" "View form in English" HELP 71
          CALL set_language(1)
          LET ret =  1
          EXIT WHILE


        ON KEY ("F72") --"EspaÃÂ±ol" "View form in Spanish" HELP 72
          CALL set_language(2)
          LET ret =  2
          EXIT WHILE

        ON KEY ("F73") --"Deutsch" "Form auf Deutsch" HELP 73
          CALL set_language(3)
          LET ret =  3
          EXIT WHILE

        ON KEY ("F74") --"Francais" "voi form en Francais" HELP 74
          CALL set_language(4)
          LET ret =  4
          EXIT WHILE

        ON KEY ("F75") --"Arabic" "View form in Arabic" HELP 75
          CALL set_language(5)
          LET tl_tmp_str = get_strm_tool(101) CLIPPED, "\n", get_strm_tool(102) CLIPPED, "\n",get_strm_tool(103)
          CALL fgl_winmessage(get_strm_tool(100), tl_tmp_str, "info")
          LET ret =  5
          EXIT WHILE

        ON KEY ("F76") --"Italian" "Italian" HELP 76
          CALL set_language(6)
          LET ret =  6
          EXIT WHILE

        ON KEY ("F77") --"Other" "Other Language" HELP 77
          CALL set_language(7)
          LET ret =  7
          EXIT WHILE


        ON KEY("F12") --"Return" "Return to previous menu" HELP 99
          LET ret =  0
          EXIT WHILE

        ON KEY ("F1024") --"Show Help in HTML format..."
          CALL html_help("http://www.querix.com")

        AFTER PROMPT
          CALL publish_toolbar("gd_lang",1)

      END PROMPT

    END WHILE
{
  ELSE  --text client
    
    MENU "Language"
      COMMAND "English"
        LET ret = 1
        EXIT MENU
      COMMAND "EspaÃÂ±ol"
        LET ret = 2
        EXIT MENU
      COMMAND "Deutsch"
        LET ret = 3
        EXIT MENU
      COMMAND "Francais"
        LET ret = 4
        EXIT MENU
      COMMAND "Arabic"
        LET ret = 5
        EXIT MENU
      COMMAND "Italian"
        LET ret = 6
        EXIT MENU
      COMMAND "Other"
        LET ret = 7
        EXIT MENU
      #COMMAND "Return"
      #  LET ret = 0
      #  EXIT MENU
    END MENU
  
  END IF

  CALL fgl_window_close("w_languages")
}
  CALL set_classic_help_file(previous_help_file_id)

  RETURN ret
END FUNCTION

