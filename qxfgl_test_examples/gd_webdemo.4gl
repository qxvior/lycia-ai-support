#########################################################################################################
#! GUI Demo Application to demonstrate GUI Clients
#
# Modification History:
# 15.05.04 DS - Created
# 29.05.05 HH - Changed Form and Layout to make it company based
# 15.05.05 DS - Favourits URL in combo box
# 27.07.05 TH - Removed Char from prompt statement in function web_demo
# 27.07.05 TH - Replaced the input with a prompt
# 09.03.11 EK - Changed the online demo address (for the address on the new web site)
# 05.04.14 HH - clean up and toolbar
# Current Limitations & Bugs:
#
#
#########################################################################################################

############################################################
#! Globals
############################################################
GLOBALS "gd_globals.4gl"

#########################################################################################################
# FUNCTION web_demo()
#! "Online" "Showing a sample MacroMedia Captivate created Web Demo"
######################################################################################################### 
FUNCTION web_demo(demo_url)
  DEFINE 
    yes_no CHAR(1),
    demo_url varchar(200),   #will be loaded from config.cfg http://www.querix.com/video-guides http://www.querix.com/web/guest/products/online-demos
    loopState SMALLINT

  CALL fgl_window_open("w_web_demo",2,2,get_form_path("gd_f_web_demo_2"),FALSE)
 
 IF demo_url IS NULL THEN 
  	LET demo_url = get_online_demo_path()  -- settings.online_demo_path  
	END IF
	
  #DISPLAY BY NAME demo_url
  

 
  WHILE TRUE
    INPUT BY NAME demo_url
      WITHOUT DEFAULTS

      BEFORE INPUT
        CALL publish_toolbar("web_demo",0) 

			ON ACTION "exitModule"
				EXIT WHILE
				
      #ON KEY(F11)
      #  LET loopState = 0
      #  EXIT INPUT

      AFTER INPUT
        CALL publish_toolbar("web_demo",1) 

    END INPUT
  
  END WHILE

  CALL fgl_window_close("w_web_demo")


END FUNCTION

