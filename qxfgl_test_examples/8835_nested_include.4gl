# Project: lyc1000
# Filename:  8835_nested_include
# Created By: alch
# Creation Date: Jun 20 2023

GLOBALS "8835_globals.4gl"
main
    DEFINE l_string type_string
    DEFINE l_int type_int
    LET l_string = "included int type"
    LET l_int = 8835
    DISPLAY l_string, " = ", l_int
end main
