#########################################################################################################
# Functions to initialise variables
#
#
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# init_data()                                     Initialise tools library variables                         NONE
# init_gui_path()                                 Initialisee gui client path                                NONE
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


#########################################################################################################
# FUNCTION init_data()
#
# Initialise tools library variables
#
# RETURN NONE
######################################################################################################### 
FUNCTION init_tools_data()
  DEFINE
    local_debug,ret SMALLINT

  #Note: Please keep the order of the first six items as they are !

  LET tl_settings.languageId = 1                               --  English = default NOTE: must be the first specified value in the init_data()

  LET tl_settings.main_cfg_file_name = "cfg/config.cfg"      -- must be second
  CALL process_cfg_import(tl_settings.main_cfg_file_name)    -- NOTE: must be the third call in the init_tools_data()
  CALL set_toggle_switch(1)                               -- initialise the global switch toggle.. i.e. used for asc/desc sort switch
  LET local_debug = FALSE                                 -- Turn Debug on/off

  #Initialise strings from text file
  CALL process_mono_lang_string_import(0,get_unl_path(tl_settings.tool_string_mono_file_name))  --immport lib tool related single language strings for tools
  CALL process_string_import(0,get_unl_path(tl_settings.tool_string_file_name))                      --import lib tool related international language strings

  #Initialise application data
  CALL process_mono_lang_string_import(1,get_unl_path(tl_settings.string_mono_file_name))  --immport program related single language strings for program
  CALL process_string_import(1,get_unl_path(tl_settings.string_file_name))                 --import Program related international language strings


  #########GUI client only section ##########################

  IF fgl_fglgui() THEN

    #DDE config file
    CALL process_dde_cfg_import(get_cfg_path(tl_settings.dde_cfg_file_name)) -- Import DDE configuration file

    #Import toolbar definitions 
    CALL process_toolbar_init(get_cfg_path(tl_settings.toolbar_cfg_file_name))       --Import toolbar configuration
    CALL init_gui_path()                                                             --initialise common local & server paths

  #CALL process_data_import(get_unl_path("data.unl"))                                --import record data
  CALL process_html_help_import(get_unl_path("help_url_mapping.unl"))                --import html help urls
  END IF


  LET tl_user_name = fgl_username()

  IF local_debug THEN
    DISPLAY "tl_user name = ",tl_user_name
  END IF

END FUNCTION


#########################################################################################################
# FUNCTION init_gui_path()
#
# Initialisee gui client path
#
# RETURN NONE
######################################################################################################### 
FUNCTION init_gui_path()
  #DEFINE temp_path VARCHAR(200) - is global
  define 
    r smallint,
    app_temp_dir,phoenix_cache, chimera_cache VARCHAR(50),
    local_debug SMALLINT

  LET local_debug = FALSE

  LET app_temp_dir = "temp"
  LET phoenix_cache = "Phoenix_cache"
  LET chimera_cache = "Chimera_cache"

  #Client Cache and Working Directory ##############################################################################
  LET tl_client_temp_directory = fgl_get_property("gui","system.file.client_temp","")

  #check if directory exists on client system
  IF tl_client_temp_directory IS NULL THEN
  	IF ui.Interface.getFrontEndName() <> "lyciaweb" THEN	#Only LD client has got full local OS fileSystem access inc. temp director
    	CALL fgl_winmessage("LD Client temp folder is missing","Client Temp Directory not found","error")
    ELSE
			IF os.Path.exists("LyciaClientDemoTemp") = FALSE THEN
    		CALL os.Path.mkdir("LyciaClientDemoTemp")
    		LET tl_client_temp_directory = "LyciaClientDemoTemp"		
			END IF     
		END IF
  END IF


  ############################################################################################
  # Set the server temp directory ############################################################
  LET tl_server_temp_directory = fgl_getenv("TEMP")

  IF tl_server_temp_directory IS NULL THEN
    LET tl_server_temp_directory = "temp"
    #CALL fgl_winmessage("Missing temp path in your GUI appliation server environment", "This server application could not read the enviroment variable TEMP.\n Please set your TEMP=<path> in your gui server environment","error")
  END IF


  ############################################################################################
  # Set the application temp directory #######################################################
  LET tl_server_client_user_temp_directory = tl_server_temp_directory , "/" , tl_user_name

  IF fgl_test("e",tl_server_client_user_temp_directory)= 0 THEN
    LET r = fgl_mkdir(tl_server_client_user_temp_directory)  -- --r-- 0 =failure  1=success

    IF r = 0 THEN
      LET r = fgl_mkdir(tl_server_client_user_temp_directory)
    END IF
  END IF



  ############################################################################################
  # Just some debug output  ##################################################################
  IF local_debug THEN
    DISPLAY "tl_server_client_user_temp_directory= ", tl_server_client_user_temp_directory
    DISPLAY "tl_client_temp_directory= ", tl_client_temp_directory
  END IF

END FUNCTION

