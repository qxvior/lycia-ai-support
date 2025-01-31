MAIN
	DEFINE mainString, arg1, arg2 STRING
	
	
	LET arg1 = arg_val(1)
	LET arg2 = arg_val(2)
	
	LET mainString = "This is the dummy demo child app\nProgram Name: demo_dummy_child_app\nArgument"
	LET mainString = mainString, "\nArgument 1= ", trim(arg1), " Argument 2 = ", trim(arg2)
	LET mainString = mainString, trim("\nProgram is going to close on OK")
	
	CALL fgl_winmessage("This is a dummy demo child app",mainString,"info")
	
	

END MAIN