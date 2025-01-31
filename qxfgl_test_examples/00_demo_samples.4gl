# The items on this menu are small test applications designed
# to demonstrate a particularly bug/issue with Lycia3.
#
# Querix can access this from outside on:
#   http://41.215.133.23:11290/LyciaWeb    default-1889   test/menu
#
DEFINE
	runCommand STRING
	DEFINE currentMenuId INT
	DEFINE LastWidgetId STRING
  DEFINE msg STRING = "This program is only used as a container for all required files for the qform demo\nPlease change in your command line to your LowCode project source folder i.e. /n/home/informix/workdir/projects/LowCode/LLC/source"

MAIN
	DEFINE
  	main_menu_id, action_id  integer,
  	runtString STRING,
  	i, n, sub_id, x,y  integer
  DEFINE menuGroupId INTEGER
	OPTIONS FIELD ORDER UNCONSTRAINED
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit

	CALL ui_init()
	
	CALL ui.Interface.setType("container")                 # Program Container
	CALL ui.Interface.LoadStartMenu("startmenu/00_demo_samples_startmenu")
	CALL ui.Application.GetCurrent().setMenuType("Tree")   # define menu type in - tree view
	CALL ui.Application.GetCurrent().SetClassNames(["tabbed_container"])
	CALL ui.interface.frontcall("html5","scriptImport",["{CONTEXT}/public/querix/js/demo_samples_footer.js"],[])  -- i.e. add additional header and satusbar elements and their styles
	CALL ui.interface.frontcall("sample","changeFrameTemplate",[],[])  --change the viewports/template i.e. header area and statusbar attachment

	CALL fgl_settitle("Demo Samples")
	CALL fgl_setkeylabel("ACCEPT","")
	CALL fgl_setkeylabel("CANCEL","")
	CALL fgl_setkeylabel("HELP","")
	CALL fgl_setkeylabel("action_CmdInvoke","")
	CALL fgl_setkeylabel("Escape","")
	CALL fgl_setkeylabel("Exit-Interrupt-Key","")
	MENU
		ON ACTION actCmdInvoke
			LET LastWidgetId = fgl_getlastwidgetid()
			IF LastWidgetId[1,7] = "action_" THEN
				CASE LastWidgetId
					WHEN "action_exit" 
						IF exitMdiContainer() THEN
							EXIT MENU
						END IF
					WHEN "action_Footer1"
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('Victor Masibasi')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Research and Marketing')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('14:28')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('24.12.1968')"],[])						
	
					WHEN "action_Footer2"
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('John Smith')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Customer Service')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('08:12')"],[])
						CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('09.07.1984')"],[])
					
					OTHERWISE 
						CALL fgl_winmessage("otherwise",LastWidgetId,"info")							
				END CASE
			ELSE	
				LET runtString = trim(fgl_getlastwidgetid())
				IF get_vdom_set() THEN
					LET runtString = runtString, " VDOM=", trim(get_vDom()) 			
				END IF
				IF get_db_set() THEN
					LET runtString = runtString, " DB=", trim(get_db()) 			
				END IF
				RUN runtString WITHOUT WAITING
			END IF
{
		ON ACTION "Footer1"
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('Victor Masibasi')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Research and Marketing')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('14:28')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('24.12.1968')"],[])
		
		ON ACTION "Footer2"
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserName').text('John Smith')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserDepartment').text('Customer Service')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserLoginTime').text('08:12')"],[])
			CALL ui.interface.frontcall("html5","eval",["window.top.$('#lbValueUserBirthDate').text('09.07.1984')"],[])
}				
	    ON ACTION "Exit-Interrupt-Key"
			IF exitMdiContainer() THEN
				EXIT MENU
			END IF
	END MENU
END MAIN
 
 
################################################################################
# FUNCTION exitMdiContainer()
#
#
################################################################################
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