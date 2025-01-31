MAIN
 DEFINE  chan_ob base.Channel
 DEFINE  cTxt STRING
 DEFINE i INT

    LET chan_ob = base.Channel.create()
    CALL chan_ob.setDelimiter("")
    CALL chan_ob.openFile("out.txt","w")
    CALL chan_ob.write("aaa\\\nbbb") --<BS><LF>
    CALL chan_ob.write("ccc\nddd")   --<LF>
    CALL chan_ob.openFile("out.txt","r")
    LET i=1
    WHILE chan_ob.read([cTxt])    
       DISPLAY i
       DISPLAY cTxt
       LET i=i+1
    END WHILE
END MAIN 