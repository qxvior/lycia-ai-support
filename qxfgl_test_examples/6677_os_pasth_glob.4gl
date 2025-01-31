MAIN
    DEFINE files DYNAMIC ARRAY OF STRING
    DEFINE x INTEGER
    LET files = os.Path.glob("object_cache/*/*/*/6677*.ebc.lock")
    FOR x=1 TO files.getLength()
         DISPLAY "File: ", files[x]
    END FOR

END MAIN