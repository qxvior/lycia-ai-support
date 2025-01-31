##################################################################################
# FUNCTION initToolbar()
#
#
##################################################################################
FUNCTION initToolbar()
	CALL fgl_setkeylabel("Display Values", "Show Values", "{CONTEXT}/public/querix/icon/svg/24/ic_speaker_notes_24px.svg",30,false,"Display Variable Values") 
	CALL fgl_setkeylabel("Go To Line", "Go To Line", "{CONTEXT}/public/querix/icon/svg/24/ic_subdirectory_arrow_right_24px.svg",40,false,"GoTo a particular Line")
	CALL fgl_setkeylabel("getSystemInfo", "System Info", "{CONTEXT}/public/querix/icon/svg/24/ic_settings_24px.svg",90,false,"System/Settings information")
	
	#CALL fgl_keydivider(10)
	#CALL fgl_keydivider(30)
	#CALL fgl_keydivider(40)
	#CALL fgl_keydivider(70)
	#CALL fgl_keydivider(90)	
	#CALL fgl_keydivider(100)	
END FUNCTION

##################################################################################
# FUNCTION hideNavigation()
#
#
##################################################################################
FUNCTION hideNavigation()
	CALL fgl_setkeylabel("firstrow","")
	CALL fgl_setkeylabel("prevpage","")
	CALL fgl_setkeylabel("nextpage","")
	CALL fgl_setkeylabel("lastrow","")
	
END FUNCTION