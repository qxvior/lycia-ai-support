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


FUNCTION import_data(file_name)
  DEFINE 
    file_name VARCHAR(200),
    report_data CHAR(32000),
    id SMALLINT

  LET file_name = "report_data.unl" --trim(server_client_user_temp_directory) || "/print_html.html"


  CALL fgl_channel_open_file("stream",file_name, "r")
  CALL fgl_channel_set_delimiter("stream","|")

  #IF local_debug = 1 OR global_debug = 1 THEN
  #  DISPLAY "### start ##### ",file_name, " ########### process_toolbar_init(" , file_name, ")"  
  #END IF

  LET id = 1
  WHILE fgl_channel_read("stream",report_rec[id].*) 
    LET id = id + 1


  DISPLAY report_rec[id].quantity
  DISPLAY report_rec[id].item_ID
  DISPLAY report_rec[id].item_name
  DISPLAY report_rec[id].author
  DISPLAY report_rec[id].item_desc
  DISPLAY report_rec[id].s_price
  DISPLAY report_rec[id].vat
  DISPLAY report_rec[id].url

  END WHILE

{
  CALL fgl_channel_open_file("stream", file_name, "r")  --open the input html file and read it
  CALL fgl_channel_read("stream",report_data)
  CALL fgl_channel_close("stream")

  DEFINE report_rec ARRAY[20] OF RECORD
    quantity SMALLINT, 
    item_ID VARCHAR(20),
    item_name VARCHAR(100),
    author VARCHAR(100),
    item_desc CHAR(1000),
    s_price MONEY,
    vat MONEY,
    url VARCHAR(220)
  END RECORD

}

END FUNCTION

