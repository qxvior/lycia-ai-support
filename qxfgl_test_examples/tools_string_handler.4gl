#########################################################################################################
# String intialisation and handling for international support
#
# Created:
# 10.10.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#
#
#
# FUNCTION                                        DESCRIPTION                                                RETURN
# process_string_import(file_name)                Import string file                                         NONE
# get_str(id)                                     Get program related multi language string                  trim(tl_multi_lingual_prog_str[ID].txt_en)
# get_string_tool(id)                             Get lib-tool related multi language string                 trim(tl_multi_lingual_tool_str[ID].txt_en)
# get_strm(id)                                    Return mono language string from id                        trim(tl_mono_lang_prog_str[id]) 
# get_strm_tool(id)                               Return mono language string (for tools functions) from id  trim(tl_mono_lang_prog_str[id]) 
# process_mono_lang_string_import(file_name)      Process mono language string                               NONE
#########################################################################################################


############################################################
# Globals
############################################################
GLOBALS "tools_globals.4gl"


###########################################################
# FUNCTION process_string_import(file_name)
#
# Import string file
#
# RETURN NONE
###########################################################
FUNCTION process_string_import(category,file_name)

  #International strings
  DEFINE
    file_name, tempstr            VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT,
    category                      SMALLINT

  LET local_debug = FALSE
  LET id = 1

  IF NOT fgl_test("e",file_name) THEN
    LET tl_err_msg = "Following string import file does not exist: ", file_name, "\nApplication needs closing down"
    CALL fgl_winmessage("File Error in process_string_import()" ,tl_err_msg, "error")
    EXIT PROGRAM
  END IF

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "### start ##### ",file_name, " ########### process_string_import(" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",tl_tmp_int_str.*)
    IF  tl_tmp_int_str.id IS NOT NULL AND tl_tmp_int_str.id != 0 THEN
      LET id2 =  tl_tmp_int_str.id
    ELSE
      EXIT WHILE
    END IF

    IF local_debug THEN
      DISPLAY "id2 = ", id2
      DISPLAY "tl_tmp_int_str.id ", tl_tmp_int_str.id
    END IF

    CASE category
      WHEN 0  -- tools strings
        LET tl_multi_lingual_tool_str[id2].txt_en = tl_tmp_int_str.txt_en
        LET tl_multi_lingual_tool_str[id2].txt_sp = tl_tmp_int_str.txt_sp
        LET tl_multi_lingual_tool_str[id2].txt_de = tl_tmp_int_str.txt_de
        LET tl_multi_lingual_tool_str[id2].txt_fr = tl_tmp_int_str.txt_fr
        LET tl_multi_lingual_tool_str[id2].txt_ar = tl_tmp_int_str.txt_ar
        LET tl_multi_lingual_tool_str[id2].txt_it = tl_tmp_int_str.txt_it
        LET tl_multi_lingual_tool_str[id2].txt_ot = tl_tmp_int_str.txt_ot

        #Import Debug Help
        IF local_debug THEN

          DISPLAY "### In multi_lingual_tool_str Loop ##### ########### process_string_import(" , file_name, ")" 
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_en:      ", tl_multi_lingual_tool_str[id2].txt_en
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_sp:      ", tl_multi_lingual_tool_str[id2].txt_sp
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_de:      ", tl_multi_lingual_tool_str[id2].txt_de
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_fr:      ", tl_multi_lingual_tool_str[id2].txt_fr
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_ar:      ", tl_multi_lingual_tool_str[id2].txt_ar
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_it:      ", tl_multi_lingual_tool_str[id2].txt_it
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str[id2].txt_ot:      ", tl_multi_lingual_tool_str[id2].txt_ot
        END IF

      WHEN 1  --  Program/application related strings
        LET tl_multi_lingual_prog_str[id2].txt_en = tl_tmp_int_str.txt_en
        LET tl_multi_lingual_prog_str[id2].txt_sp = tl_tmp_int_str.txt_sp
        LET tl_multi_lingual_prog_str[id2].txt_de = tl_tmp_int_str.txt_de
        LET tl_multi_lingual_prog_str[id2].txt_fr = tl_tmp_int_str.txt_fr
        LET tl_multi_lingual_prog_str[id2].txt_ar = tl_tmp_int_str.txt_ar
        LET tl_multi_lingual_prog_str[id2].txt_it = tl_tmp_int_str.txt_it
        LET tl_multi_lingual_prog_str[id2].txt_ot = tl_tmp_int_str.txt_ot

        #Import Debug Help
        IF local_debug THEN

          DISPLAY "### In multi_lingual_tool_str Loop ##### ########### process_string_import(" , file_name, ")" 
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_en:      ", tl_multi_lingual_prog_str[id2].txt_en
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_sp:      ", tl_multi_lingual_prog_str[id2].txt_sp
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_de:      ", tl_multi_lingual_prog_str[id2].txt_de
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_fr:      ", tl_multi_lingual_prog_str[id2].txt_fr
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_ar:      ", tl_multi_lingual_prog_str[id2].txt_ar
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_it:      ", tl_multi_lingual_prog_str[id2].txt_it
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str[id2].txt_ot:      ", tl_multi_lingual_prog_str[id2].txt_ot
        END IF

      OTHERWISE
        LET tl_err_msg = get_str_tool(30) CLIPPED ," in process_string_import()\n", get_str_tool(39) CLIPPED, " category=", category
        CALL fgl_winmessage( get_str_tool(30), tl_err_msg,"error")

    END CASE

    LET id = id + 1
  END WHILE

  CASE category
    WHEN 0  -- tools strings
      LET tl_multi_lingual_tool_str_array_size = id - 1

      IF local_debug THEN
          DISPLAY "process_string_import() - tl_multi_lingual_tool_str_array_size=", tl_multi_lingual_tool_str_array_size
      END IF

      #check if file is empty or does not exist
      IF tl_multi_lingual_tool_str_array_size < 1 THEN  --file must be empty for not exist
        LET tl_err_msg = get_str_tool(726) CLIPPED, file_name
        CALL fgl_winmessage(get_str_tool(30) ,tl_err_msg,"error")
      END IF


    WHEN 1  -- program/application related strings
      LET tl_multi_lingual_prog_str_array_size = id - 1

      IF local_debug THEN
          DISPLAY "process_string_import() - tl_multi_lingual_prog_str_array_size=", tl_multi_lingual_prog_str_array_size
      END IF

      IF tl_multi_lingual_prog_str_array_size < 1 THEN  --file must be empty for not exist
        LET tl_err_msg = get_str_tool(726) CLIPPED, file_name
        CALL fgl_winmessage(get_str_tool(30),tl_err_msg,"error")
      END IF

  END CASE


  IF local_debug THEN
    DISPLAY "### END of int_str file import - File Name: ", file_name, " Category= ", category   
  END IF

  CALL fgl_channel_close("stream")

END FUNCTION



###########################################################
# FUNCTION get_str(id)
#
# Get program related multi language string
#
# RETURN trim(tl_multi_lingual_prog_str[ID].txt_en)
###########################################################
FUNCTION get_str(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 2500 THEN
    LET tl_err_msg = get_str_tool(20) CLIPPED, " id in get_string(" ,id , ")"
    CALL fgl_winmessage( get_str_tool(30) ,tl_err_msg, "error")
  END IF


  CASE tl_settings.languageId
    WHEN 1  -- english
      RETURN trim(tl_multi_lingual_prog_str[id].txt_en)
    WHEN 2  -- spanish
      RETURN trim(tl_multi_lingual_prog_str[id].txt_sp)
    WHEN 3  -- german
      RETURN trim(tl_multi_lingual_prog_str[id].txt_de)
    WHEN 4  -- french
      RETURN trim(tl_multi_lingual_prog_str[id].txt_fr)
    WHEN 5  -- arabic
      RETURN trim(tl_multi_lingual_prog_str[id].txt_ar)
    WHEN 6  -- italian
      RETURN trim(tl_multi_lingual_prog_str[id].txt_it)
    WHEN 7  -- other
      RETURN trim(tl_multi_lingual_prog_str[id].txt_ot)

    OTHERWISE
      LET tl_err_msg = get_str_tool(804) CLIPPED, " in get_string()\nlanguage= " , tl_settings.languageId
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
      RETURN "Error - Wrong language specified"
  END CASE
END FUNCTION


###########################################################
# FUNCTION get_string_tool(id)
#
# Get lib-tool related multi language string
#
# RETURN trim(tl_multi_lingual_tool_str[ID].txt_en)
###########################################################
FUNCTION get_str_tool(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 1000 THEN
    LET tl_err_msg = get_str_tool(801) CLIPPED, " in get_string(" ,id , ")"
    CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END IF


  CASE tl_settings.languageId
    WHEN 1  -- english
      RETURN trim(tl_multi_lingual_tool_str[id].txt_en)
    WHEN 2  -- spanish
      RETURN trim(tl_multi_lingual_tool_str[id].txt_sp)
    WHEN 3  -- german
      RETURN trim(tl_multi_lingual_tool_str[id].txt_de)
    WHEN 4  -- french
      RETURN trim(tl_multi_lingual_tool_str[id].txt_fr)
    WHEN 5  -- arabic
      RETURN trim(tl_multi_lingual_tool_str[id].txt_ar)
    WHEN 6  -- italian
      RETURN trim(tl_multi_lingual_tool_str[id].txt_it)
    WHEN 7  -- other
      RETURN trim(tl_multi_lingual_tool_str[id].txt_ot)

    OTHERWISE
      LET tl_err_msg = get_str_tool(804) CLIPPED, " in get_string()\nlanguage= " , tl_settings.languageId
      CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
      RETURN "Error - Wrong language specified"
  END CASE
END FUNCTION

###########################################################
# FUNCTION get_strm(id)
#
# Return mono language string from id
#
# RETURN trim(tl_mono_lang_tool_str[id]) 
###########################################################
FUNCTION get_strm(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 200 THEN
    LET tl_err_msg = get_str_tool(20) CLIPPED, " id in get_strm(", id, ")"
    CALL fgl_winmessage(get_str_tool(30),tl_err_msg, "error")
  END IF

  RETURN trim(tl_mono_lang_prog_str[id])

END FUNCTION


###########################################################
# FUNCTION get_strm_tool(id)
#
# Return mono language string (for tools functions) from id
#
# RETURN trim(tl_mono_lang_prog_str[id]) 
###########################################################
FUNCTION get_strm_tool(id)
  DEFINE id SMALLINT

  IF id <1 OR id > 200 THEN
    LET tl_err_msg = get_str_tool(20) CLIPPED, " id in get_strm_tool(", id, ")"
    CALL fgl_winmessage(get_str_tool(30) CLIPPED, tl_err_msg, "error")
  END IF

  RETURN trim(tl_mono_lang_tool_str[id])

END FUNCTION

{
######################################################################################
# FUNCTION init_string()
######################################################################################
FUNCTION init_string()
  DEFINE iid SMALLINT
  CALL fgl_winmessage("Error init_string()","Can't remember what this function is for or if it is even used","error")

  # What was this for again ???
  FOR iid = 1 TO 5
    LET cust_picture[iid] = cust_rec[iid].cust_picture
  END FOR

END FUNCTION
}

###########################################################
# FUNCTION process_mono_lang_string_import(file_name)
#
# Process mono language string
#
# RETURN NONE
###########################################################
FUNCTION process_mono_lang_string_import(category,file_name)
  DEFINE
    file_name, tempstr            VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT,
    category                      SMALLINT,
    temp_ml_str 
      RECORD
        id SMALLINT,
        str VARCHAR(200)
      END RECORD

  LET local_debug = FALSE

  IF NOT fgl_test("e",file_name) THEN
    LET tl_err_msg = "Following string import file does not exist: ", file_name, "\nApplication needs closing down"
    CALL fgl_winmessage("File Error in process_mono_lang_string_import()",tl_err_msg, "error")
    EXIT PROGRAM
  END IF

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "### start ##### ",file_name, " ########### FUNCTION process_mono_lang_string_import(category=",category, ",file_name=" , file_name, ")"  
  END IF

  WHILE fgl_channel_read("stream",temp_ml_str.*)
    IF  temp_ml_str.id IS NOT NULL AND temp_ml_str.id != 0 THEN
      
      CASE category
        WHEN 0 -- tools related mono string (single language)
          LET tl_mono_lang_tool_str[temp_ml_str.id] = temp_ml_str.str
        WHEN 1 -- Program/Applicatoin related mono string (single language)
          LET tl_mono_lang_prog_str[temp_ml_str.id] = temp_ml_str.str

        OTHERWISE
          LET tl_err_msg = get_str_tool(30) CLIPPED," in process_mono_lang_string_import()\n", get_str_tool(39) CLIPPED, " category=", category
          CALL fgl_winmessage(get_str_tool(30) CLIPPED, tl_err_msg,"error")
      END CASE

    ELSE
      EXIT WHILE
    END IF

    #form here on just debug stuff
    IF local_debug THEN
      DISPLAY "process_mono_lang_string_import() - temp_ml_str.id ", temp_ml_str.id
      DISPLAY "process_mono_lang_string_import() - temp_ml_str.str ", temp_ml_str.str


      CASE category
        WHEN 0 -- tools related mono string (single language)
          LET tl_mono_lang_tool_str[temp_ml_str.id] = temp_ml_str.str
          DISPLAY "process_mono_lang_string_import() - mono_lang_tool_str[temp_ml_str.id] ", tl_mono_lang_tool_str[temp_ml_str.id]
          DISPLAY get_strm_tool(temp_ml_str.id)
        WHEN 1 -- Program/Applicatoin related mono string (single language)
          LET tl_mono_lang_prog_str[temp_ml_str.id] = temp_ml_str.str
          LET tl_mono_lang_prog_str[temp_ml_str.id] = temp_ml_str.str
          DISPLAY "process_mono_lang_string_import() - mono_lang_prog_str[temp_ml_str.id] ", tl_mono_lang_prog_str[temp_ml_str.id]
          DISPLAY get_strm(temp_ml_str.id)
      END CASE


    END IF

  END WHILE

  CASE category
    WHEN 0 -- tools related mono string (single language)
      LET tl_mono_lang_prog_str_array_size = id - 1
      IF local_debug THEN
        DISPLAY "process_mono_lang_string_import() - mono_lang_prog_str_array_size = ", tl_mono_lang_tool_str_array_size
      END IF
    WHEN 1 -- Program/Applicatoin related mono string (single language)
      LET tl_mono_lang_tool_str_array_size = id - 1
      IF local_debug THEN
        DISPLAY "process_mono_lang_string_import() - mono_lang_prog_str[temp_ml_str.id] ", tl_mono_lang_prog_str_array_size
      END IF
  END CASE


  IF local_debug THEN
    DISPLAY "### END of FUNCTION process_mono_lang_string_import(file_name) file import. File=",file_name, " ###########"   
  END IF

  CALL fgl_channel_close("stream")


END FUNCTION

