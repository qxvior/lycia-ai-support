#########################################################################################################
# Functions to print html files
# with variable contents
#
# Created:
# 06.12.06 
#
# Modification History:
# 23.04.2012 Bondar A.G. was modified function print_html()
#
#
#
# FUNCTION                                           DESCRIPTION                                                RETURN
# print_html_simple(in_file,out_file,arg_str,p_mode) Take template input file and create html output 
#                                                    file with application data                                 NONE
# print_html(file_name)                              Print a html file                                          NONE
# get_print_html_template(id)                        Returns the corresponding html print template file name    tl_settings.html_print_template[id]
# get_print_html_image(id)                           Returns the corresponding html print image file name       tl_settings.html_print_image[id]
# get_html_print_output()                            Returns the temporary print html file name (no path)       tl_settings.html_print_output
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


##########################################################################################
# FUNCTION print_html_simple(in_file,out_file,arg_str,p_mode)
#
# Take template input file and create html output file with application data
#
# RETURN NONE
##########################################################################################
FUNCTION print_html_simple(in_file,out_file,arg_str,p_mode)
  DEFINE 
    line_buffer       VARCHAR(5000), 
    read_status       SMALLINT, 
    write_status      SMALLINT,
    arg_str           VARCHAR(32000),
    in_file, out_file VARCHAR(200),
    dummy, p_mode     CHAR,   --p_mode a=append n=new
    ret               SMALLINT,
    local_debug       SMALLINT

  LET local_debug = TRUE

  IF local_debug THEN
    DISPLAY "print_html_simple() - in_file=", in_file
    DISPLAY "print_html_simple() - out_file=", out_file
    DISPLAY "print_html_simple() - arg_str=", arg_str
    DISPLAY "print_html_simple() - p_mode=", p_mode
  END IF

  #if the input file does not exist, don't attempt to do anything.. simply return with an error message
  IF NOT fgl_test("e",in_file) THEN
    LET tl_err_msg = "File Error in print_html_simple()\n", get_str_tool(762), " ", in_file
    CALL fgl_winmessage(get_str_tool(30) ,tl_err_msg, "error")
    RETURN
  END IF

  CALL fgl_channel_open_file("stream_in", in_file, "r", FALSE)  --open the input html file and read it

  IF p_mode = "n" THEN  --new document
    LET dummy = "" --delete existing contents
    CALL fgl_channel_open_file("stream_out", out_file, "w", TRUE)
  ELSE
    CALL fgl_channel_open_file("stream_out", out_file, "a", TRUE)  --set file write/stream to append mode
  END IF

  CALL fgl_channel_set_delimiter("stream_in","")
  CALL fgl_channel_set_delimiter("stream_out","")
  
  # SeZa : Apt 2014. Now function assign_macro_data() located in tools_html_help_manager.4gl, line : 42
  CALL assign_macro_data(arg_str)

  LET line_buffer = ""

  LET read_status = 1
  LET write_status = 1

  WHILE read_status
    CALL read_html_file(in_file) RETURNING line_buffer, read_status
    LET line_buffer = process_html_string(line_buffer)
    CALL write_html_file(out_file,line_buffer) RETURNING write_status

    IF local_debug = 1 THEN
      DISPLAY "do it line buffer: ", line_buffer
    END IF
  END WHILE


  ##Close file handle - for output file
  CALL fgl_channel_close("stream_out")  
    RETURNING ret

  IF ret = FALSE THEN --error
    LET tl_err_msg = get_str_tool(700), "\n", get_str_tool(40) CLIPPED, " ", "in print_html_simple(in_file,out_file,arg_str,p_mode)\nin_file =",in_file CLIPPED, "  out_file =", out_file CLIPPED, "  p_mode =", p_mode
    CALL fgl_winmessage(get_str_tool(700),tl_err_msg,"info")
  END IF  

  ##Close file handle - for input file
  CALL fgl_channel_close("stream_in")  
    RETURNING ret

  IF ret = FALSE THEN  --error
    LET tl_err_msg = get_str_tool(700), "\n", get_str_tool(40) CLIPPED, " ", "in print_html_simple(in_file,out_file,arg_str,p_mode)\nin_file =",in_file CLIPPED, "  out_file =", out_file CLIPPED, "  p_mode =", p_mode
    CALL fgl_winmessage(get_str_tool(700),tl_err_msg,"info")
  END IF 

END function


####################################################################################
# FUNCTION print_html(file_name)
#
# Print a html file
#
# RETURN NONE
####################################################################################
FUNCTION print_html(file_name)
  DEFINE
    file_name   VARCHAR(200),
    inp_char    CHAR,
    local_debug SMALLINT,
    is_exit     INTEGER

  LET local_debug = FALSE

  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  #LET file_name = create_print_html_file(file_name)
  CALL fgl_window_open("w_print_preview",3,4,get_form_path("f_tools_print_html_g"),TRUE)
  CALL fgl_settitle(get_str_tool(601))   

  IF local_debug THEN
    DISPLAY "print_html(file_name) - file_name=", file_name
    DISPLAY "print_html(file_name) - get_form_path(\"f_tools_print_html_g\")=", get_form_path("f_tools_print_html_g")
    LET tl_tmp_str = get_str_tool(601) CLIPPED, " - ", file_name
    CALL fgl_settitle(tl_tmp_str)  
  END IF
  
  
  DISPLAY file_name TO bw_print_preview
  
  LET is_exit = 0
  WHILE TRUE

    PROMPT "" FOR CHAR inp_char HELP 400
      BEFORE PROMPT
        CALL publish_toolbar("print",0)
      ON KEY(ACCEPT)  --Print
        CALL fgl_set_property("gui", "window.winshellexec.verb", "print")
        CALL winshellexec(file_name)
        # this next call is to simply reset the verb
        CALL fgl_set_property("gui", "window.winshellexec.verb", "open")
      ON KEY(INTERRUPT)  --Cancel/Close
        LET int_flag = FALSE
        LET is_exit = 1
    END PROMPT
    IF is_exit = 1
    THEN EXIT WHILE
    END IF

  END WHILE

  CALL publish_toolbar("print",1)

  CALL fgl_window_close("w_print_preview")

  OPTIONS
    FORM LINE 3

END FUNCTION


##############################################################
# FUNCTION get_print_html_template(id)
#
# Returns the corresponding html print template file name
#
# RETURN tl_settings.html_print_template[id]
##############################################################

FUNCTION get_print_html_template(id)
  DEFINE
    ID   SMALLINT

  IF id > 8 OR id < 1 THEN
    CALL fgl_winmessage("Error in get_print_html_template()","Calling argument is out of range","error")
    RETURN NULL
  END IF

  RETURN tl_settings.html_print_template[id]

END FUNCTION


##############################################################
# FUNCTION get_print_html_image(id)
#
# Returns the corresponding html print image file name
#
# RETURN tl_settings.html_print_image[id]
##############################################################
FUNCTION get_print_html_image(id)
  DEFINE
    ID   SMALLINT

  IF id > 8 OR id < 1 THEN
    CALL fgl_winmessage("Error in get_print_html_image()","Calling argument is out of range","error")
    RETURN NULL
  END IF

  RETURN tl_settings.html_print_image[id]

END FUNCTION



##############################################################
# FUNCTION get_html_print_output()
#
# Returns the temporary print html file name (no path)
#
# RETURN tl_settings.html_print_output
##############################################################
FUNCTION get_html_print_output()

  RETURN tl_settings.html_print_output
END FUNCTION


