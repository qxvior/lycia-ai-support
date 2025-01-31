DEFINE order,i SMALLINT
DEFINE c_poziad DATETIME YEAR to SECOND
MAIN
CALL fgl_getkey()
    FOR order=1 TO 100
        DISPLAY "Now is planning batch:",order
        FOR i = 1 TO 20000
            let c_poziad = current
        END FOR
    END FOR
CALL fgl_getkey()
END MAIN