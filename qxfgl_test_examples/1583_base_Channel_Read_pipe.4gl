{
Steps to reproduce:
	1 Run app

Actual result:
	Application crashes without any messages in log

Expected result:
	Displayed at console
	Win7-x64 - OK
	Pass
}

MAIN
	DEFINE chan_obj base.CHANNEL
	DEFINE logRec RECORD 
		client_host_name CHAR(64)
	END RECORD
	DEFINE input_pipe CHAR(20)
  
	LET chan_obj = base.Channel.Create()
	LET input_pipe = "hostname" 
	CALL chan_obj.openPipe(input_pipe , "r")
	CALL chan_obj.READ(logRec.client_host_name)  #crash here
	DISPLAY logRec.client_host_name Clipped," - OK"
	CALL chan_obj.openFile("stream","w")
	CALL chan_obj.write(logRec.client_host_name)
	CALL chan_obj.CLOSE()
	IF os.Path.isfile("stream") AND os.Path.size("stream")<> 0 THEN
		DISPLAY "Pass"
	ELSE
		DISPLAY "Fail"
	END IF
END MAIN