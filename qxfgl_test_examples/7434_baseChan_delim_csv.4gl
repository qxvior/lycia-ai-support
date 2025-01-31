MAIN
 DEFINE  chan_ob base.Channel
 DEFINE file_check TEXT
 DEFINE  cTxt RECORD f1,f2,f3,f4,f5 STRING END RECORD
	LOCATE file_check IN FILE "7434/out.txt"
	LET cTxt.f1 = "field1" 
	LET cTxt.f2 = "field2"
	LET cTxt.f3 = "field3"
	LET cTxt.f4 = "field4"
    LET chan_ob = base.Channel.create()
    CALL chan_ob.setDelimiter("CSV")
    
    CALL chan_ob.openFile("7434/out.txt","w")
    CALL chan_ob.write([cTxt.*])
    DISPLAY file_check
    CALL fgl_getkey()
    CALL chan_ob.openFile("7434/out.txt","r")
    WHILE chan_ob.read([cTxt.*])    
       DISPLAY "f1:",cTxt.f1
       DISPLAY "f2:",cTxt.f2
       DISPLAY "f3:",cTxt.f3
       DISPLAY "f4:",cTxt.f4
    END WHILE
    
END MAIN 