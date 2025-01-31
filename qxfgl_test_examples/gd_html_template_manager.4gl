#########################################################################################################
# Some simple functions to import a base html file and replace special tags
# with variable contents
#
# Created:
# 10.10.06 HH - V3 - Extracted from Guidemo V3 module gd_guidemo.4gl
#
# Modification History:
# None
#########################################################################################################
##########################################################################################
# GLOBALS
##########################################################################################
GLOBALS

  DEFINE
    hm_s ARRAY[50] OF VARCHAR(50),
    hm_n ARRAY[9] OF VARCHAR(250),
    hm_l ARRAY[9] OF CHAR(5000),
    hm_i ARRAY[9] OF VARCHAR(200)

END GLOBALS


##########################################################################################
# FUNCTION assign_macro_data(arg_str)
##########################################################################################
FUNCTION assign_macro_data(arg_str)
  DEFINE
    arg_str CHAR(32000),
    i SMALLINT,
    var_name VARCHAR(20),
    var_value CHAR(5000),
    local_debug SMALLINT

  LET local_debug = FALSE

  IF local_debug = 1  THEN
    DISPLAY "********************** in assign_macro_data() **************"
    DISPLAY arg_str
  END IF

  LET i = 1

  WHILE TRUE
    LET var_name = get_token(arg_str,",;",i)

    LET var_value = get_token(arg_str,",;",i+1)

  IF local_debug = 1  THEN
    DISPLAY "var_name ", var_name
    DISPLAY "var_value ", var_value
    DISPLAY "between - assign_macro_data - i= ", i, " var_name= ", var_name, " var_value= ", var_value 
  END IF

    IF var_name IS NULL THEN
      EXIT WHILE
    ELSE
      CALL assign_macro_variable(var_name,var_value)

      IF local_debug = 1 THEN
        DISPLAY "assign_macro_data - i= ", i, " var_name= ", var_name, " var_value= ", var_value 
      END IF

    END IF

    LET i = i + 2
  END WHILE


END FUNCTION


##########################################################################################
# FUNCTION append_arg_str(arg_str, val1,val2)
##########################################################################################
FUNCTION append_arg_str(arg_str, val1,val2)
  DEFINE 
    arg_str CHAR(30000),
    delimiter_symbol CHAR(2),
    val1 VARCHAR (50),
    val2 CHAR(10000),
    local_debug SMALLINT

  LET local_debug = 0

  IF local_debug = 1 THEN
    DISPLAY "append_arg_str - arg_str= ", arg_str
    DISPLAY "append... val1= ", val1, " val2= ", val2
  END IF

  LET delimiter_symbol = ",;"
  
  IF length(arg_str) > 0 THEN
    LET arg_str = arg_str CLIPPED, delimiter_symbol CLIPPED, val1 CLIPPED, delimiter_symbol CLIPPED, val2,delimiter_symbol  CLIPPED 
  ELSE
    LET arg_str = val1 CLIPPED, delimiter_symbol CLIPPED, val2,delimiter_symbol  CLIPPED 
  END IF

  RETURN arg_str

END FUNCTION



##########################################################################################
# FUNCTION get_token(p_string, p_fs, p_idx) )
##########################################################################################
FUNCTION get_token(p_string, p_fs, p_idx) 
  DEFINE 
    p_string CHAR(5000),
    p_fs CHAR(2),
    p_idx INTEGER,
    l_start, l_end INTEGER,
    i, j INTEGER,
    l_idx INTEGER,
    l_len INTEGER,
    rv CHAR(1024),
    local_debug SMALLINT

  LET l_start = 1
  LET l_end = 1
  LET l_idx = 1
  LET l_len = LENGTH(p_string)

  FOR i = 1 TO l_len
    IF p_string[i,i+1] = p_fs THEN
      # now we need to find the end of this token
      LET l_end = i - 1
      IF l_idx = p_idx THEN
        RETURN p_string[l_start, l_end]      
      END IF

      LET i = i+1
      LET l_idx = l_idx + 1
      LET l_start = i + 1
    END IF

    IF local_debug = 1  THEN
      DISPLAY "token " ,i, " - length", l_len, " - " ,p_string[l_start, l_end]  
    END IF
  END FOR

  LET l_end = l_len
  IF l_idx = p_idx THEN
    RETURN p_string[l_start, l_end]      
  ELSE
    RETURN NULL
  END IF
END FUNCTION

##########################################################################################
# FUNCTION assign_macro_variable(var_name,var_value)
##########################################################################################
FUNCTION assign_macro_variable(var_name,var_value)
  DEFINE 
    var_name VARCHAR(20),
    var_value, var_value_temp CHAR(5000),
    local_debug, i, i2 SMALLINT

  LET local_debug = 0

  IF local_debug = 1 THEN
    DISPLAY "**** assign: var_name= ", var_name, " var_value = ", var_value
  END IF


### add <br> for \n character ##############
### Replace CR/LF with <br> ##############

  IF var_name[4] = "l" THEN   --we are looking for CR/LF only in Long variable data type (real text blocks)
    #CALL fgl_winmessage("long","long","info")

    LET i2 = 1
    FOR i = 1 TO length(var_value)
  
      IF var_value[i] = "\n" THEN
        #CALL fgl_winmessage("br","br","info")
        LET var_value_temp[i2,i2+4] = "<br>"
        LET i2 = i2 + 4
      ELSE
        
        LET var_value_temp[i2] = var_value[i]
        LET i2 = i2 +1
      END IF

    END FOR
    LET var_value = var_value_temp
  END IF
## END OF Replace CR/LF with <br> ##



  CASE var_name
    WHEN "hm_s01"
      LET hm_s[01] = var_value
    WHEN "hm_s02"
      LET hm_s[02] = var_value
    WHEN "hm_s03"
      LET hm_s[03] = var_value
    WHEN "hm_s04"
      LET hm_s[04] = var_value
    WHEN "hm_s05"
      LET hm_s[05] = var_value
    WHEN "hm_s06"
      LET hm_s[06] = var_value
    WHEN "hm_s07"
      LET hm_s[07] = var_value
    WHEN "hm_s08"
      LET hm_s[08] = var_value
    WHEN "hm_s09"
      LET hm_s[09] = var_value
    WHEN "hm_s10"
      LET hm_s[10] = var_value
    WHEN "hm_s11"
      LET hm_s[11] = var_value
    WHEN "hm_s12"
      LET hm_s[12] = var_value
    WHEN "hm_s13"
      LET hm_s[13] = var_value
    WHEN "hm_s14"
      LET hm_s[14] = var_value
    WHEN "hm_s15"
      LET hm_s[15] = var_value
    WHEN "hm_s16"
      LET hm_s[16] = var_value
    WHEN "hm_s17"
      LET hm_s[17] = var_value
    WHEN "hm_s18"
      LET hm_s[18] = var_value
    WHEN "hm_s19"
      LET hm_s[19] = var_value
    WHEN "hm_s20"
      LET hm_s[20] = var_value
    WHEN "hm_s21"
      LET hm_s[21] = var_value

    WHEN "hm_n01"
      LET hm_n[01] = var_value
    WHEN "hm_n02"
      LET hm_n[02] = var_value
    WHEN "hm_n03"
      LET hm_n[03] = var_value
    WHEN "hm_n04"
      LET hm_n[04] = var_value
    WHEN "hm_n05"
      LET hm_n[05] = var_value
    WHEN "hm_n06"
      LET hm_n[06] = var_value
    WHEN "hm_n07"
      LET hm_n[07] = var_value
    WHEN "hm_n08"
      LET hm_n[08] = var_value
    WHEN "hm_n09"
      LET hm_n[09] = var_value
    WHEN "hm_n10"
      LET hm_n[10] = var_value

    WHEN "hm_l01"
      LET hm_l[01] = replace_CRLF_html(var_value)
    WHEN "hm_l02"
      LET hm_l[02] =  replace_CRLF_html(var_value)
    WHEN "hm_l03"
      LET hm_l[03] =  replace_CRLF_html(var_value)
    WHEN "hm_l04"
      LET hm_l[04] =  replace_CRLF_html(var_value)
    WHEN "hm_l05"
      LET hm_l[05] =  replace_CRLF_html(var_value)
    WHEN "hm_l06"
      LET hm_l[06] =  replace_CRLF_html(var_value)
    WHEN "hm_l07"
      LET hm_l[07] =  replace_CRLF_html(var_value)
    WHEN "hm_l08"
      LET hm_l[08] =  replace_CRLF_html(var_value)
    WHEN "hm_l09"
      LET hm_l[09] =  replace_CRLF_html(var_value)
    WHEN "hm_l10"
      LET hm_l[10] =  replace_CRLF_html(var_value)

    WHEN "hm_i01"
      LET hm_i[01] = var_value
    WHEN "hm_i02"
      LET hm_i[02] = var_value
    WHEN "hm_i03"
      LET hm_i[03] = var_value
    WHEN "hm_i04"
      LET hm_i[04] = var_value
    WHEN "hm_i05"
      LET hm_i[05] = var_value
    WHEN "hm_i06"
      LET hm_i[06] = var_value
    WHEN "hm_i07"
      LET hm_i[07] = var_value
    WHEN "hm_i08"
      LET hm_i[08] = var_value
    WHEN "hm_i09"
      LET hm_i[09] = var_value
    WHEN "hm_i10"
      LET hm_i[10] = var_value

  OTHERWISE
    CALL fgl_winmessage(get_str(30), get_str(31) || " assign_macro_variable(\n" || var_name || "\n" || var_value,"error")

  END CASE


END FUNCTION





##########################################################################################
# FUNCTION process_html_string(html_text_in)
##########################################################################################
FUNCTION process_html_string(html_text_in)
  DEFINE
    ci,co,ca, token_id, macrolength, file_length SMALLINT,
    html_text_in CHAR(5000),
    token CHAR(9),   -- token/macro...
    token_type CHAR,  --data type indicator for the token
    temp_str_s VARCHAR(50),
    temp_str_n VARCHAR(250),
    temp_str_l CHAR(5000),
    temp_str_i VARCHAR(200),
    html_return CHAR(5000)

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
          LET temp_str_s = hm_s[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(hm_s[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_return[co] = temp_str_s[ca]
            LET co = co + 1       
          END FOR

        WHEN 'n'   -- normal/short
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_n = hm_n[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(hm_n[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_return[co] = temp_str_n[ca]
            LET co = co + 1       
          END FOR

        WHEN 'l'  --long
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_l = hm_l[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(hm_l[token_id])
          #CALL fgl_winmessage("length",macrolength,"info")
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_return[co] = temp_str_l[ca]
            LET co = co + 1       
          END FOR

        WHEN 'i'  --image
          LET token_id = token[7]   --retrieve the token id - this is the array index of the macro values
          LET temp_str_i = hm_i[token_id]  -- assign the macro value to a temp string
          LET macrolength = length(hm_i[token_id])
          LET ci = ci + 8            -- skip the token length <@qx99@>

          FOR ca = 1 TO macrolength  -- append each byte from the macro value to the output string
            LET html_return[co] = temp_str_i[ca]
            LET co = co + 1       
          END FOR

        OTHERWISE
          CALL fgl_winmessage(get_str(30) || " - Html Template", get_str(32) || " create_print_html() " || token_type, "error")

      END CASE
    ELSE
      LET html_return[co] = html_text_in[ci]
      LET co = co + 1

    END IF
    
  END FOR

  RETURN html_return

END FUNCTION

