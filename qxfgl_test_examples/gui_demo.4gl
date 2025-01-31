#########################################################################################################
# GUI Demo Application to demonstrate GUI Clients
#
# Modification History:
# 10.04.04 DS/HH - Created in Southampton
# 12.02.05 HH - V2 - Added custom script toolbar, and used all widgets - second color demo window
# 25.04.05 HH - V2 - Use window background property for background image (not user control)
# 26.04.05 HH - V2 - add memo box and few more script options, sub-demos are now displayed in their own windowed windows
# 15.09.06 HH - V3 - add new grid control and uses the export features + column header manipulation
# 16.09.06 HH - V3 - Dynamic Toolbar and context menu - New
# 17.09.06 HH - V3 - HTML-Blob view with auto generated HTML
# 18.09.06 HH - V3 - 3rd color-attributes demo window - one detailed test for each color
# 08.10.06 HH - V3 - Importing toolbar definition from a file
# 09.10.06 HH - V3 - Adding html help
# 10.10.06 HH - V3 - Re-designing forms to make their context fully dynamic (controlled in the 4gl code) and adding some widgets
# 19.10.06 HH - V3 - Created seperate 4gl modules for settings, initialisation, toolbar and html help file management
# 01.12.06 HH - V3 - Added Printing and E-Mail Support
#########################################################################################################

############################################################
# Globals
############################################################
GLOBALS "gui_demo_globals.4gl"

############################################################
# Module Scope globals
############################################################
  DEFINE
    w_name VARCHAR(20),
    f_name VARCHAR(40)
    
	DEFINE mdRecId SMALLINT
#########################################################################################################
# MAIN
######################################################################################################### 
MAIN
	CALL ui_init()
	
  DEFER INTERRUPT

  OPTIONS
    INPUT WRAP,
    #HELP FILE "msg/gd_help.erm",
    HELP KEY F1,
    ACCEPT KEY RETURN,
    ON CLOSE APPLICATION KEY F11

  CALL fgl_putenv("DBDATE=dmy4.")

  #initialize variables and publish global default toolbar icons
  CALL init_data()
  CALL publish_toolbar("global",0)

  CALL set_classic_help_file(1)

  CALL fgl_settitle(get_strm(17)) 
	CALL contact_demo(NULL)
END MAIN

