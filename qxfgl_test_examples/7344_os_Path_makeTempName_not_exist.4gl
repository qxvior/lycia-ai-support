MAIN
    DEFINE tmpdir STRING
    CALL fgl_putenv("TMPDIR=/lol")
    CALL fgl_setenv("TEMP","/lol")
    CALL fgl_setenv("TMP","/lol")
    LET tmpdir = os.Path.makeTempName()
   	IF tmpdir MATCHES "*tmp*" THEN DISPLAY "PASS" ELSE DISPLAY "FAIL" END IF     
END MAIN