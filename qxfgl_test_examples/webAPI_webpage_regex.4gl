##########################################################################
# New_features_in_Querix_4gl Project                                     #
# Property of Querix Ltd.                                                #
# Copyright (C) 2016  Querix Ltd. All rights reserved.                   #
# This program is free software: you can redistribute it.                #
# You may modify this program only using Lycia.                          #
#                                                                        #
# This program is distributed in the hope that it will be useful,        #
# but without any warranty; without even the implied warranty of         #
# merchantability or fitness for a particular purpose.                   #
#                                                                        #
# Email: info@querix.com                                                 #
##########################################################################

##########################################################################
# MAIN
#
#
##########################################################################
MAIN
 DEFINE l_URI STRING
 DEFINE regex util.REGEX
 DEFINE l_custRegPattern STRING
 DEFINE l_msg STRING			#string for messages

 OPEN WINDOW W WITH FORM "form/webAPI_webpage_regex"

	CALL fgl_setkeylabel("ACCEPT","")	
	CALL fgl_setkeylabel("CANCEL","")
	CALL fgl_setkeylabel("srchPhone","Phone","{CONTEXT}/public/querix/icon/svg/24/ic_phone_24px.svg",11,TRUE,"Search phone number","top")
	CALL fgl_setkeylabel("srchEmail","E-mail","{CONTEXT}/public/querix/icon/svg/24/ic_email_24px.svg",12,TRUE,"Search email","top")
	CALL fgl_setkeylabel("yourPattern","Custom","{CONTEXT}/public/querix/icon/svg/24/ic_manual_operation_hand_24px.svg",13,TRUE,"Custom REGEX","top")


 --Combobox populating
# CALL fgl_list_insert("p_URI",1,"http://www.qmul.ac.uk/contact/")
# CALL fgl_list_insert("p_URI",2,"http://www.gla.ac.uk/about/contact/")
# CALL fgl_list_insert("p_URI",3,"https://www.brunel.ac.uk/about/contact-us")
# CALL fgl_list_insert("p_URI",4,"http://www.sunderland.ac.uk/")
# CALL fgl_list_insert("p_URI",5,"https://www.nottingham.ac.uk/contacting/")
 
	LET l_URI = "https://querix.com/get-in-touch"
	INPUT l_URI,l_custRegPattern WITHOUT DEFAULTS FROM URI, custReg ATTRIBUTE(UNBUFFERED)

		AFTER FIELD custReg 
			NEXT FIELD URI
	
		ON ACTION "showUri"
			CALL fgl_dialog_update_data()
			DISPLAY l_URI TO browser

		ON ACTION "srchPhone"
			IF regex.setPattern("\\(?\\+[0-9]{1,3}\\)? ?-?[0-9]{1,3} ?-?[0-9]{3,5} ?-?[0-9]{4}( ?-?[0-9]{3})?") = 0 THEN
				ERROR "Invalid Pattern"
				DISPLAY "Invalid Pattern" TO fullSearchRes
			ELSE
				DISPLAY GetHTML(l_URI,regex,"Phone numbers:\n") TO fullSearchRes
			END IF

		ON ACTION "srchEmail"
			IF regex.setPattern("\\w+@\\w+.\\w+") = 0 THEN
				ERROR "Invalid Pattern"
				DISPLAY "Invalid Pattern" TO fullSearchRes
			ELSE
				DISPLAY GetHTML(l_URI,regex,"E-mails:\n") TO fullSearchRes
			END IF

		ON ACTION "yourPattern"
			IF l_custRegPattern.getLength()=0 THEN
				LET l_msg = "Custom REGEX Pattern Expression is empty!"  
				CALL fgl_winmessage("Custom REGEX", l_msg, "exclamation") 
				ERROR l_msg
				DISPLAY l_msg TO fullSearchRes			
				NEXT FIELD custReg 
			ELSE 
				IF regex.setPattern(l_custRegPattern) = 0 THEN
					ERROR "Invalid Pattern"
					DISPLAY "Invalid Pattern" TO fullSearchRes
					NEXT FIELD custReg
				ELSE
					DISPLAY GetHTML(l_URI,regex,"Custom REGEX result:\n") TO fullSearchRes
				END IF
			END IF

		ON ACTION HELP
	 		CALL onlineHelp(NULL,"util_regex")	
	 				
		ON ACTION "Exit"
			EXIT INPUT
	END INPUT 
 
END MAIN 
##########################################################################
# END MAIN
##########################################################################


##########################################################################
# FUNCTION GetHTML(p_URI,p_regex,p_resTitle)
#
#
##########################################################################
FUNCTION GetHTML(p_URI,p_regex,p_resTitle)
	DEFINE p_URI STRING					#web page URL
	DEFINE p_resTitle STRING		#title ?
	DEFINE p_regex util.regex
	
	DEFINE rq web.Request				#request object
	DEFINE rs web.Response			#Returned object
	DEFINE ses web.Session
	DEFINE l_full_page STRING			#String to store returned (response) web page body text 
	DEFINE l_resSearch DYNAMIC ARRAY OF STRING
	DEFINE l_ret_fullSearchRes STRING
	DEFINE i,j INT

	DEFINE match util.MATCH_RESULTS	#Returned object from match operation
	
	DEFINE cntRes INTEGER
  
	CALL rq.SetURL(p_URI)								#Set the URL for the website
	CALL rq.setMethod("POST")						#Set the method POST= ask the page and in request get the page/contents/body
	CALL ses.perform(rq) RETURNING rs		#Fire off the web session with our defined request object (rq) to retrieve body text of website page and store it in rs web.Response

	LET l_full_page = rs.getBody()

	LET l_ret_fullSearchRes = p_resTitle
	LET cntRes=0
	WHILE TRUE 
		CALL util.regex.search(l_full_page,p_regex) RETURNING match
		IF (match) THEN
			LET cntRes=cntRes+1
			LET l_resSearch[cntRes] = match.str( 0 )
			LET l_full_page =  match.suffix()
		ELSE EXIT WHILE END IF
	END WHILE

    IF l_resSearch.GetLength() = 0 THEN
		LET l_ret_fullSearchRes = l_ret_fullSearchRes CLIPPED,"NOT FOUND." CLIPPED,"\n" 
	ELSE    
	    FOR i=1 TO l_resSearch.GetLength()
	    	FOR j=1 TO l_resSearch.GetLength()
	    		IF l_resSearch[i] = l_resSearch[j] AND j<>i THEN
	 				CALL l_resSearch.delete(j)
	 			END IF
	    	END FOR
			LET l_ret_fullSearchRes = l_ret_fullSearchRes CLIPPED,l_resSearch[i] CLIPPED,"\n"
		END FOR
	END IF	
	RETURN l_ret_fullSearchRes
END FUNCTION
##########################################################################
# END FUNCTION GetHTML(p_URI,p_regex,p_resTitle)
##########################################################################