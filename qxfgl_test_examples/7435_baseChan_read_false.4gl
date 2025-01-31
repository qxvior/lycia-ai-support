MAIN
 DEFINE  chan_ob base.Channel
 DEFINE  cTxt RECORD f1,f2,f3,f4,f5 STRING END RECORD
 
    LET chan_ob = base.Channel.create()
    CALL chan_ob.openFile("7435/out.txt","r")
    WHILE chan_ob.read([cTxt.*])    
       DISPLAY cTxt.f1,"|",cTxt.f2,"|",cTxt.f3,"|",cTxt.f4
    END WHILE
    
END MAIN 