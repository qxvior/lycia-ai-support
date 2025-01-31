############################################################
# Globals
############################################################
GLOBALS "gdt_globals.4gl"

FUNCTION mainMenu()
	DEFINE sl1 SMALLINT
	DEFINE w_main WINDOW
	
	OPTIONS AUTOREFRESH 1
	DEFER INTERRUPT

	CALL w_main.openWithForm("w_main", getFormPath("gdt_main"), 1,1,"", "BORDER")
	#OPEN WINDOW w_main AT 1,1 WITH FORM "form/gdt_main" ATTRIBUTE(BORDER)
	CALL fgl_settitle("Mini LyciaTouch Mobile Demo")
	CALL init_contact()
	CLOSE WINDOW SCREEN

	LET sl1 = 0
	
	INPUT BY NAME sl1 WITHOUT DEFAULTS	ATTRIBUTES(UNBUFFERED)
		BEFORE INPUT
      CALL fgl_dialog_setkeylabel("CANCEL","")
      CALL fgl_dialog_setkeylabel("ACCEPT","") 	
	#MENU
		ON ACTION actViewContactList
			CALL viewContactList()
		ON ACTION actViewContactDetails
			CALL viewContactDetails(currRecId)
		ON ACTION actEditContactDetails
			CALL editContactDetails(currRecId)			
		ON ACTION actAddContact
			CALL newContact()
		ON ACTION actExit
			EXIT INPUT
		ON ACTION actOtherDemos
			CALL menu2()	
		on ACTION actCheckExitState
			IF sl1 > 0 THEN
				EXIT INPUT
			END IF
	#END MENU
	END INPUT

	CALL fgl_winmessage("Clean Exit - fgl_winmessage() demo", "This program was closed by user interaction\nclean and without any errors or timeout\nJust for demo purpose","info")	
END FUNCTION

FUNCTION menu2()
	DEFINE sl2 SMALLINT
	DEFINE w_main2 WINDOW
	
	CALL w_main2.openWithForm("w_main2", getFormPath("gdt_main2"), 1,1,"", "BORDER")
	#OPEN WINDOW w_main AT 1,1 WITH FORM "form/gdt_main" ATTRIBUTE(BORDER)
	CALL fgl_settitle("Mini LyciaTouch Mobile Demo 2")

	MENU
		BEFORE MENU
      CALL fgl_dialog_setkeylabel("CANCEL","")
      CALL fgl_dialog_setkeylabel("ACCEPT","") 	
	#MENU
		ON ACTION actWidgetSlider
			CALL widget_slider()
			
		ON ACTION actTopMenu
			CALL demo_topMenu()
		
		ON ACTION actTabPage
			CALL demo_tab()
			
		ON ACTION actExit
			EXIT MENU
	
		ON ACTION actSwitchToMainMenu		
			EXIT MENU

	
	END MENU
	
	CALL w_main2.close()
	
END FUNCTION