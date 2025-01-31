MAIN
    DEFINE tmpdir STRING
    CALL fgl_putenv("TMPDIR=/tmp")
    CALL fgl_setenv("TEMP","/tmp")
    CALL fgl_setenv("TMP","/tmp")
    LET tmpdir = os.Path.makeTempName()
   	IF tmpdir MATCHES "*tmp*" THEN DISPLAY "PASS" ELSE DISPLAY "FAIL" END IF     
END MAIN