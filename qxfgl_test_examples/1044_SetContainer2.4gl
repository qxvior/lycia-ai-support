MAIN
CALL ui.Interface.setType("child")
CALL ui.Interface.setContainer("cont1")
OPEN WINDOW w AT 5,5 WITH 20 ROWS, 50 COLUMNS ATTRIBUTE(BORDER)
MENU
    COMMAND "exit child"
        EXIT MENU
END MENU 
END MAIN