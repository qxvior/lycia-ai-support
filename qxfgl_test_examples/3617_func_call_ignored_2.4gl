MAIN
WHENEVER ANY ERROR STOP
        DISPLAY "Hello Main Start"
        CALL func_with_wrong_argument_type("This-Is-My-Name")
        DISPLAY "Hello Main END"
END MAIN

FUNCTION func_with_wrong_argument_type( i )
        DEFINE i SMALLINT
        DISPLAY "This is my SMALLINT value", i
END FUNCTION
