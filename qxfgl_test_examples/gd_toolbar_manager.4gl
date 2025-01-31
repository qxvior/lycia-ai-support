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
# Modification History:
# None
#########################################################################################################
############################################################
# Globals
############################################################
GLOBALS "gd_globals.4gl"


###########################################################
# FUNCTION process_toolbar_init(file_name)
###########################################################
FUNCTION process_toolbar_init(file_name)

  #International Toolbar Icons / key labels
  DEFINE
    file_name, tempstr VARCHAR(40),
    local_debug,id,str_length SMALLINT

  LET local_debug = 0
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### start ##### ",file_name, " ########### process_toolbar_init(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",toolbar[id].*) 

##### check this out ####
#  IF id > 1 then
#  LET tempstr = toolbar[id].m_name
#  LET str_length = length(tempstr) 
#  LET toolbar[id].m_name = tempstr[2,str_length]

  #display "--------------->", toolbar[id].m_name
#  end if

    #Import Debug Help
    IF local_debug = 1 OR global_debug = 1 THEN

      DISPLAY "### In Loop ##### ########### process_toolbar_init(" , file_name, ")" 
      DISPLAY "toolbar[", id, "].m_name:      ", toolbar[id].m_name
      DISPLAY "toolbar[", id, "].m_item:      ", toolbar[id].m_item
      DISPLAY "toolbar[", id, "].action_time: ", toolbar[id].action_time
      DISPLAY "toolbar[", id, "].action:      ", toolbar[id].action
      DISPLAY "toolbar[", id, "].dialog:      ", toolbar[id].dialog
      DISPLAY "toolbar[", id, "].event:       ", toolbar[id].event
      DISPLAY "toolbar[", id, "].txt_en:      ", toolbar[id].txt_en
      DISPLAY "toolbar[", id, "].txt_sp:      ", toolbar[id].txt_sp
      DISPLAY "toolbar[", id, "].txt_de:      ", toolbar[id].txt_de
      DISPLAY "toolbar[", id, "].txt_fr:      ", toolbar[id].txt_fr
      DISPLAY "toolbar[", id, "].txt_ar:      ", toolbar[id].txt_ar
      DISPLAY "toolbar[", id, "].txt_it:      ", toolbar[id].txt_it
      DISPLAY "toolbar[", id, "].txt_ot:      ", toolbar[id].txt_ot
      DISPLAY "toolbar[", id, "].image:       ", toolbar[id].image
      DISPLAY "toolbar[", id, "].ord:         ", toolbar[id].ord
      DISPLAY "toolbar[", id, ".stat:      ", toolbar[id].stat
    END IF

    LET id = id + 1
  END WHILE


  LET toolbar_array_size = id - 1
  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### END of file import. used array size = " , toolbar_array_size, "  ##### ",file_name, " ###########"   
  END IF


  CALL fgl_channel_close("stream")

END FUNCTION


###########################################################
# FUNCTION publish_toolbar_guidemo_global(action_time)
###########################################################
FUNCTION publish_toolbar(menu_name,action_time)
  DEFINE
    menu_name VARCHAR(20),
    action_time, id SMALLINT,
    local_debug SMALLINT

  LET local_debug = 0

  IF local_debug = 1 THEN
    DISPLAY "Start: publish_toolbar_guidemo_global(action_time)"
  END IF

  FOR id = 1 TO toolbar_array_size

    IF  toolbar[id].m_name = menu_name THEN
      CALL draw_tb_icon(id)
    END IF
  END FOR

  IF local_debug = 1 THEN
    DISPLAY "End: publish_toolbar() array_size = ", id , "id = ", id
  END IF


END FUNCTION



##################################################################################
# FUNCTION draw_tb_icon()
##################################################################################
FUNCTION draw_tb_icon(id)
  DEFINE
    lang_string VARCHAR(100),
    id, local_debug SMALLINT

  LET local_debug = 0

  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "draw_tb_icon(id)","id = ", id, "info"
  END IF

  CASE language
    WHEN 1  --english
      LET lang_string = toolbar[id].txt_en
    WHEN 2  --spanish
      LET lang_string = toolbar[id].txt_sp
    WHEN 3  --german
      LET lang_string = toolbar[id].txt_de
    WHEN 4  --french
      LET lang_string = toolbar[id].txt_fr
    WHEN 5  --arabic
      LET lang_string = toolbar[id].txt_ar
    WHEN 6  --italian
      LET lang_string = toolbar[id].txt_ar
    WHEN 7  --other
      LET lang_string = toolbar[id].txt_ar
    OTHERWISE
      CALL fgl_winmessage(get_str(30),get_str(32) || "draw_tb_icon(id)\nInvalid language set - " || language, "error")
  END CASE

  LET local_debug = FALSE
  CASE toolbar[id].action

    WHEN 1 --fgl_set_keylabel & fgl_dialog_setkeylabel
      IF toolbar[id].dialog = 0 THEN
        CALL fgl_setkeylabel(toolbar[id].event,lang_string,toolbar[id].image,toolbar[id].ord,toolbar[id].stat)
        IF local_debug = 1 THEN
          DISPLAY "fgl_setkeylabel(",toolbar[id].event, "-",lang_string,toolbar[id].image,"-",toolbar[id].ord,"-",toolbar[id].stat ,")"
        END IF

{       if toolbar[id].stat = 1 then
        CALL fgl_winmessage(toolbar[id].event,lang_string,"info")
        CALL fgl_winmessage(toolbar[id].image,toolbar[id].ord,"info")
        CALL fgl_winmessage("",toolbar[id].stat,"info")
        end if
}
      ELSE

        CALL fgl_dialog_setkeylabel(toolbar[id].event,lang_string,toolbar[id].image,toolbar[id].ord,toolbar[id].stat)

        IF local_debug = 1 THEN
          DISPLAY "fgl_dialog_setkeylabel(",toolbar[id].event, "-",lang_string,toolbar[id].image,"-",toolbar[id].ord,"-",toolbar[id].stat ,")"
        END IF

      END IF

    WHEN 2 --REMOVE KEY LABELS USING fgl_set_keylabel & fgl_dialog_setkeylabel
      IF toolbar[id].dialog = 0 THEN

        CALL fgl_setkeylabel(toolbar[id].event,"")

        IF local_debug = 1 OR global_debug = 1 THEN
          DISPLAY "remove global toolbar icon - fgl_setkeylabel(", toolbar[id].event, ",\"\""
        END IF

      ELSE

        CALL fgl_dialog_setkeylabel(toolbar[id].event,"")

        IF local_debug = 1 OR global_debug = 1 THEN
          DISPLAY "remove dialog toolbar icon - fgl_dialog_setkeylabel(", toolbar[id].event, ",\"\""
        END IF

      END IF

    WHEN 3 -- fgl_keydivider and fgl_dialog_keydivider
      IF toolbar[id].dialog = 0 THEN
        CALL fgl_keydivider(toolbar[id].ord)

        IF local_debug = 1 THEN
          DISPLAY "fgl_keydivider(",toolbar[id].ord , ")"
        END IF

      ELSE
        CALL fgl_dialog_keydivider(toolbar[id].ord)

        IF local_debug = 1 THEN
          DISPLAY "fgl_dialog_keydivider(",toolbar[id].ord , ")"
        END IF

      END IF


    WHEN 4 -- REMOVE fgl_keydivider and fgl_dialog_keydivider
      IF toolbar[id].dialog = 0 THEN
        CALL fgl_clearkeydivider(toolbar[id].ord)

        IF local_debug = 1 THEN
          DISPLAY "fgl_clearkeydivider(",toolbar[id].ord , ")"
        END IF

      ELSE
        CALL fgl_dialog_clearkeydivider(toolbar[id].ord)

        IF local_debug = 1 THEN
          DISPLAY "fgl_dialog_clearkeydivider(",toolbar[id].ord , ")"
        END IF

      END IF


    OTHERWISE
      CALL fgl_winmessage(get_str(30),get_str(32) || " draw_tb_icon()\ntoolbar[" || id || ".action ->" || toolbar[id].action, "error")

  END CASE
END FUNCTION

###########################################################################################
# FUNCTION manage_toolbar_list()
###########################################################################################
FUNCTION manage_toolbar_list()
  DEFINE tmp_tb_arr ARRAY[200] OF RECORD
    m_name STRING,
    m_item STRING,
    event STRING,
    stat SMALLINT,
    action SMALLINT,
    ord SMALLINT,
    txt_en STRING,
    dialog SMALLINT,
    action_time SMALLINT,
    image STRING

  END RECORD
  DEFINE arr_idx INTEGER
  DEFINE scr_idx INTEGER
  DEFINE i INTEGER

  OPTIONS
    FORM LINE 2
display "manage_toolbar_list() double declared ? - is this actually used ? gd_toolbar_manager.4gl AND tools_toolbar_manager.4gl"
  FOR i = 1 TO toolbar_array_size
    LET tmp_tb_arr[i].m_name = toolbar[i].m_name
    LET tmp_tb_arr[i].m_item = toolbar[i].m_item
    LET tmp_tb_arr[i].event = toolbar[i].event
    LET tmp_tb_arr[i].stat = toolbar[i].stat
    LET tmp_tb_arr[i].action = toolbar[i].action
    LET tmp_tb_arr[i].ord = toolbar[i].ord
    LET tmp_tb_arr[i].txt_en = toolbar[i].txt_en  
    LET tmp_tb_arr[i].dialog = toolbar[i].dialog  
    LET tmp_tb_arr[i].action_time = toolbar[i].action_time  
    LET tmp_tb_arr[i].image = toolbar[i].image
  END FOR

  CALL fgl_window_open("w_toolbar_list",5,3,get_form_path("gd_f_toolbar_list"),1)


  DISPLAY get_str(850) TO lbTitle
  CALL fgl_settitle(get_str(850))


  CALL set_count(toolbar_array_size)


  INPUT ARRAY tmp_tb_arr WITHOUT DEFAULTS FROM tb_list_ar.*  HELP 1
    BEFORE INPUT
      CALL publish_toolbar("tb_man_arr",0)

    ON KEY (F2)
      LET arr_idx = arr_curr()
      LET scr_idx = scr_line()
      CALL icon_detail_edit(arr_idx)
      LET tmp_tb_arr[arr_idx].m_name = toolbar[arr_idx].m_name
      LET tmp_tb_arr[arr_idx].m_item = toolbar[arr_idx].m_item
      LET tmp_tb_arr[arr_idx].event = toolbar[arr_idx].event
      LET tmp_tb_arr[arr_idx].stat = toolbar[arr_idx].stat
      LET tmp_tb_arr[arr_idx].action = toolbar[arr_idx].action
      LET tmp_tb_arr[arr_idx].ord = toolbar[arr_idx].ord
      LET tmp_tb_arr[arr_idx].txt_en = toolbar[arr_idx].txt_en  
      LET tmp_tb_arr[arr_idx].dialog = toolbar[arr_idx].dialog  
      LET tmp_tb_arr[arr_idx].action_time = toolbar[arr_idx].action_time  
      LET tmp_tb_arr[arr_idx].image = toolbar[arr_idx].image  

      DISPLAY tmp_tb_arr[arr_idx].* TO tb_list_ar[scr_idx].*

    ON KEY(F9)
      LET arr_idx = arr_curr()
      LET toolbar[arr_idx].image = icon_browser()

      #DISPLAY toolbar[arr_idx].image TO image

    ON KEY(F11)
      EXIT INPUT
  END INPUT

  CALL fgl_window_close("w_toolbar_list")

  OPTIONS
    FORM LINE 3

END FUNCTION


###########################################################################################
# FUNCTION icon_detail_edit(id)
###########################################################################################
FUNCTION icon_detail_edit(id)
  DEFINE
    id SMALLINT

  OPTIONS
    FORM LINE 2

  CALL fgl_window_open("w_icon_details",9,6,get_form_path("gd_f_toolbar_icon_detail"),1)

  DISPLAY get_str(860) TO lbTitle
  CALL fgl_settitle(get_str(860))


  INPUT BY NAME
    toolbar[id].* WITHOUT DEFAULTS HELP 1 

    BEFORE INPUT
      CALL publish_toolbar("tb_man_det",0)

    ON KEY(F11)
      EXIT INPUT

    ON KEY(F2)
      CALL fgl_dialog_update_data()
      EXIT INPUT

    ON KEY(F9)
      LET toolbar[id].image = icon_browser()
      DISPLAY toolbar[id].image TO image

  END INPUT

  --sleep 5
  CALL fgl_window_close("w_icon_details")

  OPTIONS
    FORM LINE 3

END FUNCTION

##################################################################
FUNCTION icon_browser()
  DEFINE 
    icon_name varchar(50),
    i,id,change_image SMALLINT

  # DEFINE icon_list ARRAY[toolbar_array_size] OF VARCHAR(50)  
  DEFINE icon_list ARRAY[1000] OF VARCHAR(50) 

  FOR i = 1 TO toolbar_array_size
    LET icon_list[i] = toolbar[i].image
  END FOR

  CALL fgl_window_open("w_ic_browser",3,60,get_form_path("gd_f_toolbar_icon_browser"),1)

  CALL set_count(10)


  DISPLAY ARRAY icon_list TO ic_array.* --WITHOUT SCROLL
    BEFORE DISPLAY
      CALL publish_toolbar("img_brows",0)

    ON KEY(F2)
      LET change_image = 1
      EXIT DISPLAY

    ON KEY(F11)   -- cancel
      LET change_image = 0
      EXIT DISPLAY

  END DISPLAY

  IF change_image = 1 AND int_flag IS NOT NULL THEN
    LET i = arr_curr()
  END IF

  CALL fgl_window_close("w_ic_browser")

  RETURN icon_list[i]
END FUNCTION

