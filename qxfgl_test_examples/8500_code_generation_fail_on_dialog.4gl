DEFINE dummy_state BOOLEAN
DEFINE dial ui.Dialog

MAIN
    LET dummy_state = 1
    MENU
# compilation fails
        ON ACTION hide_dummy
            CALL dummy_hide(DIALOG)
# compilation and runtime works
        -- ON ACTION hide_dummy
        --     LET dial = ui.Dialog.GetCurrent()
        --     CALL dummy_hide(dial)
        ON ACTION dummy
            DISPLAY "dummy"
        ON ACTION EXIT
            EXIT MENU
    END MENU
END MAIN

FUNCTION dummy_hide(l_dialog ui.DIALOG)
    CALL l_dialog.setActionHidden("dummy", dummy_state)
    IF dummy_state = 1 THEN
        LET dummy_state = 0
    ELSE
        LET dummy_state = 1
    END IF
END FUNCTION
