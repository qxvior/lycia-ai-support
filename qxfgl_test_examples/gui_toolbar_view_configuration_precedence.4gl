##################################################################################
# MAIN
#
#
##################################################################################	

MAIN
define  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD
	
	CALL ui_init()	
	
	CALL fgl_setKeyLabel("MyAction1","A1-Def. SetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_filter_1_24px.svg",21,0,"MyAction1 - View Configuration defined using fgl_setkeylabel()")
	CALL fgl_setKeyLabel("MyAction2","A2-Def. SetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_filter_2_24px.svg",22,0,"MyAction2 - View Configuration defined using fgl_setkeylabel()")
	CALL fgl_setKeyLabel("MyAction3","A3-Def. SetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_filter_3_24px.svg",23,0,"MyAction3 - View Configuration defined using fgl_setkeylabel()")
	CALL fgl_setKeyLabel("MyAction4","A4-Def. SetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_filter_4_24px.svg",24,0,"MyAction4 - View Configuration defined using fgl_setkeylabel()")
			
	OPEN WINDOW myWin WITH FORM "form/gui_toolbar_view_configuration_precedence"
	CALL ui.Interface.setText("Toolbar Precedence")
		
	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("MyAction4","A4-Def. diaSetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_4_24px.svg",24,0,"MyAction4 - View Configuration defined using fgl_dialog_setkeylabel()")

		ON ACTION "MyAction1"
			CALL fgl_winmessage("Action: MyAction1","Action: MyAction1","info")
		ON ACTION "MyAction2"
			CALL fgl_winmessage("Action: MyAction2","Action: MyAction2","info")
		ON ACTION "MyAction3"
			CALL fgl_winmessage("Action: MyAction3","Action: MyAction3","info")
		ON ACTION "MyAction4"
			CALL fgl_winmessage("Action: MyAction4","Action: MyAction4","info")
				
	END INPUT

END MAIN