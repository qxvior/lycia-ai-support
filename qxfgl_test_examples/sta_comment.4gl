MAIN

#  This is a comment for ALL 4gl compilers
-- This is a comment for ALL 4gl compilers 
{This is a comment for ALL 4gl compilers}

--# DISPLAY "xxx" #This is a comment for I4gl (not for Lycia)
--* DISPLAY "xxx" #This is a comment for I4gl (not for Lycia)

--{
DISPLAY "Hello dash dash curly braces --{"
--}

--#{
DISPLAY "Hello dash dash curly braces --#"
--#}

--*{
DISPLAY "Hello dash dash curly braces --*"
--*}

--# DISPLAY "Hello --#"
--@ DISPLAY "Hello --@" #none-Hydra comment
#   DISPLAY "Hello #"
--  DISPLAY "Hello --"
{
DISPLAY "Hello curly braces"
}





	MENU
		ON ACTION "CANCEL"
			EXIT MENU
	END MENU
	
END MAIN