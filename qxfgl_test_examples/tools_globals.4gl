################################################################################
# Globals file for the tools library
#
#
#
################################################################################


#DATABASE cms

GLOBALS

  #DEFINE 
    #main_cfg_file_id SMALLINT, 
    #main_cfg_file_name VARCHAR(100)

  #new stuff
  DEFINE tl_glob_int_switch SMALLINT

  DEFINE tl_err_msg,tl_tmp_str VARCHAR(250)

  #DEFINE exit_menu SMALLINT  
#  define 
#    cust_picture ARRAY[5] OF STRING
  #Settings
  #DEFINE language SMALLINT
  DEFINE tl_settings 
    RECORD
      cfg_path STRING,                      --directory name for config files
      unl_path STRING,                      --directory name for unl files
      form_path STRING,                     --directory name for forms
      msg_path STRING,                      --directory name for forms
      document_path STRING,                 --directory name for documents
      html_path STRING,                     --directory name for html documents
      image_path STRING,                    --directory name for normal images
      icon10_path STRING,                   --directory name for 16x16 icons
      icon16_path STRING,                   --directory name for 16x16 icons
      icon32_path STRING,                   --directory name for 32x32 icons

      #specific files inc. path
      main_cfg_file_name         VARCHAR(100),    --main configuration file name & Path    default: cfg/config.cfg
      toolbar_cfg_file_name      VARCHAR(100),    --toolbar configuration/ini unl file name  default: toolbar.cfg
      tool_string_file_name      VARCHAR(100),    --multi lingual string file for tools lib  default: string_tool.unl
      tool_string_mono_file_name VARCHAR(100),    --Single language string file for tools lib  default: string_mono_tool.unl
      string_file_name           VARCHAR(100),    --multi lingual string file for application    default: string.unl
      string_mono_file_name      VARCHAR(100),    --Single language string file for application  default: string_mono.unl
      help_url_mapping_file_name VARCHAR(100),    --File with HTML help URL mapping  default: help_url_mapping.unl
      dde_cfg_file_name          VARCHAR(100),    --File with DDE configuration
      online_demo_path           VARCHAR(150),    --URL for online self running demo


      classic_help_multi_lang  SMALLINT,              --if classic help file supports multi languages
      classic_help_file ARRAY[10] OF VARCHAR(30),     --file names for classic 4gl help files 
                                                      --help files must exist in dif. lang by using file name endings _de _uk _ar _fr _sp ...

      languageId SMALLINT,                              --language
      language_file_ext ARRAY[10] OF CHAR(2),         -- file extension difference for different languages i.e. help_uk , help_de etc..

      help_file_base_url VARCHAR(200),
      help_system_type SMALLINT,
      help_language_dir ARRAY[10] OF VARCHAR(30),     --directory name for html help base directory urls

      ws_name VARCHAR(100),                           --Webservice Name
      ws_port VARCHAR(100),                           --Webservice Port

      html_print_output VARCHAR(150),                 --Dynamically created print html (output) name inc. rel. path
      html_print_template ARRAY[10] OF VARCHAR(80),   --Template file names for html print
      html_print_image ARRAY[10] OF VARCHAR(100),       --Image locations for print html

      dde_timeout SMALLINT                            --timeout for dde tools
    END RECORD

  DEFINE
    tl_previous_help_file_id SMALLINT,
    tl_current_help_file_id SMALLINT

  DEFINE 
    tl_server_client_user_temp_directory VARCHAR(255),  -- used for the temp drive on the client
    tl_server_temp_directory VARCHAR(255),  -- used for the server temp drive
    tl_client_temp_directory VARCHAR(255),  -- used for the application temp drive in the clients cache directory
    #client_cache_directory VARCHAR(255),         -- used for the clients cache directory

    tl_user_name VARCHAR(30)


#####################################################
# Html - Help System
#####################################################
  DEFINE 
    tl_helphtml ARRAY[1000] OF 
      RECORD
        help_id SMALLINT,
        help_html_file VARCHAR(60)
      END RECORD,
    tl_current_help_id SMALLINT,
    tl_help_html_array_size SMALLINT,
    tl_help_config_file VARCHAR(200),
    tl_help_target_current VARCHAR(200),
    tl_help_target_source VARCHAR(200)
    #tl_help_system_type SMALLINT


#################################################################################
#  International Toolbar Icons / key labels
#################################################################################

  DEFINE 
    t_tl_toolbar TYPE AS 
      RECORD
        m_name STRING,
        m_item STRING,
        action_time SMALLINT,
        action SMALLINT,
        dialog SMALLINT,
        event STRING,  --changed from 10 to 30 21.01.2014 H.Hoelzl
        txt_en STRING,
        txt_sp STRING,
        txt_de STRING,
        txt_fr STRING,
        txt_ar STRING,
        txt_it STRING,
        txt_ot STRING,
        image STRING,
        ord SMALLINT,
        stat SMALLINT
      END RECORD

  DEFINE 
    tl_toolbar ARRAY[300] OF t_tl_toolbar,
    tl_toolbar_array_size SMALLINT

  DEFINE 
    t_tl_toolbar_short TYPE AS
      RECORD
        m_name STRING,
        m_item STRING,
        event STRING,
        stat SMALLINT,
        action SMALLINT,
        ord SMALLINT,
        txt_en STRING,
        dialog SMALLINT,
        action_time SMALLINT,
        image STRING
      END RECORD


{
#######################################################################
# Grid column header record
#######################################################################
  DEFINE grid_header ARRAY[6] OF RECORD
    col_name VARCHAR(30),
    col_label VARCHAR(30),
    col_alignment VARCHAR(10),
    col_key VARCHAR(10)
  END RECORD
}

#######################################################################
# International / multi lingual Strings
#######################################################################
  DEFINE 
    tl_multi_lingual_tool_str ARRAY[1000] OF 
      RECORD
        txt_en VARCHAR(100),
        txt_sp VARCHAR(100),
        txt_de VARCHAR(100),
        txt_fr VARCHAR(100),
        txt_ar VARCHAR(100),
        txt_it VARCHAR(100),
        txt_ot VARCHAR(100)
      END RECORD,
    tl_multi_lingual_tool_str_array_size SMALLINT


  DEFINE
    tl_multi_lingual_prog_str ARRAY[2500] OF 
      RECORD
        txt_en VARCHAR(100),
        txt_sp VARCHAR(100),
        txt_de VARCHAR(100),
        txt_fr VARCHAR(100),
        txt_ar VARCHAR(100),
        txt_it VARCHAR(100),
        txt_ot VARCHAR(100)
      END RECORD,
    tl_multi_lingual_prog_str_array_size SMALLINT


    #just used for the initial import - string record array population
    DEFINE tl_tmp_int_str 
      RECORD
        id     SMALLINT,
        txt_en VARCHAR(100),
        txt_sp VARCHAR(100),
        txt_de VARCHAR(100),
        txt_fr VARCHAR(100),
        txt_ar VARCHAR(100),
        txt_it VARCHAR(100),
        txt_ot VARCHAR(100)
      END RECORD

    #Mono Language Strings


#######################################################################
# Mono/Single Language Strings (NON Translated / multi lingual Strings)
#######################################################################
  DEFINE
    tl_mono_lang_tool_str ARRAY[200] OF VARCHAR(150),
    tl_mono_lang_tool_str_array_size SMALLINT

  DEFINE
    tl_mono_lang_prog_str ARRAY[200] OF VARCHAR(150),
    tl_mono_lang_prog_str_array_size SMALLINT



#######################################################################
# DDE
#######################################################################

  DEFINE
    tl_dde
      RECORD
        debugState      SMALLINT,
        app_name   VARCHAR(30),
        file_name  VARCHAR(200),
        success    SMALLINT,
        ddeTimeout    SMALLINT
      END RECORD
{
  DEFINE
    #tmp_str VARCHAR(300),
    
    tl_prompt_rec1 RECORD
      fl_1, fl_title VARCHAR(200),
      f1 VARCHAR(200)
    END RECORD,

    tl_dde_cell RECORD
      f_dde_row SMALLINT,
      f_dde_column SMALLINT
    END RECORD,

  tl_dde_settings 
    RECORD
      f_exec_program VarChar(200),
      f_exec_return SMALLINT,
      f_dde_program VarChar(30),
      f_dde_document VARCHAR(100),
      f_dde_sheet VARCHAR(100),
      f_dde_command VARCHAR(200),
      f_file_source VarChar(100),
      f_file_target VARCHAR(100),
      f_rl CHAR(1),
      f_cl CHAR(1),
      f_bookmark VARCHAR(50),
      f_dde_row SMALLINT,
      f_dde_column SMALLINT,
      f_dde_cell VARCHAR(100),
      f_dde_return SMALLINT,
      f_dde_error VARCHAR(100),
      f_entire_dde_statement VARCHAR(200)
    END RECORD
}
#DDE Font Settings
# Would be nice to have some DDE docs to get some sense out of this...
  DEFINE 
    tl_dde_excel_font_rec ARRAY[12] OF 
      RECORD
        font             VARCHAR(30), --VARCHAR(30),   -- Arial
        bold             VARCHAR(30), --SMALLINT,      -- false
        fontSize         VARCHAR(30), --SMALLINT,      --  = 10
        strike_through   VARCHAR(30), --SMALLINT,      --  = false
        super_script     VARCHAR(30), --SMALLINT,      --  = false
        lower_script     VARCHAR(30), --SMALLINT,      --  = false
        option_1         VARCHAR(30), --SMALLINT,      --  = false
        option_2         VARCHAR(30), --SMALLINT,      --  = false
        option_3         VARCHAR(30), --SMALLINT,      --  = 1
        color            VARCHAR(30) --SMALLINT       --  = 5
      END RECORD

#7.color
#1 = black
#2 = white
#5 = blue
#6 = Yellow
#Please contact us if you have found any more references to Microsoft's OFFICE DDE Properties .. but you can of course also use macros


END GLOBALS

