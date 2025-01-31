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
#########################################################################################################
############################################################
# Globals
############################################################
GLOBALS "gd_globals.4gl"


###########################################################
# FUNCTION process_string_import(file_name)
###########################################################
FUNCTION process_html_help_import(file_name)

  #International strings
  DEFINE
    file_name, tempstr VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT

  LET local_debug = 0
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### start ##### ",file_name, " ########### process_html_help_import(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",helphtml[id].*)
    IF  helphtml[id].help_id IS NOT NULL AND helphtml[id].help_id != 0 THEN
      # removed old code block - nothing to do in this situation
    ELSE
      EXIT WHILE  -- 0 terminates input
    END IF

    IF local_debug = 1 OR global_debug = 1 THEN
      DISPLAY "helphtml[id].help_id = ", helphtml[id].help_id
      DISPLAY "helphtml[id].help_html_file = ", helphtml[id].help_html_file
    END IF

    LET id = id + 1
  END WHILE


  LET help_html_array_size = id - 1
  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### END of help_html file import"   
    DISPLAY "### END of help_html file import. used array size = " , help_html_array_size, "  ##### ",file_name, " ###########"   
 
    DISPLAY "### END of help_html file import"   
  END IF


  CALL fgl_channel_close("stream")

END FUNCTION

###########################################################
# FUNCTION set_help_id(id)
###########################################################
FUNCTION set_help_id(id)
  DEFINE 
    id SMALLINT
  LET current_help_id = id

END FUNCTION

#########################################################################################################
# FUNCTION html_help(help_url)
######################################################################################################### 
FUNCTION html_help(help_url)
  DEFINE 
    help_url VARCHAR(100),
    inp_char CHAR,
    loop SMALLINT,
    err_msg VARCHAR(250),
    local_debug SMALLINT
  
  LET local_debug = 0

  OPTIONS
    FORM LINE 1

  


  IF fgl_getproperty("gui","system.file.exists",help_url) = 0 THEN
    LET err_msg = "The html help file ", help_url, " could not be found or opened on the client machine (PC)"
    CALL fgl_winmessage("4GL Demo source Error", err_msg, "ERROR")
  ELSE
    IF local_debug = 1 THEN
      CALL fgl_winmessage("File does exist","File " || help_url || " does exist on the Client PC", "info")
    END IF
  END IF

CALL fgl_message_box(help_url)

  CALL fgl_window_open("w_html_help",1,1,get_form_path("gd_f_html_help_2_2"),1)  --Note: Position is controlled in script

  CALL fgl_message_box(help_url)
--  DISPLAY html_help_file() 

  #DISPLAY help_url TO f_browser
  DISPLAY "d:/some.html" TO f_browser
--  DISPLAY html_help_file() TO f_browser

  CALL fgl_settitle("w_html_help"," Html Help")

  LET loop = 1
 
  WHILE loop = 1
    PROMPT "" FOR CHAR inp_char
      BEFORE PROMPT
        CALL publish_toolbar("help_html",0) 

      ON KEY(F11)
        LET loop = 0 

      AFTER PROMPT
        CALL publish_toolbar("help_html",0) 

    END PROMPT
  END WHILE

  CALL fgl_window_close("w_html_help")    

  OPTIONS
    FORM LINE 3

END FUNCTION


###########################################################
# FUNCTION get_help_url(id)
###########################################################
FUNCTION get_help_url(id)
  DEFINE 
    id, c, invalid_id SMALLINT,
    base_url VARCHAR(20),
    local_debug SMALLINT,
    err_msg VARCHAR(250)

  LET local_debug = 0

  IF id <1 OR id > 1000 THEN  --only allow help ids between 1 and 1000
    CALL fgl_winmessage(get_str(30),get_str(20) || " id in get_help(" ||id || ")", "error")
    RETURN "Invalid_HELP_ID"
  END IF

 -- add the language sub-dir
  LET help_target_source = settings.help_language_dir[language]
  LET help_target_current = client_temp_directory, "/", settings.help_language_dir[language]

  IF local_debug = 1 THEN
    DISPLAY " "
    display "########### START GET_HELP_URL(ID) ################################"
    DISPLAY "In Function get_help_url(", id, ")  - A-help_target_source=", help_target_source
    DISPLAY "In Function get_help_url(", id, ")  - A-help_target_current=", help_target_current
    DISPLAY "help_target_source=", help_target_source
    DISPLAY "help_target_current=", help_target_current
    DISPLAY "client_temp_directory=", client_temp_directory
    DISPLAY "settings.help_language_dir[language]=", settings.help_language_dir[language]

    CALL fgl_winmessage("client_temp_directory",client_temp_directory,"info")
    CALL fgl_winmessage("settings.help_language_dir[language]",settings.help_language_dir[language],"info")

  END IF

  LET invalid_id = 1
  FOR c = 1 TO help_html_array_size
    IF helphtml[c].help_id = id THEN
      LET help_target_current = trim(help_target_current), helphtml[c].help_html_file
      LET help_target_source = trim(help_target_source), helphtml[c].help_html_file
      LET invalid_id = 0
      EXIT FOR
    END IF

  END FOR
  
  CALL fgl_message_box(help_target_current)

  IF local_debug = 1 THEN
    DISPLAY "In Function get_help_url(", id, ")  - B-help_target_current=", help_target_current
  END IF


  IF settings.help_system_type = 0 THEN -- local file system - 0 means, file needs to be downloaded from server to client


    IF local_debug = 1 THEN
      DISPLAY "In Function get_help_url(", id, ")  - Does help file help_target_current ", trim(help_target_source) , " exist ?  -->", fgl_test("e",help_target_source) 
    END IF  

    #Only attempt to download the help file if it exists on the server
    IF fgl_test("e",help_target_source) = 1 THEN

      IF local_debug = 1 THEN
        display "In Function get_help_url(", id, ")  - This file " , trim(help_target_current) , " does not exist in your clients local drive"
        display "In Function get_help_url(", id, ")  - download file:" , help_target_source
        display "In Function get_help_url(", id, ")  - planned target - to:", help_target_current
      END IF

      #Only download the file, if it doesn't exist already on client - no version control
      IF fgl_getproperty("gui","system.file.exists",help_target_current) = 0 THEN 

        IF local_debug = 1 THEN
          display "In Function get_help_url(", id, ")  - fgl_getproperty(\"gui\",\"system.file.exists\",help_target_current) = ", fgl_getproperty("gui","system.file.exists",help_target_current)
          display "Let's attempt to download the file..."
        END IF

        LET help_target_current =  fgl_download(help_target_source, help_target_current)
      ELSE
        IF local_debug = 1 THEN
          display "DID NOT download the file - It's already on the local Client PC..."
          display "In Function get_help_url(", id, ")  - fgl_getproperty(\"gui\",\"system.file.exists\",help_target_current) = ", fgl_getproperty("gui","system.file.exists",help_target_current)
        END IF
      END IF      


      IF local_debug = 1 THEN
        display "In Function get_help_url(", id, ")  - actual target - to:", help_target_current
      END IF

      IF fgl_getproperty("gui","system.file.exists",help_target_current) = 0 THEN 
        LET  err_msg = "Could not copy the html help file ", trim(help_target_source)  ," from the App-Server\nto the Client target path/file " , trim(help_target_current) , "\nDon't ask me why... - Sorry"
        CALL fgl_winmessage("Error in 4GL Demo Source code",err_msg,"ERROR")
      END IF

    ELSE
      CALL fgl_winmessage(get_str(30),get_str(38) || "\n" || help_target_source,"error")
      LET  err_msg = "This file " , trim(help_target_source) , " does not exist on the application server"
      #CALL fgl_winmessage("Error in 4GL Demo Source code",err_msg,"ERROR")
      DISPLAY "In Function get_help_url(", id, ")  - fgl_test(\"e\",help_target_source) = ", fgl_test("e",help_target_source) 
      SLEEP 3
    END IF

  ELSE  -- web URL
    LET help_target_current = settings.help_file_base_url , help_target_current
  END IF



  IF local_debug = 1 THEN
    DISPLAY "In Function get_help_url(", id, ")  - X-help_target_current=", help_target_current
  END IF

  IF invalid_id = 1 THEN --id was not found
    CALL fgl_winmessage(get_str(30) || " - get_help(id) ", get_str(31) || "  get_help(" || id, "error")
  END IF

  IF local_debug = 1 THEN
    DISPLAY "In Function get_help_url(", id, ")  - RETURN Z-help_target_current=", help_target_current
  END IF
  
  RETURN trim(help_target_current)

END FUNCTION

