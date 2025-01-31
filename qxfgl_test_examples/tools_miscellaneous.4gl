#########################################################################################################
# General functions/tools (Depend on the data structure/globals)
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# int_flag_false()                                Set int_flag false                                         NONE
# set_toggle_switch(p_int)                        Initialise toggle switch                                   NONE
# get_toggle_switch()                             Get current switch toggle value                            glob_int_switch
# toggle_switch()                                 Toggle the global toggle switch                            NONE
# toggle_switch_on()                              Turn the global toggle switch on (value 1)                 NONE
# hotlink_config_string_wrapper                   hotlinks have got a 2-part config string,                  ret
# (first_arg,second_arg)                          each surounded by curly braces {} and seperated by a space
# unique_doc_name(base_name,file_extension)       create a unique & valid document name based on the         ret
# get_4gl_window_information()                    Retrieve and display window information                    NONE                                                current date & time                                   
# gwinfo_display_application_information()        Sub-Function of get_4gl_window_information()               NONE    
#                                                 function to display 4GL window data
#
# 
#########################################################################################################

############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


FUNCTION column_sort(p_cur_ord_field,p_new_ord_field)
  DEFINE 
    p_cur_ord_field,p_new_ord_field VARCHAR(80)


        IF p_cur_ord_field = p_new_ord_field THEN
          CALL toggle_switch()
        ELSE 
          CALL toggle_switch_on()
        END IF

    RETURN p_new_ord_field,p_new_ord_field
END FUNCTION

######################################################
# FUNCTION int_flag_false()
#
# Set int_flag false
#
# RETURN NONE
######################################################
FUNCTION int_flag_false()
  LET int_flag = FALSE
END FUNCTION


######################################################
# FUNCTION set_toggle_switch(p_int)
#
# Initialise toggle switch
#
# RETURN NONE
######################################################
FUNCTION set_toggle_switch(p_int)
  DEFINE p_int SMALLINT
  IF p_int = 0 THEN
    LET tl_glob_int_switch = 0
  ELSE
    LET tl_glob_int_switch = 1
  END IF    

END FUNCTION


######################################################
# FUNCTION get_toggle_switch()
#
# Get current switch toggle value
#
# RETURN glob_int_switch
######################################################
FUNCTION get_toggle_switch()
  RETURN  tl_glob_int_switch
END FUNCTION


######################################################
# FUNCTION toggle_switch()
#
# Toggle the global toggle switch
#
# RETURN NONE
######################################################
FUNCTION toggle_switch()
  IF tl_glob_int_switch = 0 THEN
    LET tl_glob_int_switch = 1
  ELSE
    LET tl_glob_int_switch = 0
  END IF    

END FUNCTION


######################################################
# FUNCTION toggle_switch_on()
#
# Turn the global toggle switch on (value 1)
#
# RETURN NONE
######################################################
FUNCTION toggle_switch_on()
    LET tl_glob_int_switch = 1
END FUNCTION

#########################################################################################################
# General functions/tools (must be data structure/globals independent & re-usable)
#
#########################################################################################################



#############################################################################################
# FUNCTION hotlink_config_string_wrapper(first_arg,second_arg)
#
# hotlinks have got a 2-part config string, each surounded by curly braces {} and seperated by a space
#
# RETURN ret
#############################################################################################
FUNCTION hotlink_config_string_wrapper(first_arg,second_arg)
  DEFINE
    first_arg, second_arg VARCHAR(300),
    ret VARCHAR(600)

  LET ret = "{", trim(first_arg), "} {", trim(second_arg), "}"
  RETURN ret


END FUNCTION


#########################################################################################################
# FUNCTION unique_doc_name(base_name,file_extension)
#
# create a unique & valid document name based on the current date & time
#
# RETURN ret
######################################################################################################### 
FUNCTION unique_doc_name(base_name,file_extension)
  DEFINE 
    base_name,ret VARCHAR(250),
    file_extension VARCHAR(5),
    temp_date CHAR(19)

  LET temp_date = CURRENT YEAR TO SECOND USING "yyyymmdd-hhmmss"
  LET temp_date[11] = "-"
  LET temp_date[14] = "-"
  LET temp_date[17] = "-"

  LET ret = base_name , temp_date , ".", trim(file_extension)

  RETURN ret
END FUNCTION


############################################################################################
# FUNCTION get_4gl_window_information() 
#
# Retrieve and display window information 
#
# RETURN NONE
############################################################################################ 
FUNCTION get_4gl_window_information()
  DEFINE inp_temp char(1)

  CALL gwinfo_retrieve_application_information()

  OPEN WINDOW w_gwinfo
    AT 2,2
    WITH 22 ROWS, 78 COLUMNS
    ATTRIBUTE (BORDER)


  CALL fgl_settitle("w_gwinfo",get_str_tool(83)) --4GL Window properties and options
  CALL gwinfo_retrieve_application_information()

  WHILE TRUE
    PROMPT get_str_tool(84) FOR CHAR inp_temp HELP 100  --"Press ACCEPT key to close window"
      ON KEY(ACCEPT,INTERRUPT)
        LET int_flag = FALSE
        EXIT WHILE
    END PROMPT
  END WHILE

  IF int_flag THEN
    LET int_flag = FALSE
  END IF

  CLOSE WINDOW w_gwinfo
END FUNCTION


############################################################################################
# FUNCTION gwinfo_display_application_information() 
#
# Sub-Function of get_4gl_window_information()
# function to display 4GL window data
#
# RETURN NONE
############################################################################################ 
FUNCTION gwinfo_retrieve_application_information()
# This record is used by the fgl_window_getoption() information function
  DEFINE app_info RECORD
    windowName VarChar(60),       --Returns the name of the current window.
    x SmallInt,             --Returns the X position of the current window.
    y SmallINT,             --Returns the Y position of the current window.
    width SmallInt,         --Returns the width of the current window.
    height SmallInt,        --Returns the height of the current window.
    border SmallInt,        --Returns TRUE if the current window has a border; otherwise returns FALSE.
    formline SmallInt,      --Returns the form line of the current window.
    menuline  SmallInt,     --Returns the menu line of the current window.
    commentline  SmallInt,  --Returns the comment line of the current window.
    messageline  SmallInt,  --Returns the message line of the current window.
    errorline  SmallInt,    --Returns the error line of the current window.
    insertkey  SmallInt,    --Returns the value of insertkey (value as with the fgl_getkey function).
    deletekey   SmallInt,   --Returns the value of deletekey (value as with the fgl_getkey function).
    nextkey   SmallInt,     --Returns the value of nextkey (value as with the fgl_getkey function).
    previouskey  SmallInt,  --Returns the value of previouskey (value as with the fgl_getkey function).
    acceptkey   SmallInt,   --Returns the value of acceptkey (value as with thefgl_getkey function).
    helpkey   SmallInt,     --Returns the value of helpkey (value as with the fgl_getkey function).
    abortkey  SmallInt,     --Returns the value of abortkey (value as with the fgl_getkey function).
    inputwrap  SmallInt,    --Returns TRUE if the inputwrap option is on; otherwise returns FALSE.
    fieldorder  SmallInt    --Returns TRUE if the fieldorder option is constraint; otherwise returns FALSE.
  END RECORD

  CALL fgl_window_getoption ("name") returning app_info.windowName 
  CALL fgl_window_getoption ("x") returning app_info.x 
  CALL fgl_window_getoption ("y") returning app_info.y  
  CALL fgl_window_getoption ("width") returning app_info.width  
  CALL fgl_window_getoption ("height") returning app_info.height  
  CALL fgl_window_getoption ("border") returning app_info.border  
  CALL fgl_window_getoption ("formline") returning app_info.formline  
  CALL fgl_window_getoption ("menuline") returning app_info.menuline  
  CALL fgl_window_getoption ("commentline") returning app_info.commentline  
  CALL fgl_window_getoption ("messageline") returning app_info.messageline 
  CALL fgl_window_getoption ("errorline") returning app_info.errorline
  CALL fgl_window_getoption ("insertkey") returning app_info.insertkey
  CALL fgl_window_getoption ("deletekey") returning app_info.deletekey 
  CALL fgl_window_getoption ("nextkey") returning app_info.nextkey 
  CALL fgl_window_getoption ("previouskey") returning app_info.previouskey
  CALL fgl_window_getoption ("acceptkey") returning app_info.acceptkey 
  CALL fgl_window_getoption ("helpkey") returning app_info.helpkey  
  CALL fgl_window_getoption ("abortkey") returning app_info.abortkey 
  CALL fgl_window_getoption ("inputwrap") returning app_info.inputwrap 
  CALL fgl_window_getoption ("fieldorder") returning app_info.fieldorder


  DISPLAY "fgl_window_getoption (\"name\"):",app_info.windowName  AT 2, 3
  DISPLAY "fgl_window_getoption (\"x\"):",app_info.x  AT 3 ,3
  DISPLAY "fgl_window_getoption (\"y\"):",app_info.y  AT 4,3
  DISPLAY "fgl_window_getoption (\"width\"):",app_info.width  AT 5,3
  DISPLAY "fgl_window_getoption (\"height\"):",app_info.height  AT 6,3
  DISPLAY "fgl_window_getoption (\"border\"):",app_info.border  AT 7,3
  DISPLAY "fgl_window_getoption (\"formline\"):",app_info.formline  AT 8,3
  DISPLAY "fgl_window_getoption (\"menuline\"):",app_info.menuline  AT 9,3
  DISPLAY "fgl_window_getoption (\"commentline\"):",app_info.commentline  AT 10,3
  DISPLAY "fgl_window_getoption (\"messageline\"):",app_info.messageline  AT 11,3
  DISPLAY "fgl_window_getoption (\"errorline\"):",app_info.errorline  AT 12,3
  DISPLAY "fgl_window_getoption (\"insertkey\"):",app_info.insertkey  AT 13,3
  DISPLAY "fgl_window_getoption (\"deletekey\"):",app_info.deletekey  AT 14,3
  DISPLAY "fgl_window_getoption (\"nextkey\"):",app_info.nextkey  AT 15,3
  DISPLAY "fgl_window_getoption (\"previouskey\"):",app_info.previouskey  AT 16,3
  DISPLAY "fgl_window_getoption (\"acceptkey\"):",app_info.acceptkey  AT 17,3
  DISPLAY "fgl_window_getoption (\"helpkey\"):",app_info.helpkey  AT 18,3
  DISPLAY "fgl_window_getoption (\"inputwrap\"):",app_info.windowName  AT 19,3

END FUNCTION

