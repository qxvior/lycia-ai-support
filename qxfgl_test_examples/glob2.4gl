GLOBALS "glob1.4gl"
GLOBALS
    DEFINE glob2 char(50)
END GLOBALS 
FUNCTION glob2 ()
    LET  glob1="Var glob1 used in glob2.4gl"
    DISPLAY glob1
END FUNCTION