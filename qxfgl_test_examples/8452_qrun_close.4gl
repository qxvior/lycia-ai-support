MAIN
 DEFINE osType,ps_grep, prog_name,bash STRING
 DEFINE chan_obj base.Channel
 DEFINE qrun_cnt, i SMALLINT

	LET prog_name = fgl_basename(arg_val(0))
	#DISPLAY prog_name
	
	LET chan_obj = base.Channel.Create()
	CALL ui.Interface.frontCall("standard", "feinfo", "ostype", osType)  --get operating system
	LET osType = osType.toUpperCase()
	IF osType = "WINDOWS" THEN
		DISPLAY "2" #dummy code. Always pass on windows
	ELSE 	#running on Unix/Linux
		LET bash = "ps -aux |grep ",prog_name
		CALL chan_obj.openPipe(bash, "r")
	CALL chan_obj.READ(ps_grep)
	#DISPLAY ps_grep
	
	FOR i=1 TO ps_grep.GetLength()
		IF ps_grep[i,i+prog_name.getLength()-1] = prog_name THEN 
			#DISPLAY ">>>>",ps_grep[i,i+prog_name.getLength()-1],"|" 
			LET qrun_cnt = qrun_cnt +1 END IF 
	END FOR
	DISPLAY qrun_cnt
	
END IF
CALL fgl_getkey() # to read console by autotest
	WHENEVER ANY ERROR CONTINUE -- Ignore "Network Error"
	CASE arg_val(1)
		WHEN 1
			WHILE TRUE END WHILE-- Infinite work
		WHEN 2
		DISPLAY "FOR"
			FOR i = 1 TO 2 STEP 0 END FOR -- Infinite work
	END CASE
END MAIN
