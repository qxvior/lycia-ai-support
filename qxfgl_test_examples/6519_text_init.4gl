MAIN
   DEFINE v_text TEXT
   LOCATE v_text IN FILE "file_text"
   OPEN FORM f FROM "6519/6519_text_init.fm2"
   LET v_text= "old value"
   DISPLAY FORM f
   INPUT BY NAME v_text WITHOUT DEFAULTS ATTRIBUTES(UNBUFFERED)
     ON ACTION change_text
       LET v_text= "new value"
   END INPUT
END MAIN
