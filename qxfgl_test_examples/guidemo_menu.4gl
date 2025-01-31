# The items on this menu are small test applications designed
# to demonstrate a particularly bug/issue with Lycia3.
#
# Querix can access this from outside on:
#   http://41.215.133.23:11290/LyciaWeb    default-1889   test/menu
#
define
	runCommand STRING
	DEFINE currentMenuId INT
	
MAIN
DEFINE
  main_menu_id, action_id  integer,
  i, n, sub_id, x,y  integer
  DEFINE menuGroupId INTEGER
	CALL ui.interface.frontcall("html5","scriptImport",["{CONTEXT}/public/custom/extensions/transformers.js",""],[])
  CALL ui.Interface.setType("container")                 # Program Container
 	CALL ui.Interface.LoadStartMenu("startmenu/guidemo_menu_startmenu")
  CALL ui.Application.GetCurrent().setMenuType("Tree")   # define menu type (TreeMenu)
  CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])

	MENU
		BEFORE MENU
			CALL fgl_setkeylabel("ACCEPT","")
			CALL fgl_setkeylabel("CANCEL","")
			CALL fgl_setkeylabel("HELP","")
			
		ON ACTION actCmdInvoke
			DISPLAY "" AT 5,5
			CASE fgl_getlastwidgetid() --Returns ID of the last triggered element
				WHEN "mc_contact" 
					RUN "gd_contact" WITHOUT WAITING
				WHEN "mc_widget"
					RUN "gd_widget_demo" WITHOUT WAITING
				WHEN "mc_dialog"
					RUN "gd_dialog" WITHOUT WAITING					
				WHEN "mc_blob"
					RUN "gd_blob" WITHOUT WAITING				

				WHEN "mc_browser"
					RUN "gd_browser" WITHOUT WAITING		

				WHEN "mc_color_chart"
					RUN "gd_color_chart" WITHOUT WAITING		

				WHEN "mc_color_display_at"
					RUN "gd_color_display_at" WITHOUT WAITING		

				WHEN "mc_color_display_to"
					RUN "gd_color_display_to" WITHOUT WAITING		

				WHEN "mc_attributes"
					RUN "gd_attributes" WITHOUT WAITING		

				WHEN "mc_settings_general"
					RUN "gd_settings_general" WITHOUT WAITING		
										
				WHEN "mc_settings_toolbar"
					RUN "gd_settings_toolbar" WITHOUT WAITING		

				WHEN "mc_settings_language"
					RUN "gd_settings_language" WITHOUT WAITING		
																				
																		
					
				WHEN "mc_exit" 
##########
					IF exitMdiContainer() THEN
						EXIT MENU
					END IF
	
			END CASE
			
	    COMMAND KEY(INTERRUPT) "Exit-Interrupt-Key"
					IF exitMdiContainer() THEN
						EXIT MENU
					END IF
						
	END MENU
END MAIN
 
FUNCTION exitMdiContainer()
	DEFINE msg String
	
	IF ui.Interface.getChildCount() > 0 THEN --one or more child apps are running in mdi container-user must close them before the mdi container can be closed	
		LET msg = "You must close your child applications prior to closing the parent-mdi host:\nNumber of child-applications currently running:", ui.Interface.getChildCount()
		CALL fgl_winmessage("Child Applications are still running",msg,"error")
		ERROR "You must first exit the child programs."
		RETURN FALSE
	ELSE
		#Do some clean up stuff here if it is required
		RETURN TRUE
	END IF
END FUNCTION