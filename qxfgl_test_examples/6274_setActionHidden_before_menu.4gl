MAIN
	DEFINE toggle BOOLEAN
	LET toggle = FALSE
	MENU 
		BEFORE MENU
			CALL dialog.setActionHidden("action1",FALSE)
			CALL dialog.setActionHidden("action2",TRUE)
    ON ACTION "action1"
        DISPLAY "hello Action1"
    ON ACTION "action2"
        DISPLAY "hello Action2"
    ON ACTION "toggle"
    	IF toggle THEN
			CALL dialog.setActionHidden("action1",TRUE)
			CALL dialog.setActionHidden("action2",FALSE)
			LET toggle = FALSE
		ELSE
			CALL dialog.setActionHidden("action1",FALSE)
			CALL dialog.setActionHidden("action2",TRUE)
			LET toggle = TRUE
		END IF	
					    	
    ON ACTION "exit"
        EXIT MENU
	END MENU
END MAIN