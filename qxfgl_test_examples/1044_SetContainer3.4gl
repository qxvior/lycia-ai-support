MAIN
DEFINE app ui.Application
LET app = ui.Application.GetCurrent()
CALL app.SetAppType("Child")
CALL app.SetAppContainer("cont1")
OPEN WINDOW w WITH 20 ROWS, 60 COLUMNS ATTRIBUTE(BORDER)
MENU
    COMMAND "exit child"
        EXIT MENU
END MENU 
END MAIN