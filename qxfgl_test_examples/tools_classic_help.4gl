#########################################################################################################
# Functions to change the help file dynamically at runtime
#
#########################################################################################################
############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


############################################################
# FUNCTION set_help_file(h_file)
#
# Set the help file (options help file) depening on the language
#
# RETURN NONE
############################################################
FUNCTION set_classic_help_file(h_file_id)
  DEFINE
    h_file      VARCHAR(200),
    h_file_id   SMALLINT,
    lang        SMALLINT,
    local_debug SMALLINT

  LET local_debug = FALSE

  LET tl_previous_help_file_id = tl_current_help_file_id
  LET lang = get_language()
  LET tl_current_help_file_id = h_file_id

  IF h_file_id >= 1 AND h_file_id <= 10 THEN

    IF tl_settings.classic_help_multi_lang = 0 THEN
      LET h_file = get_msg_path(tl_settings.classic_help_file[h_file_id]) CLIPPED, ".erm"
    ELSE
      LET h_file = get_msg_path(tl_settings.classic_help_file[h_file_id]) CLIPPED, "_", tl_settings.language_file_ext[lang], ".erm"
    END IF
    
    IF NOT fgl_test("e",h_file) THEN
      LET tl_err_msg = get_str_tool(727), " ",  h_file
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
    ELSE
      OPTIONS HELP FILE h_file
      IF local_debug THEN
        DISPLAY "OPTIONS HELP FILE ", h_file
      END IF
    END IF

  ELSE
    LET tl_err_msg = get_str_tool(802), "\nset_classic_help_file(h_file_id)\nh_file_id = ", h_file_id
    CALL fgl_winmessage(get_str_tool(30), tl_err_msg, "error")
  END IF



END FUNCTION


############################################################
# FUNCTION refresh_classic_help()
#
# Refresh classic help file with the current id (required for changes i.e. in language)
#
# RETURN NONE
############################################################
FUNCTION refresh_classic_help()

  CALL set_classic_help_file(tl_current_help_file_id)

END FUNCTION


############################################################
# FUNCTION set_previous_classic_help()
#
# Switch back to the last used help file (id)
#
# RETURN NONE
############################################################
FUNCTION set_previous_classic_help()

  CALL  set_classic_help_file(get_previous_classic_help())

END FUNCTION



############################################################
# FUNCTION set_previous_classic_help()
#
# Switch back to the last used help file (id)
#
# RETURN NONE
############################################################
FUNCTION get_previous_classic_help()

  RETURN tl_previous_help_file_id

END FUNCTION


############################################################
# FUNCTION get_current_help_file_id()
#
# Return the currently active help file id
#
# RETURN NONE
############################################################
FUNCTION get_current_classic_help()

  RETURN tl_current_help_file_id

END FUNCTION

