#########################################################################################################
# Import function for contact data
#
# Created:
# 21.11.06 HH - V3 - dervived from string loader module
#
# Modification History:
# None
#########################################################################################################
############################################################
# Globals
############################################################
GLOBALS "gui_demo_globals.4gl"

###########################################################
# FUNCTION process_string_import(file_name)
# !Doesn't use in programm
###########################################################
FUNCTION process_data_import(file_name)

  #International Contact Detais -- as we have no database connected
  DEFINE
    file_name, tempstr VARCHAR(100),
    local_debug,id,id2,str_length SMALLINT


  LET local_debug = FALSE
  LET id = 1

  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  IF local_debug THEN
    DISPLAY "### start ##### ",file_name, " ########### process_data_import(" , file_name, ")"  
  END IF

  
######### read title #####################################################################
  WHILE fgl_channel_read("stream",cust_rec[id].*)

    #Import Debug Help
    IF local_debug THEN

      DISPLAY "### In int_str Loop ##### ########### process_string_import(" , file_name, ")" 
      DISPLAY "cust_rec[id].cust_title     ", cust_rec[id].cust_title 
      DISPLAY "cust_rec[id].cust_fname     ", cust_rec[id].cust_fname 
      DISPLAY "cust_rec[id].cust_lname     ", cust_rec[id].cust_lname 
      DISPLAY "cust_rec[id].cust_dob       ", cust_rec[id].cust_dob 
      DISPLAY "cust_rec[id].cust_email     ", cust_rec[id].cust_email 
      DISPLAY "cust_rec[id].cust_url       ", cust_rec[id].cust_url 

      DISPLAY "cust_rec[id].cust_address1   ", cust_rec[id].cust_address1 
      DISPLAY "cust_rec[id].cust_address2   ", cust_rec[id].cust_address2
      DISPLAY "cust_rec[id].cust_address3   ", cust_rec[id].cust_address3 
      DISPLAY "cust_rec[id].cust_post_code  ", cust_rec[id].cust_post_code             
      DISPLAY "cust_rec[id].cust_country   ", cust_rec[id].cust_country       

      DISPLAY "cust_rec[id].cust_re        ", cust_rec[id].cust_re 
      DISPLAY "cust_rec[id].cust_rp        ", cust_rec[id].cust_rp 
      DISPLAY "cust_rec[id].cust_rl        ", cust_rec[id].cust_rl 
      DISPLAY "cust_rec[id].cust_type      ", cust_rec[id].cust_type 
      DISPLAY "cust_rec[id].cust_memo      ", cust_rec[id].cust_memo
      DISPLAY "cust_rec[id].cust_picture   ", cust_rec[id].cust_picture


    END IF

    #Exit import if the data file has an empty line
    IF cust_rec[id].cust_id IS NULL THEN
      EXIT WHILE
    END IF

    LET id = id + 1

  END WHILE


  CALL fgl_channel_close("stream")

END FUNCTION

