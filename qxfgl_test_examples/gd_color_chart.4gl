#########################################################################################################
# Color Chart Demo
#
# Color Demo - Menu Item 1
#
# Modification History:
# 29.11.06 HH - V3 - Extracted from gd_color.4gl
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

#########################################################################
# FUNCTION color_chart_demo()
#!Display Color Chart Demo
#########################################################################

FUNCTION color_chart_demo()
  DEFINE 
    inp CHAR(1),
    loopState SMALLINT

  OPTIONS
    FORM LINE 1

  CALL fgl_window_open("w_color_chart",1,1,get_form_path("gd_f_color_chart_2_2"),FALSE) 
  DISPLAY get_str(831) TO lbTitle
  CALL fgl_settitle(get_str(830) || " - " || get_str(831))
  CALL display_rgb_values1() 

  LET loopState = 1
  WHILE loopState = 1
    PROMPT "" FOR CHAR inp HELP 1
      BEFORE PROMPT
        CALL publish_toolbar("gd_col_1",0)
			CALL ui.Interface.refresh()
      ON KEY(F11)
        LET loopState = 0
      ON ACTION "actExitModule"
        LET loopState = 0
      AFTER PROMPT
        CALL publish_toolbar("gd_col_1",1)
    END PROMPT
  END WHILE

  CALL fgl_window_close("w_color_chart")


  OPTIONS
    FORM LINE 2

END FUNCTION


############################################################
# FUNCTION display_rgb_values()
#
#! Belongs to color chart demo
############################################################
FUNCTION display_rgb_values1()

  
  DISPLAY "Black" TO fp00
  DISPLAY "White" TO fp01
  DISPLAY "Blue" TO fp02
  DISPLAY "LightBlue" TO fp03 
  DISPLAY "Cyan" TO fp04
  DISPLAY "LightCyan" TO fp05   
  DISPLAY "Magenta" TO fp06
  DISPLAY "LightMagenta" TO fp07
  DISPLAY "Red" TO fp08
  DISPLAY "lightRed" TO fp09
  DISPLAY "Yellow" TO fp10
  DISPLAY "LightYellow" TO fp11
  DISPLAY "Green" TO fp12
  DISPLAY "LightGreen" TO fp13
  DISPLAY "Orange" TO fp14
  DISPLAY "LightOrange" TO fp15
  DISPLAY "Purple" TO fp16


{
  DISPLAY "Black   #000000" TO fp00
  DISPLAY "White    #808080" TO fp01
  DISPLAY "Blue  #C0C0C0" TO fp02
  DISPLAY "LightBlue   #FFFFFF" TO fp03 
  DISPLAY "Cyan    #000080" TO fp04
  DISPLAY "LightCyan    #0000FF" TO fp05   
  DISPLAY "Magenta    #008080" TO fp06
  DISPLAY "LightMagenta    #00FFFF" TO fp07
  DISPLAY "Red  #800000" TO fp08
  DISPLAY "lightRed  #800080" TO fp09
  DISPLAY "Yellow #FF00FF" TO fp10
  DISPLAY "LightYellow     #FF0000" TO fp11
  DISPLAY "Green  #FF9900" TO fp12
  DISPLAY "LightGreen  #FFFF00" TO fp13
  DISPLAY "Orange   #808000" TO fp14
  DISPLAY "LightOrange   #008000" TO fp15
  DISPLAY "Purple    #00FF00" TO fp16
  
  DISPLAY "#000000" TO f000
  DISPLAY "#696969" TO f001
  DISPLAY "#808080" TO f002
  DISPLAY "#708090" TO f003 
  DISPLAY "#778899" TO f004
  DISPLAY "#a9a9a9" TO f005   
  DISPLAY "#c0c0c0" TO f006
  DISPLAY "#d3d3d3" TO f007
  DISPLAY "#d9d9d9" TO f008
  DISPLAY "#f5f5f5" TO f009
  DISPLAY "#AAAAAA" TO f010
  DISPLAY "#BBBBBB" TO f011
  DISPLAY "#CCCCCC" TO f012
  DISPLAY "#DDDDDD" TO f013
  DISPLAY "#EEEEEE" TO f014
  DISPLAY "#FFFFFF" TO f015
  DISPLAY "#FFFFFF" TO f016

  DISPLAY "#1f497d" TO f100
  DISPLAY "#4682b4" TO f101
  DISPLAY "#4169e1" TO f102
  DISPLAY "#6495ed" TO f103 
  DISPLAY "#87cefa" TO f104
  DISPLAY "#87ceeb" TO f105   
  DISPLAY "#add8e6" TO f106
  DISPLAY "#b0c4de" TO f107
  DISPLAY "#bed2f0" TO f108
  DISPLAY "#0099FF" TO f109
  DISPLAY "#3399FF" TO f110
  DISPLAY "#66BBFF" TO f111
  DISPLAY "#88BBFF" TO f112
  DISPLAY "#99BBFF" TO f113
  DISPLAY "#BBEEFF" TO f114
  DISPLAY "#CCFFFF" TO f115
  DISPLAY "#FFFFFF" TO f116

  DISPLAY "#31869b" TO f200
  DISPLAY "#008080" TO f201
  DISPLAY "#008b8b" TO f202
  DISPLAY "#20b2aa" TO f203 
  DISPLAY "#00ced1" TO f204
  DISPLAY "#48d1cc" TO f205   
  DISPLAY "#40e0d0" TO f206
  DISPLAY "#afeeee" TO f207
  DISPLAY "#cdebeb" TO f208
  DISPLAY "#00FFCC" TO f209
  DISPLAY "#33FFCC" TO f210
  DISPLAY "#66FFCC" TO f211
  DISPLAY "#88FFCC" TO f212
  DISPLAY "#AAFFCC" TO f213
  DISPLAY "#CCFFCC" TO f214
  DISPLAY "#DDFFFF" TO f215
  DISPLAY "#FFFFFF" TO f216

  DISPLAY "#c51c5a" TO f300
  DISPLAY "#c82f67" TO f301
  DISPLAY "#cb396d" TO f302
  DISPLAY "#d14e7d" TO f303 
  DISPLAY "#d96790" TO f304
  DISPLAY "#e081a3" TO f305   
  DISPLAY "#e999b5" TO f306
  DISPLAY "#f0b3c8" TO f307
  DISPLAY "#facfdd" TO f308
  DISPLAY "#FF33FF" TO f309
  DISPLAY "#FF66CC" TO f310
  DISPLAY "#FF66FF" TO f311
  DISPLAY "#FF99CC" TO f312
  DISPLAY "#FF99FF" TO f313
  DISPLAY "#FFCCCC" TO f314
  DISPLAY "#FFCCFF" TO f315
  DISPLAY "#FFFFFF" TO f316


  DISPLAY "#440000" TO f400
  DISPLAY "#660000" TO f401
  DISPLAY "#880000" TO f402
  DISPLAY "#AA0000" TO f403 
  DISPLAY "#BB0000" TO f404
  DISPLAY "#DD0000" TO f405   
  DISPLAY "#FF0000" TO f406
  DISPLAY "#FF1100" TO f407
  DISPLAY "#FF2200" TO f408
  DISPLAY "#FF3300" TO f409
  DISPLAY "#FF4400" TO f410
  DISPLAY "#FF6600" TO f411
  DISPLAY "#FF8800" TO f412
  DISPLAY "#FFAA00" TO f413
  DISPLAY "#FFCC66" TO f414
  DISPLAY "#FFFF99" TO f415
  DISPLAY "#FFFFFF" TO f416

  DISPLAY "#9c6500" TO f500
  DISPLAY "#b886011" TO f501
  DISPLAY "#daa520" TO f502
  DISPLAY "#ffd700" TO f503 
  DISPLAY "#d1ae57" TO f504
  DISPLAY "#d9b861" TO f505   
  DISPLAY "#e4c874" TO f506
  DISPLAY "#f1d988" TO f507
  DISPLAY "#ffeb9c" TO f508
  DISPLAY "#FFFF11" TO f509
  DISPLAY "#FFFF22" TO f510
  DISPLAY "#FFFF44" TO f511
  DISPLAY "#FFFF66" TO f512
  DISPLAY "#FFFF77" TO f513
  DISPLAY "#FFFF88" TO f514
  DISPLAY "#FFFF99" TO f515
  DISPLAY "#FFFFFF" TO f516

  DISPLAY "#004400" TO f600
  DISPLAY "#006600" TO f601
  DISPLAY "#008800" TO f602
  DISPLAY "#00AA00" TO f603 
  DISPLAY "#00BB00" TO f604
  DISPLAY "#00DD00" TO f605   
  DISPLAY "#11FF00" TO f606
  DISPLAY "#22FF00" TO f607
  DISPLAY "#33FF00" TO f608
  DISPLAY "#44FF00" TO f609
  DISPLAY "#55FF00" TO f610
  DISPLAY "#66FF00" TO f611
  DISPLAY "#77FF00" TO f612
  DISPLAY "#66FF33" TO f613
  DISPLAY "#99FF66" TO f614
  DISPLAY "#CCFF99" TO f615
  DISPLAY "#FFFFFF" TO f616


  DISPLAY "#e26b010" TO f700
  DISPLAY "#ff8c00" TO f701
  DISPLAY "#ffa500" TO f702
  DISPLAY "#f4a460" TO f703 
  DISPLAY "#f0ac73" TO f704
  DISPLAY "#f0b585" TO f705   
  DISPLAY "#f5cbaa" TO f706
  DISPLAY "#ffdab9" TO f707
  DISPLAY "#fde9d9" TO f708
  DISPLAY "#44FF00" TO f709
  DISPLAY "#55FF00" TO f710
  DISPLAY "#66FF00" TO f711
  DISPLAY "#77FF00" TO f712
  DISPLAY "#66FF33" TO f713
  DISPLAY "#99FF66" TO f714
  DISPLAY "#CCFF99" TO f715
  DISPLAY "#FFFFFF" TO f716
  

  DISPLAY "#ac054c" TO f800
  DISPLAY "#ad0d53" TO f801
  DISPLAY "#b32063" TO f802
  DISPLAY "#b93575" TO f803 
  DISPLAY "#c2518d" TO f804
  DISPLAY "#ca6ca5" TO f805   
  DISPLAY "#d387bc" TO f806
  DISPLAY "#dba2d3" TO f807
  DISPLAY "#e4bae8" TO f808
  DISPLAY "#44FF00" TO f809
  DISPLAY "#55FF00" TO f810
  DISPLAY "#66FF00" TO f811
  DISPLAY "#77FF00" TO f812
  DISPLAY "#66FF33" TO f813
  DISPLAY "#99FF66" TO f814
  DISPLAY "#CCFF99" TO f815
  DISPLAY "#FFFFFF" TO f816  


  DISPLAY "#alpha 255" TO f900
  DISPLAY "#alpha 225" TO f901
  DISPLAY "#alpha 195" TO f902
  DISPLAY "#alpha 165" TO f903 
  DISPLAY "#alpha 135" TO f904
  DISPLAY "#alpha 90" TO f905   
  DISPLAY "#alpha 75" TO f906
  DISPLAY "#alpha 45" TO f907
  DISPLAY "#alpha 15" TO f908
  DISPLAY "#44FF00" TO f909
  DISPLAY "#55FF00" TO f910
  DISPLAY "#66FF00" TO f911
  DISPLAY "#77FF00" TO f912
  DISPLAY "#66FF33" TO f913
  DISPLAY "#99FF66" TO f914
  DISPLAY "#CCFF99" TO f915
  DISPLAY "#FFFFFF" TO f916 

}
END FUNCTION

