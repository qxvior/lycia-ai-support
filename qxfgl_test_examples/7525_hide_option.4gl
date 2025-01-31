MAIN
	--open window w at 1,1 with 25 rows, 80 columns
WHILE TRUE
	MENU "m"
		COMMAND "Hello" "This is Hello"
		COMMAND "reset"
			EXIT MENU
		COMMAND "Exit" "Exit program"
			EXIT PROGRAM
		COMMAND "hide_lower" 
			HIDE OPTION "hello"
		COMMAND "hide_upper" 
			HIDE OPTION "HELLO"
		COMMAND "hide_exact"
			HIDE OPTION "Hello"
	END MENU
END WHILE	
END MAIN