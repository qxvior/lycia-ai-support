#########################################################################################################
# Settings
#
# This 4gl module includes functions to change the environment i.e. language choice
#
# Modification History:
# 19.10.06 HH - Created - contents extracted from gd_guidemo.4gl
#
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# settings_general()                              Opens windows with tabs - to change settings and stores    NONE
#                                                 them back to disk 
# copy_settings_to_config_array(p_cfg_file_id)    Writes settings data back to config array variables        NONE
#                                                 This way, we can update the entire configuration file 
#                                                 (write back to) in one single file operation
# process_cfg_import(file_name)                   Import/Process cfg file                                    RET
#                                                 Using tools from www.bbf7.de - rk-config
# process_cfg_export(file_name)                   Export cfg data                                            ret
#
# 
# 
#  
#  
#########################################################################################################

############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


############################################################
# FUNCTION settings_general()
#
# Opens windows with tabs - to change settings and store them back to disk
#
# RETURN NONE
############################################################
FUNCTION settings_general(wType)
  DEFINE previous_help_file_id SMALLINT
	DEFINE wType BOOLEAN

	
  LET previous_help_file_id = get_current_classic_help()
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

	IF wType = TRUE THEN
  	CALL fgl_window_open("w_settings_general",5,5,get_form_path("f_tools_settings_2_2"),TRUE)
  ELSE
  	CALL fgl_window_open("w_settings_general",5,5,get_form_path("f_tools_settings_2_2"),FALSE)  
  END IF
  CALL fgl_settitle(get_str_tool(100))  --General Settings



  DISPLAY get_str_tool(111) TO dl_field11 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(112) TO dl_field12 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(113) TO dl_field13 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(114) TO dl_field14 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(115) TO dl_field15 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(116) TO dl_field16 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(117) TO dl_field17 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(118) TO dl_field18 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(119) TO dl_field19 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(121) TO dl_field21 --ATTRIBUTE(BLUE, BOLD)  --File path configuration and string
  DISPLAY get_str_tool(122) TO dl_field22 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(123) TO dl_field23 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(124) TO dl_field24 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(125) TO dl_field25 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(126) TO dl_field26 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(127) TO dl_field27 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(128) TO dl_field28 --ATTRIBUTE(BLUE, BOLD) 
  DISPLAY get_str_tool(129) TO dl_field29 --ATTRIBUTE(BLUE, BOLD)  --Online Demo Path:

  DISPLAY get_str_tool(131) TO dl_field31 --ATTRIBUTE(BLUE, BOLD)  -- CLAssic 4gl Help
  DISPLAY get_str_tool(132) TO dl_field32 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(133) TO dl_field33 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(134) TO dl_field34 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(135) TO dl_field35 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(136) TO dl_field36 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(137) TO dl_field37 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(138) TO dl_field38 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(139) TO dl_field39 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(140) TO dl_field40 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(141) TO dl_field41 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(142) TO dl_field42 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(151) TO dl_field51 --ATTRIBUTE(BLUE, BOLD)  -- Help file base URL:
  DISPLAY get_str_tool(152) TO dl_field52 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(153) TO dl_field53 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(154) TO dl_field54 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(155) TO dl_field55 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(156) TO dl_field56 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(157) TO dl_field57 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(158) TO dl_field58 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(159) TO dl_field59 --ATTRIBUTE(BLUE, BOLD)


  DISPLAY get_str_tool(171) TO dl_field71 --ATTRIBUTE(BLUE, BOLD)  --Webservice Name:
  DISPLAY get_str_tool(172) TO dl_field72 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(181) TO dl_field81 --ATTRIBUTE(BLUE, BOLD)  --Language

  #Print Html
  DISPLAY get_str_tool(191) TO dl_field91 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(192) TO dl_field92 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(193) TO dl_field93 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(194) TO dl_field94 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(195) TO dl_field95 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(196) TO dl_field96 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(197) TO dl_field97 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(198) TO dl_field98 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(199) TO dl_field99 --ATTRIBUTE(BLUE, BOLD)  

  #Print Html Images
  DISPLAY get_str_tool(201) TO dl_field101 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(202) TO dl_field102 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(203) TO dl_field103 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(204) TO dl_field104 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(205) TO dl_field105 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(206) TO dl_field106 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(207) TO dl_field107 --ATTRIBUTE(BLUE, BOLD)  
  DISPLAY get_str_tool(208) TO dl_field108 --ATTRIBUTE(BLUE, BOLD)  

  #DDE Settings
  DISPLAY get_str_tool(211) TO dl_field111 --ATTRIBUTE(BLUE, BOLD)  


  INPUT 
      tl_settings.cfg_path,
      tl_settings.unl_path,
      tl_settings.form_path,
      tl_settings.document_path, 
      tl_settings.html_path,
      tl_settings.image_path,
      tl_settings.icon10_path,
      tl_settings.icon16_path,
      tl_settings.icon32_path,

      #Other specific file path
      tl_settings.main_cfg_file_name,
      tl_settings.toolbar_cfg_file_name,
      tl_settings.tool_string_file_name,
      tl_settings.tool_string_mono_file_name,
      tl_settings.string_file_name,
      tl_settings.string_mono_file_name,
      tl_settings.help_url_mapping_file_name,
      tl_settings.dde_cfg_file_name,

      #Online Demo
      tl_settings.online_demo_path,

      #classic 4gl help section
      tl_settings.msg_path,
      tl_settings.classic_help_multi_lang,
      tl_settings.classic_help_file[1],
      tl_settings.classic_help_file[2],
      tl_settings.classic_help_file[3],
      tl_settings.classic_help_file[4],
      tl_settings.classic_help_file[5],
      tl_settings.classic_help_file[6],
      tl_settings.classic_help_file[7],
      tl_settings.classic_help_file[8],
      tl_settings.classic_help_file[9],
      tl_settings.classic_help_file[10],

      #Html Help
      tl_settings.help_file_base_url,
      tl_settings.help_system_type,
      tl_settings.help_language_dir[1],
      tl_settings.help_language_dir[2],
      tl_settings.help_language_dir[3],
      tl_settings.help_language_dir[4],
      tl_settings.help_language_dir[5],
      tl_settings.help_language_dir[6],
      tl_settings.help_language_dir[7],

      #Webservices
      tl_settings.ws_name,
      tl_settings.ws_port,

      #language
      tl_settings.languageId,

      #Print-Html
      tl_settings.html_print_output,
      tl_settings.html_print_template[1],
      tl_settings.html_print_template[2],
      tl_settings.html_print_template[3],
      tl_settings.html_print_template[4],
      tl_settings.html_print_template[5],
      tl_settings.html_print_template[6],
      tl_settings.html_print_template[7],
      tl_settings.html_print_template[8],

      #Print-Html Image name
      tl_settings.html_print_image[1],
      tl_settings.html_print_image[2],
      tl_settings.html_print_image[3],
      tl_settings.html_print_image[4],
      tl_settings.html_print_image[5],
      tl_settings.html_print_image[6],
      tl_settings.html_print_image[7],
      tl_settings.html_print_image[8],

      #dde 
      tl_settings.dde_timeout

    WITHOUT DEFAULTS FROM 

      cfg_path,
      unl_path,
      form_path,
      document_path, 
      html_path,
      image_path,
      icon10_path,
      icon16_path,
      icon32_path,


      #specific file path
      main_cfg_file_name,
      toolbar_cfg_file_name,
      tool_string_file_name,
      tool_string_mono_file_name,
      string_file_name,
      string_mono_file_name,
      help_url_mapping_file_name,
      dde_cfg_file_name,
      #online demo
      online_demo_path,

      #classic 4gl help section
      msg_path,
      classic_help_multi_lang,
      classic_help_file_1,
      classic_help_file_2,
      classic_help_file_3,
      classic_help_file_4,
      classic_help_file_5,
      classic_help_file_6,
      classic_help_file_7,
      classic_help_file_8,
      classic_help_file_9,
      classic_help_file_10,

      #html help section
      help_file_base_url,
      help_system_type,
      help_language_dir_uk,
      help_language_dir_sp,
      help_language_dir_de,
      help_language_dir_fr,
      help_language_dir_ar,
      help_language_dir_it,
      help_language_dir_ot,

      #Webservices
      ws_name,
      ws_port,

      #Language
      language,

      #print-html
      html_print_output,
      html_print_template_1,
      html_print_template_2,
      html_print_template_3,
      html_print_template_4,
      html_print_template_5,
      html_print_template_6,
      html_print_template_7,
      html_print_template_8,

      #print-html-image
      html_print_image_1,
      html_print_image_2,
      html_print_image_3,
      html_print_image_4,
      html_print_image_5,
      html_print_image_6,
      html_print_image_7,
      html_print_image_8,

      #dde
      dde_timeout
    HELP 100

    BEFORE INPUT
      CALL publish_toolbar("settings",0)

    ON KEY(F4)  --OK & Save
      CALL fgl_dialog_update_data()
      CALL copy_settings_to_config_array(get_cfg_file_id(tl_settings.main_cfg_file_name))
      CALL configWriteArrayToDisk(get_cfg_file_id(tl_settings.main_cfg_file_name)) --main_cfg_file_id)     main_cfg_file_name
      EXIT INPUT

		ON ACTION "help_system_type"
			NEXT FIELD help_system_type

    ON KEY(F13)
      CALL get_4gl_window_information()

    ON KEY(F1011)
      NEXT FIELD cfg_path

    ON KEY(F1012)
      NEXT FIELD online_demo_path


    ON KEY(F1013)
      NEXT FIELD msg_path


    ON KEY(F1014)
      NEXT FIELD help_file_base_url

    ON KEY(F1015)
      NEXT FIELD ws_name

    ON KEY(F1016)
      NEXT FIELD language


    ON KEY(F1017)
      NEXT FIELD html_print_output

    ON KEY(F1018)
      NEXT FIELD html_print_image_1

    ON KEY(F1019)
      NEXT FIELD dde_timeout

  ENd INPUT
  CALL refresh_classic_help()

  CALL publish_toolbar("settings",1)
  #CALL load_main_menu()
  CALL fgl_window_close("w_settings_general")

  CALL set_classic_help_file(previous_help_file_id)

END FUNCTION

############################################################
# FUNCTION settings_general_text()
#
# Opens windows settings for text mode client - to change settings and store them back to disk
#
# RETURN NONE
############################################################
FUNCTION settings_general_text()
  DEFINE
    previous_help_file_id SMALLINT

  LET previous_help_file_id = get_current_classic_help()
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  IF NOT fgl_window_open("w_settings_general",5,5,get_form_path("f_tools_settings_t"),FALSE) THEN
    CALL fgl_winmessage("Error","settings_general_text()\nCan not open window w_settings_general","error")
    RETURN
  END IF

  CALL fgl_settitle(get_str_tool(100))  --General Settings

  DISPLAY get_str_tool(111) TO dl_field11 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(112) TO dl_field12 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(113) TO dl_field13 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(114) TO dl_field14 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(115) TO dl_field15 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(116) TO dl_field16 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(121) TO dl_field21 --ATTRIBUTE(BLUE, BOLD)  --File path configuration and string
  DISPLAY get_str_tool(122) TO dl_field22 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(123) TO dl_field23 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(124) TO dl_field24 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(125) TO dl_field25 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(126) TO dl_field26 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(127) TO dl_field27 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(128) TO dl_field28 --ATTRIBUTE(BLUE, BOLD) 
  DISPLAY get_str_tool(129) TO dl_field29 --ATTRIBUTE(BLUE, BOLD)  --Online Demo Path:

  DISPLAY get_str_tool(131) TO dl_field31 --ATTRIBUTE(BLUE, BOLD)  -- CLAssic 4gl Help
  DISPLAY get_str_tool(132) TO dl_field32 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(133) TO dl_field33 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(134) TO dl_field34 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(135) TO dl_field35 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(136) TO dl_field36 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(137) TO dl_field37 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(138) TO dl_field38 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(139) TO dl_field39 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(140) TO dl_field40 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(141) TO dl_field41 --ATTRIBUTE(BLUE, BOLD)
  DISPLAY get_str_tool(142) TO dl_field42 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(171) TO dl_field71 --ATTRIBUTE(BLUE, BOLD)  --Webservice Name:
  DISPLAY get_str_tool(172) TO dl_field72 --ATTRIBUTE(BLUE, BOLD)

  DISPLAY get_str_tool(181) TO dl_field81 --ATTRIBUTE(BLUE, BOLD)  --Language



  INPUT 
      tl_settings.cfg_path,
      tl_settings.unl_path,
      tl_settings.form_path,
      tl_settings.document_path, 
      tl_settings.html_path,
      tl_settings.image_path,


      #Other specific file path
      tl_settings.main_cfg_file_name,
      tl_settings.toolbar_cfg_file_name,
      tl_settings.tool_string_file_name,
      tl_settings.tool_string_mono_file_name,
      tl_settings.string_file_name,
      tl_settings.string_mono_file_name,
      tl_settings.help_url_mapping_file_name,
      tl_settings.dde_cfg_file_name,

      #Online Demo
      tl_settings.online_demo_path,

      #classic 4gl help section
      tl_settings.msg_path,
      tl_settings.classic_help_multi_lang,
      tl_settings.classic_help_file[1],
      tl_settings.classic_help_file[2],
      tl_settings.classic_help_file[3],
      tl_settings.classic_help_file[4],
      tl_settings.classic_help_file[5],
      tl_settings.classic_help_file[6],
      tl_settings.classic_help_file[7],
      tl_settings.classic_help_file[8],
      tl_settings.classic_help_file[9],
      tl_settings.classic_help_file[10],

      #Webservices
      tl_settings.ws_name,
      tl_settings.ws_port,

      #language
      tl_settings.languageId



    WITHOUT DEFAULTS FROM 

      cfg_path,
      unl_path,
      form_path,
      document_path, 
      html_path,
      image_path,

      #specific file path
      main_cfg_file_name,
      toolbar_cfg_file_name,
      tool_string_file_name,
      tool_string_mono_file_name,
      string_file_name,
      string_mono_file_name,
      help_url_mapping_file_name,
      dde_cfg_file_name,
      #online demo
      online_demo_path,

      #classic 4gl help section
      msg_path,
      classic_help_multi_lang,
      classic_help_file_1,
      classic_help_file_2,
      classic_help_file_3,
      classic_help_file_4,
      classic_help_file_5,
      classic_help_file_6,
      classic_help_file_7,
      classic_help_file_8,
      classic_help_file_9,
      classic_help_file_10,

      #Webservices
      ws_name,
      ws_port,

      #Language
      language



    HELP 100

     ON KEY(F4)  --OK & Save
      CALL fgl_dialog_update_data()
      CALL copy_settings_to_config_array(get_cfg_file_id(tl_settings.main_cfg_file_name))
      CALL configWriteArrayToDisk(get_cfg_file_id(tl_settings.main_cfg_file_name)) --main_cfg_file_id)     main_cfg_file_name
      EXIT INPUT


    ON KEY(F13)
      CALL get_4gl_window_information()

  END INPUT

  CALL refresh_classic_help()

  #CALL load_main_menu()
  CALL fgl_window_close("w_settings_general")

  CALL set_classic_help_file(previous_help_file_id)

END FUNCTION



############################################################
# FUNCTION copy_settings_to_config_array(p_cfg_file_id)
#
# Writes settings data back to config array variables
# This way, we can update the entire configuration file (write back to) in one single file operation
#
# RETURN NONE
############################################################
FUNCTION copy_settings_to_config_array(p_cfg_file_id)
  DEFINE 
    p_cfg_file_id SMALLINT,
    file_name VARCHAR(100)

  CALL configWriteToArray(p_cfg_file_id, "[General]", "unl_path", tl_settings.unl_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "cfg_path", tl_settings.cfg_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "form_path", tl_settings.form_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "document_path", tl_settings.document_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "html_path", tl_settings.html_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "image_path", tl_settings.image_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "icon10_path", tl_settings.icon10_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "icon16_path", tl_settings.icon16_path )
  CALL configWriteToArray(p_cfg_file_id, "[General]", "icon32_path", tl_settings.icon32_path )


  #write to classic-help section
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "msg_path", tl_settings.msg_path )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_multi_lang", tl_settings.classic_help_multi_lang )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_1", tl_settings.classic_help_file[1]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_2", tl_settings.classic_help_file[2]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_3", tl_settings.classic_help_file[3]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_4", tl_settings.classic_help_file[4]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_5", tl_settings.classic_help_file[5]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_6", tl_settings.classic_help_file[6]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_7", tl_settings.classic_help_file[7]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_8", tl_settings.classic_help_file[8]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_9", tl_settings.classic_help_file[9]  )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Classic]", "classic_help_file_tool", tl_settings.classic_help_file[10])


  #write to html-help section
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_file_base_url", tl_settings.help_file_base_url )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_system_type", tl_settings.help_system_type )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_uk", tl_settings.help_language_dir[1] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_sp", tl_settings.help_language_dir[2] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_de", tl_settings.help_language_dir[3] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_fr", tl_settings.help_language_dir[4] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_ar", tl_settings.help_language_dir[5] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_it", tl_settings.help_language_dir[6] )
  CALL configWriteToArray(p_cfg_file_id, "[Help-Html]", "help_html_path_ot", tl_settings.help_language_dir[7] )

  #write to File-Path section
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "toolbar_cfg_file_name", tl_settings.toolbar_cfg_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "tool_string_file_name", tl_settings.tool_string_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "tool_string_mono_file_name", tl_settings.tool_string_mono_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "string_file_name", tl_settings.string_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "string_mono_file_name", tl_settings.string_mono_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "help_url_mapping_file_name", tl_settings.help_url_mapping_file_name )
  CALL configWriteToArray(p_cfg_file_id, "[File-Path]", "dde_cfg_file_name", tl_settings.dde_cfg_file_name )

  #write to OnlineResource section
  CALL configWriteToArray(p_cfg_file_id, "[OnlineResource]", "online_demo_path", tl_settings.online_demo_path )

  #write to webservice section
  CALL configWriteToArray(p_cfg_file_id, "[WebService]", "ws_name", tl_settings.ws_name )
  CALL configWriteToArray(p_cfg_file_id, "[WebService]", "ws_port", tl_settings.ws_port )


  #write to print-html section
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_output", tl_settings.html_print_output )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_1", tl_settings.html_print_template[1] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_2", tl_settings.html_print_template[2] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_3", tl_settings.html_print_template[3] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_4", tl_settings.html_print_template[4] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_5", tl_settings.html_print_template[5] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_6", tl_settings.html_print_template[6] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_7", tl_settings.html_print_template[7] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html]", "html_print_template_8", tl_settings.html_print_template[8] )

  #write to print-html-image section
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_1", tl_settings.html_print_image[1] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_2", tl_settings.html_print_image[2] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_3", tl_settings.html_print_image[3] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_4", tl_settings.html_print_image[4] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_5", tl_settings.html_print_image[5] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_6", tl_settings.html_print_image[6] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_7", tl_settings.html_print_image[7] )
  CALL configWriteToArray(p_cfg_file_id, "[Print-Html-Image]", "html_print_image_8", tl_settings.html_print_image[8] )

  #write to dde section
  CALL configWriteToArray(p_cfg_file_id, "[dde]", "dde_timeout", tl_settings.dde_timeout)


END FUNCTION



###########################################################
# FUNCTION process_cfg_import(file_name)
#
# Import/Process cfg file
# Using tools from www.bbf7.de - rk-config
#
# RETURN ret
###########################################################
FUNCTION process_cfg_import(file_name)

DEFINE 
  file_name VARCHAR(100),
  ret SMALLINT,
  local_debug SMALLINT


  LET local_debug = FALSE  --0=off 1=on


############################################
# Using tools from www.bbf7.de - rk-config
############################################
  LET ret = configInit(file_name)
  #DISPLAY "ret=",ret
  #CALL fgl_channel_set_delimiter(file_name,"")

  #read from general section
  LET tl_settings.cfg_path       = configGet(ret, "[General]", "cfg_path")
  LET tl_settings.form_path      = configGet(ret, "[General]", "form_path")
  LET tl_settings.document_path  = configGet(ret, "[General]", "document_path")
  LET tl_settings.html_path      = configGet(ret, "[General]", "html_path")
  LET tl_settings.image_path     = configGet(ret, "[General]", "image_path")
  LET tl_settings.icon10_path    = configGet(ret, "[General]", "icon10_path")
  LET tl_settings.icon16_path    = configGet(ret, "[General]", "icon16_path")
  LET tl_settings.icon32_path    = configGet(ret, "[General]", "icon32_path")
  LET tl_settings.unl_path       = configGet(ret, "[General]", "unl_path")


  #read from classic 4gl help section
  LET tl_settings.msg_path                 = configGet(ret,    "[Help-Classic]", "msg_path")
  LET tl_settings.classic_help_multi_lang  = configGetInt(ret, "[Help-Classic]", "classic_help_multi_lang")
  LET tl_settings.classic_help_file[1]     = configGet(ret,    "[Help-Classic]", "classic_help_file_1")
  LET tl_settings.classic_help_file[2]     = configGet(ret,    "[Help-Classic]", "classic_help_file_2")
  LET tl_settings.classic_help_file[3]     = configGet(ret,    "[Help-Classic]", "classic_help_file_3")
  LET tl_settings.classic_help_file[4]     = configGet(ret,    "[Help-Classic]", "classic_help_file_4")
  LET tl_settings.classic_help_file[5]     = configGet(ret,    "[Help-Classic]", "classic_help_file_5")
  LET tl_settings.classic_help_file[6]     = configGet(ret,    "[Help-Classic]", "classic_help_file_6")
  LET tl_settings.classic_help_file[7]     = configGet(ret,    "[Help-Classic]", "classic_help_file_7")
  LET tl_settings.classic_help_file[8]     = configGet(ret,    "[Help-Classic]", "classic_help_file_8")
  LET tl_settings.classic_help_file[9]     = configGet(ret,    "[Help-Classic]", "classic_help_file_9")
  LET tl_settings.classic_help_file[10]    = configGet(ret,    "[Help-Classic]", "classic_help_file_tool")


  #read from html help section
  LET tl_settings.help_file_base_url       = configGet(ret,    "[Help-Html]", "help_file_base_url")
  LET tl_settings.help_system_type         = configGetInt(ret, "[Help-Html]", "help_system_type")
  LET tl_settings.help_language_dir[1]     = configGet(ret,    "[Help-Html]", "help_html_path_uk")
  LET tl_settings.help_language_dir[2]     = configGet(ret,    "[Help-Html]", "help_html_path_sp")
  LET tl_settings.help_language_dir[3]     = configGet(ret,    "[Help-Html]", "help_html_path_de")
  LET tl_settings.help_language_dir[4]     = configGet(ret,    "[Help-Html]", "help_html_path_fr")
  LET tl_settings.help_language_dir[5]     = configGet(ret,    "[Help-Html]", "help_html_path_ar")
  LET tl_settings.help_language_dir[6]     = configGet(ret,    "[Help-Html]", "help_html_path_it")
  LET tl_settings.help_language_dir[7]     = configGet(ret,    "[Help-Html]", "help_html_path_ot") 


  #read from File-Path section
  LET tl_settings.toolbar_cfg_file_name     = configGet(ret, "[File-Path]", "toolbar_cfg_file_name")
  LET tl_settings.tool_string_file_name     = configGet(ret, "[File-Path]", "tool_string_file_name")
  LET tl_settings.tool_string_mono_file_name= configGet(ret, "[File-Path]", "tool_string_mono_file_name")
  LET tl_settings.string_file_name          = configGet(ret, "[File-Path]", "string_file_name")
  LET tl_settings.string_mono_file_name     = configGet(ret, "[File-Path]", "string_mono_file_name")
  LET tl_settings.help_url_mapping_file_name= configGet(ret, "[File-Path]", "help_url_mapping_file_name")
  LET tl_settings.dde_cfg_file_name         = configGet(ret, "[File-Path]", "dde_cfg_file_name")

  #read from online section
  LET tl_settings.online_demo_path         = configGet(ret, "[OnlineResource]", "online_demo_path")


  #read from webservice section
  LET tl_settings.ws_name                  = configGet(ret, "[WebService]", "ws_name")
  LET tl_settings.ws_port                  = configGet(ret, "[WebService]", "ws_port")

  #read from language section
  LET tl_settings.languageId                 = configGetInt(ret, "[Language]", "language")
  LET tl_settings.language_file_ext[1]     = configGet(ret, "[Language]", "english_file_ext")
  LET tl_settings.language_file_ext[2]     = configGet(ret, "[Language]", "spanish_file_ext")
  LET tl_settings.language_file_ext[3]     = configGet(ret, "[Language]", "german_file_ext")
  LET tl_settings.language_file_ext[4]     = configGet(ret, "[Language]", "french_file_ext")
  LET tl_settings.language_file_ext[5]     = configGet(ret, "[Language]", "arabic_file_ext")
  LET tl_settings.language_file_ext[6]     = configGet(ret, "[Language]", "italian_file_ext")
  LET tl_settings.language_file_ext[7]     = configGet(ret, "[Language]", "other_file_ext")


  #read from print-html section

  LET tl_settings.html_print_output                = configGet(ret, "[Print-Html]", "html_print_output")
  LET tl_settings.html_print_template[1]           = configGet(ret, "[Print-Html]", "html_print_template_1")
  LET tl_settings.html_print_template[2]           = configGet(ret, "[Print-Html]", "html_print_template_2")
  LET tl_settings.html_print_template[3]           = configGet(ret, "[Print-Html]", "html_print_template_3")
  LET tl_settings.html_print_template[4]           = configGet(ret, "[Print-Html]", "html_print_template_4")
  LET tl_settings.html_print_template[5]           = configGet(ret, "[Print-Html]", "html_print_template_5")
  LET tl_settings.html_print_template[6]           = configGet(ret, "[Print-Html]", "html_print_template_6")
  LET tl_settings.html_print_template[7]           = configGet(ret, "[Print-Html]", "html_print_template_7")
  LET tl_settings.html_print_template[8]           = configGet(ret, "[Print-Html]", "html_print_template_8")

  #Print-Html-Image section
  LET tl_settings.html_print_image[1]           = configGet(ret, "[Print-Html-Image]", "html_print_image_1")
  LET tl_settings.html_print_image[2]           = configGet(ret, "[Print-Html-Image]", "html_print_image_2")
  LET tl_settings.html_print_image[3]           = configGet(ret, "[Print-Html-Image]", "html_print_image_3")
  LET tl_settings.html_print_image[4]           = configGet(ret, "[Print-Html-Image]", "html_print_image_4")
  LET tl_settings.html_print_image[5]           = configGet(ret, "[Print-Html-Image]", "html_print_image_5")
  LET tl_settings.html_print_image[6]           = configGet(ret, "[Print-Html-Image]", "html_print_image_6")
  LET tl_settings.html_print_image[7]           = configGet(ret, "[Print-Html-Image]", "html_print_image_7")
  LET tl_settings.html_print_image[8]           = configGet(ret, "[Print-Html-Image]", "html_print_image_8")

  #dde section
  LET tl_settings.dde_timeout                   = configGet(ret, "[dde]", "dde_timeout")


  #Debug information
  IF local_debug THEN
    DISPLAY "configInit() - file_name = ", file_name CLIPPED, "###############################"
    DISPLAY "configInit() - tl_settings.cfg_path=", tl_settings.cfg_path
    DISPLAY "configInit() - tl_settings.unl_path=", tl_settings.unl_path
    DISPLAY "configInit() - tl_settings.form_path=", tl_settings.form_path
    DISPLAY "configInit() - tl_settings.document_path=", tl_settings.document_path
    DISPLAY "configInit() - tl_settings.html_path=", tl_settings.html_path 
    DISPLAY "configInit() - tl_settings.image_path=", tl_settings.image_path
    DISPLAY "configInit() - tl_settings.icon10_path=", tl_settings.icon10_path
    DISPLAY "configInit() - tl_settings.icon16_path=", tl_settings.icon16_path
    DISPLAY "configInit() - tl_settings.icon32_path=", tl_settings.icon32_path

    DISPLAY "configInit() - tl_settings.msg_path=",                tl_settings.msg_path
    DISPLAY "configInit() - tl_settings.classic_help_multi_lang=", tl_settings.classic_help_multi_lang
    DISPLAY "configInit() - tl_settings.classic_help_file[1]=",    tl_settings.classic_help_file[1]
    DISPLAY "configInit() - tl_settings.classic_help_file[2]=",    tl_settings.classic_help_file[2]
    DISPLAY "configInit() - tl_settings.classic_help_file[3]=",    tl_settings.classic_help_file[3]
    DISPLAY "configInit() - tl_settings.classic_help_file[4]=",    tl_settings.classic_help_file[4]
    DISPLAY "configInit() - tl_settings.classic_help_file[5]=",    tl_settings.classic_help_file[5]
    DISPLAY "configInit() - tl_settings.classic_help_file[6]=",    tl_settings.classic_help_file[6]
    DISPLAY "configInit() - tl_settings.classic_help_file[7]=",    tl_settings.classic_help_file[7]
    DISPLAY "configInit() - tl_settings.classic_help_file[8]=",    tl_settings.classic_help_file[8]
    DISPLAY "configInit() - tl_settings.classic_help_file[9]=",    tl_settings.classic_help_file[9]
    DISPLAY "configInit() - tl_settings.classic_help_file[10]=",   tl_settings.classic_help_file[10]

    DISPLAY "configInit() - tl_settings.help_file_base_url=", tl_settings.help_file_base_url
    DISPLAY "configInit() - tl_settings.help_system_type=", tl_settings.help_system_type
    DISPLAY "configInit() - tl_settings.help_language_dir[1]=", tl_settings.help_language_dir[1]
    DISPLAY "configInit() - tl_settings.help_language_dir[2]=", tl_settings.help_language_dir[2]
    DISPLAY "configInit() - tl_settings.help_language_dir[3]=", tl_settings.help_language_dir[3]
    DISPLAY "configInit() - tl_settings.help_language_dir[4]=", tl_settings.help_language_dir[4]
    DISPLAY "configInit() - tl_settings.help_language_dir[5]=", tl_settings.help_language_dir[5]
    DISPLAY "configInit() - tl_settings.help_language_dir[6]=", tl_settings.help_language_dir[6]
    DISPLAY "configInit() - tl_settings.help_language_dir[7]=", tl_settings.help_language_dir[7]

    #file-path section
    DISPLAY "configInit() - tl_settings.toolbar_cfg_file_name=", tl_settings.toolbar_cfg_file_name
    DISPLAY "configInit() - tl_settings.tool_string_file_name=", tl_settings.tool_string_file_name
    DISPLAY "configInit() - tl_settings.tool_string_mono_file_name=", tl_settings.tool_string_mono_file_name
    DISPLAY "configInit() - tl_settings.string_file_name=", tl_settings.string_file_name
    DISPLAY "configInit() - tl_settings.string_mono_file_name=", tl_settings.string_mono_file_name
    DISPLAY "configInit() - tl_settings.help_url_mapping_file_name=", tl_settings.help_url_mapping_file_name
    DISPLAY "configInit() - tl_settings.dde_cfg_file_name=", tl_settings.dde_cfg_file_name

    #online section
    DISPLAY "configInit() - tl_settings.online_demo_path=", tl_settings.online_demo_path

    #webservice section
    DISPLAY "configInit() - tl_settings.ws_name=", tl_settings.ws_name
    DISPLAY "configInit() - tl_settings.ws_port=", tl_settings.ws_port

    #read from language section
    DISPLAY "configInit() - tl_settings.language_file_ext[1]=", tl_settings.language_file_ext[1]
    DISPLAY "configInit() - tl_settings.language_file_ext[2]=", tl_settings.language_file_ext[2]
    DISPLAY "configInit() - tl_settings.language_file_ext[3]=", tl_settings.language_file_ext[3]
    DISPLAY "configInit() - tl_settings.language_file_ext[4]=", tl_settings.language_file_ext[4]
    DISPLAY "configInit() - tl_settings.language_file_ext[5]=", tl_settings.language_file_ext[5]
    DISPLAY "configInit() - tl_settings.language_file_ext[6]=", tl_settings.language_file_ext[6]
    DISPLAY "configInit() - tl_settings.language_file_ext[7]=", tl_settings.language_file_ext[7]


    #dde section
    DISPLAY "configInit() - tl_settings.dde_timeout =", tl_settings.dde_timeout 

   
  END IF


  RETURN ret

END FUNCTION


###########################################################
# FUNCTION process_cfg_export(file_name)
#
# Export cfg data
#
# RETURN ret
###########################################################
FUNCTION process_cfg_export(file_name)
  DEFINE 
    ret SMALLINT,
    file_name VARCHAR(100)


  ############################################
  # Using tools from www.bbf7.de - rk-config
  ############################################
  LET ret = tl_settings.main_cfg_file_name  --configInit(file_name)

  #CALL fgl_channel_set_delimiter(file_name,"")

  #write to general section
  CALL configWrite(ret, "[General]", "unl_path", tl_settings.unl_path )
  CALL configWrite(ret, "[General]", "cfg_path", tl_settings.cfg_path )
  CALL configWrite(ret, "[General]", "form_path", tl_settings.form_path )
  CALL configWrite(ret, "[General]", "document_path", tl_settings.document_path )
  CALL configWrite(ret, "[General]", "html_path", tl_settings.html_path )
  CALL configWrite(ret, "[General]", "image_path", tl_settings.image_path )
  CALL configWrite(ret, "[General]", "icon10_path", tl_settings.icon10_path )
  CALL configWrite(ret, "[General]", "icon16_path", tl_settings.icon16_path )
  CALL configWrite(ret, "[General]", "icon32_path", tl_settings.icon32_path )


  #write to classic-help section
  CALL configWrite(ret, "[Help-Classic]", "msg_path", tl_settings.msg_path )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_multi_lang", tl_settings.classic_help_multi_lang )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_1", tl_settings.classic_help_file[1]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_2", tl_settings.classic_help_file[2]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_3", tl_settings.classic_help_file[3]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_4", tl_settings.classic_help_file[4]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_5", tl_settings.classic_help_file[5]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_6", tl_settings.classic_help_file[6]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_7", tl_settings.classic_help_file[7]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_8", tl_settings.classic_help_file[8]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_9", tl_settings.classic_help_file[9]  )
  CALL configWrite(ret, "[Help-Classic]", "classic_help_file_tool", tl_settings.classic_help_file[10])


  #write to html-help section
  CALL configWrite(ret, "[Help-Html]", "help_file_base_url", tl_settings.help_file_base_url )
  CALL configWrite(ret, "[Help-Html]", "help_system_type", tl_settings.help_system_type )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_uk", tl_settings.help_language_dir[1] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_sp", tl_settings.help_language_dir[2] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_de", tl_settings.help_language_dir[3] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_fr", tl_settings.help_language_dir[4] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_ar", tl_settings.help_language_dir[5] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_it", tl_settings.help_language_dir[6] )
  CALL configWrite(ret, "[Help-Html]", "help_html_path_ot", tl_settings.help_language_dir[7] )

  #write to File-Path section
  CALL configWrite(ret, "[File-Path]", "toolbar_cfg_file_name", tl_settings.toolbar_cfg_file_name )
  CALL configWrite(ret, "[File-Path]", "tool_string_file_name", tl_settings.tool_string_file_name )
  CALL configWrite(ret, "[File-Path]", "tool_string_mono_file_name", tl_settings.tool_string_mono_file_name )
  CALL configWrite(ret, "[File-Path]", "string_file_name", tl_settings.string_file_name )
  CALL configWrite(ret, "[File-Path]", "string_mono_file_name", tl_settings.string_mono_file_name )
  CALL configWrite(ret, "[File-Path]", "help_url_mapping_file_name", tl_settings.help_url_mapping_file_name )
  CALL configWrite(ret, "[File-Path]", "dde_cfg_file_name", tl_settings.dde_cfg_file_name )



  #write to OnlineResource section
  CALL configWrite(ret, "[OnlineResource]", "online_demo_path", tl_settings.online_demo_path )

  #read from webservice section
  CALL configWrite(ret, "[WebService]", "ws_name", tl_settings.ws_name )
  CALL configWrite(ret, "[WebService]", "ws_port", tl_settings.ws_port )

  #write to print-html section
  CALL configWrite(ret, "[Print-Html]", "html_print_output", tl_settings.html_print_output )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_1", tl_settings.html_print_template[1] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_2", tl_settings.html_print_template[2] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_3", tl_settings.html_print_template[3] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_4", tl_settings.html_print_template[4] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_5", tl_settings.html_print_template[5] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_6", tl_settings.html_print_template[6] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_7", tl_settings.html_print_template[7] )
  CALL configWrite(ret, "[Print-Html]", "html_print_template_8", tl_settings.html_print_template[8] )

  #write to print-html-image section
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_1", tl_settings.html_print_image[1] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_2", tl_settings.html_print_image[2] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_3", tl_settings.html_print_image[3] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_4", tl_settings.html_print_image[4] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_5", tl_settings.html_print_image[5] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_6", tl_settings.html_print_image[6] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_7", tl_settings.html_print_image[7] )
  CALL configWrite(ret, "[Print-Html-Image]", "html_print_image_8", tl_settings.html_print_image[8] )

  #write to dde section
  CALL configWrite(ret, "[dde]",              "dde_timeout", tl_settings.dde_timeout )


END FUNCTION

