#########################################################################################################
# Functions to print html files
# with variable contents
#
# Created:
# 06.12.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#########################################################################################################



##########################################################################################
# FUNCTION print_html_simple(in_file,out_file,arg_str,p_mode)
##########################################################################################
FUNCTION print_html_simple(in_file,out_file,arg_str,p_mode)
  DEFINE 
    line_buffer VARCHAR(5000), 
    read_status SMALLINT, 
    write_status SMALLINT,
    arg_str VARCHAR(32000),
    in_file, out_file VARCHAR(200),
    dummy, p_mode CHAR,   --p_mode a=append n=new
    ret SMALLINT,
    local_debug SMALLINT

  LET local_debug = FALSE

  CALL fgl_channel_open_file("stream_in", in_file, "r")  --open the input html file and read it

  IF p_mode = "n" THEN  --new document
    LET dummy = "" --delete existing contents
    CALL fgl_channel_open_file("stream_out", out_file, "w")
  ELSE
    CALL fgl_channel_open_file("stream_out", out_file, "a")  --set file write/stream to append mode
  END IF

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
    CALL fgl_winmessage(get_str(40),get_str(43) || " 'stream_out' in print_html_simple()","info") 
  END IF  

  ##Close file handle - for input file
  CALL fgl_channel_close("stream_in")  
    RETURNING ret

  IF ret = FALSE THEN  --error
    CALL fgl_winmessage(get_str(40),get_str(43) || "  'stream_in' in print_html_simple()","info") 
  END IF 

END function


####################################################################################
# FUNCTION print_html(file_name)
####################################################################################
FUNCTION print_html(file_name)
  DEFINE
    file_name VARCHAR(200),
    inp_char CHAR,
    loop SMALLINT

  OPTIONS
    FORM LINE 1

  #LET file_name = create_print_html_file(file_name)
  CALL fgl_window_open("w_print_preview",3,20,get_form_path("gd_f_print_html_2_2"),0)

  CALL fgl_settitle("w_print_preview",get_str(340))   

  DISPLAY file_name TO bw_print_preview

  LET loop = 1
  WHILE loop = 1

    PROMPT "" FOR CHAR inp_char HELP 1
      BEFORE PROMPT
        CALL publish_toolbar("gd_co_print",0)
      ON KEY(F2)  --Print

        CALL fgl_set_property("gui", "window.winshellexec.verb", "print")
        CALL winshellexec(file_name)
        # this next call is to simply reset the verb
        CALL fgl_set_property("gui", "window.winshellexec.verb", "open")
      ON KEY(F11)  --Cancel/Close
        LET loop = 0
    END PROMPT
  END WHILE

  CALL publish_toolbar("gd_co_print",1)

  CALL fgl_window_close("w_print_preview")

  OPTIONS
    FORM LINE 3

END FUNCTION

