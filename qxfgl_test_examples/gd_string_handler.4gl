#########################################################################################################
# String intialisation and handling for international support
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


######################################################################################
# FUNCTION set_language(lang)
######################################################################################
FUNCTION set_language(lang)
  DEFINE lang SMALLINT

  IF lang < 1 OR lang > 5 THEN
    CALL fgl_winmessage("Internal 4GL Demo Source Code Error in set_language(lang)","Function set_language(lang) Language ID\n " || lang || " \ndoes not exist! ","error") 
  ELSE
    LET language = lang
    CALL publish_toolbar("global",1)  -- run after toolbar clean up
    CALL publish_toolbar("global",0)
  END IF

END FUNCTION



###########################################################
# FUNCTION process_string_import(file_name)
###########################################################
FUNCTION process_string_import(file_name)

  #International strings
  DEFINE
    file_name, tempstr VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT

  LET local_debug = 0
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### start ##### ",file_name, " ########### process_string_import(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",tmp_int_str.*)
    IF  tmp_int_str.id IS NOT NULL AND tmp_int_str.id != 0 THEN
      LET id2 =  tmp_int_str.id
    ELSE
      LET id2 = 1000
    END IF

    IF local_debug = 1 OR global_debug = 1 THEN
      DISPLAY "id2 = ", id2
      DISPLAY "tmp_int_str.id ", tmp_int_str.id
    END IF

    LET int_str[id2].txt_en = tmp_int_str.txt_en
    LET int_str[id2].txt_sp = tmp_int_str.txt_sp
    LET int_str[id2].txt_de = tmp_int_str.txt_de
    LET int_str[id2].txt_fr = tmp_int_str.txt_fr
    LET int_str[id2].txt_ar = tmp_int_str.txt_ar
    LET int_str[id2].txt_it = tmp_int_str.txt_it
    LET int_str[id2].txt_ot = tmp_int_str.txt_ot

    #Import Debug Help
    IF local_debug = 1 OR global_debug = 1 THEN

      DISPLAY "### In int_str Loop ##### ########### process_string_import(" , file_name, ")" 
      DISPLAY "int_str[id2].txt_en:      ", int_str[id2].txt_en
      DISPLAY "int_str[id2].txt_sp:      ", int_str[id2].txt_sp
      DISPLAY "int_str[id2].txt_de:      ", int_str[id2].txt_de
      DISPLAY "int_str[id2].txt_fr:      ", int_str[id2].txt_fr
      DISPLAY "int_str[id2].txt_ar:      ", int_str[id2].txt_ar
      DISPLAY "int_str[id2].txt_it:      ", int_str[id2].txt_it
      DISPLAY "int_str[id2].txt_ot:      ", int_str[id2].txt_ot
    END IF

    LET id = id + 1
  END WHILE


  LET int_str_array_size = id - 1
  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### END of int_str file import. used array size = " , int_str_array_size, "  ##### ",file_name, " ###########"   
  END IF

  CALL fgl_channel_close("stream")

END FUNCTION



###########################################################
# FUNCTION get_string(id)
###########################################################
FUNCTION get_str(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 1000 THEN
    CALL fgl_winmessage("Internal 4GL Demo source code error","Invalid id in get_string(" ||id || ")", "error")
  END IF


  CASE language
    WHEN 1  -- english
      RETURN trim(int_str[id].txt_en)
    WHEN 2  -- spanish
      RETURN trim(int_str[id].txt_sp)
    WHEN 3  -- german
      RETURN trim(int_str[id].txt_de)
    WHEN 4  -- french
      RETURN trim(int_str[id].txt_fr)
    WHEN 5  -- arabic
      RETURN trim(int_str[id].txt_ar)
    WHEN 6  -- italian
      RETURN trim(int_str[id].txt_it)
    WHEN 7  -- other
      RETURN trim(int_str[id].txt_ot)

    OTHERWISE
      CALL fgl_winmessage("Internal 4GL Demo source code error","Invalid language in get_string()\nlanguage= " || language, "error")
  END CASE
END FUNCTION

###########################################################
# FUNCTION get_strm(id)
###########################################################
FUNCTION get_strm(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 200 THEN
    CALL fgl_winmessage("Internal 4GL Demo source code error","Invalid id in get_string(" ||id || ")", "error")
  END IF

  RETURN trim(mono_lang_str[id])

END FUNCTION


######################################################################################
# FUNCTION init_string()
######################################################################################
FUNCTION init_string()
  DEFINE iid SMALLINT

  # What was this for again ???
  FOR iid = 1 TO 5
    LET cust_picture[iid] = cust_rec[iid].cust_picture
  END FOR

END FUNCTION


###########################################################
# FUNCTION process_mono_lang_string_import(file_name)
###########################################################
FUNCTION process_mono_lang_string_import(file_name)

  #International strings
  DEFINE
    file_name, tempstr VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT,
    temp_ml_str 
      RECORD
        id SMALLINT,
        str VARCHAR(200)
      END RECORD

  LET local_debug = 0

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### start ##### ",file_name, " ########### FUNCTION process_mono_lang_string_import(file_name)(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",temp_ml_str.*)
    IF  temp_ml_str.id IS NOT NULL AND temp_ml_str.id != 0 THEN
      LET mono_lang_str[temp_ml_str.id] = temp_ml_str.str
    ELSE
      EXIT WHILE
    END IF

    IF local_debug = 1 OR global_debug = 1 THEN
      DISPLAY "temp_ml_str.id ", temp_ml_str.id
      DISPLAY "temp_ml_str.str ", temp_ml_str.str
      DISPLAY "mono_lang_str[temp_ml_str.id] ", mono_lang_str[temp_ml_str.id]
      DISPLAY get_strm(temp_ml_str.id)
    END IF

  END WHILE


  LET int_str_array_size = id - 1
  IF local_debug = 1 OR global_debug = 1 THEN
    DISPLAY "### END of FUNCTION process_mono_lang_string_import(file_name) file import. used array size = " , int_str_array_size, "  ##### ",file_name, " ###########"   
  END IF

  CALL fgl_channel_close("stream")


END FUNCTION

