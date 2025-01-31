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
#! Globals
############################################################
GLOBALS "gd_globals.4gl"


#########################################################################################################
#! MAIN
######################################################################################################### 
MAIN

  DEFER INTERRUPT

  OPTIONS
#    PROMPT LINE LAST,
    INPUT WRAP,
    HELP FILE "msg/gd_help.erm",
    HELP KEY F1,
    INSERT KEY F131,
    DELETE KEY F132,
    NEXT KEY F133,
    PREVIOUS KEY F134,
    ACCEPT KEY RETURN,
    ON CLOSE APPLICATION KEY F11
#    ,FORM LINE 2
#    , AUTOREFRESH 3





  #This is a gui client demo only
#  IF NOT fgl_fglgui() THEN
#    CALL fgl_winmessage("","This is a GUI Client Demo!\nRun the application with Phoenix or Chimera.","eror")
#  END IF
  #I don't know how the date ist defined in the target system and I'm not allowed to change it....
  # so, I simply define it for the GUI-Demo only in the environment
  CALL fgl_putenv("DBDATE=dmy4.")

  #initialize variables and publish global default toolbar icons
  CALL init_data()
  CALL publish_toolbar("global",0)

  # set help file '1' define in congiruation & language   HELP FILE "msg/cm_context_help.erm",
  CALL set_classic_help_file(1)

  #Draw a box and write the application name and version number in it AND in the title bar
  #	CALL fgl_drawbox(5,53,9,14)
  #DISPLAY get_strm(17) 
  #  AT 11,15 
  #  ATTRIBUTE(BLUE, BOLD) 
  CALL fgl_settitle(get_strm(17)) 

  #display the main menu 
  #CALL gd_main_menu()
  CALL color_display_to_attrib()	
END MAIN



##########################################################################
#! init_test_rec_1() function to initialize test record
########################################################################## 
FUNCTION init_color_fields()
  LET fc11 = "Black"
  LET fc12 = "Black-R"
  LET fc13 = "Black-D"
  LET fc14 = "Black-B"
  LET fcsa11 = "Black"
  LET fcsa12 = "Black-R"
  LET fcsa13 = "Black-D"
  LET fcsa14 = "Black-B"
  LET fc21 = "White"
  LET fc22 = "White-R"  
  LET fc23 = "White-D"  
  LET fc24 = "White-B"  
  LET fcsa21 = "White"  
  LET fcsa22 = "White-R"  
  LET fcsa23 = "White-D"  
  LET fcsa24 = "White-B"  
  LET fc31 = "Blue"
  LET fc32 = "Blue-R"
  LET fc33 = "Blue-D"
  LET fc34 = "Blue-B"
  LET fcsa31 = "Blue"
  LET fcsa32 = "Blue-R"
  LET fcsa33 = "Blue-D"
  LET fcsa34 = "Blue-B"
  LET fc41 = "Cyan"
  LET fc42 = "Cyan-R"
  LET fc43 = "Cyan-D"
  LET fc44 = "Cyan-B"
  LET fcsa41 = "Cyan"
  LET fcsa42 = "Cyan-R"
  LET fcsa43 = "Cyan-D"
  LET fcsa44 = "Cyan-B"
  LET fc51 = "Red"
  LET fc52 = "Red-R"
  LET fc53 = "Red-D"
  LET fc54 = "Red-B"
  LET fcsa51 = "Red"
  LET fcsa52 = "Red-R"
  LET fcsa53 = "Red-D"
  LET fcsa54 = "Red-B"
  LET fc61 = "Magenta"
  LET fc62 = "Magenta-R"
  LET fc63 = "Magenta-D"
  LET fc64 = "Magenta-B"
  LET fcsa61 = "Magenta"
  LET fcsa62 = "Magenta-R"
  LET fcsa63 = "Magenta-D"
  LET fcsa64 = "Magenta-B"
  LET fc71 = "Green"
  LET fc72 = "Green-R"
  LET fc73 = "Green-D"
  LET fc74 = "Green-B"
  LET fcsa71 = "Green"
  LET fcsa72 = "Green-R"
  LET fcsa73 = "Green-D"
  LET fcsa74 = "Green-B"
  LET fc81 = "Yellow"
  LET fc82 = "Yellow-R"
  LET fc83 = "Yellow-D"
  LET fc84 = "Yellow-B"
  LET fcsa81 = "Yellow"
  LET fcsa82 = "Yellow-R"
  LET fcsa83 = "Yellow-D"
  LET fcsa84   = "Yellow-B"
END FUNCTION



############################################################
#! FUNCTION col_array_init() - prepares the dummy text which is displayed to the fields
############################################################
FUNCTION col_array_init(col)
  DEFINE col char(15), i SMALLINT

  FOR i = 1 TO 5
    LET col_arr[i] = col CLIPPED, "-", trim(i)
  END FOR
  CALL set_count(5)

END FUNCTION
