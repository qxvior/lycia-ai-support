################################################################################
# MODULE SCROPE VARIABLES
################################################################################
--DEFINE modu_document TEXT #text file variable

################################################################################
# MAIN
#
# Demo App to show search by expression -> regex.search method
################################################################################
MAIN
	DEFINE l_document TEXT
	DEFINE l_search_str STRING	#SEARCH STRING

	OPTIONS INPUT WRAP
	OPTIONS ON CLOSE APPLICATION CALL handle_dirty_exit
	OPTIONS ACCEPT KEY "RETURN"

	DEFER INTERRUPT
	
	CALL ui_init()
	CALL init_data() RETURNING l_document					#init data for demo purpose
	CALL hideNavigation()

	OPEN WINDOW cm_util_regex_search WITH FORM "form/cm_util_regex_search"

	INPUT l_search_str,l_document WITHOUT DEFAULTS 
	FROM inpString,document ATTRIBUTE(UNBUFFERED)
		BEFORE INPUT
			CALL process_search_string(l_search_str,l_document)			 
		ON ACTION "ACCEPT"
			CALL process_search_string(l_search_str,l_document)
	END INPUT
			
END MAIN
################################################################################
# END MAIN
################################################################################


################################################################################
# FUNCTION process_search_string(p_search,p_p_document_text_str)
#
# Search string/expression in document
################################################################################
FUNCTION process_search_string(p_search,p_document_text)
	DEFINE p_search STRING
	DEFINE p_document_text TEXT				#text in which we search for the expression
	DEFINE l_tmp_str STRING
	DEFINE l_regex util.REGEX #util.REGEX - to hold the regular expression:
	DEFINE l_match_results util.MATCH_RESULTS
	DEFINE l_loop_count SMALLINT
	DEFINE l_output STRING
	DEFINE l_msg STRING

	IF p_search IS NULL THEN
		LET l_output = NULL
		LET l_loop_count = 0
		DISPLAY NULL TO matched		
	ELSE

		LET l_tmp_str = p_document_text

		WHENEVER ERROR CONTINUE	
			LET l_regex = p_search
		WHENEVER ERROR STOP

		IF NOT l_regex.IsValid() THEN
			LET l_msg = p_search, "\n", qx_last_exception.err_text
			CALL fgl_winmessage("Invalid regex pattern detected",qx_last_exception.err_text,"error")
			#CALL clear_screen()
		  RETURN
		END IF

		LET l_loop_count = 0
	
		LET l_output = 
			"====================================================\n",
			"Search String=", trim(l_regex), "\n",
			"====================================================\n",
			"<BEGIN OF Original Source text>", "\n",
			trim(l_tmp_str),"\n",
			"<END OF Original Source text>", "\n",
			"====================================================\n"
		
		WHILE TRUE
			CALL util.REGEX.search(l_tmp_str, l_regex) RETURNING l_match_results
				
			IF l_match_results.matched(0) THEN
				LET l_loop_count = l_loop_count + 1
				LET l_output = append_display(l_output,l_loop_count,l_match_results) 
		
		
				LET l_tmp_str =	l_match_results.suffix()
			ELSE
				EXIT WHILE
			END IF
			
	
		END WHILE
		IF l_loop_count == 0 THEN
			DISPLAY l_loop_count TO matched ATTRIBUTE(RED)
		ELSE
			DISPLAY l_loop_count TO matched ATTRIBUTE(GREEN)
		END IF
		
		LET l_output = l_output, "\n", 
			"####################################################"
	
	END IF
	
	DISPLAY l_output TO regex_result		
		
	RETURN l_match_results
END FUNCTION
################################################################################
# END FUNCTION process_search_string(p_search,p_p_document_text_str)
################################################################################


################################################################################
# FUNCTION append_display(p_str,p_line,p_match_results)
#
# Form display string for output (expression result)
################################################################################
FUNCTION append_display(p_str,p_line,p_match_results)
	DEFINE p_str STRING
	DEFINE p_line SMALLINT
	DEFINE p_msg STRING
	DEFINE p_match_results util.MATCH_RESULTS	
	DEFINE l_ret_str STRING

			LET l_ret_str =  
			trim(p_str), "\n",
			"### <BEGIN ", trim(p_line), "> #####################################################################" , "\n",
			"************************" , "\n",
			"Search Result (LoopCount)", trim(p_line), "\n",
			"************************", "\n",	
			"l_match_results.prefix()", "\n",
			p_match_results.prefix(), "\n",
			"------------------------", "\n",	
			"l_match_results.suffix()", "\n",
			p_match_results.suffix(), "\n",
			"************************", "\n",
			"### <END ", trim(p_line), "> #######################################################################" , "\n"

	RETURN l_ret_str
END FUNCTION
################################################################################
# END FUNCTION append_display(p_str,p_line,p_match_results)
################################################################################


################################################################################
# FUNCTION init_data()
#
# Initialize variables
################################################################################
FUNCTION init_data()
	DEFINE l_doc_str STRING
	DEFINE l_document TEXT   #file/document contents

	LOCATE l_document IN FILE "txt/letter.txt"

{		
	LET l_doc_str =
"
#This is an example letter downloaded from https://www.thebalancecareers.com
Mike Harrison
8 Sue Circle 
Smithtown, CA 09284 
505-666-6666 
mike.harrison@emailexample.com


September 1, 2019

George Gilhooley 
Times Union
87 Delaware Road 
Hatfield, CA 08065

Dear Mr. Gilhooley,

I am writing to apply for the programmer position advertised in the Times Union. As requested, I enclose a completed job application, my certification, my resume and three references.

The role is very appealing to me, and I believe that my strong technical experience and education make me a highly competitive candidate for this position. My key strengths that would support my success in this position include:

I have successfully designed, developed and supported live-use applications.
I strive continually for excellence.
I provide exceptional contributions to customer service for all customers.
With a BS degree in Computer Programming, I have a comprehensive understanding of the full lifecycle for software development projects. I also have experience in learning and applying new technologies as appropriate. Please see my resume for additional information on my experience.

I can be reached anytime via email at john.donaldson@emailexample.com, by calling 800-333-333 and asking for Mike Harrison or by cell phone, 909-555-5555.

My responsibilities have included the development and management of: website editorial voice and style; editorial calendars; and the daily content programming and production for various websites.

I have worked closely with healthcare professionals and medical editors to help them to provide the best possible information to a consumer audience of patients. I have also helped physicians to use their medical content to write user-friendly and easily comprehensible text.

Experience has taught me how to build strong relationships with all departments in an organization. I have the ability to work within a team as well as cross-team. I can work with web engineers to resolve technical issues and implement technical enhancements. 

I am Mike Harrison and I'm confident working with development departments to implement design and functional enhancements, and to monitor site statistics and conduct search engine optimization.

Thank you for your time and consideration. I look forward to speaking with you about this employment opportunity.

Sincerely,

Mike Harrison

PS:I'm simply the best candiate for any job
"
}
	RETURN l_document
END FUNCTION
################################################################################
# END FUNCTION init_data()
################################################################################