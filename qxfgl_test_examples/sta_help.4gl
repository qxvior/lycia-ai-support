################################################################################
# MAIN
#
#
################################################################################
MAIN
define  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD
	CALL ui_init()
	
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	#OPTIONS HELP FILE "msg/sta_help.erm"
		
	OPEN WINDOW myWin1 WITH FORM "form/sta_help" 

	CALL ui.Interface.setText("HELP")		
			
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS HELP 100  --classic 4gl help
		BEFORE INPUT
			CALL dialog.setActionHidden("ACCEPT",TRUE)
			#CALL dialog.setActionHidden("CANCEL",TRUE)
			CALL fgl_dialog_setKeyLabel("actCustomHelp","showHelp()","{CONTEXT}/public/querix/icon/svg/24/ic_help_outline_24px.svg",111,0,"This classic 4gl help will be handled using showHelp(200)")
			CALL fgl_dialog_setKeyLabel("onlineHelp","Online Help","{CONTEXT}/public/querix/icon/svg/24/ic_help_24px.svg",112,0,"WinShellExec(\"http://querix.com/go/lycia/Default.htm#06_reference/4gl/functions/Application_launch/winshellexec_and_winshellexecwait.htm?\")")
			CALL fgl_dialog_setKeyLabel("EmbeddedHelp","Embedded Help","{CONTEXT}/public/querix/icon/svg/24/ic_help_live_24px.svg",113,0,"WinShellExec(\"http://querix.com/go/lycia/Default.htm#06_reference/4gl/functions/Application_launch/winshellexec_and_winshellexecwait.htm?\")")

	
		On ACTION "actCustomHelp"  --classic 4gl help
			CALL showHelp(200)
	
		ON ACTION "onlineHelp" --online help with external browser
			CALL ui.Interface.frontCall("standard","launchurl",["https://querix.com/go/lycia/index.htm#06_reference/4gl/methods/ui/ui_interface/ui.interface.frontcall/standard.htm?Highlight=launchurl"],[])

	
		ON ACTION "EmbeddedHelp"	--online help using a 4gl form with a browser widget
			OPEN WINDOW wHelp WITH FORM "form/sta_help_browser" ATTRIBUTE(BORDER)
			DISPLAY "https://querix.com/go/lycia/index.htm#06_reference/ui/forms/widgets/browser.htm"
				TO fBrowser
				

				
			MENU
				ON ACTION "CLOSE"
					EXIT MENU
				ON ACTION "EXIT"
					EXIT MENU
			END MENU
					CLOSE WINDOW wHelp	

		ON ACTION "Help Reference"
			CALL onlineHelp(NULL,"HELP")

		ON ACTION "Cancel"
				EXIT INPUT					
	END INPUT

	CLOSE WINDOW myWin1			
	
END MAIN