#########################################################################################################
# Functions to initialise variables
#
# Created:
# 21.11.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#########################################################################################################
############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"


#########################################################################################################
# FUNCTION init_data()
#! Global initialization
######################################################################################################### 
FUNCTION init_data()
  DEFINE
    local_debug,ret SMALLINT


  #Initialise tools library
  CALL init_tools_data()

  #CALL init_string()                                                     --initialise strings
  CALL init_grid_header()                                                --initialise grid header data and alignement
  #CALL init_miscellaneous()                                              --initialise miscellaneous variables

  #need a language global variable for array elements
  LET languageID = get_language()

  CALL process_data_import(get_unl_path("data.unl"))                     --import record data
  CALL init_image_browser()                                              --assigns the passport image file names to an array (contact form)
  CALL init_activity_array(200)                                           --Initialise the Activity Array with data	
END FUNCTION

######################################################################################
# FUNCTION init_msg_box_info()
#! Initialization message box
######################################################################################
FUNCTION init_msg_box_info()

 LET msg_box_info[1] = "fgl_winbutton()\n7 buttons (Button1 - 7)\nDefault button is 4   -   Icon is Stop\nExit = Button1\nReturn value is button text\nFunction Call\nfgl_winbutton(\"fgl_winbutton() Title Text\", \nMy Main text\\nwith multiple\\nlines\", \"Button4\", \n\"Button1|Button2|Button3|Button4|Button5|Button6|Button7\", \"Stop\", 1)\nReturn Value of the fgl_winbutton() message box:"

END FUNCTION


######################################################################################
# FUNCTION init_activity_array(array_max)
#! Initialize some more meaningful activity actions
######################################################################################
FUNCTION init_activity_array(array_max)
  DEFINE 
    i SMALLINT,
    array_max, arrIndex SMALLINT

  FOR i = 1 TO array_max
    LET act_arr[i].act_date = TODAY - i
    #LET act_arr[i].act_act = "Activity number ", i

		LET arrIndex = i MOD 9
		IF arrIndex = 0 THEN
			LET arrIndex = 9
		END IF
		
    #Let's assign manually some more meaningful activity actions
    LET act_arr[i].act_act = get_str(371 + arrIndex)		
		
    LET act_arr[i].act_tit  = cust_rec[arrIndex].cust_title
    LET act_arr[i].act_conf = cust_rec[arrIndex].cust_fname 
    LET act_arr[i].act_conl = cust_rec[arrIndex].cust_lname

    IF i MOD 3 = 0 THEN
      LET act_arr[i].act_state = get_str(310)
    ELSE 
      IF i MOD 2 = 0 THEN
        LET act_arr[i].act_state = get_str(311)
      ELSE
        LET act_arr[i].act_state = get_str(312)
      END IF
    END IF

	#Cost
	LET act_arr[i].act_cost = fgl_random(100,9999)
	LET act_arr[i].act_priority = fgl_random(1,100)
	
  END FOR



END FUNCTION



######################################################################################
# FUNCTION init_grid_header()
#! Initialize grid header
######################################################################################
FUNCTION init_grid_header()


  LET grid_header[1].col_name =  "act_date"
  LET grid_header[1].col_label = get_str(285) --"Activity Date:"
  LET grid_header[1].col_alignment = "left"
  LET grid_header[1].col_key = "F41"

  LET grid_header[2].col_name =  "act_activity"
  LET grid_header[2].col_label = get_str(286) --"Activity:"
  LET grid_header[2].col_alignment = "left"
  LET grid_header[2].col_key = "F42"

  LET grid_header[3].col_name =  "act_tit"
  LET grid_header[3].col_label = get_str(287) --"Contact Title:"
  LET grid_header[3].col_alignment = "left"
  LET grid_header[3].col_key = "F43"

  LET grid_header[4].col_name =  "act_conf"
  LET grid_header[4].col_label = get_str(288) --"Contact First Name:"
  LET grid_header[4].col_alignment = "left"
  LET grid_header[4].col_key = "F44"

  LET grid_header[5].col_name =  "act_conl"
  LET grid_header[5].col_label = get_str(289) --"Contact Last Name:"
  LET grid_header[5].col_alignment = "left"
  LET grid_header[5].col_key = "F45"

  LET grid_header[6].col_name =  "act_state"
  LET grid_header[6].col_label = get_str(290) --"State:"
  LET grid_header[6].col_alignment = "left"
  LET grid_header[6].col_key = "F46"


END FUNCTION



######################################################################################
# FUNCTION init_image_browser()
#
#! Image browser selection for the contact form images
#
# RETURN NONE
######################################################################################
FUNCTION init_image_browser()
  DEFINE iid SMALLINT

  #Needs to be extended to 7 images
  FOR iid = 1 TO 7
    LET cust_picture[iid] = cust_rec[iid].cust_picture
  END FOR

END FUNCTION

