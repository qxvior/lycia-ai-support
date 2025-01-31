##################################################################################
# MAIN
#
#
##################################################################################	
MAIN
	DEFINE myRecord 
		RECORD
			f001, f002, f003 STRING
		END RECORD
	DEFINE lbInfoNow, lbInfoNext STRING
	CALL ui_init()	

	DEFER INTERRUPT

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	
	OPEN WINDOW myWin1 WITH FORM "form/gui_toolbar_view_configuration_basic" 
	CALL ui.Interface.setText("Toolbar Cfg")
	
	LET lbInfoNow = "We have NOT defined any custom action View configuration (Toolbar/Button).\n", 
	"This means, the toolbar is only driven by the default action view configuration file.\n",
	"(for example the default: systemActionsDefault.fm2)\n",
	"\n",
	"Look & Watch the first buton in the toolbar \"Accept\" !\n", 
	"It will change in the next step."

	LET lbInfoNext = "We are going to change the view configuration for the ACCEPT event ",
								"using the function fgl_setKeyLabel()\n",
								"CALL fgl_setKeyLabel(\"ACCEPT\",\"MyAccept1\",\"{CONTEXT}/public/querix/icon/svg/24/ic_account_balance_24px.svg\")\n",
								"\nPress the NEXT button in the toolbar to proceed"

	DISPLAY "Toolbar configuration to 100% taken from systemActionsDefault (*1)" TO lbTitle
	DISPLAY "Next: fgl_setKeyLabel(\"ACCEPT\",\"MyAccept1\",\"{CONTEXT}/public/querix/icon/svg/24/ic_account_balance_24px.svg\")" TO lbInfo1
	DISPLAY "Click on NEXT to proceed" TO lbInfo2
	
	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext	
			
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
			ON KEY (F1)
				CALL fgl_winmessage("F1","F1","info")
				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT
		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT			

	CLOSE WINDOW myWin1
	
	CALL exampleFglSetKeyLabel()	
	
	CALL fgl_winmessage("End of Demo","You have reached the end of this demo app","info")
			
END MAIN


#######################################################################
# FUNCTION exampleFglSetKeyLabel()
#
# Only use a global scope fgl_setKeyLabel() call
#
#######################################################################
FUNCTION exampleFglSetKeyLabel()
define  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD
	DEFINE lbInfoNow, lbInfoNext STRING

	OPEN WINDOW myWin2 WITH FORM "form/gui_toolbar_view_configuration_basic"
	#CALL fgl_settitle("CALL fgl_setKeyLabel()")
	
	CALL fgl_setKeyLabel("ACCEPT","Accept setKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_account_balance_24px.svg",3,0,"fgl_setKeyLabel(\"ACCEPT\") defined ACCEPT view configuration")
	#CALL fgl_setKeyLabel("F1","Help setKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_help_24px.svg",150001,0,"fgl_setKeyLabel(F1) - Help defined F1 view configuration")

	LET lbInfoNow = "We have changed the ACCEPT toolbar/button view configuration on a global basis using fgl_setKeylabel()\n\n",
								"fgl_setKeyLabel(\"ACCEPT\",\"Accept setKeyL\",\"{CONTEXT}/public/querix/icon/svg/24/ic_account_balance_24px.svg\")\n\n",
								"Remember: fgl_setKeyLabel uses a GLOBAL scope",
								"\nPress the NEXT button in the toolbar to proceed"

	LET lbInfoNext = "Next, We are going to open a form with an embedded view configuration\n"

	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext										

	DISPLAY "View configuration applied using the function fgl_setKeyLabel() (*2)" TO lbTitle
	DISPLAY "Next: View configuration applied using the form <form.actions>" TO lbInfo1
	DISPLAY "Click the NEXT button in the toolbar to proceed" TO lbInfo2	
			
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
			ON KEY (F1)
				CALL fgl_winmessage("F1","F1","info")
				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT

		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT		
		
	CLOSE WINDOW myWin2

	CALL exampleFormActions()
	
END FUNCTION



#######################################################################
# FUNCTION exampleFormActions()
#
# Load a form with embedded ACTION View Configurations
#
#######################################################################
FUNCTION exampleFormActions()
define  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD

	DEFINE lbInfoNow, lbInfoNext STRING

	OPEN WINDOW myWin3 WITH FORM "form/gui_toolbar_view_configuration_with_actions" 
	#CALL fgl_settitle("Form with an embedded Actions - view configuration")
	
	LET lbInfoNow = "We have now got a form displayed, with an embedded view configuration (ACTIONS)\n\n",

								"<Action identifier=\"ACCEPT\" text=\"Form ACCEPT\" actionImage=\"{CONTEXT}/public/querix/icon/svg/24/ic_inject_24px.svg\" comment=\"Form ACCEPT - View configuration defined in form\" order=\"3\" />\n\n",		
								"<Action identifier=\"actPrint\" text=\"Print (F2)\" actionImage=\"{CONTEXT}/public/querix/icon/svg/24/ic_print_24px.svg\" comment=\"My comment/tooltip for action actPrint with the accelerator key F2\" accelerator1=\"F2,false,false,false\" order=\"11\"/>\n\n",
								"<Action identifier=\"F1\" text=\"My F1 (F1)\" actionImage=\"{CONTEXT}/public/querix/icon/svg/24/ic_help_outline_24px.svg\" comment=\"My comment/tooltip for F1\" accelerator1=\"F1,false,false,false\" order=\"51\"/>\n\n",		

								"\nPress the NEXT button in the toolbar to proceed"

	LET lbInfoNext = "We are going to load a form with an embedded FIELD scope configuration view\n"

	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext										


	DISPLAY "View configuration applied using the form <form.actions> (*3)" TO lbTitle
	DISPLAY "Next: Form Field Actions - Field View configuration embedded in the form <TextField.actions>" TO lbInfo1
	DISPLAY "Click the NEXT button in the toolbar to proceed" TO lbInfo2	


	
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
		#On ACTION "actNext"
		#	CALL exampleFormFieldActions()	

			ON KEY (F1)
				CALL fgl_winmessage("F1","F1","info")
			ON ACTION "actPrint"
				CALL fgl_winmessage("Action: actPrint","Action: actPrint","info")		

				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT

		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT		


	CLOSE WINDOW myWin3
	
	CALL exampleFormFieldActions()
	
END FUNCTION 


#######################################################################
# FUNCTION exampleFormFieldActions()
#
# Load a form with embedded FIELD-ACTION View Configurations
#
#######################################################################
FUNCTION exampleFormFieldActions()
	DEFINE  myRecord RECORD
		f001, f002, f003 STRING
	END RECORD
	DEFINE lbInfoNow, lbInfoNext STRING

	OPEN WINDOW myWin4 WITH FORM "form/gui_toolbar_view_configuration_with_actions_field" --ATTRIBUTE(BORDER)
	#CALL fgl_settitle("Form with an embedded FIELD Actions - view configuration")
	
	LET lbInfoNow = "We have now got a form displayed, with an embedded FIELD view configuration (ACTIONS)\n",

									"<TextField.actions>\n\n",									
									"<Action comment=\"Field F002 - Action actPrintSetup\" defaultView=\"Yes\" identifier=\"actPrintSetup\" order=\"12\" showInContextMenu=\"Yes\" text=\"PrintSetup F002\" validate=\"true\" actionImage=\"{CONTEXT}/public/querix/icon/svg/24/ic_settings_24px.svg\"/>\n",
									"</TextField.actions>\n\n",
									"<TextField.actions>\n",
									"<Action comment=\"Field F003 - F3 Event in Field F003\" defaultView=\"Yes\" identifier=\"F3\" order=\"13\" showInContextMenu=\"Yes\" validate=\"true\" text=\"F2 - F003\" actionImage=\"{CONTEXT}/public/querix/icon/svg/24/ic_sort-24px.svg\"/>\n",
									"</TextField.actions>\n\n",
									"\nPress the Tab key to navigate through the fields and watch the toolbar"	,
								"\nPress the NEXT button in the toolbar to proceed"	

	LET lbInfoNext = "We are going to change the ACCEPT view configuration ONLY for the scope of a DIALOG block (DIALOG, INPUT, DISPLAY ARRAY, PROMPT, MENU...)\n",
								"We call fgl_dialog_setKeyLabel() in the BEFORE clause\n",
								"Example:\n",
								"BEFORE INPUT\n",
								"CALL fgl_dialog_setKeyLabel(\"ACCEPT\",\"MyAccept2\",\"{CONTEXT}/public/querix/icon/png/32/database-update.png\")\n"
								
	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext										

	DISPLAY "View configuration applied using the Form Field Actions <TextField.actions> (*4)" TO lbTitle
	DISPLAY "Next: 4GL DIALOG SCOPE - fgl_dialog_setKeyLabel(\"ACCEPT\",\"MyAccept1\",\"{CONTEXT}/public/querix/icon/png/32/demo/activity_monitor.png\")" TO lbInfo1
	DISPLAY "Click the NEXT button in the toolbar to proceed" TO lbInfo2	



	CALL fgl_setKeyLabel("F11","")  --Remove any global defined F11 view configurations   for the global scope - from this point onward
	CALL fgl_setKeyLabel("actPrint","")  --Remove any global defined actPrint view configurations  for the global scope - from this point onward		
	CALL fgl_setKeyLabel("actPrintSetup","")  --Remove any global defined actPrintSetup view configurations  for the global scope - from this point onward	
		
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
		#On ACTION "actNext"
		#	CALL exampleFglDialogSetKeyLabel()	
		
		#ON KEY (F1)
		#	CALL fgl_winmessage("F1","F1","info")
		#ON KEY (F2)
		#	CALL fgl_winmessage("F2","F2","info")
		ON KEY (F11)
			CALL fgl_winmessage("F11","F11 - Example:Sort Ascending","info")						
		ON ACTION "actPrint"
			CALL fgl_winmessage("Action: actPrint","Action: actPrint","info")
		ON ACTION "actPrintSetup"
			CALL fgl_winmessage("Action: actPrintSetup","Action: actPrintSetup","info")

				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT

		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT		


	CLOSE WINDOW myWin4

	CALL exampleFglDialogSetKeyLabel()	
END FUNCTION 


#######################################################################
# FUNCTION exampleFglDialogSetKeyLabel()
#
# Only use a dialog scope fgl_dialog_setKeyLabel() call
#
#######################################################################
FUNCTION exampleFglDialogSetKeyLabel()
	DEFINE  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD
	DEFINE lbInfoNow, lbInfoNext STRING

	OPEN WINDOW myWin5 WITH FORM "form/gui_toolbar_view_configuration_basic" --ATTRIBUTE(BORDER)
	#CALL fgl_settitle("DIALOG SCOPE: BEFORE INPUT -> CALL fgl_dialog_setKeyLabel()")
	
	LET lbInfoNow = "The ACCEPT event/button has now got a view configuration which is only applied for the scope of this INPUT statement\n\n",
									"BEFORE INPUT\n",
									
									"CALL fgl_dialog_setKeyLabel(\"ACCEPT\",\"MyAccept diaSetKey\",\"{CONTEXT}/public/querix/icon/svg/24/ic_done_outline_24px.svg\")\n\n",
									"CALL fgl_dialog_setKeyLabel(\"actPrint\",\"Print diaSetKey\",\"{CONTEXT}/public/querix/icon/svg/24/ic_print_24px.svg\")\n\n",
									"CALL fgl_dialog_setKeyLabel(\"actPrintSetup\",\"Print S diaSetKeyL\",\"{CONTEXT}/public/querix/icon/svg/24/ic_settings_24px.svg\")\n\n",
									
									
									"\nPress the NEXT button in the toolbar to proceed"

	LET lbInfoNext = "We are going to add an INFIELD-ACTION event (4gl) - ON ACTION/KEY INFIELD()\nwhich only applies this event for a particular field\n\n",
									"ON ACTION \"actEmail\" INFIELD(f001)\n",
									"ON KEY (F1) INFIELD(f003)\n"

	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext										
	


	DISPLAY "View configuration applied in 4GL DIALOG SCOPE - CALL fgl_dialog_setKeyLabel(\"ACCEPT\",\"MyAccept diaSetKey\",\"{CONTEXT}/public/querix/icon/svg/24/ic_done_outline_24px.svg\") (*5)" TO lbTitle
	DISPLAY "Next: 4GL ON KEY/ACTION INFIELD() Create an event for a particular field in 4gl" TO lbInfo1
	DISPLAY "Click the NEXT button in the toolbar to proceed" TO lbInfo2	

		
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("ACCEPT","MyAccept diaSetKey","{CONTEXT}/public/querix/icon/svg/24/ic_done_outline_24px.svg",3,0,"fgl_dialog_setKeyLabel() ACCEPT-MyAccept diaSetKey")
			CALL fgl_dialog_setKeyLabel("actPrint","Print diaSetKey","{CONTEXT}/public/querix/icon/svg/24/ic_print_24px.svg",11,"fgl_dialog_setKeyLabel() actPrint-Print diaSetKey")
			CALL fgl_dialog_setKeyLabel("actPrintSetup","Print S diaSetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_settings_24px.svg",12,"fgl_dialog_setKeyLabel() actPrintSetup-Print S diaSetKeyL")
				
		#On ACTION "actNext"
		#	CALL example4glOnActionInField()
			ON ACTION "actPrint"
				CALL fgl_winmessage("Action: actPrint","Action: actPrint","info")		
		ON ACTION "actPrintSetup"
			CALL fgl_winmessage("Action: actPrintSetup","Action: actPrintSetup","info")				
				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT

		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT	
	
	CLOSE WINDOW myWin5	
	
	CALL example4glOnActionInField()
END FUNCTION	


#######################################################################
# FUNCTION example4glOnActionInField()
#
# Showing how to enable an event only for particular fields using INFIELD()
#
#######################################################################
FUNCTION example4glOnActionInField()
define  myRecord RECORD
	f001, f002, f003 STRING
	END RECORD

	DEFINE lbInfoNow, lbInfoNext STRING

	OPEN WINDOW myWin6 WITH FORM "form/gui_toolbar_view_configuration_basic" --ATTRIBUTE(BORDER)
	#CALL fgl_settitle("DIALOG SCOPE with INFIELD - 4GL - INPUT..ON ACTION INFIELD()")
	
	LET lbInfoNow = "We added an action event (4gl) ON ACTION/KEY INFIELD()\nwhich only applies this event for this particular field\n",
									"ON ACTION \"actEmail\" INFIELD(f001)\n",
									"ON KEY (F1) INFIELD(f003)\n",
									"\n",
									"Press the Tab key to navigate through the fields and watch the toolbar",
								"\nPress ANY button in the toolbar to proceed"		
	

	LET lbInfoNext = "This is the end of this view configuration demo"

	DISPLAY BY NAME lbInfoNow
	DISPLAY BY NAME lbInfoNext										
	DISPLAY "End of Demo" TO lbInfo1

	CALL fgl_setKeyLabel("ACCEPT","Accept setKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_done_outline_24px.svg",3,0,"fgl_setKeyLabel() ACCEPT-Accept setKeyL")
	CALL fgl_setKeyLabel("F1","Help-F003 setKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_help_outline_24px.svg",51,0,"fgl_setKeyLabel() F1-Help-F003 setKeyL")

	DISPLAY "View configuration applied in 4GL DIALOG SCOPE - with INFIELD condition - ON ACTION \"actEmail\" INFIELD(f001) (*6)" TO lbTitle
	DISPLAY "Next: Exit Demo Application" TO lbInfo1
	DISPLAY "Click the CANCEL button in the toolbar to exit this demo application" TO lbInfo2	
	
	
	INPUT BY NAME myRecord.* WITHOUT DEFAULTS
		BEFORE INPUT
			CALL fgl_dialog_setKeyLabel("actEmail","Email-F001 diaSetKeyL","{CONTEXT}/public/querix/icon/svg/24/ic_email_24px.svg",41,0,"fgl_dialog_setKeyLabel() actEmail-Email-F001 diaSetKeyL")
			
		#On ACTION "actNext"
		#	CALL fgl_winmessage("End OF Demo","This is the last view configuration example","info")				
		ON ACTION "actEmail" INFIELD(f001)
			CALL fgl_winmessage("Action: actEmail","Action: actEmail","info")		
		ON KEY (F1) INFIELD(f003)
			CALL fgl_winmessage("F1","F1","info")

				
		ON ACTION "Next"
			EXIT INPUT

		ON ACTION "ACCEPT"
			CALL fgl_winmessage("ACCEPT","This button/icon is currently attached to the ACCEPT event","info")
			CONTINUE INPUT

		ON ACTION "CANCEL"
			IF fgl_winbutton("Terminate Demo","Do you want to exit this demo?","No", "Yes|No", "info", 1) = "Yes" THEN
				EXIT PROGRAM
			ELSE
				LET int_flag = FALSE
				LET quit_flag = FALSE
				CONTINUE INPUT
			END IF
	END INPUT	

	CLOSE WINDOW myWin6
	
END FUNCTION 
	