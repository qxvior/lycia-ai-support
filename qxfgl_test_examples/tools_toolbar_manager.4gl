#########################################################################################################
# Graphical toolbar manager
#
# Created:
# 10.10.06 HH - V3 - This set of functions handles the import of toolbar configurations and
# allow to display and remove complete toolbars with a single function call
#
# It is written in a re-usable way. Feel free to integrate it into your 4gl application
# to have fully dynamic and customizable toolbars.
#
#
# FUNCTION                                        DESCRIPTION                                            RETURN
# process_toolbar_init(file_name)                 Import toolbar config file -                           NONE
#                                                 each menu name has one or more menu items 
# publish_toolbar(action_time)                    Publish a group of toolbar menu icons                  NONE
# draw_tb_icon()                                  Draw a single menu item                                NONE
# hide_dialog_navigation_toolbar(choice)          Hide all auto-generated navigation buttons             NONE
# manage_toolbar_list()                           Display a list of all toolbar menu items -             NONE
#                                                 items can also be edited in detail
# copy_t_toolbar_to_t_toolbar_short(tb_rec)       copy t_toolbar data rec to t_toolbar_short             tb_short_rec.* 
# icon_detail_edit(id)                            Edit icon configuration (for a single menu item)       NONE
# icon_browser()                                  Displays the list of all icons (using the lazy way...) icon_list[i]
#
#########################################################################################################

############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


###########################################################
# FUNCTION process_toolbar_init(file_name)
#
# Import toolbar config file - each menu name has one or more menu items 
#
# RETURN NONE
###########################################################
FUNCTION process_toolbar_init(file_name)

  #International Toolbar Icons / key labels
  DEFINE
    file_name, tempstr VARCHAR(40),
    local_debug,id,str_length SMALLINT

  IF NOT fgl_test("e",file_name) THEN
    LET tl_err_msg = "File Error in process_toolbar_init()\n", get_str_tool(763), " ", file_name, "\n", get_str_tool(21)
    CALL fgl_winmessage(get_str_tool(30) ,tl_err_msg, "error")
    EXIT PROGRAM
  END IF


  LET local_debug = FALSE
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "### start ##### ",file_name, " ########### process_toolbar_init(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",tl_toolbar[id].*) 


    #Import Debug Help
    IF local_debug THEN

      DISPLAY "### In Loop ##### ########### process_toolbar_init(" , file_name, ")" 
      DISPLAY "tl_toolbar[", id, "].m_name:      ", tl_toolbar[id].m_name
      DISPLAY "tl_toolbar[", id, "].m_item:      ", tl_toolbar[id].m_item
      DISPLAY "tl_toolbar[", id, "].action_time: ", tl_toolbar[id].action_time
      DISPLAY "tl_toolbar[", id, "].action:      ", tl_toolbar[id].action
      DISPLAY "tl_toolbar[", id, "].dialog:      ", tl_toolbar[id].dialog
      DISPLAY "tl_toolbar[", id, "].event:       ", tl_toolbar[id].event
      DISPLAY "tl_toolbar[", id, "].txt_en:      ", tl_toolbar[id].txt_en
      DISPLAY "tl_toolbar[", id, "].txt_sp:      ", tl_toolbar[id].txt_sp
      DISPLAY "tl_toolbar[", id, "].txt_de:      ", tl_toolbar[id].txt_de
      DISPLAY "tl_toolbar[", id, "].txt_fr:      ", tl_toolbar[id].txt_fr
      DISPLAY "tl_toolbar[", id, "].txt_ar:      ", tl_toolbar[id].txt_ar
      DISPLAY "tl_toolbar[", id, "].txt_it:      ", tl_toolbar[id].txt_it
      DISPLAY "tl_toolbar[", id, "].txt_ot:      ", tl_toolbar[id].txt_ot
      DISPLAY "tl_toolbar[", id, "].image:       ", tl_toolbar[id].image
      DISPLAY "tl_toolbar[", id, "].ord:         ", tl_toolbar[id].ord
      DISPLAY "tl_toolbar[", id, "].stat:        ", tl_toolbar[id].stat
    END IF


    IF tl_toolbar[id].m_name <> "EOF" AND tl_toolbar[id].m_name IS NOT NULL THEN   --Terminating on EOF or empty menu name
      IF tl_toolbar[id].action = 1 THEN
      	IF tl_toolbar[id].image[1,9] <>  "{CONTEXT}" THEN
        	IF NOT fgl_test("e",tl_toolbar[id].image) THEN   --check if the icon exists on the server
        	  LET tl_err_msg = get_str_tool(851) CLIPPED, " ID ", id CLIPPED, "\n", get_str_tool(854) CLIPPED, "  ", tl_toolbar[id].image  CLIPPED, "\n", get_str_tool(852) CLIPPED  ,": ", tl_toolbar[id].m_name  CLIPPED, " ", get_str_tool(853)  ," : ", tl_toolbar[id].m_item
        	  #CALL fgl_winmessage(get_str_tool(851),tl_err_msg, "error")
        	  IF local_debug THEN
        	    DISPLAY "Error - Could not find toolbar icon [",id CLIPPED,"] image:>", tl_toolbar[id].image  CLIPPED, "< men-name: >", tl_toolbar[id].m_name  CLIPPED, "< men-item: >", tl_toolbar[id].m_item  CLIPPED , "<"
        	  END IF
        	END IF
        END IF
      END IF
      LET id = id + 1
    ELSE
      EXIT WHILE
    END IF
  END WHILE

  LET tl_toolbar_array_size = id - 1


  IF local_debug THEN
    DISPLAY "### END of file import. used array size = " , tl_toolbar_array_size, "  ##### ",file_name, " ###########"   
  END IF


  CALL fgl_channel_close("stream")

END FUNCTION


###########################################################
# FUNCTION export_toolbar_init(file_name)
#
# Export toolbar config file - each menu name has one or more menu items 
#
# RETURN NONE
###########################################################
FUNCTION export_toolbar_init(file_name)

  #International Toolbar Icons / key labels
  DEFINE
    file_name, tempstr VARCHAR(40),
    local_debug,id,str_length SMALLINT

  IF NOT fgl_test("e",file_name) THEN
    LET tl_err_msg = "File Error in export_toolbar_init()\n", get_str_tool(763), " ", file_name, "\n", get_str_tool(21)
    CALL fgl_winmessage(get_str_tool(30) ,tl_err_msg, "error")
    EXIT PROGRAM
  END IF


  LET local_debug = FALSE
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "w")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "### start ##### ",file_name, " ########### export_toolbar_init(" , file_name, ")"  
  END IF

  WHILE fgl_channel_write("stream",tl_toolbar[id].*) 


    #Import Debug Help
    IF local_debug THEN

      DISPLAY "### In Loop ##### ########### process_toolbar_init(" , file_name, ")" 
      DISPLAY "export_toolbar_init[", id, "].m_name:      ", tl_toolbar[id].m_name
      DISPLAY "export_toolbar_init[", id, "].m_item:      ", tl_toolbar[id].m_item
      DISPLAY "export_toolbar_init[", id, "].action_time: ", tl_toolbar[id].action_time
      DISPLAY "export_toolbar_init[", id, "].action:      ", tl_toolbar[id].action
      DISPLAY "export_toolbar_init[", id, "].dialog:      ", tl_toolbar[id].dialog
      DISPLAY "export_toolbar_init[", id, "].event:       ", tl_toolbar[id].event
      DISPLAY "export_toolbar_init[", id, "].txt_en:      ", tl_toolbar[id].txt_en
      DISPLAY "export_toolbar_init[", id, "].txt_sp:      ", tl_toolbar[id].txt_sp
      DISPLAY "export_toolbar_init[", id, "].txt_de:      ", tl_toolbar[id].txt_de
      DISPLAY "export_toolbar_init[", id, "].txt_fr:      ", tl_toolbar[id].txt_fr
      DISPLAY "export_toolbar_init[", id, "].txt_ar:      ", tl_toolbar[id].txt_ar
      DISPLAY "export_toolbar_init[", id, "].txt_it:      ", tl_toolbar[id].txt_it
      DISPLAY "export_toolbar_init[", id, "].txt_ot:      ", tl_toolbar[id].txt_ot
      DISPLAY "export_toolbar_init[", id, "].image:       ", tl_toolbar[id].image
      DISPLAY "export_toolbar_init[", id, "].ord:         ", tl_toolbar[id].ord
      DISPLAY "export_toolbar_init[", id, "].stat:        ", tl_toolbar[id].stat
    END IF


    IF tl_toolbar[id].m_name = "EOF" OR tl_toolbar[id].m_name = "" OR tl_toolbar[id].m_name IS NULL THEN
      EXIT WHILE
    END IF

    IF id >= tl_toolbar_array_size THEN
      EXIT WHILE
    END IF 

    LET id = id + 1

  END WHILE


  #LET toolbar_array_size = id -- 1

  IF local_debug THEN
    DISPLAY "### END of file export. used array size = " , id, " tl_toolbar_array_size= ", tl_toolbar_array_size, "  ##### ",file_name, " ###########"   
  END IF


  CALL fgl_channel_close("stream")

END FUNCTION



###########################################################
# FUNCTION publish_toolbar(action_time)
#
# Publish a group of toolbar menu icons
#
# RETURN NONE
###########################################################
FUNCTION publish_toolbar(menu_name,action_time)
  DEFINE
    menu_name VARCHAR(20),
    action_time, id SMALLINT,
    local_debug SMALLINT

  LET local_debug = FALSE

  IF local_debug THEN
    DISPLAY "Start: publish_toolbar_guidemo_global(action_time)"
  END IF

  FOR id = 1 TO tl_toolbar_array_size

    IF  tl_toolbar[id].m_name = menu_name AND tl_toolbar[id].action_time = action_time THEN
      CALL draw_tb_icon(id)
    END IF
  END FOR

  IF local_debug THEN
    DISPLAY "End: publish_toolbar() array_size = ", id , "id = ", id
  END IF


END FUNCTION



##################################################################################
# FUNCTION draw_tb_icon()
#
# Draw a single menu item
#
# RETURN NONE
##################################################################################
FUNCTION draw_tb_icon(id)
  DEFINE
    lang_string VARCHAR(100),
    id, local_debug SMALLINT

  LET local_debug = FALSE

  IF local_debug THEN
    DISPLAY "CALL draw_tb_icon(id)","id = ", trim(id)
    DISPLAY "tl_settings.language=", tl_settings.languageId
  END IF

  CASE tl_settings.languageId
    WHEN 1  --english
      LET lang_string = tl_toolbar[id].txt_en
    WHEN 2  --spanish
      LET lang_string = tl_toolbar[id].txt_sp
    WHEN 3  --german
      LET lang_string = tl_toolbar[id].txt_de
    WHEN 4  --french
      LET lang_string = tl_toolbar[id].txt_fr
    WHEN 5  --arabic
      LET lang_string = tl_toolbar[id].txt_ar
    WHEN 6  --italian
      LET lang_string = tl_toolbar[id].txt_it
    WHEN 7  --other
      LET lang_string = tl_toolbar[id].txt_ot
    OTHERWISE
      LET tl_err_msg = get_str_tool(32), "draw_tb_icon(id)\n", get_str_tool(804) CLIPPED, " - " , tl_settings.languageId
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END CASE

  IF local_debug THEN
    DISPLAY "lang_string", lang_string
  END IF
  
  CASE tl_toolbar[id].action

    WHEN 1 --fgl_set_keylabel & fgl_dialog_setkeylabel
      IF tl_toolbar[id].dialog = 0 THEN
        CALL fgl_setkeylabel(tl_toolbar[id].event,lang_string,tl_toolbar[id].image,tl_toolbar[id].ord,tl_toolbar[id].stat)
        IF local_debug  THEN
          DISPLAY "fgl_setkeylabel(",tl_toolbar[id].event, " , ",lang_string, " , ",tl_toolbar[id].image," , ",tl_toolbar[id].ord," , ",tl_toolbar[id].stat ,")"
        END IF

      ELSE

        CALL fgl_dialog_setkeylabel(tl_toolbar[id].event,lang_string,tl_toolbar[id].image,tl_toolbar[id].ord,tl_toolbar[id].stat)

        IF local_debug THEN
          DISPLAY "fgl_dialog_setkeylabel(",tl_toolbar[id].event, " , ",lang_string, " , ", tl_toolbar[id].image," , ",tl_toolbar[id].ord," , ",tl_toolbar[id].stat ,")"
        END IF

      END IF

    WHEN 2 --REMOVE KEY LABELS USING fgl_set_keylabel & fgl_dialog_setkeylabel
      IF tl_toolbar[id].dialog = 0 THEN

        CALL fgl_setkeylabel(tl_toolbar[id].event,"","")

        IF local_debug THEN
          DISPLAY "remove global toolbar icon - fgl_setkeylabel(", tl_toolbar[id].event, ",\"\"", ")"
        END IF

      ELSE

        CALL fgl_dialog_setkeylabel(tl_toolbar[id].event,"","")

        IF local_debug THEN
          DISPLAY "remove dialog toolbar icon - fgl_dialog_setkeylabel(", tl_toolbar[id].event, ",\"\"", ")"
        END IF

      END IF

    WHEN 3 -- fgl_keydivider and fgl_dialog_keydivider
      IF tl_toolbar[id].dialog = 0 THEN
        CALL fgl_keydivider(tl_toolbar[id].ord)
        IF local_debug THEN
          DISPLAY "fgl_keydivider(",tl_toolbar[id].ord , ")"
        END IF

      ELSE
        CALL fgl_dialog_keydivider(tl_toolbar[id].ord)
        IF local_debug THEN
          DISPLAY "fgl_dialog_keydivider(",tl_toolbar[id].ord , ")"
        END IF

      END IF


    WHEN 4 -- REMOVE fgl_keydivider and fgl_dialog_keydivider
      IF tl_toolbar[id].dialog = 0 THEN
        CALL fgl_clearkeydivider(tl_toolbar[id].ord)

        IF local_debug THEN
          DISPLAY "fgl_clearkeydivider(",tl_toolbar[id].ord , ")"
        END IF

      ELSE
        CALL fgl_dialog_clearkeydivider(tl_toolbar[id].ord)

        IF local_debug THEN
          DISPLAY "fgl_dialog_clearkeydivider(",tl_toolbar[id].ord , ")"
        END IF

      END IF


    OTHERWISE
      LET tl_err_msg = get_str_tool(32), " draw_tb_icon()\ntl_toolbar[" , id , ".action ->" , tl_toolbar[id].action
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END CASE
END FUNCTION


##################################################################
# FUNCTION hide_dialog_navigation_toolbar(choice)
#
# Hide all auto-generated navigation buttons
#
# RETURN NONE
##################################################################
FUNCTION hide_dialog_navigation_toolbar(choice)
  DEFINE choice SMALLINT  --0=all  1= up/down  2= next/prev page  3= first/last

  CASE choice
    WHEN 0
      CALL fgl_dialog_setkeylabel("PREVIOUS","")  
      CALL fgl_dialog_setkeylabel("NEXT","") 
      CALL fgl_dialog_setkeylabel("DOWN","") 
      CALL fgl_dialog_setkeylabel("UP","") 
      CALL fgl_dialog_setkeylabel("FIRST","") 
      CALL fgl_dialog_setkeylabel("LAST","") 
    WHEN 1
      CALL fgl_dialog_setkeylabel("PREVIOUS","")  
      CALL fgl_dialog_setkeylabel("NEXT","") 
    WHEN 2
      CALL fgl_dialog_setkeylabel("DOWN","") 
      CALL fgl_dialog_setkeylabel("UP","") 
    WHEN 3
      CALL fgl_dialog_setkeylabel("FIRST","") 
      CALL fgl_dialog_setkeylabel("LAST","") 
    OTHERWISE
      LET tl_err_msg = get_str_tool(802) CLIPPED, " \nhide_dialog_navigation_toolbar(choice)\nchoice=" , choice  
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg,"error")
  END CASE
END FUNCTION


###########################################################################################
# FUNCTION manage_toolbar_list()
#
# Display a list of all toolbar menu items - items can also be edited in detail
#
# RETURN NONE
###########################################################################################
FUNCTION manage_toolbar_list(wType)
	DEFINE wType BOOLEAN
  DEFINE 
    tmp_tb_arr DYNAMIC ARRAY OF 
      RECORD
        m_name       STRING,
        m_item       STRING,
        event        STRING,
        stat         SMALLINT,
        action       SMALLINT,
        ord          SMALLINT,
        txt_en       STRING,
        dialog       SMALLINT,
        action_time  SMALLINT,
        image        STRING
      END RECORD,
    r                SMALLINT,
    arr_idx          INTEGER,
    scr_idx          INTEGER,
    i                INTEGER,
    local_debug      SMALLINT,
    icon_file        STRING,
    previous_help_file_id SMALLINT

  LET local_debug = FALSE

  LET previous_help_file_id = get_current_classic_help()
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  CALL fgl_window_open("w_toolbar_list",5,3,get_form_path("f_tools_toolbar_list_2_2"),wType)


  DISPLAY get_str_tool(850) TO lbTitle
  CALL fgl_settitle(get_str_tool(850))

  CALL set_count(tl_toolbar_array_size)

  #WHILE TRUE  --needs to be in while loop to refresh array list after updates

    #copy a set of the toolbar record for the screen array
    FOR i = 1 TO tl_toolbar_array_size
      CALL copy_t_toolbar_to_t_toolbar_short(tl_toolbar[i].*) RETURNING tmp_tb_arr[i].*

      IF local_debug THEN
        DISPLAY "manage_toolbar_list() - tmp_tb_arr[i].image=", tmp_tb_arr[i].image
      END IF
    END FOR

    INPUT ARRAY tmp_tb_arr WITHOUT DEFAULTS FROM tb_list_ar.*  ATTRIBUTE(maxcount=tl_toolbar_array_size) HELP 500
      BEFORE INPUT
        CALL publish_toolbar("tb_man_arr",0)

      ON KEY(F2)
        CALL export_toolbar_init(get_cfg_path(tl_settings.toolbar_cfg_file_name))

      ON KEY (F5)
        LET arr_idx = arr_curr()
        LET scr_idx = scr_line()

        #edit current icon line in detailed view form
        CALL icon_detail_edit(arr_idx)

      ON KEY(F9)  
      
        LET arr_idx = arr_curr()
        #DISPLAY "INPUT ARRAY tmp_tb_arr WITHOUT DEFAULTS FROM tb_list_ar.* arr_idx=", arr_idx
        
        LET icon_file = icon_browser(TRUE)
 
        IF icon_file IS NOT NULL THEN
          #LET tl_toolbar[arr_idx].image = icon_file
          LET tmp_tb_arr[arr_idx].image = icon_file
					DISPLAY tmp_tb_arr[arr_idx].image TO image   
					DISPLAY tmp_tb_arr[arr_idx].image
					DISPLAY tmp_tb_arr[arr_idx].image TO    tb_list_ar[arr_idx].image     
          #EXIT INPUT
        END IF
        #DISPLAY tl_toolbar[arr_idx].image TO image

      #ON KEY(F12)
      #  EXIT INPUT
    END INPUT

    IF int_flag THEN
      LET int_flag = FALSE
    --  EXIT INPUT --WHILE
    ELSE

    #copy a set of the toolbar record for the screen array
    FOR i = 1 TO tl_toolbar_array_size
      CALL copy_t_toolbar_short_to_t_toolbar(tmp_tb_arr[i].*,tl_toolbar[i].*) RETURNING tl_toolbar[i].*

      IF local_debug THEN
        DISPLAY "manage_toolbar_list() - tmp_tb_arr[i].image=", tmp_tb_arr[i].image
      END IF
    END FOR    

      #EXIT WHILE
    ENd IF

 # END WHILE

  CALL fgl_window_close("w_toolbar_list")

  CALL set_classic_help_file(previous_help_file_id)

  #OPTIONS
    #FORM LINE 3

END FUNCTION


############################################################
#FUNCTION copy_t_toolbar_to_t_toolbar_short(tb_rec)
#
# copy t_toolbar data rec to t_toolbar_short
#
# RETURN tl_tb_short_rec.* 
############################################################
FUNCTION copy_t_toolbar_to_t_toolbar_short(tb_rec)
  DEFINE
    tb_rec           OF t_tl_toolbar,
    tb_short_rec     OF t_tl_toolbar_short,
    local_debug      SMALLINT

    LET local_debug = FALSE

    LET tb_short_rec.m_name = tb_rec.m_name
    LET tb_short_rec.m_item = tb_rec.m_item
    LET tb_short_rec.event = tb_rec.event
    LET tb_short_rec.stat = tb_rec.stat
    LET tb_short_rec.action = tb_rec.action
    LET tb_short_rec.ord = tb_rec.ord
    LET tb_short_rec.txt_en = tb_rec.txt_en  
    LET tb_short_rec.dialog = tb_rec.dialog  
    LET tb_short_rec.action_time = tb_rec.action_time  
    LET tb_short_rec.image = tb_rec.image

  IF local_debug THEN
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.m_name=",      tb_short_rec.m_name
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.m_item=",      tb_short_rec.m_item
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.event=" ,      tb_short_rec.event
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.stat="  ,      tb_short_rec.stat
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.action=",      tb_short_rec.action
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.ord="   ,      tb_short_rec.ord
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.txt_en=",      tb_short_rec.txt_en
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.dialog=",      tb_short_rec.dialog
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.action_time=", tb_short_rec.action_time
    DISPLAY "copy_t_toolbar_to_t_toolbar_short() - tl_tb_short_rec.image=",       tb_short_rec.image

  END IF

  RETURN tb_short_rec.*

END FUNCTION


############################################################
#FUNCTION copy_t_toolbar_to_t_toolbar_short(tb_rec)
#
# copy t_toolbar_short data rec to t_toolbar
#
# RETURN tb_small_rec.* 
############################################################
FUNCTION copy_t_toolbar_short_to_t_toolbar(tb_short_rec,tb_rec)
  DEFINE
    tb_rec           OF t_tl_toolbar,
    tb_short_rec     OF t_tl_toolbar_short

    LET tb_rec.m_name = tb_short_rec.m_name
    LET tb_rec.m_item = tb_short_rec.m_item
    LET tb_rec.event = tb_short_rec.event
    LET tb_rec.stat = tb_short_rec.stat
    LET tb_rec.action = tb_short_rec.action
    LET tb_rec.ord = tb_short_rec.ord
    LET tb_rec.txt_en = tb_short_rec.txt_en  
    LET tb_rec.dialog = tb_short_rec.dialog  
    LET tb_rec.action_time = tb_short_rec.action_time  
    LET tb_rec.image = tb_short_rec.image

  RETURN tb_rec.*

END FUNCTION


###########################################################################################
# FUNCTION icon_detail_edit(id)
#
# Edit icon configuration (for a single menu item)
#
# RETURN NONE
###########################################################################################
FUNCTION icon_detail_edit(id)
  DEFINE
    id SMALLINT

  #OPTIONS
  #  FORM LINE 2

  CALL fgl_window_open("w_icon_details",9,6,get_form_path("f_tools_toolbar_icon_detail_g"),1)

  DISPLAY get_str_tool(860) TO lbTitle
  CALL fgl_settitle(get_str_tool(860))
  DISPLAY get_str_tool(852) to dl_grp_nam
  DISPLAY get_str_tool(853) to dl_item

  INPUT BY NAME
    tl_toolbar[id].* WITHOUT DEFAULTS HELP 1 

    BEFORE INPUT
      CALL publish_toolbar("tb_man_det",0)

    #ON KEY(F12)
    #  EXIT INPUT

    #ON KEY(F2)
    #  CALL fgl_dialog_update_data()
    #  EXIT INPUT

    ON KEY(F9)
      LET tl_toolbar[id].image = icon_browser(TRUE) #with or without URI true/false
      DISPLAY tl_toolbar[id].image TO image
    
    ON ACTION actExitModule
      EXIT INPUT

  END INPUT

  --sleep 5
  CALL fgl_window_close("w_icon_details")

  #OPTIONS
  #  FORM LINE 3

END FUNCTION


##################################################################
# FUNCTION icon_browser()
#
# Displays the list of all icons (using the lazy way...)
#
# RETURN icon_list[i]
##################################################################
FUNCTION icon_browser(pWithUri)
  DEFINE 
    icon_name,icon_name_uri         STRING,
    i,id,change_image SMALLINT,
    local_debug       SMALLINT,
    pWithUri BOOLEAN

  # DEFINE icon_list ARRAY[toolbar_array_size] OF VARCHAR(50)  
  DEFINE icon_list DYNAMIC ARRAY OF RECORD
  	icon_name, icon_name_uri STRING
	END RECORD
	
  LET local_debug = FALSE


	IF pWithUri IS NULL THEN
		LET pWithUri = FALSE
	END IF

	IF pWithUri = TRUE THEN
		CALL fgl_window_open("w_ic_browser",3,30,get_form_path("f_tools_toolbar_icon_browser_with_uri_2_2"),1)
  ELSE
		CALL fgl_window_open("w_ic_browser",3,30,get_form_path("f_tools_toolbar_icon_browser_2_2"),1)
	END IF
	CALL fgl_settitle("Icon")
  		
	IF local_debug THEN
		DISPLAY "In function icon_browser()"
	END IF
	
  # set help file '10' (10 is used for this tools library) define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(10)

  FOR i = 1 TO tl_toolbar_array_size
    LET icon_list[i].icon_name = tl_toolbar[i].image
    LET icon_list[i].icon_name_uri = tl_toolbar[i].image
    IF local_debug THEN
      DISPLAY "icon_browser() - i=",i, "  image=", tl_toolbar[i].image
    END IF
  END FOR



  CALL set_count(i-1)  --correct by one due to for loop increment
  
	IF local_debug THEN
		DISPLAY "tl_toolbar_array_size=" , tl_toolbar_array_size
		DISPLAY "set_count(i) i=",i
	END IF

  DISPLAY ARRAY icon_list TO ic_array.* HELP  500 
    BEFORE DISPLAY
      CALL publish_toolbar("img_brows",0)

    #ON KEY(F2)
    #  LET change_image = 1
    #  EXIT DISPLAY

    #ON KEY(F12)   -- cancel
    #  LET change_image = 0
    #  EXIT DISPLAY

  END DISPLAY

	IF local_debug THEN
		DISPLAY "arr_curr()=",arr_curr()
	END IF
	
  CALL fgl_window_close("w_ic_browser")

  IF NOT int_flag THEN  --change_image = 1 AND int_flag IS NOT NULL THEN
    LET i = arr_curr()
    
		IF local_debug THEN
			DISPLAY "RETURN i=",i
		END IF    
	
    RETURN icon_list[i].icon_name
  ELSE
    LET int_flag = FALSE
    
		IF local_debug THEN
			DISPLAY "RETURN NULL",i
		END IF     
		
    RETURN NULL
  END IF

END FUNCTION

