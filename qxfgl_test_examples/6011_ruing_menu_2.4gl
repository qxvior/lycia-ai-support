MAIN
CALL fgl_putenv("QX_COMPAT=Informix4GL")

OPEN WINDOW w WITH 25 ROWS,100 COLUMNS ATTRIBUTE(BORDER)
WHILE TRUE
MENU
    COMMAND "add1" 
     	EXIT MENU 
    COMMAND "add2" 
     	EXIT MENU 
    COMMAND "add3" 
     	EXIT MENU 
    COMMAND "add4" 
     	EXIT MENU 
      
    COMMAND "exit" 
     	EXIT PROGRAM 
END MENU

END WHILE
END MAIN