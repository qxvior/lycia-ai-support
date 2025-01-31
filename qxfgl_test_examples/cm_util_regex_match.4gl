################################################################################
# MAIN
#
# Demo App to show some regex expressions
################################################################################
MAIN
	DEFINE l_inpString STRING
	DEFINE l_inpString_Expression STRING
	DEFINE l_inpString_Flag STRING
	DEFINE match util.MATCH_RESULTS #util.MATCH_RESULTS - to hold the search results:

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS ACCEPT KEY "RETURN"

	DEFER INTERRUPT

	OPEN WINDOW cm_util_regex_match WITH FORM "form/cm_util_regex_match"
	
	CALL ui_init()
	CALL initData()							#init master array with data  (also creates an array duplicate/casting just for demo purpose)
	CALL hideNavigation()
		
	
	INPUT l_inpString, l_inpString_Expression,l_inpString_Flag WITHOUT DEFAULTS 
	FROM inpString,inpExpression,inpFlag ATTRIBUTE(UNBUFFERED)
		BEFORE INPUT
			CALL process_match_string(l_inpString,l_inpString_Expression,l_inpString_Flag)
		AFTER FIELD l_inpString
			CALL process_match_string(l_inpString,l_inpString_Expression,l_inpString_Flag)

		ON CHANGE l_inpString
			CALL process_match_string(l_inpString,l_inpString_Expression,l_inpString_Flag)

	ON ACTION ACCEPT
		CALL process_match_string(l_inpString,l_inpString_Expression,l_inpString_Flag)

	ON ACTION HELP
 		CALL onlineHelp(NULL,"util_regex")		
 		
	END INPUT

END MAIN
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION get_display_string(p_msg)
#
# Form display string for output (expression result)
################################################################################
FUNCTION get_display_string(p_msg)
	DEFINE p_msg STRING
	
	LET p_msg = p_msg, " = ", "TRUE"
	RETURN p_msg
END FUNCTION
################################################################################
# FUNCTION get_display_string(p_msg)
################################################################################

################################################################################
# FUNCTION append_display(p_str,p_line,p_msg)
#
# Append argument strings to log data string
################################################################################
FUNCTION append_display(p_str,p_line,p_msg)
	DEFINE p_str STRING
	DEFINE p_line SMALLINT
	DEFINE p_msg STRING
	DEFINE l_ret_str STRING
	
	LET l_ret_str = p_str, trim(p_line)," - ", get_display_string(p_msg) , "\n"

	RETURN l_ret_str
END FUNCTION
################################################################################
# END FUNCTION append_display(p_str,p_line,p_msg)
################################################################################


################################################################################
# FUNCTION process_match_string(p_str)
#
# Apply Different Sample Expressions to string argument p_str
# and display the result to the textArea
################################################################################
FUNCTION process_match_string(p_str,p_str_expression,p_str_flag)
	DEFINE p_str STRING
	DEFINE p_str_expression STRING
	DEFINE p_str_flag STRING
	DEFINE l_regex_pattern util.REGEX #util.REGEX - to hold the regular expression:

	--DEFINE l_regex_pattern STRING
	DEFINE l_msg STRING
	DEFINE l_output STRING
	DEFINE l_line SMALLINT
	CALL clear_screen()
	
	WHENEVER ERROR CONTINUE	
		CALL l_regex_pattern.SetPattern(p_str_expression)
		CALL l_regex_pattern.SetFlags(p_str_flag)
	WHENEVER ERROR STOP
	
	IF NOT l_regex_pattern.IsValid() THEN
		LET l_msg = p_str, "\n", p_str_expression, "\n", qx_last_exception.err_text
		CALL fgl_winmessage("Invalid regex pattern detected",qx_last_exception.err_text,"error")
		CALL clear_screen()
	  RETURN
	END IF

	#Dynamic regex Expression
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_00
		DISPLAY "qx://embedded/ok.ico" TO lb_status_002
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_00	
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_002
	END IF

	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_00 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_00
	#End of dynamic regex Expression

	LET l_line = 0
	#------------------------	
	LET l_line = l_line+1 #01
	CALL l_regex_pattern.setPattern("")
	CALL l_regex_pattern.setFlags("")
		
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_01 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_01
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,//) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_01
		LET l_output = append_display(l_output,l_line,l_msg)
		--LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_01	
	END IF

	#------------------------	
	LET l_line = l_line+1 #02
	CALL l_regex_pattern.setPattern("w+@w+")		#email address without domain "word@word"
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_02 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_02
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_02

		LET l_output = l_output, trim(l_line)," - ",  get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_02	
	END IF

	#------------------------	
	LET l_line = l_line+1 #03
	CALL l_regex_pattern.setPattern("\w+\.\w+")		#2 words separated by a dot "word.word"
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_03 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_03
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
			DISPLAY "qx://embedded/ok.ico" TO lb_status_03
	
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ",  get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_03	
	END IF
	
	#------------------------	
	LET l_line = l_line+1 #04
	CALL l_regex_pattern.setPattern("\w+@\w+\.com")	#email with .com  "h.hoelzl@querix.com"
	CALL l_regex_pattern.setFlags("")

	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_04 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_04
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_04
	
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_04	
	END IF

	#------------------------	
	LET l_line = l_line+1 #05
	CALL l_regex_pattern.setPattern("\w+@\w+\.\w+")
	CALL l_regex_pattern.setFlags("")
				
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_05 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_05
			
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_05
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_05	
	END IF
	
	#------------------------	
	LET l_line = l_line+1 #06

	CALL l_regex_pattern.setPattern("w+@w+\.[A-Za-z]{2,3}")		#email address with 2 or 3 character domain
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_06 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_06
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_06
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_06	
	END IF

	#------------------------	
	LET l_line = l_line+1 #07
	CALL l_regex_pattern.setPattern("\w+@\w+\.[A-Za-z]{2,10}")		#email address with 2 to 10 character domain
	CALL l_regex_pattern.setFlags("")

	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern

	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_07 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_07
		 
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_07
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_07	
	END IF

	#------------------------	
	LET l_line = l_line+1 #08

	CALL l_regex_pattern.setPattern("test")
	CALL l_regex_pattern.SetFlags("i")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_08 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_08
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 	
			
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_08
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_08	
	END IF

	#------------------------	
	LET l_line = l_line+1 #09
	
	CALL l_regex_pattern.setPattern("\w") #any single word character
	CALL l_regex_pattern.setFlags("")

	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_09 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_09
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 			
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_09
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_09	
	END IF

	#------------------------	
	LET l_line = l_line+1 #10
	
	CALL l_regex_pattern.setPattern("\w+")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_10 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_10
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 	
	IF util.regex.match(p_str,/w+/) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_10
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_10	
	END IF

	#------------------------	
	LET l_line = l_line+1 #11
	
	CALL l_regex_pattern.setPattern("\\w+")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_11 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_11	
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 	
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_11
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_11	
	END IF
	
	#------------------------	
	LET l_line = l_line+1 #12
	
	CALL l_regex_pattern.setPattern("x")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_12 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_12
	
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 			
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_12
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_12	
	END IF			

	#------------------------	
	LET l_line = l_line+1 #13
	
	CALL l_regex_pattern.setPattern("\-")	#MINUS "-" character
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_13 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_13

		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 	
	IF util.regex.match(p_str,/\\/) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_13
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_13	
	END IF		

	#------------------------	
	LET l_line = l_line+1 #14
	
	CALL l_regex_pattern.setPattern("nnn")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_14 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_14

		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_14
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_14	
	END IF	
	
	#------------------------	
	LET l_line = l_line+1 #15
	
	CALL l_regex_pattern.setPattern("^[0-9]*[.][0-9]*$")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_15 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_15

		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 
	IF util.regex.match(p_str,/uhhh/) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_15
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_15	
	END IF	

	#------------------------	
	LET l_line = l_line+1 #16
	
	CALL l_regex_pattern.setPattern("[A-Za-z]*")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_16 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_16
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_16
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_16	
	END IF	

	#------------------------	
	LET l_line = l_line+1 #17
	
	CALL l_regex_pattern.setPattern("[aeiou]*") #Only 'Umlaute'
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_17 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_17
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_17
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_17	
	END IF										

	#------------------------	
	LET l_line = l_line+1 #18
	
	CALL l_regex_pattern.setPattern("[0-9]") #all numbers
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_18 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_18
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern
	 
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_18
		LET l_output = append_display(l_output,l_line,l_msg)
		--		LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_18	
	END IF	

	#------------------------	
	LET l_line = l_line+1 #19	

	CALL l_regex_pattern.setPattern("^[0-9]*")
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_19 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_19
		
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_19
		LET l_output = append_display(l_output,l_line,l_msg)
		--			LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_19	
	END IF			
	
	#------------------------	
	LET l_line = l_line+1 #20
	
	CALL l_regex_pattern.setPattern("^[0-9]*.[0-9]*$") #Only Decimals
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_20 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_20
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_20
		LET l_output = append_display(l_output,l_line,l_msg)
		--			LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_20	
	END IF			

	#------------------------	
	LET l_line = l_line+1 #21
	
	CALL l_regex_pattern.setPattern("^[0-9]*,[0-9]*$") #Only German "," Decimals
	CALL l_regex_pattern.setFlags("")
	
	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_21 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_21

	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_21
		LET l_output = append_display(l_output,l_line,l_msg)
		--			LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_21	
	END IF	
	
	#------------------------	
	LET l_line = l_line+1 #22	
	
	CALL l_regex_pattern.setPattern("^[0-9]*$")	#Only Integers
	CALL l_regex_pattern.setFlags("")

	DISPLAY l_regex_pattern.getPattern() TO lb_regexp_22 	
	DISPLAY l_regex_pattern.getflags() TO lb_mod_flag_22
	
	LET l_msg = "->",p_str,"<-", " RegEx:", l_regex_pattern 
	
	IF util.regex.match(p_str,l_regex_pattern) THEN
		DISPLAY "qx://embedded/ok.ico" TO lb_status_22
		LET l_output = append_display(l_output,l_line,l_msg)
		--			LET l_output = l_output, trim(l_line)," - ", get_display_string(l_msg) , "\n"
	ELSE
		DISPLAY "qx://embedded/cancel.ico" TO lb_status_22	
	END IF		
	
	DISPLAY l_output TO regex_result		
END FUNCTION
################################################################################
# END FUNCTION process_match_string(p_str)
################################################################################


################################################################################
# FUNCTION initData()
#
#
################################################################################
FUNCTION initData()
	#No test data required for this demo
END FUNCTION
################################################################################
# END FUNCTION initData()
################################################################################

FUNCTION clear_screen()
	DISPLAY NULL TO regex_result	#clear output textArea

	DISPLAY "qx://embedded/cancel.ico" TO lb_status_00
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_01	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_02	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_03	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_04	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_05	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_06	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_07	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_08	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_09	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_10	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_11	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_12	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_13	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_14	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_15	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_16	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_17	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_18	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_19	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_20	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_21	
	DISPLAY "qx://embedded/cancel.ico" TO lb_status_22	

END FUNCTION