main
CALL fgl_setenv("QX_COMPAT", "Informix4GL")
open window w at 1,1 with 10 rows ,78 columns
MENU "Test"
        COMMAND "Error1"
                ERROR "ERROR1"

        COMMAND "Windows" "Test of properly placing of windows"
                OPEN WINDOW w1 at 4,4 WITH 10 ROWS, 40 COLUMNS --attribute(border)
                MENU "WIN1"
                    COMMAND "error2"
                        ERROR "ERROR2"
                    COMMAND "Open another window"
                        OPEN WINDOW w2 at 10,10 WITH 10 ROWS, 40 COLUMNS --attribute(border)
                        MENU "WIN2"
                                COMMAND "Error3"
                                   ERROR "ERROR3"
                                COMMAND "Return"
                                   EXIT MENU
                        END MENU
                        CLOSE WINDOW W2
                        EXIT MENU
                    COMMAND "Return"
                        EXIT MENU
                END MENU
                CLOSE WINDOW w1
        COMMAND "Exit"
                EXIT MENU
END MENU
END MAIN
