#########################################################################################################
# Some simple functions add html tags to strings, exporting them to a file and displaying them
# with an external html browser (i.e. MS-IE) or displaying the html information
# using a html widget embedded in a form.
#
# Created:
# 10.10.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#
#
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# read_html_file(file_name)                       Import html file                                           file_buffer,read_status   
# write_html_file(file_name,file_buffer)          Write a html file                                          file_buffer,write_status
# replace_CRLF_html(str_in)                       Replace the CR-LF characters \n with html break tags <br>  str_out
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


##########################################################################################
# FUNCTION read_html_file(file_name)
#
# Import html file
#
# RETURN file_buffer,read_status                    
##########################################################################################
FUNCTION read_html_file(file_name)
  DEFINE
    file_name    VARCHAR(200),
    file_buffer  VARCHAR(200),
    read_status SMALLINT,
    local_debug SMALLINT

  LET local_debug = 0

  LET read_status = fgl_channel_read("stream_in",file_buffer)

  IF local_debug THEN
    DISPLAY "read_html_file() - file_name=",file_name
    DISPLAY "read_html_file() - read_status=",read_status
    DISPLAY "read_html_file() - file_buffer=",file_buffer
  ENd IF

  RETURN file_buffer,read_status

END FUNCTION


##########################################################################################
# FUNCTION write_html_file(file_name,file_buffer)
#
# Write a html file
#
# RETURN file_buffer,write_status
##########################################################################################
FUNCTION write_html_file(file_name,file_buffer)
  DEFINE
    file_name                 VARCHAR(200),
    file_buffer               VARCHAR(30000),
    write_status, open_status SMALLINT,
    local_debug               SMALLINT

  LET local_debug = 0

  LET write_status = fgl_channel_write("stream_out",file_buffer)

  IF local_debug THEN
    DISPLAY "write_html_file() - file_name=",file_name
    DISPLAY "write_html_file() - write_status=",write_status
    DISPLAY "write_html_file() - file_buffer=",file_buffer
    DISPLAY "write_html_file() - open_status=",open_status
  ENd IF

  RETURN file_buffer,write_status

end function


###################################################################################
# FUNCTION replace_CRLF_html(str_in)
#
# Replace the CR-LF characters \n with html break tags <br>
#
# RETURN str_out
###################################################################################
FUNCTION replace_CRLF_html(str_in)
  DEFINE 
    i,io SMALLINT,
    str_in, str_out CHAR(10000)
 
  LET io = 1
  LET i = 1

  WHILE i <= length(str_in)

    IF  str_in[i,i+1] = "\\n" THEN
      LET str_out[io,io+4] = "<br>"
      LET i = i + 2
      LET io = io + 4  
    ELSE
      LET str_out[io] = str_in[i]
      LET i = i + 1
      LET io = io + 1  
    END IF
  END WHILE

  RETURN str_out

END FUNCTION



{
####################################################################################
# FUNCTION FUNCTION process_html_macro_file()
####################################################################################
FUNCTION process_html_macro_file()
  DEFINE 
    buffer, buffer_delimited CHAR(32000),
    input_pipe CHAR(20),
    inp_name VARCHAR(100),
    html_text_in, html_text_out CHAR(32000),
    file_name VARCHAR(200),
    html_macro_s ARRAY[99] OF VARCHAR(50),
    html_macro_n ARRAY[9] OF VARCHAR(250),
    html_macro_l ARRAY[9] OF CHAR(5000),
    html_macro_i ARRAY[9] OF VARCHAR(200),
    temp_str_s VARCHAR(50),
    temp_str_n VARCHAR(250),
    temp_str_l CHAR(5000),
    temp_str_i VARCHAR(200),
    
    ci,co,ca, token_id, macrolength, file_length SMALLINT,
    token CHAR(9),
    token_type CHAR


  LET html_macro_s[1] = get_str_tool(201)
  LET html_macro_s[2] = get_str_tool(202)
  LET html_macro_s[3] = get_str_tool(203)
  LET html_macro_s[4] = get_str_tool(204)
  LET html_macro_s[5] = get_str_tool(205)
  LET html_macro_s[6] = get_str_tool(206)
  LET html_macro_s[7] = get_str_tool(207)
  LET html_macro_s[8] = get_str_tool(208)
  LET html_macro_s[9] = get_str_tool(209)
  LET html_macro_s[10] = get_str_tool(210)
  LET html_macro_s[11] = cust_rec[language].cust_id
  LET html_macro_s[12] = cust_rec[language].cust_title
  LET html_macro_s[13] = cust_rec[language].cust_fname
  LET html_macro_s[14] = cust_rec[language].cust_lname
  LET html_macro_s[15] = cust_rec[language].cust_country
  LET html_macro_s[16] = cust_rec[language].cust_email
  LET html_macro_s[17] = cust_rec[language].cust_dob
  LET html_macro_s[18] = cust_rec[language].cust_url
  LET html_macro_s[19] = cust_rec[language].cust_re
  LET html_macro_s[20] = cust_rec[language].cust_rp
  #LET html_macro_s[21] = cust_rec[language].cust_memo
  LET html_macro_s[22] = cust_rec[language].cust_picture

  LET html_macro_n[1] = ""
  LET html_macro_n[2] = ""
  LET html_macro_n[3] = ""
  LET html_macro_n[4] = ""
  LET html_macro_n[5] = ""
  LET html_macro_n[6] = ""
  LET html_macro_n[7] = ""
  LET html_macro_n[8] = ""
  LET html_macro_n[9] = ""

  LET html_macro_l[1] = cust_rec[language].cust_memo
  LET html_macro_l[2] = ""
  LET html_macro_l[3] = ""
  LET html_macro_l[4] = ""
  LET html_macro_l[5] = ""
  LET html_macro_l[6] = ""
  LET html_macro_l[7] = ""
  LET html_macro_l[8] = ""
  LET html_macro_l[9] = ""

  LET html_macro_i[1] = ""
  LET html_macro_i[2] = ""
  LET html_macro_i[3] = ""
  LET html_macro_i[4] = ""
  LET html_macro_i[5] = ""
  LET html_macro_i[6] = ""
  LET html_macro_i[7] = ""
  LET html_macro_i[8] = ""
  LET html_macro_i[9] = ""

  LET file_name = "c:/@@import_print_html.htm" --trim(server_client_user_temp_directory) || "/print_html.html"


  CALL fgl_channel_open_file("stream", file_name, "r")  --open the input html file and read it
  CALL fgl_channel_read("stream",html_text_in)
  CALL fgl_channel_close("stream")

  #display html_text_in

  LET co = 1
  #DISPLAY  "****** ci=", ci, " co= ", co

  LET file_length = length(html_text_in)

  FOR ci = 1 TO file_length
    
    LET token = html_text_in[ci,ci+9]
    #DISPLAY token
    IF token[1,4] = "@@qx" AND token[8,9] = "@@" THEN
      LET token_type = token[5]   --retrieve the token id - this is the array index of the macro values

      CASE token_type
        WHEN 's'   -- normal/short
          LET token_id = token[6,7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_s = html_macro_s[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(html_macro_s[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_text_out[co] = temp_str_s[ca]
            LET co = co + 1       
          END FOR

        WHEN 'n'   -- normal/short
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_n = html_macro_n[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(html_macro_n[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_text_out[co] = temp_str_n[ca]
            LET co = co + 1       
          END FOR

        WHEN 'l'  --long
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_l = html_macro_l[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(html_macro_l[token_id])
          #CALL fgl_winmessage("length",macrolength,"info")
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_text_out[co] = temp_str_l[ca]
            LET co = co + 1       
          END FOR

        WHEN 'i'  --image
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_i = html_macro_i[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(html_macro_i[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_text_out[co] = temp_str_i[ca]
            LET co = co + 1       
          END FOR

        OTHERWISE
          CALL fgl_winmessage("Error in Demo Source - Html Template","Unknown data token type in function create_print_html " || token_type, "error")

      END CASE


    ELSE
      LET html_text_out[co] = html_text_in[ci]
      LET co = co + 1
    END IF


  END FOR


  RETURN  html_text_out
END FUNCTION
}


{
####################################################################################
# FUNCTION html_help_file()
####################################################################################
FUNCTION html_help_file()
  DEFINE 
    buffer, buffer_delimited CHAR(32000),
    input_pipe CHAR(20),
    inp_name VARCHAR(100),
    html_help_text CHAR(32000),
    file_name VARCHAR(200)

    LET file_name = trim(server_client_user_temp_directory) || "/my_guidemo_help_file.html"

    LET html_help_text =  create_html_help_text()

  CALL fgl_channel_open_file("stream", file_name, "w")
  CALL fgl_channel_write("stream",html_help_text)
  CALL fgl_channel_close("stream")

  #CALL fgl_winmessage(file_name,file_name,"info")

  RETURN file_name
  #RETURN html_file_name
END FUNCTION
}
{
####################################################################################
# FUNCTION create_html_help_text()
####################################################################################
FUNCTION create_html_help_text()
  DEFINE 
    html_help_text CHAR(32000),
    image_path VARCHAR(100)

  LET image_path = "http://www.querix.com/images/prices.jpg"

  LET html_help_text = ""
  LET html_help_text = trim(html_help_text), "<HTML>"
  LET html_help_text = trim(html_help_text), "<BODY>"
  LET html_help_text = trim(html_help_text), "<STRONG><FONT color=blue size=4>"
  LET html_help_text = trim(html_help_text), "Example Help File"
  LET html_help_text = trim(html_help_text), "</FONT></STRONG>"
  LET html_help_text = trim(html_help_text), "<P>"
  LET html_help_text = trim(html_help_text), "<FONT size=2 color=\"blue\"><FONT color=brown>"
  LET html_help_text = trim(html_help_text), "You can give your application a modern look and feel by providing HTML Help Support."
  LET html_help_text = trim(html_help_text), "</FONT> </FONT>"
  LET html_help_text = trim(html_help_text), "</P>"
  LET html_help_text = trim(html_help_text), "<A HREF=\"http://www.querix.com\" TARGET=\"_blank\">querix.com</A>"
  LET html_help_text = trim(html_help_text), "</P>"  
  LET html_help_text = trim(html_help_text), "<P>"
  LET html_help_text = trim(html_help_text), "<A HREF=\"mailto:info@querix.com\">Email Querix</A></td>"
  LET html_help_text = trim(html_help_text), "</P>"
  LET html_help_text = trim(html_help_text), "<img src=\""
  LET html_help_text = trim(html_help_text), trim(image_path)
  LET html_help_text = trim(html_help_text), "\" alt=\" "
  LET html_help_text = trim(html_help_text), trim(image_path)
  LET html_help_text = trim(html_help_text), " \" height=\"100\" width=\"100\" /><br />"
  LET html_help_text = trim(html_help_text), ""
  LET html_help_text = trim(html_help_text), ""
  LET html_help_text = trim(html_help_text), ""
  LET html_help_text = trim(html_help_text), "</BODY></HTML>"


  RETURN html_help_text
END FUNCTION

}
{
####################################################################################
# FUNCTION create_print_html_file()
####################################################################################
FUNCTION create_print_html_file(file_name)
  DEFINE 
    buffer, buffer_delimited CHAR(32000),
    input_pipe CHAR(20),
    inp_name VARCHAR(100),
    html_help_text CHAR(32000),
    file_name VARCHAR(200)

    #LET file_name =  --trim(server_client_user_temp_directory) || "/print_html.html"

    LET html_help_text =  process_html_macro_file()

  CALL fgl_channel_open_file("stream", file_name, "w")
  CALL fgl_channel_write("stream",html_help_text)
  CALL fgl_channel_close("stream")

  #CALL fgl_winmessage(file_name,file_name,"info")

  RETURN file_name
  #RETURN html_file_name
END FUNCTION

}

