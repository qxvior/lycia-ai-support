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
# GLOBAL Scope
############################################################
GLOBALS
  DEFINE col_arr ARRAY[5] OF CHAR(12)

  DEFINE 
    fcBlack,fcBlackRev,fcBlackDim,fcBlackBlink,fcsa11,fcsa12,fcsa13,fcsa14, 
    fcWhite,fcWhiteRev,fcWhiteDim,fcWhiteBlink,fcsa21,fcsa22,fcsa23,fcsa24,
    fc31,fcBlueRev,fcBlueDim,fcBlueBlink,fcsa31,fcsa32,fcsa33,fcsa34, 
    fcCyan,fcCyanRev,fcCyanDim,fcCyanBlink,fcsa41,fcsa42,fcsa43,fcsa44, 
    fcRed,fcRedRev,fcRedDim,fcRedBlink,fcsa51,fcsa52,fcsa53,fcsa54, 
    fcMagenta,fcMagentaRev,fcMagentaDim,fcMagentaBlink,fcsa61,fcsa62,fcsa63,fcsa64, 
    fcGreen,fcGreenRev,fcGreenDim,fcGreenBlink,fcsa71,fcsa72,fcsa73,fcsa74, 
    fcYellow,fcYellowRev,fcYellowDim,fcYellowBlink,fcsa81,fcsa82,fcsa83,fcsa84,  
    fcDefault,fcDefaultRev,fcDefaultDim,fcDefaultBlink,fcScrDefault,fcScrDefaultRev,fcScrDefaultDim,fcScrDefaultBlink,      
    fc15,fc16,fc17,fc18,fc19,fc20,
    fcsa15,fcsa16,fcsa17,fcsa18,fcsa19,fcsa20, 
    fc35,fc36,fc37,fc38,fc39,fc40,
    fcsa35,fcsa36,fcsa37,fcsa38,fcsa39,fcsa40,
    fc55,fc56,fc57,fc58,fc59,fc60,
    fcsa55,fcsa56,fcsa57,fcsa58,fcsa59,fcsa60

  CHAR(10)
END GLOBALS

#########################################################################################################
# MAIN
######################################################################################################### 
MAIN

  DEFER INTERRUPT

  OPTIONS
    INPUT WRAP,
    ACCEPT KEY RETURN,
    ON CLOSE APPLICATION KEY F11

	CALL hideNavigation()
  CALL color_display_to_attrib()	
END MAIN



##########################################################################
# init_test_rec_1() function to initialize test record
########################################################################## 
FUNCTION init_color_fields()
  LET fcBlack = "Black"
  LET fcBlackRev = "Black-R"
  LET fcBlackDim = "Black-D"
  LET fcBlackBlink = "Black-B"
  LET fcsa11 = "Black"
  LET fcsa12 = "Black-R"
  LET fcsa13 = "Black-D"
  LET fcsa14 = "Black-B"
  LET fcWhite = "White"
  LET fcWhiteRev = "White-R"  
  LET fcWhiteDim = "White-D"  
  LET fcWhiteBlink = "White-B"  
  LET fcsa21 = "White"  
  LET fcsa22 = "White-R"  
  LET fcsa23 = "White-D"  
  LET fcsa24 = "White-B"  
  LET fc31 = "Blue"
  LET fcBlueRev = "Blue-R"
  LET fcBlueDim = "Blue-D"
  LET fcBlueBlink = "Blue-B"
  LET fcsa31 = "Blue"
  LET fcsa32 = "Blue-R"
  LET fcsa33 = "Blue-D"
  LET fcsa34 = "Blue-B"
  LET fcCyan = "Cyan"
  LET fcCyanRev = "Cyan-R"
  LET fcCyanDim = "Cyan-D"
  LET fcCyanBlink = "Cyan-B"
  LET fcsa41 = "Cyan"
  LET fcsa42 = "Cyan-R"
  LET fcsa43 = "Cyan-D"
  LET fcsa44 = "Cyan-B"
  LET fcRed = "Red"
  LET fcRedRev = "Red-R"
  LET fcRedDim = "Red-D"
  LET fcRedBlink = "Red-B"
  LET fcsa51 = "Red"
  LET fcsa52 = "Red-R"
  LET fcsa53 = "Red-D"
  LET fcsa54 = "Red-B"
  LET fcMagenta = "Magenta"
  LET fcMagentaRev = "Magenta-R"
  LET fcMagentaDim = "Magenta-D"
  LET fcMagentaBlink = "Magenta-B"
  LET fcsa61 = "Magenta"
  LET fcsa62 = "Magenta-R"
  LET fcsa63 = "Magenta-D"
  LET fcsa64 = "Magenta-B"
  LET fcGreen = "Green"
  LET fcGreenRev = "Green-R"
  LET fcGreenDim = "Green-D"
  LET fcGreenBlink = "Green-B"
  LET fcsa71 = "Green"
  LET fcsa72 = "Green-R"
  LET fcsa73 = "Green-D"
  LET fcsa74 = "Green-B"
  LET fcYellow = "Yellow"
  LET fcYellowRev = "Yellow-R"
  LET fcYellowDim = "Yellow-D"
  LET fcYellowBlink = "Yellow-B"
  LET fcsa81 = "Yellow"
  LET fcsa82 = "Yellow-R"
  LET fcsa83 = "Yellow-D"
  LET fcsa84   = "Yellow-B"
  LET fcDefault = "Default"
  LET fcDefaultRev = "D-Reversed"
  LET fcDefaultDim = "D-Dim"
  LET fcDefaultBlink = "D-Blink"
  LET fcScrDefault = "Default"
  LET fcScrDefaultRev = "D-Reversed"
  LET fcScrDefaultDim = "D-Dim"
  LET fcScrDefaultBlink = "D-Blink"
  
     
  
END FUNCTION



############################################################
# FUNCTION col_array_init() - prepares the dummy text which is displayed to the fields
############################################################
FUNCTION col_array_init(col)
  DEFINE col char(15), i SMALLINT

  FOR i = 1 TO 5
    LET col_arr[i] = col CLIPPED, "-", trim(i)
  END FOR
  CALL set_count(5)

END FUNCTION
