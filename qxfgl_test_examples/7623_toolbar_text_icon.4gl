MAIN
 DEFINE f1 STRING

	CALL fgl_putenv("QX_COMPAT=Informix4GL")
	OPEN WINDOW w WITH FORM "7623/7623_toolbar_text_icon"
	CALL fgl_setactionlabel("act2", "Action 2", "qx://embedded/Icon_19.ico", 2, TRUE, "action_2 tooltip", "top", "iconlabel")
	CALL fgl_setkeylabel("F2", "Key F2", "qx://embedded/Icon_19.ico", 2, TRUE, "F2 tooltip", "top", "label")
	MENU
		BEFORE MENU
			CALL fgl_dialog_setactionlabel("act3", "Action 3", "qx://embedded/Icon_19.ico", 2, TRUE, "action_3 tooltip", "top", "iconlabel")
			CALL fgl_dialog_setkeylabel("F3", "Key F3", "qx://embedded/Icon_19.ico", 2, TRUE, "F3 tooltip", "top", "label")
		ON ACTION "act2"
		ON ACTION "act3"
		ON ACTION "act4" #actionDefaults in form
		COMMAND KEY("F3")
		COMMAND KEY("F2")
		COMMAND KEY("F4") #actionDefaults in form
        ON ACTION Accept
          EXIT MENU
	END MENU
END MAIN