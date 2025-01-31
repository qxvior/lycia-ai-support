#########################################################################################################
# DDE tools
#
# Created:
# 10.10.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#
#
# FUNCTION                                           DESCRIPTION                                                 RETURN
# run_local_application_with_server_doc(doc_name)    Transfers the document from the server to the client and    doc_name
#                                                    starts the associated application
# exec_error_check(error_message)                    Check execution for errors                                  dde_error_id
# dde_transfer_excel_cell(r,c,value)                 Transfer a value to a cell                                  NONE
# dde_excel_format_data()                            Select a cell and apply formatting                          NONE
# process_dde_cfg_import(file_name)                  Process dde configuration file                              ret
# dde_transfer_bookmark(bookmark,value)              Transfer a value to a bookmark in word                      NONE
# init_dde(p_app_name,p_file_name,timeout,p_debug)   Initialise the dde connection with the application name for tl_dde.success
#                                                    the dde (excel or winword) and document
# establish_dde_connection(p_document)               Connect to DDE client                                       tl_dde.success
#                                                   (argument can be SYSTEM or document name)
# dde_execute(command)                               To execute any dde command                                  tl_dde.success
#
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


###############################################################
# FUNCTION run_local_application_with_server_doc(doc_name)
#
# Transfers the document from the server to the client and starts the associated application
#
# RETURN doc_name
###############################################################
FUNCTION run_local_application_with_server_doc(p_doc_name)
  DEFINE 
    p_doc_name   VARCHAR(100),  
    doc_name     VARCHAR(200), --doc_name is the document name without  any path information
    local_debug  SMALLINT,
    err_msg      VARCHAR(200),
    success      SMALLINT

  LET local_debug = FALSE

  IF NOT fgl_test("e",p_doc_name) THEN
    #The specified document does not exist on the server
    LET err_msg = get_str_tool(673) CLIPPED, "\n", get_str_tool(673) CLIPPED, p_doc_name
    #File does not exist - 
    CALL fgl_winmessage(get_str_tool(672),err_msg,"error")
  END IF

  LET doc_name = fgl_download(p_doc_name, get_client_temp_path(p_doc_name))

  IF local_debug THEN
    DISPLAY "run_local_application_with_server_doc() - p_doc_name=", p_doc_name
    DISPLAY "run_local_application_with_server_doc() - doc_name=", doc_name
  END IF

  LET success = WinShellExec(doc_name)  -- 1 = error 0= OK

  IF success THEN
    LET err_msg = get_str_tool(671) CLIPPED, " ", p_doc_name CLIPPED
    CALL fgl_winmessage("Error in run_local_application_with_server_doc()",err_msg, "error")
  END IF

  IF local_debug THEN
    DISPLAY "run_local_application_with_server_doc() - success=", success
  END IF

  RETURN doc_name


END FUNCTION


#########################################################################################################
# FUNCTION dde_error_check(error_message)
#
# Check for DDE Errors
#
# RETURN dde_error_id
######################################################################################################### 
FUNCTION dde_error_check(error_message)
  DEFINE 
    error_message VARCHAR(200),
    error_titlebar_text VARCHAR(50)

  IF NOT tl_dde.success THEN
    #DISPLAY "DDE ERROR=" ,tl_dde.success  
    LET error_titlebar_text = "DDE Error: ", tl_dde.success 
    CALL fgl_winmessage(error_titlebar_text,error_message,"stop")
  END IF
  
END FUNCTION





#########################################################################################################
# FUNCTION dde_transfer_excel_cell(r,c,value,style)
#
# Transfer a value to a cell
#
# RETURN NONE
######################################################################################################### 
FUNCTION dde_transfer_excel_cell(r,c,ddeValue,ddeStyle)
  DEFINE 
    r,c,ddeStyle   SMALLINT,
    ddeValue       CHAR(2000),
    cell        VARCHAR(10),
    local_debug  SMALLINT

   LET local_debug = FALSE

  If local_debug THEN
    DISPLAY "dde_transfer_cell() - r=", r
    DISPLAY "dde_transfer_cell() - c=", c
    DISPLAY "dde_transfer_cell() - ddeValue=", ddeValue
    DISPLAY "dde_transfer_cell() - ddeStyle=", ddeStyle
  ENd IF

  LET cell = "R", trim(r), "C", trim(c) 
  LET ddeValue = "\'", ddeValue CLIPPED, "\'"

  LET tl_dde.success = DDEPoke(tl_dde.app_name, tl_dde.file_name, cell, ddeValue)
  
  IF tl_dde.debugState THEN
    DISPLAY tl_dde.success CLIPPED , "= DDEPoke(", tl_dde.app_name CLIPPED, ",", tl_dde.file_name CLIPPED, ",",  cell CLIPPED, ",", ddeValue CLIPPED, ")"
  END IF

  #Format Cell if a style id (>0) was specified
  IF ddeStyle > 0 THEN
    CALL dde_excel_format_data(cell,ddeStyle)
  END IF

END FUNCTION


#########################################################################################################
# FUNCTION dde_excel_format_data()
#
# Select a cell and apply formatting
#
# RETURN NONE
######################################################################################################### 
FUNCTION dde_excel_format_data(cell,ddeStyle)
  DEFINE 
    ddeStyle       SMALLINT,  --VARCHAR(200),
    local_debug SMALLINT,
    cell        VARCHAR(10),
    format_str  VARCHAR(300),
    err_msg     VARCHAR(200)

  LET local_debug = FALSE

  #Create the Format attribute string
  LET format_str = "FONT.PROPERTIES(",
                   "\"", tl_dde_excel_font_rec[ddeStyle].font           CLIPPED, "\",", 
                   "\"", tl_dde_excel_font_rec[ddeStyle].bold           CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].fontSize       CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].strike_through CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].super_script   CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].lower_script   CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].option_1       CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].option_2       CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].option_3       CLIPPED, "\",",
                   "\"", tl_dde_excel_font_rec[ddeStyle].color          CLIPPED, "\")"

  LET format_str = "[SELECT(\"", cell CLIPPED,  "\")][" , format_str , "]"
  LET tl_dde.success = DDEExecute(tl_dde.app_name,tl_dde.file_name, format_str)

  IF tl_dde.debugState THEN 
    DISPLAY "DDEExecute(", tl_dde.app_name CLIPPED, ",", tl_dde.file_name CLIPPED , ",", format_str CLIPPED, ")"
  END IF

  LET err_msg = get_str_tool(656) CLIPPED, "\n", get_str_tool(652) CLIPPED, tl_dde.app_name CLIPPED, "\n", get_str_tool(653) CLIPPED, tl_dde.file_name 
  CALL dde_error_check(err_msg)

###################################
# 1. font
# 2. bold
# 3. size
# 4. strike through
# 5. super (upper) script
# 6. lower script
#
# 7.color
# 1 = black
# 2 = white
# 5 = blue
# 6 = Yellow
#
# Please contact us if you have found any more references to Microsoft's OFFICE DDE Properties
# PS: Macros are also supported in Excel & Word
###################################


END FUNCTION





###########################################################
# FUNCTION process_dde_cfg_import(file_name)
#
# Process dde configuration file
#
# RETURN ret
###########################################################
FUNCTION process_dde_cfg_import(file_name)

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
  #LET tl_dde_excel_font_rec.cfg_path       = configGet(ret, "[General]", "cfg_path")

  #read from Font_01 section
  LET tl_dde_excel_font_rec[1].font               = configGet(ret,        "[Font_01]", "font")            -- Arial
  LET tl_dde_excel_font_rec[1].bold               = configGet(ret,        "[Font_01]", "bold")            -- false
  LET tl_dde_excel_font_rec[1].fontSize               = configGet(ret,        "[Font_01]", "size")            -- 10
  LET tl_dde_excel_font_rec[1].strike_through     = configGet(ret,        "[Font_01]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[1].super_script       = configGet(ret,        "[Font_01]", "super_script")    -- false
  LET tl_dde_excel_font_rec[1].lower_script       = configGet(ret,        "[Font_01]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[1].option_1           = configGet(ret,        "[Font_01]", "option_1")        -- false
  LET tl_dde_excel_font_rec[1].option_2           = configGet(ret,        "[Font_01]", "option_2")        -- false
  LET tl_dde_excel_font_rec[1].option_3           = configGet(ret,        "[Font_01]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[1].color              = configGet(ret,        "[Font_01]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 

  #read from Font_02 section
  LET tl_dde_excel_font_rec[2].font               = configGet(ret,        "[Font_02]", "font")            -- Arial
  LET tl_dde_excel_font_rec[2].bold               = configGet(ret,        "[Font_02]", "bold")            -- false
  LET tl_dde_excel_font_rec[2].fontSize               = configGet(ret,        "[Font_02]", "size")            -- 10
  LET tl_dde_excel_font_rec[2].strike_through     = configGet(ret,        "[Font_02]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[2].super_script       = configGet(ret,        "[Font_02]", "super_script")    -- false
  LET tl_dde_excel_font_rec[2].lower_script       = configGet(ret,        "[Font_02]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[2].option_1           = configGet(ret,        "[Font_02]", "option_1")        -- false
  LET tl_dde_excel_font_rec[2].option_2           = configGet(ret,        "[Font_02]", "option_2")        -- false
  LET tl_dde_excel_font_rec[2].option_3           = configGet(ret,        "[Font_02]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[2].color              = configGet(ret,        "[Font_02]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_03 section
  LET tl_dde_excel_font_rec[3].font               = configGet(ret,        "[Font_03]", "font")            -- Arial
  LET tl_dde_excel_font_rec[3].bold               = configGet(ret,        "[Font_03]", "bold")            -- false
  LET tl_dde_excel_font_rec[3].fontSize               = configGet(ret,        "[Font_03]", "size")            -- 10
  LET tl_dde_excel_font_rec[3].strike_through     = configGet(ret,        "[Font_03]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[3].super_script       = configGet(ret,        "[Font_03]", "super_script")    -- false
  LET tl_dde_excel_font_rec[3].lower_script       = configGet(ret,        "[Font_03]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[3].option_1           = configGet(ret,        "[Font_03]", "option_1")        -- false
  LET tl_dde_excel_font_rec[3].option_2           = configGet(ret,        "[Font_03]", "option_2")        -- false
  LET tl_dde_excel_font_rec[3].option_3           = configGet(ret,        "[Font_03]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[3].color              = configGet(ret,        "[Font_03]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_04 section
  LET tl_dde_excel_font_rec[4].font               = configGet(ret,        "[Font_04]", "font")            -- Arial
  LET tl_dde_excel_font_rec[4].bold               = configGet(ret,        "[Font_04]", "bold")            -- false
  LET tl_dde_excel_font_rec[4].fontSize               = configGet(ret,        "[Font_04]", "size")            -- 10
  LET tl_dde_excel_font_rec[4].strike_through     = configGet(ret,        "[Font_04]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[4].super_script       = configGet(ret,        "[Font_04]", "super_script")    -- false
  LET tl_dde_excel_font_rec[4].lower_script       = configGet(ret,        "[Font_04]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[4].option_1           = configGet(ret,        "[Font_04]", "option_1")        -- false
  LET tl_dde_excel_font_rec[4].option_2           = configGet(ret,        "[Font_04]", "option_2")        -- false
  LET tl_dde_excel_font_rec[4].option_3           = configGet(ret,        "[Font_04]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[4].color              = configGet(ret,        "[Font_04]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_05 section
  LET tl_dde_excel_font_rec[5].font               = configGet(ret,        "[Font_05]", "font")            -- Arial
  LET tl_dde_excel_font_rec[5].bold               = configGet(ret,        "[Font_05]", "bold")            -- false
  LET tl_dde_excel_font_rec[5].fontSize               = configGet(ret,        "[Font_05]", "size")            -- 10
  LET tl_dde_excel_font_rec[5].strike_through     = configGet(ret,        "[Font_05]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[5].super_script       = configGet(ret,        "[Font_05]", "super_script")    -- false
  LET tl_dde_excel_font_rec[5].lower_script       = configGet(ret,        "[Font_05]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[5].option_1           = configGet(ret,        "[Font_05]", "option_1")        -- false
  LET tl_dde_excel_font_rec[5].option_2           = configGet(ret,        "[Font_05]", "option_2")        -- false
  LET tl_dde_excel_font_rec[5].option_3           = configGet(ret,        "[Font_05]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[5].color              = configGet(ret,        "[Font_05]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_06 section
  LET tl_dde_excel_font_rec[6].font               = configGet(ret,        "[Font_06]", "font")            -- Arial
  LET tl_dde_excel_font_rec[6].bold               = configGet(ret,        "[Font_06]", "bold")            -- false
  LET tl_dde_excel_font_rec[6].fontSize               = configGet(ret,        "[Font_06]", "size")            -- 10
  LET tl_dde_excel_font_rec[6].strike_through     = configGet(ret,        "[Font_06]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[6].super_script       = configGet(ret,        "[Font_06]", "super_script")    -- false
  LET tl_dde_excel_font_rec[6].lower_script       = configGet(ret,        "[Font_06]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[6].option_1           = configGet(ret,        "[Font_06]", "option_1")        -- false
  LET tl_dde_excel_font_rec[6].option_2           = configGet(ret,        "[Font_06]", "option_2")        -- false
  LET tl_dde_excel_font_rec[6].option_3           = configGet(ret,        "[Font_06]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[6].color              = configGet(ret,        "[Font_06]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_07 section
  LET tl_dde_excel_font_rec[7].font               = configGet(ret,        "[Font_07]", "font")            -- Arial
  LET tl_dde_excel_font_rec[7].bold               = configGet(ret,        "[Font_07]", "bold")            -- false
  LET tl_dde_excel_font_rec[7].fontSize               = configGet(ret,        "[Font_07]", "size")            -- 10
  LET tl_dde_excel_font_rec[7].strike_through     = configGet(ret,        "[Font_07]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[7].super_script       = configGet(ret,        "[Font_07]", "super_script")    -- false
  LET tl_dde_excel_font_rec[7].lower_script       = configGet(ret,        "[Font_07]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[7].option_1           = configGet(ret,        "[Font_07]", "option_1")        -- false
  LET tl_dde_excel_font_rec[7].option_2           = configGet(ret,        "[Font_07]", "option_2")        -- false
  LET tl_dde_excel_font_rec[7].option_3           = configGet(ret,        "[Font_07]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[7].color              = configGet(ret,        "[Font_07]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_08 section
  LET tl_dde_excel_font_rec[8].font               = configGet(ret,        "[Font_08]", "font")            -- Arial
  LET tl_dde_excel_font_rec[8].bold               = configGet(ret,        "[Font_08]", "bold")            -- false
  LET tl_dde_excel_font_rec[8].fontSize               = configGet(ret,        "[Font_08]", "size")            -- 10
  LET tl_dde_excel_font_rec[8].strike_through     = configGet(ret,        "[Font_08]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[8].super_script       = configGet(ret,        "[Font_08]", "super_script")    -- false
  LET tl_dde_excel_font_rec[8].lower_script       = configGet(ret,        "[Font_08]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[8].option_1           = configGet(ret,        "[Font_08]", "option_1")        -- false
  LET tl_dde_excel_font_rec[8].option_2           = configGet(ret,        "[Font_08]", "option_2")        -- false
  LET tl_dde_excel_font_rec[8].option_3           = configGet(ret,        "[Font_08]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[8].color              = configGet(ret,        "[Font_08]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 



  #read from Font_09 section
  LET tl_dde_excel_font_rec[9].font               = configGet(ret,        "[Font_09]", "font")            -- Arial
  LET tl_dde_excel_font_rec[9].bold               = configGet(ret,        "[Font_09]", "bold")            -- false
  LET tl_dde_excel_font_rec[9].fontSize               = configGet(ret,        "[Font_09]", "size")            -- 10
  LET tl_dde_excel_font_rec[9].strike_through     = configGet(ret,        "[Font_09]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[9].super_script       = configGet(ret,        "[Font_09]", "super_script")    -- false
  LET tl_dde_excel_font_rec[9].lower_script       = configGet(ret,        "[Font_09]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[9].option_1           = configGet(ret,        "[Font_09]", "option_1")        -- false
  LET tl_dde_excel_font_rec[9].option_2           = configGet(ret,        "[Font_09]", "option_2")        -- false
  LET tl_dde_excel_font_rec[9].option_3           = configGet(ret,        "[Font_09]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[9].color              = configGet(ret,        "[Font_09]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_10 section
  LET tl_dde_excel_font_rec[10].font               = configGet(ret,        "[Font_10]", "font")            -- Arial
  LET tl_dde_excel_font_rec[10].bold               = configGet(ret,        "[Font_10]", "bold")            -- false
  LET tl_dde_excel_font_rec[10].fontSize               = configGet(ret,        "[Font_10]", "size")            -- 10
  LET tl_dde_excel_font_rec[10].strike_through     = configGet(ret,        "[Font_10]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[10].super_script       = configGet(ret,        "[Font_10]", "super_script")    -- false
  LET tl_dde_excel_font_rec[10].lower_script       = configGet(ret,        "[Font_10]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[10].option_1           = configGet(ret,        "[Font_10]", "option_1")        -- false
  LET tl_dde_excel_font_rec[10].option_2           = configGet(ret,        "[Font_10]", "option_2")        -- false
  LET tl_dde_excel_font_rec[10].option_3           = configGet(ret,        "[Font_10]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[10].color              = configGet(ret,        "[Font_10]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #read from Font_11 section
  LET tl_dde_excel_font_rec[11].font               = configGet(ret,        "[Font_11]", "font")            -- Arial
  LET tl_dde_excel_font_rec[11].bold               = configGet(ret,        "[Font_11]", "bold")            -- false
  LET tl_dde_excel_font_rec[11].fontSize               = configGet(ret,        "[Font_11]", "size")            -- 10
  LET tl_dde_excel_font_rec[11].strike_through     = configGet(ret,        "[Font_11]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[11].super_script       = configGet(ret,        "[Font_11]", "super_script")    -- false
  LET tl_dde_excel_font_rec[11].lower_script       = configGet(ret,        "[Font_11]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[11].option_1           = configGet(ret,        "[Font_11]", "option_1")        -- false
  LET tl_dde_excel_font_rec[11].option_2           = configGet(ret,        "[Font_11]", "option_2")        -- false
  LET tl_dde_excel_font_rec[11].option_3           = configGet(ret,        "[Font_11]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[11].color              = configGet(ret,        "[Font_11]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 



  #read from Font_12 section
  LET tl_dde_excel_font_rec[12].font               = configGet(ret,        "[Font_12]", "font")            -- Arial
  LET tl_dde_excel_font_rec[12].bold               = configGet(ret,        "[Font_12]", "bold")            -- false
  LET tl_dde_excel_font_rec[12].fontSize               = configGet(ret,        "[Font_12]", "size")            -- 10
  LET tl_dde_excel_font_rec[12].strike_through     = configGet(ret,        "[Font_12]", "strike_through")  -- false
  LET tl_dde_excel_font_rec[12].super_script       = configGet(ret,        "[Font_12]", "super_script")    -- false
  LET tl_dde_excel_font_rec[12].lower_script       = configGet(ret,        "[Font_12]", "lower_script")    -- false
  LET tl_dde_excel_font_rec[12].option_1           = configGet(ret,        "[Font_12]", "option_1")        -- false
  LET tl_dde_excel_font_rec[12].option_2           = configGet(ret,        "[Font_12]", "option_2")        -- false
  LET tl_dde_excel_font_rec[12].option_3           = configGet(ret,        "[Font_12]", "option_3")        -- 1
  LET tl_dde_excel_font_rec[12].color              = configGet(ret,        "[Font_12]", "color")           -- 5  color 1 = black 2 = white  5 = blue 6 = Yellow 


  #Debug information
  IF local_debug THEN
    DISPLAY "process_dde_cfg_import() - file_name = ", file_name CLIPPED, "###############################"

    #Read from Font_01 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].font  = ",           tl_dde_excel_font_rec[1].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].bold  = ",           tl_dde_excel_font_rec[1].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].size  = ",           tl_dde_excel_font_rec[1].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].strike_through  = ", tl_dde_excel_font_rec[1].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].super_script  = ",   tl_dde_excel_font_rec[1].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].lower_script  = ",   tl_dde_excel_font_rec[1].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].option_1  = ",       tl_dde_excel_font_rec[1].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].option_2  = ",       tl_dde_excel_font_rec[1].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].option_3  = ",       tl_dde_excel_font_rec[1].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[1].color  = ",          tl_dde_excel_font_rec[1].color 

    #Read from Font_02 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].font  = ",           tl_dde_excel_font_rec[2].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].bold  = ",           tl_dde_excel_font_rec[2].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].size  = ",           tl_dde_excel_font_rec[2].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].strike_through  = ", tl_dde_excel_font_rec[2].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].super_script  = ",   tl_dde_excel_font_rec[2].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].lower_script  = ",   tl_dde_excel_font_rec[2].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].option_1  = ",       tl_dde_excel_font_rec[2].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].option_2  = ",       tl_dde_excel_font_rec[2].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].option_3  = ",       tl_dde_excel_font_rec[2].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[2].color  = ",          tl_dde_excel_font_rec[2].color 
    #Read from Font_03 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].font  = ",           tl_dde_excel_font_rec[3].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].bold  = ",           tl_dde_excel_font_rec[3].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].size  = ",           tl_dde_excel_font_rec[3].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].strike_through  = ", tl_dde_excel_font_rec[3].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].super_script  = ",   tl_dde_excel_font_rec[3].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].lower_script  = ",   tl_dde_excel_font_rec[3].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].option_1  = ",       tl_dde_excel_font_rec[3].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].option_2  = ",       tl_dde_excel_font_rec[3].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].option_3  = ",       tl_dde_excel_font_rec[3].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[3].color  = ",          tl_dde_excel_font_rec[3].color 
    #Read from Font_04 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].font  = ",           tl_dde_excel_font_rec[4].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].bold  = ",           tl_dde_excel_font_rec[4].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].size  = ",           tl_dde_excel_font_rec[4].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].strike_through  = ", tl_dde_excel_font_rec[4].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].super_script  = ",   tl_dde_excel_font_rec[4].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].lower_script  = ",   tl_dde_excel_font_rec[4].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].option_1  = ",       tl_dde_excel_font_rec[4].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].option_2  = ",       tl_dde_excel_font_rec[4].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].option_3  = ",       tl_dde_excel_font_rec[4].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[4].color  = ",          tl_dde_excel_font_rec[4].color 

    #Read from Font_05 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].font  = ",           tl_dde_excel_font_rec[5].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].bold  = ",           tl_dde_excel_font_rec[5].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].size  = ",           tl_dde_excel_font_rec[5].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].strike_through  = ", tl_dde_excel_font_rec[5].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].super_script  = ",   tl_dde_excel_font_rec[5].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].lower_script  = ",   tl_dde_excel_font_rec[5].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].option_1  = ",       tl_dde_excel_font_rec[5].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].option_2  = ",       tl_dde_excel_font_rec[5].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].option_3  = ",       tl_dde_excel_font_rec[5].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[5].color  = ",          tl_dde_excel_font_rec[5].color 

    #Read from Font_06 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].font  = ",           tl_dde_excel_font_rec[6].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].bold  = ",           tl_dde_excel_font_rec[6].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].size  = ",           tl_dde_excel_font_rec[6].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].strike_through  = ", tl_dde_excel_font_rec[6].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].super_script  = ",   tl_dde_excel_font_rec[6].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].lower_script  = ",   tl_dde_excel_font_rec[6].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].option_1  = ",       tl_dde_excel_font_rec[6].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].option_2  = ",       tl_dde_excel_font_rec[6].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].option_3  = ",       tl_dde_excel_font_rec[6].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[6].color  = ",          tl_dde_excel_font_rec[6].color 

    #Read from Font_07 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].font  = ",           tl_dde_excel_font_rec[7].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].bold  = ",           tl_dde_excel_font_rec[7].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].size  = ",           tl_dde_excel_font_rec[7].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].strike_through  = ", tl_dde_excel_font_rec[7].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].super_script  = ",   tl_dde_excel_font_rec[7].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].lower_script  = ",   tl_dde_excel_font_rec[7].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].option_1  = ",       tl_dde_excel_font_rec[7].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].option_2  = ",       tl_dde_excel_font_rec[7].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].option_3  = ",       tl_dde_excel_font_rec[7].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[7].color  = ",          tl_dde_excel_font_rec[7].color 

    #Read from Font_08 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].font  = ",           tl_dde_excel_font_rec[8].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].bold  = ",           tl_dde_excel_font_rec[8].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].size  = ",           tl_dde_excel_font_rec[8].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].strike_through  = ", tl_dde_excel_font_rec[8].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].super_script  = ",   tl_dde_excel_font_rec[8].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].lower_script  = ",   tl_dde_excel_font_rec[8].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].option_1  = ",       tl_dde_excel_font_rec[8].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].option_2  = ",       tl_dde_excel_font_rec[8].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].option_3  = ",       tl_dde_excel_font_rec[8].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[8].color  = ",          tl_dde_excel_font_rec[8].color 

    #Read from Font_09 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].font  = ",           tl_dde_excel_font_rec[9].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].bold  = ",           tl_dde_excel_font_rec[9].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].size  = ",           tl_dde_excel_font_rec[9].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].strike_through  = ", tl_dde_excel_font_rec[9].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].super_script  = ",   tl_dde_excel_font_rec[9].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].lower_script  = ",   tl_dde_excel_font_rec[9].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].option_1  = ",       tl_dde_excel_font_rec[9].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].option_2  = ",       tl_dde_excel_font_rec[9].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].option_3  = ",       tl_dde_excel_font_rec[9].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[9].color  = ",          tl_dde_excel_font_rec[9].color 

    #Read from Font_10 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].font  = ",           tl_dde_excel_font_rec[10].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].bold  = ",           tl_dde_excel_font_rec[10].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].size  = ",           tl_dde_excel_font_rec[10].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].strike_through  = ", tl_dde_excel_font_rec[10].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].super_script  = ",   tl_dde_excel_font_rec[10].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].lower_script  = ",   tl_dde_excel_font_rec[10].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].option_1  = ",       tl_dde_excel_font_rec[10].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].option_2  = ",       tl_dde_excel_font_rec[10].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].option_3  = ",       tl_dde_excel_font_rec[10].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[10].color  = ",          tl_dde_excel_font_rec[10].color 

    #Read from Font_11 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].font  = ",           tl_dde_excel_font_rec[11].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].bold  = ",           tl_dde_excel_font_rec[11].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].size  = ",           tl_dde_excel_font_rec[11].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].strike_through  = ", tl_dde_excel_font_rec[11].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].super_script  = ",   tl_dde_excel_font_rec[11].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].lower_script  = ",   tl_dde_excel_font_rec[11].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].option_1  = ",       tl_dde_excel_font_rec[11].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].option_2  = ",       tl_dde_excel_font_rec[11].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].option_3  = ",       tl_dde_excel_font_rec[11].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[11].color  = ",          tl_dde_excel_font_rec[11].color 

    #Read from Font_12 section
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].font  = ",           tl_dde_excel_font_rec[12].font 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].bold  = ",           tl_dde_excel_font_rec[12].bold 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].size  = ",           tl_dde_excel_font_rec[12].fontSize 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].strike_through  = ", tl_dde_excel_font_rec[12].strike_through 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].super_script  = ",   tl_dde_excel_font_rec[12].super_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].lower_script  = ",   tl_dde_excel_font_rec[12].lower_script 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].option_1  = ",       tl_dde_excel_font_rec[12].option_1 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].option_2  = ",       tl_dde_excel_font_rec[12].option_2 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].option_3  = ",       tl_dde_excel_font_rec[12].option_3 
    DISPLAY "process_dde_cfg_import() - tl_dde_excel_font_rec[12].color  = ",          tl_dde_excel_font_rec[12].color 

  END IF


  RETURN ret

END FUNCTION

#########################################################################################################
# FUNCTION dde_transfer_bookmark(bookmark,value)
#
# Transfer a value to a bookmark in word
#
# RETURN NONE
######################################################################################################### 
FUNCTION dde_transfer_bookmark(bookmark,ddeValue)
  DEFINE 
    bookmark    VARCHAR(50),  --Word bookmark
    ddeValue       CHAR(2000),
    local_debug SMALLINT

  LET local_debug = FALSE

  LET ddeValue = "'", ddeValue CLIPPED, "'"

  CALL ddepoke(tl_dde.app_name,tl_dde.file_name,bookmark,ddeValue)

END FUNCTION



####################################################################
# FUNCTION init_dde(p_app_name,p_file_name,p_timeout,p_debug)
#
# Initialise the dde connection with the application name for the dde (excel or winword) and document
#
# RETURN tl_dde.success
####################################################################
FUNCTION init_dde(p_app_name,p_file_name,p_file_name_with_path,p_timeout, p_debug)
  DEFINE 
    p_app_name   VARCHAR(200),
    p_file_name  VARCHAR(100),
    p_file_name_with_path  VARCHAR(250),
    p_debug      SMALLINT,
    p_timeout    SMALLINT,
    err_msg      VARCHAR(250),
    tmp_str      VARCHAR(250)

  LET tl_dde.debugState = p_debug

  IF p_timeout is NULL THEN  #default config dde timeout could be overwritten by function call
    LET tl_dde.ddeTimeout = tl_settings.dde_timeout
  ELSE
    LET tl_dde.ddeTimeout = p_timeout
  END IF

  #Only assign app_name value if argument is not empty
  IF p_app_name IS NULL THEN
    CALL fgl_winmessage(get_str_tool(660),"Function init_dde()\nArgument p_app_name is NULL", "error")
  ELSE
    LET tl_dde.app_name = p_app_name
  END IF

  #Atempt to connect using SYSTEM
  LET tl_dde.file_name = "SYSTEM"
  LET tl_dde.success = establish_dde_connection()

  #sleep 2
  #Save the document to be sure it works
  #CALL dde_execute("[FileSave]",TRUE)

  #Save 'AS' the document to be sure it works
  #Seems like I can execute this, and it saves the file using a different name, but the DDE Service returns an Error .... Microsoft.. a dream comes true
  #doesn't work -> LET tmp_str = "[FileSaveAS" , "\"",  trim(p_file_name_with_path), "\",0]"
  #doesn't work -> LET tmp_str = "[FileSaveAS" , "\"",  "c:\\", trim(p_file_name), ".doc\",0]"
  #this works   -> LET tmp_str = "[FileSaveAS" , "\"",  trim(p_file_name), ".doc\",0]"

  IF p_app_name = "winword" THEN
    LET tmp_str = "[FileSaveAS" , "\"",  trim(p_file_name), "\",0]"
    CALL dde_execute(trim(tmp_str),TRUE)
  END IF

  #Only assign file_name value if argument is not empty
  IF p_file_name IS NULL THEN
    #Error in dde tools library - Function init_dde()\nArgument p_file_name is NULL
    LET err_msg = "init_dde()\nArgument p_file_name = NULL" 
    CALL fgl_winmessage(get_str_tool(660),err_msg, "error")
  ELSE
    LET tl_dde.file_name = p_file_name
  END IF  

  #Atempt to connect
  LET tl_dde.success = establish_dde_connection()

  #Save the document to be sure it works
  #CALL dde_execute("[FileSave]",TRUE)


  RETURN tl_dde.success
END FUNCTION


######################################################################################################
# FUNCTION establish_dde_connection(p_document)
#
# Connect to DDE client (argument can be SYSTEM or document name)
#
# RETURN tl_dde.success
######################################################################################################
FUNCTION establish_dde_connection()
  DEFINE 
    err_msg     VARCHAR(200),
    i           SMALLINT

  LET i = 0
  LET tl_dde.success = DDEConnect(tl_dde.app_name,tl_dde.file_name) 
  
  IF tl_dde.debugState THEN
    #DISPLAY "establish_dde_connection()"
    DISPLAY tl_dde.success CLIPPED, "= DDEConnect(", tl_dde.app_name CLIPPED, ",", tl_dde.file_name CLIPPED, ")"
  END IF
  

  WHILE NOT tl_dde.success AND i < tl_dde.ddeTimeout  --loop until sucessfull limit connection attempts by tl_dde.timeout

    SLEEP 1
  
    LET tl_dde.success = DDEConnect(tl_dde.app_name,tl_dde.file_name) 

    IF tl_dde.debugState THEN
      DISPLAY tl_dde.success CLIPPED, "= DDEConnect(", tl_dde.app_name CLIPPED, ",", tl_dde.file_name CLIPPED, ")"
    END IF

    LET i = i + 1

  END WHILE

  #prepare possible error message for -> DDE connect failed !
  LET err_msg = get_str_tool(655) CLIPPED, "\n", get_str_tool(652) CLIPPED, tl_dde.app_name, "   ", get_str_tool(653) CLIPPED 
  CALL dde_error_check(err_msg)

  RETURN tl_dde.success
 
END FUNCTION


############################################################
# FUNCTION dde_execute(command)
#
# To execute any dde command
#
# RETURN tl_dde.success
############################################################
FUNCTION dde_execute(command,error_check)
  DEFINE
    command     VARCHAR(300),
    err_msg     VARCHAR(200),
    error_check SMALLINT


  LET tl_dde.success =  DDEExecute(tl_dde.app_name,tl_dde.file_name,command)	--	Prints the current area

  #Display entire dde call if debug is turned on
  IF tl_dde.debugState THEN
    DISPLAY tl_dde.success CLIPPED, " = DDEExecute(" , tl_dde.app_name CLIPPED, "," , tl_dde.file_name CLIPPED, "," , command CLIPPED, ")" 
  END IF

  #Many DDE execute commands return errors (but they work) - guess this is a timing problem...
  IF error_check THEN
    LET err_msg = get_str_tool(651) CLIPPED, "\n", get_str_tool(652) CLIPPED, tl_dde.app_name, "   ", get_str_tool(653) CLIPPED, tl_dde.file_name CLIPPED, "\n", get_str_tool(654) CLIPPED, command 
    CALL dde_error_check(err_msg)
  END IF

  RETURN tl_dde.success

END FUNCTION

