DEFINE recWinDeco 
	RECORD
		f_interface_setText,f_window_setText,f_fglSetTitle,f_interface_setImage, f_window_setImage STRING
	END RECORD

DEFINE wo ui.Window
################################################################################
# MAIN
#
#
################################################################################
MAIN
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit	
	
	CALL ui_init()

	CALL initData()
	
	MENU
		ON ACTION "Full Screen"
			OPEN WINDOW wFullScreen WITH FORM "form/gui_window_decoration" 
			LET wo = ui.Window.forName("wFullScreen")
			CALL inputRec()
			CLOSE WINDOW wFullScreen
			
		ON ACTION "Dialog Window"
			OPEN WINDOW wDialogScreen WITH FORM "form/gui_window_decoration" ATTRIBUTE(BORDER)
			LET wo = ui.Window.forName("wDialogScreen")
			CALL inputRec()
			CLOSE WINDOW wDialogScreen

    ON ACTION "HELP"
    	CALL onlineHelp(NULL,"WindowDecoration")
	    			
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU

END MAIN	

FUNCTION inputRec()	
		INPUT BY NAME recWinDeco.* WITHOUT DEFAULTS ATTRIBUTE(UNBUFFERED)
		
			ON ACTION "interface_setText"
				CALL ui.Interface.setText(recWinDeco.f_interface_setText)
				NEXT FIELD f_interface_setText
				CALL ui.interface.refresh()

			ON ACTION "window_setText" # identical to fgl_setTitle()
				CALL wo.setText(recWinDeco.f_window_setText)
				NEXT FIELD f_window_setText
				CALL ui.interface.refresh()
				
			ON ACTION "fgl_setTitle" # identical to window.setText()
				CALL fgl_settitle(recWinDeco.f_fglSetTitle)
				NEXT FIELD f_fglSetTitle
				CALL ui.interface.refresh()

			ON ACTION "interface_setImage"
				CALL ui.Interface.setImage(recWinDeco.f_interface_setImage)
				NEXT FIELD f_interface_setImage
				CALL ui.interface.refresh()

			ON ACTION "window_setImage"
				CALL wo.setImage(recWinDeco.f_window_setImage)
				NEXT FIELD f_window_setImage
				CALL ui.interface.refresh()
												
	    ON ACTION "HELP"
	    	CALL onlineHelp(NULL,"WindowDecoration")
					    					
			ON ACTION "CANCEL"
				EXIT INPUT
		END INPUT
		
END FUNCTION		
	

################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	
	LET recWinDeco.f_fglSetTitle = "My fgl_setTitle() Text"
	LET recWinDeco.f_interface_setImage = "{CONTEXT}/public/querix/icon/svg/12/ic_arrow_drop_down_12px.svg"
	LET recWinDeco.f_window_setImage = "{CONTEXT}/public/querix/icon/svg/12/ic_arrow_drop_right_12px.svg"
	
	LET recWinDeco.f_interface_setText = "My interface.setText() Text"

	LET recWinDeco.f_window_setText = "My window.setText() Text"
	

END FUNCTION

