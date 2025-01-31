GLOBALS "glob1.4gl"
GLOBALS "glob2.4gl"
MAIN
CALL glob1()
CALL glob2()
LET glob1 = "main glob1"
LET glob2 = "main glob2"
DISPLAY glob1
DISPLAY glob2
CALL fgl_getkey()
END MAIN