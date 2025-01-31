MAIN
	DEFINE l_info STRING
	DEFINE l_timer INT
	DEFINE l_msg_str STRING

	CALL ui.Application.GetCurrent().SetClassNames(["ring-menu-sidebar"])
	
	LET l_info = "Shows HIDE/SHOW OPTION for the MENU block. The HIDE/SHOW statement address the menu item name (identifier=label) none-case sensitive"

#	OPEN WINDOW wScreen WITH FORM "form/sta_menu_hide_show_option"
#	DISPLAY l_info TO fInfo
	MENU
		BEFORE MENU
#---------------------------------
#			CALL fgl_dialog_setkeylabel("MyF5","MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_message_24px.svg",11)
#			#CALL fgl_dialog_setkeylabel("F5","MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_message_24px.svg",11)
#
#			CALL fgl_dialog_setkeylabel("Hide MyF5","Hide MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_1_24px.svg",21)
#			CALL fgl_dialog_setkeylabel("Show MyF5","Show MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_2_24px.svg",22)
#
#			CALL fgl_dialog_setkeylabel("hide myf5","hide myf5","{CONTEXT}/public/querix/icon/svg/24/ic_4_24px.svg",31)
#			CALL fgl_dialog_setkeylabel("show myf5","show myf5","{CONTEXT}/public/querix/icon/svg/24/ic_5_24px.svg",32)
#
#			CALL fgl_dialog_setkeylabel("HIDE MYF5","HIDE MYF5","{CONTEXT}/public/querix/icon/svg/24/ic_7_24px.svg",41)
#			CALL fgl_dialog_setkeylabel("SHOW MYF5","SHOW MYF5","{CONTEXT}/public/querix/icon/svg/24/ic_8_24px.svg",42)
#---------------------------------

			CALL fgl_dialog_setkeylabel("MyF4","MyF4","{CONTEXT}/public/querix/icon/svg/24/ic_message_24px.svg",11)
			CALL fgl_dialog_setkeylabel("F5","MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_message_24px.svg",11)
			#CALL fgl_dialog_setkeylabel("F5","MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_message_24px.svg",11)

			CALL fgl_dialog_setkeylabel("F7","Hide MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_1_24px.svg",21)
			CALL fgl_dialog_setkeylabel("F8","Show MyF5","{CONTEXT}/public/querix/icon/svg/24/ic_2_24px.svg",22)

			CALL fgl_dialog_setkeylabel("F9","hide myf5","{CONTEXT}/public/querix/icon/svg/24/ic_4_24px.svg",31)
			CALL fgl_dialog_setkeylabel("F10","show myf5","{CONTEXT}/public/querix/icon/svg/24/ic_5_24px.svg",32)

			CALL fgl_dialog_setkeylabel("F11","HIDE MYF5","{CONTEXT}/public/querix/icon/svg/24/ic_7_24px.svg",41)
			CALL fgl_dialog_setkeylabel("F12","SHOW MYF5","{CONTEXT}/public/querix/icon/svg/24/ic_8_24px.svg",42)
			
			MESSAGE "Time=", current
			
# The menu item presentation can also be customized using the KEY as the identifier 
#			CALL fgl_dialog_setkeylabel("F7","Hide MyF5")
#			CALL fgl_dialog_setkeylabel("F8","Show MyF5")
#
#			CALL fgl_dialog_setkeylabel("F9","hide myf5")
#			CALL fgl_dialog_setkeylabel("F10","show myf5")
#
#			CALL fgl_dialog_setkeylabel("F11","HIDE MYF5")
#			CALL fgl_dialog_setkeylabel("F12","SHOW MYF5")

		ON IDLE 5 #60
			LET l_timer = l_timer +5 #60
			
			IF l_timer mod 10 = 0 THEN
				SHOW OPTION "MyF5"
				DISPLAY "0 - timer=", trim(l_timer),  " mod 10 = 0 = ", trim (l_timer mod 10 = 0)
				LET l_msg_str =  "Timer=", trim(l_timer), " Time=", trim(current) , " SHOW OPTION MyF5"
				MESSAGE l_msg_str
#				CALL dialog.setActionHidden("MyF5",FALSE)
			ELSE
				HIDE OPTION "MyF5"
				DISPLAY "1 - timer=", trim(l_timer),  " mod 10 = 0 = ", trim(l_timer mod 10 = 0)
				LET l_msg_str = "Timer=", trim(l_timer), " Time=", trim(current) , " HIDE OPTION MyF5"
				MESSAGE l_msg_str
#				CALL dialog.setActionHidden("MyF5",TRUE)
			END IF
			
	  COMMAND KEY(F5) "MyF5" "MyF5 menu item with F5 accelerator key"
	  	CALL fgl_winmessage("MyF5","MyF5 Menu item\nwith F5 accelerator key","info")

		COMMAND "MyF5" "MyF5 menu item without an accelerator key"
	  	CALL fgl_winmessage("MyF5","MyF5 Menu item\nwithout an accelerator key","info")

	  COMMAND KEY(F7) "Hide MyF5" "Hide MyF5 MENU item"
	  	HIDE OPTION "MyF5"
	  	
	  	HIDE OPTION "Hide MyF7"
	  	HIDE OPTION "Hide MyF9"
	  	HIDE OPTION "Hide MyF11"
	  	HIDE OPTION "F7"
	  	HIDE OPTION "F9"
	  	HIDE OPTION "F11"	  

#	  	SHOW OPTION "MyF8"	  	
#	  	SHOW OPTION "MyF10"
#	  	SHOW OPTION "MyF12"
#	  	
#	  	SHOW OPTION "F8"	  	
#	  	SHOW OPTION "F10"
#	  	SHOW OPTION "F12"

			LET l_msg_str= 
				"COMMAND KEY(F7)\n",
				"Hide OPTION MyF5/MyF7/MyF9/MyF11 MENU item\n",
				"Hide OPTION F7/F9/F11\n",
				"Show OPTION MyF8/MyF10/MyF12\n",
				"Show OPTION Key F8,F10,F12"

	  	CALL fgl_winmessage("COMMAND KEY(F7)",l_msg_str,"info")

			#F8 / Show MyF5
			COMMAND KEY(F8) "Show MyF5" "Show MyF5 MENU item"
	  	SHOW OPTION "MyF5"

#	  	SHOW OPTION "Hide MyF7"
#	  	SHOW OPTION "Hide MyF9"
#	  	SHOW OPTION "Hide MyF11"
#	  	SHOW OPTION "F7"
#	  	SHOW OPTION "F9"
#	  	SHOW OPTION "F11"	  	
	  	
	  	HIDE OPTION "MyF8"	  	
	  	HIDE OPTION "MyF10"
	  	HIDE OPTION "MyF12"

	  	HIDE OPTION "F8"	  	
	  	HIDE OPTION "F10"
	  	HIDE OPTION "F12"

			LET l_msg_str= 
			"COMMAND KEY(F7)\n",
			"Show OPTION MyF5/MyF7/My9/MyF11 MENU item\n",
			"Hide OPTION MyF8/MyF10/MyF12\n",
			"SHOW OPTION F7/F9/F11\n",			
			"HIDE OPTION Key F8,F10,F12"


	  	CALL fgl_winmessage("ShowMyF5","Show MyF5 MENU item","info")

	  COMMAND KEY(F9) "hide myF5" "Hide myF5 MENU item"
	  	HIDE OPTION "myf5"
	  	CALL fgl_winmessage("Hide MyF5","Hide MyF5 MENU item","info")
	  COMMAND KEY(F10) "show myF5" "Show myF5 MENU item"
	  	SHOW OPTION "myf5"
	  	CALL fgl_winmessage("Show myF5","Show myF5 MENU item","info")

	  COMMAND KEY(F11) "HIDE MYF5" "Hide MYF5 MENU item"
	  	HIDE OPTION "MYF5"
	  	CALL fgl_winmessage("Hide MYF5","Hide MYF5 MENU item","info")

	  COMMAND KEY(F12) "SHOW MYF5" "Show MYF5 MENU item"
	  	SHOW OPTION "MYF5"
	  	CALL fgl_winmessage("Show MYF5","Show MYF5 MENU item","info")

	COMMAND KEY(CANCEL) "Exit" "Exit Program"
		ERROR "COMMAND KEY(CANCEL)"
		DISPLAY "COMMAND KEY(CANCEL)"
	EXIT MENU
	
	COMMAND KEY(CTRL-C) "Exit key ctrl-c" "Exit Program"
		ERROR "COMMAND KEY(CTRL-C)"
		DISPLAY "COMMAND KEY(CTRL-C)"
	EXIT MENU

	ON ACTION "CANCEL"
		ERROR "CANCEL"
		DISPLAY "CANCEL"
		EXIT MENU
	ON ACTION "INTERRUPT"
		DISPLAY "INTERRUPT"
		ERROR "INTERRUPT"
		EXIT MENU
	ON ACTION "QUIT"
		ERROR "QUIT"
		DISPLAY "QUIT"
		EXIT MENU
	ON ACTION "CTRL-C"
		ERROR "CTRL-C"
		DISPLAY "CTRL-C"
		EXIT MENU
	ON ACTION "CONTROL-C"
		ERROR "CONTROL-C"
		DISPLAY "CONTROL-C"
		EXIT MENU

END MENU

	MENU
		on ACTION "cancel"
		DISPLAY "Good Bye !"
		exit Menu

	end menu
	
END MAIN