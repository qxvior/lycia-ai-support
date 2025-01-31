MAIN
    OPTIONS ON TERMINATE SIGNAL CALL end_app
    CALL STARTLOG("9014_error.log")
    MENU "test"
        COMMAND "quit" 
    END MENU
END MAIN

FUNCTION end_app()
  DEFINE l_tmp_str STRING
  DISPLAY "Program terminated by SIGTERM signal..."
END FUNCTION