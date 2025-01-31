#########################################################################################################
# GUI Demo Application to demonstrate the DDE interface with MS-Word
# This application does some simple DDE operation
# 1. Run Excel (optionally transfer Excel document from BLOB or file server)
# 2. Creates a new document (by saving the empty-formated base sheet)
# 3. Transfers some sample data
# 4. Formats the cells in Excel
# 5. Saves the document
# 6. Prints the document
#
# Modification History:
# 22.06.05 HH - Created
#
# Current Limitations & Bugs:
#
#
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "gd_globals.4gl"

#########################################################################################################
# FUNCTION dde_demo()  Main DDE demo function
######################################################################################################### 
FUNCTION dde_word_demo()
  DEFINE r,c SMALLINT
  DEFINE a CHAR(10)
  DEFINE filename CHAR(100)
  DEFINE e INTEGER
  DEFINE wordstring CHAR(1024)
  DEFINE data CHAR(128)
  DEFINE done CHAR(1)
  DEFINE retry_max, retry_count SMALLINT
  DEFINE l_file_name VARCHAR(255)
  DEFINE l_file_loc CHAR(1024)  --Word document with complete path
  DEFINE l_command CHAR(1024)
  DEFINE tempy char
  LET retry_max = 20

  #check if it is a gui client
  IF fgl_fglgui() = 0 THEN
    CALL fgl_winmessage(get_str(507), get_str(507) || "\n" || get_str(508) || "\n" || get_str(509), "info")
    RETURN
  END IF 

  OPTIONS
    FORM LINE 1

  CALL fgl_window_open("w_dde_word",3,3,get_form_path("gd_f_dde_word"),1)

  #initialise form data
  CALL init_form_fd_f_dde_word()


############ Step 1   Download document from server############################################################################
  LET l_file_loc = fgl_download(get_document_path("gd_document1.doc"), client_temp_directory || "/" ||  get_document_path("gd_document1.doc")) -- returning l_file

  IF l_file_loc = "" OR l_file_loc IS NULL THEN 
    DISPLAY get_icon16_path("gd_ic_break.ico") TO fi_1   --Show failed step
  ELSE
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO fi_1  --Show succesfully completed step
  END IF

############ Step 2   Start Word ##############################################################################################
  LET r = WinShellExec(l_file_loc)  -- 1 = error 0= OK
  LET l_file_name = trim(fgl_basename(l_file_loc)) 

  IF r = 0 THEN 
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO fi_2  --Show succesfully completed step
  ELSE
    DISPLAY get_icon16_path("gd_ic_break.ico") TO fi_2   --Show failed step
  END IF

############ Step 3   Establish DDE Connection to document ##############################################################################################

  CALL fgl_winmessage(get_str(521),get_str(522),"question")

  LET r = ddeconnect("winword", re_quote(l_file_loc))


  WHILE r = 0
    IF retry_count = retry_max  THEN  --give up - too many connection attempts
      EXIT WHILE
    END IF
 
    LET r = ddeconnect("winword", re_quote(l_file_loc))
    LET retry_count = retry_count + 1
    SLEEP(1)
  END WHILE


  IF r = 1 THEN 
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO fi_3  --Show succesfully completed step
  ELSE
    DISPLAY get_icon16_path("gd_ic_break.ico") TO fi_3   --Show failed step
    CALL fgl_winmessage("DDE Document Connection Status","Error: Could not connect to Winword - " || retry_count  || " Attempts failed r=" || r,"info")
  END IF



############ Step 4  Pass Data to the Word Document using DDEPOKE ##############################################################################################

  LET c = 0
  LET r = ddepoke("winword",re_quote(l_file_loc),"title","\'"     || trim(cust_rec[1].cust_title)     || "\'")
  LET c = c + r
  LET r = ddepoke("winword",re_quote(l_file_loc),"firstname","\'" || trim(cust_rec[1].cust_fname)     || "\'")
  LET c = c + r
  LET r =  ddepoke("winword",re_quote(l_file_loc),"lastname","\'"  || trim(cust_rec[1].cust_lname)     || "\'")
  LET c = c + r
  LET r =  ddepoke("winword",re_quote(l_file_loc),"country","\'"   || trim(cust_rec[1].cust_country)   || "\'")
  LET c = c + r
  LET r =  ddepoke("winword",re_quote(l_file_loc),"dear","\'"   || trim(cust_rec[1].cust_fname)   || "\'")
  LET c = c + r


  IF c = 5 THEN 
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO fi_4   --Show succesfully completed step
  ELSE
    DISPLAY get_icon16_path("gd_ic_break.ico") TO fi_4    --Show failed step
  END IF


############ Step 5  Close DDE Connection ##############################################################################################


  LET r = DDEFinishAll()

  IF r = 1 THEN 
    DISPLAY get_icon16_path("gd_ic_accept.ico") TO fi_5  --Show succesfully completed step
  ELSE
    DISPLAY get_icon16_path("gd_ic_break.ico") TO fi_5   --Show failed step
  END IF


  #now, enable the close button on the form
  DISPLAY "!" TO fb_close

  LET done = fgl_getkey()

  CALL fgl_window_close("w_dde_word")

END FUNCTION


###########################################################################
# FUNCTION re_quote(p_string)
###########################################################################
FUNCTION re_quote(p_string)
  DEFINE p_string CHAR(1024)
  DEFINE rv CHAR(2048)
  DEFINE i, j INTEGER

  LET j = 1

  FOR i = 1 TO 1024
    IF p_string[i] = "\\" THEN
      LET rv[j] = "\\"
      LET j = j + 1
    END IF

    LET rv[j] = p_string[i]
    LET j = j + 1
  END FOR

  RETURN rv
END FUNCTION


###########################################################################
# FUNCTION  init_form_fd_f_dde_word()
###########################################################################
FUNCTION  init_form_fd_f_dde_word()
  DISPLAY "!" TO fi_1
  DISPLAY "!" TO fi_2
  DISPLAY "!" TO fi_3
  DISPLAY "!" TO fi_4
  DISPLAY "!" TO fi_5
  DISPLAY "" TO fb_close

  DISPLAY get_str(500) TO lbTitle
  DISPLAY get_str(501) TO dl_subheader
  DISPLAY get_str(502) TO dl_1
  DISPLAY get_str(503) TO dl_2
  DISPLAY get_str(504) TO dl_3
  DISPLAY get_str(505) TO dl_4
  DISPLAY get_str(506) TO dl_5
  DISPLAY get_str(9) TO fb_close



END FUNCTION

