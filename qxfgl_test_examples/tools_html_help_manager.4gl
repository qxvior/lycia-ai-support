#########################################################################################################
# Some simple functions add html tags to strings, exporting them to a file and displaying them
# with an external html browser (i.e. MS-IE) or displaying the html information
# using a html widget embedded in a form.
#
#
#
# FUNCTION                                        DESCRIPTION                                              RETURN
# process_html_help_import(file_name)             Import/Process the html help url mapping file            NONE
# set_help_id(id)                                 Set the html help id                                     NONE
# html_help(help_url)                             Call the html help feature (with a fully qualified url)  NONE
# get_help_url(id)                                get the fully qualified help url by id                   tl_help_target_current
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


###########################################################
# FUNCTION process_html_help_import(file_name)
#
# Import/Process the html help url mapping file
#
# RETURN NONE
###########################################################
FUNCTION process_html_help_import(file_name)

  #International strings
  DEFINE
    file_name, tempstr            VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT

  LET local_debug = 0
  LET id = 1

  IF NOT fgl_test("e",file_name) THEN
    LET tl_err_msg = "process_html_help_import(file_name)\n", get_str_tool(727), " ",  file_name
    CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END IF
 
  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "process_html_help_import() - ### start ##### ",file_name, " ########### process_html_help_import(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",tl_helphtml[id].*)
    IF  tl_helphtml[id].help_id IS NOT NULL AND tl_helphtml[id].help_id != 0 THEN
      # removed old code block - nothing to do in this situation
    ELSE
      EXIT WHILE  -- 0 terminates input
    END IF

    IF local_debug THEN
      DISPLAY "process_html_help_import() - tl_helphtml[[id].help_id = ", tl_helphtml[id].help_id
      DISPLAY "process_html_help_import() - tl_helphtml[[id].help_html_file = ", tl_helphtml[id].help_html_file
    END IF

    LET id = id + 1
  END WHILE

  LET tl_help_html_array_size = id - 1  --correct array size by -1

  IF tl_help_html_array_size = 0 THEN
    LET tl_err_msg = "The html help configuration file >",file_name ,"<\nis empty or does not exist" 
    CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END IF

  IF local_debug THEN
    DISPLAY "process_html_help_import() - ### END of help_html file import"   
    DISPLAY "process_html_help_import() - ### END of help_html file import. used array size = " , tl_help_html_array_size, "  ##### ",file_name, " ###########"   
 
    DISPLAY "process_html_help_import() - ### END of help_html file import"   
  END IF


  CALL fgl_channel_close("stream")


END FUNCTION


###########################################################
# FUNCTION set_help_id(id)
#
# Set the html help id
#
# RETURN NONE
###########################################################
FUNCTION set_help_id(id)
  DEFINE 
    id SMALLINT
  LET tl_current_help_id = id

END FUNCTION

#########################################################################################################
# FUNCTION html_help(help_url)
#
# Call the html help feature (with a fully qualified url)
#
# RETURN NONE
######################################################################################################### 
FUNCTION html_help(help_url)
  DEFINE 
    help_url VARCHAR(100),
    inp_char CHAR,
    local_debug SMALLINT

  LET local_debug = FALSE


  
  # ???? this is the html help, not the classic help
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  #CALL set_classic_help_file(10)

  IF local_debug THEN
    DISPLAY "html_help() - help_url = ", help_url
    DISPLAY "html_help() - lt_settings.help_system_type = ", tl_settings.help_system_type
  END IF
  
  CASE tl_settings.help_system_type
    WHEN 0 --local file system
			{IF fgl_test("e",help_url) = 0 THEN  --huho changed 18.08.14
      #IF fgl_getproperty("gui","system.file.exists",help_url) = 0 THEN  
        LET tl_err_msg = get_str_tool(728), "\n", help_url
        CALL fgl_winmessage(get_str_tool(30), tl_err_msg, "ERROR")
      ELSE
        IF local_debug = 1 THEN
          LET tl_err_msg = "File " , help_url , " does exist on the Server"
          CALL fgl_winmessage("File does exist on Server",tl_err_msg, "info")
        END IF
      END IF
      }
    WHEN 1  -- DB Help system
      #DB HELP system is not implemented

    WHEN 2  -- Online Help System
      #Nothing to do - URL is enough, you don't need to download any files...
  END CASE


#    END IF

  #don't bother about text client... text clients don't support html widgets.

  --CALL fgl_download(help_url,get_client_temp_path(help_url)) 

  CALL fgl_window_open("w_html_help", 1,60, get_form_path("f_tools_html_help_g"), TRUE)
  LET tl_tmp_str = get_str_tool(600), " - ", help_url
  CALL fgl_settitle("w_html_help",tl_tmp_str)
  
  IF local_debug THEN
    DISPLAY "html_help() - help_url = ", help_url
  END IF

	DISPLAY help_url TO f_browser  --huho added / changed from input to prompt 18.08.14
	DISPLAY help_url TO f_url
{	call fgl_getkey()
  DISPLAY "qx://application/html/gui_demo.html" TO f_browser
  DISPLAY "qx://application/html/gui_demo.html" TO f_url  

	call fgl_getkey()
  DISPLAY "qx://application/help_html/uk/gui_demo.html" TO f_browser
  DISPLAY "qx://application/help_html/uk/gui_demo.html" TO f_url  
	call fgl_getkey()    
}  	
	PROMPT "" for char inp_char
  #INPUT help_url without defaults from f_browser 
  BEFORE PROMPT  
    CALL publish_toolbar("help_html",0) 

  ON KEY(F12,INTERRUPT,ACCEPT)
     LET int_flag = FALSE
     #EXIT PROMPT

  AFTER PROMPT
     CALL publish_toolbar("help_html",1) 

  END PROMPT

  CALL fgl_window_close("w_html_help")    


END FUNCTION


###########################################################
# FUNCTION get_help_url(id)
#
# get the fully qualified help url by id
#
# RETURN tl_help_target_current
###########################################################
FUNCTION get_help_url(id)
  DEFINE 
    id, c, invalid_id SMALLINT,
    base_url VARCHAR(20),
    local_debug SMALLINT


  LET local_debug = FALSE

  IF local_debug THEN
    DISPLAY "get_help_url() - id = ", id
  END IF

  IF id <1 OR id > 1000 THEN  --only allow help ids between 1 and 1000
    LET tl_err_msg = get_str_tool(802) CLIPPED, " - ", "tl_get_help_url(id) \nid= ",id CLIPPED, "\n", get_str_tool(807)
    CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
    DISPLAY "get_help_url() - id = ", id
    RETURN "Invalid_HELP_ID"
  END IF

	#PS:With Lycia 2.2 and later, you no longer need to copy the files to the client - the qx:// URI prefix instructs the server to download the file if it is not already available
 -- add the language sub-dir
  LET tl_help_target_source = "qx://application/", tl_settings.help_language_dir[tl_settings.languageId]
	LET tl_help_target_current = "qx://application/", tl_settings.help_language_dir[tl_settings.languageId]  --changed huho 18.08.2014
	#This is not implemented - case for the different help sources i.e. db, online, server files
  CASE tl_settings.help_system_type
    WHEN 0 --local file system
      #LET tl_help_target_current = tl_client_temp_directory, "/", tl_settings.help_language_dir[tl_settings.language]

  		#RETURN trim(tl_help_target_current)
  
    WHEN 1  -- DB Help system
      #bla bla

    WHEN 2  -- Online Help System
      #nothing
  END CASE

{
  IF local_debug THEN
    DISPLAY " "
    display "########### START GET_HELP_URL(ID) ################################"
    DISPLAY "1 - get_help_url(", id, ")  - A-help_target_source=", tl_help_target_source
    DISPLAY "1 - get_help_url(", id, ")  - A-help_target_current=", tl_help_target_current
    DISPLAY "1 - get_help_url() - help_target_source=", tl_help_target_source
    DISPLAY "1 - get_help_url() - help_target_current=", tl_help_target_current
    #DISPLAY "1 - get_help_url() - client_temp_directory=", tl_client_temp_directory
    DISPLAY "1 - get_help_url() - settings.help_language_dir[language]=", tl_settings.help_language_dir[tl_settings.language]
    DISPLAY "1 - get_help_url() - settings.language = ", tl_settings.language
    DISPLAY "1 - get_help_url() - for loop - help_html_array_size =", tl_help_html_array_size
    #CALL fgl_winmessage("client_temp_directory",tl_client_temp_directory,"info")
  END IF
}
  LET invalid_id = 1  --??? what is this
  FOR c = 1 TO tl_help_html_array_size
    IF local_debug THEN
      DISPLAY "2-get_help_url(", id, ")  - B-help_target_current=", tl_help_target_current
      DISPLAY "2-get_help_url() - for loop - invalid_id =", invalid_id
      DISPLAY "2-get_help_url() - for loop - c =", c
      DISPLAY "2-get_help_url() - for loop - tl_helphtml[[c].help_id =", tl_helphtml[c].help_id
    END IF

		#add the actual help html file name to the uri
    IF tl_helphtml[c].help_id = id THEN
      LET tl_help_target_current = trim(tl_help_target_current), tl_helphtml[c].help_html_file
      LET tl_help_target_source = trim(tl_help_target_source), tl_helphtml[c].help_html_file
      LET invalid_id = 0
      EXIT FOR
    END IF

  END FOR
  
  

  IF local_debug THEN
    DISPLAY "3-get_help_url(", id, ")  - B-help_target_current=", tl_help_target_current
    DISPLAY "3-get_help_url() - invalid_id =", invalid_id
  END IF

{
  #for local file system located help files
  IF tl_settings.help_system_type = 0 THEN -- local file system - 0 means, file needs to be downloaded from server to client
    IF local_debug THEN
      DISPLAY "In Function get_help_url(", id, ")  - Does help file help_target_current ", trim(tl_help_target_source) , " exist on server ? 1=yes 0=No -->", fgl_test("e",tl_help_target_source) 
    END IF  

    #Only attempt to download the help file if it exists on the server
    IF fgl_test("e",tl_help_target_source) THEN  --File does not exist - download

      IF local_debug THEN
        display "4 - get_help_url(", id, ")  - This file " , trim(tl_help_target_current) , " does not exist in your clients local drive"
        display "4 - get_help_url(", id, ")  - download file:" , tl_help_target_source
        display "4 - get_help_url(", id, ")  - planned target - to:", tl_help_target_current
      END IF

      #Only download the file, if it doesn't exist already on client - no version control
      IF NOT fgl_getproperty("gui","system.file.exists",tl_help_target_current) THEN 
        IF local_debug THEN
          display "5 - get_help_url(", id, ")  - fgl_getproperty(\"gui\",\"system.file.exists\",help_target_current) = ", fgl_getproperty("gui","system.file.exists",tl_help_target_current)
          display "5 - Let's attempt to download the file..."
        END IF

        LET tl_help_target_current =  fgl_download(tl_help_target_source, tl_help_target_current)
      ELSE
        IF local_debug THEN
          display "5 - DID NOT download the file - It's already on the local Client PC..."
          display "5 - In Function get_help_url(", id, ")  - fgl_getproperty(\"gui\",\"system.file.exists\",help_target_current) = ", fgl_getproperty("gui","system.file.exists",tl_help_target_current)
        END IF
      END IF      

      IF local_debug THEN
        display "6 - get_help_url(", id, ")  - actual target - to:", tl_help_target_current
      END IF

      IF fgl_getproperty("gui","system.file.exists",tl_help_target_current) = 0 THEN 
        LET  tl_err_msg = get_str_tool(740), " ", trim(tl_help_target_source)  , " ", get_str_tool(746) , " - " , trim(tl_help_target_current) , "\nDon't ask me why... - Sorry"
        CALL fgl_winmessage("Error in 4GL Demo Source code",tl_err_msg,"ERROR")
      END IF

    ELSE  --File already exists - do not download again
      LET tl_err_msg = "get_help_url()\n", get_str_tool(805) CLIPPED, " help_target_source=", tl_help_target_source CLIPPED, "\n", get_str_tool(48)
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg,"error")
      #LET  err_msg = get_str_too(727) CLIPPED, trim(help_target_source)
      #CALL fgl_winmessage("Error in 4GL Demo Source code",err_msg,"ERROR")
      DISPLAY "7 - get_help_url(", id, ")  - fgl_test(\"e\",help_target_source) = ", fgl_test("e",tl_help_target_source) 
      SLEEP 3
    END IF

  ELSE  -- web URL
    
    LET tl_help_target_current = fgl_download(tl_help_target_source,get_client_temp_path(tl_help_target_source))

    
    #LET tl_help_target_current = tl_settings.help_file_base_url , tl_help_target_current
    
  END IF
}

  IF local_debug THEN
    DISPLAY "8 - get_help_url(", id, ")  - X-help_target_current=", tl_help_target_current
  END IF

  IF invalid_id = 1 THEN --id was not found
    LET tl_err_msg = "get_help_url() *** Help id=",id, " not found"
    CALL fgl_winmessage(get_str_tool(30) , tl_err_msg, "error")
  END IF

  IF local_debug THEN
    DISPLAY "9 - get_help_url(", id, ")  - RETURN Z-help_target_current=", tl_help_target_current
  END IF
  
  
  RETURN trim(tl_help_target_current)

END FUNCTION

